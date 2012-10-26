#!/bin/sh
#Follow with the Cobertura plugin.
set -e
if [ -z "$WORKSPACE" ]
then
	export WORKSPACE=`pwd`
fi
echo "WORKSPACE is $WORKSPACE"
echo "Generating coverage.xml"
"$WORKSPACE/gcovr" -r "$WORKSPACE" --exclude '.*UnitTests.*' --xml > "$WORKSPACE/coverage.xml"
