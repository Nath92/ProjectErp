package pl.projecterp.web;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.projecterp.entity.Account;
import pl.projecterp.repository.AccountRepository;
import pl.projecterp.security.BCrypt;

@Controller
public class AccountController {

	private final AccountRepository accountRepository;

	@Autowired
	public AccountController(AccountRepository accountRepository) {
		this.accountRepository = accountRepository;
	}

	@RequestMapping("/")
	public String hello(HttpSession sess) {
		if (sess.isNew()) {
			return "redirect:account/login";
		} 
		else if(sess.getAttribute("username") != null){
			if(BCrypt.checkpw((String)sess.getAttribute("password"), accountRepository.findByUsername((String)sess.getAttribute("username")).getPassword().toString()));
			return "client/client";
		}
		else{
			return "redirect:account/login";
		}
	}

	@GetMapping("/account/login")
	public String showLoginForm(Model model, HttpSession sess, HttpServletRequest request) {
		model.addAttribute("account", new Account());
		return "account/account";
	}

	@PostMapping("/account/login")
	public String processLoginForm(@Valid @ModelAttribute Account account, BindingResult result, HttpSession sess, HttpServletRequest request) {
		if(accountRepository.findByUsername(account.getUsername()) != null && BCrypt.checkpw(account.getPassword(), accountRepository.findByUsername(account.getUsername()).getPassword().toString())){
			sess.setAttribute("username", account.getUsername());
			sess.setAttribute("password", accountRepository.findByUsername(account.getUsername()).getPassword().toString());
			return "redirect:/";
		}
		request.setAttribute("loginError", "Nieprawidłowe dane logowania");
	return "/account/account";
	}
	
	@GetMapping("/account/register")
	public String showRegisterForm(Model model) {
		model.addAttribute("account", new Account());
		return "account/account";
	}

	@PostMapping("/account/register")
	public String processRegisterForm(@Valid @ModelAttribute Account account, BindingResult result, HttpSession sess, HttpServletRequest request) {
		Long registeredUser = accountRepository.countByUsername(account.getUsername());
		if (registeredUser == 1) {
			request.setAttribute("registerError", "Taki użytkownik już istnieje");
			return "account/account";
		}
		account.setPassword(BCrypt.hashpw(account.getPassword(), BCrypt.gensalt()));
		accountRepository.save(account);
		sess.setAttribute("username", account.getUsername());
		sess.setAttribute("password", account.getPassword());
		return "redirect:/account/login";
	}
}
