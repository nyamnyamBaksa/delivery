package com.delivery.web.location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LocationController {

	@Autowired
	private LocationService locationService;
	
	@GetMapping("/location")
	public String location() {
		return "location";
	}
}
	
