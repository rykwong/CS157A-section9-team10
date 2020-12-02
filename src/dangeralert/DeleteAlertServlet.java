package dangeralert;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteAlertServlet
 */
@WebServlet("/deletealert")
public class DeleteAlertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAlertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
        String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
        String dbUser = "root";
        String dbPassword = "9Cn99N54!";
 
        int status = 0;
        try {
			Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        
	        String sql = "DELETE FROM Alert WHERE alertid=?";
	        PreparedStatement statement = connection.prepareStatement(sql); 
	        statement.setString(1,id);
	        status = statement.executeUpdate();
	        
	        
		}catch(Exception e){
	        String message = "Setting alert failed";
			request.setAttribute("message",message);
		}
		response.sendRedirect("alertset?s=" + status);
	}

}
