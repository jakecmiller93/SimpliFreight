package com.transportation.capstone.controller;



import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.transportation.capstone.model.Drivers;
import com.transportation.capstone.model.Quote;
import com.transportation.capstone.model.Shipment;
import com.transportation.capstone.model.Users;
import com.transportation.capstone.model.ZipCode;
import com.transportation.capstone.utils.DataValidation;
import com.transportation.capstone.utils.WebUtils;
import com.transportation.capstone.dao.UserRepository;
import com.transportation.capstone.dao.ZipCodeRepository;
import com.transportation.capstone.dao.DriverRepository;
import com.transportation.capstone.dao.ShipmentRepository;

@Controller
@SessionAttributes({"loggedInuser","role"})
public class AccountController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private DriverRepository driverRepository;
	
	@Autowired
	private DataValidation dataValidation;
	
	@Autowired
	private WebUtils webUtils;
	
	@Autowired
	private ShipmentRepository shipmentRepository;
	
	@Autowired
	private ZipCodeRepository zipCodeRepository;
	

	@GetMapping("register")
	String register(Model model) {
		
		model.addAttribute("contactinfo", "Register");
		model.addAttribute("users", new Users());
		return "register";
	}
	
	@GetMapping("logout")
		String logout(Model model, SessionStatus status){
			
			// this invalidates current session
			status.setComplete();
			
			model.addAttribute("loggedInuser", "");
			model.addAttribute("role","");
			
			Users user = new Users();
			model.addAttribute("user", user);
			model.addAttribute("msg", "You have been logged out");
			
		return "index";
		
	}
	
	
	@GetMapping("adddriver")
	String adddriver(Model model) {
		
		model.addAttribute("contactinfo", "Hello");
		model.addAttribute("driver", new Drivers());
		return "adddriver";
	}
	
	@GetMapping("profile")
	String profile(@SessionAttribute(required = false) String loggedInuser, Model model) {
		
		if(loggedInuser.isEmpty()) {
			model.addAttribute("error", "Expired session, please login");
			return "login";
		}
		model.addAttribute("user_account", userRepository.findByEmail(loggedInuser).get());
		
		model.addAttribute("msg", "My Profile");
		
		return "profile";
	}
	
	
	@PostMapping("login")
	String login(RedirectAttributes redirect, Model model, @RequestParam String email, @RequestParam String password) {
		
		Optional<Users> user = userRepository.login(email, password);
		if(user.isPresent()) {
			model.addAttribute("loggedInuser", email);
			model.addAttribute("role",user.get().getRole());
		} else {
			redirect.addFlashAttribute("msg123", "Invalid Credentials");
			return "redirect:/home";
		}
		
			redirect.addFlashAttribute("yes", "Login Successful!");
		return "redirect:/home";
		
	}
	
	
	
	
	@PostMapping("register")
	String register(@ModelAttribute Users user,   Model model, BindingResult result) {
		
		dataValidation.validate(user, result);
		if (result.hasErrors()) {
		   return "register";
		        }

		user.setRole("USER");
		userRepository.save(user);

		model.addAttribute("msg22", "Registration Success.  Please Login");

		return "login";
		}
	
	
	@GetMapping("userdirectory")
	String userdirectory(Model model) {
		model.addAttribute("msg", "Directory");
		model.addAttribute("users", userRepository.findAll());
		return "userdirectory";
	}
	
	
	@PostMapping("adddriver")
	String addDriver(@ModelAttribute Drivers driver, RedirectAttributes redirect, BindingResult result) {
		
		dataValidation.driverValidate(driver, result);
		if(result.hasErrors()) {
			return "redirect:/adddriver";
		}
		
		if(driverRepository.findByEmail(driver.getEmail()).isPresent()) {
			
			redirect.addFlashAttribute("error", "This driver's email already exists.");
			return "redirect:/adddriver";
		}

		driverRepository.save(driver);
		redirect.addFlashAttribute("msg", "Driver has been added successfully!");
		
		return "redirect:/adddriver";
		
	}
	
	@GetMapping("driverdirectory")
	String driverdirectory(Model model) {
		
		
		model.addAttribute("msg", "Directory");
		model.addAttribute("drivers", driverRepository.findAll());
		return "driverdirectory";
	}
	
	

	
	@GetMapping("deleteUser")
	String deleteUser(Model model, @RequestParam Long id) {
		
		userRepository.deleteById(id);
		
		model.addAttribute("msg2", "User Deleted");
		model.addAttribute("users", userRepository.findAll());
		
		return "userdirectory";
		
	}
	
	@PostMapping("editrole")
	String editrole(RedirectAttributes redirect, @RequestParam Long id, @RequestParam String role) {
		//a variable just taking place of java class = lambda expressions
		userRepository.findById(id).ifPresent(a->{
			
			a.setRole(role);
			userRepository.save(a);
			
		});
		redirect.addFlashAttribute("success","New Role Assigned");
		return "redirect:userdirectory";
		
	}
	
	@GetMapping("editeUsers")
	String editeUsers(Model model, @RequestParam Long id) {
		model.addAttribute("message", "Edit");
		model.addAttribute("user", userRepository.findById(id));
		
		return "edituser";
	}
	
	
	@PostMapping("updateUsers")
	String updateUsers(@ModelAttribute Users user, RedirectAttributes redirect) {
		
		userRepository.findById(user.getId()).ifPresent(u -> {
			
			u.setFirstName(user.getFirstName());
			u.setLastName(user.getLastName());
			u.setRole(user.getRole());
			userRepository.save(u); 
		});
		redirect.addFlashAttribute("success", "Update Successful");
		return "redirect:/userdirectory";
	}
	
	@PostMapping("sendemail")
	String sendemail(@RequestParam String fullname, String email, String subject, String message, Model model) {
		
		try {
		webUtils.sendMail("simplifreight.capstone@gmail.com", message + "    From    " + email + "   " + fullname, subject);
		model.addAttribute("msg","Message sent. We will get back to you as soon as possible.  Thanks!");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Error sending message sorry " + e);
		}

		return "contact";
	}
	

	@GetMapping("assigndriver")
	String driverDropdown(Model model) {
		model.addAttribute("listdrivers", "Directory");
		model.addAttribute("drivers.id", driverRepository.findAll());
		return "openshipmentdirectory";
	}
	
	
	@PostMapping("assigndriver")
	String assigndriver(RedirectAttributes redirect, @RequestParam Long shipmentId, @RequestParam Long driverId) {
		shipmentRepository.findById(shipmentId).ifPresent(shipment->{
			driverRepository.findById(driverId).ifPresent(driver -> {
				shipment.setDriver(driver);
				shipmentRepository.save(shipment);
			});
		});
		
		redirect.addFlashAttribute("success", "Driver has been assigned");
		return "redirect:/openshipmentdirectory";
		
	}
	
	@GetMapping("editShipment")
	String editShipment(Model model, @RequestParam Long shipmentId) {
		model.addAttribute("message", "Edit Shipment");
		model.addAttribute("shipment", shipmentRepository.findById(shipmentId));
		
		return "editshipment";
	}
	
	@PostMapping("updateShipment")
	String updateShipment(@ModelAttribute ZipCode zipcode, @ModelAttribute Shipment shipment, RedirectAttributes redirect) {
		
		shipmentRepository.findById(shipment.getShipmentId()).ifPresent(u -> {
			
			u.setoName(shipment.getoName());
			u.setoStreetAddress(shipment.getoStreetAddress());
			u.setoCity(shipment.getoCity());
			u.setoState(shipment.getoState());
			u.setoZipCode(shipment.getoZipCode());
			u.setdName(shipment.getdName());
			u.setdStreetAddress(shipment.getdStreetAddress());
			u.setdCity(shipment.getdCity());
			u.setdState(shipment.getdState());
			u.setdZipCode(shipment.getdZipCode());
			u.setPalletCount(shipment.getPalletCount());
			u.setWeight(shipment.getWeight());
			u.setPickupDate(shipment.getPickupDate());
			u.setDeliveryDate(shipment.getDeliveryDate());
			u.setDelivered(1);
			
			double formatPalletCount = Double.parseDouble(shipment.getPalletCount());
			double formatWeight = Double.parseDouble(shipment.getWeight());
			
			String oZip = shipment.getoZipCode();
			String dZip = shipment.getdZipCode();
			
			double lat1 = zipCodeRepository.findById(oZip).get().getLatitude();
			double lon1 = zipCodeRepository.findById(oZip).get().getLongitude();
			double lat2 = zipCodeRepository.findById(dZip).get().getLatitude();
			double lon2 = zipCodeRepository.findById(oZip).get().getLongitude();
			
			double distance = Quote.getDistance(lat1, lat2, lon1, lon2);
			double rate1 = Quote.getRate(formatPalletCount, formatWeight, distance);
			double rate = Math.round(rate1*100.0)/100.0;
			
			u.setRate(rate);
			u.setDelivered(1);
	
			
			shipmentRepository.save(u); 
			
			
		});
		Long shipId = shipment.getShipmentId();
		redirect.addFlashAttribute("success", "Update of Tracking# " + shipId + " was Successful");
		return "redirect:/openshipmentdirectory";
	}
	
	
}
