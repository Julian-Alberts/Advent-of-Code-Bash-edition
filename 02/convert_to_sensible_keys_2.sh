#!/bin/bash
cat $1 | sed 's/A/R/g' | sed 's/B/P/g' | sed 's/C/S/g' | sed 's/X/L/g' | sed 's/Y/D/g' | sed 's/Z/W/g'
