#!/bin/sh

function showtime()
{
        time_now=`date`
        echo "[[ $time_now ]]"
}

log_file_name=`date +%y%m%d%H%M`

showtime
if [ "$1" = "-b" ] ; then
        echo "make bsp ..."
        make bsp &> "$log_file_name".bsp.log
        echo "[$log_file_name.bsp.log]"
fi

showtime
echo "make ..."
make &> "$log_file_name".log

showtime

if [ -e $log_file_name.bsp.log ] ; then
        echo "Output to log [$log_file_name.bsp.log]"
fi
make -C models/TEF_RG3110W-D112_16MB_256MB-r221/apps/libstatus/rtfutils/ clean
echo "Output to log [$log_file_name.log]"

BSP_VER=v37.4.12.110

cp models/TEF_RG3110W-D112_16MB_256MB-r221/apps/rc_task/rc_task ~/tftp -f
cp sdk/quantenna-sdk-$BSP_VER/tftp/TEF_RG3110W_16MB_256MB-r221_RG3110W*.img ~/tftp -f

if [ "$1" = "-b" ] ; then
        vi "$log_file_name".bsp.log +/error
fi
# cat "$log_file_name".bsp.log
vi "$log_file_name".log +/"Error 1\n"
# cat "$log_file_name".log




