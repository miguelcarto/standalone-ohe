#!/bin/sh
###############################################################################
# File         : setupBB.sh
# Description  : Creates directory structure for a Building Block installation
#
# Requires Env : 
#                BUILDING_BLOCK_HOME - The Building Block directory 
# Produces Env :
# 
###############################################################################

echo
echo "*** Building Block Setup ***"
echo
if [ -d "${BUILDING_BLOCK_HOME}" ]; then
   if [ "$(ls -A $BUILDING_BLOCK_HOME)" ]; then
      echo "Building Block home ${BUILDING_BLOCK_HOME} is not empty."
   fi
else
   mkdir -p ${BUILDING_BLOCK_HOME}
   if [ $? -ne 0 ] ; then
      echo "Could not create Building Block home at ${BUILDING_BLOCK_HOME}, terminating."
      exit 1
   else
      echo "Created building home at ${BUILDING_BLOCK_HOME}"
   fi
fi
# TODO: Set the folder permissions
