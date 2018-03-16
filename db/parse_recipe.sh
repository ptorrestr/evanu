#!/usr/bin/env bash

gawk -F "," '
function basename(file, a, n) {
  n = split(file, a, "/")
	return a[n]
}
function level(name) {
	n = split(name, a, "-")
	lev = a[3]
	switch (lev) {
	case "mediomenor.csv":
		b = "lowmiddlelevel"
		break
	case "prekinder.csv":
		b = "prekinder"
		break
	default:
		b = "asdf"
		break
	}
	return b
}
function category(name) {
	n = split(name, a, "-")
	cat = a[2]
	switch (cat) {
	case "once":
		b = "snack"
		break
	case "postre":
		b = "dessert"
		break
	case "pollo":
		b = "poultry"
		break
	case "vacuno":
		b = "beef"
		break
	case "pescado":
		b = "fish"
		break
	case "platofondo":
		b = "other"
		break
	case "ensalada":
		b = "salad"
		break
	case "pure":
		b = "mashed"
		break
	default:
		b = "asd"
		break
	}
	return b
}
BEGIN{
	currrent_key = ""
}
{
	id = $1
	name = $1
	gsub(/[ \t]+$/, "", id)
	gsub(/[[:space:]]/,"_", id)
	gsub(/\//,"_", id)
	gsub(/\./,"_2", id)
	gsub(/\(/,"_", id)
	gsub(/\)/,"_", id)
	gsub(/%/,"_", id)
	gsub(/á/,"a", id)
	gsub(/é/,"e", id)
	gsub(/í/,"i", id)
	gsub(/ó/,"o", id)
	gsub(/ú/,"u", id)
	gsub(/ñ/,"n", id)
	if ( current_key == "" ) {
    current_key = id
		current_name = name
	}
	else {
		if ( id == "TOTAL") {
			print tolower(current_key)" = Recipe.create!(name:\""current_name"\",category:"category(basename(FILENAME))",level:"level(basename(FILENAME))")"
			current_key = ""
		}
	}
}'  serving-*.csv
