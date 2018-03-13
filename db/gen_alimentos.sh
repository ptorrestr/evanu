#!/usr/bin/env bash

cat ./alimentos.csv | awk -F "," '
{if (substr($0,1,1) !~ /^#/) {
  if ($7 == "") {
		print "Food.create!(name:\""$1"\",proteins:"$3",carbohydrates:"$4",fibre:"$5",lipids:"$6",saturated_fat:0)"
	}
	else {	
		print "Food.create!(name:\""$1"\",proteins:"$3",carbohydrates:"$4",fibre:"$5",lipids:"$6",saturated_fat:0,price:"$7")"
	}
} 
}'
