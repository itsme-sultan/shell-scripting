#!/bin/bash

#Take log file as an argument
log_file=$1

#Exit the script if argument not found.
if [ $# -eq 0 ]; then
	echo "Usage : $0 <log_file> "
	exit
fi

#exit the script if log file not found.
if [ ! -f $log_file ]; then
	echo "Log file does not exist."
	exit 1
fi

summary_report() {

echo "Date of analysis : $(date +%Y-%m-%d)"
echo ""
echo "Log file name : $log_file"
echo ""

total_line=$(wc -l $log_file)
echo "Total line proccessed : $total_line "


echo""

error_count() {
	echo "----Error/Failed count----"
	echo 
	local count=$(grep -icE "ERROR|FAILED" $log_file)
	echo "Total error count : $count ."
}

error_count



#top 5 most common error

echo ""
echo "-----Top 5 most common error------"

grep -i "ERROR" $log_file | awk '{$1=$2=$3""; print}' |sort | uniq -c |sort -rn |head -5


critical_event() {
	echo #blannk line
	echo "---Critical Events---"
	grep -n "CRITICAL" $log_file 
}

critical_event

}

summary_report |tee log_report_$(date +%Y-%m-%d).txt
echo ""
echo "-----Summary_report generated successfully----"
echo ""

archive() {
	if [ ! -d ~/archive ];then
		mkdir ~/archive
	fi
mv $log_file ~/archive

echo "log file archived successfully."
}

archive
