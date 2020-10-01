#!/bin/bash 
# This will be the shared script and we will each work on a seperate function

FILE=/blue/bsc4452/share/Class_Files/data/flights.May2018-April2020.csv

# question 2: GNV to ATL/CLT/MIA total flights
GNV_to_city (){

echo "total flights muber to $1 is"
city=$1

#remove header
grep \"GNV\".*\"$city\" $FILE | wc -l

return
}
GNV_to_city ATL
GNV_to_city CLT
GNV_to_city MIA


# question 3: Within a function, print a list of all unique airport codes contained in the dataset.

unique_airport_codes () {

echo "the list of all unique airport codes contained in the dataset is:"

cut -d, -f3,7 $FILE |  tr ',' '\n' | sort | uniq

return

}
unique_airport_codes



florida_city_airports () {
	echo "Function florida_city_airports executed."

}

airport_flight_calculator () {
	echo "Function airport_flight_calculator executed."

}

gainesville_delayed_flights () {
	echo "Function gainesville_delayed_flights executed."
}
