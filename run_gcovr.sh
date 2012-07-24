#Follow with the Cobertura plugin.
"$WORKSPACE/gcovr" -r "$WORKSPACE" --exclude '.*UnitTests.*' --xml > "$WORKSPACE/coverage.xml"