#!/usr/bin/env bash

cat once-medio-menor.csv once-prekinder.csv \
	postre-medio-menor.csv postre-prekinder.csv \
	pollo-medio-menor.csv pollo-prekinder.csv \
	vacuno-medio-menor.csv vacuno-prekinder.csv \
	pescado-medio-menor.csv pescado-prekinder.csv \
	plato-fondo-medio-menor.csv plato-fondo-prekinder.csv \
	| ./parse_serving.sh \
	| sort -u
