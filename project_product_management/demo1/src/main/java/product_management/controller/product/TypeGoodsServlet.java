package product_management.controller.product;

import product_management.Dao.impl_product.TypeGoodsDao;
import product_management.model.product.TypeGoods;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TypeGoodsServlet", value = "/type")
public class TypeGoodsServlet extends HttpServlet {
    private TypeGoodsDao typeGoodsDao = new TypeGoodsDao();

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
                listTypeGoods(request, response);
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/product/type_goods/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("element",typeGoodsDao.findById(id));
        try {
            request.getRequestDispatcher("/view/product/type_goods/update.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteObject(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        typeGoodsDao.delete(id);
        try {
            response.sendRedirect("/type");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listTypeGoods(HttpServletRequest request, HttpServletResponse response) {
        List<TypeGoods> typeList = typeGoodsDao.findAll();
        request.setAttribute("typeList", typeList);
        try {
            request.getRequestDispatcher("/view/product/type_goods/list.jsp").forward(request, response);
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

    private void insertValue(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        TypeGoods typeGoods = new TypeGoods(id, name);
        typeGoodsDao.save(typeGoods);
        try {
            response.sendRedirect("/type");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateObject(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        TypeGoods typeGoods = new TypeGoods(id, name);
        typeGoodsDao.update(typeGoods);
        try {
            response.sendRedirect("/type");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
