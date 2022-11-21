library(ggplot2)
library(myPackage)

data("unemp")

canton_data <- clean_unemp(unemp,
                           level_of_interest = "Canton",
                           col_of_interest = active_population)

my_plot <- ggplot(canton_data) +
  geom_col(
    aes(
      y = active_population,
      x = year,
      fill = place_name
    )
  ) +
  theme(legend.position = "bottom",
        legend.title = element_blank())

ggsave("/home/rstudio/scripts/my_plot.pdf", my_plot)
This script loads the data, and saves it to the scripts folder (as you see, this is a path inside of the Docker image). We will also need to update the Dockerfile. Edit it to look like this:

FROM rocker/tidyverse

RUN R -e "devtools::install_github('b-rodrigues/myPackage', ref = 'e9d9129de3047c1ecce26d09dff429ec078d4dae')"

RUN mkdir /home/rstudio/graphs

COPY my_graph.R /home/rstudio/graphs/my_graph.R

CMD R -e "source('/home/rstudio/graphs/my_graph.R')"
