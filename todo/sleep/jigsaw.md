---
todo: sleep
file: jigsaw
---

{% include submission form="http://form.jotform.us/form/41446611663150" %}

<!-- 

<script type="text/javascript">

    var handleIPAddr = function (response) {
        
        var url = "http://form.jotform.us/jsform/41446611663150?";
        console.log(url);
        url += "ipaddr=" + response.ip;
        console.log(url);
        // $.getScript(url, function () { console.log("Loaded form."); });
        /*
        $.getScript( url, function( data, textStatus, jqxhr ) {
          console.log( data ); // Data returned
          console.log( textStatus ); // Success
          console.log( jqxhr.status ); // 200
          console.log( "Load was performed." );
        });
        */
        jQuery.ajax({
            async:false,
            type:'GET',
            url:url,
            data:null,
            success: function () { console.log("Done."); },
            dataType:'script',
            error: function(xhr, textStatus, errorThrown) {
                // Look at the `textStatus` and/or `errorThrown` properties.
            }
        });
    };
    
    // Get stuff
    $.get("http://ipinfo.io", handleIPAddr, "jsonp");    
</script>

<script type="text/javascript" src="http://form.jotform.us/jsform/41446611663150"></script>

<script type="text/javascript" src="http://form.jotform.us/jsform/41444149607152?fullName1[first]=Matt"></script>

{
  "ip": "8.8.8.8",
  "loc": "37.385999999999996,-122.0838",
  "city": "Mountain View",
  "region": "California",
  "country": "US",
}

http://stackoverflow.com/questions/950087/how-to-include-a-javascript-file-in-another-javascript-file


<script src="http://max.jotfor.ms/static/prototype.forms.js" type="text/javascript"></script>
<script src="http://max.jotfor.ms/static/jotform.forms.js?3.2.1983" type="text/javascript"></script>
<script src="https://js.jotform.com/vendor/postMessage.min.js" type="text/javascript"></script>
<script src="https://js.jotform.com/WidgetsServer.js" type="text/javascript"></script>
<script type="text/javascript">
   JotForm.init(function(){
      $('input_3').rating({stars:'5', inputClassName:'form-textbox', imagePath:'http://max.jotfor.ms/images/stars.png', cleanFirst:true, value:''});
   });
</script>
<link href="http://max.jotfor.ms/static/formCss.css?3.2.1983" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="http://max.jotfor.ms/css/styles/nova.css?3.2.1983" />
<link type="text/css" media="print" rel="stylesheet" href="http://max.jotfor.ms/css/printForm.css?3.2.1983" />
<style type="text/css">
    .form-label{
        width:150px !important;
    }
    .form-label-left{
        width:150px !important;
    }
    .form-line{
        padding-top:12px;
        padding-bottom:12px;
    }
    .form-label-right{
        width:150px !important;
    }
    .form-all{
        width:650px;
        color:#555 !important;
        font-family:'Lucida Grande';
        font-size:14px;
    }
</style>

<form class="jotform-form" action="http://submit.jotform.us/submit/41444149607152/" method="post" name="form_41444149607152" id="41444149607152" accept-charset="utf-8">
  <input type="hidden" name="formID" value="41444149607152" />
  <div class="form-all">
    <ul class="form-section">
      <li class="form-line" id="id_1">
        <label class="form-label-left" id="label_1" for="input_1"> Full Name </label>
        <div id="cid_1" class="form-input">
          <span class="form-sub-label-container">
            <input readonly="readonly" class="form-readonly form-textbox" type="text" size="10" name="q1_fullName1[first]" id="first_1" />
            <label class="form-sub-label" for="first_1" id="sublabel_first"> First Name </label>
          </span>
          <span class="form-sub-label-container">
            <input readonly="readonly" class="form-readonly form-textbox" type="text" size="15" name="q1_fullName1[last]" id="last_1" />
            <label class="form-sub-label" for="last_1" id="sublabel_last"> Last Name </label>
          </span>
        </div>
      </li>
      <li class="form-line" id="id_3">
        <label class="form-label-left" id="label_3" for="input_3"> Click to edit </label>
        <div id="cid_3" class="form-input">
          <div id="input_3" name="q3_clickTo">
            <select name="q3_clickTo">
              <option value="1"> 1 </option>
              <option value="2"> 2 </option>
              <option value="3"> 3 </option>
              <option value="4"> 4 </option>
              <option value="5"> 5 </option>
            </select>
          </div>
        </div>
      </li>
      <li class="form-line" id="id_4">
        <label class="form-label-top" id="label_4" for="input_4"> TItle </label>
        <div id="cid_4" class="form-input-wide">
          <table summary="" cellpadding="4" cellspacing="0" class="form-matrix-table">
            <tr>
              <th style="border:none">
                &nbsp;
              </th>
              <th class="form-matrix-column-headers form-matrix-column_0">
                Very Satisfied
              </th>
              <th class="form-matrix-column-headers form-matrix-column_1">
                Satisfied
              </th>
              <th class="form-matrix-column-headers form-matrix-column_2">
                Somewhat Satisfied
              </th>
              <th class="form-matrix-column-headers form-matrix-column_3">
                Not Satisfied
              </th>
            </tr>
            <tr>
              <th align="left" class="form-matrix-row-headers">
                Fishing
              </th>
              <td align="center" class="form-matrix-values">
                <input class="form-radio" type="radio" name="q4_title[0]" value="Very Satisfied" />
              </td>
              <td align="center" class="form-matrix-values">
                <input class="form-radio" type="radio" name="q4_title[0]" value="Satisfied" />
              </td>
              <td align="center" class="form-matrix-values">
                <input class="form-radio" type="radio" name="q4_title[0]" value="Somewhat Satisfied" />
              </td>
              <td align="center" class="form-matrix-values">
                <input class="form-radio" type="radio" name="q4_title[0]" value="Not Satisfied" />
              </td>
            </tr>
          </table>
        </div>
      </li>
      <li class="form-line" id="id_5">
        <label class="form-label-left" id="label_5" for="input_5"> Click to edit... </label>
        <div id="cid_5" class="form-input">
          <div style="width:100%; text-align:Left;">
            <iframe onload="widgetFrameLoaded(5)" frameborder="0" scrolling="no" class="custom-field-frame" id="customFieldFrame_5" src="" style="border:none;width:516px; height: 442px">
            </iframe>
            <div>
              <input id="input_5" class="form-hidden form-widget" type="hidden" name="q5_clickTo5" value="">
            </div>
            <script>
            setTimeout(function()
{
  document.getElementById("customFieldFrame_5").src = "http://widgets.jotform.io/takephoto/?&qid=5&ref=" + encodeURIComponent(window.location.protocol + "//" + window.location.host);
}, 5);
var _JCFClientID = 5
            </script>
          </div>
        </div>
      </li>
      <li class="form-line" id="id_6">
        <label class="form-label-top" id="label_6" for="input_6"> Pick your favorite color. </label>
        <div id="cid_6" class="form-input-wide">
          <div style="width:100%; text-align:Left;">
            <iframe onload="widgetFrameLoaded(6)" frameborder="0" scrolling="no" class="custom-field-frame" id="customFieldFrame_6" src="" style="border:none;width:205px; height: 230px">
            </iframe>
            <div>
              <input id="input_6" class="form-hidden form-widget" type="hidden" name="q6_pickYour" value="">
            </div>
            <script>
            setTimeout(function()
{
  document.getElementById("customFieldFrame_6").src = "http://widgets.jotform.io/farbtasticColorPicker/?&qid=6&ref=" + encodeURIComponent(window.location.protocol + "//" + window.location.host);
}, 5);
var _JCFClientID = 6
            </script>
          </div>
        </div>
      </li>
      <li class="form-line" id="id_2">
        <div id="cid_2" class="form-input-wide">
          <div style="margin-left:156px" class="form-buttons-wrapper">
            <button id="input_2" type="submit" class="form-submit-button">
              Submit
            </button>
          </div>
        </div>
      </li>
      <li style="display:none">
        Should be Empty:
        <input type="text" name="website" value="" />
      </li>
    </ul>
  </div>
  <input type="hidden" id="simple_spc" name="simple_spc" value="41444149607152" />
  <script type="text/javascript">
  document.getElementById("si" + "mple" + "_spc").value = "41444149607152-41444149607152";
  </script>
  <script src="http://jotform.us/js/widgetResizer.js?REV=3.2.1983" type="text/javascript"></script>
</form>
-->