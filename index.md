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
  {% assign theID = part.title | remove: " " | remove: "." | remove: "," %}
  {% capture date_length %}{{ part.date | size | minus: 9 }}{% endcapture %}
  {% capture date %}{{part.date}}{% endcapture %}
  {% if date_length contains '-' %}
    {% if site.classtime %}
      {% capture date %}{{part.date}}{{site.classtime}}{% endcapture %}
    {% else %}
      {% capture date %}{{part.date}}2359{% endcapture %}
    {% endif %}
  {% endif %}

  <div class="row">  
    <div class="col-md-2" id="{{theID}}-{{date}}"> </div>
    <div class="col-md-8" style="padding-bottom: 10px;">
      <a href="todo/{{todo[0]}}/{{part.file}}.html">
        {{part.title}}
      </a>
      <span style="font-size: 80%; padding: 10px;" class="pull-right" id="{{theID}}-prettydate"> </span>
    </div>
  </div>
  <script type='text/javascript'> 
    dueIn("{{theID}}-{{date}}", "{{date}}", "{{part.inclass}}", "", "90%"); 
    prettyDate("{{theID}}-prettydate", "{{date}}", ""); 
  </script>
{% endfor %}
{% endfor %}
