START=`date`
TARGET=RTF6125VW
ACTION=clean
echo "$ACTION $TARGET All..."
fileName="${ACTION}_${TARGET}_all_`date +%m%d_%H%M`"

sudo make ASP_MODEL=$TARGET ASP_PROFILE=SEI $ACTION  &> $fileName

END=`date`

echo ""
echo ""
echo ""
echo "start from $BEGIN"
echo "stop at $END"
echo "recording in ... " $fileName
