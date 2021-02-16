package dangeralert;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditReportServlet
 */
@WebServlet("/editreport")
public class EditReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String type = request.getParameter("IncidentType");
		String location = request.getParameter("location");
		String description = request.getParameter("description");
		
        String jdbcURL = Auth.jdbcURL;
        String dbUser = Auth.dbUser;
        String dbPassword = Auth.dbPassword;

        int status = 0;
        try {
			Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        String sql = "UPDATE Report SET title=?, description=?, location=?, type=? WHERE reportid=?";
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setString(1, title);
	        statement.setString(2, description);
	        statement.setString(3, location);
	        statement.setString(4, type);
	        statement.setString(5, id);
	        status = statement.executeUpdate();
		}catch(Exception e){
	        String message = "Update failed";
			request.setAttribute("message",message);
		}
        response.sendRedirect("dangeralert.jsp?s=" + status);
	}

}
