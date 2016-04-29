#!/bin/sh
###############################################################################
# File         : installOHS.sh
# Description  : Installs the OHS on the BUILDING_BLOCK_HOME
#
# Requires Env :
#                BUILDING_BLOCK_JDK_HOME - Building Block's JDK Home
#                STAGING_DIRECTORY - Directory holding installation files
#                TEMPORARY_DIRECTORY - Temporary_Directory
#                
#
###############################################################################

OHS_FILE_NAME="fmw_12.2.1.0.0_ohs_linux64.bin"
export OHS_FILE_NAME

echo
echo "*** OHS Installation ***"
echo

create_install_response_file "ohs"
${STAGING_DIRECTORY}/${OHS_FILE_NAME} -jreLoc ${BUILDING_BLOCK_JDK_HOME} -novalidation -silent -responseFile ${TEMPORARY_DIRECTORY}/ohs.rsp
