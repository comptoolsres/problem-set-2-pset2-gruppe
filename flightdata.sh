#!/bin/bash
# This will be the shared script and we will each work on a seperate function

# set a global file used in the script
FILE=/blue/bsc4452/share/Class_Files/data/flights.May2018-April2020.csv

# Question 2: Total flights delayed due to weather
Wheather_Delay (){
	City=$1
	LineCount=$(grep \"GNV\".*\"$City\" $FILE | cut -f24 -d',' | grep ^[^0] | wc -l)
	# WheatherDelay=$((LineCount-1))

	echo "There are $LineCount flights to $1 that were delayed due to weather."
}

# function to search the FILE for relevant lines and extracts the number of flights delayed for a given input destination city
GNV_to_dest_15_delay (){
	# first argument of the function call is saved
        dest_city=$1

	# search for lines in FILE with GNV as departure and dest_city as arrival and count the flights with any delay
        total_15_delay=$(grep \"GNV\".*\"$dest_city\" $FILE | cut -f13,16 -d','| grep 1.00 | wc -l)

	# print the total number of delayed flights for the dest_city inputed
        echo "The total number of delayed flights from GNV to $1 is:  $total_15_delay."
}

# function to ask for user to search for delayed flights by airport code or by City, State
usr_delay_bonus (){
	# ask to search by code or city
        echo -n "Would you like to search for delayed flights by airport code (type \"code\") or by City, State (type \"city\")? "
        read usr_srch_choice

        if [[ $usr_srch_choice = "code" ]]
        then
		# if code is selected ask what code to use
            	echo "You selected to search by airport code."
                echo -n "Enter airport code: "
                read usr_input_code

        	# search for lines in FILE that have the inputed code and count the flights with any delay
                total_15_delay_code=$(grep $usr_input_code $FILE | cut -f13,16 -d',' | grep 1.00 | wc -l)

		# print the total number of delayed flights into/out of inputed code
                echo "The total number of delayed flights into or out of $usr_input_code is: $total_15_delay_code."
        elif [[ $usr_srch_choice = "city" ]]
        then
		# if city is selected as what City, State to use
            	echo "You selected to search by City, State."
                echo -n "Enter City, State: "
                read usr_input_city

		# search for lines in the FILE that have the inputed City, State and count the flights with any delay
                total_15_delay_city=$(grep "$usr_input_city" $FILE | cut -f13,16 -d',' | grep 1.00 | wc -l)

		# print the total number of delayed flights into/out of inputed City, State
                echo "The total number of delayed flights into or out of $usr_input_city is: $total_15_delay_city."
        else
		# if code or city is not entered return error to user
            	echo "ERROR: You did not enter a valid parameter (code/city)."
        fi
}

# function to conduct multiple user inputed searches for delayed flights
usr_search_loop (){
	# intitalizes loop exit status variable to 0
        exit_status=0

	# will loop search function until exit_status does NOT equal 0
        while [[ $exit_status -eq 0 ]]
        do
		# call usr_delay_bonus function
                usr_delay_bonus

		# asks if user would like to conduct more searches
                echo -n "Would you like to search again? (y/n) "
                read usr_search_choice

		# if y is inputed, exit_status remains 0 and loop repeats
		# if n (or anything other than y) is entered, exit_status is changed to 1 and the function ends
                if [[ $usr_search_choice = "y" ]]
                then
                    	exit_status=0
                elif  [[ $usr_search_choice = "n" ]]
                then
                    	exit_status=1
                else
                    	echo "ERROR: y/n not entered."
                        exit_status=1
                fi
        done
}

# question 2: GNV to ATL/CLT/MIA total flights
GNV_to_city (){
	echo "Total number of flights to $1 is"
	city=$1

	# flights number
	grep \"GNV\".*\"$city\" $FILE | wc -l

return
}

# question 3: Within a function, print a list of all unique airport codes contained in the dataset.
unique_airport_codes () {
	echo "The list of all unique airport codes contained in the dataset is:"

	# remove header, combine two columns of airport code to one line
	sed 1d $FILE | cut -d, -f3,7 |  tr ',' '\n' | sort | uniq

return
}

#unique_airport_codes

# Question4: function to find FL cities that have airports
florida_city_airports () {
	# Find FL airports from the origin cities list
	cat $FILE | cut -f4,5 -d,  | grep FL | sort | uniq > Origin

	# Find FL airports from the destination cities list
	cat $FILE | cut -f8,9 -d,  | grep FL | sort | uniq > Dest

	# list the unique cities in FL
	FLCities=$(paste -d "\n" Origin Dest | sort | uniq)

	rm Origin
	rm Dest
}

# Question1
gainesville_delayed_flights () {
	# echo "Function gainesville_delayed_flights executed."

	# Examine the data set values DEP_DEL15 and ARR_DEL15 (values of 1.00=Yes, 0.00=No) in terms of the flight being delayed
	# Make a function that counts a line ONLY if there is a value of 1.00 in either of the two fields
	# Additionally grep only the flights with the GNV airport code and this will exclude any lines that do not have GNV as
	# a destination or origin.
	echo "The number of delayed flights to and from Gainesville Regional Airport is:"
	grep GNV $FILE | cut -f13,16 -d, | grep 1.00 | wc -l

}

echo "Question 1:"
gainesville_delayed_flights

echo "Question 2: (column 1)"
GNV_to_city ATL
GNV_to_city CLT
GNV_to_city MIA

echo "Question 2: (column 2)"
GNV_to_dest_15_delay ATL
GNV_to_dest_15_delay CLT
GNV_to_dest_15_delay MIA

echo "Question 2: (column 3)"
Wheather_Delay ATL
Wheather_Delay CLT
Wheather_Delay MIA

echo "Question 3:"
unique_airport_codes

echo "Question 4:"
florida_city_airports

echo "List of the FL cities that have an airport:"
echo "$FLCities"

echo "Bonus question:"
usr_search_loop
