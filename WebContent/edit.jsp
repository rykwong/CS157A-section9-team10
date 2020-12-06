<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dangeralert.Report" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
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
			
			
			
	<div class="d-flex justify-content-center" style="margin-top:1%;margin-left:20%;margin-right:20%; width:50%; position:relative;">
		<form action="editreport" method="post">
			<label for="title">Title:</label><br>
			<textarea style="width: 100%; margin-left: 0%" class="form-control"
				id="title" name="title" rows="2">${editreport.title}</textarea>
			<label for="IncidentType">Type of Incident:</label><br> <select
				id="IncidentType" name="IncidentType">
				<option value=""></option>
				<option value="Fire">Fire</option>
				<option value="Crime">Crime</option>
				<option value="Natural Calamity">Natural Calamity</option>
				<option value="Accident">Accident</option>
				<option value="Animal Abuse">Animal Abuse</option>
				<option value="Health Hazard">Health Hazard</option>
			</select>
			<br> <label for="location">Location:</label><br> <select
				id="location" name="location">
				<option value=""></option>
				<option value="San Jose">San Jose</option>
				<option value="Santa Clara">Santa Clara</option>
				<option value="Campbell">Campbell</option>
				<option value="Gilroy">Gilroy</option>
				<option value="Los Altos">Los Altos</option>
				<option value="Milpitas">Milpitas</option>
				<option value="Morgan Hill">Morgan Hill</option>
				<option value="Mountain View">Mountain View</option>
				<option value="Palo Alto">Palo Alto</option>
				<option value="Cupertino">Cupertino</option>
				<option value="Saratoga">Saratoga</option>
				<option value="Los Gatos">Los Gatos</option>
			</select> <br> <label for="description">Description:</label><br>
						<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
			<script>
				$(function() {
					$("#IncidentType").val('${editreport.type}');
					$("#location").val('${editreport.location}');
				});
			</script>
			<textarea style="width: 100%; margin-left: 0%" class="form-control"
				id="description" name="description" rows="4">${editreport.description}</textarea>
			<input type="hidden" name="id" value="${editreport.id}"><br>
			<input style="margin-top: 1%; margin-bottom: 1%;"
				class="btn btn-primary btn-lg" type="submit" value="Submit">
		</form>
	</div>
   
	<div id="Second" class="row" style="margin-top:1%;margin-left:20%;margin-right:20%; width:50%;position:relative;" >
	<a class="btn btn-primary btn-lg" href="dangeralert.jsp" role="button">Home Page</a>
	</div>
</body>
</html>