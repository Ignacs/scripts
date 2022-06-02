#!/bin/bash
START=$(date +%s)
TARGET=RTF6125VW
PROFILE=SEI
echo "build $PROFILE on $TARGET..."
OUTPUT_FILE="build_${TARGET}_${PROFILE}_`date +%m%d_%H%M`"
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
    make ASP_MODEL=$TARGET ASP_PROFILE=${PROFILE} $max_jobs $@ &> $OUTPUT_FILE

else
	sudo rm -rf app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/host/stamp
	sudo find app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/target-aarch64-poky-linux_glibc -name qca-wsplcd-map-g | xargs sudo rm -rf

	sudo make ASP_MODEL=$TARGET ASP_PROFILE=${PROFILE} ASP_MAX_JOBS=AUTO build_kernel build_kmodule &> $OUTPUT_FILE &&
	sudo make ASP_MODEL=$TARGET ASP_PROFILE=${PROFILE} ASP_MAX_JOBS=AUTO -C lib/ gpl_lib public_lib private_lib &> $OUTPUT_FILE &&
	sudo make ASP_MODEL=$TARGET ASP_PROFILE=${PROFILE} -C app/gpl/ samba iproute2 &> $OUTPUT_FILE &&
	# sudo make ASP_MODEL=$TARGET ASP_PROFILE=${PROFILE} ASP_MAX_JOBS=AUTO -C app/private/wdwdv3 qcom_related_install qcom_ezmesh_install qcom_related &> $OUTPUT_FILE &&
	# sudo make ASP_MODEL=$TARGET ASP_PROFILE=${PROFILE} ASP_MAX_JOBS=AUTO -C app/private/wdwdv3 qcom_related &> $OUTPUT_FILE &&
	# sudo make ASP_MODEL=$TARGET ASP_PROFILE=${PROFILE} ASP_MAX_JOBS=AUTO -C app/private/wdwdv3 qcom_related_install ezmesh_install &> $OUTPUT_FILE &&
	sudo make ASP_MODEL=$TARGET ASP_PROFILE=${PROFILE} ASP_MAX_JOBS=AUTO -C app/private/wdwdv3 qcom_related_install &> $OUTPUT_FILE &&
	sudo make ASP_MODEL=$TARGET ASP_PROFILE=${PROFILE} -C app/private/ msg-simulator decodepcap &> $OUTPUT_FILE&&
	sudo make ASP_MODEL=$TARGET ASP_PROFILE=${PROFILE} -C lib/public/open/ libnl &> $OUTPUT_FILE &&
	sudo make ASP_MODEL=$TARGET ASP_PROFILE=${PROFILE} ASP_MAX_JOBS=AUTO all &> $OUTPUT_FILE
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

vi $LAST_LOG +/:\ error:


# generating done file,  to prevent build without syncing
touch done
