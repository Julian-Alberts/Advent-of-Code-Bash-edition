#!/bin/bash
cat $1 | sed 's/[A|X]/R/g' | sed 's/[B|Y]/P/g' | sed 's/[C|Z]/S/g'
