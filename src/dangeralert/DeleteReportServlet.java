package dangeralert;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteReportServlet
 */
@WebServlet("/delete")
public class DeleteReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("admintest.jsp");
		view.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		String reason = request.getParameter("reason");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String userId = Integer.toString(user.getId());
		String sql="";
		
		
		
		try {
	        String jdbcURL = "jdbc:mysql://localhost:3306/cs157a_project?serverTimezone=EST5EDT";
	        String dbUser = "root";
	        String dbPassword = "9Cn99N54!";
	 
	        Class.forName("com.mysql.jdbc.Driver");
	        int status = 0;
	        
	        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        if(action.equals("removed")){	
	        	sql = "DELETE FROM Report WHERE reportid=" + id;
	        	Statement statement = connection.createStatement();
		        status = statement.executeUpdate(sql);
	        }
	        else if(action.equals("flagged")){
	    		sql = "UPDATE Report SET flag=1 WHERE reportid=" + id;
	    		Statement statement = connection.createStatement();
	    		status = statement.executeUpdate(sql);
	        }
	        
	        if(reason.equals("backToHome")) {
	        	response.sendRedirect("dangeralert.jsp");
	        }else {
	        	sql = "SELECT * FROM Admin WHERE userid=" + userId;
	        	Statement statement = connection.createStatement();
	        	ResultSet result = statement.executeQuery(sql);
	        	int staffid;
	        	if(result.next()) {
	        		staffid = result.getInt("staffid");
		        	sql = "INSERT INTO Action(staffid,reportid,reason,action) VALUES(?,?,?,?)";
		        	PreparedStatement prepared = connection.prepareStatement(sql);
		        	prepared.setInt(1,staffid);
		        	prepared.setString(2,id);
		        	prepared.setString(3,reason);
		        	prepared.setString(4,action);
		        	status = prepared.executeUpdate();
	        	}
	        	response.sendRedirect("DeleteDisplayServlet?s=" + status);
	        }
	       
	        
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
