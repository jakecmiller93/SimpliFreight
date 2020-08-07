package com.transportation.capstone.model;

import javax.persistence.*;

@Entity
@Table(name="quotes")
public class Quote {

	public Quote() {
		super();
	}
	
	@Id
	@SequenceGenerator(name="myseq", initialValue=41584898)
	@GeneratedValue(generator="myseq", strategy=GenerationType.SEQUENCE)
	private Long quoteId;
	private String oZipCode;
	private String dZipCode;
	private String palletCount;
	private String weight;
	
	

	public String getoZipCode() {
		return oZipCode;
	}
	public void setoZipCode(String oZipCode) {
		this.oZipCode = oZipCode;
	}

	public String getdZipCode() {
		return dZipCode;
	}
	public void setdZipCode(String dZipCode) {
		this.dZipCode = dZipCode;
	}
	public String getPalletCount() {
		return palletCount;
	}
	public void setPalletCount(String palletCount) {
		this.palletCount = palletCount;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	
	public Long getQuoteId() {
		return quoteId;
	}
	public void setQuoteId(Long quoteId) {
		this.quoteId = quoteId;
	}
	@Override
	public String toString() {
		return "Quote [quoteId=" + quoteId + ", oZipCode=" + oZipCode + ", dZipCode=" + dZipCode + ", palletCount="
				+ palletCount + ", weight=" + weight + "]";
	}
	
	public static double getDistance(double lat1, double lat2, double lon1, double lon2) {
		
		// The math module contains a function 
        // named toRadians which converts from 
        // degrees to radians. 
        
    	//first City
    	lon1 = Math.toRadians(lon1); 
        lat1 = Math.toRadians(lat1); 
        
        //2nd City
        lon2 = Math.toRadians(lon2); 
        lat2 = Math.toRadians(lat2);
  
        // Haversine formula  
        double dlon = lon2 - lon1;  
        double dlat = lat2 - lat1; 
        double a = Math.pow(Math.sin(dlat / 2), 2) 
                 + Math.cos(lat1) * Math.cos(lat2) 
                 * Math.pow(Math.sin(dlon / 2),2); 
  
        double c = 2 * Math.asin(Math.sqrt(a)); 
  
        // Radius of earth in kilometers. Use 3956  
        // for miles 
        double r = 3956;  
        // calculate the result
        return(c * r); 
	}

	public static double getRate(double pallets, double totalWeight, double distance) {
		
		double rate = pallets*3.50 + totalWeight*.01 + distance*.58;
		
		return rate;
		
	}
	
	
}
