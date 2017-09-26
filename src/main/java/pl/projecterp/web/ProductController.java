package pl.projecterp.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.projecterp.entity.Product;
import pl.projecterp.repository.ProductRepository;

@Controller
public class ProductController {

	private final ProductRepository productRepository;

	@Autowired
	public ProductController(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}
	
	@GetMapping({"/product/add", "/product/add/{id}"})
	public String showForm(@PathVariable(required = false) Long id, Model model) {
		model.addAttribute("product", (id != null) ? productRepository.findById(id) : new Product());
		return "product/add";
	}
	
	@PostMapping({ "/product/add", "/product/add/{id}"})
	public String processForm(@Valid @ModelAttribute Product product, BindingResult result) {
		if (result.hasErrors()) {
			return "product/add";
		}
		productRepository.save(product);
		return "redirect:/product";
	}
	
	@RequestMapping("/product")
	public String showAllProducts(Model model) {
		model.addAttribute("products", productRepository.findAll());
		return "product/product";
	}
	
	@RequestMapping("/product/delete/{id}")
	public String delete(@PathVariable Long id) {
		productRepository.delete(productRepository.findById(id));
		return "redirect:/product";
	}
	
}
