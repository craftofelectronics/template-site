---
---

var dueIn = function (title, due, isInClass) {
  // console.log("dueIn");
  // Convert to strings...
  var dueID = "" + title + "-" + due;
  var due = "" + due;
  var isInClass = "" + isInClass;
  
  if (isValidDueDate(due)) {
    var today     = moment();
    var todayString = today.format("ddd, MMM Do");
    var m = moment();
    
    m = parseDueDate(due);
  
    var diff = m.diff(today, 'days');
    var difference = "";
    difference = m.from(moment());
    
    if (isInClass == "true") {
      // console.log("Categories: " + categories);
      difference = "<span class='label label-info pull-right'>" 
                    + "in class"
                    + "</span>";
    } else {
        difference = "<span class='label " + 
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