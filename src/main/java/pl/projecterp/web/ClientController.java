package pl.projecterp.web;

import javax.servlet.http.HttpServletRequest;
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
import pl.projecterp.entity.Client;
import pl.projecterp.repository.ClientRepository;

@Controller
public class ClientController {

	
	private final ClientRepository clientRepository;
	
	@Autowired
	public ClientController(ClientRepository clientRepository) {
		this.clientRepository = clientRepository;
	}
	
	@GetMapping({"/client/add", "/client/add/{id}"})
	public String showForm(@PathVariable(required = false) Long id, Model model) {
		Client client = (id != null) ? clientRepository.findById(id) : new Client();
		model.addAttribute("client", client);
		return "client/add";
	}
	
	@PostMapping({ "/client/add", "/client/add/{id}"})
	public String processForm(@Valid @ModelAttribute Client client, BindingResult result, HttpSession sess, HttpServletRequest request) {
		if (result.hasErrors()) {
			return "client/add";
		}
		else if(clientRepository.countByNip(client.getNip()) == 1){
			request.setAttribute("duplicatedNip", "Istnieje już taki numer NIP w bazie");
			return "client/add";
		}
		else{
		client.setActive(true);
		sess.setAttribute("client", client);
		clientRepository.save(client);
		return "redirect:/address/add";}
	}
	
	@GetMapping("/client")
	public String showAllClients(Model model) {
		model.addAttribute("clients", clientRepository.findAllActive());
		return "client/client";
	}
	
	@RequestMapping("/client/delete/{id}")
	public String delete(@PathVariable Long id) {
		clientRepository.delete(clientRepository.findById(id));
//		clientRepository.triggerActive(id);
		return "redirect:/client";
	}
	
	@RequestMapping("/client/get/{id}")
	public String get(@PathVariable Long id, Model model) {
		model.addAttribute("client", clientRepository.findById(id));
		return "client/details";
	}
	

	
}
