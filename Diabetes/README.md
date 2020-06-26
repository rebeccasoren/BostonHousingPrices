# Predicting Diabetes with a Random Forest 
Apply a Random Forest model to the data, and examine the results using Confusion Matrix

## Conclusion
The confusion matrix is a square matrix. 'Accuracy' defines how accurate our prediction was.

* [0,0] value is the number of times the model predicted that diabetes was negative and it corresponded to actual value in the dataframe.

* [0,1] value is the number of times the model predicted that diabetes was negative and the actual value was positive in the dataframe.

* [1,0] value is the number of times the model predicted that diabetes was positive and the actual value was negative in the dataframe.

* [1,1] value is the number of times the model predicted that diabetes was positive and it corresponded to actual value in the dataframe.

## Packages Required
* [caret](https://cran.r-project.org/web/packages/caret/caret.pdf)
* [mlbench](https://cran.r-project.org/web/packages/mlbench/mlbench.pdf)
* [ranger](https://cran.r-project.org/web/packages/ranger/ranger.pdf)
* [tidyverse](https://www.tidyverse.org/packages/)
* [e1071](https://cran.r-project.org/web/packages/e1071/index.html)