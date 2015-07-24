package com.web.entity;

import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "search_record")
public class Search_record{
 @Id
 @Basic(optional = false)
 @Column(name = "id")
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private int id;

 @Column(name ="userid")
 private int userid;

 @Column(name ="cityid")
 private String cityid;

 @Column(name ="date")
 private String date;

 @Column(name ="mileage")
 private String mileage;

 @Column(name ="color")
 private String color;

 @Column(name ="uesd")
 private String uesd;

 @Column(name ="dueday")
 private String dueday;

 @Column(name ="fee")
 private String fee;

 @Column(name ="outside")
 private String outside;

 @Column(name ="inside")
 private String inside;

 @Column(name ="engine")
 private String engine;

 @Column(name ="eletircequip")
 private String eletircequip;

 @Column(name ="ohter")
 private String ohter;

 @Column(name ="chassis")
 private String chassis;

 @Column(name ="createtime")
 private Date createtime;

 @Column(name ="modifytime")
 private Date  modifytime;

 @Column(name ="vehicleid")
 private int vehicleid;

 @Column(name ="vehiclename")
 private String vehiclename;

 @Column(name ="price1")
 private String price1;

 @Column(name ="price2")
 private String price2;

 @Column(name ="price3")
 private String price3;

 @Column(name ="maintain")
 private String maintain;

 @Column(name ="carcondition")
 private String carcondition;

 @Column(name ="price4")
 private String price4;

 @Column(name ="familyid")
 private String familyid;

 
 public String getFamilyid() {
	return familyid;
}

public void setFamilyid(String familyid) {
	this.familyid = familyid;
}

public String getMaintain() {
	return maintain;
}

public void setMaintain(String maintain) {
	this.maintain = maintain;
}

public String getCarcondition() {
	return carcondition;
}

public void setCarcondition(String carcondition) {
	this.carcondition = carcondition;
}

public void setId(int id){
   this.id=id;
 }

 public int getId(){
   return this.id;
 }


 public void setUserid(int userid){
   this.userid=userid;
 }

 public int getUserid(){
   return this.userid;
 }


 public void setCityid(String cityid){
   this.cityid=cityid;
 }

 public String getCityid(){
   return this.cityid;
 }


 public void setDate(String date){
   this.date=date;
 }

 public String getDate(){
   return this.date;
 }


 public void setMileage(String mileage){
   this.mileage=mileage;
 }

 public String getMileage(){
   return this.mileage;
 }


 public void setColor(String color){
   this.color=color;
 }

 public String getColor(){
   return this.color;
 }


 public void setUesd(String uesd){
   this.uesd=uesd;
 }

 public String getUesd(){
   return this.uesd;
 }


 public void setDueday(String dueday){
   this.dueday=dueday;
 }

 public String getDueday(){
   return this.dueday;
 }


 public void setFee(String fee){
   this.fee=fee;
 }

 public String getFee(){
   return this.fee;
 }


 public void setOutside(String outside){
   this.outside=outside;
 }

 public String getOutside(){
   return this.outside;
 }


 public void setInside(String inside){
   this.inside=inside;
 }

 public String getInside(){
   return this.inside;
 }


 public void setEngine(String engine){
   this.engine=engine;
 }

 public String getEngine(){
   return this.engine;
 }


 public void setEletircequip(String eletircequip){
   this.eletircequip=eletircequip;
 }

 public String getEletircequip(){
   return this.eletircequip;
 }


 public void setOhter(String ohter){
   this.ohter=ohter;
 }

 public String getOhter(){
   return this.ohter;
 }


 public void setChassis(String chassis){
   this.chassis=chassis;
 }

 public String getChassis(){
   return this.chassis;
 }


 public void setCreatetime(Date createtime){
   this.createtime=createtime;
 }

 public Date getCreatetime(){
   return this.createtime;
 }


 public void setModifytime(Date modifytime){
   this.modifytime=modifytime;
 }

 public Date getModifytime(){
   return this.modifytime;
 }


 public void setVehicleid(int vehicleid){
   this.vehicleid=vehicleid;
 }

 public int getVehicleid(){
   return this.vehicleid;
 }


 public void setVehiclename(String vehiclename){
   this.vehiclename=vehiclename;
 }

 public String getVehiclename(){
   return this.vehiclename;
 }


 public void setPrice1(String price1){
   this.price1=price1;
 }

 public String getPrice1(){
   return this.price1;
 }


 public void setPrice2(String price2){
   this.price2=price2;
 }

 public String getPrice2(){
   return this.price2;
 }


 public void setPrice3(String price3){
   this.price3=price3;
 }

 public String getPrice3(){
   return this.price3;
 }

public String getPrice4() {
	return price4;
}

public void setPrice4(String price4) {
	this.price4 = price4;
}

}