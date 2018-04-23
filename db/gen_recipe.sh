#!/usr/bin/env bash

./parse_recipe.sh \
	| sort -u 
	#| awk -F " " '{print $1}'
