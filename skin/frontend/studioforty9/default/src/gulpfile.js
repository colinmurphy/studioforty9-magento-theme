// Load plugins
var
    gulp            = require('gulp'),
    sass            = require('gulp-sass'),
    autoprefixer    = require('gulp-autoprefixer'),
    uglify          = require('gulp-uglify'),
    concat          = require('gulp-concat'),
    notify          = require('gulp-notify'),
    cache           = require('gulp-cache'),
    livereload      = require('gulp-livereload');

var config = {
    uglifyJS: true,
    sass: {
        src:  '/scss/**/*.{sass,scss}',
        dest:  '../css',
        options: {
            noCache: true,
            compass: false,
            bundleExec: true,
            sourcemap: true,
            sourcemapPath: '/scss/**/*.{sass,scss}'
        }
    }
}

// CSS
gulp.task('css', function() {

    var stream = gulp
        .src('scss/styles.scss')
        .pipe(sass(config.sass.options)
            .on('error', notify.onError(function (error) {
            cssCompiling = false;
            return 'Error compiling SASS: ' + error.message;
        })))
        .pipe(autoprefixer('last 10 versions'))
        .pipe(gulp.dest(config.sass.dest));

    stream.pipe(gulp.dest('../css'))
        .pipe(notify({ message: 'Successfully compiled SASS' }));
});

// JS
gulp.task('js', function() {

    var scripts = [
        'js/site.js'
    ];

    var stream = gulp
        .src(scripts)
        .pipe(concat('site.js'));

    if (config.uglifyJS === true) {
        stream.pipe(uglify());
    }

    return stream
        .pipe(gulp.dest('../js'))
        .pipe(livereload())
        .pipe(notify({ message: 'Successfully compiled JavaScript' }));
});

// Default task
gulp.task('default', ['css', 'js']);

// Watch
gulp.task('watch', function() {

    // Watch .sass files
    gulp.watch('scss/**/*.scss', ['sass']);
    gulp.watch('js/*.js', ['js']);

    // Watch any files in , reload on change
    livereload.listen();
    gulp.watch(['../css/styles.css', '../js/site.js']).on('change', livereload.changed);
});