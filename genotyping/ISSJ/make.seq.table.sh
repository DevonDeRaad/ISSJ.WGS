#I ran this in the stats output directory to make a single csv spreadsheet summarizing depth of coverage and mapping percentage

echo samp,DOC,breadth,map.perc > allsamps.covsummary.csv

for f in *.stats; do
    printf "%s" "$(head -n 1 $f)" >> allsamps.covsummary.csv
    printf "," >> allsamps.covsummary.csv
    printf "%s" "$(head -n 3 $f | tail -n 1)" >> allsamps.covsummary.csv
    printf "," >> allsamps.covsummary.csv
    printf "%s" "$(head -n 5 $f | tail -n 1)" >> allsamps.covsummary.csv
    printf "," >> allsamps.covsummary.csv
    printf "%s\n" "$(awk -F'[()%]' '/mapped/{print $2}' $f | head -n 1)" >> allsamps.covsummary.csv
done
