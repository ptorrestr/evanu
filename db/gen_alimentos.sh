#!/usr/bin/env bash

cat ./alimentos.csv | awk -F "," '
{if (substr($0,1,1) !~ /^#/) {
	id = $1
	sub(/[[:space:]]/,"_", id)
  sub(/\//,"_", id)
	sub(/á/,"a", id)
	sub(/é/,"e", id)
	sub(/í/,"i", id)
	sub(/ó/,"o", id)
	sub(/ú/,"u", id)
	if ($7 == "") {
		print id" = Food.create!(name:\""$1"\",proteins:"$3",carbohydrates:"$4",fibre:"$5",lipids:"$6",saturated_fat:0)"
	}
	else {	
		print id" = Food.create!(name:\""$1"\",proteins:"$3",carbohydrates:"$4",fibre:"$5",lipids:"$6",saturated_fat:0,price:"$7")"
	}
} 
}'
