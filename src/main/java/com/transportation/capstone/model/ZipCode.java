package com.transportation.capstone.model;

import javax.persistence.*;

@Entity
@Table(name="zipcodes")
public class ZipCode {

	public ZipCode() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Id
	private String zipCode;
	
	private double latitude;
	private double longitude;
	
	
	
	
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
	
}
