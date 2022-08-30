#! /bin/sh

IMG="d300/ub14:v001"
HOST=""
if [ $# -eq 0 ]; then
    echo "1=RTF61XX, 2=RTF81XX, 3=RTF35XX, 4=RG3110W, 5=QSR5GA_AX, 6=MDM9635"
    echo -n "Which project? "
    read prj

    if   [ "$prj" == "1" ]; then
        PRJ="RTF61XX"
    elif [ "$prj" == "2" ]; then
        PRJ="RTF81XX"
    elif [ "$prj" == "3" ]; then
        PRJ="RTF35XX"
    elif [ "$prj" == "4" ]; then
        PRJ="RG3110W"
    elif [ "$prj" == "5" ]; then
        PRJ="QSR5GA_AX"
    elif [ "$prj" == "6" ]; then
        PRJ="MDM9635"
        IMG="d300/ub12:v001"
        HOST="--add-host bitbucket.askey.com.tw:10.1.6.85"
    else
        echo -e "\nWrong answer!"
        exit 0
    fi
else
    PRJ=$1
fi

NAME=${USER}_${PRJ}
CT=`docker ps -a | grep ${USER} | grep ${PRJ}`
if [ "$CT" == "" ]; then
    echo "Start new container..."
    docker run --user ${USER} --name ${NAME} -t -e LANG=C.UTF-8 -e ASKEY_PRJ=${PRJ} -v /home/${USER}:/home/${USER} -w /home/${USER} ${HOST} -i ${IMG} /bin/bash
else
	echo "${PRJ} is already running by ${USER}, attach or create another one?"
	echo "a/c? "
    read action
    if [ "$action" == "a" ]; then
        docker attach ${NAME}
	else
		echo "postfix Name? "
		read POST_NAME
		docker run --user ${USER} --name ${NAME}_${POST_NAME} -t -e LANG=C.UTF-8 -e ASKEY_PRJ=${PRJ} -v /home/${USER}:/home/${USER} -w /home/${USER} ${HOST} -i ${IMG} /bin/bash
	fi
fi
