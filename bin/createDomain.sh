#!/bin/bash
###############################################################################
# File         : createDomain.sh
# Description  : 
#
# Requires Env :
#                
# Produces Env : 
#
###############################################################################

SCRIPT_PATH=`dirname $(readlink -f $0)`
SCRIPT_NAME=`basename $0`
SCRIPTS_HOME="$SCRIPT_PATH/.."

SCRIPTS_TMP=${SCRIPTS_HOME}/tmp
export SCRIPTS_TMP
export TEMPLATES_HOME=$SCRIPTS_HOME/templates

. $SCRIPTS_HOME/config/env.sh
. $SCRIPTS_HOME/functions/utils.sh


###############################################################################
#
#
#
###############################################################################

function help() {
   echo "Usage: $SCRIPT_NAME"
}


###############################################################################
#
#
#
###############################################################################

function create_ohs_domain(){
   $SCRIPTS_HOME/tools/wlst.sh $SCRIPTS_HOME/config/environment.properties $SCRIPTS_HOME/wlst/createOHSDomain.py
   
   # Change nodemanager.properties SecureListener=false
   sed -i "s/SecureListener=true/SecureListener=false/" ${MIDDLEWARE_HOME}/../cfg/nodemanager/nodemanager.properties
   
   # copy start/stop scripts 
   DOMAIN_CONFIGURATION_HOME="${BUILDING_BLOCK_HOME}/cfg/sserver/domains/${TARGET_ENVIRONMENT}_${FUNCTIONAL_BLOCK_NAME}_${BUILDING_BLOCK_NAME}"

   CUSTOM_MACHINE_HOME="${BUILDING_BLOCK_HOME}/cfg/nodemanager"
   cp $DOMAIN_CONFIGURATION_HOME/bin/startNodeManager.sh ${CUSTOM_MACHINE_HOME}
   cp $DOMAIN_CONFIGURATION_HOME/bin/stopNodeManager.sh ${CUSTOM_MACHINE_HOME}
   # change nodemanager home
   sed -i -e "/NODEMGR_HOME=.*/ s:NODEMGR_HOME=.*:NODEMGR_HOME=\"${CUSTOM_MACHINE_HOME}\":" ${CUSTOM_MACHINE_HOME}/startNodeManager.sh
   sed -i -e "/NODEMGR_HOME=.*/ s:NODEMGR_HOME=.*:NODEMGR_HOME=\"${CUSTOM_MACHINE_HOME}\":" ${CUSTOM_MACHINE_HOME}/stopNodeManager.sh

   #startup ohs
   echo 'Starting Instance.'
   nohup $DOMAIN_CONFIGURATION_HOME/bin/startNodeManager.sh >/dev/null 2>&1 &
   sleep 5
   $SCRIPTS_HOME/tools/wlst.sh $SCRIPTS_HOME/config/environment.properties $SCRIPTS_HOME/wlst/startOHSInstance.py
   
   exit 0
}


###############################################################################
#
#
#
###############################################################################

if [ ! -d ${SCRIPTS_TMP} ]; then
   mkdir -p ${SCRIPTS_TMP}
fi

if [ ! -d ${MIDDLEWARE_HOME}/../cfg ]; then

   if [ "${INSTALL_TYPE}" == "OHS" ]; then
      create_ohs_domain
   else
      echo "Nothing to do ... for now"
   fi
   
else
   echo "Domain already created skipping..."
fi


###############################################################################
#
#
#
###############################################################################


