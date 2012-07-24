#!/bin/sh
#Follow with the Cobertura plugin.
set -e
if [ -z "$WORKSPACE" ]
then
	export WORKSPACE=`pwd`
	echo "set WORKSPACE to $WORKSPACE"
fi
echo "Generating coverage.xml"
"$WORKSPACE/gcovr" -r "$WORKSPACE" --exclude '.*UnitTests.*' --xml > "$WORKSPACE/coverage.xml"
