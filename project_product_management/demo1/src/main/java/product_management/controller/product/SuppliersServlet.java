package product_management.controller.product;

import product_management.Dao.impl_product.SuppliersDao;
import product_management.model.product.Suppliers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SuppliersServlet", value = "/suppliers")
public class SuppliersServlet extends HttpServlet {
    private SuppliersDao suppliersDao = new SuppliersDao();

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
                listSuppliers(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("element", suppliersDao.findById(id));
        try {
            request.getRequestDispatcher("/view/product/suppliers/update.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteObject(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        suppliersDao.delete(id);
        try {
            response.sendRedirect("/suppliers");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/product/suppliers/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listSuppliers(HttpServletRequest request, HttpServletResponse response) {
        List<Suppliers> suppliersList = suppliersDao.findAll();
        request.setAttribute("suppliersList", suppliersList);
        try {
            request.getRequestDispatcher("/view/product/suppliers/list.jsp").forward(request, response);
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
                insertValue(request, response);
                break;
            case "update":
                updateValue(request, response);
                break;
        }
    }

    private void updateValue(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Suppliers suppliers = new Suppliers(id, name, phone, address);
        suppliersDao.update(suppliers);
        try {
            response.sendRedirect("/suppliers");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertValue(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Suppliers suppliers = new Suppliers(name, phone, address);
        suppliersDao.save(suppliers);
        try {
            response.sendRedirect("/suppliers");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
