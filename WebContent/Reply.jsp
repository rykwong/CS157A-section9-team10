<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import = "dangeralert.User" %>
<%@ page import = "dangeralert.Report" %>

<html>
   <head>
      <title>Danger Alert</title>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <link rel="stylesheet" type="text/css" href="css/style.css" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
      <script>
         window.onload = function () { 
         var today = new Date();
          document.getElementById('dateDisplay').innerHTML=new Date().toDateString();
          }
          
         function myReportFeed() {
           var x = document.getElementById("ReportFeed");
           if (x.style.display === "none") {
         	x.setAttribute('style', 'display:block'); 
           } else {
           x.setAttribute('style', 'display:none'); 
           }
         }
      </script>
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
			      <a class="nav-item nav-link" style="display:block; padding:10px;font-size: 20px " href="dangeralert.jsp">Home</a>
			      <a class="nav-item nav-link active" style="display:block; padding:10px; font-size: 20px" href="Announcements.jsp">Announcement <span class="sr-only">(current)</span></a>
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
			
            <div class="row">
               <div class="columnProfile" style="height:80%">
                  <div class="card">
                    <img src="images/abt_img2.png" alt="John" style="width:100%">
                     <h1>Hello, ${user.username}</h1>
                    
                  </div>
               </div>
                <div class="columnFeed marginRgt5 marginLft">
			   <h1>Replies</h1>
			   <h2>${message}</h2>
				  	<div class="d-flex justify-content-center" style="margin-top:1%;margin-left:20%;margin-right:20%; width:50%;position:relative;">
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th>Title</th>
									<th>Description</th>
									<th>Location</th>
									<th>Date/Time</th>
									<th>Type</th>
								</tr>
							</thead>
							<tr>
								<td>${replyreport.title}</td>
								<td>${replyreport.description}</td>
								<td>${replyreport.location}</td>
								<td>${replyreport.datetime}</td>
								<td>${replyreport.type}</td>
							</tr>
						</table>
					</div>
     			<div class="ReportFeed" style="margin-bottom:1%">
                     <button class="btn btn-warning btn-lg" onclick=myReportFeed() > Reply to Report</button>
                  </div>
                  
                  <div class="ToogleReportFeed " style="margin-top:1%">
                     <div id="ReportFeed" class="ReportForm">
                        <form action="reply" method="post">
                           <label for="description">Reply</label><br>
                          
                            <textarea  style="width:50%; margin-left:25%" class="form-control" id="reply" name="reply"  rows="3"></textarea><br>
                           <input class="btn btn-primary btn-lg" type="submit" value="Submit">
                          
                        </form>
                     </div>
                  </div>
				  <br>

					<table class="table"">
					  <thead class="thead-dark">
					    <tr>
					   		<th scope="col">User</th>
					      <th scope="col">Reply</th>
					       <th scope="col">Date&Time</th>
					    </tr>
					  </thead>

					<%
					try{
						User user = (User)request.getSession().getAttribute("user");
						Report report = (Report)request.getSession().getAttribute("replyreport");
				        String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
				        String dbUser = "root";
				        String dbPassword = "9Cn99N54!";
				 		
				        Class.forName("com.mysql.jdbc.Driver");
				        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
				        
				        String sql = "SELECT * FROM Reply NATURAL JOIN Users WHERE reportid=" + report.getId() + " ORDER BY timestamp DESC";
				        Statement statement = connection.createStatement();
				        ResultSet result = statement.executeQuery(sql);
				       
				 
				        
						while(result.next()){
						%>
						<tr>
						<td><%=result.getString("username")%></td>
						<td><%=result.getString("text") %></td>
						<td><%=result.getTimestamp("timestamp") %></td>
						<%if(result.getInt("userid") == user.getId()){ %>
							<td><form action="deletereply" method="POST"><input type="hidden" name="id" value=<%=result.getInt("replyid")%>><button type="submit">Delete</button></form></td>
						<%}
						}			
						connection.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
					%>
					</table>
				 
               </div>

            <style>
			.footer {
			  position: fixed;
			  left: 0;
			  bottom: 0;
			  width: 100%;
			  height: 5%;
			  background-color: black;
			  color: white;
			  text-align: center;
			}
			.footer p{
				font-size: 25px;
			}
			</style>
			
			<div class="footer">
			  <p >Footer</p>
			</div>
         </div>
      </div>
     <div id="Second" class="row" style="margin-left:25%; margin-bottom:2%;width:50%;" >
	<a class="btn btn-primary btn-lg" href="dangeralert.jsp" role="button">Home Page</a>
	</div>
   </body>
</html>