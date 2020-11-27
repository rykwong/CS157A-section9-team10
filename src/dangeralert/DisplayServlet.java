package dangeralert;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DisplayServlet
 */
@WebServlet("/home")
public class DisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int status = Integer.parseInt(request.getParameter("s"));
		PrintWriter out = response.getWriter();
		
		if(status == 1) {
			out.println("In displayserlet");
	        String message = "Successfully Reported";
			request.setAttribute("message",message);
		}
		else {
			String message = "Reporting failed";
			request.setAttribute("message",message);
		}
		
		RequestDispatcher view = request.getRequestDispatcher("dangeralert.jsp");
		view.forward(request,response);
	}

}
