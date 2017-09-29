package pl.projecterp.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.hibernate.Hibernate;
import org.json.JSONArray;
import org.json.JSONObject;
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
import pl.projecterp.repository.BasketRepository;
import pl.projecterp.repository.ClientRepository;
import pl.projecterp.repository.ProductRepository;

@Controller
public class BasketController {

	private final ClientRepository clientRepository;
	private final BasketRepository basketRepository;
	private final BasketItemRepository basketItemRepository;
	private final ProductRepository productRepository;

	@Autowired
	public BasketController(BasketRepository basketRepository, ClientRepository clientRepository,
			ProductRepository productRepository, BasketItemRepository basketItemRepository) {
		this.basketRepository = basketRepository;
		this.clientRepository = clientRepository;
		this.productRepository = productRepository;
		this.basketItemRepository = basketItemRepository;
	}
	
	@ModelAttribute("availableProducts")
	public List<Product> products(HttpSession sess) {
		List<Product> products = productRepository.findByAvailabilityGreaterThan(0);
		Map<Long, Product> curProducts = (Map<Long, Product>) sess.getAttribute("curProducts");
		if (curProducts == null) {
			curProducts = new HashMap<>();
			for (Product p : products) curProducts.put(p.getId(), p);
		}
		sess.setAttribute("curProducts", curProducts);
		return new ArrayList<Product>(curProducts.values());
	}
	
	@ModelAttribute("JSONProducts")
	public String JSONproducts(HttpSession sess) {
		JSONArray result = new JSONArray();
		List<Product> iterate = products(sess);
		for (Product p : iterate) {
			result.put(p.toJSON());
		}
		return result.toString();
	}

	@GetMapping("/basket/add/{id}")
	public String showForm(@PathVariable Long id, Model model, HttpSession sess) {
		//init condition
		if (sess.getAttribute("basket") == null) {
			Basket basket = new Basket();
			basket.setClient(clientRepository.findById(id));
			
			sess.setAttribute("basket", basket);
			
			List<BasketItem> basketItems = new ArrayList<>();
			sess.setAttribute("basketItems", basketItems);
		}
		
		model.addAttribute("basketItem", new BasketItem());
		return "basket/itemAdd";
	}
	
	@PostMapping("/basket/add/{total}")
	public String processForm(@PathVariable Double total, HttpSession sess, Model model) {
		Basket basket = (Basket) sess.getAttribute("basket");
		if (basket == null) {
			return "redirect:/client";
		}
		basket.setTotalPrice(total);
		model.addAttribute("basket", basket);
		return "basket/confirmation";
	}
	
	@PostMapping("/basket/submit")
	public String saveBasket(@Valid @ModelAttribute Basket basket, BindingResult result,
			HttpSession sess) {
		//bought items
		List<BasketItem> basketItems = (List<BasketItem>) sess.getAttribute("basketItems");
		//products to update
		Map<Long, Product> curProducts = (Map<Long, Product>) sess.getAttribute("curProducts");
		
		//submiting basket
		basket.setClient(((Basket) sess.getAttribute("basket")).getClient());
		basketRepository.save(basket);
		//submiting basketItems
		for (int i = 0; i < basketItems.size(); i++) {
			basketItems.get(i).setBasket(basket);
			basketItemRepository.save(basketItems.get(i));
			
			//updating new product availability
			productRepository.save(curProducts.get(basketItems.get(i).getProductId()));
		}
		
		sess.invalidate();
		
		return "hello";
	}
	
	@GetMapping("/basket/next/{id}")
	@ResponseBody
	public String continueShopping(@PathVariable Long id, Model model) {
		model.addAttribute("basketItem", new BasketItem());
		return "dolecialem";
	}
	
	@RequestMapping("/basket")
	public String showAllOrders(Model model) {
		model.addAttribute("baskets", basketRepository.findAll());
		return "basket/basket";
	}
	
	@RequestMapping("/basket/delete/{id}")
	public String delete(@PathVariable Long id) {
		basketRepository.delete(basketRepository.findById(id));
		return "redirect:/basket";
	}
	
	@RequestMapping("/basket/get/{id}")
	public String get(@PathVariable Long id, Model model){
		Basket basket = basketRepository.findById(id);
		List<BasketItem> basketItems = basketItemRepository.findByBasketId(basket.getId());
		
		model.addAttribute("basket", basketRepository.findById(id));
		model.addAttribute("basketItems", basketItems);
		return "basket/details";
	}
	
}
