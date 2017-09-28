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
		} else {
			return "hello";
		}
	}

	@GetMapping("/account/login")
	public String showLoginForm(Model model, HttpSession sess) {
		model.addAttribute("account", new Account());
		return "account/login";
	}

	@PostMapping("/account/login")
	public String processLoginForm(@Valid @ModelAttribute Account account, BindingResult result, HttpSession sess, HttpServletRequest request) {
		if(accountRepository.findByUsername(account.getUsername()) != null && BCrypt.checkpw(account.getPassword(), accountRepository.findByUsername(account.getUsername()).getPassword().toString())){
			sess.setAttribute("account", account.getUsername());
			return "redirect:/";
		}
		request.setAttribute("errorInfo", "Nieprawidłowe dane logowania");
	return "/account/login";
	}
	
	@GetMapping("/account/register")
	public String showRegisterForm(Model model) {
		model.addAttribute("account", new Account());
		return "account/register";
	}

	@PostMapping("/account/register")
	public String processRegisterForm(@Valid @ModelAttribute Account account, BindingResult result, HttpSession sess, HttpServletRequest request) {
		Long registeredUser = accountRepository.countByUsername(account.getUsername());
		if (registeredUser == 1) {
			request.setAttribute("errorInfo", "Taki użytkownik już istnieje");
			return "account/register";
		}
		account.setPassword(BCrypt.hashpw(account.getPassword(), BCrypt.gensalt()));
		accountRepository.save(account);
		sess.setAttribute("account", account.getUsername());
		return "redirect:/account/login";
	}
}
