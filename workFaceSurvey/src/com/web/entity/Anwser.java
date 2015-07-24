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
@Table(name = "anwser")
public class Anwser{
 @Id
 @Basic(optional = false)
 @Column(name = "id")
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private int id;

 @Column(name ="question")
 private String question;

 @Column(name ="answer")
 private String answer;

 @Column(name ="phone")
 private String phone;
 
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


 public void setQuestion(String question){
   this.question=question;
 }

 public String getQuestion(){
   return this.question;
 }


 public void setAnswer(String answer){
   this.answer=answer;
 }

 public String getAnswer(){
   return this.answer;
 }


 public void setPhone(String phone){
   this.phone=phone;
 }

 public String getPhone(){
   return this.phone;
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