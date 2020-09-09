png(file="plots/fivethirtyeight-biden-win-%d.png", width=1024, height=768)
library(tidyverse)

p  <- read_csv("https://projects.fivethirtyeight.com/2020-general-data/presidential_ev_probabilities_2020.csv")
## p  <- read_csv("fivethirtyeight/presidential_ev_probabilities_2020.csv")
options(width=200)

p  <- p %>% arrange(total_ev) %>%
    mutate(evcumprob_inc = cumsum(evprob_inc),
           evcumprob_chal = cumsum(evprob_chal),
           )

## Find the cumulative probability F(Biden > 269)
## v0  <- 269
## f1 <- approxfun(p$evcumprob_chal, p$total_ev)
## (problose  <- optimize(function(t0) abs(f1(t0) - v0), interval = range(p$evcumprob_inc))$minimum)
## (probwin  <-  1 - problose)

## Find the share of simulations in which Biden wins
(probwin  <- sum(filter(p, total_ev>=270 )$evprob_chal ))


myTitle = paste("FiveThirtyEight.com Simulations on", first(p$modeldate))

ggplot(p, aes(x=total_ev, y=1-evcumprob_chal)) +
    geom_vline(xintercept=270, color="gray") +
    geom_segment(x=-Inf,y=probwin, xend=-270,yend=probwin, color="gray") +
    geom_step(color="blue",size=2) +
    labs(y="Percent of simulations in which Biden equals or exceeds the given number of votes", x="Electoral votes for Biden") +
    scale_x_reverse(breaks=c(100,200,270,300,400,500,538))   +
    scale_y_continuous(labels=scales::percent_format()) +
    annotate(geom="text", x=570, y=probwin, label=paste("Biden equals or exceeds 270 electoral votes in", scales::percent(probwin,accuracy=0.1), "of simulations" ), hjust=0, vjust="bottom")


ggplot(p, aes(x=total_ev, y=1-evcumprob_chal)) +
    geom_vline(xintercept=270, color="gray") +
    geom_segment(x=-Inf,y=probwin, xend=270,yend=probwin, color="gray") +
    geom_step(color="blue",size=2) +
    labs(title=myTitle,
        y="Percent of simulations in which Biden equals or exceeds the given number of votes",
        x="Electoral votes for Biden") +
    scale_x_continuous(breaks=c(100,200,270,300,400,500,538))   +
    scale_y_continuous(labels=scales::percent_format()) +
    annotate(geom="text", x=0, y=probwin, label=paste("Biden equals or exceeds 270 electoral votes in", scales::percent(probwin,accuracy=0.1), "of simulations" ), hjust=0, vjust="bottom")

