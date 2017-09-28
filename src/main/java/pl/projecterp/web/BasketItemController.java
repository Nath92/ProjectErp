package pl.projecterp.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.ResponseBody;

import pl.projecterp.entity.Basket;
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
	public String processForm(@Valid @ModelAttribute BasketItem basketItem, BindingResult result,
			HttpSession sess, Model model){
		if(result.hasErrors()){
			return "basket/add/" + ((Basket) sess.getAttribute("basket")).getClient().getId();
		}
		//modifying list of products in basket (basketItems)
		List<BasketItem> basketItems = (List<BasketItem>) sess.getAttribute("basketItems");
		basketItems.add(basketItem);
		sess.setAttribute("basketItems", basketItems);
		
		//modyfing number of available products to buy
		Map<Long, Product> curProducts = (Map<Long, Product>) sess.getAttribute("curProducts");
		curProducts.get(basketItem.getProductId()).setAvailability(
				curProducts.get(basketItem.getProductId()).getAvailability()
				-basketItem.getQuantity());
		sess.setAttribute("curProducts", curProducts);
		model.addAttribute("availableProducts", new ArrayList<Product>(curProducts.values()));

		return "redirect:/basket/add/" + ((Basket) sess.getAttribute("basket")).getClient().getId();
	}
	
	@RequestMapping("/basketItem")
	public String showAllOrders(Model model) {
		model.addAttribute("basketItems", basketItemRepository.findAll());
		return "basketItem/basketItem";
	}
	
	@RequestMapping("/basketItem/delete/{id}")
	public String delete(@PathVariable Long id) {
		basketItemRepository.delete(basketItemRepository.findById(id));
		return "redirect:/basketItem";
	}
	
	
	@ModelAttribute("products")
	public Collection<Product> products(){
		List<Product> products = productRepository.findAll();
		return products;
	}
}
