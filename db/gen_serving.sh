#!/usr/bin/env bash

cat serving-once-mediomenor.csv serving-once-prekinder.csv \
	serving-postre-mediomenor.csv serving-postre-prekinder.csv \
	serving-pollo-mediomenor.csv serving-pollo-prekinder.csv \
	serving-vacuno-mediomenor.csv serving-vacuno-prekinder.csv \
	serving-pescado-mediomenor.csv serving-pescado-prekinder.csv \
	serving-platofondo-mediomenor.csv serving-platofondo-prekinder.csv \
	serving-ensalada-mediomenor.csv serving-ensalada-prekinder.csv \
	| ./parse_serving.sh \
	| sort -u
