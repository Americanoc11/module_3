package com.example.app_caculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AppCalculatorServlet", value = "/calculator")
public class AppCalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String operator = request.getParameter("operator");
        if (operator == null) {
            operator = "";
        }
        switch (operator) {
            case "+":
                formAdd(request, response);
                break;
            case "-":
                formSub(request, response);
                break;
            case "*":
                formMul(request, response);
                break;
            case "/":
                formDivi(request, response);
                break;
            default:
                response.sendRedirect("/index.jsp");
        }

    }

    private void formDivi(HttpServletRequest request, HttpServletResponse response) {
        double number1 = Double.parseDouble(request.getParameter("number1"));
        double number2 = Double.parseDouble(request.getParameter("number2"));
        if (number2 != 0) {
            double total = number1 / number2;
            request.setAttribute("total", total);
            try {
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            String message = "Error division 0";
            request.setAttribute("total", message);
            try {
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void formMul(HttpServletRequest request, HttpServletResponse response) {
        double number1 = Double.parseDouble(request.getParameter("number1"));
        double number2 = Double.parseDouble(request.getParameter("number2"));
        double total = number1 * number2;
        request.setAttribute("total", total);
        try {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void formSub(HttpServletRequest request, HttpServletResponse response) {
        double number1 = Double.parseDouble(request.getParameter("number1"));
        double number2 = Double.parseDouble(request.getParameter("number2"));
        double total = number1 - number2;
        request.setAttribute("total", total);
        try {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void formAdd(HttpServletRequest request, HttpServletResponse response) {
        double number1 = Double.parseDouble(request.getParameter("number1"));
        double number2 = Double.parseDouble(request.getParameter("number2"));
        double total = number1 + number2;
        request.setAttribute("total", total);
        try {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

    }
}
