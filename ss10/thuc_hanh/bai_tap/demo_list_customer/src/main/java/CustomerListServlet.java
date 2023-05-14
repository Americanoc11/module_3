import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerListServlet", value = "/CustomerListServlet")
public class CustomerListServlet extends HttpServlet {
    private List<Customer> customerList = new ArrayList<>();

    public void init() {
        customerList.add(new Customer("Danh", "11/11/1111", "Đà nẵng ", "https://bedental.vn/wp-content/uploads/2022/11/1e8063154fdf3dcbb07edf0ad2df326a.jpg"));
        customerList.add(new Customer("Hưng", "22/22/2222", "Quảng Nam ", "https://kenh14cdn.com/thumb_w/660/2020/7/17/brvn-15950048783381206275371.jpg"));
        customerList.add(new Customer("Toàn", "33/33/3333", "Huế ", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAPQ7rO1zigb3F_zAKtIJ6gwN-qvUYyZ6QHCl3dTaVZQ&s"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("result", customerList);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
