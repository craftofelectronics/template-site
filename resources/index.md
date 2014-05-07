---
layout: default
title: Resources
---

These are articles, documents, and web pages that you might find of use or interest throughout the term. Some will be explicitly referenced; others are here for your enjoyment.

### Local Resources
<table id="local" class="table table-striped table-hover">
  <tbody>
  </tbody>
</table>

### Articles
<table id="pdf" class="table table-striped table-hover">
  <tbody>
  </tbody>
</table>

<script>

var makeRow = function (url, title, type) {
  var activity  = "<a href='" + url + "'>" + title + "</a>";  
  var icon      = getIcon(type);
  var filling   = false;  
      
  var pie = "{{site.moustache}}";
  pie += "<tr >";
  pie += "<td width='10%'>[[&icon]]</td>";
  pie += "<td>[[&activity]]</td>";
  pie += "</tr>";


  if (icon) {
    console.log (url, " ", title, " ", type, " ");
    
    var filling = { activity: activity,
                    icon: icon,
                  };
      // Insert the row first
      var row = Mustache.to_html(pie, filling);
      $("#" + type + " > tbody:last").append(row);
  }
};


{% for page in site.pages sort_by: title %}
  {% if page.url contains "/resources" and page.resource %}
    makeRow("{{site.base}}{{page.url}}", 
      "{{page.title}}", 
      "{{page.resource}}"
          );
  {% endif %}
{% endfor %}

</script>
