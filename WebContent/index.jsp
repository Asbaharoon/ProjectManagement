<!DOCTYPE html>
<html lang="en"><head>
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="description">
    <meta content="" name="author">

    <title>Signin Project Management</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/signin.css">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <form class="form-signin" action="controller?entity=Login" method="POST">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" autofocus="" required="" placeholder="Email address" class="form-control" name="email" id="email">
        <input type="password" required="" placeholder="Password" class="form-control" name="password" id="password">
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button type="submit" class="btn btn-lg btn-primary btn-block" id="btn-send" >Sign in</button>
        
        <p><div class="alert alert-danger" id="result"></div></p>
      </form>
		
		
	
    </div> <!-- /container -->
    
    
    <script  src="js/jquery-1.10.2.min.js"></script>
	<script  src="js/bootstrap.js"></script>
	
	<script>
	$(document).ready(function(){
	     
		$("#result").hide();
	    $("#btn-send").click(function(event) {
	            event.preventDefault();
	        $.ajax({
	            url: $(this).parent("form").attr("action"),
	            data: 'email=' +$("#email").val() + '&password=' +$("#password").val(),
	            type: 'POST',
	            success: function(data){
	            	
	            	var obj = jQuery.parseJSON(data);
	            	if(obj.status == 0) {
	            		$("#result").html(obj.error);
	            		$("#result").show();
	            	}
	            	else if(obj.status == 1){
	            		window.location = obj.url;
	            	}
	            	
	            },
		        error:function(){
		        	$("#result").html("There is error while submit.");
	            	$("#result").show();
		        }
	        
	        });    
	    });
	    
	});
	</script>

    
  

</body>
</html>