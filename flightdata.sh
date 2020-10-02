#!
# This will be the shared script and we will each work on a seperate function

unique_airport_codes () {
	echo "Function unique_airport_codes executed."

}

florida_city_airports () {
	echo "Function florida_city_airports executed."

}

airport_flight_calculator () {
	echo "Function airport_flight_calculator executed."

}

gainesville_delayed_flights () {
	echo "Function gainesville_delayed_flights executed."
#Examine the data set values DEP_DEL15 and ARR_DEL15 (values of 1.00=Yes, 0.00=No) in terms of the flight being delayed
#Make a function that counts a line ONLY if there is a value of 1.00 in either of the two fields
#Additionally grep only the flights with the GNV airport code and this will exclude any lines that do not have GNV as
#a destination or origin.

grep GNV flights.May2018-April2020.csv | cut -f13,16 -d, | grep 1.00 | wc -l

}
