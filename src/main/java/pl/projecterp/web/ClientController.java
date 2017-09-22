package pl.projecterp.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.projecterp.dao.ClientDao;
import pl.projecterp.entity.Client;
import pl.projecterp.repository.ClientRepository;

@Controller
public class ClientController {

	@Autowired
	private ClientDao clientDao;	
	
	private final ClientRepository clientRepository;
	
	@Autowired
	public ClientController(ClientRepository clientRepository) {
		this.clientRepository = clientRepository;
	}
	
	@GetMapping("/client/add")
	public String showForm(Model model) {
		model.addAttribute("client", new Client());
		return "client/add";
	}
	
	@RequestMapping(value = "/client/add", method = RequestMethod.POST)
	public String processForm(Client client) {
	clientRepository.save(client);
	return "redirect:./add";
	}
	
	@GetMapping("/client/search")
	public String showAllClients(Model model) {
		model.addAttribute("clientAttributePl", clientDao.clientAttributesPl());
		model.addAttribute("clients", clientRepository.findAll());
		return "client/search";
	}
	
	@ModelAttribute("clientAttributesPl")
	public Collection<String> clientAttributesPl() {
		return clientDao.clientAttributesPl();
	}

	
}
