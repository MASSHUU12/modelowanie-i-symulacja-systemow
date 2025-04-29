# Symulacja Oscylatora Masa–Sprężyna

Maciej Gawrysiak

---

## 1. Wstęp

W niniejszym raporcie przedstawiono prosty model dynamiczny liniowego układu
masa–sprężyna oraz jego symulację numeryczną.
Zawarto tu równanie ruchu, przejście do układu równań pierwszego rzędu oraz
uwagi dotyczące energii.
Załączony kod Python integruje równania ruchu i generuje zarówno statyczne
wykresy czasowe, jak i animację masy przymocowanej do sprężyny.

## 2. Wyprowadzenie równania ruchu

Rozważmy masę $m$ zawieszoną na idealnej sprężynie o stałej sprężystości $k$,
poruszającą się bez tarcia wzdłuż jednej osi.
Z drugiej zasady dynamiki Newtona i prawa Hooke’a mamy:

$$
m \,\ddot{x} + k\,x = 0,
$$

gdzie
- $x(t)$ to przemieszczenie względem położenia równowagi,
- $\ddot{x} = \dfrac{\mathrm{d}^2 x}{\mathrm{d}t^2}$ to przyspieszenie.

Przekształcając, otrzymujemy postać standardową:

$$
\ddot{x} + \frac{k}{m}\,x = 0.
$$

## 3. Układ równań pierwszego rzędu

Aby zintegrować równanie numerycznie, zamieniamy je na układ dwóch równań pierwszego rzędu. Definiujemy wektor stanu

$$
y = \begin{bmatrix} x \\
v \end{bmatrix},
\quad
v = \dot{x}.
$$

Wówczas otrzymujemy:

$$
\frac{\mathrm{d}}{\mathrm{d}t}
\begin{bmatrix} x \\
v \end{bmatrix}=
\begin{bmatrix} 
0 & 1 \\ 
-\tfrac{k}{m} & 0 
\end{bmatrix}
\begin{bmatrix} x \\
v \end{bmatrix}.
$$

## 4. Uwagi o energii

Całkowita energia mechaniczna

$$
E = T + U = \frac{1}{2}mv^2 + \frac{1}{2}kx^2
$$

w układzie bez tłumienia powinna być zachowana. Różniczkując:

$$
\frac{dE}{dt} = mv\dot{v} + kx\dot{x} = v(m\ddot{x} + kx) = 0,
$$

co potwierdza, że dla dokładnego całkowania numerycznego amplituda oscylacji
pozostaje stała.

## 5. Wyniki i wnioski

Skrypt Python generuje:
1. **Statyczne wykresy** $x(t)$ i $v(t)$ w całym przedziale symulacji,

![Wykresy](https://raw.githubusercontent.com/MASSHUU12/modelowanie-i-symulacja-systemow/refs/heads/master/lab8/plots.png)

2. **Animację** prezentującą masę poruszającą się wzdłuż osi $x$, połączoną linią
ze źródłem - obrazując sprężynę.

![Animacja](https://raw.githubusercontent.com/MASSHUU12/modelowanie-i-symulacja-systemow/refs/heads/master/lab8/spring.gif)

Obie wizualizacje potwierdzają, że rozwiązanie jest ruchome hermoniczne z
częstotliwością kątową

$$
\omega = \sqrt{\frac{k}{m}}.
$$
