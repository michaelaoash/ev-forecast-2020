![CDF of Electoral Vote Simulations](plots/fivethirtyeight-biden-win-2.png)

Comments to [mash@econs.umass.edu](mailto:mash@econs.umass.edu)

**Every Outcome in Our Simulations**, one of the panels of
  [https://projects.fivethirtyeight.com/2020-election-forecast/](https://projects.fivethirtyeight.com/2020-election-forecast/),
  plots the spiky probability density function and a smoothed version
  of the probability density function for the 40,000 electoral-vote
  simulations that FiveThirtyEight conducts using the estimate
  probability of victory for each state based on state polling.

A cumulative distribution function resolves the problem of
interpreting the spikiness of the probability density function
(reflecting the discreteness of both State electoral vote counts and
states of the world) or the imprecision of the smoothed version.

The R code:

- reads the Model outputs data from Five Thirty Eight which reports
  the estimated probability of each possible electoral-vote outcome.

- computes a cumulative distribution function from the probability
  density function with a density at each electoral vote outcome (from
  0 to 538 electoral votes for Trump), which is one less the
  cumulative distribution function for votes for Biden.

- finds the probability of Biden's votes exceeding 270, the victory
  threshold

- plots the probability of Biden exceeding the given number of
  electoral votes for each outcome from 0 to 538 and annotates the
  plot.

Access to the FiveThirtyEight data:

- At the bottom of
  [https://projects.fivethirtyeight.com/2020-election-forecast/](https://projects.fivethirtyeight.com/2020-election-forecast/),
  look for "Download the data: Polls Model outputs" and click "Model
  outputs"