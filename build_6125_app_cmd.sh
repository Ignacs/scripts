START=`date`
FINAL_LOG=the_last.log
TARGET=RTF6125VW
echo "Build $TARGET Application..."
fileName="build_$TARGET_app_`date +%m%d_%H%M`"
# make -C app/gpl/ppp-2.4.7/ clean
# sudo time make ASP_MODEL=$TARGET ASP_PROFILE=SEI -C app/gpl ppp clean &> $fileName
# sudo time make ASP_MODEL=$TARGET ASP_PROFILE=SEI clean_app &> $fileName
# sudo time make ASP_MODEL=$TARGET ASP_PROFILE=SEI build_app &> $fileName
# sudo time make ASP_MODEL=$TARGET ASP_PROFILE=SEI -C app/private wdwdv3 clean &>> $fileName
# sudo time make ASP_MODEL=$TARGET ASP_PROFILE=SEI -C app/private wdw_util clean &>> $fileName
# sudo time make ASP_MODEL=$TARGET ASP_PROFILE=SEI -C app/private dpmd clean &>> $fileName
# sudo time make ASP_MODEL=$TARGET ASP_PROFILE=SEI wdwdv3 wdv_util dpmd &>> $fileName
sudo time make ASP_MODEL=$TARGET ASP_PROFILE=SEI -C app/gpl ppp &> $fileName

STOP=`date`
echo ""
echo ""
echo ""
echo ""
echo "start from $START"
echo "stop at $STOP"
echo "recording in ... " $fileName

cp app/gpl/ppp-2.4.7/pppd/pppd ~/tftp_folder
# cp app/gpl/ppp-2.4.7/pppd/plugins/rp-pppoe/rp-pppoe.so ~/tftp_folder
# cp app/gpl/ppp-2.4.7/pppd/plugins/rp-pppoe/lcp_echo_monitor ~/tftp_folder

ls -al app/gpl/ppp-2.4.7/pppd/pppd
ls -al ./targets/RTF6125VW/SEI/builds/fs/bin/pppd
ls -al ./targets/RTF6125VW/SEI/builds/rootfs/bin/pppd


rm $FINAL_LOG
ln -s $fileName $FINAL_LOG
vi $FINAL_LOG  +/:\ error:
