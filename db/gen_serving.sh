#!/usr/bin/env bash

cat once-medio-menor.csv once-prekinder.csv \
	| ./parse_serving.sh \
	| sort -u
