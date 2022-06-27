START=`date`
echo "Build Ezmesh..."
FINAL_LOG=the_last.log
fileName="build_ezmesh_`date +%m%d_%H%M`"
# TARGET=RTF6125VW
TARGET=RG5125VW

if [ `hostname` == "pve" ]; then
	echo "Cannot run in phyical environment"
	exit 0
fi

if [ -f done ] ; then
	echo '[done] is exist, copy first'
	exit 0
fi

sudo rm -f app/gpl/wifi/qcom/qsdk-spf11.4/done
EZMESH_BUILD=`sudo find app/gpl/wifi/qcom/qsdk-spf11.4/build_dir -name qca-ezmesh-all_g `
# /home/ignacs/lab//app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/target-aarch64-poky-linux_glibc/qca-ezmesh-all_g/install/
for i in $EZMESH_BUILD
do
	echo $i
	sudo rm -rf $i
done
sudo rm -rf app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/host/stamp


find app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/target-aarch64-poky-linux_glibc -name qca-wsplcd-map-g | sudo xargs rm -rf
find app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/target-aarch64-poky-linux_glibc -name qca-whc-lbd-g | sudo xargs rm -rf

# sudo find app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/target-aarch64-poky-linux_glibc -name qca-wsplcd-all-g | xargs sudo rm -rf

###
# sudo make ASP_MODEL=$TARGET ASP_PROFILE=SEI -C app/private/wdwdv3 all &> $fileName
# make ASP_MODEL=$TARGET ASP_PROFILE=SEI ASP_MAX_JOBS=AUTO -C app/private wdwdv3 qcom_ezmesh_install &> $fileName
make ASP_MODEL=$TARGET ASP_PROFILE=SEI ASP_MAX_JOBS=AUTO -C app/private/wdwdv3 qcom_ezmesh_install &> $fileName
# make ASP_MODEL=$TARGET ASP_PROFILE=SEI ASP_MAX_JOBS=AUTO -C app/private dpmd &>> $fileName
###

cp app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/target-aarch64-poky-linux_glibc/qca-ezmesh-all_g/ipkg-aarch64_cortex-a53_neon-vfpv4/qca-ezmesh/usr/sbin/ezmesh  /home/ignacs/tftp_folder
cp app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/target-aarch64-poky-linux_glibc/qca-wsplcd-map-g/wsplcd-map /home/ignacs/tftp_folder
ls -al app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/target-aarch64-poky-linux_glibc/qca-wsplcd-map-g/wsplcd-map
ls -al ~/tftp_folder/wsplcd-map

# cp app/gpl/wifi/qcom/qsdk-spf11.4/qca/src/qca-wsplcd/wsplcd.conf ~/tftp_folder

# rm ./ezlib -rf ; mkdir ./ezlib
# cp ./app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/target-aarch64-poky-linux_glibc/libstorage-g/libstorage.so ./ezlib -rf
# cp ./app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/target-aarch64-poky-linux_glibc/libieee1905-g/libieee1905.so ./ezlib -rf
# cp ./app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/target-aarch64-poky-linux_glibc/libhyficommon-g/libhyficommon.so ./ezlib -rf
# cp ./app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/target-aarch64-poky-linux_glibc/libwpa2-g/libwpa2.so ./ezlib -rf
#
#
#
# cp app/gpl/wifi/qcom/qsdk-spf11.4/build_dir/target-aarch64-poky-linux_glibc/qca-ezmesh-all_g/ipkg-aarch64_cortex-a53_neon-vfpv4/qca-ezmesh-cmn/usr/lib/* ./ezlib -rf
# sudo tar -cf  ezmeshlib.tar ./ezlib
# sudo cp ezmeshlib.tar  ~/tftp_folder

STOP=`date`
echo ""
echo ""
echo ""
echo ""
echo "start from $START"
echo "stop at $STOP"
echo "recording in ... " $fileName

rm $FINAL_LOG
ln -s $fileName $FINAL_LOG
vi $FINAL_LOG  +/:\ error\:

# stop build,  if without copy from working copy
touch done

