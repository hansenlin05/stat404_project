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

## Limits

Device type is not randomised. Conclusions about treatments apply to the eight tested devices. They do not extend to a random sample of phones, tablets, or laptops.
