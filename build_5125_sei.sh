#!/bin/bash
START=$(date +%s)
TARGET=RG5125VW
echo "build $TARGET..."
OUTPUT_FILE="build_${TARGET}_`date +%m%d_%H%M`"
LAST_LOG=the_last.log

if [ -f done ] ; then
	echo '[done] is exist, copy first'
	exit 0
fi

if [ $# -gt 0 ]; then
    max_jobs="ASP_MAX_JOBS=AUTO"
    if [ $1 -eq 1 ]; then
        max_jobs=""
        shift
    fi
    make ASP_MODEL=$TARGET ASP_PROFILE=SEI $max_jobs $@ &> $OUTPUT_FILE

else
    make ASP_MODEL=$TARGET ASP_PROFILE=SEI ASP_MAX_JOBS=AUTO build_kernel build_kmodule &> $OUTPUT_FILE &&
    make ASP_MODEL=$TARGET ASP_PROFILE=SEI ASP_MAX_JOBS=AUTO -C lib/ gpl_lib public_lib private_lib &> $OUTPUT_FILE &&
    make ASP_MODEL=$TARGET ASP_PROFILE=SEI -C app/gpl/ samba iproute2 &> $OUTPUT_FILE &&
    make ASP_MODEL=$TARGET ASP_PROFILE=SEI ASP_MAX_JOBS=AUTO -C app/private/wdwdv3 qcom_related &> $OUTPUT_FILE &&
    make ASP_MODEL=$TARGET ASP_PROFILE=SEI -C app/private/ msg-simulator decodepcap &> $OUTPUT_FILE&&
    make ASP_MODEL=$TARGET ASP_PROFILE=SEI -C lib/public/open/ libnl &> $OUTPUT_FILE &&
    make ASP_MODEL=$TARGET ASP_PROFILE=SEI ASP_MAX_JOBS=AUTO all &> $OUTPUT_FILE
fi

END=$(date +%s)
echo ""
echo "output to [$OUTPUT_FILE]"

rm -f $LAST_LOG
ln -s $OUTPUT_FILE $LAST_LOG

# cp ./targets/$TARGET/SEI/builds/${TARGET}_SEI.image  ~/tftp_folder
# ls -al ./targets/$TARGET/SEI/builds/${TARGET}_SEI.image  ~/tftp_folder/${TARGET}_SEI.image
$PWD/local_cp_image_tftp.sh


echo $((END-START)) | awk '{printf "[Build Time] %02d:%02d:%02d\n", $1/3600, ($1/60)%60, $1%60}'

vi $LAST_LOG +/rror

# generating done file,  to prevent build without syncing
touch done
