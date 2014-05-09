---
---


var fink = function (category, htmlelement, elements) {
  var FULLHEIGHT= 60;
  var HALFHEIGHT = 30;
  var FULLWIDTH = 120;
  var HALFWIDTH = 60;
  var STROKE = 2;
  
  var paper = Raphael(htmlelement, FULLWIDTH, FULLHEIGHT);

  // x,y,width,height,corner radius
  var title = paper.rect(0,0, FULLWIDTH, HALFHEIGHT);
  title.attr("stroke-width", STROKE);
  
  var txt = paper.text(HALFWIDTH, FULLHEIGHT / 4, category).scale(1.5, 1.5);

  var dims = paper.rect(0, HALFHEIGHT, FULLWIDTH, HALFHEIGHT);
  dims.attr("stroke-width", STROKE);

  var dimensions = Array(6);
  var colors = ['#006', '#006600', '#660099', '#FF0033', '#FF6600', '#FFFF99'];
  var labels = ['F', 'A', 'I', 'HD', 'C', 'LL'];
  var txtcolor = ['#FFF', '#FFF', '#FFF', '#000', '#000', '#000'];
  
  for (i = 0 ; i < 6; i++) {
    dimensions[i] = paper.rect(0 + i * (FULLWIDTH / 6), HALFHEIGHT, (FULLWIDTH / 6), HALFHEIGHT);  
    dimensions[i].attr("stroke-width", STROKE);
    if (elements & 0x01) {
      // console.log("elements: " + elements);
      dimensions[i].attr("fill", colors[i]);
      var lab = paper.text(dimensions[i].getBBox().x + ((FULLWIDTH / 6) / 2), (dimensions[i].getBBox().y / 2) + HALFHEIGHT, labels[i]);
      lab.attr("fill", txtcolor[i]);
    }
    elements = elements >> 1;
  }
  
  var outer = paper.rect(0,0, FULLWIDTH, FULLHEIGHT);
  outer.attr("stroke-width", STROKE * 2);
};
// Attach the categories to the function.
fink.F  =    0x01;
fink.A  =  fink.F << 1;
fink.I  =  fink.A << 1;
fink.HD =  fink.I << 1;
fink.C  = fink.HD << 1;
fink.LL =  fink.C << 1;


String.prototype.contains = function(it) { return this.indexOf(it) != -1; };

var dayName = function (d) {
  var days = ["Sun", "Mon", "Tues", "Wed", "Thur", "Fri", "Sat"]
  return days[d];
  
};

var member = function (ls, v) {
  var result = false;
  
  for (var i = 0; i < ls.length; i++) {
    if (v == ls[i]) {
      result = true;
    }
  }
  return result;
};


var awesome = function (ico) {
  return '<i class="fa fa-' + ico + '"></i>'
};

var icons = { "reading"     : awesome("book"), 
              "pdf"         : "<img src='{{site.base}}/images/pdf.png'/>",
              "doc"         : "<img src='{{site.base}}/images/doc.png'/>",
              "code"        : awesome("linux"),
              "planning"    : awesome("cogs"),
              "warning"     : awesome("warning-sign"),
              "www"         : awesome("globe"),
              "calendar"    : awesome("calendar"),
              "video"       : awesome("facetime-video"),
              "think"       : awesome("cogs"),
              "idea"        : awesome("lightbulb"),
              "arrow-up"    : awesome("circle-arrow-up"),
              "group"       : awesome("group"),
              "reading"        : awesome("book"),
              "local"       : "<img src='{{site.base}}/images/bclogo24.png'/>",
              "berea24"       : "<img src='{{site.base}}/images/bclogo24.png'/>",
              "berea16"     : "<img src='{{site.base}}/images/bclogo16.png'/>",
              "default"     : "",
              "proto"       : awesome("wrench"),
              "prototyping" : awesome("wrench"),              
              "making"      : awesome("wrench"),
            };
            
var getIcon = function (allcats) {
  result = "";
  // console.log(Object.keys(icons));
  ls = Object.keys(icons);
  for (var i = 0 ; i < ls.length ; i++) {
    cat = ls[i];
    if (allcats.contains(cat)) {
      if (result == "") {
        // console.log("Cat: " + cat + " categories: " + allcats);
        result += icons[cat];
      } else {  
        result += " , " + icons[cat];
      }
    }
  }
  return result;
};

var isReleased = function (after) { 
  /* Here's a way to cheat when testing on localhost. 
  I can pretend it is some date in the future for purposes of 
  testing my release dates. */
  if (window.location.hash.indexOf("#date") != -1) {
    var re = /date(\d+)/;
    
    var result = re.exec(window.location.hash);
    
    if (moment(after, "YYYYMMDD").unix() < moment(result[1], "YYYYMMDD").unix()) {
      return true;
    }
  }
  
  switch (after) {
  case "":
    return false;
  case "now":
    return true;
  default:
    return moment(after, "YYYYMMDD").unix() < moment().unix(); 
  }
};

var onlyInFuture = function (due, txt) {
  var m;
  var returnText = "";
  m = parseDueDate(due);
  
  if (m.diff(moment(), 'days') >= 0) {
    returnText = txt;
  }
    
  return returnText;
};

// 5 or less days, RED
// 8 or less days, YELLOW
// 9 or more days, GREEN
// Past? Light grey
var getRangeColor = function (mom) {
  var difference = mom.diff(moment(), 'days');
  if (difference >= 0) {
    if (difference <= 5) {
      return "label-danger";
    } else if (difference <= 8) {
      return "label-warning";
    } else if (difference >= 9) {
      return "label-success";
    }
  } else {
    return "label-default";
  }
};

var isValidDueDate = function (due) {
  return (due.length == 12 || due.length == 8);
};

var parseDueDate = function (due) {
  var m;
  if (due.length == 12) {
    m = moment(due, "YYYYMMDDHHmm");
  } else if (due.length == 8) {
    m = moment(due, "YYYYMMDD");
  }
  
  return m;
};
