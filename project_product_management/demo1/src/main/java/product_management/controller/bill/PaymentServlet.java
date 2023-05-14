package product_management.controller.bill;

import product_management.Dao.impl_bill.PaymentDao;
import product_management.model.bill.Payment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PaymentServlet", value = "/payment")
public class PaymentServlet extends HttpServlet {
    private PaymentDao paymentDao = new PaymentDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null) {
            actionUser = "";
        }
        switch (actionUser) {
            case "create":
                showNewForm(request, response);
                break;
            case "update":
                showEditForm(request, response);
                break;
            case "delete":
                deleteObject(request, response);
                break;
            default:
                listPayment(request, response);
        }
    }

    private void deleteObject(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        paymentDao.delete(id);
        try {
            response.sendRedirect("/payment");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("pay", paymentDao.findById(id));
        try {
            request.getRequestDispatcher("/view/bill/payment/update.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/bill/payment/create.jsp").forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    private void listPayment(HttpServletRequest request, HttpServletResponse response) {
        List<Payment> paymentList = paymentDao.findAll();
        request.setAttribute("payList", paymentList);
        try {
            request.getRequestDispatcher("/view/bill/payment/list.jsp").forward(request, response);
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
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null) {
            actionUser = "";
        }
        switch (actionUser) {
            case "create":
                insertInto(request, response);
                break;
            case "update":
                updateObject(request, response);
                break;

        }
    }

    private void updateObject(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String describe = request.getParameter("describe");
        Payment payment = new Payment(id, describe);
        paymentDao.update(payment);
        try {
            response.sendRedirect("/payment");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertInto(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String describe = request.getParameter("describe");
        Payment payment = new Payment(id, describe);
        paymentDao.save(payment);
        try {
            response.sendRedirect("/payment");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
