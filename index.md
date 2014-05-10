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
      <a href="todo/{{todo[1].base}}/{{part.file}}.html">
        {{part.title}}
      </a>
      <span style="font-size: 80%;" class="pull-right" id="{{part.title | remove: " " }}-prettydate-{{part.due}}"> </span>
    </div>
  </div>
  <script type='text/javascript'> 
    dueIn("{{part.title | remove: " " }}-{{part.due}}", "{{part.due}}", "{{part.inclass}}", "", "90%"); 
    prettyDate("{{part.title | remove: " " }}-prettydate-{{part.due}}", "{{part.due}}", ""); 
  </script>
{% endfor %}
{% endfor %}
