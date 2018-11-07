package controller;

import form.Product;
import form.ProductForm;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
    private static final Log logger = LogFactory.getLog(SaveProductController.class);

    @RequestMapping(value = "/product_input")
    public String inputProduct() {
        logger.info("inputProduct called");
        return "ProductForm";
    }

    @RequestMapping()
    public String saveProduct(ProductForm productForm, Model model) {
        logger.info("saveProduct called");
        //no need to create and instantiate a productForm
        //create Product

        Product product = new Product();
        product.setName(productForm.getName());
        product.setDescription(productForm.getDescription());
        try {
            product.setPrice(Float.parseFloat(productForm.getPrice()));
        }catch (NumberFormatException e){

        }
        model.addAttribute("product", product);
        return "ProuctDetails";
    }
}
