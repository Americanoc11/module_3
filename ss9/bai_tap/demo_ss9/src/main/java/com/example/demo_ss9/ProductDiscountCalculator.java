package com.example.demo_ss9;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculator", value = "/ProductDiscountCalculator")
public class ProductDiscountCalculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        double discountAmount = price * discount * 0.01;
        double total = price - discountAmount;
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("total", total);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
