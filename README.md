## R programming Language Questions

**Question 1**

The dataset “possum.csv” includes several measurements for mountain possums, an animal with high population in Australia.
The measurements include their tail length, head length, skull width, belly girth etc. 
The “site” column includes numbers from 1 to 7, each number indicating a different location where the possums were caught for measurement. 
The column “Pop” reports if the location was in Victoria region or in other regions. 

**(a)** Read the dataset as a dataframe in R. Find the possum with highest overall length. What is its gender? Find the answers using codes. Do not use for loops. 

**(b)** Plot a graph to show the relationship between tail length and head length. The possums from Victoria and from other regions should be shown with different colors and different shapes in this plot. Is there any difference in the relation in terms of being from Victoria or not?

 **(c)** Calculate the means of tail length separately for males and females in a single-line code without using dplyr. Which gender has the smallest average tail length? Is the difference meaningful? Do you see a more meaningful difference between genders if you check the means of total length? Repeat the analysis by using the dplyr package. 

 **(d)** Use a single-line code to calculate the mean of tail lengths of male and female possums, and the possums from Victoria and from other regions simultaneously (For example, your output should show the average tail length of female possums from Victoria). Repeat the analysis by using the dplyr package. 

 **(e)** You want to use a single-line code to calculate the means of each numerical column for seven different locations where possums were caught. The output type should be a data frame. Some columns have missing data. Use related input parameter (rm.na) to ignore the missing entries in your mean calculation. Which location has the longest possums on average? Which location has the shortest possums on average? Plot tail length versus head length by using the average scores of those seven locations. Is there a relation? Repeat the analysis by using the dplyr package. Your output dataframe from the dplyr analysis should include one additional column that will report the number of datapoints for each location.

 **(f)** Calculate the average age of possums in the Possum dataset. Then, by using the dplyr package, make a new column such that the value will be “young” for the possums with age lower than average (young possums), and it will be “old” for possums with age higher than average (old possums). Then, use piping to check the maximum skull width for young and old possums. Is there a difference? Repeat the dplyr & piping analysis by taking into account both the old/young age category and gender (i.e. maximum skull width for young-male, young-female, old-male and old-female possums). Discuss the results.


 **Question 2**
 
A = [-3.2 0 0.1 2.4 7.5;
0.27 -4.3 -0.03 -0.07 0;
 -9 0 6.2 -1 -1.2] 

For the matrix A; write an R script, which 

**a)** counts the number of positive elements in matrix A. 

**b)** gets the absolute value of each element in A if the value is smaller than -0.5. 

**c)** Replaces all zeros in A with -10. 

Solve the questions both with and without vectorization. 

**The results were uploaded along with an .R file containing comments and a .Rmd file containing R Markdown code.**

## R Markdown (Rmd)

**R Markdown (.Rmd) is a file format that combines R code, text, and visualizations into a single, dynamic document. It allows users to write reports, perform data analysis, and generate documents in various formats like HTML, PDF, and Word.**

### Basic Structure of an R Markdown File
1. YAML Header (Metadata for document settings)
2. Markdown Text (Formatted text for explanations)
3. R Code Chunks (Executable R code inside {r} blocks)
4. Rendered Output (Tables, plots, and analysis results)
