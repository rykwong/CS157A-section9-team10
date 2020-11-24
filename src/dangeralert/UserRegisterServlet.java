package dangeralert;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegisterServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("user");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phoneNumber");
		String city = request.getParameter("city");
		 
		int status;
		try {
	        String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
	        String dbUser = "root";
	        String dbPassword = "9Cn99N54!";
	 
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        String sql = "INSERT INTO Users(username,password,phoneNumber,city) VALUES(?,?,?,?)";
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setString(1, username);
	        statement.setString(2, password);
	        statement.setString(3, phoneNumber);
	        statement.setString(4, city);
	        status = statement.executeUpdate();
	        String message = "Successfully Registered";
			request.setAttribute("message",message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("index_form.jsp");
			dispatcher.forward(request,response);
	        
		}
		catch(Exception e){
	        String message = "Registration failed";
			request.setAttribute("message",message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("index_form.jsp");
			dispatcher.forward(request,response);
		}
		
	}

}
