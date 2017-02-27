var gulp = require('gulp');
var shell = require('gulp-shell');
var notify = require("gulp-notify");
var connect = require('gulp-connect');

gulp.task('latex', function() {
    return gulp.src('*.tex', {read: false})
    .pipe(shell(["make"],{quiet: true})
    .on('error', notify.onError({
			title: "Compiling Failed",
			message: "Latex Document couldn't get compiled.",
      "sound": "Sosumi"
		})
  ))
    .pipe(notify({
      title: "Compiling Succeded!",
      message: "Documentation has been Compiled Succesfully!",
      "sound": "Pop"
      }
    ))
});

gulp.task('watch', function() {
    gulp.watch('**/*.tex', ['latex']);
});



gulp.task('webserver', function() {
  connect.server();
});

gulp.task('default', ['latex','watch']);
