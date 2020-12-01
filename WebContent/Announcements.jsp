<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import = "dangeralert.User" %>

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
			  <a class="navbar-brand" style="display:block; padding:10px;font-size: 40px " href="#">Danger Alert</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			    <div class="navbar-nav">
			      <a class="nav-item nav-link" style="display:block; padding:10px;font-size: 20px " href="dangeralert.jsp">Home</a>
			      <a class="nav-item nav-link active" style="display:block; padding:10px; font-size: 20px" href="#">Announcement <span class="sr-only">(current)</span></a>
			      <a class="nav-item nav-link"style="display:block; padding:10px; font-size: 20px"  href="MemberOfDepartments.jsp">Members From Departments</a>
			     
			    </div>
			  </div>
			  <ul class="nav navbar-nav navbar-right">
     		
     		  <li> <a class="nav-item nav-link active" style="display:block; padding:10px;font-size: 20px " href="#">Authority <span class="sr-only">(current)</span></a></li>
     		   <li> <a class="nav-item nav-link active" style="display:block; padding:10px;font-size: 20px " href="#">Logout <span class="sr-only">(current)</span></a></li>
   		 </ul>
			</nav>
			
            <div class="row">
               <div class="columnProfile" style="height:80%">
                  <div class="card">
                     <img src="images/abt_img.jpg" alt="John" style="width:100%">
                     <h1>Hello, ${user.username}</h1>
                    
                  </div>
               </div>
               <div class="columnFeed marginRgt5 marginLft">
			   <h1>Announcements</h1>
			   <h2>${message}</h2>
                  <div class="ReportFeed">
                     <div id="menu">
                        <div class="men_tp menuGrid"> <a onclick="myReportFeed()"> <input name="searchsubmit" type="image" src="images/report.png" class="btn btnFrnd paddingLft15px"  />Post</a> <img src="images/line.gif" width="2" height="14" alt="" class="flt" style="margin-left:20px;" /><a href=""><input name="searchsubmit" type="image" src="images/report.png" class="btn btnFrnd paddingLft15px">Photo</a> <img src="images/line.gif" width="2" height="14" alt="" class="flt" style="margin-left:10px;" /> <a href=""><input name="searchsubmit" type="image" src="images/link.png" class="btn btnFrnd paddingLft20px">Link</a> <img src="images/line.gif" width="2" height="14" alt="" class="flt" style="margin-left:10px;" /> <a href=""><input name="searchsubmit" type="image" src="images/poll.png" class="btn btnFrnd paddingLft15px">Poll</a></div>
                     </div>
                  </div>
                  <div class="ToogleReportFeed">
                     <div id="ReportFeed" class="ReportForm">
                        <form action="post" method="post">
                           <label for="title">Title:</label><br>
                           <input type="text" id="title" name="title" value=""><br>
                           <br>
                           <label for="description">Description:</label><br>
                           <input type="text" id="description" name="description" value=""><br>
                           <input type="submit" value="Submit">
                        </form>
                     </div>
                  </div>
				  <br>
					<table class="table"">
					  <thead class="thead-dark">
					    <tr>
					   		<th scope="col">User</th>
					      <th scope="col">Title</th>
					      <th scope="col">Description</th>
					       <th scope="col">Date&Time</th>
					    </tr>
					  </thead>

					<%
					try{
						User user = (User)request.getSession().getAttribute("user");
				        String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
				        String dbUser = "root";
				        String dbPassword = "31464573";
				 		
				        Class.forName("com.mysql.jdbc.Driver");
				        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
				        
				        String sql = "SELECT * FROM Announcement NATURAL JOIN Users";
				        Statement statement = connection.createStatement();
				        ResultSet result = statement.executeQuery(sql);
				       
				 
				        
						while(result.next()){
						%>
						<tr>
						<td><%=result.getString("username")%></td>
						<td><%=result.getString("title") %></td>
						<td><%=result.getString("description") %></td>
						<td><%=result.getTimestamp("datetime") %></td>
						<%if(result.getInt("userid") == user.getId()){ %>
							<td><form action="deleteannouncement" method="POST"><input type="hidden" name="id" value=<%=result.getInt("announcementid")%>><button type="submit">Delete</button></form></td>
						<%}
						}			
						connection.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
					%>
					</table>
				 
               </div>
               
            
               <div class="columnEvents" id="floatRht">
                  <div>
                     <p id="dateDisplay">&nbsp;</p>
                  </div>    
                  </div>
               </div>
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
      <div align=center><a href=''></a></div>
   </body>
</html>