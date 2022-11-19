Anova(fit, test.statistic = "LR", type = 3)

anova_reg <- function(fit){
  return(car::Anova({{fit}}, test.statistic = "LR", type = 3))
}
