"""
Mass–Spring Oscillator Model

Single (2nd-order) equation:
    m * d²x/dt² + k * x = 0

Equivalent 1st-order system:
    dx/dt = v
    dv/dt = - (k/m) * x
"""

import numpy as np

def spring_mass(t, y, m=1.0, k=1.0):
    """
    Compute derivatives for the mass–spring system.

    Parameters
    ----------
    t : float
        Current time (unused; system is autonomous).
    y : array_like, shape (2,)
        State vector [x, v], where
          x = displacement,
          v = velocity.
    m : float
        Mass (kg).
    k : float
        Spring constant (N/m).

    Returns
    -------
    dydt : ndarray, shape (2,)
        Time derivatives [dx/dt, dv/dt].
    """
    x, v = y
    dxdt = v
    dvdt = - (k / m) * x
    return np.array([dxdt, dvdt])
