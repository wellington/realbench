var gulp = require('gulp');

gulp.task('post', function () {
    var postcss = require('gulp-postcss');
    var syntax = require('postcss-scss');
    var rename = require('gulp-rename');
    var partimport = require('postcss-partial-import')
    var plugins = [partimport({ extension: "scss"})];

    gulp.src('short/*.scss')
            .pipe( postcss(plugins, { parser: require('postcss-scss') }) )
            .pipe(rename(function(path){
                path.extname = '.css';
            }))
            .pipe( gulp.dest('build/') )
});

gulp.task('sass', function () {
    var sass = require('gulp-sass');
    gulp.src('short/*.scss')
        .pipe(sass.sync().on('error', sass.logError)
              .on('done', function(){ console.log(arguments); }))
        .pipe(gulp.dest('build/'))
});
