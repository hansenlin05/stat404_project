# Review feedback on version 18

Five comments were made on 14 November. All of them are refinement requests. None rejects the design.

| # | Comment | What it asks | Plan |
| --- | --- | --- | --- |
| 1 | Since the cable effect is expected only on high-power devices, please ensure that enough devices can draw more than 60 W to support meaningful comparisons. | Show that the high-draw group is large enough for the interaction comparison. | The design has three high-draw blocks: D1, D2 and D8. Class use is set by effective draw under the two study chargers, with published specification as the starting point. The Honor Power is rated 66 W over private SCP with the original charger, but the measured ceiling with the study chargers is about 38 W, so D7 is low. |
| 2 | Treating device as a random block is reasonable, but may clarify the population of devices you intend to generalize to, since the eight devices are not randomly sampled. | State the scope of inference. | Keep the random block for between-device variation. State that treatment conclusions apply to these eight devices and do not extend to a random sample of devices. |
| 3 | Since the cable effect may differ between high-draw and low-draw devices, may consider including device power category as a factor and investigating its interaction with cable type. | Address device-specific treatment effects. | Keep the 2 x 2 treatment structure. Power category is not randomised, so adding it as a formal factor would change the design. Use the planned contrasts already in the proposal, and report the difference between the high and low interaction contrasts. |
| 4 | The model assumes additive block effects, but your planned contrasts investigate different treatment interactions for high-draw and low-draw devices. Please clarify how these effects will be estimated and tested under your model. | Explain estimation and testing under the named model. | Show the within-block contrast, the same error term, and the standard errors. See `ANALYSIS_PLAN.md`. State that the pilot grouping is post hoc. |
| 5 | Overall, this is an impressive experimental design. However, a few points could be further refined, particularly regarding device-specific treatment effects and the analysis. | General closing advice. | Treat this as a summary of comments 3 and 4. No separate action. |

Comment 4 touches the analysis section of the rubric and is addressed in the analysis plan and in the slides.
