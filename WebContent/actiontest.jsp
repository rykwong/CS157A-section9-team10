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
	<form action="delete" method="post">
		<label>Reason:</label><br> 
		<select id="reason" name="reason">
			<option value=""></option>
			<option value="resolved">Resolved</option>
			<option value="spam">Spam</option>
			<option value="misinformation">Misinformation</option>
		</select>
		<br>
		<label>Action to take:</label><br> 
		<select id="action" name="action">
			<option value=""></option>
			<option value="removed">Remove</option>
			<option value="flagged">Flag</option>
		</select>
		<input type="hidden" name="id" value=${actionreport.id}><br>
		<button type="submit">Update</button>
	</form>
</body>
</html>