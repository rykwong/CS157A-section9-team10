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
      <div id="wh_bg">
         <div id="bg_bg">
            <div id="top" style="display:none">
               <div class="top1"></div>
               <div class="top2" style="background-color:red;">  </div>
            </div>
            <div id="topMenu" >
               <div class="header">
                  <div class="search displayInline" style="width:100%; margin-top: 1%;">
                     <div class="displayInline paddingLft30px" style="width:25%;height:30px;">
                        <span id="menuTextForLogo"><img src="images/logo.png" width="300" height="100" class="flt" /></span>
                     </div>
                     <div class="displayInline" style="width:70%">
                        <div class="displayInline" style="width:25%">
                           <form method="get" id="search" action="#">
                              <span>
                              <input type="text" value="Search..." name="s" id="s" /> 
                              <input name="searchsubmit" type="image" src="images/search.png" value="Go" id="searchsubmit" class="btn btnSearch"  />
                              </span>
                           </form>
                        </div>
                        <!--/searchform -->
                        <div class="displayInline" style="width:15%">
                           <span>
                           <input name="searchsubmit" type="image" src="images/frnd.png" class="btn btnFrnd paddingLft10px"  />
                           <input name="searchsubmit" type="image" src="images/msg.png" class="btn btnMsg paddingLft10px"  />
                           <input name="searchsubmit" type="image" src="images/bell.png" class="btn btnBell paddingLft10px"  />
                           </span>
                        </div>
                        <div class="displayInline" id ="floatRht" style="width:40%;margin-top: -15px;">
                           <div class="navbar">
                              <a href="#AdminCP">AdminCP</a>
                              <a href="#Authorities">Authorities</a>
                              <div class="dropdown">
                                 <button class="dropbtn">Profile 
                                 <i class="fa fa-caret-down"></i>
                                 </button>
                                 <div class="dropdown-content">
                                    <a href="#">Link 1</a>
                                    <a href="#">Link 2</a>
                                    <a href="#">Link 3</a>
                                 </div>
                              </div>
                              <div class="dropdown">
                                 <button class="dropbtn">Account 
                                 <i class="fa fa-caret-down"></i>
                                 </button>
                                 <div class="dropdown-content">
                                    <a href="#">Link 1</a>
                                    <a href="#">Link 2</a>
                                    <a href="#">Link 3</a>
                                 </div>
                              </div>
                           
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="clr"></div>
                  <div id="menu">
                     <div class="men_tp"> <a href="">HOME</a> <img src="images/line.gif" width="2" height="14" alt="" class="flt" style="margin-left:20px;" /> <a href="">FRIENDS</a> <img src="images/line.gif" width="2" height="14" alt="" class="flt" style="margin-left:20px;" /> <a href="">PAGES</a> <img src="images/line.gif" width="2" height="14" alt="" class="flt" style="margin-left:20px;" /> <a href="">PHOTOS</a> <img src="images/line.gif" width="2" height="14" alt="" class="flt" style="margin-left:20px;" /> <a href="">FORUM</a> <img src="images/line.gif" width="2" height="14" alt="" class="flt" style="margin-left:20px;" /> <a href="">POLLS</a> <img src="images/line.gif" width="2" height="14" alt="" class="flt" style="margin-left:20px;" /> <a href="">VIDEOS</a> </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="columnProfile">
                  <div class="card">
                     <img src="images/abt_img.jpg" alt="John" style="width:100%">
                     <h1>${user.username}</h1>
                     <div class="card">
                        <div class="upcomeEvents"><span>Authorities Online</span></div>
                     </div>
					 <img src="images/fdept.png" alt="John" style="width:50%"class="btn btnFrnd paddingLft10px">
					 <div class="EmptyHeight"> </div>
					 <div class="card">
                        <div class="upcomeEvents"><span>Friends Online</span></div>
						<br>
						<br>
						<br>
                     </div>
                  </div>
               </div>
               <div class="columnFeed marginRgt5 marginLft">
			   <h1>Crime Feed</h1>
			   <h2>${message}</h2>
                  <div class="ReportFeed">
                     <div id="menu">
                        <div class="men_tp menuGrid"> <a onclick="myReportFeed()"> <input name="searchsubmit" type="image" src="images/report.png" class="btn btnFrnd paddingLft15px"  />Report</a> <img src="images/line.gif" width="2" height="14" alt="" class="flt" style="margin-left:20px;" /><a href=""><input name="searchsubmit" type="image" src="images/report.png" class="btn btnFrnd paddingLft15px">Photo</a> <img src="images/line.gif" width="2" height="14" alt="" class="flt" style="margin-left:10px;" /> <a href=""><input name="searchsubmit" type="image" src="images/link.png" class="btn btnFrnd paddingLft20px">Link</a> <img src="images/line.gif" width="2" height="14" alt="" class="flt" style="margin-left:10px;" /> <a href=""><input name="searchsubmit" type="image" src="images/poll.png" class="btn btnFrnd paddingLft15px">Poll</a></div>
                     </div>
                  </div>
                  <div class="ToogleReportFeed">
                     <div id="ReportFeed" class="ReportForm">
                        <form action="report" method="post">
                           <label for="title">Title:</label><br>
                           <input type="text" id="title" name="title" value=""><br>
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
<<<<<<< HEAD
                        
=======
>>>>>>> dc597eda3a7c13b1a77639b64faede5af72dc10f
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
                           <input type="text" id="description" name="description" value=""><br>
<<<<<<< HEAD
                          
=======
>>>>>>> dc597eda3a7c13b1a77639b64faede5af72dc10f
                           <input type="submit" value="Submit">
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
				  		<input type="submit" value="Filter">
				  		</form>
				  	</div>
					<table class="table">
					  <thead class="thead-dark">
					    <tr>
					   		<th scope="col">User</th>
					      <th scope="col">Id</th>
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
				        String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
				        String dbUser = "root";
				        String dbPassword = "31464573";
				 		
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
				        
				        
				        
				        sql = "SELECT * FROM Report NATURAL JOIN Reports NATURAL JOIN Users ORDER BY datetime DESC LIMIT 10";
				        if(city != null){
					        String filters = "";
					        for(int i = 0; i < city.length-1;i++){
					        	filters += "location='"+ city[i] + "' OR ";
					        }
					        filters += "location='" + city[city.length-1] + "'";
					        sql = "SELECT * FROM Report NATURAL JOIN Reports NATURAL JOIN Users WHERE " + filters + " ORDER BY datetime DESC LIMIT 10";
				        }
				        //ArrayList<Integer> savedReportsId = (ArrayList<Integer>)session.getAttribute("savedReportsId");
				        //ArrayList<Integer> myOwnReportsId = (ArrayList<Integer>)session.getAttribute("myOwnReportsId");

				        Statement statement = connection.createStatement();
				        result = statement.executeQuery(sql);
				       
				 
				        
						while(result.next()){
							int reportId = result.getInt("reportid");
						%>
						<tr>
						<td><%=result.getString("username")%></td>
						<th scope="row"><%=reportId %></th>
						<td><%=result.getString("title") %></td>
						<td><%=result.getString("description") %></td>
						<td><%=result.getString("location") %></td>
						<td><%=result.getTimestamp("datetime") %></td>
						<td><%=result.getString("type") %></td>
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
               
            
               <div class="columnEvents" id="floatRht">
                  <div>
                     <p id="dateDisplay">&nbsp;</p>
                  </div>
                  <div class="card">
                     <div class="upcomeEvents"><span>Upcoming Events</span></div>
                     <div class="todayEvents"><span>Today's Events</span></div>
                  </div>
                  <div class="EmptyHeight"></div>
                  <div class="card">
                    
                     <div class="upcomeEvents">
                     <form method ="Post" action="SavedPostsServlet">
                    	<button type="submit">Saved Posts</button> 
                     </form>

                     </div>
                  </div>
               </div>
            </div>
            <div class="footer">
               <div id="foot"></div>
               <span class="copy"><a href=""></a></span>
            </div>
         </div>
      </div>
      <div align=center><a href=''></a></div>
   </body>
</html>