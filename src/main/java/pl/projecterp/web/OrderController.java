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

import pl.projecterp.entity.Order;
import pl.projecterp.repository.OrderRepository;

@Controller
@RequestMapping("/order")
public class OrderController {

	private final OrderRepository orderRepository;

	@Autowired
	public OrderController(OrderRepository orderRepository) {
		this.orderRepository = orderRepository;
	}

	@GetMapping({"/add", "/add/{id}"})
	public String showForm(@PathVariable(required = false) Long id, Model model) {
		model.addAttribute("order", (id != null) ? orderRepository.findById(id) : new Order());
		return "order/add";
	}
	
	@PostMapping({ "/add", "/add/{id}"})
	public String processForm(@Valid @ModelAttribute Order order, BindingResult result) {
		if (result.hasErrors()) {
			return "order/add";
		}
		orderRepository.save(order);
		return "redirect:/order/search";
	}
	
	@GetMapping("/search")
	public String showAllProducts(Model model) {
		model.addAttribute("orders", orderRepository.findAll());
		return "product/order";
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		orderRepository.delete(orderRepository.findById(id));
		return "redirect:/order/search";
	}
	
}
