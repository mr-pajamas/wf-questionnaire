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
@Table(name = "user")
public class User{
 @Id
 @Basic(optional = false)
 @Column(name = "id")
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private int id;

 @Column(name ="name")
 private String name;

 @Column(name ="phone")
 private String phone;

 @Column(name ="referrer")
 private String referrer;

 @Column(name ="position")
 private String position;

 @Column(name ="company")
 private String company;

 @Column(name ="companyaddr")
 private String companyaddr;

 @Column(name ="marriage_staus")
 private String marriage_staus;

 @Column(name ="gender")
 private String gender;

 @Column(name ="age")
 private String age;

 @Column(name ="mail")
 private String mail;

 @Column(name ="wecahrt")
 private String wecahrt;
 
 @Column(name ="createdate")
 private String createdate;
 
 @Column(name ="updatetime")
 private String updatetime;


 public void setId(int id){
   this.id=id;
 }

 public int getId(){
   return this.id;
 }


 public void setName(String name){
   this.name=name;
 }

 public String getName(){
   return this.name;
 }


 public void setPhone(String phone){
   this.phone=phone;
 }

 public String getPhone(){
   return this.phone;
 }


 public void setReferrer(String referrer){
   this.referrer=referrer;
 }

 public String getReferrer(){
   return this.referrer;
 }


 public void setPosition(String position){
   this.position=position;
 }

 public String getPosition(){
   return this.position;
 }


 public void setCompany(String company){
   this.company=company;
 }

 public String getCompany(){
   return this.company;
 }


 public void setCompanyaddr(String companyaddr){
   this.companyaddr=companyaddr;
 }

 public String getCompanyaddr(){
   return this.companyaddr;
 }


 public void setMarriage_staus(String marriage_staus){
   this.marriage_staus=marriage_staus;
 }

 public String getMarriage_staus(){
   return this.marriage_staus;
 }


 public void setGender(String gender){
   this.gender=gender;
 }

 public String getGender(){
   return this.gender;
 }


 public void setAge(String age){
   this.age=age;
 }

 public String getAge(){
   return this.age;
 }


 public void setMail(String mail){
   this.mail=mail;
 }

 public String getMail(){
   return this.mail;
 }


 public void setWecahrt(String wecahrt){
   this.wecahrt=wecahrt;
 }

 public String getWecahrt(){
   return this.wecahrt;
 }

public String getCreatedate() {
	return createdate;
}

public void setCreatedate(String createdate) {
	this.createdate = createdate;
}

public String getUpdatetime() {
	return updatetime;
}

public void setUpdatetime(String updatetime) {
	this.updatetime = updatetime;
}
 
 

}
