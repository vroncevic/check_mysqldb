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
. $UTIL/bin/checktool.sh
. $UTIL/bin/loadconf.sh
. $UTIL/bin/sendmail.sh
. $UTIL/bin/checkop.sh
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
#			0   - success operation 
#			128 - failed to load config file
#			129 - missing catalina script file
#			130 - missing argument
#			131 - wrong argument (operation)
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
# local OPERATION="start"
# __atmanager "$OPERATION"
#
function __checkdb() {
	local DATABASE_NAME=$1
	if [ -n "$DATABASE_NAME" ]; then
		printf "\n%s\n" "$TOOL_NAME $TOOL_VERSION"
		printf "%s\n\n" "Powered by Frobas `date`"
		RESULT=`mysql -uroot --skip-column-names -e "SHOW DATABASES LIKE '$DATABASE_NAME'"`
		if [ "$RESULT" == "$DATABASE_NAME" ]; then
			printf "%s\n\n" "Database [$DATABASE_NAME] exist"
		else
			printf "%s\n\n" "Database [$DATABASE_NAME] does not exist"
		fi
		exit 0
	else
		printf "\n%s\n" "Usage : $TOOL_NAME [DATABASE_NAME]"
		printf "%s\n\n" "Example $TOOL_NAME openit"	
		exit 127
	fi
}

#
# @brief   Main entry point
# @param   Value required  database name
# @exitval Script tool checkdb exit with integer value
#			0   - success operation 
# 			127 - run as root user
#			128 - failed to load config file
#			129 - missing catalina script file
#			130 - missing argument
#			131 - wrong argument (operation)
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
