/**
 * Makes the TSV data play nice
 * with Postgres Arrays...
**/


var fs = require("fs");
var csv = require("csv");

var arrays = [6, 8, 13];

if (!process.argv[2]) {
  console.log("node convert.js filename.tsv") && process.exit();
}

csv()
.from(process.argv[2], {
  delimiter: "\t",
  escape: "",
  quote: ""
})
.to(fs.createWriteStream("./data.tsv"))
.transform(function(row) {
  var res = row.map(function(item, i) {
    if (arrays.indexOf(i) !== -1) {
      var items = item.split(",").map(function(i) {
        return '"' + i.trim() + '"';
      }).join(",");
      return "{" + items + "}";
    }
    else {
      return item;
    }
  });
  
  return res;
})
.on("close", function(count) {
  console.log("Wrote", count, "rows");
});
