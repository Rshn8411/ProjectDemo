Stock data analysis using Visual Basic.

*Please note that files that Macros have been uploaded separately as .bas files.
This is for convenience in assessing code. The Macro-Enabled Excel file is rather large
but included here without the macros run in-case you would like to see it in action*

*Running LoopStockInfo will iterate through the sheets and produce relevant data
*Running SummaryTable will produce the summary data for each sheets

## About Script

Macros will loop through all the stocks for each year in a single run and take the following information.

  * The ticker symbol.

  * Yearly change from opening price at the beginning of a given year to the closing price at the end of that year.

  * The percent change from opening price at the beginning of a given year to the closing price at the end of that year.

  * The total stock volume of the stock.

* Conditional formatting highlights positive change in green and negative change in red.

* The result should look as follows.

### Summary Table Includes:

* Returns the stock with the "Greatest % increase", "Greatest % Decrease" and "Greatest total volume".
