#!/bin/bash 
# This will be the shared script and we will each work on a seperate function
FILE=/blue/bsc4452/share/Class_Files/data/flights.May2018-April2020.csv
#Question 2: Total flights delayed due to wheather


Wheather_Delay (){
City=$1
LineCount=$(grep \"GNV\".*\"$City\" $FILE | cut -f22 -d',' | wc -l)
WheatherDelay=$((LineCount-1))
echo "There are $WheatherDelay flights to $1 got deplayed due to wheather"

}

Wheather_Delay ATL
Wheather_Delay CLT
Wheather_Delay MIA



FILE=/blue/bsc4452/share/Class_Files/data/flights.May2018-April2020.csv

# question 2: GNV to ATL/CLT/MIA total flights
GNV_to_city (){

echo "total flights muber to $1 is"
city=$1

#flights number
grep \"GNV\".*\"$city\" $FILE | wc -l

return
}
GNV_to_city ATL
GNV_to_city CLT
GNV_to_city MIA


# question 3: Within a function, print a list of all unique airport codes contained in the dataset.

unique_airport_codes () {

echo "the list of all unique airport codes contained in the dataset is:"

#remove header, combine two columns of airport code to one line
sed 1d $FILE | cut -d, -f3,7 |  tr ',' '\n' | sort | uniq

return

}
unique_airport_codes



#Question4: #function to find FL cities that have airports

florida_city_airports () {
#Find FL airports from the origin cities list
cat $FILE | cut -f4,5 -d,  | grep FL | sort | uniq > Origin

#Find FL airports from the destination cities list
cat $FILE | cut -f8,9 -d,  | grep FL | sort | uniq > Dest

#list the unique cities in FL
FLCities=$(paste -d "\n" Origin Dest | sort | uniq)

rm Origin
rm Dest
}
florida_city_airports
echo "Here is the list of the FL cities that have airport:"
echo "$FLCities"

echo "Function florida_city_airports executed."




airport_flight_calculator () {
	echo "Function airport_flight_calculator executed."

}

gainesville_delayed_flights () {
	echo "Function gainesville_delayed_flights executed."
}
