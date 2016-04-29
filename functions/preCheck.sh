#!/bin/sh
###############################################################################
# File         : preCheck.sh
# Description  : Performs an initial valitation of the installation
#
# Requires Env : 
#				TARGET_ENVIRONMENT
#				FUNCTIONAL_BLOCK_NAME
#				BUILDING_BLOCK_NAME
#
# Produces Env :
# 
###############################################################################

echo
echo "*** Pre Validation ***"
echo

is_valid=true

if [ -z "$TARGET_ENVIRONMENT" ]; then
   echo "TARGET_ENVIRONMENT is not set"
   is_valid=false
else
   echo "TARGET_ENVIRONMENT is set to $TARGET_ENVIRONMENT"
fi

if [ -z "$FUNCTIONAL_BLOCK_NAME" ]; then
   echo "FUNCTIONAL_BLOCK_NAME is not set"
   is_valid=false
else
   echo "FUNCTIONAL_BLOCK_NAME is set to $FUNCTIONAL_BLOCK_NAME"
fi

if [ -z "$BUILDING_BLOCK_NAME" ]; then
   echo "BUILDING_BLOCK_NAME is not set"
   is_valid=false
else
   echo "BUILDING_BLOCK_NAME is set to $BUILDING_BLOCK_NAME"
fi

# If any of the validations failed exit with error
echo
if [ ! "$is_valid" = true ] ; then
   echo "Pre Validation has failed. Terminating."
   exit 1
else
   echo "Pre Validation has passed."
fi

###############################################################################
#
#
#
###############################################################################