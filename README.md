# $f(C_{2^n}\times C_2) = 3 - 2^{-n}$, so $\mathrm{Im}(f)$ is not discrete

**Source.** Marius Tărnăuceanu, *On some problems regarding a group-theoretical generalization of the Gauss formula*, [arXiv:2611.34371](https://arxiv.org/abs/2611.34371). The function $f$ comes from Fasolă and Tărnăuceanu, [arXiv:2212.09055](https://arxiv.org/abs/2212.09055) (FT23).

**Definition (quoted from the paper's LaTeX).**

$$S(G) = \sum_{H \le G} |\mathrm{Aut}(H)| \quad \text{and} \quad f(G) = \frac{S(G)}{|G|}.$$

The paper solves the three problems posed in FT23. At the end of Remark 3.4 it leaves the following question open:

> It remains an open problem to determine the accumulation points of $\mathrm{Im}(f)$ (or to decide whether $\mathrm{Im}(f)$ is closed and discrete in $[1, \infty)$).

## Result

> **Proposition.** For every prime $p$ and every $n \ge 1$,
> $$f(C_{p^n}\times C_p) \;=\; 1 + p(p-1) - \frac{p-1}{p^{n}}.$$
> In particular $f(C_{2^n}\times C_2) = 3 - 2^{-n}$.

**Consequences.**
- **3 is an accumulation point of $\mathrm{Im}(f)$,** approached by $5/2,\ 11/4,\ 23/8,\ 47/16,\dots$
- **$3$ itself lies in $\mathrm{Im}(f)$,** since $f(D_{10}) = (1 + 5\cdot 1 + 4 + 20)/10 = 3$. So $\mathrm{Im}(f)$ is **not discrete**, which answers the parenthetical question in the negative.
- **More generally, every $1 + p(p-1)$ is an accumulation point:** $3, 7, 21, 43, 111, \dots$
- **What remains open:** whether $\mathrm{Im}(f)$ is closed, and what the full set of accumulation points is.

## Proof

Let $G = C_{p^n}\times C_p$.

1. **Split off the cyclic subgroups.** Each cyclic subgroup $H$ contributes $|\mathrm{Aut}(H)| = \varphi(|H|)$, and $\sum_{H \text{ cyclic}}\varphi(|H|) = |G|$. So $f(G) = 1 + \frac{1}{|G|}\sum_{H\text{ noncyclic}}|\mathrm{Aut}(H)|$. This is the paper's eq. (1).
2. **Locate the noncyclic subgroups.** A noncyclic $H \le G$ has rank 2, so it contains $\Omega_1(G) \cong C_p^2$. The quotient $G/\Omega_1 \cong C_{p^{n-1}}$ is cyclic. Hence for each $j = 1,\dots,n$ there is exactly one noncyclic subgroup of order $p^{j+1}$, and it is $C_{p^j}\times C_p$.
3. **Count automorphisms.**
   - For $j=1$: $|\mathrm{GL}_2(p)| = (p^2-1)(p^2-p)$.
   - For $j \ge 2$: a generator of order $p^j$ can go to any of the $p^{j}(p-1)$ elements of order $p^j$. The $C_p$ generator can go to any of the $p^2 - p$ elements of order $p$ outside the image of the first one. That gives $(p-1)^2p^{j+1}$.
4. **Sum.** $(p^2-1)(p^2-p) + (p-1)^2\sum_{j=2}^{n}p^{j+1} = (p-1)(p^{n+2}-p)$. Dividing by $|G| = p^{n+1}$ gives the formula. ∎

For $p = 2$ the noncyclic contributions are $6 + 8 + 16 + \dots + 2^{n+1} = 2^{n+2}-2$, so $f = 1 + (2^{n+2}-2)/2^{n+1} = 3 - 2^{-n}$.

## A few corrections to Table 1 (and Remark 3.4)

While checking the formula we recomputed the paper's Table 1 by brute force over all subgroups. Five rows agree: $S_3$, $\mathbb Z_3\rtimes\mathbb Z_4$, $\mathbb Z_2^2$, $\mathbb Z_4\times\mathbb Z_2$ and $Q_8$. Four rows seem to need a correction:

| $G$ | Table 1: $S(G)$, $f(G)$ | Recomputed: $S(G)$, $f(G)$ |
|---|---|---|
| $D_8$ | $22$, $11/4$ | $28$, $7/2$ |
| $D_{12}\cong S_3\times\mathbb Z_2$ | $36$, $3$ | $54$, $9/2$ |
| $A_4$ | $40$, $10/3$ | $42$, $7/2$ |
| $Q_8\times\mathbb Z_2$ | $136$, $17/2$ | $334$, $167/8$ |

**$D_8$ by hand.** The subgroups are:

| Subgroups | Number | $\lvert\mathrm{Aut}\rvert$ each | Contribution |
|---|---|---|---|
| trivial | 1 | 1 | 1 |
| order 2 | 5 | 1 | 5 |
| $C_4$ | 1 | 2 | 2 |
| Klein four-groups | 2 | 6 | 12 |
| $D_8$ itself, with $\mathrm{Aut}(D_8)\cong D_8$ | 1 | 8 | 8 |

The total is $S(D_8) = 28$. This is exactly the expression in the proof of Theorem 3.1, $1 + 5\cdot 1 + (2 + 2\cdot 6) + 8$, which evaluates to $28$ rather than $22$. So $f(D_8) = 7/2$. The inequality $f(D_8) > 5/2$ used there still holds.

**$A_4$ by hand.** $1 + 3\cdot 1 + 4\cdot 2 + 6 + 24 = 42$. The last term is $|\mathrm{Aut}(A_4)| = |S_4|$.

**Effect on Remark 3.4.** The value $11/4$ is indeed the second smallest value of $f$ on noncyclic 2-groups, but it is attained by $\mathbb Z_4\times\mathbb Z_2$, not by $D_8$. The stated gap $\mathrm{Im}(f)\cap(5/2, 11/4) = \emptyset$ is consistent with all our data. As far as we can see, none of this affects Theorems 3.1–3.3.

## Computer check

Two GAP scripts are in [`gap/`](gap/). Both use the literal definition, a sum of $|\mathrm{Aut}(H)|$ over `AllSubgroups`. Tested with GAP 4.16.1.

**[`gap/fcheck.g`](gap/fcheck.g)** (output in [`gap/fcheck.out`](gap/fcheck.out), about 15 s) checks:
- $f(C_{2^n}\times C_2) = 3-2^{-n}$ for $n = 1..8$. The values of $S$ are $10, 22, 46, 94, 190, 382, 766, 1534$.
- $C_{3^n}\times C_3$ for $n=1..5$. The values are $19/3, 61/9, 187/27, 565/81, 1699/243$, tending to $7$.
- The closed form for $p\in\{2,3,5\}$ and $n\le 3$.
- The Table 1 rows.

**[`gap/fscan.g`](gap/fscan.g)** (output in [`gap/fscan.out`](gap/fscan.out), about 1–2 min) lists every value $f(G) < 13/4$ over all noncyclic groups of order $\le 63$:
- The values that occur are $2$, $5/2$, $11/4$, $23/8$, $47/16$ and $3$; the first group with value 3 is $D_{10}$.
- Nothing lies in $(2, 5/2)$, in agreement with the paper's Theorem 3.3, or in $(5/2, 11/4)$.

**To rerun:**

```sh
cd gap
gap -q fcheck.g
gap -q fscan.g
```

## Scope

- This is a partial answer to the open question in Remark 3.4: it exhibits accumulation points and shows that $\mathrm{Im}(f)$ is not discrete.
- It does not decide whether $\mathrm{Im}(f)$ is closed, and it does not determine all accumulation points.
- The proposition is elementary, and FT23's rank-2 automorphism count gives it in a few lines. As far as we can tell, it is not stated in either paper.

---

curated by myself and claude opus 5.5
