# Danger Alert
Danger Alert is a simple web application that enables everyday citizens in Santa Clara County to post reports of suspicious activity. This application caters to three types of users, normal users, law enforcement, and admins. 
* Law enforcement are able to set alerts for certain types of crimes and get the contact information of the poster to follow up. 
* Users are able to sort and filter posts based on city and can save posts to look at later. 
* Admins would have access to posts and be able to take any down deemed misinformation or spam.

The aim of this project was to develop an alternative to calling 911 for little things such as suspicious activity or petty crimes. This would hopefully lessen the load on 911, but still allow law enforcement to receive information on potential criminal activity.

This project was made for Prof. Mike Wu's CS157A class at SJSU by Pak Shing Kan, Ryan Kwong, and Varun Reddy Mallepally

## Running the Application
1. Install Tomcat, Java JDK, and MySQL. 
2. Opening the project in Eclipse, change jdbcURL, dbUser, and dbPassword in Auth.java to your own MySQL url, user, and password.
3. To export a .war file, in Eclipse, right click on the project and select “Export -> WAR file”. This will generate a .war file you can deploy to Tomcat.
4. Start up your Tomcat server and navigate to “localhost:8080/manager/html”
   - At this point you will likely be asked for a manager password, enter one if you have already set one up, if not follow this [link's](http://tomcat.apache.org/tomcat-8.0-doc/manager-howto.html#Configuring_Manager_Application_Access) instructions to set one up.
5. Scroll down to the Deploy section where you should see a subsection “WAR file to deploy” 
6. Choose the .war file you generated and click deploy.
7. Back at the top of the page you should now see the name of the .war file you deployed clicking on it will lead you to the homepage of the application

_**Please note that as of now the application only runs on Google Chrome due to bootstrap styling.**_
