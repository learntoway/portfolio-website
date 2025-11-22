package com.order.website.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebsiteController {

	@GetMapping("/")
	public String homePage() {
		return "home/home";
	}

	@GetMapping("/info")
	public String contact() {
		return "info/info"; // maps to /WEB-INF/views/contact.jsp
	}
}
