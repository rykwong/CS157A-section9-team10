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

/**
 * Servlet implementation class ReplyServlet
 */
@WebServlet("/reply")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyServlet() {
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
		User user = (User)request.getSession().getAttribute("user");
		Report report = (Report)request.getSession().getAttribute("replyreport");
		String text = request.getParameter("reply");
        String jdbcURL = Auth.jdbcURL;
        String dbUser = Auth.dbUser;
        String dbPassword = Auth.dbPassword;
        int status = 0;
		try {
			
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        
	        String sql = "INSERT INTO Reply(userid,reportid,text,timestamp) VALUES(?,?,?,now())";
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setInt(1, user.getId());
	        statement.setInt(2, report.getId());
	        statement.setString(3, text);
	        status = statement.executeUpdate();
			
		}catch(Exception e){
	        String message = "Reporting failed";
			request.setAttribute("message",message);
		}
		response.sendRedirect("ReplyDisplayServlet?s=" + status);
	}

}
