package dangeralert;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ActionServlet
 */
@WebServlet("/adminaction")
public class ActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		try {
	        String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
	        String dbUser = "root";
	        String dbPassword = "9Cn99N54!";
	 
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        String sql = "SELECT * FROM Report WHERE reportid = ?";
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setString(1, id);
	 
	        ResultSet result = statement.executeQuery();
	        Report report = null;
	        if(result.next())
	        {
	        	report = new Report();
	        	report.setId(result.getInt("reportid"));
	        	report.setTitle(result.getString("title"));
	        	report.setDescription(result.getString("description"));
	        	report.setLocation(result.getString("location"));
	        	report.setDatetime(result.getTimestamp("datetime"));
	        	report.setType(result.getString("type"));
	        }
	        
	        if(report != null) {
	        	HttpSession session = request.getSession();
	    		session.setAttribute("actionreport",report);
	    		response.sendRedirect("actiontest.jsp");
	        }
			else
			{
				String message = "An error occurred. Please try again";
				request.setAttribute("message",message);
				RequestDispatcher dispatcher = request.getRequestDispatcher("admintest.jsp");
				dispatcher.forward(request,response);
			}
	        
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
