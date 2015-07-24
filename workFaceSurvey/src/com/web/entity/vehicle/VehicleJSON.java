package com.web.entity.vehicle;

import java.util.ArrayList;
import java.util.List;


public class VehicleJSON {

	
	private String mileage;
	
	private String color;
	
	private String date;
	
	private String vehicleId;
	
	private String vehicleName;
	
	private String cityid;
	
	private String repare;
	
	private VehilceOutside wg = new VehilceOutside();
	
	private VehilceInside ns = new VehilceInside();
	
	private VehilceMotivation dl = new VehilceMotivation();
	
	private List<VehilceChassis> qt = new ArrayList<VehilceChassis>();
	
	private String dueday;
	
	private String fee;
	
	private String used;

	public VehilceOutside getWg() {
		return wg;
	}

	public void setWg(VehilceOutside wg) {
		this.wg = wg;
	}

	public VehilceInside getNs() {
		return ns;
	}

	public void setNs(VehilceInside ns) {
		this.ns = ns;
	}

	public VehilceMotivation getDl() {
		return dl;
	}

	public void setDl(VehilceMotivation dl) {
		this.dl = dl;
	}

	public String getVehicleId() {
		return vehicleId;
	}

	public void setVehicleId(String vehicleId) {
		this.vehicleId = vehicleId;
	}

	public String getVehicleName() {
		return vehicleName;
	}

	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}

	public String getCityid() {
		return cityid;
	}

	public void setCityid(String cityid) {
		this.cityid = cityid;
	}

	public String getMileage() {
		return mileage;
	}

	public void setMileage(String mileage) {
		this.mileage = mileage;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public List<VehilceChassis> getQt() {
		return qt;
	}

	public void setQt(List<VehilceChassis> qt) {
		this.qt = qt;
	}

	public String getDueday() {
		return dueday;
	}

	public void setDueday(String dueday) {
		this.dueday = dueday;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public String getRepare() {
		return repare;
	}

	public void setRepare(String repare) {
		this.repare = repare;
	}

	public String getUsed() {
		return used;
	}

	public void setUsed(String used) {
		this.used = used;
	}
	
	
	
}
