#!/usr/bin/env bash

cat ./alimentos.csv | awk -F "," '
{if (substr($0,1,1) !~ /^#/) {
	id = $1
	gsub(/[ \t]$/, "", id)
	gsub(/[[:space:]]/,"_", id)
  gsub(/\//,"_", id)
	gsub(/%/,"_", id)
	gsub(/\./,"_", id)
	gsub(/á/,"a", id)
	gsub(/é/,"e", id)
	gsub(/í/,"i", id)
	gsub(/ó/,"o", id)
	gsub(/ú/,"u", id)
	gsub(/ñ/,"n", id)
	id = tolower(id)
	if ($7 == "") {
		print id" = Food.create!(name:\""$1"\",proteins:"$3",carbohydrates:"$4",fibre:"$5",lipids:"$6",saturated_fat:0)"
	}
	else {	
		print id" = Food.create!(name:\""$1"\",proteins:"$3",carbohydrates:"$4",fibre:"$5",lipids:"$6",saturated_fat:0,price:"$7")"
	}
} 
}' | sort -u
