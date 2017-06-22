#!/usr/bin/env bash
# This script creates a very basic skeleton Magento theme

if [ ! -d app/design/frontend ]
then
	echo Could not find front end design folder in current folder.
	echo This script is intended to be run from the root of your Magento installations eg. bin/$0
	exit
fi

read -p "Enter your package name [ENTER]: " package
read -p "Enter your theme name [ENTER]: " theme

if [[ -z "$package" ]]
then
    echo No package name was specified
    exit
fi

if [[ -z "$theme" ]]
then
    echo No package name was specified
    exit
fi

if [ ! -d "app/design/frontend/$package/$theme" ]
then
  mkdir -p "app/design/frontend/$package/$theme"
fi

if [ ! -d "skin/frontend/$package/$theme" ]
then
  mkdir -p "skin/frontend/$package/$theme"
fi

cp -rf app/design/frontend/studioforty9/default/ "app/design/frontend/$package/$theme/"
echo Design files copied

cp -rf skin/frontend/studioforty9/default/ "skin/frontend/$package/$theme/"
echo Skin files copied. Setting up bower

cd "skin/frontend/$package/$theme/src/"
echo Setting up bower and node

bower install
npm install
gulp default

echo $package/$theme was created. You now to need to set the theme in the system configuration.
