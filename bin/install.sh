#!/bin/bash
###############################################################################
# File         : install.sh
# Description  : 
#
# Requires Env :
#                
# Produces Env : 
#
###############################################################################

SCRIPT=`readlink -f $0`
SCRIPT_PATH=`dirname $SCRIPT`

SCRIPTS_HOME="$SCRIPT_PATH/.."

. ${SCRIPTS_HOME}/config/env.sh
. ${SCRIPTS_HOME}/functions/utils.sh


###############################################################################
#
#
#
###############################################################################

if [ $# -eq 1 ]; then 
   STAGING_DIRECTORY=$1
fi

echo
echo "*** Starting Building Block Installation ***"
echo
echo "Executing at ${SCRIPTS_HOME}"
echo

TEMPORARY_DIRECTORY=${SCRIPTS_HOME}/tmp
export TEMPORARY_DIRECTORY
if [ -d "${TEMPORARY_DIRECTORY}" ]; then
   echo "Removing existing temporary directory ${TEMPORARY_DIRECTORY}"
   rm -rf ${TEMPORARY_DIRECTORY}
   if [ $? -ne 0 ] ; then
      echo "Failed. Terminating."
      exit 1
   else
      echo "Success."
   fi
fi
   
echo "Creating temporary directory ${TEMPORARY_DIRECTORY}"
mkdir -p ${TEMPORARY_DIRECTORY}
if [ $? -ne 0 ] ; then
   echo "Failed. Terminating."
   exit 1
else
   echo "Success."
fi

. ${SCRIPTS_HOME}/functions/preCheck.sh
create_central_inventory
. ${SCRIPTS_HOME}/functions/setupBB.sh
. ${SCRIPTS_HOME}/functions/installJDK.sh
echo $JDK_HOME

skip_installation=false
if [  "$(ls -A ${BUILDING_BLOCK_HOME}/fmw 2> /dev/null)" != ""  ]; then
   echo "Building Block JDK Home ${BUILDING_BLOCK_HOME}/fmw already exists. Skipping FMW installation."
   skip_installation=true
fi

if [ "$skip_installation" = false ] ; then
   . ${SCRIPTS_HOME}/functions/installOHS.sh
   
fi

###############################################################################
#
#
#
###############################################################################
