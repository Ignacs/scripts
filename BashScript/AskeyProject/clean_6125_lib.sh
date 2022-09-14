FINAL_LOG=the_last.log
TARGET=RTF6125VW
fileName=clean_${TARGET}_lib_`date +%m%d_%H%M`
echo "clean $TARGET lib..."
sudo make ASP_MODEL=$TARGET ASP_PROFILE=SEI clean_lib 

echo ""
echo ""
echo ""
echo "recording in ... " $fileName
rm $FINAL_LOG
ln -s $fileName $FINAL_LOG
vi $FINAL_LOG  +/:\ error:
