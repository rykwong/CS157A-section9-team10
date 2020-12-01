<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<style>
				nav {
				  position: fixed;
				  left: 0;
				  bottom: 0;
				  width: 100%;
				  height: 8%;
				  color: white;
				  text-align: center;
				}
				.nav a{
					padding: 10px;
				}
				</style>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			  <a class="navbar-brand" style="display:block; padding:10px;font-size: 40px " href="dangeralert.jsp">Danger Alert</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			    <div class="navbar-nav">
			      <a class="nav-item nav-link active" style="display:block; padding:10px;font-size: 20px " href="dangeralert.jsp">Home <span class="sr-only">(current)</span></a>
			      <a class="nav-item nav-link" style="display:block; padding:10px; font-size: 20px" href="Announcements.jsp">Announcement </a>
			      <a class="nav-item nav-link"style="display:block; padding:10px; font-size: 20px"  href="MemberOfDepartments.jsp">Members From Departments</a>
			     
			    </div>
			  </div>
			  <ul class="nav navbar-nav navbar-right">
     		<% boolean isAuth = (Boolean)session.getAttribute("isAuth");
     		if(isAuth){ %>
     			 <li> <a class="nav-item nav-link active" style="display:block; padding:10px;font-size: 20px " href="admintest.jsp">Admin <span class="sr-only">(current)</span></a></li>
     		<%} %>
     		<% boolean isAdmin = (Boolean)session.getAttribute("isAdmin");
     		if(isAdmin){ %>

     			 <li> <a class="nav-item nav-link active" style="display:block; padding:10px;font-size: 20px " href="authoritiestest.jsp">Authority <span class="sr-only">(current)</span></a></li>
     			 <%} %>
     		   <li> <a class="nav-item nav-link active" style="display:block; padding:10px;font-size: 20px " href="index_form.jsp">Logout <span class="sr-only">(current)</span></a></li>
   		 </ul>
			</nav>
			
			
	<div class="d-flex justify-content-center" style="margin-top:1%;margin-left:20%;margin-right:20%; width:50%;position:relative;">
	<table class="table">
	 <thead class="thead-dark">
		<tr>
			<th>Title</th>
			<th>Description</th>
			<th>Location</th>
			<th>Date/Time</th>
			<th>Type</th>
		</tr>
	</thead>
		<tr>
			<td>${actionreport.title}</td>
			<td>${actionreport.description}</td>
			<td>${actionreport.location}</td>
			<td>${actionreport.datetime}</td>
			<td>${actionreport.type}</td>
		</tr>
	</table>
	</div>
   
      <div id="Second" class="row" style="margin-top:1%;margin-left:20%;margin-right:20%; width:50%;position:relative;" >
	<form action="delete" method="post">
		<div class="form-group" style="">
		<label>Reason:</label><br> 
		<select class="form-control" id="reason" name="reason">
			<option value=""></option>
			<option value="resolved">Resolved</option>
			<option value="spam">Spam</option>
			<option value="misinformation">Misinformation</option>
		</select>
		<br>
		<label>Action to take:</label><br> 
		<select class="form-control" id="action" name="action">
			<option value=""></option>
			<option value="removed">Remove</option>
			<option value="flagged">Flag</option>
		</select>
		<input type="hidden" name="id" value=${actionreport.id}><br>
		<button type="submit">Update</button>
		</div>
	</form>

	</div>
	<div id="Second" class="row" style="margin-top:1%;margin-left:20%;margin-right:20%; width:50%;position:relative;" >
	<a class="btn btn-primary btn-lg" href="admintest.jsp" role="button">Admin Page</a>
	</div>
</body>
</html>