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
</head>
<body>
	<div>${message}</div>
	<div>
		<form action="alert" method="post">
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
			<input type="submit" value="Submit">
		</form>
	</div>
	<h1>Currently Set Alerts</h1>
	
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
	

</body>
</html>