package product_management.controller.bill;

import product_management.Dao.impl_bill.DeliveryDao;
import product_management.model.bill.Delivery;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DeliveryServlet", value = "/delivery")
public class DeliveryServlet extends HttpServlet {
    private DeliveryDao deliveryDao = new DeliveryDao();

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
                listDelivery(request, response);
        }
    }

    private void listDelivery(HttpServletRequest request, HttpServletResponse response) {
        List<Delivery> deliveryList = deliveryDao.findAll();
        request.setAttribute("deliveryList", deliveryList);
        try {
            request.getRequestDispatcher("/view/bill/delivery/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteObject(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        deliveryDao.delete(id);
        try {
            response.sendRedirect("/delivery");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("deli", deliveryDao.findById(id));
        try {
            request.getRequestDispatcher("/view/bill/delivery/update.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/bill/delivery/create.jsp").forward(request, response);
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
        Delivery delivery = new Delivery(id, describe);
        deliveryDao.update(delivery);
        try {
            response.sendRedirect("/delivery");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertInto(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String describe = request.getParameter("describe");
        Delivery delivery = new Delivery(id, describe);
        deliveryDao.save(delivery);
        try {
            response.sendRedirect("/delivery");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
