#!/bin/sh
MNT_FOLDER=~/mnt/96_2/arcwrt10
#MNT_FOLDER=~/mnt/96_2/arcwrt_68360_1
LCL_FOLDER=.
# feeds_addon/package/arcadyan-utility/arc_hello_world
# openwrt/extern/broadcom-bsp-5.04L02p1/targets/PRV33AX44AB-B-ZZ/PRV33AX44AB-B-ZZ
RSYNC_LIST="
./project/PRV65AX34AB-S-LT-5.04L02P1/project_patch/extern/broadcom-bsp-5.04L02p1/targets/PRV65AX34AB-S-LT/PRV65AX34AB-S-LT
config/PRV65AX34AB-S-LT-5.04L02P1/.config
"
PROJ_FILE_LIST="
"

FILE_LIST="
feeds_addon/package/arcadyan-utility/arc_dpoe/src/inc/dpoe_shared.h
feeds_addon/package/arcadyan-utility/arc_dpoe/Makefile
feeds_addon/package/arcadyan-utility/arc_dpoe/PRV65AX34AB-S-LT/etc/config/dpoe
feeds_addon/package/arcadyan-utility/arc_dpoe/PRV65AX34AB-S-LT/etc/init.d/arc_dpoe
feeds_addon/package/arcadyan-utility/arc_dpoe/src/inc/os_defs.h
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
feeds_addon/package/arcadyan-utility/uci-hlp/files/etc/uci.d/post-proc/network.sh
project/PRV65AX34AB-S-LT-5.04L02P1/project_patch/package/base-files/files/etc/hotplug.d/arcevt/01-trx-change
project/PRV65AX34AB-S-LT-5.04L02P1/project_patch/package/base-files/files/etc/hotplug.d/arcevt/01-trx-change
project/PRV65AX34AB-S-LT-5.04L02P1/project_patch/package/base-files/files/etc/uci-project/dpoe

"

continueCmp ()
{
	echo -n "continue?(Y/n)"
	read ANSWER
	if [  "n" = "$ANSWER" ] ; then
		echo exit
		exit
	fi
}

ACTION=cp
# ACTION=cmp
# ACTION=vimdiff

# prepare list for WSL permission workaround
rm $MNT_FOLDER/cp_list

for i in $FILE_LIST
do

	echo $i >> $MNT_FOLDER/cp_list
	RESULT=`cmp   $LCL_FOLDER/$i $MNT_FOLDER/$i 2>/dev/null`
	if [ -n "$RESULT" ]; then
		$ACTION $LCL_FOLDER/$i $MNT_FOLDER/$i
		# continueCmp
	fi
done

for i in $FILE_LIST
do

	echo $i >> $MNT_FOLDER/cp_list
	RESULT=`cmp   $LCL_FOLDER/$i $MNT_FOLDER/$i 2>/dev/null`
	if [ -n "$RESULT" ]; then
		$ACTION $LCL_FOLDER/$i $MNT_FOLDER/$i
		# continueCmp
	fi
done


for i in $PROJ_FILE_LIST
do
	# rsync $LCL_FOLDER/$i $MNT_FOLDER/$i
	RESULT=`cmp   $LCL_FOLDER/$i $MNT_FOLDER/$i 2>/dev/null`
	if [ -n "$RESULT" ]; then
		vimdiff  $LCL_FOLDER/$i $MNT_FOLDER/$i
		continueCmp
	fi
done



# FILE_LIST_TO_DEF="
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/inc/os_defs.h
# "
# for i in $FILE_LIST_TO_DEF
# do
# 	rm $MNT_FOLDER/$i
# done



# remove build-lock
rm $MNT_FOLDER/done

