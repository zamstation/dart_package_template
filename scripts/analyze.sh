#!/bin/bash
#-----------------------------------------------------------------------------
#
#		analyze.sh
#
#		Script that analyzes the package.
#
#		What it does:
#			- Gets dependencies
#			- Formats Code
#			- Runs dart analyze
#
#		Arguments:
#			<none>
#
#-----------------------------------------------------------------------------

# Abort if there is an error.
set -e

# Get dependencies
dart pub get

# Format code
dart format --set-exit-if-changed .

# Run dart analyze
dart analyze --fatal-infos --fatal-warnings .

# End
exit 0

#-----------------------------------------------------------------------------
