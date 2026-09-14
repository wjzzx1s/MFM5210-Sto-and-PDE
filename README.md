# MFM5210 Stochastics and Partial Differential Equations

Lecture notes for **MFM5210 — Stochastics and Partial Differential Equations**
(CUHK-Shenzhen), transcribed into LaTeX and compiled with `pdflatex`.

## Contents

| File | Description |
|------|-------------|
| `Lecture-01.tex` | Lecture 1 — Preliminaries (probability space, random variables, measurability & Borel σ-algebra, stochastic processes & filtrations, Brownian motion) |
| `Lecture-02.tex` | Lecture 2 — Properties of Brownian motion and introduction to Itô calculus|
| `HW\*`| Homeworks and their latex templates|

## Building

Requires a TeX Live installation with `pdflatex`.

```sh
pdflatex -interaction=nonstopmode -halt-on-error Lecture-01.tex
pdflatex -interaction=nonstopmode -halt-on-error Lecture-01.tex   # run twice for cross-refs
```

## Notes

- Topics are transcribed from the handwritten notes using AI tools, accuracy check is needed.

## License

Course materials for personal study. See the course for usage rights.
