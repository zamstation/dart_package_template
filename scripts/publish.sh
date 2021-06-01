#!/bin/bash
#-----------------------------------------------------------------------------
#
#		publish.sh
#
#		Script that publishes the package to pub.dev
#
#		What it does
#			- Runs validate.sh
#			- Runs analyze.sh
#			- Runs test.sh
#			- Publishes package pub.dev
#
#		Arguments:
#			1. env -> should be prod or test
#
#-----------------------------------------------------------------------------

# Initialize
set -e
echo ""
scriptDirectory=$(dirname "$0")
env='test'
if [[ $1 == 'prod' ]]; then
	env='prod'
fi

# Validate package
sh $scriptDirectory/validate.sh

# Analyze package
sh $scriptDirectory/analyze.sh

# Test package
sh $scriptDirectory/test.sh

# Publish
if [[ $env == 'test' ]]; then
	echo 'Dry running dart pub publish'
	dart pub publish --dry-run
else
	echo 'Publishing package to pub.dev'
	dart pub publish
fi

# End
exit 0

#-----------------------------------------------------------------------------
