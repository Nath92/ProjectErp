package pl.projecterp.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.projecterp.repository.LoginRepository;

@Controller
public class HelloController {

private final LoginRepository loginRepository;
	
	@Autowired
	public HelloController(LoginRepository loginRepository) {
		this.loginRepository = loginRepository;
	}
	
	@RequestMapping("/")
	public String hello(HttpSession sess) {
		if (sess.isNew()) {
			//login+register
			return "login";
		} else {
			return "hello";
		}
	}
}
