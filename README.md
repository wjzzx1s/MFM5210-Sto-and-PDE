# MFM5210 Stochastics and Partial Differential Equations

Lecture notes for **MFM5210 — Stochastics and Partial Differential Equations**
(CUHK-Shenzhen), transcribed into LaTeX and compiled with `pdflatex`.

## Contents

| File | Description |
|------|-------------|
| `Lecture-01.tex` | Lecture 1 — Preliminaries (probability space, random variables, measurability & Borel σ-algebra, stochastic processes & filtrations, Brownian motion) |

## Building

Requires a TeX Live installation with `pdflatex`.

```sh
pdflatex -interaction=nonstopmode -halt-on-error Lecture-01.tex
pdflatex -interaction=nonstopmode -halt-on-error Lecture-01.tex   # run twice for cross-refs
```

## Notes

- Topics are transcribed from the `Lecture-01.pdf` handwritten notes.
- Compiled `.pdf` files and LaTeX aux/log artifacts are git-ignored, so the
  source `.tex` files are the version-controlled deliverable.

## License

Course materials for personal study. See the course for usage rights.
