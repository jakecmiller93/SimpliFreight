package com.transportation.capstone.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.transportation.capstone.model.Shipment;

public interface ShipmentRepository extends JpaRepository<Shipment, Long> {

}
