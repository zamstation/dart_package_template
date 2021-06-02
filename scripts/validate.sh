#!/bin/bash
#-----------------------------------------------------------------------------
#
#		validate.sh
#
#		Script that validates the package.
#
#		What it does:
#			- Checks if all the required files exist
#			- Formats Code
#			- Runs dart analyze
#
#		Arguments:
#			1. package name
#
#		Errors:
#			101: ARGUMENT_ERROR
#			102: DIRECTORY_NOT_FOUND_ERROR
#			103: FILE_NOT_FOUND_ERROR
#			104: PUBSPEC_VALIDATION_ERROR
#
#-----------------------------------------------------------------------------

#
# Initialize
#
echo ""
packageName='test'
if [[ $1 == '' ]]; then
	echo "[ARGUMENT_ERROR]: Please provide a package name while running the script."
	exit 101
fi
packageName=$1

#
# Check if all the required directories exist.
#
echo -e "- Checking if all the required directories exist ..."

directories=(
	".github"
	".github/ISSUE_TEMPLATE"
	".github/workflows"
	"example"
	"example/lib"
	"lib"
	"lib/src"
	"scripts"
	"test"
)

for directory in ${directories[@]}; do
	if [[ -d $directory ]]; then
		echo "[✓] $directory"
	else
		echo "[x] $directory directory does not exist."
		echo -e "\n[DIRECTORY_NOT_FOUND_ERROR]: directory $directory does not exist."
		exit 102
	fi
done

#
# Check if all the required files exist.
#
echo -e "\n- Checking if all the required files exist ..."

files=(
	"README.md"
	"CHANGELOG.md"
	"LICENSE"
	"pubspec.yaml"
	".gitignore"
	"example/lib/main.dart"
	"lib/$packageName.dart"
	"scripts/analyze.sh"
	"scripts/publish.sh"
	"scripts/test.sh"
	"scripts/validate.sh"
)

for file in ${files[@]}; do
	if [[ -f $file ]]; then
		echo "[✓] $file"
	else
		echo "[x] $file file does not exist."
		echo -e "\n[FILE_NOT_FOUND_ERROR]: file $file does not exist."
		exit 103
	fi
done

#
# Validate pubspec.yaml file
#
echo -e "\n- Validating pubspec.yaml file ..."

declare -A patterns
patterns=(
	["name"]="^name: $packageName$"
	["version"]="^version: [0-9]+[.][0-9]+[.][0-9]+$"
	["description"]="^description: .{60,}$"
	["homepage"]="^homepage: https://zamstation.com$"
	["repository"]="^repository: https://github.com/zamstation/$packageName$"
	["environment"]="^environment:$"
	["environment-sdk"]="^  sdk: \">=2.12.0 <3.0.0\"$"
)

for field in "${!patterns[@]}"; do
	matches=$(grep -cE "${patterns[$field]}" "pubspec.yaml")
	if [ $matches -eq 1 ]; then
		echo "[✓] $field"
	else
		echo "[x] $field"
		echo -e "\n[PUBSPEC_VALIDATION_ERROR]: $field field is invalid.\nExpected Format:\n${patterns[$field]}"
		exit 103
	fi
done

# End
exit 0

#-----------------------------------------------------------------------------
