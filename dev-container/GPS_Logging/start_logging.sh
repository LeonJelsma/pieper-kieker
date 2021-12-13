function start_logging {
	FILE="gps_data_$(date '+%d-%m-%Y_%H:%M')"
	EXT=.txt
	ARG1=$1

	if [ $ARG1 -eq 0 ]; then
		FILE="$FILE$EXT"
	else
		echo "Bonk"
		FILE="${FILE}_${ARG1}${EXT}"
	fi

	if [ -f "$FILE" ]; then
		ARG1=$(($ARG1+1))
		echo "$ARG1"
		start_logging $ARG1
		return
	fi

	touch "$FILE"
	rostopic echo gps_base/fix > "$FILE"
}

start_logging 0
