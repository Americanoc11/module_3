package product_management.controller.product;

import product_management.Dao.impl_product.PromotionDao;
import product_management.model.product.Promotion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PromotionServlet", value = "/promotion")
public class PromotionServlet extends HttpServlet {
    private PromotionDao promotionDao = new PromotionDao();

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
                listPromotion(request, response);
        }
    }

    private void listPromotion(HttpServletRequest request, HttpServletResponse response) {
        List<Promotion> promotionList = promotionDao.findAll();
        request.setAttribute("promotionList", promotionList);
        try {
            request.getRequestDispatcher("/view/product/promotions/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteObject(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        promotionDao.delete(id);
        try {
            response.sendRedirect("/promotion");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("promotion", promotionDao.findById(id));
        try {
            request.getRequestDispatcher("/view/product/promotions/update.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/product/promotions/create.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        String code = request.getParameter("code");
        String describe = request.getParameter("describe");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        Promotion promotion = new Promotion(id, name, code, describe, price, image);
        promotionDao.update(promotion);
        try {
            response.sendRedirect("/promotion");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertInto(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String code = request.getParameter("code");
        String describe = request.getParameter("describe");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        Promotion promotion = new Promotion( name, code, describe, price, image);
        promotionDao.save(promotion);
        try {
            response.sendRedirect("/promotion");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
