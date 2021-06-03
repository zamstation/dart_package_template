# TEMPLATE_GUIDE
<< [CAUTION]: Remove this file before your first commit. >>

# CHECKLIST

## pubspec.yaml
- [ ] In name field, replace package_name with your package name.
- [ ] In description field, add description not less than 80 characters.
- [ ] In repository field, replace package_name with your package name.
- [ ] In dependencies field, remove zam_core if not needed.

## README.md
- [ ] Replace @package_title@ with package title.
- [ ] Replace @description@ with description.
- [ ] Replace 18 occurences of @package_name@ with package name.
- [ ] Replace 6 occurences of @component_n@ with component names.
- [ ] Replace @how_to_use@ with usage and examples.
- [ ] Add contributors as necessary.

## CHANGELOG.md

- [ ] Replace @component_n@ with your component names.

## lib/package_name.dart
- [ ] Rename package_name.dart to zam_@package_name@.dart

## .github/workflows/build.yml
- [ ] Remove branches-ignore
- [ ] Uncomment branches

## .github/workflows/build_dev.yml
- [ ] Remove branches-ignore
- [ ] Uncomment branches

## test
- [ ] Remove dummy_test.dart when you have created your first test. You need to have at least one test to satisfy the publish.sh script.
- [ ] Remove _setup.dart if not required.
