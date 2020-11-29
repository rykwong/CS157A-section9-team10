package dangeralert;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("user");
		String password = request.getParameter("password");
		//ServletOutputStream os = response.getOutputStream();
		String page = "index_form.jsp";
		User user = authenticate(username,password);
		if(user != null)
		{
			//ArrayList<Integer> reports = getSavedReports(user);
			//ArrayList<Integer> myOwnReportsId = getOwnerReportsId(user);
			HttpSession session = request.getSession();
			session.setAttribute("user",user);
			//session.setAttribute("savedReportsId", reports);
			//session.setAttribute("myOwnReportsId",myOwnReportsId );
			page = "dangeralert.jsp";
			response.sendRedirect(page);
		}
		else
		{
			String message = "Invalid username/password";
			request.setAttribute("message",message);
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request,response);
		}
	}
	
	public User authenticate(String username,String password)
	{
		try {
	        String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
	        String dbUser = "root";
	        String dbPassword = "31464573";
	 
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        String sql = "SELECT * FROM Users WHERE username = ? and password = ?";
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setString(1, username);
	        statement.setString(2, password);
	 
	        ResultSet result = statement.executeQuery();
	        User user = null;
	        if(result.next())
	        {
	        	user = new User();
	        	user.setId(result.getInt("userid"));
	        	user.setUsername(username);
	        	user.setPassword(password);
	        	user.setPhonenumber(result.getString("phonenumber"));
	        	user.setCity(result.getString("city"));
	        }
	        
	        connection.close();
	        //session.setAttribute("userId", userid);
	        return user;
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public ArrayList<Integer> getSavedReports(User user) {
		 ArrayList<Integer> reports = new ArrayList<>();
		try {
			//out.println("in try");
	        String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
	        String dbUser = "root";
	        String dbPassword = "31464573";
	 
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        String sql = "SELECT * FROM Report, Save WHERE Report.reportid = Save.reportid && Save.userid =?";
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setString(1, Integer.toString(user.getId()));
	        //statement.setString(1, "1");
	        
	 
	        ResultSet result = statement.executeQuery();
	       
	        while(result.next())
	        {
	        	reports.add(result.getInt("reportid"));
	     
	        }
	       
	        connection.close();
	        //session.setAttribute("userId", userid);
	       
	      
		}catch(SQLException e)
		{
			e.printStackTrace();
			//out.println("DB EEROR");
			//return null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			//out.println("DB EEROR");
			//return null;
		}
		
		return reports;
		
	}
	
	
	public ArrayList<Integer> getOwnerReportsId(User user) {
		 ArrayList<Integer> myOwnReportsId = new ArrayList<>();
		try {
			//out.println("in try");
	        String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
	        String dbUser = "root";
	        String dbPassword = "31464573";
	 
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        String sql = "SELECT reportid FROM Reports WHERE userid =?;";
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setString(1, Integer.toString(user.getId()));
	        //statement.setString(1, "1");
	        
	 
	        ResultSet result = statement.executeQuery();
	       
	        while(result.next())
	        {
	        	myOwnReportsId.add(result.getInt("reportid"));
	     
	        }
	       
	        connection.close();
	        //session.setAttribute("userId", userid);
	        
	       
	      
		}catch(SQLException e)
		{
			e.printStackTrace();
			//out.println("DB EEROR");
			//return null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			//out.println("DB EEROR");
			//return null;
		}
		
		return myOwnReportsId;
		
	} 
	
	

}
