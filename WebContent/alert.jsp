<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ page import= "dangeralert.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alert Test Page</title>
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
			
	<h1 style="margin-top:1%;margin-left:40%; width:50%">Currently Set Alerts</h1>	
	<div>${message}</div>	
	<div class="d-flex justify-content-center" style="margin-top:1%;margin-left:20%;margin-right:20%; width:50%;position:relative;">		
	
	<div class="form-group">
		<form  action="alert" method="post">
			<label for="IncidentType">Type of Incident:</label><br> 
			<select id="IncidentType" name="IncidentType">
				<option value=""></option>
				<option value="Fire">Fire</option>
				<option value="Crime">Crime</option>
				<option value="Natural Calamity">Natural Calamity</option>
				<option value="Accident">Accident</option>
				<option value="Animal Abuse">Animal Abuse</option>
				<option value="Health Hazard">Health Hazard</option>
			</select> 
			<br> 
			<label for="location">Location:</label><br> 
			<select id="location" name="location">
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
			</select> 
			<br>  
			<input onclick="authorities.jsp" style="margin-top:10%"class="btn btn-primary btn-lg" type="submit" value="Submit">
		</form>
	</div>
	
	
		<%
			try {
			String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
			String dbUser = "root";
			 String dbPassword = "9Cn99N54!";

			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

			User user = (User)request.getSession().getAttribute("user");
			String sql = "SELECT * FROM Alert WHERE userid =?";
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setInt(1, user.getId());
			ResultSet result = statement.executeQuery();
			if(!result.isBeforeFirst()){%>
				<h2>You currently have no alerts set</h2>
			<%}
			while (result.next()) {%>
		<table>
		<tr>
			<td>Type</td>
			<td>Location</td>
		</tr>
		<tr>
			<td><%=result.getString("type") %></td>
			<td><%=result.getString("city") %></td>
			<td><form action="deletealert" method="POST"><input type="hidden" name="id" value=<%=result.getInt("alertid")%>><button type="submit">Delete</button></form></td>
		</tr>
		</table>
				<% 
				
				String type = result.getString("type");
				String city = result.getString("city");
				sql = "SELECT * FROM Report NATURAL JOIN Reports WHERE type=? AND location=? ORDER BY datetime DESC";
				PreparedStatement statement2 = connection.prepareStatement(sql);
				statement2.setString(1,type);
				statement2.setString(2,city);
				ResultSet result2 = statement2.executeQuery();
				if(!result2.isBeforeFirst()){%>
				<table>
					<tr>
						<td>No reports found with these parameters</td>
					</tr>
				</table>
				<br>
				<%}

				while(result2.next()){
					
		%>
		<br>
		<table border="1">
		<tr>
			<td>User</td>
			<td>Title</td>
			<td>Description</td>
			<td>Location</td>
			<td>Date/Time</td>
			<td>Type</td>
		</tr>
		<tr>
			<td><%=result2.getInt("userid") %></td>
			<td><%=result2.getString("title") %></td>
			<td><%=result2.getString("description") %></td>
			<td><%=result2.getString("location") %></td>
			<td><%=result2.getTimestamp("datetime") %></td>
			<td><%=result2.getString("type") %></td>
			<td><form action="userinfo" method="POST"><input type="hidden" name="id" value=<%=result2.getInt("reportid")%>><button type="submit">Get Info</button></form></td>
		</tr>
		</table>
		<br>
		<%
				}
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	
</div>
</body>
</html>