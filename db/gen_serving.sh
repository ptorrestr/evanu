#!/usr/bin/env bash

cat once-medio-menor.csv once-prekinder.csv \
	postre-medio-menor.csv postre-prekinder.csv \
	pollo-medio-menor.csv pollo-prekinder.csv \
	| ./parse_serving.sh \
	| sort -u
