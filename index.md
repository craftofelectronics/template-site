---
title: At a Glance
hideTitle: true
layout: default
---

{% for todo in site.data.todo %}
<div class="row">
  <div class="col-md-10 offset-1">
    <h3>{{todo[1].question}}</h3>
  </div>
</div>
{% for part in todo[1].parts %}
  <div class="row">  
    <div class="col-md-2" id="{{part.title | remove: " " }}-{{part.due}}"> </div>
    <div class="col-md-8" style="padding-bottom: 10px;">
      <a href="todo/{{assign[1].base}}/{{part.file}}.html">
        {{part.title}}
      </a>
      <span style="font-size: 80%;" class="pull-right" id="{{part.title | remove: " " }}-prettydate-{{part.due}}"> </span>
    </div>
  </div>
  <script type='text/javascript'> 
    dueIn("{{part.title | remove: " " }}", "{{part.due}}", "{{part.inclass}}"); 
    prettyDate("{{part.title | remove: " " }}-prettydate-{{part.due}}", "{{part.due}}", ""); 
  </script>
{% endfor %}
{% endfor %}

<table id='activities' class='table table-striped table-hover'>
  <tbody>

  <tr>
    <td width='5%'> <h3></h3> </td>
    <td width='75%' style='padding: 8px;'><h3>To Do</h2></td>
    <td width='20%' style='padding: 8px;'><h3>Date</h2></td>
  </tr>
</tbody>
</table>


{% comment %}
  This block generates the list of pages that we want to render.
  It eliminates all pages that don't have a title.
  It only looks for pages in the categories "learn" or "interact"
  It pads the date with the classtime (if available) or midnight (otherwise)
  Everything becomes part of a list of hashes... or anonymous objects...
  whatever they are in Javascript.
{% endcomment %}

{% for page in site.pages  %}
  {% if page.title != '' %}
    {% for cat in site.inclass %}
      {% if (page.release contains "now") and (page.categories contains cat) %}
        {% capture date_length %}{{ page.date | size | minus: 9 }}{% endcapture %}
        {% capture date %}{{page.date}}{% endcapture %}
        {% if date_length contains '-' %}
          {% if site.classtime %}
            {% capture date %}{{page.date}}{{site.classtime}}{% endcapture %}
          {% else %}
            {% capture date %}{{page.date}}0000{% endcapture %}
          {% endif %}
        {% endif %}
        {% capture inclassEntries %}{{inclassEntries}}
        {url: '{{site.base}}{{page.url}}', 
        title: '{{page.title}}', 
        categories: '{{page.categories}}', 
        date: '{{date}}', 
        release: '{{page.release}}',
        nolink: '{{page.nolink}}'},
        {% endcapture %}
      {% endif %}    
    {% endfor %}
  {% endif %}
{% endfor %}


{% for page in site.pages  %}
  {% if page.title != '' %}
    {% for cat in site.todo %}
      {% if (page.release contains "now") and (page.categories contains cat) %}
        {% capture date_length %}{{ page.date | size | minus: 9 }}{% endcapture %}
        {% capture date %}{{page.date}}{% endcapture %}
        {% if date_length contains '-' %}
          {% if site.classtime %}
            {% capture date %}{{page.date}}{{site.classtime}}{% endcapture %}
          {% else %}
            {% capture date %}{{page.date}}0000{% endcapture %}
          {% endif %}
        {% endif %}
        {% capture todoEntries %}{{todoEntries}}
        {url: '{{site.base}}{{page.url}}', 
        title: '{{page.title}}', 
        categories: '{{page.categories}}', 
        date: '{{date}}', 
        release: '{{page.release}}',
        nolink: '{{page.nolink}}'},
        {% endcapture %}
      {% endif %}    
    {% endfor %}
  {% endif %}
{% endfor %}

<script>
var todo = [   
  {{todoEntries}}
];

var inclass = [   
  {{inclassEntries}}
];

var sortDueDates = function (a, b) {  
  if (a.date > b.date) { return 1; } else { return -1; }
};

pages = todo.concat(inclass);
pages.sort(sortDueDates).reverse();

for (var i = 0; i < pages.length ; i++) {  
  makeRow(pages[i], "activities");  
}



</script>
