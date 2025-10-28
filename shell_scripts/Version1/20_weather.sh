#!/bin/bash

# Ask for city name
read -p "Enter city name: " CITY

# Fetch and display weather (one-line summary)
curl -s "https://wttr.in/${CITY}?format=3"
