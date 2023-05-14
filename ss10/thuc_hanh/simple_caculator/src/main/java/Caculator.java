import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Caculator", value = "/AppCaculator")
public class Caculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("firstNumber"));
        double secondOperand = Double.parseDouble(request.getParameter("secondNumber"));
        String operator = request.getParameter("operator");
        double result = 0;
        switch (operator) {
            case "Addition":
                result = firstOperand + secondOperand;
                break;
            case "Subtraction":
                result = firstOperand - secondOperand;
                break;
            case "Multiplication":
                result = firstOperand * secondOperand;
                break;
            case "Division":
                if (secondOperand==0) {
                    calculate(request,response,result);
                } else {
                    result = firstOperand / secondOperand;
                }
                break;
            default:
                break;
        }
        request.setAttribute("Result",result);
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private static void calculate(HttpServletRequest request , HttpServletResponse response , double result) throws IOException, ServletException {
        request.setAttribute("Result",result);
        request.getRequestDispatcher("/exception.jsp").forward(request,response);
    }
}
