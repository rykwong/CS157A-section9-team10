<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Login & Registration Form Using HTML CSS & JavaScript</title>
	<link rel="stylesheet" href= "css/stylek.css" type="text/css">
</head>

<body>
	
	
	<div class="login-page">
	
	<div class="form">	
		
	  <form class="register-form" action="register" method="post">
		
		<input type="text" placeholder="user name" name="user"/>
	    <input type="text" placeholder="password" name="password"/>
		<input type="text" placeholder="email id" name="email"/>
		  <button type="submit">Create</button>
		  
		  <p class="message">
		   Already Registered<a href="#">Login</a>
		  </p>
		  
	   </form>
      <form class="login-form" action="login" method="post">
		<input type="text" placeholder="user name" name="user"/>
	    <input type="text" placeholder="password" name="password"/>
		<input type="text" placeholder="email id" name="email"/>
		<br>${message}
		  <button type="submit">login</button>  
	 <p class="message"> 
	      Not Registered?<a href="#">Register</a>
	 </p>
		  
    </form>

		</div>
</div>
	
	
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	
	<script>
		
		$('.message a').click(function(){
			
			$('form').animate({height:"toggle",opacity:"toggle"},"slow");
		});
	
	</script>
	

</body>
</html>
