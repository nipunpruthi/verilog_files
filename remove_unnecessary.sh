#! /use/bin/env bash
find . \(  -name "*.aux" -o  -name "*.log" -o  -name "*~" -l -name "*.jou" \) -type f -delete 

