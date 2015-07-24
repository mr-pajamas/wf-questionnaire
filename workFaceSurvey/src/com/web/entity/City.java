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
@Table(name = "city")
public class City{
 @Id
 @Basic(optional = false)
 @Column(name = "id")
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private int id;

 @Column(name ="cityid")
 private String cityid;

 @Column(name ="cityname")
 private String cityname;

 @Column(name ="proid")
 private String proid;


 public void setId(int id){
   this.id=id;
 }

 public int getId(){
   return this.id;
 }


 public void setCityid(String cityid){
   this.cityid=cityid;
 }

 public String getCityid(){
   return this.cityid;
 }


 public void setCityname(String cityname){
   this.cityname=cityname;
 }

 public String getCityname(){
   return this.cityname;
 }


 public void setProid(String proid){
   this.proid=proid;
 }

 public String getProid(){
   return this.proid;
 }

}