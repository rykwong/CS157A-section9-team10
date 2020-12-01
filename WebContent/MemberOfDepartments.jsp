<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import = "dangeralert.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member of Department</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<br>
<br>
<div>
<table class="table" style= "width: 90%; margin-left:auto; margin-right:auto ">

  <thead class="thead-dark">
    <tr>
      <th scope="col">Department</th>
      <th scope="col">User Name</th>
      <th scope="col">Jurisdiction</th>
    </tr>
  </thead>
  
	<%
	User user = (User)request.getSession().getAttribute("user");
	String[] city = request.getParameterValues("filter");
    String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
    String dbUser = "root";
    String dbPassword = "9Cn99N54!";
		
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
    <div class="col text-center">
      <button class="btn btn-primary btn-lg" ><a style="color:white" href="dangeralert.jsp">Home Page</a></button>
    </div>
  </div>
</div>
</div>



</body>
</html>