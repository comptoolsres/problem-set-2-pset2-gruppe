#Within a function list the cities in Florida that have airports in the dataset. 
#(2 points)Within a function list the cities in Florida that have airports in the dataset. (2 points)
FILE=/blue/bsc4452/share/Class_Files/data/flights.May2018-April2020.csv
#function to find FL cities that have airports
florida_city_airports () {

#Find FL airports from the origin cities list
cat /blue/bsc4452/share/Class_Files/data/flights.1K.csv | cut -f4,5 -d,  | grep FL | sort | uniq > Origin

#Find FL airports from the destination cities list
cat /blue/bsc4452/share/Class_Files/data/flights.1K.csv | cut -f8,9 -d,  | grep FL | sort | uniq > Dest

#list the unique cities in FL
FLCities=$(paste -d "\n" Origin Dest | sort | uniq)

}

florida_city_airports
rm Origin
rm Dest
echo "$FLCities"
echo "Function florida_city_airports executed."

