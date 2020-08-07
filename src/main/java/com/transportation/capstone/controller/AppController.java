package com.transportation.capstone.controller;

import java.sql.Driver;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.transportation.capstone.dao.DriverRepository;
import com.transportation.capstone.dao.QuoteRepository;
import com.transportation.capstone.dao.ShipmentRepository;
import com.transportation.capstone.dao.ZipCodeRepository;
import com.transportation.capstone.model.Drivers;
import com.transportation.capstone.model.Quote;
import com.transportation.capstone.model.Shipment;
import com.transportation.capstone.model.Users;
import com.transportation.capstone.model.ZipCode;
import com.transportation.capstone.utils.DataValidation;



@Controller
public class AppController {
	
	@Autowired
	private QuoteRepository quoteRepository;
	
	@Autowired
	private ZipCodeRepository zipCodeRepository;
	
	@Autowired
	private ShipmentRepository shipmentRepository;
	
	@Autowired
	private DriverRepository driverRepository;
	
	@Autowired
	private DataValidation dataValidation;
	

	@GetMapping("home")
	String homepage(Model model) {
		
		model.addAttribute("msg", "Home");
		
		return "index";
	}
	
	// Mapping for tables of users called "account" in mySQL
	
	
	
	
	@GetMapping("about")
	String about(Model model) {
		
		model.addAttribute("message", "About Us");
		
		return "about";
	}
	
	@GetMapping("contact")
	String contact(Model model) {
		
		model.addAttribute("contactinfo", "Here is our contact info");
		
		return "contact";
	}
	
	@GetMapping("login")
	String loginpage(Model model) {
		model.addAttribute("msg", "");
		return "login";
	}
	

	
	@GetMapping("quote")
	String quotePage(Model model) {
		model.addAttribute("msgq", "");
		model.addAttribute("quote", new Quote());
		return "quote";
	}
	
	@GetMapping("newshipment")
	String newshipment(Model model) {
		
		model.addAttribute("msg", "Create a New Shipment");
		model.addAttribute("shipment", new Shipment());
		
		return "newshipment";
	}
	
	@PostMapping("shipTo")
	public String addShipment(@ModelAttribute ZipCode zipcode, @ModelAttribute Shipment shipment, RedirectAttributes redirect, BindingResult result) {
		
		//dataValidation.shipmentValidate(shipment, result);
		//if(result.hasErrors()) {
		//	return "newshipment";
		//	}
		
		double formatPalletCount = Double.parseDouble(shipment.getPalletCount());
		double formatWeight = Double.parseDouble(shipment.getWeight());
		
		String oZip = shipment.getoZipCode();
		String dZip = shipment.getdZipCode();
		
		double lat1 = zipCodeRepository.findById(oZip).get().getLatitude();
		double lon1 = zipCodeRepository.findById(oZip).get().getLongitude();
		double lat2 = zipCodeRepository.findById(dZip).get().getLatitude();
		double lon2 = zipCodeRepository.findById(dZip).get().getLongitude();
		
		double distance = Quote.getDistance(lat1, lat2, lon1, lon2);
		double rate1 = Quote.getRate(formatPalletCount, formatWeight, distance);
		double rate = Math.round(rate1*100.0)/100.0;
		
		shipment.setRate(rate);
		shipment.setDelivered(1);
		
		
		shipmentRepository.save(shipment);
		Long shipId = shipment.getShipmentId();
		
		redirect.addFlashAttribute("tracking", "Shipment has been successfully created.  Your tracking number is " + shipId);
		
		
		return "redirect:/newshipment";
		
		
	}
	
	
	
	@GetMapping("openshipmentdirectory")
	String driverdirectory(Model model, @ModelAttribute Shipment shipment ) {
		
		
		
		model.addAttribute("msg", "Directory");
		model.addAttribute("shipment", shipmentRepository.findAll());
		model.addAttribute("drivers", driverRepository.findAll());
		
		return "openshipmentdirectory";
	}
	
	
	@GetMapping("deleteShipment")
	String deleteShipment(Model model, @RequestParam Long shipmentId) {
		
		shipmentRepository.deleteById(shipmentId);
		
		model.addAttribute("msg23", "Shipment has been deleted. ");
		model.addAttribute("shipment", shipmentRepository.findAll());
		
		return "openshipmentdirectory";
		
	}
	
	
	@GetMapping("shipmentdetails")
	String getDetails(Model model, @RequestParam Long shipmentId, @ModelAttribute Shipment shipment) {
		//@RequestParam Long shipmentId
		
		
		model.addAttribute("shipmentdeets", "Tracking# " + shipmentRepository.findById(shipmentId).get().getShipmentId());

		model.addAttribute("shipmentId", shipmentRepository.findById(shipmentId).get().getShipmentId());
		model.addAttribute("oName", shipmentRepository.findById(shipmentId).get().getoName());
		model.addAttribute("oStreetAddress", shipmentRepository.findById(shipmentId).get().getoStreetAddress());
		model.addAttribute("oCity", shipmentRepository.findById(shipmentId).get().getoCity());
		model.addAttribute("oState", shipmentRepository.findById(shipmentId).get().getoState());
		model.addAttribute("oZipCode", shipmentRepository.findById(shipmentId).get().getoZipCode());
		model.addAttribute("dName", shipmentRepository.findById(shipmentId).get().getdName());
		model.addAttribute("dStreetAddress", shipmentRepository.findById(shipmentId).get().getdStreetAddress());
		model.addAttribute("dCity", shipmentRepository.findById(shipmentId).get().getdCity());
		model.addAttribute("dState", shipmentRepository.findById(shipmentId).get().getdState());
		model.addAttribute("dZipCode", shipmentRepository.findById(shipmentId).get().getdZipCode());
		model.addAttribute("palletCount", shipmentRepository.findById(shipmentId).get().getPalletCount());
		model.addAttribute("weight", shipmentRepository.findById(shipmentId).get().getWeight());
		model.addAttribute("pickupDate", shipmentRepository.findById(shipmentId).get().getPickupDate());
		model.addAttribute("deliveryDate", shipmentRepository.findById(shipmentId).get().getDeliveryDate());
		model.addAttribute("rate", shipmentRepository.findById(shipmentId).get().getRate());
		model.addAttribute("driver", shipmentRepository.findById(shipmentId).get().getDriver());
		
		
		return "shipmentdetails";
	}
	
	@GetMapping("setdelivered")
	String setdelivered(Model model, @RequestParam Long shipmentId) {
		
		Optional<Shipment> shipment = shipmentRepository.findById(shipmentId);
		shipmentRepository.findById(shipmentId).get().setDelivered(2);
		// Don't want to remove driver so we can see who was on the load after delivery. 
		//shipmentRepository.findById(shipmentId).get().setDriver(null);
	
		shipmentRepository.save(shipment.get());
		
		

		model.addAttribute("done","Delivery Record has been added for Tracking# " + shipmentId);
		model.addAttribute("shipment", shipmentRepository.findAll());
		
		return "openshipmentdirectory";
	}
	
	@GetMapping("undeliver")
	String undeliver(Model model, @RequestParam Long shipmentId) {
		
		Optional<Shipment> shipment = shipmentRepository.findById(shipmentId);
		shipmentRepository.findById(shipmentId).get().setDelivered(1);
		// Don't want to remove driver so we can see who was on the load after delivery. 
		//shipmentRepository.findById(shipmentId).get().setDriver(null);
	
		shipmentRepository.save(shipment.get());
		
		

		model.addAttribute("undelivered","Delivery record has been undone and tracking#  " + shipmentId + " is now marked as an open shipment. ");
		model.addAttribute("shipment", shipmentRepository.findAll());
		
		return "delivereddirectory";
	}
	
	
	@GetMapping("delivereddirectory")
	String delivereddirectory(Model model, @ModelAttribute Shipment shipment ) {
		
		
		
		model.addAttribute("msg", "Directory");
		model.addAttribute("shipment", shipmentRepository.findAll());
		
		return "delivereddirectory";
	}
	
	@GetMapping("editDriver")
	String editShipment(Model model, @RequestParam Long driverId) {
		model.addAttribute("message", "Edit Driver");
		model.addAttribute("driver", driverRepository.findById(driverId));
		
		return "editdriver";
	}
	
	@PostMapping("updatedriver")
	String updatedriver(@ModelAttribute Drivers driver, RedirectAttributes redirect) {
		
		driverRepository.findById(driver.getDriverId()).ifPresent(d -> {
			
			d.setDriverId(driver.getDriverId());
			d.setEmail(driver.getEmail());
			d.setFirstName(driver.getFirstName());
			d.setLastName(driver.getLastName());
			d.setTelephone(driver.getTelephone());
			d.setTruckNumber(driver.getTruckNumber());	
			
			driverRepository.save(d);
			
		});
		Long dId = driver.getDriverId();
		
		redirect.addFlashAttribute("success", "Update of DriverId#: " + dId + " was successful!"  );
		
		return "redirect:/driverdirectory";
	}
	
	@GetMapping("deleteDriver")
	String deleteDriver(Model model, @RequestParam Long driverId) {
		
		driverRepository.deleteById(driverId);
		
		model.addAttribute("msg23", "Driver has been removed from SimpliFreight's Database. ");
		model.addAttribute("drivers", driverRepository.findAll());
		
		return "driverdirectory";
		
	}
	
	
	
	
}
