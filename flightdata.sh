#!/bin/bash
# This will be the shared script and we will each work on a seperate function

# set a global file used in the script
FILE=/blue/bsc4452/share/Class_Files/data/flights.May2018-April2020.csv

# function to search the FILE for relevant lines and extracts the number of flights delayed for a given input destination city
GNV_to_dest_15_delay (){
	# first argument of the function call is saved
        dest_city=$1

	# search for lines in the FILE that have GNV as the departure and dest_city as the arrival
	# cut out the dest_15 and arriv_15 fields, sort numerically, and count how many 1s and 0s are present
	# the head -n1 saves only the number of 1s counted
        dest_15=$(grep \"GNV\".*\"$dest_city\" $FILE | cut -f13 -d',' | sort -nr | uniq -c | head -n1)
        arriv_15=$(grep \"GNV\".*\"$dest_city\" $FILE | cut -f16 -d',' | sort -nr | uniq -c | head -n1)

	# for dest_15 and arriv_15, cut the number of 1s counted and save the sum
        dest_15_count=$(echo $dest_15 | cut -f1 -d' ')
        arriv_15_count=$(echo $arriv_15 | cut -f1 -d' ')
        total_15_delay=$((dest_15_count+arriv_15_count))

	# print the total number of delayed flights for the dest_city inputed
        echo "The total number of delayed flights from GNV to $1 is:  $total_15_delay"
}

#run the GNV_to_dest_15_delay function for the three cities specified in the table
GNV_to_dest_15_delay ATL
GNV_to_dest_15_delay CLT
GNV_to_dest_15_delay MIA

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
}
