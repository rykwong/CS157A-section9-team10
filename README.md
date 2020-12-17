Please note that as of now the application only runs on Google Chrome due to bootstrap styling.
# Running the Application
1. Install Tomcat, Java JDK, and MySQL. 
2. Opening the project in Eclipse, change jdbcURL, dbUser, and dbPassword in Auth.java to your own MySQL url, user, and password.
3. To export a .war file, in Eclipse, right click on the project and select “Export -> WAR file”. This will generate a .war file you can deploy to Tomcat.
4. Start up your Tomcat server and navigate to “localhost:8080/manager/html”
   - At this point you will likely be asked for a manager password, enter one if you have already set one up, if not follow this [link's](http://tomcat.apache.org/tomcat-8.0-doc/manager-howto.html#Configuring_Manager_Application_Access) instructions to set one up.
5. Scroll down to the Deploy section where you should see a subsection “WAR file to deploy” 
6. Choose the .war file you generated and click deploy.
7. Back at the top of the page you should now see the name of the .war file you deployed clicking on it will lead you to the homepage of the application
