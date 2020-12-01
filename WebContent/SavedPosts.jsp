<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "dangeralert.Report" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.*" %>
<%@ page import = "dangeralert.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Saved Reports</title>
</head>
<body>

<% ArrayList<Report> reports = new ArrayList<>();  

User user = (User)request.getSession().getAttribute("user");
String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
String dbUser = "root";
String dbPassword = "31464573";
	
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
<H1>Saved Reports</H1>

<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Id</th>
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
		  <th scope="row"><%=report.getId()%></th>
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
	<%}else{ %>
	<div class="jumbotron">
	  <h1 class="display-4">Sad,You have not saved any reports</h1>
	  <p class="lead">Please come back after you saved some reports</p>
	</div>
	<%} %>
    
  </tbody>
</table><a class="btn btn-primary btn-lg" href="dangeralert.jsp" role="button">Home Page</a>
	  
</body>
</html>