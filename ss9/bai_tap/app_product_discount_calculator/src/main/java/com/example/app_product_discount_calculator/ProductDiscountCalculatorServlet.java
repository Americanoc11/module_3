package com.example.app_product_discount_calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProductDiscountCalculatorServlet", value = "/ProductDiscountCalculatorServlet")
public class ProductDiscountCalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discountPrice"));
        double discountAmount = (price * discount) * 0.01;
        double totaldiscount = price - discountAmount;
        request.setAttribute("discount",discountAmount);
        request.setAttribute("total", totaldiscount);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String description = request.getParameter("description");
//        double price = Double.parseDouble(request.getParameter("price"));
//        double discount = Double.parseDouble(request.getParameter("discountPrice"));
//        double discountAmount = (price * discount) * 0.01;
//        double totaldiscount = price - discountAmount;
//        request.setAttribute("discount",discountAmount);
//        request.setAttribute("total", totaldiscount);
//        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
