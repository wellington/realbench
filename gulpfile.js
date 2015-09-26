var gulp = require('gulp');

gulp.task('post', function () {
    var postcss = require('gulp-postcss');
    var syntax = require('postcss-scss');
    var rename = require('gulp-rename');

    var plugins = [
        require('postcss-partial-import')({ extension: "scss"}),
        // These throw errors on bootstrap-sass
        // require('postcss-sass-mixins'),
        // require('postcss-mixins'),
        // require('postcss-nested'),
        // require('postcss-simple-vars'),
        // require('postcss-calc'),
    ];

    return gulp.src('short/*.scss')
            .pipe( postcss(plugins, { parser: require('postcss-scss') }) )
            .pipe(rename(function(path){
                path.extname = '.css';
            }))
        .pipe( gulp.dest('build/') )
        .on('error', function(e) { console.log(e.message); })
});

gulp.task('sass', function () {
    var sass = require('gulp-sass');
    return gulp.src('short/*.scss')
        .pipe(sass.sync().on('error', sass.logError)
              .on('done', function(){ console.log(arguments); }))
        .pipe(gulp.dest('build/'))
});
