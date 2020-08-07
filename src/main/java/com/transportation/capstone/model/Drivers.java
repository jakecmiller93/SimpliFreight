package com.transportation.capstone.model;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="drivers")
public class Drivers {

	public Drivers() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Id
	@SequenceGenerator(name="mysequence", initialValue=1231)
	@GeneratedValue(generator="mysequence", strategy=GenerationType.AUTO)
	private Long driverId;
	private String firstName;
	private String lastName;
	private String telephone;
	private String email;
	private String truckNumber;
	
	
	@OneToMany(mappedBy="driver", cascade=CascadeType.ALL)
	List<Shipment> shipments;
	
	public List<Shipment> getShipments() {
		return shipments;
	}
	public void setShipments(List<Shipment> shipments) {
		this.shipments = shipments;
	}
	public Long getDriverId() {
		return driverId;
	}
	public void setDriverId(Long driverId) {
		this.driverId = driverId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTruckNumber() {
		return truckNumber;
	}
	public void setTruckNumber(String truckNumber) {
		this.truckNumber = truckNumber;
	}
	@Override
	public String toString() {
		return  driverId + " - " + firstName + " " +  lastName;
	}
	
	
}
