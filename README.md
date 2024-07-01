## Description

This repository includes the data and the Stata code used in Ioannidis K. (2024). "Whistleblowing under Competition"

### Abstract

Whistleblowing, i.e. the act of reporting illegal actions of an organisation by an employee, is an important tool to uncover corporate fraud. Previous experimental literature studied firms independently of each other. We hypothesise that competition between firms for market revenue provides strategic and non-strategic motives to decrease whistleblowing and increase lawbreaking. In an experiment, we use treatments with and without competition and find an insignificant reduction in whistleblowing and a marginal increase in lawbreaking under competition. We also find evidence that behaviour correlates with beliefs, but it does not correlate with morality judgements.

### Software

The analysis was conducted using ```Stata 18```.

### Files

The files are stored in two folders: Data, which contains data from the experiment, and Stata, which contains the Stata code to produce every result in the paper.

1. Data
   * Experimental Data.csv (*The raw data from the experiment in csv format*)
   * Experimental Codebook.md (*Codebook for ```Experimental Data.csv```*)
2. Stata
   * Beliefs Judgements.do (*Produces all results of subsection 3.2*)
   * Between Participants Pools.do (*Produces all results of appendix A.1*)
   * Data Analysis.do (*Calls and executes all other files*)
   * Power Analysis.do (*Calls and executes the files for the power analysis results in footnote 12*)
   * Prepare Data.do (*Cleans raw experimental data and prepares it for analysis*)
   * Robustness Treatments.do (*Produces all results of appendix A.2*)
   * Treatment Effects.do (*Produces all results of subsection 3.1*)
   * Beliefs and judgements.do (*Produces all results of subsection 3.2*)
   * Power 
      * simwhistle.ado (*Creates a program that simulates data, tests main hypothesis, and stores rejection or not*)
      * power_cmd_simwhistle.ado (*Creates a program that calls simvest, and stores mean rejection rates*)
      * power_cmd_simwhistle_init.ado (*Embeds simvest into the standard power framework of Stata*)

### Instructions
To run the code, you only need to run **Data Analysis.do**.

## Contributing

**[Konstantinos Ioannidis](http://konstantinosioannidis.com/)** 
For any questions, please email me here **ioannidis.a.konstantinos@gmail.com**.
