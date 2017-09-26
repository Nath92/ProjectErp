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

import pl.projecterp.entity.Basket;
import pl.projecterp.repository.BasketRepository;

@Controller
public class BasketController {

	private final BasketRepository basketRepository;

	@Autowired
	public BasketController(BasketRepository basketRepository) {
		this.basketRepository = basketRepository;
	}

	@GetMapping({"basket/add", "basket/add/{id}"})
	public String showForm(@PathVariable(required = false) Long id, Model model) {
		model.addAttribute("basket", (id != null) ? basketRepository.findById(id) : new Basket());
		return "basket/add";
	}
	
	@PostMapping({ "basket/add", "basket/add/{id}"})
	public String processForm(@Valid @ModelAttribute Basket basket, BindingResult result) {
		if (result.hasErrors()) {
			return "basket/add";
		}
		
		basketRepository.save(basket);
		return "redirect:/basket/basket";
	}
	
	@RequestMapping("/basket")
	public String showAllOrders(Model model) {
		model.addAttribute("baskets", basketRepository.findAll());
		return "order/order";
	}
	
	@RequestMapping("basket/delete/{id}")
	public String delete(@PathVariable Long id) {
		basketRepository.delete(basketRepository.findById(id));
		return "redirect:/basket/basket";
	}
	
}
