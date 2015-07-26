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
 
 @Column(name ="password")
 private String password;

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
 
 @Column(name ="degree")
 private String degree;
 
 @Column(name ="createdate")
 private Date createdate;
 
 @Column(name ="updatetime")
 private Date updatetime;

 @Column(name ="role")
 private String role;
 
 @Column(name ="tag")
 private String tag;
 
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

public Date getCreatedate() {
	return createdate;
}

public void setCreatedate(Date createdate) {
	this.createdate = createdate;
}

public Date getUpdatetime() {
	return updatetime;
}

public void setUpdatetime(Date updatetime) {
	this.updatetime = updatetime;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getRole() {
	return role;
}

public void setRole(String role) {
	this.role = role;
}

public String getDegree() {
	return degree;
}

public void setDegree(String degree) {
	this.degree = degree;
}

public String getTag() {
	return tag;
}

public void setTag(String tag) {
	this.tag = tag;
}


 

 

}
