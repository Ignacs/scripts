#!/bin/bash
LC_FOLDER=/mnt/d/lab/ArcDpoE
RMT_FOLDER=~/lab/arcwrt_for_commit
# ~/lab/arcwrt_for_commit/openwrt/extern/broadcom-bsp-5.04L02p1/userspace/



continueCmp ()
{
	echo -n "continue?(Y/n)"
	read ANSWER
	if [  "n" = "$ANSWER" ] ; then
		echo exit
		exit
	fi
}

#####################################################################################################
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/BCM55030/OamProcessInit.c
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/msgprocess/OamCmdsPro.c
#####################################################################################################

# feeds_addon/package/arcadyan-utility/arc_dpoe/PRV65AX34AB-S-LT/etc/config/dpoe
ARC_DPOE_FILE_LIST="
feeds_addon/package/arcadyan-utility/arc_dpoe/Makefile
feeds_addon/package/arcadyan-utility/arc_dpoe_bin/arc_dpoe/Makefile
feeds_addon/package/arcadyan-utility/arc_dpoe/PRV65AX34AB-S-LT/etc/init.d/arc_dpoe
feeds_addon/package/arcadyan-utility/arc_dpoe/src/inc/dpoe_shared.h
feeds_addon/package/arcadyan-utility/arc_dpoe/src/Makefile
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/Makefile
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/build/Makefile
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/platform/linux/TkOsAlDataInOut.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/common/h/EponDevInfoUtil.h
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/api/TkSdkInitApi.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/dpoe.conf
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/platform/h/TkPlatform.h
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/Rules/impl1/DataPathRules.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/Rules/impl2/DataPathRules.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/inc/cms.h
feeds_addon/package/arcadyan-utility/arc_dpoe/src/inc/os_defs.h
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/DpoeAuth/Ssd.h
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/Rules/impl1/ExtClassification.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/Rules/impl2/ExtClassification.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/apps/eponapp/eponapp.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/DpoeAuth/Ssd.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/MacLearning/MacLearning.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/File/OamDpoeFileCommon.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/FrmProc/OamDpoeFrmProcCommon.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/FrmProc/impl1/OamDpoeFrmProc.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/Sla/OamDpoeSlaCommon.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/Sla/impl1/OamDpoeSla.c
feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/OamDpoeOnu.c
"
#####################################################################################################
# openwrt/extern/broadcom-bsp-5.04L02p1/userspace/public/include/cms.h
# openwrt/extern/broadcom-bsp-5.04L02p1/bcmdrivers/opensource/include/bcm963xx/board.h
# openwrt/extern/broadcom-bsp-5.04L02p1/bcmdrivers/broadcom/include/bcm963xx/bcm_epon_common.h
# openwrt/extern/broadcom-bsp-5.04L02p1/userspace/public/include/linux/os_defs.h
# openwrt/extern/broadcom-bsp-5.04L02p1/data-model/cms-dm-bcm-epon-dpoe.xml
# openwrt/extern/broadcom-bsp-5.04L02p1/userspace/private/libs/mdm_cbk_epon/rcl2_dpoe.c
# openwrt/extern/broadcom-bsp-5.04L02p1/userspace/private/libs/mdm_cbk_epon/stl2_dpoe.c
# openwrt/extern/broadcom-bsp-5.04L02p1/userspace/public/libs/rdk_hal_headers/dpoe_hal.h

#####################################################################################################
# config/PRV65AX34AB-S-LT-5.04L02P1/.config
# project/PRV65AX34AB-S-LT-5.04L02P1/project_patch/package/base-files/files/etc/hotplug.d/arcevt/01-trx-change
#####################################################################################################
FILE_LIST="
project/PRV65AX34AB-S-LT-5.04L02P1/project_patch/extern/broadcom-bsp-5.04L02p1/targets/PRV65AX34AB-S-LT/PRV65AX34AB-S-LT
openwrt_patch/generic_patch/19.07/broadcom-bsp-5.04L02p1/package/base-files/files/etc/hotplug.d/arcevt/01-trx-change
project/PRV65AX34AB-S-LT-5.04L02P1/project_patch/package/base-files/files/etc/uci-project/dpoe
feeds_addon/package/arcadyan-utility/uci-hlp/files/etc/uci.d/post-proc/network.sh
 "



for i in $FILE_LIST
#  for i in $ARC_DPOE_FILE_LIST
do
	RESULT=`cmp   $LC_FOLDER/$i $RMT_FOLDER/$i 2>/dev/null`
	# RESULT=`cmp "$LC_FOLDER/$i" "$RMT_FOLDER/$i" `
	if [ -n "$RESULT"  ]; then
		vimdiff $LC_FOLDER/$i $RMT_FOLDER/$i
		continueCmp
	fi

	if [ ! -e "$RMT_FOLDER/$i" ] ; then
		echo "$RMT_FOLDER/$i  not exist"
		echo "path = $(dirname $RMT_FOLDER/$i)"

		cp $LC_FOLDER/$i $RMT_FOLDER/$i
		cd $(dirname $RMT_FOLDER/$i)
		git add $i
		continueCmp
	fi

done

