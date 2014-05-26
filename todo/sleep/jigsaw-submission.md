---
todo: sleep
file: jigsaw
---


<script src="http://max.jotfor.ms/static/prototype.forms.js" type="text/javascript"></script>
<script src="http://max.jotfor.ms/static/jotform.forms.js?3.2.1983" type="text/javascript"></script>
<script src="https://js.jotform.com/vendor/postMessage.min.js" type="text/javascript"></script>
<script src="https://js.jotform.com/WidgetsServer.js" type="text/javascript"></script>
<script type="text/javascript">
   JotForm.setConditions([{"action":[{"field":"3","visibility":"Show"}],"id":"1401049727864","index":"0","link":"Any","priority":"0","terms":[{"field":"1","operator":"notEndsWith","value":"@berea.edu"}],"type":"field"},{"action":[{"field":"2","visibility":"Show"},{"field":"3","visibility":"Hide"}],"id":"1401049811254","link":"Any","terms":[{"field":"1","operator":"endsWith","value":"@berea.edu"}],"type":"field"}]);
   JotForm.init(function(){
      $('input_1_confirm').hint('Confirm Email');
      $('input_1').hint('ex: you@berea.edu');
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
        width:690px;
        color:#555 !important;
        font-family:'Lucida Grande';
        font-size:14px;
    }
</style>

<div>
<link type="text/css" rel="stylesheet" href="http://jotform.us/css/styles/buttons/form-submit-button-simple_green_apple.css?3.2.1983"/>
<form class="jotform-form" action="http://submit.jotform.us/submit/41446611663150/" method="post" name="form_41446611663150" id="41446611663150" accept-charset="utf-8">
  <input type="hidden" name="formID" value="41446611663150" />
  <div class="form-all">
    <ul class="form-section">
      <li class="form-line always-hidden" id="id_5">
        <label class="form-label-left" id="label_5" for="input_5">
          IPAddr
          <span class="form-required">
            *
          </span>
        </label>
        <div id="cid_5" class="form-input">
          <input type="text" class=" form-textbox validate[required]" data-type="input-textbox" id="input_5" name="q5_ipaddr" size="20" value="" />
        </div>
      </li>
      <li class="form-line" id="id_1">
        <label class="form-label-left" id="label_1" for="input_1">
          Berea Email Address
          <span class="form-required">
            *
          </span>
        </label>
        <div id="cid_1" class="form-input">
          <input type="email" class=" form-textbox validate[required, Email, disallowFree]" id="input_1" name="q1_bereaEmail1" size="40" value="" />
          <br>
          <input type="email" class="form-textbox validate[required, Email, Email_Confirm, disallowFree]" id="input_1_confirm" style="margin-top:8px;" size="40" />
        </div>
      </li>
      <li class="form-line" id="id_3">
        <div id="cid_3" class="form-input-wide">
          <div id="text_3" class="form-html">
            <p>You must use an email address ending in <strong>@berea.edu</strong>.</p>
          </div>
        </div>
      </li>
      <li class="form-line" id="id_4">
        <label class="form-label-left" id="label_4" for="input_4">
          Include your Photo!
          <span class="form-required">
            *
          </span>
        </label>
        <div id="cid_4" class="form-input">
          <div style="width:100%; text-align:Left;">
            <iframe onload="widgetFrameLoaded(4)" frameborder="0" scrolling="no" class="custom-field-frame" id="customFieldFrame_4" src="" style="border:none;width:516px; height: 442px">
            </iframe>
            <div>
              <input id="input_4" class="form-hidden widget-required form-widget" type="hidden" name="q4_includeYour" value="">
            </div>
            <script>
            setTimeout(function(){document.getElementById("customFieldFrame_4").src = "http://widgets.jotform.io/takephoto/?&qid=4&ref=" + encodeURIComponent(window.location.protocol + "//" + window.location.host);
}, 5);
var _JCFClientID = 4
            </script>
          </div>
        </div>
      </li>
      <li class="form-line" id="id_2">
        <div id="cid_2" class="form-input-wide">
          <div style="margin-left:156px" class="form-buttons-wrapper">
            <button id="input_2" type="submit" class="form-submit-button form-submit-button-simple_green_apple">
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
  <input type="hidden" id="simple_spc" name="simple_spc" value="41446611663150" />
  <script type="text/javascript">
  document.getElementById("si" + "mple" + "_spc").value = "41446611663150-41446611663150";
  </script>
  <script src="http://jotform.us/js/widgetResizer.js?REV=3.2.1983" type="text/javascript"></script>
</form>
</div>

<script type="text/javascript">
ipaddr = "0.0.0.0";

var handleIPAddr = function (response) {
  if (response && response.ip) {
    ipaddr = response.ip;
    $("#input_5").val(ipaddr);
  } // end if
};

$.get("http://ipinfo.io", handleIPAddr, "jsonp");    
</script>

<!-- 


<script type="text/javascript">
// This needs to be set by the callback.
// Hopefully, it executes before the students can hit submit...
jotformSubmit = null;
ipaddr = "0.0.0.0";

var handleIPAddr = function (response) {
  if (response && response.ip) {
    ipaddr = response.ip;
    console.log("ipaddr: " + ipaddr)
    jotformSubmit = function () {
      window.open("http://form.jotform.us/form/41446611663150?ipaddr=" + ipaddr, "_blank");
    };
  } // end if
};

$.get("http://ipinfo.io", handleIPAddr, "jsonp");    
</script>

<div>
<button type="button" class="btn btn-success btn-large" onclick="jotformSubmit();">
    Submit
</button>
</div>
-->