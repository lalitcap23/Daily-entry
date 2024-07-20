const fs = require("fs");

fs.readFile("a.text", "utf-8", function(err, data) {
    if (err) {
        console.error("Error reading file:", err);
        return;
    }
    console.log(data);
});
