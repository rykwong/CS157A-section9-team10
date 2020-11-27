<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Test Page</title>
</head>
<body>
	<div>${message}</div>
	<table border="1">
		<tr>
			<td>User</td>
			<td>Title</td>
			<td>Description</td>
			<td>Location</td>
			<td>Date/Time</td>
			<td>Type</td>
		</tr>
		<%
			try {
			String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
			String dbUser = "root";
			String dbPassword = "9Cn99N54!";

			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

			String sql = "SELECT * FROM Report NATURAL JOIN Reports ORDER BY datetime DESC";
			Statement statement = connection.createStatement();
			ResultSet result = statement.executeQuery(sql);

			while (result.next()) {
		%>
		<tr>
			<td><%=result.getInt("userid") %></td>
			<td><%=result.getString("title") %></td>
			<td><%=result.getString("description") %></td>
			<td><%=result.getString("location") %></td>
			<td><%=result.getTimestamp("datetime") %></td>
			<td><%=result.getString("type") %></td>
			<td><form action="userinfo" method="POST"><input type="hidden" name="id" value=<%=result.getInt("reportid")%>><button type="submit">Get Info</button></form></td>
		</tr>
		<%
			}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
</body>
</html>