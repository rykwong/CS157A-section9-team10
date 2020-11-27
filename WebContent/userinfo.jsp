<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>Title</td>
			<td>Description</td>
			<td>Location</td>
			<td>Date/Time</td>
			<td>Type</td>
		</tr>
		<tr>
			<td>${actionreport.title}</td>
			<td>${actionreport.description}</td>
			<td>${actionreport.location}</td>
			<td>${actionreport.datetime}</td>
			<td>${actionreport.type}</td>
		</tr>
	</table>
		
	<table border="1">
		<tr>
			<td>Username</td>
			<td>Phone Number</td>
			<td>City</td>
		</tr>
		<tr>
			<td>${userinfo.username}</td>
			<td>${userinfo.phonenumber}</td>
			<td>${userinfo.city}</td>
		</tr>
	</table>
</body>
</html>