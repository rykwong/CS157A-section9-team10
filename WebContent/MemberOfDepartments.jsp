<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import = "dangeralert.User" %>
<%@ page import = "dangeralert.Auth" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member of Department</title>
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
			<h1 style="margin-top:1%;margin-left:30%;margin-bottom:1%; width:80%">Members From Departments</h1>
<div class="d-flex justify-content-center" style="margin-top:1%;margin-left:30%;margin-bottom:1%; width:80%">

<table class="table" >

  <thead class="thead-dark">
    <tr>
      <th scope="col">Authority Name</th>
      <th scope="col">Department</th>
      <th scope="col">Jurisdiction</th>
    </tr>
  </thead>
  
	<%
	User user = (User)request.getSession().getAttribute("user");
	String[] city = request.getParameterValues("filter");
    String jdbcURL = Auth.jdbcURL;
    String dbUser = Auth.dbUser;
    String dbPassword = Auth.dbPassword;
		
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	String sql = "SELECT us.username,de.departmentName, de.jurisdiction FROM Users us, (SELECT userid,departmentName,jurisdiction  FROM MemberOf me,LawEnforcement la, Department de  WHERE la.officerid=me.officerid AND me.departmentName=de.name) de NATURAL JOIN LawEnforcement WHERE us.userid = de.userid ORDER BY de.departmentName;";
	Statement statement = connection.createStatement();
    ResultSet result = statement.executeQuery(sql);
    
    while(result.next()){
	%>
					
	<tr>
	<td><%=result.getString("username")%></td>
	<td><%=result.getString("departmentName") %></td>
	<td><%=result.getString("jurisdiction") %></td>
	</tr>
<%}	%>
</table>
<div class="container">
  <div class="row">
      <div id="Second" class="row" style="margin-left:25%; margin-bottom:2%;width:50%;" >
	<a class="btn btn-primary btn-lg" href="dangeralert.jsp" role="button">Home Page</a>
	</div>
  </div>
</div>
</div>



</body>
</html>