package ss9_tong_quan_ung_dung_web;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "ServerTimeServlet", urlPatterns = "/index")
public class serverTimeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        Date today= new Date();
        writer.println("<h1>Hello world</h1>");
        writer.println("<h1>"+today+"</h1>");
        writer.println("</html>");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
