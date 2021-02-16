package dangeralert;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SavedPostsServlet
 */
@WebServlet("/SavedPostsServlet")
public class SavedPostsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SavedPostsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		//HttpSession session = request.getSession();
		//User user = (User)session.getAttribute("user");
		//out.println(user.getUsername());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		//out.println("userid: "+ user.getId());
		
		try {
			//out.println("in try");
	        String jdbcURL = Auth.jdbcURL;
	        String dbUser = Auth.dbUser;
	        String dbPassword = Auth.dbPassword;
	 
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        String sql = "SELECT * FROM Report, Save WHERE Report.reportid = Save.reportid && Save.userid =?";
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setString(1, Integer.toString(user.getId()));
	        //statement.setString(1, "");
	        ResultSet result = statement.executeQuery();
	     
	        while(result.next())
	        {
	        	int id = result.getInt("reportid");
	        	String title = result.getString("title");
	        	String des = result.getString("description");
	        	String location = result.getString("location");
	        	Timestamp datetime = result.getTimestamp("datetime");
	        	String type = result.getString("type");
	        	
	        }
	       
	        connection.close();
	        //session.setAttribute("userId", userid);
	        
	       
	        request.getRequestDispatcher("SavedPosts.jsp");
		
	      
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
			out.println("DB EEROR");
			//return null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			out.println("DB EEROR");
			//return null;
		}
		
		
		
		
		
		
		
		
	}

}