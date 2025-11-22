package com.order.website.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebsiteController {

	@GetMapping("/home")
	public String homePage() {
		
		return "home/home";
	}
}
