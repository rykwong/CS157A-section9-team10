package dangeralert;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/report")
public class UserReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("dangeralert.jsp");
		view.forward(request,response);
		
		
	}
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String type = request.getParameter("IncidentType");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String location = request.getParameter("location");
		String description = request.getParameter("description");
		String ai = request.getParameter("ai");
		
		//ServletOutputStream os = response.getOutputStream();
//		os.print(title);
//		os.print(type);
//		os.print(date);
//		os.print(time);
//		os.print(location);
//		os.print(description);
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
//		os.print(user.getUsername());
//		os.print(user.getPassword());
		int status = 0;
		
		
		try {
	        String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
	        String dbUser = "root";
	        String dbPassword = "31464573";
	 
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        /*
	        String sql = "SELECT userid FROM Users WHERE username = ? and password = ?";
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setString(1, user.getUsername());
	        statement.setString(2, user.getPassword());
	        status = statement.executeUpdate();
	        */
	        String sql = "INSERT INTO Report(title,description,location,datetime,type) VALUES(?,?,?,now(),?)";
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setString(1, title);
	        statement.setString(2, description);
	        statement.setString(3, location);
	        statement.setString(4, type);
	        status = statement.executeUpdate();
			status = 1;
	        
		}
		catch(Exception e){
	        String message = "Reporting failed";
			request.setAttribute("message",message);
		}
		response.sendRedirect("home?s=" + status);
		
		
	}

}
