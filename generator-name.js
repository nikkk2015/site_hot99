var fs = require('fs');

// var name = function () {
//   for (var i = 1; i < 57; i++) {
//     if(i<10){
//       n = '0' + i;
//     } else n = i;

//     console.log('a.gal.item(rel="gallery", href="proj/bani/Image'+n+'.jpg"): \
//     img.img-thumbnail(src="proj/banismall/Image'+n+'.jpg")');
//   }
// };
var dir = '/home/vlad360/projects/valeria/dist/proj';

var fs = require('fs');
var path = require('path');
var walk = function(dir, done) {
  var results = [];
  fs.readdir(dir, function(err, list) {
    if (err) return done(err);
    var pending = list.length;
    if (!pending) return done(null, results);
    list.forEach(function(file) {
      file = path.resolve(dir, file);
      fs.stat(file, function(err, stat) {
        if (stat && stat.isDirectory()) {
          walk(file, function(err, res) {
            results = results.concat(res);
            if (!--pending) done(null, results);
          });
        } else {
          if (!(file.indexOf("small") + 1 )) {
            results.push(file);
          }
            if (!--pending) done(null, results);
        }
      });
    });
  });
};

walk(dir, function(err, results) {
  var str;
  if (err) throw err;
  // console.log(results);
  for (var i = 0; i < results.length; i++) {
    str = str + '\n\r' + 'a.gal.item(rel="gallery", href="'+results[i]+'"): '
    + 'img.img-thumbnail(src="'+results[i] + '")';
  };
  fs.writeFile("/home/vlad360/read.txt", str, function (err) {
    if (err) {
      return console.log('error');
    };
  })

//     ');
//     console.log('"): \
//   }
});