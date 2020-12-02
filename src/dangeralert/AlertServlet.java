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
 * Servlet implementation class AlertServlet
 */
@WebServlet("/alert")
public class AlertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlertServlet() {
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
		String type = request.getParameter("IncidentType");
		String city = request.getParameter("location");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
        String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
        String dbUser = "root";
        String dbPassword = "9Cn99N54!";
 
        int status = 0;
        try {
			Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        
	        String sql = "INSERT INTO Alert(userid,type,city) VALUES(?,?,?)";
	        PreparedStatement statement = connection.prepareStatement(sql); 
	        statement.setInt(1,user.getId());
	        statement.setString(2, type);
	        statement.setString(3, city);
	        status = statement.executeUpdate();
	        
	        
		}catch(Exception e){
	        String message = "Setting alert failed";
			request.setAttribute("message",message);
		}
		response.sendRedirect("alertset?s=" + status);

	
	}

}
