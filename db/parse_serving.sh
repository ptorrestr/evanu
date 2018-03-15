#!/usr/bin/env bash

awk -F "," '
BEGIN{
	currrent_key = ""
}
{
	id = $1
	gsub(/[ \t]+$/, "", id)
	gsub(/[[:space:]]/,"_", id)
	gsub(/\//,"_", id)
	gsub(/\./,"_", id)
	gsub(/%/,"_", id)
	gsub(/á/,"a", id)
	gsub(/é/,"e", id)
	gsub(/í/,"i", id)
	gsub(/ó/,"o", id)
	gsub(/ú/,"u", id)
	gsub(/ñ/,"n", id)
	if ( current_key == "" ) {
    current_key = id
  }
	else {
		if ( id != "TOTAL") {
			if ( id != "" ) {
				id = tolower(id)
				weight = $3
				gsub(/\./,"_", weight)
				if ( $3 != "" && $4 != "" ) {
					uni = $4
					if ( uni == "ml" ) {
						uni = "cc"
					}
					print id"_"weight uni" = Serving.create!(net_weight:"$3", unit:\""uni"\", food:"id")"
				}
			}
		} else {
			current_key = ""
		}
	}
}'  
