package pl.projecterp.web;

import java.util.Collection;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import pl.projecterp.entity.BasketItem;
import pl.projecterp.entity.Product;
import pl.projecterp.repository.BasketItemRepository;
import pl.projecterp.repository.ProductRepository;

@Controller
public class BasketItemController {

	private final BasketItemRepository basketItemRepository;
	private final ProductRepository productRepository;

	@Autowired
	public BasketItemController(BasketItemRepository basketItemRepository, ProductRepository productRepository) {
		super();
		this.basketItemRepository = basketItemRepository;
		this.productRepository = productRepository;
	}
	
	@GetMapping({"/basketItem/add", "/basketItem/add/{id}"})
	public String showForm(@PathVariable(required = false) Long id, Model model){
		model.addAttribute("basketItem", (id != null) ? basketItemRepository.findById(id) : new BasketItem());
		return "/basketItem/add";
	}
	
	@PostMapping({"/basketItem/add", "/basketItem/add/{id}"})
	public String processForm(@Valid @ModelAttribute BasketItem basketItem, BindingResult result){
		if(result.hasErrors()){
			return "basketItem/add";
		}
		basketItemRepository.save(basketItem);
		return "basketItem/basketItem";
	}
	
	@ModelAttribute("products")
	public Collection<Product> products(){
		List<Product> products = productRepository.findAll();
		return products;
	}
}
