---
---

var dueIn = function (dueID, due, isInClass, prefix, scale) {
  console.log("dueIn");
  console.log("id " + dueID);
  console.log("due " + due);
  console.log("scale " + scale);
  
  // Convert to strings...
  var due = "" + due;
  var isInClass = "" + isInClass;
  
  if (isValidDueDate(due)) {
    var today     = moment();
    var todayString = today.format("ddd, MMM Do");
    var m = moment();
    
    m = parseDueDate(due);
  
    var diff = m.diff(today, 'days');
    var difference = prefix + " ";
    difference += m.from(moment());
    
    if (isInClass == "true") {
      // console.log("Categories: " + categories);
      difference = "<span style='font-size: " 
                    + scale + ";'"
                    + "class = 'label label-info pull-right'>"
                    + "in class"
                    + "</span>";
    } else {
        difference = "<span style='font-size: " + scale + ";' class='label " + 
            getRangeColor(m) + 
            " pull-right'>" +
            difference + 
            "</span>";
    } //end else  
  } // end if valid due date
  
  console.log("#" + dueID + "\n" + difference);
  // difference += "<span style='font-size: 80%;' class='pull-right'>" + m.format("ddd, MMM Do") + "</span>";
  
  $("#" + dueID).append(difference);
};

var prettyDate = function (elem, due, format) {
  m = parseDueDate(due);
  $("#" + elem).append(m.format("ddd, MMM Do"));
};