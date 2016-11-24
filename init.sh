#!/bin/bash
CURRENT_PATH=$(pwd);
ROOT_PATH=$(cd `dirname $0`/../; pwd);
cd $CURRENT_PATH;

# . $ROOT_PATH/script/common.sh

#开始
function usage() {
	echo "usage: <exec> -a AUTH"
	echo "  -a AUTH: none, htpasswd, token-base, token-ports"
}

if [ $? != 0 ] ; then usage >&2 ; exit 1 ; fi

#
