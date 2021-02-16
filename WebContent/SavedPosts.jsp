<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "dangeralert.Report" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.*" %>
<%@ page import = "dangeralert.*" %>
<%@ page import = "dangeralert.Auth" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Saved Reports</title>
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

<% ArrayList<Report> reports = new ArrayList<>();  

User user = (User)request.getSession().getAttribute("user");
String jdbcURL = Auth.jdbcURL;
String dbUser = Auth.dbUser;
String dbPassword = Auth.dbPassword;
	
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

String sql = "SELECT * FROM Report, Save WHERE Report.reportid = Save.reportid && Save.userid =?";
PreparedStatement statement1 = connection.prepareStatement(sql);
statement1.setString(1, Integer.toString(user.getId()));
ResultSet result = statement1.executeQuery();

while(result.next())
{
	Report report = new Report();
	report.setId( result.getInt("reportid"));
	report.setTitle(result.getString("title"));
	report.setDescription(result.getString("description"));
	report.setLocation(result.getString("location"));
	report.setType(result.getString("type"));
	report.setDatetime(result.getTimestamp("datetime"));
	reports.add(report);
}

%>

<% if(reports.size()!=0){ %>
<div class="d-flex justify-content-center" style="margin-top:1%;margin-left:5%;margin-bottom:0; width:80%">
	<h1>Saved Posts</h1>
<table class="table">
  <thead class="thead-dark">
    <tr>
     
      <th scope="col">Title</th>
      <th scope="col">Description</th>
       <th scope="col">Location</th>
      <th scope="col">Type</th>
       <th scope="col">Date&Time</th>
    </tr>
  </thead>
  <tbody>
  
  
   
    <%for(int i = 0; i<reports.size();i++){%>
		<tr>
		<% Report report = (Report)reports.get(i); %>

			<td><%=report.getTitle()%></td>
			<td><%=report.getDescription()%></td>
			<td><%=report.getLocation()%></td>
			<td><%=report.getType()%></td>
			<% Timestamp ts = report.getDatetime(); %>
			<td><%=ts.toString() %></td>
			
			<form method ="Post" action="RemoveSavedPostButton"> 
			<input type="hidden"  name="reportId" value="<%=report.getId()%>">
			
			<td>
			<button type="submit" class="btn btn-danger" onclick="alert('Post has been removed.')">Remove</button>
			</td>
		</tr>
		
	<% }%>
	</tbody>
	</table>
	</div>
	<div id="Second" class="row" style="margin-left:15%; margin-bottom:2%;width:50%;" >
	<a class="btn btn-primary btn-lg" href="dangeralert.jsp" role="button">Home Page</a>
	</div>
	<%}else{ %>
	<div class="jumbotron" style="margin-top:1%;margin-left:5%;margin-bottom:0; width:80%">
	  <h1 class="display-4">Sad,You have not saved any reports</h1>
	  <p class="lead">Please come back after you saved some reports</p>
	</div>
	<div id="Second" class="row" style="margin-left:5%; margin-bottom:2%;width:50%;" >
	<a class="btn btn-primary btn-lg" href="dangeralert.jsp" role="button">Home Page</a>
	</div>
	<%} %>
    
  



</body>
</html>