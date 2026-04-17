## Description

This repository includes the data and the Stata code used in Ioannidis K. (2026). "The sound of silence: Does competition decrease whistleblowing? Evidence from a preregistered experiment"

### Abstract

We investigate whether market competition suppresses whistleblowing, using a high-powered, preregistered experiment (N=240). In a setting where firms either operate independently or compete in a tournament for market revenue, managers choose between a productive task and breaking the law to double firm surplus at the expense of the public, while employees decide whether to report misconduct at a personal cost. Aggregate results indicate that competition has a statistically null effect on whistleblowing. While we observe a directional increase in manager lawbreaking under competition, this does not translate into a significant erosion of the propensity to report misconduct. Exploratory analysis reveals heterogeneous treatment effects by population: whistleblowing decreased significantly in our Birmingham pool, but remained unaffected in Cambridge.

### Software

The analysis was conducted using ```Stata 18```.

### Files

The files are stored in two folders: Data, which contains data from the experiment, and Stata, which contains the Stata code to produce every result in the paper.

1. Data
   * Experimental Data.csv (*The raw data from the experiment in csv format*)
   * Experimental Codebook.md (*Codebook for ```Experimental Data.csv```*)
2. Stata
   * Data Analysis.do (*Calls and executes all other files*)
   * Power Analysis.do (*Calls and executes the files for the power analysis results in footnote 12*)
   * Prepare Data.do (*Cleans raw experimental data and prepares it for analysis*)
   * Results.do (*Produces all results*)
   * Power 
      * simwhistle.ado (*Creates a program that simulates data, tests main hypothesis, and stores rejection or not*)
      * power_cmd_simwhistle.ado (*Creates a program that calls simvest, and stores mean rejection rates*)
      * power_cmd_simwhistle_init.ado (*Embeds simvest into the standard power framework of Stata*)

### Instructions
To run the code, you only need to run **Data Analysis.do**.

## Contributing

**[Konstantinos Ioannidis](http://konstantinosioannidis.com/)** 
For any questions, please email me here **ioannidis.a.konstantinos@gmail.com**.
