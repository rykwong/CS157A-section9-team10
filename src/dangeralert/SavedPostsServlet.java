package dangeralert;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
		String userid = request.getParameter("userid");
		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		out.println("userid: "+ user.getId());
		
		
		try {
			out.println("in try");
	        String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
	        String dbUser = "root";
	        String dbPassword = "31464573";
	 
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        String sql = "SELECT * FROM Report, Save WHERE Report.reportid = Save.reportid && Save.userid =?";
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setString(1, "1");
	        
	 
	        ResultSet result = statement.executeQuery();
	        ArrayList<Report> reports = new ArrayList<>();
	        while(result.next())
	        {
	        	int id = result.getInt("reportid");
	        	String title = result.getString("title");
	        	String des = result.getString("description");
	        	String location = result.getString("location");
	        	String datetime = result.getString("datetime");
	        	String type = result.getString("type");
	        	reports.add(new Report(id,title,des,location,datetime,type));
	     
	        }
	       
	        connection.close();
	        //session.setAttribute("userId", userid);
	      for(Report item: reports) {
	    	  out.println("report#"+item.getId());
	    	  out.println("report#"+item.getTitle());
	    	  out.println("\n");
	      }
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
