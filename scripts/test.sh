#!/bin/bash
#-----------------------------------------------------------------------------
#
#		test.sh
#
#		Script that tests the package.
#
#		What it does:
#			- Runs tests and collects coverage
#
#		Arguments:
#			<none>
#
#-----------------------------------------------------------------------------

# Abort if there is an error.
set -e

# Run tests and collect coverage
flutter test --no-pub --coverage

# End
exit 0

#-----------------------------------------------------------------------------
