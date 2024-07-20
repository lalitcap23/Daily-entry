const fs = require("fs');
// my own asynchronous function
function kiratsReadFiled) ^
con
return new Promise(function(resolve) ‹
fs. readFtle(*a.txt", "utf-8", function(err, data) ‹
resolve(data);
}) ;
})
// callback function to call
function onDone(data) €
console. log(data)
kiratsReadFile( ). then(onDone);