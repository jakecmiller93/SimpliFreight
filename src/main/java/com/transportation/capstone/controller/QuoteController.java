package com.transportation.capstone.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.transportation.capstone.dao.QuoteRepository;
import com.transportation.capstone.dao.UserRepository;
import com.transportation.capstone.dao.ZipCodeRepository;
import com.transportation.capstone.model.Quote;
import com.transportation.capstone.model.ZipCode;

@Controller
public class QuoteController {
	
	@Autowired
	private ZipCodeRepository zipCodeRepository;
	
	@Autowired
	private QuoteRepository quoteRepository;
	
	
	@PostMapping("getQuote2")
	public String getQuote2(@ModelAttribute ZipCode zipcode, @ModelAttribute Quote quote , RedirectAttributes redirect) {
		
		// saving quote to database and getting the ID generated. 
		quoteRepository.save(quote);
		Long qID = quote.getQuoteId();
		
		 double formatPalletCount = Double.parseDouble(quote.getPalletCount()); 
		 double formatWeight = Double.parseDouble(quote.getWeight());
		
		String oZip = quote.getoZipCode();
		String dZip = quote.getdZipCode();
		
		double lat1 = zipCodeRepository.findById(oZip).get().getLatitude();
		double lon1 = zipCodeRepository.findById(oZip).get().getLongitude();
		double lat2 = zipCodeRepository.findById(dZip).get().getLatitude();
		double lon2 = zipCodeRepository.findById(dZip).get().getLongitude();
		
		
		double distance = Quote.getDistance(lat1, lat2, lon1, lon2);
		double rate1 = Quote.getRate(formatPalletCount, formatWeight, distance);
		double rate = Math.round(rate1*100.0)/100.0;
		
		redirect.addFlashAttribute("amount", "Your rate quote with the below details is: ");
		redirect.addFlashAttribute("amount2","$" + rate);
		redirect.addFlashAttribute("quoteID1", "Your quote ID number is:  ");
		redirect.addFlashAttribute("quoteID2", qID);
		redirect.addFlashAttribute("quoteID3", ". Please take note of this quote ID if planning to lock in this pricing.  Quotes last 7 days.");
		
		return "redirect:/quote";
	}
	


}
