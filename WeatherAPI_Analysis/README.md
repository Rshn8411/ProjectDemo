# Weather API

Use of Python requests, APIs, and JSON traversals to analyze state/city weather conditions as we approach the equator

*Please note that code is constructed in Jupyter Notebook files and uses libraries specific to the environment they were created in.
If you would like to run these files locally then you may have to install the libraries seen under the "dependencies" in code.

## WeatherPy

Using the [Python library] Citipy (https://pypi.python.org/pypi/citipy) randomly take the weather of 500+ cities across the world of varying distance from the equator. By pushing each city through the weather API [OpenWeatherMap API](https://openweathermap.org/api), I've created a heatmap model of weather across world cities.

A log confirming that each city was output as "cities_log.txt". Cities with no information were printed to the console.
Identified the following factors for each city:

* Temperature (F) vs. Latitude
* Humidity (%) vs. Latitude
* Cloudiness (%) vs. Latitude
* Wind Speed (mph) vs. Latitude

Information was then converted into a DataFrame and output to a .csv file.

Using global data compared the above variables using scatter plots.

Then did a simple regression analysis on each relationship but this time data was separated by Hemisphere (North: greater than or equal to 0 degrees latitude and South < 0 degrees latitude):

* Northern Hemisphere - Temperature (F) vs. Latitude
* Southern Hemisphere - Temperature (F) vs. Latitude
* Northern Hemisphere - Humidity (%) vs. Latitude
* Southern Hemisphere - Humidity (%) vs. Latitude
* Northern Hemisphere - Cloudiness (%) vs. Latitude
* Southern Hemisphere - Cloudiness (%) vs. Latitude
* Northern Hemisphere - Wind Speed (mph) vs. Latitude
* Southern Hemisphere - Wind Speed (mph) vs. Latitude


### VacationPy

Faux analysis to plan future vacations using jupyter-gmaps and the Google Places API.

* Narrow down the DataFrame to find your ideal weather condition. For example:

  * A max temperature lower than 80 degrees but higher than 70.

  * Wind speed less than 10 mph.

  * Zero cloudiness.

  * Drop any rows that don't contain all three conditions. You want to be sure the weather is ideal.

  * **Note:** Feel free to adjust to your specifications but be sure to limit the number of rows returned by your API requests to a reasonable number.
