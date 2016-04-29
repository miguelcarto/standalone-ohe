#!/bin/sh
###############################################################################
# File         : packVagrant.sh
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

###############################################################################
#
#
#
###############################################################################

VAGRANT_OHS_HOME=$SCRIPTS_HOME/vagrant
mkdir $VAGRANT_OHS_HOME/ohs-provisioning && cp -r $SCRIPTS_HOME/bin $SCRIPTS_HOME/tools $SCRIPTS_HOME/functions $SCRIPTS_HOME/wlst $SCRIPTS_HOME/config $VAGRANT_OHS_HOME/ohs-provisioning

