anova_hmd <- function(fit){
  return(car::Anova({{fit}}, test.statistic = "LR", type = 3))
}
