# Overview

This is a Magento child theme of RWD theme that uses twitter bootstrap with the existing RWD scss files. 

## Features

- Gulp and Live Reload to automatically compile CSS and JavaScript files
- Font Awesome for icons
- Separate stylesheets for IE9 to tackle the [CSS selector limit](http://blogs.msdn.com/b/ieinternals/archive/2011/05/14/10164546.aspx)
    
# 1. Requirements

You need the following libraries globally installed on your computer:

1. [Node](https://nodejs.org/download/)

If you already have (Homebrew)[http://brew.sh/] you run the following:

    brew install node

# 2. Setup

Once you have copied the theme in your Magento install you need to download the bower and node packages.
To do this you need to do the following from your project root:

    cd skin/frontend/studioforty9/default/dist/
    npm install
    bower install
    
# 3. Gulp

Once you have the theme setup gulp is ready to go using live reload to automatically compile and refresh your CSS and JavaScript files when marking up.
To run these commands you need to cd into the *skin/frontend/studioforty9/default/dist* directory.

You then can run the following

### 3.1 Gulp
This watches your CSS and JavaScript files and automatically compiles the files

    gulp

### 3.2 Gulp CSS
This compiles your styles.css and your IE9 css (optional)

    gulp sass
    gulp css
    
### 3.3 Gulp JS
This compiles your javascript.

    gulp js

### 3.4 Gulp IE9
This compiles just your ie9 stylesheets.

    gulp-ie9
    
### 3.5 Options

Within your gulp file there are 3 options

1. **minifyCss:** Whether to minify your styles.css file. Default: true
2. **uglifyJS:** Whether to minify your site.js file. Default: true
3. **compileIE9:** Whether to compile your ie9 stylesheets when running gulp or gulp sass. Default: true


### 3.6 PHPStorm

If you are using PHPStorm you should find the gulpfile.js in the project view and right click and select "Show Gulp Tasks".
This will now allow you to run the gulpfile from PHPStorm which is quite useful.

## 4. SASS

This theme was built so you should edit the scss file copied over from RWD. 
However there is _theme partial file and theme directory under *dist/scss* add to the original RWD scss directory.

The purpose of this was to allow the developer extend the RWD theme and add in new components and also if the package has multiple themes a developer could have different _theme partial files.
If for some reason you need to remove twitter bootstrap or font awesome you can do so in this partial file.

Finally it should be noted that the only change in the RWD theme was to the responsive breakpoint for mobile.

The variable *$bp-medium* was changed from 770px to 767px to work better with twitter bootstrap in the _vars.scss file.

### 5. JavaScript

In the gulpfile there is an array of javascript files. If you for instance wanted to include twitter bootstrap js libraries you could add to this array.


## 6. Live Reload

This themes use live reload to speed up the development process. Its adds the javascript for observing the files in the footer for localhost servers.
If you need to remove this you can do so here.
