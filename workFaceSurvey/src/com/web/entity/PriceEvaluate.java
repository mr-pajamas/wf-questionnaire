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
@Table(name = "car_evaluate_info")
public class PriceEvaluate{
 @Id
 @Basic(optional = false)
 @Column(name = "id")
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private int id;

 @Column(name ="vehicleid")
 private String vehicleid;

 @Column(name ="pid")
 private String pid;

 @Column(name ="cid")
 private String cid;

 @Column(name ="area1_price")
 private String area1_price;

 @Column(name ="repurchase_price")
 private String repurchase_price;

 @Column(name ="area2_price")
 private String area2_price;

 @Column(name ="person_price")
 private String person_price;

 @Column(name ="area3_price")
 private String area3_price;

 @Column(name ="retail_price")
 private String retail_price;

 @Column(name ="area4_price")
 private String area4_price;

 @Column(name ="license_plate_date")
 private  String license_plate_date;

 @Column(name ="run")
 private String run;

 @Column(name ="createtime")
 private Date createtime;


 public void setId(int id){
   this.id=id;
 }

 public int getId(){
   return this.id;
 }


 public void setVehicleid(String vehicleid){
   this.vehicleid=vehicleid;
 }

 public String getVehicleid(){
   return this.vehicleid;
 }


 public void setPid(String pid){
   this.pid=pid;
 }

 public String getPid(){
   return this.pid;
 }


 public void setCid(String cid){
   this.cid=cid;
 }

 public String getCid(){
   return this.cid;
 }


 public void setArea1_price(String area1_price){
   this.area1_price=area1_price;
 }

 public String getArea1_price(){
   return this.area1_price;
 }


 public void setRepurchase_price(String repurchase_price){
   this.repurchase_price=repurchase_price;
 }

 public String getRepurchase_price(){
   return this.repurchase_price;
 }


 public void setArea2_price(String area2_price){
   this.area2_price=area2_price;
 }

 public String getArea2_price(){
   return this.area2_price;
 }


 public void setPerson_price(String person_price){
   this.person_price=person_price;
 }

 public String getPerson_price(){
   return this.person_price;
 }


 public void setArea3_price(String area3_price){
   this.area3_price=area3_price;
 }

 public String getArea3_price(){
   return this.area3_price;
 }


 public void setRetail_price(String retail_price){
   this.retail_price=retail_price;
 }

 public String getRetail_price(){
   return this.retail_price;
 }


 public void setArea4_price(String area4_price){
   this.area4_price=area4_price;
 }

 public String getArea4_price(){
   return this.area4_price;
 }


 public void setLicense_plate_date( String license_plate_date){
   this.license_plate_date=license_plate_date;
 }

 public  String getLicense_plate_date(){
   return this.license_plate_date;
 }


 public void setRun(String run){
   this.run=run;
 }

 public String getRun(){
   return this.run;
 }


 public void setCreatetime( Date createtime){
   this.createtime=createtime;
 }

 public  Date getCreatetime(){
   return this.createtime;
 }

}