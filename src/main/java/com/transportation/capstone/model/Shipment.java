package com.transportation.capstone.model;



import javax.persistence.*;

@Entity
@Table(name="shipments")
public class Shipment {
	
	

	public Shipment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	@Id
	@SequenceGenerator(name="mysequ", initialValue=147852695)
	@GeneratedValue(generator="mysequ", strategy=GenerationType.SEQUENCE)
	private Long shipmentId;
	private String oName;
	private String oStreetAddress;
	private String oCity;
	private String oState;
	private String oZipCode;
	private String dName;
	private String dStreetAddress;
	private String dCity;
	private String dState;
	private String dZipCode;
	private String palletCount;
	private String weight;
	private String pickupDate;
	private String deliveryDate;
	private double rate;
	
	@ManyToOne(cascade=CascadeType.DETACH)
	@JoinColumn(name="driver_id")
	private Drivers driver;
	
	// on every shipment upon creation have this set to false.
	@Column(name="delivered", columnDefinition = "INTEGER")
	private int delivered;
	
	
	
	
	public Long getShipmentId() {
		return shipmentId;
	}
	public void setShipmentId(Long shipmentId) {
		this.shipmentId = shipmentId;
	}
	public String getoStreetAddress() {
		return oStreetAddress;
	}
	public void setoStreetAddress(String oStreetAddress) {
		this.oStreetAddress = oStreetAddress;
	}
	public String getoCity() {
		return oCity;
	}
	public void setoCity(String oCity) {
		this.oCity = oCity;
	}
	public String getoState() {
		return oState;
	}
	public void setoState(String oState) {
		this.oState = oState;
	}
	public String getoZipCode() {
		return oZipCode;
	}
	public void setoZipCode(String oZipCode) {
		this.oZipCode = oZipCode;
	}
	public String getdStreetAddress() {
		return dStreetAddress;
	}
	public void setdStreetAddress(String dStreetAddress) {
		this.dStreetAddress = dStreetAddress;
	}
	public String getdCity() {
		return dCity;
	}
	public void setdCity(String dCity) {
		this.dCity = dCity;
	}
	public String getdState() {
		return dState;
	}
	public void setdState(String dState) {
		this.dState = dState;
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
	public String getPickupDate() {
		return pickupDate;
	}
	public void setPickupDate(String pickupDate) {
		this.pickupDate = pickupDate;
	}
	public String getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public int getDelivered() {
		return delivered;
	}
	public void setDelivered(int delivered) {
		this.delivered = delivered;
	}
	
	
	public Drivers getDriver() {
		return driver;
	}
	public void setDriver(Drivers driver) {
		this.driver = driver;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getoName() {
		return oName;
	}
	public void setoName(String oName) {
		this.oName = oName;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	
	
	
}
