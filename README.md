# MFM5210 Stochastics and Partial Differential Equations

Lecture notes and homework for **MFM5210 — Stochastics and Partial Differential Equations**
(CUHK-Shenzhen). The lecture notes are transcribed from the handwritten lectures into LaTeX with
AI assistance and compiled with `pdflatex`; the homework is solved in the same LaTeX setup.

> **Maintainer note.** Inline and display math in this file is fine, but use only standard LaTeX
> commands. Every `.tex` file in this repository defines its own short macros in its preamble
> (shorthands for the expectation, the probability measure, the natural numbers, the differential,
> the indicator, and the like); those are undefined here and make the Markdown tooling raise a
> ParseError, so write such symbols out with `\mathbb{}` / `\mathrm{}` / `\operatorname{}` or in
> plain text.

## Repository layout

| Path | Role |
| --- | --- |
| `Lecture-01.tex` | Lecture 1 (Sept 7, 2026) — *Preliminaries*: probability spaces, random variables, measurability and the Borel sigma-algebra, stochastic processes and filtrations, Brownian motion. Compiles to `Lecture-01.pdf`. |
| `Lecture-02.tex` | Lecture 2 (Sept 14, 2026) — properties of Brownian motion, worked examples, and Itô calculus up to the Itô integral. Compiles to `Lecture-02.pdf`. |
| `Lecture-03.tex` | Lecture 3 (Sept 21, 2026) — *Itô's formula and Itô processes*: a recap of the Itô-integral properties, the elementary form of Itô's formula, Itô processes with the general Itô formula and its multiplication rule. Compiles to `Lecture-03.pdf`. |
| `Lecture-04.tex` | Lecture 4 (Sept 28, 2026) — *multi-dimensional Itô calculus and SDEs*: vector-valued Itô integrals, the general Itô formula in $\mathbb{R}^n$, the product rule, stochastic differential equations with their strong solutions (geometric Brownian motion, Ornstein–Uhlenbeck), and the existence and uniqueness theorems. Compiles to `Lecture-04.pdf`. |
| `HW/hw1.tex` | Homework 1 solutions (Sept 15, 2026), built on the homework class. Compiles to `hw1.pdf` in the repository root. |
| `HW/hw2.tex` | Homework 2 solutions (Sept 21, 2026), built on the homework class. Compiles to `hw2.pdf` in the repository root. |
| `HW/hw3.tex` | Homework 3 solutions (Sept 28, 2026), built on the homework class. Compiles to `hw3.pdf` in the repository root. |
| `MFM-hw.cls` | Homework document class: title block, problem and subproblem counters/macros, page headers. |
| `Makefile` | Build driver for every lecture and homework (see below). |
| `.gitignore` | LaTeX build artifacts and compiled PDFs; only the sources are tracked. |

Naming scheme: `Lecture-MM.tex` for the following lectures and `HW/hwM.tex` for the following
homework sets. `HW/` is searched automatically, so a homework file also still builds if it sits in
the repository root. The handwritten originals are exported as `LectureMM.pdf` (no dash), so a
lecture source never writes over its own original: `Lecture-03.tex` produces `Lecture-03.pdf`, a
different file from `Lecture03.pdf`.

## Building

Requirements: a TeX Live installation with `pdflatex` and the standard packages `geometry`,
`amsmath`, `amssymb`, `amsthm`, `mathtools`, `amsfonts`, `bbm`, `hyperref`, plus `xcolor` and
`tikz` for the drawings and the blue annotations in Lectures 2 and 3. The document class
additionally pulls in `ifthen`, `titlesec` and `fancyhdr` on its own.

### With make

```sh
make                     # the default target, the same as `make all`
make Lecture-01.pdf      # one lecture (the same as: make Lecture-01)
make hw1.pdf             # one homework set (likewise hw2.pdf, hw3.pdf)
make all                 # every source listed in LectureNums / HWNums
make clean-cache         # removes *.aux *.log *.out *.toc
make clean-pdf           # removes *.pdf
make clean-all           # both of the above
```

How the rules behave (verified with `make clean-all && make all`):

* Lecture targets are compiled with **two** `pdflatex` passes before the auxiliary files are
  cleaned, so a table of contents and any labelled cross-references resolve on the first build.
  None of the four lectures uses a table of contents or an automatic reference yet, which is why a
  single pass would also work today.
* Homework sources are located through `VPATH` plus an exported `TEXINPUTS`, so `hwM.tex` builds
  from `HW/` or from the root, and `MFM-hw.cls` is found in either layout; `hwM.pdf` is written to
  the repository root.
* `LectureNums := 01 02 03 04` and `HWNums := 1 2 3` are the list of record. A listed number that has
  no source is reported as `no source found … - skipped` instead of breaking the build, so a
  lecture or homework number can be announced in advance.

### Without make

```sh
latexmk -pdf Lecture-01.tex     # runs pdflatex as often as needed
pdflatex Lecture-01.tex && pdflatex Lecture-01.tex   # the same by hand
```

## Lecture notes

**Lecture 1 — Preliminaries.** Five sections:

1. *Preliminaries — Basic Notations*: basic notation, the definition of a sigma-algebra, of a
   probability measure and of a probability space, with the die-rolling example.
2. *Random Variables*: random variables, the discrete example continued, continuous random
   variables and densities, the normal distribution as the running example, expectation.
3. *Measurability and the Borel sigma-algebra*: the Borel sigma-algebra, the sigma-algebra
   generated by a random variable, and how to read measurability as available information.
4. *Stochastic Processes and Filtrations*: stochastic processes, filtrations, adaptedness, the
   natural filtration, the coin-tossing example, and which random variables are
   $\sigma(X_1,\dots,X_n)$-measurable.
5. *Brownian Motion*: the definition of standard Brownian motion and independence.

**Lecture 2 — Brownian motion and Itô calculus.**

1. *Brownian motion*: the definition and its elementary properties, including the covariance
   $\mathbb{E}[B_sB_t]=s\wedge t$.
2. *Examples*: worked computations of the type needed later (covariance, moments, distributional
   identities), numbered with circled example numbers.
3. *Itô calculus*: the construction of the Itô integral for elementary (simple) processes and then
   the integral for processes in $V(0,T)$, with the isometry.

**Lecture 3 — Itô's formula and Itô processes.** Four sections:

1. *Recap: properties of the Itô integral*: linearity, zero mean, the Itô isometry $(\ast)$ and the
   continuity/adaptedness of the integral, the Fubini remark, the three worked examples with the
   step-function drawing, the exercise, and the closing question.
2. *Itô's formula*: the elementary form — for $f$ of class $C^2$,
   $f(B_t)-f(0)=\int_0^t f'(B_s)\,\mathrm{d}B_s+\frac{1}{2}\int_0^t f''(B_s)\,\mathrm{d}s$ — the
   shorthand differential notation, and the worked example
   $\int_0^tB_s\,\mathrm{d}B_s=\frac{B_t^2}{2}-\frac{t}{2}$.
3. *Itô processes and the general Itô formula*: the class $C^{1,2}$, the definition of an Itô
   process $(\ast)$, Itô's formula (IF) for Itô processes with the multiplication rule (MR), and
   the five remarks — quadratic variation $\mathrm{d}X_t\cdot\mathrm{d}X_t=\sigma_t^2\,\mathrm{d}t$
   with $\langle X\rangle_t$, the expanded form of (IF), its integral form, the Brownian-motion
   case, and the case $f=f(x)$.
4. *Worked example*: $\int_0^t e^{B_s-s/2}\,\mathrm{d}B_s$ computed twice, once through Itô's
   formula in the form (iv) and once by treating $B_t-t/2$ as an Itô process.

**Lecture 4 — Multi-dimensional Itô calculus and SDEs.** Seven sections:

1. *Multi-dimensional Brownian motion and the vector-valued Itô integral*: the $m$-dimensional
   Brownian motion and its natural filtration, matrix-valued processes in $V^{n\times m}(0,T)$,
   the definition of the vector-valued integral of a matrix process against $\mathrm{d}\vec B_s$,
   and the $n$-dimensional Itô process in its system form and in its matrix form.
2. *General Itô's formula*: the second-order formula in $\mathbb{R}^n$, the multiplication rule for
   $\mathrm{d}B_i(t)\cdot\mathrm{d}B_j(t)$, the Brownian-motion case with the gradient and the
   Laplacian, and the product rule with its proof.
3. *Stochastic differential equations*: the definition of a strong solution and the remarks on when
   the two integrals in it are well defined.
4. *SDE examples, continued*: geometric Brownian motion (E1) and the Ornstein–Uhlenbeck /
   Langevin equation (E2), each with its explicit solution proved with Itô's formula.
5. *Existence and uniqueness theorem*: the uniform Lipschitz and linear growth conditions, the
   existence of a continuous, square-integrable solution, and pathwise uniqueness.
6. *Remarks on the hypotheses*: a time-independent coefficient satisfying the Lipschitz condition
   satisfies linear growth as well, a bounded derivative implies the Lipschitz condition, and a
   non-uniqueness example, $3X_t^{1/3}\,\mathrm{d}t+3X_t^{2/3}\,\mathrm{d}B_t$ with $X_0=0$.
7. *Multi-dimensional case*: the same theorem for $\mu:[0,T]\times\mathbb{R}^n\to\mathbb{R}^n$ and
   $\sigma:[0,T]\times\mathbb{R}^n\to\mathbb{R}^{n\times d}$, with the SDE read as a system of $n$
   scalar SDEs.

### Notation and conventions in the notes

* Each lecture file is a standalone `article` (11pt, 1in margins). The theorem-like environments
  are declared per file: Lecture 1 has `definition`, `example`, `remark`, `fact`, `lemma` and
  `theorem`; Lecture 2 only `proposition`; Lectures 3 and 4 have `definition`, `example`, `remark`,
  `theorem` and `proposition`, numbered inside the section.
* The short macros for expectation, probability, the reals, the filtration, the differential and
  the indicator are declared **per file**, at the top of each `.tex`; there is no shared preamble.
  That is deliberate — files stay self-contained — but it also means the macros are unavailable to
  this README (see the maintainer note).
* Two annotation macros mark where a line comes from. The blue one reproduces the blue ink of the
  handwritten originals: side notes and side explanations, printed in blue. The red one (used
  sparingly, inline as a bracketed flag or as a red *Editor's note.* paragraph) marks what was
  added during transcription and is **not** in the source — currently the note opening Lecture 3,
  which says that its first two pages repeat the close of Lecture 2, and the corrected coefficient
  in Lecture 4's geometric-Brownian-motion example.
* A second local macro produces the circled example numbers used in Lectures 2, 3 and 4.
* The handwritten notes label their own equations — $(\ast)$, (IF), (MR), (E1), (E2), and the two
  ordered systems (1) and (2) — and the transcription keeps those labels as fixed tags, so they do
  not disturb the automatic numbering of the theorem-like environments.
* Lecture 1 redefines the empty-set symbol to the slashed variant (∅).

## Homework

`HW/hw1.tex` solves five problems on Brownian motion and the Itô integral:

| Problem | Content |
| --- | --- |
| 1 | Which events belong to the sigma-algebra $\mathcal{F}_2$, and which random variables are $\mathcal{F}_3$-measurable (Brownian events and integrals versus the future). |
| 2 | For $0<s<t$: the distribution of $B_s+B_t$, a normality lemma for sums of independent Gaussians used in the proof, and the $n$-th moment of $B_t$. |
| 3 | A simple process on $[0,5]$: is it predictable, and what is the Itô integral of it, written out as its defining finite sum. |
| 4 | Mean and variance of stochastic integrals of the form $\\int_0^T f(B_t)\\,\\mathrm{d}B_t$, via the Itô isometry. |
| 5 | Whether $(B_t+t)^2$ belongs to $V(0,T)$, and the mean and variance of its Itô integral. |

`HW/hw2.tex` solves six problems that apply Itô's formula and the integration by parts of the Itô
integral:

| Problem | Content |
| --- | --- |
| 1 | Apply Itô's formula to $f(x)=x^3/3$ to show $\\int_0^t B_s^2\\,\\mathrm{d}B_s = \\frac{1}{3}B_t^3 - \\int_0^t B_s\\,\\mathrm{d}s$. |
| 2 | The exponential $X_t = \\exp(\\sigma B_t + \\mu t)$: $\\mathrm{d}X_t = \\sigma X_t\\,\\mathrm{d}B_t + (\\mu+\\frac{1}{2}\\sigma^2)X_t\\,\\mathrm{d}t$, hence $X_t = 1 + \\int_0^t (\\mu+\\frac{1}{2}\\sigma^2)X_s\\,\\mathrm{d}s + \\int_0^t \\sigma X_s\\,\\mathrm{d}B_s$. |
| 3 | Integration by parts for $h \\in C^1([0,T])$: $\\int_t^T h(s)\\,\\mathrm{d}B_s = h(T)B_T - h(t)B_t - \\int_t^T h'(s)B_s\\,\\mathrm{d}s$. |
| 4 | $X_t = B_t^2 - t$: $\\mathrm{d}X_t = 2B_t\\,\\mathrm{d}B_t$, $\\mathrm{d}X_t\\cdot\\mathrm{d}X_t = 4B_t^2\\,\\mathrm{d}t$, and the quadratic variation $\\langle X\\rangle_t = 4\\int_0^t B_s^2\\,\\mathrm{d}s$. |
| 5 | $X_t = e^{t/2}\\cos B_t$: $\\mathrm{d}X_t = -e^{t/2}\\sin B_t\\,\\mathrm{d}B_t$, so the process is a martingale with $\\mathbb{E}[X_t] = 1$. |
| 6 | Find $f_t \\in V(0,T)$ with $F = \\mathbb{E}[F] + \\int_0^T f_t\\,\\mathrm{d}B_t$: $F = B_T$ gives $f_t = 1$; $F = e^T$ is deterministic and gives $f_t = 0$; $F = \\int_0^T B_t\\,\\mathrm{d}t$ gives $f_t = T-t$, by integrating by parts (Problem 3). |

`HW/hw3.tex` solves five problems on strong solutions and on when the existence and uniqueness
theorem of Lecture 4 applies:

| Problem | Content |
| --- | --- |
| 1 | $X_t = e^{t^2/2}(1+B_t)$ is a strong solution of $\\mathrm{d}X_t = tX_t\\,\\mathrm{d}t + e^{t^2/2}\\,\\mathrm{d}B_t$ with $X_0 = 1$. |
| 2 | The Ornstein–Uhlenbeck SDE $\\mathrm{d}X_t = (-\\alpha X_t+\\beta)\\,\\mathrm{d}t + \\sigma\\,\\mathrm{d}B_t$: (a) verification of the explicit solution $X_t = e^{-\\alpha t}[x_0+\\frac{\\beta}{\\alpha}(e^{\\alpha t}-1)] + \\sigma e^{-\\alpha t}\\int_0^t e^{\\alpha s}\\,\\mathrm{d}B_s$; (b) uniqueness, from the uniform Lipschitz and linear growth conditions on $a(t,x) = -\\alpha x+\\beta$ and $b(t,x) = \\sigma$; (c) $\\mathbb{E}[X_t] = e^{-\\alpha t}[x_0+\\frac{\\beta}{\\alpha}(e^{\\alpha t}-1)]$ and $\\mathrm{Var}(X_t) = \\frac{\\sigma^2}{2\\alpha}(1-e^{-2\\alpha t})$. |
| 3 | A general scalar SDE with smooth coefficients and $\\sigma(x) \\ge \\varepsilon > 0$: (a) $\\mathrm{d}f(X_t) = [f'(X_t)a(X_t)+\\frac{1}{2}f''(X_t)\\sigma^2(X_t)]\\,\\mathrm{d}t + f'(X_t)\\sigma(X_t)\\,\\mathrm{d}B_t$; (b) the transform that normalises the diffusion — $f(x) = f(0)+\\int_0^x\\frac{\\mathrm{d}u}{\\sigma(u)}$ and $b(x) = \\frac{a(f^{-1}(x))}{\\sigma(f^{-1}(x))}-\\frac{1}{2}\\sigma'(f^{-1}(x))$ give $Y_t = f(X_t)$ solving $Y_t = Y_0+\\int_0^t b(Y_s)\\,\\mathrm{d}s + B_t$. |
| 4 | The non-uniqueness example $\\mathrm{d}X_t = 3X_t^{1/3}\\,\\mathrm{d}t + 3X_t^{2/3}\\,\\mathrm{d}B_t$, $X_0 = 0$: $X_t = B_t^3$ is a strong solution, and so is $X_t = 0$ — $\\sigma(x) = 3x^{2/3}$ is not Lipschitz at the origin, so the theorem used in Problem 2 does not apply. |
| 5 | A three-dimensional linear SDE with the constant matrices $\\boldsymbol{A}$, $\\boldsymbol{U}$, $\\boldsymbol{V}$: (a) the system $\\mathrm{d}X_1 = X_1\\,\\mathrm{d}B_1 - X_2\\,\\mathrm{d}B_2$, $\\mathrm{d}X_2 = X_2\\,\\mathrm{d}B_1 + X_1\\,\\mathrm{d}B_2$, $\\mathrm{d}X_3 = \\frac{X_3}{2}\\,\\mathrm{d}t + X_3\\,\\mathrm{d}B_1$; (b) the strong solution $X_1 = e^{B_1}\\cos B_2$, $X_2 = e^{B_1}\\sin B_2$, $X_3 = e^{B_1}$ starting from $\\vec{x}_0 = [1,0,1]^{T}$. |

The homework is typeset with `MFM-hw.cls`: its title-block macros take the author name and e-mail,
the homework number and the course, and its two problem macros number the problems and the
subproblems (the class is a local style file, kept at the repository root so both layouts compile).

## Status

* Transcribed: Lectures 1 to 4; homework 1 to homework 3 complete.
* Pending: Lecture 5 onwards, homework 4 onwards — add the numbers to `LectureNums` / `HWNums`,
  drop the sources in place, and `make all` picks them up.
* Lecture 3 opens with a recap section rather than with new material: pages 1–2 of the handwritten
  notes repeat the closing content of Lecture 2 (the proposition, its Fubini remark, the three
  examples, the exercise and the closing question). The transcription keeps them in Section 1
  instead of dropping or renumbering them, and says so in a red editor's note on the title page.
* Two places where the transcription deviates from what is written on the page: Lecture 4's
  Example ① restates geometric Brownian motion as $\alpha X_t\,\mathrm{d}t+\beta X_t\,\mathrm{d}t$
  where (E1) has $\beta X_t\,\mathrm{d}B_t$ — the typeset version uses the SDE of (E1) and flags the
  slip in red; and Lecture 3's first page repeats, word for word, material already transcribed in
  `Lecture-02.tex`, which is kept as the recap of Section 1.
* The lecture notes are **transcribed from handwritten notes with AI assistance**, so the content
  needs to be checked against the originals; the red editor's notes mark the places added by the
  editor, and the blue annotations reproduce the blue ink of the originals. The commit history
  records the corrections made so far (typos in Homework 1, a missing exponent in the normality
  lemma, the title of Lecture 2, the Itô-formula terms in Homework 2, the Itô isometry and the
  quadratic variation in Homework 3).

## License

Course materials for personal study. See the course for usage rights.
