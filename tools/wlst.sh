#!/bin/bash

# Requires Installed FMW

#############################

TOOLS_PATH=`dirname $0`
. $TOOLS_PATH/../config/env.sh

# TODO
export WLST_LIB=$TOOLS_PATH/../wlst

propertiesFile=$1
shift

export WLST_PROPERTIES="-Dweblogic.security.SSL.ignoreHostnameVerification=true -Dweblogic.security.TrustKeyStore=DemoTrust"
$MIDDLEWARE_HOME/oracle_common/common/bin/wlst.sh -skipWLSModuleScanning -loadProperties $propertiesFile $@
