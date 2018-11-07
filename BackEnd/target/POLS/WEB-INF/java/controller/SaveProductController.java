package controller;

import form.Product;
import form.ProductForm;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SaveProductController implements Controller {
    private static final Log logger = LogFactory.getLog(SaveProductController.class);

    @Override
    public ModelAndView handleRequest(HttpServletRequest req, HttpServletResponse rsp) throws Exception{
        logger.info("SaveProductController called");
        ProductForm productForm = new ProductForm();
        //populate action properties
        productForm.setName(req.getParameter("name"));
        productForm.setDescription(req.getParameter("description"));
        productForm.setPrice(req.getParameter("price"));

        //create model
        Product product = new Product();
        product.setName(productForm.getName());
        product.setDescription(productForm.getDescription());
        try{
            product.setPrice(
                    Float.parseFloat(productForm.getPrice())
            );
        } catch (NumberFormatException e) {
        }

        //TODO: code to save Product

        return new ModelAndView("ProductDetails", "product", product);
    }
}
