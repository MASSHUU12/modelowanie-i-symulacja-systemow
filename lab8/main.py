import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from model import spring_mass

# Simulation parameters
t_span = (0.0, 20.0)               # simulate from t=0 to t=20 s
y0     = [1.0, 0.0]                # initial state: x=1 m, v=0
t_eval = np.linspace(*t_span, 500) # sample 500 time points

# Integrate the ODE system
sol = solve_ivp(
    fun=lambda t, y: spring_mass(t, y, m=1.0, k=2.0),
    t_span=t_span,
    y0=y0,
    t_eval=t_eval,
    method='RK45',
)

# Static plots (x(t) and v(t))
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(6, 4), sharex=True)
ax1.plot(sol.t, sol.y[0], lw=1.5)
ax1.set_ylabel('Displacement $x(t)$ [m]')
ax1.grid(True)

ax2.plot(sol.t, sol.y[1], lw=1.5)
ax2.set_ylabel('Velocity $v(t)$ [m/s]')
ax2.set_xlabel('Time $t$ [s]')
ax2.grid(True)

plt.tight_layout()
plt.savefig("plots.png")
plt.show()

# Animation
fig, ax = plt.subplots(figsize=(5,5))
line, = ax.plot([], [], lw=2)
ax.set_xlim(-1.5, 1.5)
ax.set_ylim(-1.5, 1.5)
ax.set_aspect('equal')
ax.set_title('Mass–Spring Animation')

def init():
    line.set_data([], [])
    return (line,)

def update(frame):
    x = sol.y[0, frame]
    # mass at (x, 0), spring from (0,0) to (x,0)
    line.set_data([0, x], [0, 0])
    return (line,)

ani = FuncAnimation(
    fig, update, frames=sol.t.size,
    init_func=init, blit=True, interval=20
)

plt.show()
ani.save('spring.gif', writer='imagemagick')
