<html>
   <head>
      <title>3-D Secure Example</title>
      <script type="text/javascript">
          function OnLoadEvent()
          {
            // Make the form post as soon as it has been loaded.
            document.ThreeDForm.submit();
          }
      </script>
   </head>
   <body onload="OnLoadEvent();">
      <p>
          If your browser does not start loading the page,
          press the button below.
          You will be sent back to this site after you
          authorize the transaction.
      </p>
      <form name="ThreeDForm" method="POST" action="{{ $url }}">
          <button type=submit>Click Here</button>
          <input type="hidden" name="PaReq" value="{{ $data }}" />
          <input type="hidden" name="TermUrl" value="{{ $termUrl }}" />
          <input type="hidden" name="MD" value="{your_identifier}" />
      </form>
   </body>
</html>