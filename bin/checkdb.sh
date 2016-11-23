#!/bin/bash
#
# @brief   Checking MySQL database
# @version ver.1.0
# @date    Tue Apr 22 21:55:20 CEST 2016
# @company Frobas IT Department, www.frobas.com 2016
# @author  Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
UTIL_ROOT=/root/scripts
UTIL_VERSION=ver.1.0
UTIL=$UTIL_ROOT/sh-util-srv/$UTIL_VERSION
UTIL_LOG=$UTIL/log

. $UTIL/bin/checkroot.sh
. $UTIL/bin/loadconf.sh
. $UTIL/bin/logging.sh
. $UTIL/bin/usage.sh
. $UTIL/bin/devel.sh

CHECKDB_TOOL=checkdb
CHECKDB_VERSION=ver.1.0
CHECKDB_HOME=$UTIL_ROOT/$CHECKDB_TOOL/$CHECKDB_VERSION
CHECKDB_CFG=$CHECKDB_HOME/conf/$CHECKDB_TOOL.cfg
CHECKDB_LOG=$CHECKDB_HOME/log

declare -A CHECKDB_USAGE=(
	[TOOL_NAME]="__$CHECKDB_TOOL"
	[ARG1]="[CHECKDB_DATABASE] Database name"
	[EX-PRE]="# Check database TEST"
	[EX]="__$CHECKDB_TOOL TEST"
)

declare -A LOG=(
	[TOOL]="$CHECKDB_TOOL"
	[FLAG]="info"
	[PATH]="$CHECKDB_LOG"
	[MSG]=""
)

TOOL_DBG="false"

#
# @brief   Main function 
# @param   Value required database name
# @exitval function __atmanger exit with integer value
#			0   - tool finished with success operation 
#			128 - missing argument(s) from cli 
#			129 - failed to load tool script configuration from file 
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
# local OPERATION="start"
# __atmanager "$OPERATION"
#
function __checkdb() {
	local DATABASE_NAME=$1
	local FUNC=${FUNCNAME[0]} 
	local MSG=""
	if [ -n "$DATABASE_NAME" ]; then
		declare -A configckdb=()
		__loadconf $CHECKDB_CFG configckdb
		local STATUS=$?
		if [ "$STATUS" -eq "$NOT_SUCCESS" ]; then
			MSG="Failed to load tool script configuration"
			if [ "$TOOL_DBG" == "true" ]; then
				printf "$DSTA" "$CHECKDB_TOOL" "$FUNC" "$MSG"
			else
				printf "$SEND" "[$CHECKDB_TOOL]" "$MSG"
			fi
			exit 129
		fi
		local RESULT=`mysql -uroot --skip-column-names -e "SHOW DATABASES LIKE '$DATABASE_NAME'"`
		if [ "$RESULT" == "$DATABASE_NAME" ]; then
			MSG="Database [$DATABASE_NAME] exist"
			printf "%s\n\n" "$MSG"
			if [ "${configckdb[LOGGING]}" == "true" ]; then
				LOG[MSG]=$MSG
				LOG[FLAG]="info"
				__logging $LOG
			fi
		fi
		MSG="Database [$DATABASE_NAME] does not exist"
		printf "%s\n\n" "$MSG"
		if [ "${configckdb[LOGGING]}" == "true" ]; then
			LOG[MSG]=$MSG
			LOG[FLAG]="info"
			__logging $LOG
		fi
		exit 0
	fi
	__usage $OSSL_USAGE
	exit 128
}

#
# @brief   Main entry point
# @param   Value required  database name
# @exitval Script tool checkdb exit with integer value
#			0   - tool finished with success operation 
# 			127 - run tool script as root user from cli
#			128 - missing argument(s) from cli 
#			129 - failed to load tool script configuration from file 
#
printf "\n%s\n%s\n\n" "$CHECKDB_TOOL $CHECKDB_VERSION" "`date`"
__checkroot
STATUS=$?
if [ "$STATUS" -eq "$SUCCESS" ]; then
	set -u
	CHECKDB_DATABASE=${1:-}
	__checkdb "$CHECKDB_DATABASE"
fi

exit 127

