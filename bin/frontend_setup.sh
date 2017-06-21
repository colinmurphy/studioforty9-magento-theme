#!/usr/bin/env bash
# This script will test if you have given a leap year or not.

echo "Enter your package name [ENTER]:"
read package

echo "Enter your theme name [ENTER]:"
read theme

if [ ! -d app/design/frontend/$package/$theme ]; then
  mkdir -p app/design/frontend/$package/$theme
fi

if [ ! -d skin/frontend/$package/$themee ]; then
  mkdir -p skin/frontend/$package/$theme
fi

cp -rf app/design/frontend/studioforty9/default/ app/design/frontend/$package/$theme/
echo "Design files copied";
cp -rf skin/frontend/studioforty9/default/ skin/frontend/$package/$theme/
echo "Skin files copied. Setting up bower and node";
cd skin/frontend/$package/$theme/src/
bower install
npm install
gulp default

echo $package/$theme was created. You now to need to set the theme in the system configuration.;