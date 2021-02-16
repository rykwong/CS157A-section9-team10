package dangeralert;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
 * Servlet implementation class RemoveSavedPostButton
 */
@WebServlet("/RemoveSavedPostButton")
public class RemoveSavedPostButton extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveSavedPostButton() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String userId = Integer.toString(user.getId());
		String reportId = request.getParameter("reportId");	
		String sql ="";
		
		try {
			//out.println("in try");
			
	        String jdbcURL = Auth.jdbcURL;
	        String dbUser = Auth.dbUser;
	        String dbPassword = Auth.dbPassword;
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        
	        
	      
	        sql = "DELETE FROM Save WHERE reportid=" + reportId +"&& userid=" +userId;
        	Statement statement = connection.createStatement();
	        int status = statement.executeUpdate(sql);
	              
	 	               	
	        connection.close();
	        //session.setAttribute("userId", userid);
	        
	        
	        response.sendRedirect("SavedPosts.jsp");
	      
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
			//out.println("DB EEROR");
			//return null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			//out.println("DB EEROR");
			//return null;
		}
	}

}
