#!/bin/sh
MNT_FOLDER=~/mnt/96_2/arcwrt10
#MNT_FOLDER=~/mnt/96_2/arcwrt_68360_1
LCL_FOLDER=.
# feeds_addon/package/arcadyan-utility/arc_hello_world
# openwrt/extern/broadcom-bsp-5.04L02p1/targets/PRV33AX44AB-B-ZZ/PRV33AX44AB-B-ZZ
# RSYNC_LIST="
#./project/PRV65AX34AB-S-LT-5.04L02P1/project_patch/extern/broadcom-bsp-5.04L02p1/targets/PRV65AX34AB-S-LT/PRV65AX34AB-S-LT
#config/PRV65AX34AB-S-LT-5.04L02P1/.config
#"
RSYNC_LIST=`cat rsync_list`



FILE_LIST="
feeds_addon/package/arcadyan-utility/arc_dpoe/PRV65AX34AB-S-LT/etc/config/dpoe
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/platform/linux/TkOsAlDataInOut.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/api/TkSdkInitApi.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/common/h/EponDevInfoUtil.h
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/platform/h/TkPlatform.h
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/Rules/impl2/DataPathRules.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/Rules/impl1/DataPathRules.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/inc/cms.h
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/Rules/impl2/ExtClassification.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/Rules/impl1/ExtClassification.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/DpoeAuth/Ssd.h
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/File/OamDpoeFileCommon.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/FrmProc/OamDpoeFrmProcCommon.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/FrmProc/impl1/OamDpoeFrmProc.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/Sla/OamDpoeSlaCommon.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/Sla/impl1/OamDpoeSla.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/DpoeAuth/Ssd.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/Makefile
feeds_addon/package/arcadyan-utility/arc_dpoe/src/Makefile
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/MacLearning/MacLearning.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/BCM55030/OamProcessInit.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/msgprocess/OamCmdsPro.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/OamDpoeOnu.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/apps/eponapp/eponapp.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/dpoe.conf
./feeds_addon/package/arcadyan-utility/uci-hlp/files/etc/uci.d/post-proc/network.sh
"

FILE_LIST=`cat ./file_list`

continueCmp ()
{
	echo -n "continue?(Y/n)"
	read ANSWER
	if [  "n" = "$ANSWER" ] ; then
		echo exit
		exit
	fi
}

gitDiffInFolder ()
{
	FdPath=$(dirname $1)
	cd $MNT_FOLDER/$FdPath
	echo "["$PWD"]"

    echo "git diff  [" $1  "]"
	sudo git difftool --tool=vimdiff $(basename $1)
	cd -
	continueCmp

}

ACTION="git diff"
# ACTION=vimdiff

cd $MNT_FOLDER
echo "move to " $PWD



for i in $FILE_LIST
do
	gitDiffInFolder $i
done


for i in $RSYNC_LIST
do
	gitDiffInFolder $i
done



# FILE_LIST_TO_DEF="
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/inc/os_defs.h
# "
# for i in $FILE_LIST_TO_DEF
# do
# 	rm $MNT_FOLDER/$i
# done




