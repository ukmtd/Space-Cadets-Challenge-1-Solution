#!/bin/bash

webpage=$(curl -s --compressed -L https://southampton.ac.uk/people/$1)

personInfoStart=$(echo "$webpage" | grep -n '"@type": "Person"' | cut -d: -f1)

personInfo=$(echo "$webpage" | sed -n "$((personInfoStart+1)),$((personInfoStart+14))p")

getDataItem() {
	echo "$personInfo" | grep -i $1 | sed "s/\"//g" | sed "s/,//g"
}

getDataItem "Name"
getDataItem "email"
getDataItem "telephone"
