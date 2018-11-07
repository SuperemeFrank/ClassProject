package controller;

import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.apache.commons.logging.Log;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InputProductController implements Controller {
    private static final Log logger = LogFactory.getLog(InputProductController.class);

    @Override
    public ModelAndView handleRequest(HttpServletRequest req, HttpServletResponse rsp) {
        return new ModelAndView("ProductForm");
    }
}
