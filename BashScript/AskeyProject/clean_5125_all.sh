START=`date`
TARGET=RG5125VW
ACTION=clean
echo "$ACTION $TARGET All..."
fileName="$ACTION_${TARGET}_all_`date +%m%d_%H%M`"

sudo time make ASP_MODEL=$TARGET ASP_PROFILE=SEI $ACTION  &> $fileName

END=`date`
echo ""
echo ""
echo ""
echo "start from $BEGIN"
echo "stop at $END"
echo "recording in ... " $fileName
