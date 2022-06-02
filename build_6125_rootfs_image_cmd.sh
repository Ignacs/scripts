START=`date`
TARGET=RTF6125VW
echo "Build $TARGET rootfs and image ..."
fileName="build_${TARGET}_rootfs_image_`date +%m%d_%H%M`"
sudo make ASP_MODEL=$TARGET ASP_PROFILE=SEI build_rootfs &> $fileName
sudo make ASP_MODEL=$TARGET ASP_PROFILE=SEI build_image &>> $fileName
ls -al ./targets/$TARGET/SEI/builds/${TARGET}_SEI.image  ~/tftp_folder/${TARGET}_SEI.image

STOP=`date`
echo ""
echo ""
echo "start from $START"
echo "stop at $STOP"
echo "recording in ... " $fileName

# vi $fileName  +/:\ error:
