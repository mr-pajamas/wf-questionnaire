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
@Table(name = "employee")
public class Employee{
 @Id
 @Basic(optional = false)
 @Column(name = "id")
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private int id;

 @Column(name ="username")
 private String username;

 @Column(name ="pwd")
 private String pwd;

 @Column(name ="name")
 private String name;
 
 @Column(name ="gender")
 private String gender;

 @Column(name ="department")
 private String department;

 @Column(name ="position")
 private String position;
 
 @Column(name ="jobnum")
 private String jobnum;

 @Column(name ="phonenum")
 private String phonenum;
 
 @Column(name ="email")
 private String email;
 
 @Column(name ="state")
 private int state;

 @Column(name ="createtime")
 private Date createtime;


 public void setId(int id){
   this.id=id;
 }

 public int getId(){
   return this.id;
 }


 public void setUsername(String username){
   this.username=username;
 }

 public String getUsername(){
   return this.username;
 }


 public void setPwd(String pwd){
   this.pwd=pwd;
 }

 public String getPwd(){
   return this.pwd;
 }


 public void setName(String name){
   this.name=name;
 }

 public String getName(){
   return this.name;
 }


 public void setDepartment(String department){
   this.department=department;
 }

 public String getDepartment(){
   return this.department;
 }


 public void setPosition(String position){
   this.position=position;
 }

 public String getPosition(){
   return this.position;
 }


 public void setPhonenum(String phonenum){
   this.phonenum=phonenum;
 }

 public String getPhonenum(){
   return this.phonenum;
 }

 public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}

public String getJobnum() {
	return jobnum;
}

public void setJobnum(String jobnum) {
	this.jobnum = jobnum;
}

public int getState() {
	return state;
}

public void setState(int state) {
	this.state = state;
}

public void setCreatetime(Date createtime){
   this.createtime=createtime;
 }

 public Date getCreatetime(){
   return this.createtime;
 }

}