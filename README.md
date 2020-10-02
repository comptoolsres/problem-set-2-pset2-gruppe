# Problem Set 2

## Group project
This is a group project.
You should work in groups of 2 to 4 (not alone and not more than 4). If this is a problem, please let me know ahead of time.

### Please enter the names of the group members here:
1. Wanhui Sheng
1. Ian A. Culver
1. Alexander Pillai
1. Weihong Gu

## Due date
Problem Set 2 should be turned in on **Friday, October 2nd**.

## The dataset
I have provided a dataset that you will use for this. The dataset and it's description are on the cluster as well as in github.
 * The dataset is at: `/blue/bsc4452/share/Class_Files/data/flights.May2018-April2020.csv`
 * The metadata (description of the data) is at: `/blue/bsc4452/share/Class_Files/data/flights_metadata.md`
     * It is also [nicely rendered on github](https://github.com/CompToolsRes/Class_Files/blob/master/data/flights_metadata.md).
 * The full file is about 2GB in size and may take a while to process. There is also a file called `flights.1K.csv` in the same folder. This file is the 1st 1,000 flights from the full file and can be used during development.
 * It is not needed for this exercise, but note that there is also a file called `flights.May2017-Apr2018.csv` in the folder that may be of interest for future exercises.

## Instructions

The goal of this project is to write one or more Bash scripts that do the following:

**1.** Counts the number of flights that were delayed 15 minutes or more into or out of Gainesville, FL (airport code GNV) during the time frame covered by the dataset. (*2 points*)

**2.** Produce a table (text is fine) with the data to fill in this table (*13 points, see rubric below for details*):

GNV to: | Total flights | Total flights delayed (≥15min) | Total flights delayed due to Weather
--------|---------------|------------------------|-------------------------------
ATL |5093
CLT |2902
MIA |1297

**3. Within a function**, print a list of all unique airport codes contained in the dataset. (*3 points*)

**4. Within a function** list the cities in Florida that have airports in the dataset. (*2 points*)

**Bonus question:**  Asks for user input (see TLCL chapter 28) to enter either a airport code or city, state name and then calculates the number of flights as in question 1. (*5 points extra credit*)

## To submit

You should submit your answer as one or more scripts in a git repository. Submit the link in Canvas.

You should start in Canvas, creating your group and then create the same group in github.

**Be sure to edit this README.md file with the names of the group members.**

## Grading

For questions, 1, 3 and 4, I will mostly be looking for the right answer.


For question 2, you will receive points for:

Rubric item | Points | 
------------|--------|
Using github| 1 point | 
Having at least one commit from each member of the team | 2 points |
Using branches within github to coordinate development among team members | 2 points |
Using functions correctly | 2 points |
Using comments in code and git commits | 2 points |
Using spacing to make code readable | 2 points |
Getting the correct answer | 2 points |

**Extra credit:**

Your group's score will be entered in Canvas.
