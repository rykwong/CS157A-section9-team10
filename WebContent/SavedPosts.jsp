<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "dangeralert.Report" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import = "java.sql.*" %>

<% ArrayList reports = (ArrayList)request.getAttribute("reports"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Saved Reports</title>
</head>
<body>
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
		</tr>
	<% }%>
	<%}else{ %>
	<div class="jumbotron">
	  <h1 class="display-4">Sad,You have not saved any reports</h1>
	  <p class="lead">Please come back after you saved some reports</p>
	</div>
	<%} %>
    
  </tbody>
</table>
<p class="lead">
	    <a class="btn btn-primary btn-lg" href="dangeralert.jsp" role="button">Home Page</a>
	  </p>
</body>
</html>