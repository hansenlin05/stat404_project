# Analysis plan

## Model

`Y_ijk = mu + b_i + alpha_j + beta_k + (alpha beta)_jk + epsilon_ijk`

Here `i = 1,...,8` indexes devices, `j = 1,2` indexes charger power, and `k = 1,2` indexes cable type. `b_i` is the random device effect with mean zero and variance `sigma_b^2`. The charger and cable effects are fixed. `epsilon_ijk` is independent error with mean zero and variance `sigma_epsilon^2`.

## Degrees of freedom

There are 32 observations. Subtracting one intercept, seven block effects, one charger effect, one cable effect, and one interaction effect leaves 21 error degrees of freedom. Each two-way F test has 1 df.

## Additive assumption

Each block-treatment cell has one observation. The block-by-treatment interaction cannot be separated from experimental error, so the F tests rely on an additive model. The per-device profile plot across the four treatments is the check. A visible non-additive pattern would weaken the pooled error term and must be discussed rather than hidden.

## Planned contrasts

For device `i`, define the within-block interaction contrast

`d_i = y_i(HP,5A) - y_i(HP,3A) - y_i(LP,5A) + y_i(LP,3A)`

The block effect cancels in `d_i`. The coefficients are `+1, -1, -1, +1`, so `Var(d_i) = 4 sigma_epsilon^2`.

Let `H` be the high-draw blocks and `L` the low-draw blocks. Define

`delta_H = mean(d_i for i in H)` and `delta_L = mean(d_i for i in L)`

Then `SE(delta_H) = 2 sqrt(MSE / n_H)` and `SE(delta_L) = 2 sqrt(MSE / n_L)`. The difference `delta_H - delta_L` estimates the three-way interaction between device power category, charger power, and cable type. Its standard error is `2 sqrt(MSE (1/n_H + 1/n_L))`.

All three intervals use the same 21 df MSE from the additive model, reported at 95%. The pilot defines the two groups after measurement, so subgroup statements are exploratory. If one group has only one block, report that the interval depends on one device.

## Diagnostics

Residual versus fitted plot and normal Q-Q plot for constant variance and normality. Box-Cox transformation and refit if the assumptions fail. Per-device profile plot for additivity and for the source of any interaction.

## Robustness checks

Four checks were run on 26 November 2026 to back the Q&A answers. None of them changes a conclusion; the first three are supplementary and are not shown on the slides.

| Check | Result | Reading |
| --- | --- | --- |
| Refit on log(rate) | charger F = 16.20, p = 0.0006; cable p = 0.79; interaction p = 0.90 | Same conclusions as the rate scale, so no transformation is reported |
| slot added as a covariate | F = 0.48, p = 0.50, error df 20 | No evidence that run order affects the rate |
| Brown-Forsythe across devices | F = 4.60, p = 0.0022; residual SD 0.12 to 0.54 | Variances differ, driven by the two MacBook Pro blocks; affects precision, not direction |
| Laptop-only model (12 runs) | error df 6, MSE 0.0400; 140 W 5A minus 3A = 0.32, 95% CI -0.08 to 0.72, p = 0.094 | The slide reports this simple effect; the pooled planned contrast gives 0.31 with CI -0.51 to 1.12 |

Two estimates of the same comparison are therefore in play: the laptop-only simple effect on the slide, and the pooled within-block contrast in `outputs/tables/planned_contrasts.csv`. They agree in sign and size and neither excludes zero at 5 percent. The pooled table gives `delta_H = 0.31` with 95% interval `-0.51` to `1.12`, and `delta_H - delta_L = 0.35` with `-0.68` to `1.38`. Any spoken answer must name which model and which contrast it quotes.

## Limits

Device type is not randomised. Conclusions about treatments apply to the eight tested devices. They do not extend to a random sample of phones, tablets, or laptops. Error variance is not homogeneous across devices, and the block-by-treatment interaction cannot be separated from error with one run per cell, so the F tests are conservative rather than anti-conservative.
