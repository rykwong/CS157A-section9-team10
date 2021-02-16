<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import = "dangeralert.User" %>
<%@ page import = "dangeralert.Auth" %>

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
     			 <form method="Post" action="LogoutServlet">
     			 <button class="btn btn-link" style="font-size:30px; color:white " type="submit">Logout </button>
     			 </form>
     		  
   		 </ul>
			</nav>
			
            <div class="row">
               <div class="columnProfile" style="height:80%">
                  <div class="card">
                     <img src="images/abt_img2.png" alt="John" style="width:100%">
                     <h1>Hello, ${user.username}</h1>
                    <a  class="btn btn-primary btn-lg" style="margin-left:10%; margin-right:10%" href="SavedPosts.jsp">Saved Posts</a>
                  </div>
               </div>
               <div class="columnFeed marginRgt5 marginLft" style="width:50%">
			   <h1>Report Feed</h1>
			   <h2>${message}</h2>
			   
                  <div class="ReportFeed" style="margin-bottom:1%">
                     <button class="btn btn-warning btn-lg" onclick=myReportFeed() > Create New Report</button>
                  </div>
                  <div class="ToogleReportFeed" style="margin-top:1%;">
                     <div id="ReportFeed" class="form-group">
                        <form action="report" method="post">
                           <label for="title">Title:</label><br>
                            <textarea  style="width:30%; margin-left:35%" class="form-control" id="title" name="title"  rows="1"></textarea>
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
                           <label for="description">Description:</label><br>
                           <textarea  style="width:50%; margin-left:25%" class="form-control" id="description" name="description"  rows="3"></textarea>
                           <input style="margin-top:1%; margin-bottom:1%;"class="btn btn-primary btn-lg" type="submit" value="Submit">
                        </form>
                     </div>
                  </div>
				  <br>
				  <div>
						<form action="dangeralert.jsp" method="GET">
				  		<input type="checkbox" id="San Jose" name="filter" value="San Jose">
				  		<label for="San Jose">San Jose</label>
				  		<input type="checkbox" id="Santa Clara" name="filter" value="Santa Clara">
				  		<label for="Santa Clara">Santa Clara</label>
				  		<input type="checkbox" id="Campbell" name="filter" value="Campbell">
				  		<label for="Campbell">Campbell</label>
				  		<input type="checkbox" id="Gilroy" name="filter" value="Gilroy">
				  		<label for="Gilroy">Gilroy</label>
				  		<input type="checkbox" id="Los Altos" name="filter" value="Los Altos">
				  		<label for="Los Altos">Los Altos</label>
				  		<input type="checkbox" id="Milpitas" name="filter" value="Milpitas">
				  		<label for="Milpitas">Milpitas</label>
				  		<input type="checkbox" id="Morgan Hill" name="filter" value="Morgan Hill">
				  		<label for="Morgan Hill">Morgan Hill</label>
				  		<input type="checkbox" id="Mountain View" name="filter" value="Mountain View">
				  		<label for="Mountain View">Mountain View</label>
				  		<input type="checkbox" id="Palo Alto" name="filter" value="Palo Alto">
				  		<label for="Palo Alto">Palo Alto</label>
				  		<input type="checkbox" id="Cupertino" name="filter" value="Cupertino">
				  		<label for="Cupertino">Cupertino</label>
				  		<input type="checkbox" id="Saratoga" name="filter" value="Saratoga">
				  		<label for="Saratoga">Saratoga</label>
				  		<input type="checkbox" id="Los Gatos" name="filter" value="Los Gatos">
				  		<label for="Los Gatos">Los Gatos</label>
				  		<input class="btn btn-info" type="submit" value="Filter">
				  		</form>
				  	</div>
				  	<div class="d-flex justify-content-center" style="margin-bottom:5%; width:100%">
					<table class="table" >
					  <thead class="thead-dark">
					    <tr>
					   		<th scope="col">User</th>
			
					      <th scope="col">Title</th>
					      <th scope="col">Description</th>
					       <th scope="col">Location</th>
					      <th scope="col">Type</th>
					       <th scope="col">Date&Time</th>
					    </tr>
					  </thead>

					<%
					try{
						User user = (User)request.getSession().getAttribute("user");
						
	                     
	                     
						String[] city = request.getParameterValues("filter");
				        String jdbcURL = Auth.jdbcURL;
				        String dbUser = Auth.dbUser;
				        String dbPassword = Auth.dbPassword;
				 		
				        Class.forName("com.mysql.jdbc.Driver");
				        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
				        
				        String sql = "SELECT * FROM Report, Save WHERE Report.reportid = Save.reportid && Save.userid =?";
				        PreparedStatement statement1 = connection.prepareStatement(sql);
				        statement1.setString(1, Integer.toString(user.getId()));
				        ArrayList<Integer> savedReportsId = new ArrayList<>();
				        //statement.setString(1, "1");
				        
				 
				        ResultSet result = statement1.executeQuery();
				       
				        while(result.next())
				        {
				        	savedReportsId.add(result.getInt("reportid"));
				     
				        }
				        
				        
				        sql = "SELECT reportid FROM Reports WHERE userid =?;";
				        PreparedStatement statement2 = connection.prepareStatement(sql);
				        statement2.setString(1, Integer.toString(user.getId()));
				        //statement.setString(1, "1");
				        ArrayList<Integer> myOwnReportsId = new ArrayList<>();
				 
				        result = statement2.executeQuery();
				       
				        while(result.next())
				        {
				        	myOwnReportsId.add(result.getInt("reportid"));
				     
				        }
				        
				        
				        
				        sql = "SELECT * FROM Report NATURAL JOIN Reports NATURAL JOIN Users ORDER BY datetime DESC LIMIT 15";
				        if(city != null){
					        String filters = "";
					        for(int i = 0; i < city.length-1;i++){
					        	filters += "location='"+ city[i] + "' OR ";
					        }
					        filters += "location='" + city[city.length-1] + "'";
					        sql = "SELECT * FROM Report NATURAL JOIN Reports NATURAL JOIN Users WHERE " + filters + " ORDER BY datetime DESC LIMIT 15";
				        }
				        //ArrayList<Integer> savedReportsId = (ArrayList<Integer>)session.getAttribute("savedReportsId");
				        //ArrayList<Integer> myOwnReportsId = (ArrayList<Integer>)session.getAttribute("myOwnReportsId");

				        Statement statement = connection.createStatement();
				        result = statement.executeQuery(sql);
				       
				 
				        
						while(result.next()){
							int reportId = result.getInt("reportid");
							if(result.getInt("flag") ==1){
						%>
						<tr style = "color:red;">
						<%}else {%>
						<tr>
						<%} %>
						
						<td><%=result.getString("username")%></td>
						
						<td><%=result.getString("title") %></td>
						<td><%=result.getString("description") %></td>
						<td><%=result.getString("location") %></td>
						<td><%=result.getString("type") %></td>
						<td><%=result.getTimestamp("datetime") %></td>
						<% if(!savedReportsId.contains(reportId)){ %>
						<form method ="Post" action="SavePostButtonServlet"> 
						<input type="hidden" id="reportId" name="reportId" value="<%=reportId %>">
						<td>
						<button type="submit" class="btn btn-secondary" onclick="alert('Post has saved.')">Save</button>
						</td>
						<%} %>
						</form>
						
						<% if(myOwnReportsId.contains(reportId)){ %>
						<form method ="Post" action="delete"> 
						<input type="hidden" id="id" name="id" value="<%=reportId %>">
						<input type="hidden" id="action" name="action" value="removed">
						<input type="hidden" id="reason" name="reason" value="backToHome">
						
						
						<td>
						<button type="submit" class="btn btn-danger" onclick="alert('Post has deleted.')" >Delete</button> 
						</td>
						
						<%} %>
						</form>
						
						<% if(myOwnReportsId.contains(reportId)){ %>
						<form method ="Post" action="edit"> 
						<input type="hidden" id="id" name="id" value="<%=reportId %>">
						
						<td>
						<button type="submit" class="btn btn-danger" >Edit</button> 
						</td>
						
						<%} %>
						</form>
						
						<form method ="Post" action="ReplyButtonServlet"> 
							<input type="hidden" id="id" name="id" value="<%=reportId %>">
							<td>
							<button type="submit" class="btn btn-secondary">Replies</button>
							</td>
						</form>
						
						</tr>
						
						<%
						}			
						connection.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
					%>
					</table>
					</div>
				 
               </div>
               
            
             
               </div>
           
         
			
     
   </body>
</html>