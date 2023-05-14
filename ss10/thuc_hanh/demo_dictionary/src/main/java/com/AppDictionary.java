package com;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AppDictionary", value = "/AppDictionary")
public class AppDictionary extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String word = request.getParameter("word");
        String result=null;

        switch (word) {
            case "hello":
                result="Xin chào";
                break;
            case "apple":
                result="Quả táo";
                break;
            case "orange":
                result="Quả cam";
                break;
            case "banana":
                result="Quả chuối";
                break;
            default:
                result="Không tìm thấy";
                break;
        }
        request.setAttribute("result",result);
        request.getRequestDispatcher("/index.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
