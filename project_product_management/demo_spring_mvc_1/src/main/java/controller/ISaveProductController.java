package controller;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ISaveProductController {
    ModelAndView handleRequest(HttpServletRequest request,
                               HttpServletResponse response) throws Exception;
}
