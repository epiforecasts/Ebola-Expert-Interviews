# Expert elicitation

Data and `R` code to support the expert elicitation analysis in *Forecasting the geographic spread of Ebola Virus Disease in the Democratic Republic of the Congo during the 2018-2020 outbreak*.


--------------------------------------------------------------------------------
  
### Study description

  This study aims to forecast the geographic spread of the 2018-2020 Ebola Virus Disease outbreak in the DRC. The expert elicitation was conducted from December 2019 to March 2020, with a pilot study carried out in November  2019. 
  
  We describe the experts' responses and compare these to the cases reported.

--------------------------------------------------------------------------------
  
### Repository files

  A description of each file and folder is provided below. 
  
  
**Sourced scripts**


  All script names starting by `00_` denote scrips that are not to be run alone but are sourced by other scripts. 

* **`00_data_1.R`:** `R` script that inputs expert forecasts for November 2019 (pilot study) and outputs a .csv file with the results, stored in `Outputs`.

* **`00_data_2.R`:** `R` script that inputs expert forecasts for December 2019 and outputs 2 .csv files with the results: one including  the additional health zones rated by the experts and one without, both stored in `Outputs`.

* **`00_data_3.R`:** `R` script that inputs expert forecasts for January 2020 and outputs 2 .csv files with the results: one including  the additional health zones rated by the experts and one without, both stored in `Outputs`.

* **`00_data_4.R`:** `R` script that inputs expert forecasts for February 2020 and outputs 2 .csv files with the results: one including  the additional health zones rated by the experts and one without, both stored in `Outputs`.
 
* **`00_data_5.R`:** `R` script that inputs expert forecasts for March 2020 and outputs 2 .csv files with the results: one including  the additional health zones rated by the experts and one without, both stored in `Outputs`.

* **`00_data_cases.R`:** `R` script that reads in cases data.

* **`00_cumulative_calc.R`:** `R` script that inputs the raw data for all forecasts and outputs the cumulative data, stored in `Outputs`.

* **`00_plots.R`:** `R` script that inputs .csv files generated by `01_data.R` and `02_data_cumulative.R` and cases through `00_data_cases.R`, merges the data sets and generates plots, stored in `Plots`.


**Scripts to run**

* **`01_data.R`:** `R` script that sources scripts `00_data_1.R`, `00_data_2.R`, `00_data_3.R`, `00_data_4.R`, `00_data_5.R`and outputs .csv files, stored in `Outputs`.

* **`02_data_cumulative.R`:** `R` script that inputs .csv files generated by `01_data.R`, sources script `00_cumulative_calc.R` and outputs cumulative forecasts, stored as .csv files in `Outputs`. 

* **`02_timeline.R`:** `R` script that inputs .csv file generated by `01_data.R` and outputs a plot of the time line of expert elicitations, stored in `Plots`. 

* **`02_descriptive.R`:** `R` script that inputs .csv file generated by `01_data.R` and generates descriptive analysis for the results text. 

* **`03_plots.R`:** `R` script that sources `00_plots.R` and makes plots for each month, stored in `Plots`. 


**Folders**

* **`Outputs`:** a folder containing the expert elicitation forecasts needed for analysis generated by the `R` scripts. 
    + `.csv` files entitled `results_month_year.csv` include only forecasts for the HZs rated by all experts,
    + `.csv` files entitled `results_month_year_additional_HZ.csv` include only forecasts for the HZs rated by some experts (in response to the follow-up question "any additional HZs with >1 case with >5% prob?")
        + `.csv` files entitled `results_month_year_cm.csv` include only the HZs rated by all experts with cumulative probabilities .
    + `.csv` file entitled `results_all.csv` includes all `.csv` files entitled `results_month_year.csv`
    + `.csv` file entitled `results_additional_HZ.csv` includes all `.csv` files entitled `results_month_year_additional_HZ.csv`


* **`Plots`:** a folder to save the figures generated by the `R` scripts.


**Project**

* **`Expert-elicitation.Rproj`:** An `RStudio` project file, to avoid having to set your working directory to the folder on your computer. 


--------------------------------------------------------------------------------

Download the repository as a ZIP file using the green button *Clone or download* above, then open the .Rproj file in `RStudio` to begin. 

The analysis was performed using R version 3.6.2 (2019-12-12).

For any issues with the code please contact [Alicia Roselló](https://www.lshtm.ac.uk/aboutus/people/rosello.alicia).
