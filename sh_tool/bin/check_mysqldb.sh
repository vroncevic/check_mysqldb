#!/bin/bash
#
# @brief   Check MySQL database existence
# @version ver.3.0
# @date    Sun Nov 21 21:01:40 CET 2021
# @company None, free software to use 2021
# @author  Vladimir Roncevic <elektron.ronca@gmail.com>
#
UTIL_ROOT=/root/scripts
UTIL_VERSION=ver.1.0
UTIL=${UTIL_ROOT}/sh_util/${UTIL_VERSION}
UTIL_LOG=${UTIL}/log

.    ${UTIL}/bin/devel.sh
.    ${UTIL}/bin/usage.sh
.    ${UTIL}/bin/check_root.sh
.    ${UTIL}/bin/check_tool.sh
.    ${UTIL}/bin/logging.sh
.    ${UTIL}/bin/load_conf.sh
.    ${UTIL}/bin/progress_bar.sh
.    ${UTIL}/bin/display_logo.sh

CHECK_MYSQLDB_TOOL=check_mysqldb
CHECK_MYSQLDB_VERSION=ver.3.0
CHECK_MYSQLDB_HOME=${UTIL_ROOT}/${CHECK_MYSQLDB_TOOL}/${CHECK_MYSQLDB_VERSION}
CHECK_MYSQLDB_CFG=${CHECK_MYSQLDB_HOME}/conf/${CHECK_MYSQLDB_TOOL}.cfg
CHECK_MYSQLDB_LOGO=${CHECK_MYSQLDB_HOME}/conf/${CHECK_MYSQLDB_TOOL}.logo
CHECK_MYSQLDB_LOG=${CHECK_MYSQLDB_HOME}/log

declare -A CHECK_MYSQLDB_USAGE=(
    [USAGE_TOOL]="${CHECK_MYSQLDB_TOOL}"
    [USAGE_ARG1]="[DATABASE NAME] Database name"
    [USAGE_EX_PRE]="# Check database TEST"
    [USAGE_EX]="${CHECK_MYSQLDB_TOOL} TEST"
)

declare -A CHECK_MYSQLDB_LOGGING=(
    [LOG_TOOL]="${CHECK_MYSQLDB_TOOL}"
    [LOG_FLAG]="info"
    [LOG_PATH]="${CHECK_MYSQLDB_LOG}"
    [LOG_MSGE]="None"
)

declare -A PB_STRUCTURE=(
    [BW]=50
    [MP]=100
    [SLEEP]=0.01
)

TOOL_DBG="false"
TOOL_LOG="false"
TOOL_NOTIFY="false"

#
# @brief   Main function
# @param   Value required database name
# @exitval Function __atmanger exit with integer value
#            0   - tool finished with success operation
#            128 - missing argument(s) from cli
#            129 - failed to load tool script configuration from file
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
# local OPERATION="start"
# __atmanager "$OPERATION"
#
function __check_mysqldb {
    local DN=$1
    if [ -n "${DN}" ]; then
        display_logo "vroncevic" "${CHECK_MYSQLDB_TOOL}" "${CHECK_MYSQLDB_VERSION}" "${CHECK_MYSQLDB_LOGO}"
        local FUNC=${FUNCNAME[0]} MSG="None" STATUS RESULT PASSWORD
        MSG="Loading basic configuration!"
        info_debug_message "$MSG" "$FUNC" "$CHECK_MYSQLDB_TOOL"
        progress_bar PB_STRUCTURE
        declare -A config_check_mysqldb=()
        load_conf "$CHECK_MYSQLDB_CFG" config_check_mysqldb
        STATUS=$?
        if [ $STATUS -eq $NOT_SUCCESS ]; then
            MSG="Force exit!"
            info_debug_message_end "$MSG" "$FUNC" "$CHECK_MYSQLDB_TOOL"
            exit 129
        fi
        TOOL_DBG=${config_check_mysqldb[DEBUGGING]}
        TOOL_LOG=${config_check_mysqldb[LOGGING]}
        TOOL_NOTIFY=${config_check_mysqldb[EMAILING]}
        local LP="-u root -p" SCN="--skip-column-names"
        local DBT="-e \"SHOW DATABASES LIKE '${DN}'\""
        RESULT=$(eval "mysql ${LP} ${SCN} ${DBT}")
        if [ "${RESULT}" == "${DN}" ]; then
            MSG="Database [$DN] exist"
            CHECK_MYSQLDB_LOGGING[MSGE]=$MSG
        else
            MSG="Database [$DN] does not exist"
            CHECK_MYSQLDB_LOGGING[MSGE]=$MSG
        fi
        info_debug_message "$MSG" "$FUNC" "$CHECK_MYSQLDB_TOOL"
        CHECK_MYSQLDB_LOGGING[FLAG]="info"
        logging CHECK_MYSQLDB_LOGGING
        info_debug_message_end "Done" "$FUNC" "$CHECK_MYSQLDB_TOOL"
        exit 0
    fi
    usage CHECK_MYSQLDB_USAGE
    exit 128
}

#
# @brief   Main entry point
# @param   Value required  database name
# @exitval Script tool check_mysqldb exit with integer value
#            0   - tool finished with success operation
#            127 - run tool script as root user from cli
#            128 - missing argument(s) from cli
#            129 - failed to load tool script configuration from file
#
printf "\n%s\n%s\n\n" "${CHECK_MYSQLDB_TOOL} ${CHECK_MYSQLDB_VERSION}" "`date`"
check_root
STATUS=$?
if [ $STATUS -eq $SUCCESS ]; then
    __check_mysqldb $1
fi

exit 127
