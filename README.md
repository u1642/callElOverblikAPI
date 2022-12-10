# callElOverblikAPI

This package provide functions to fetch data form eloverblik.dk, and some for extracting the data from the returned list

sysdata.rda
Contains errorcodes, and some translation to text

declareVariables.R
Setting env variables

getIsAlive.R
Check if server is available

getDataAccessToken.R
Use your refresh token to get a data access token

getTimeSerieData.R
Fetch time data from eloverblik.dk

getCharges.R
Get pricing data

dataframeElOverblik.R
Just a definition used internally

This function will provide an data frame based on the data retrieved from getTimeSerieData.R

enrichRawObservations.R
Not finished/used


The following PDF document povides you with the nessesay knowledge to get the refreshtoken, https://energinet.dk/-/media/CAE99CFCC054481DA9639F632F02C488.pdf
At this site https://api.eloverblik.dk/CustomerApi/index.html you can see all the function beeing called
I have only made R code for a few of the functions





