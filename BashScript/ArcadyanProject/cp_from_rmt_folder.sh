#!/bin/sh
# MNT_FOLDER=~/mnt/96_2/arcwrt4/
MNT_FOLDER=~/mnt/96_2/arcwrt10/
LCL_FOLDER=.
# feeds_addon/package/arcadyan-utility/arc_hello_world/src/arc_hello_world.c
# feeds_addon/package/arcadyan-utility/arc_hello_world/src/Makefile
# feeds_addon/package/arcadyan-utility/arc_hello_world/Makefile
# feeds_addon/package/arcadyan-utility/hal/src/broadcom-bsp-5.04L02p1/hal.c
# feeds_addon/package/arcadyan-utility/arc_hello_world/files/arc_hello_world.init
# feeds_addon/package/arcadyan-utility/hal/src/broadcom-bsp-5.04L02p1/extension.c
# ./feeds_addon/package/arcadyan-utility/lib-arc-dm/src/arc-extension.xml
# feeds_addon/package/arcadyan-utility/hal/src/broadcom-bsp-5.04L02p1/extension.h
# feeds_addon/package/arcadyan-utility/arc_dpoe_bin/arc_dpoe/Makefile
# feeds_addon/package/arcadyan-utility/arc_dpoe/PRV65AX34AB-S-LT/etc/config/dpoe
# feeds_addon/package/arcadyan-utility/arc_dpoe/PRV65AX34AB-S-LT/etc/init.d/arc_dpoe
# feeds_addon/package/arcadyan-utility/arc_dpoe/Makefile
# openwrt/extern/broadcom-bsp-5.04L02p1/userspace/private/libs/mdm_cbk_epon/stl2_dpoe.c
# openwrt/extern/broadcom-bsp-5.04L02p1/userspace/private/libs/mdm_cbk_epon/rcl2_dpoe.c
# openwrt/extern/broadcom-bsp-5.04L02p1/userspace/public/libs/rdk_hal_headers/dpoe_hal.h
# openwrt/extern/broadcom-bsp-5.04L02p1/data-model/cms-dm-bcm-epon-dpoe.xml
# config/PRV65AX34AB-S-LT-5.04L02P1/.config
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/platform/linux/TkOsAlDataInOut.c
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/api/TkSdkInitApi.c
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/common/h/EponDevInfoUtil.h
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/platform/h/TkPlatform.h
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/Rules/impl2/DataPathRules.c
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/Rules/impl1/DataPathRules.c
# openwrt/extern/broadcom-bsp-5.04L02p1/userspace/public/include/cms.h
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/inc/os_defs.h
# openwrt/extern/broadcom-bsp-5.04L02p1/userspace/public/include/linux/os_defs.h
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/inc/cms.h
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/Rules/impl2/ExtClassification.c
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/Rules/impl1/ExtClassification.c
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/DpoeAuth/Ssd.h
# openwrt/extern/broadcom-bsp-5.04L02p1/bcmdrivers/broadcom/include/bcm963xx/bcm_epon_common.h
# ./feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/File/OamDpoeFileCommon.c
# ./feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/FrmProc/OamDpoeFrmProcCommon.c
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/FrmProc/impl1/OamDpoeFrmProc.c
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/Sla/OamDpoeSlaCommon.c
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/If/Oam/Dpoe/Sla/impl1/OamDpoeSla.c
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/DpoeAuth/Ssd.c
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/Makefile
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/Makefile
# feeds_addon/package/arcadyan-utility/arc_dpoe/src/libs/eponsdk/oamprocess/App/MacLearning/MacLearning.c
# openwrt/extern/broadcom-bsp-5.04L02p1/targets/PRV65AX34AB-S-LT/PRV65AX34AB-S-LT
# ./openwrt/extern/broadcom-bsp-5.04L02p1/bcmdrivers/opensource/include/bcm963xx/board.h
# ./feeds_addon/package/arcadyan-utility/arc_dpoe/src/inc/dpoe_shared.h
# ./project/PRV65AX34AB-S-LT-5.04L02P1/project_patch/extern/broadcom-bsp-5.04L02p1/targets/PRV65AX34AB-S-LT/PRV65AX34AB-S-LT

# ./openwrt/package/base-files/files/etc/hotplug.d/arcevt/01-trx-change
# ./project/PRV65AX34AB-S-LT-5.04L02P1/project_patch/package/base-files/files/etc/hotplug.d/arcevt/01-trx-change
# ./feeds_addon/package/arcadyan-utility/uci-hlp/files/etc/uci.d/post-proc/network.sh
FILE_LIST="
./openwrt_patch/generic_patch/19.07/broadcom-bsp-5.04L02p1/package/base-files/files/etc/hotplug.d/arcevt/01-trx-change
"
# src/libs/eponsdk/oamprocess/BCM55030/OamProcessInit.c
# src/libs/eponsdk/msgprocess/OamCmdsPro.c
# src/libs/eponsdk/oamprocess/If/Oam/Dpoe/OamDpoeOnu.c
#src/libs/eponsdk/oamprocess/BCM55030/OamProcessInit.c
# ./src/apps/eponapp/eponapp.c
# src/dpoe.conf
FILE_LIST_FROM_LOCAL_FOLDER="
"


for i in $FILE_LIST
do
	FOLDER_PATH=`dirname $i`

	mkdir -p $LCL_FOLDER/$FOLDER_PATH
	echo "mkdir $LCL_FOLDER/$FOLDER_PATH"

	echo "sour4c $MNT_FOLDER/$i"
	echo "dst $LCL_FOLDER/$i"
	vimdiff $MNT_FOLDER/$i $LCL_FOLDER/$i
	git add $LCL_FOLDER/$i

done


LCL_SOURCE_FOLDER=/mnt/d/lab/arc_dpoe/
RPOJ_PATH="feeds_addon/package/arcadyan-utility/arc_dpoe/"

for i in $FILE_LIST_FROM_LOCAL_FOLDER
do
	FOLDER_PATH=`dirname $i`

	mkdir -p $LCL_FOLDER/$RPOJ_PATH/$FOLDER_PATH
	echo "mkdir $LCL_FOLDER/$RPOJ_PATH/$FOLDER_PATH"

	echo "sour4c $LCL_SOURCE_FOLDER/$i"
	echo "dst $LCL_FOLDER/$RPOJ_PATH/$i"
	vimdiff $LCL_SOURCE_FOLDER/$i $LCL_FOLDER/$RPOJ_PATH/$i
	git add $LCL_FOLDER/$RPOJ_PATH/$i
	echo $LCL_FOLDER/$RPOJ_PATH/$i > git_ci_list

done
