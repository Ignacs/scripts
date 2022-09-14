FINAL_LOG=the_last.log
TARGET=RTF6125VW
fileName=clean_${TARGET}_app_`date +%m%d_%H%M`
echo "clean $TARGET app..."
# sudo make ASP_MODEL=$TARGET ASP_PROFILE=SEI clean_app
sudo make ASP_MODEL=$TARGET ASP_PROFILE=SEI clean -C app/private/dpmd &> $fileName

echo "But dpmd only"

echo ""
echo ""
echo ""
echo "recording in ... " $fileName
rm $FINAL_LOG
ln -s $fileName $FINAL_LOG
vi $FINAL_LOG  +/:\ error:
