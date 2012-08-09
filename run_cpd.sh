#!/bin/sh
#Follow with the DRY or Violations plugins.

set -e
if [ -z "$WORKSPACE" ]
then
	export WORKSPACE=`pwd`
	echo "set WORKSPACE to $WORKSPACE"
fi
echo "Generating duplication report."

java \
-Xmx512m \
-DObjC-CPD-LoggingEnabled=YES \
-classpath CPD/pmd-4.2.5/lib/pmd-4.2.5.jar:CPD/ObjCLanguage-0.0.6-SNAPSHOT.jar \
net.sourceforge.pmd.cpd.CPD \
--minimum-tokens 25 \
--language ObjectiveC \
--files $WORKSPACE/SOLID \
--encoding UTF-8 \
--format net.sourceforge.pmd.cpd.XMLRenderer > cpd-output.xml

# NOTE: The ObjC definition doesn't seem to work with PMD 5.0.0 as of 2012.08.09.