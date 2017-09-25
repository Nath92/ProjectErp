package pl.projecterp.web;

import java.util.Collection;

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
import org.springframework.web.bind.annotation.RequestMethod;

import pl.projecterp.entity.Client;
import pl.projecterp.repository.ClientRepository;

@Controller
@RequestMapping("/client")
public class ClientController {

	
	private final ClientRepository clientRepository;
	
	@Autowired
	public ClientController(ClientRepository clientRepository) {
		this.clientRepository = clientRepository;
	}
	
	@GetMapping({"/add", "/add/{id}"})
	public String showForm(@PathVariable(required = false) Long id, Model model) {
		
		model.addAttribute("client", (id != null) ? clientRepository.findById(id) : new Client());
		return "client/add";
	}
	
	@PostMapping({ "/add", "/add/{id}"})
	public String processForm(@Valid @ModelAttribute Client client, BindingResult result) {
		if (result.hasErrors()) {
			return "client/add";
		}
		
		clientRepository.save(client);
		return "redirect:/client/search";
	}
	
	@GetMapping("/search")
	public String showAllClients(Model model) {
		model.addAttribute("clients", clientRepository.findAll());
		return "client/search";
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		clientRepository.delete(clientRepository.findById(id));
		return "redirect:/client/search";
	}
	
	//jakbysmy chcieli nie wyswietlac wszystkich danych w tabelce i miec strone 'details'
//	@RequestMapping("/get/{id}")
//	public String get(@PathVariable Long id, Model model) {
//		model.addAttribute("client", clientRepository.findById(id));
//		return "client/details";
//	}
	

	
}
