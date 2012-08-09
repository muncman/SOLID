# Appledoc configuration

# For benefit of log files.
echo $0 $*
# Better to fail early...
set -e
# set -o errexit
# set -o verbose

if [ -z "$WORKSPACE" ]
then
	WORKSPACE=`pwd`
	echo "set WORKSPACE to $WORKSPACE"
fi

appledoc \
--project-name "SOLID" \
--project-company "Method Up" \
--company-id "com.methodup" \
--output "$WORKSPACE/Appledoc" \
--logformat xcode \
--keep-undocumented-objects \
--keep-undocumented-members \
--keep-intermediate-files \
--no-repeat-first-par \
--no-warn-invalid-crossref \
--ignore "*.m" \
--index-desc "$WORKSPACE/README.md" \
"$WORKSPACE"