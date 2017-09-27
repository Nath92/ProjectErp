package pl.projecterp.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.projecterp.entity.Address;
import pl.projecterp.entity.Client;
import pl.projecterp.repository.AddressRepository;

@Controller
@RequestMapping("/address")
public class AddressController {

	
private final AddressRepository addressRepository;
	
	@Autowired
	public AddressController(AddressRepository addressRepository) {
		this.addressRepository = addressRepository;
	}
	
	@GetMapping({"/add", "/add/{id}"})
	public String showForm(@PathVariable(required = false) Long id, Model model, HttpSession sess) {
		Address address;
		if (id == null) {
			address = new Address();
		} else {
			address = addressRepository.findById(id);
			sess.setAttribute("client", address.getClient());
		}
		model.addAttribute("address", address);
		return "address/add";
	}
	
	@PostMapping({ "/add", "/add/{id}"})
	public String processForm(@Valid @ModelAttribute Address address, BindingResult result, HttpSession sess) {
		if (result.hasErrors()) {
			return "address/add";
		}
		
		address.setClient((Client) sess.getAttribute("client"));
		addressRepository.save(address);
		return "redirect:/client";
	}
	
	@ModelAttribute("province")
	public ArrayList<String> province(){
		ArrayList<String> province = new ArrayList<>();
		province.add("dolnośląskie");
		province.add("kujawsko-pomorskie");
		province.add("lubelskie");
		province.add("lubuskie");
		province.add("łódzkie");
		province.add("małopolskie");
		province.add("mazowieckie");
		province.add("opolskie");
		province.add("podkarpackie");
		province.add("podlaskie");
		province.add("pomorskie");
		province.add("śląskie");
		province.add("świętokrzyskie");
		province.add("warmińsko-mazurskie");
		province.add("wielkopolskie");
		province.add("zachodniopomorskie");
		return province;
	}
	
	@RequestMapping("/delete{id}")
	public String delete(@PathVariable Long id) {
		return "redirect:/client";
	}
}
