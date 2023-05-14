package product_management.controller.product;

import product_management.Dao.impl_product.ProductDao;
import product_management.model.product.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private ProductDao productDao = new ProductDao();

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
                listProduct(request, response);
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productDao.findAll();
        request.setAttribute("productList", productList);
        try {
            request.getRequestDispatcher("/view/product/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteObject(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productDao.delete(id);
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("product", productDao.findById(id));
        try {
            request.getRequestDispatcher("/view/product/update.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/product/create.jsp").forward(request, response);
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
                updateObject(request, response);
                break;

        }
    }

    private void updateObject(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String describe = request.getParameter("describe");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String note = request.getParameter("note");
        int amount = Integer.parseInt(request.getParameter("amount"));
        int supplierId = Integer.parseInt(request.getParameter("supplierId"));
        Product product = new Product(id, name, describe, price, image, typeId, note, amount, supplierId);
        productDao.update(product);
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertValue(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String describe = request.getParameter("describe");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String note = request.getParameter("note");
        int amount = Integer.parseInt(request.getParameter("amount"));
        int supplierId = Integer.parseInt(request.getParameter("supplierId"));
        Product product = new Product(name, describe, price, image, typeId, note, amount, supplierId);
        productDao.save(product);
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
