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

 @Column(name ="Q1")
 private String Q1;

 @Column(name ="Q2")
 private String Q2;

 @Column(name ="Q3")
 private String Q3;

 @Column(name ="Q4")
 private String Q4;

 @Column(name ="Q5")
 private String Q5;

 @Column(name ="Q6")
 private String Q6;

 @Column(name ="Q7")
 private String Q7;

 @Column(name ="Q8")
 private String Q8;

 @Column(name ="Q9")
 private String Q9;

 @Column(name ="Q10")
 private String Q10;

 @Column(name ="Q11")
 private String Q11;

 @Column(name ="Q12")
 private String Q12;

 @Column(name ="Q13")
 private String Q13;

 @Column(name ="Q14")
 private String Q14;

 @Column(name ="Q15")
 private String Q15;

 @Column(name ="Q16")
 private String Q16;

 @Column(name ="Q17")
 private String Q17;

 @Column(name ="Q18")
 private String Q18;

 @Column(name ="Q19")
 private String Q19;

 @Column(name ="Q20")
 private String Q20;

 @Column(name ="Q21")
 private String Q21;

 @Column(name ="Q22")
 private String Q22;

 @Column(name ="Q23")
 private String Q23;

 @Column(name ="Q24")
 private String Q24;

 @Column(name ="Q25")
 private String Q25;

 @Column(name ="Q26")
 private String Q26;

 @Column(name ="Q27")
 private String Q27;

 @Column(name ="Q28")
 private String Q28;

 @Column(name ="Q29")
 private String Q29;

 @Column(name ="Q30")
 private String Q30;

 @Column(name ="Q31")
 private String Q31;

 @Column(name ="Q32")
 private String Q32;

 @Column(name ="Q33")
 private String Q33;

 @Column(name ="Q34")
 private String Q34;

 @Column(name ="Q35")
 private String Q35;

 @Column(name ="Q36")
 private String Q36;

 @Column(name ="Q37")
 private String Q37;

 @Column(name ="Q38")
 private String Q38;

 @Column(name ="Q39")
 private String Q39;
 
 @Column(name ="Q40")
 private String Q40;
 
 @Column(name ="Q41")
 private String Q41;
 
 @Column(name ="createtime")
 private Date createtime;

 @Column(name ="updatetime")
 private Date updatetime;


 public void setId(int id){
   this.id=id;
 }

 public int getId(){
   return this.id;
 }

public String getQ1() {
	return Q1;
}

public void setQ1(String q1) {
	Q1 = q1;
}

public String getQ2() {
	return Q2;
}

public void setQ2(String q2) {
	Q2 = q2;
}

public String getQ3() {
	return Q3;
}

public void setQ3(String q3) {
	Q3 = q3;
}

public String getQ4() {
	return Q4;
}

public void setQ4(String q4) {
	Q4 = q4;
}

public String getQ5() {
	return Q5;
}

public void setQ5(String q5) {
	Q5 = q5;
}

public String getQ6() {
	return Q6;
}

public void setQ6(String q6) {
	Q6 = q6;
}

public String getQ7() {
	return Q7;
}

public void setQ7(String q7) {
	Q7 = q7;
}

public String getQ8() {
	return Q8;
}

public void setQ8(String q8) {
	Q8 = q8;
}

public String getQ9() {
	return Q9;
}

public void setQ9(String q9) {
	Q9 = q9;
}

public String getQ10() {
	return Q10;
}

public void setQ10(String q10) {
	Q10 = q10;
}

public String getQ11() {
	return Q11;
}

public void setQ11(String q11) {
	Q11 = q11;
}

public String getQ12() {
	return Q12;
}

public void setQ12(String q12) {
	Q12 = q12;
}

public String getQ13() {
	return Q13;
}

public void setQ13(String q13) {
	Q13 = q13;
}

public String getQ14() {
	return Q14;
}

public void setQ14(String q14) {
	Q14 = q14;
}

public String getQ15() {
	return Q15;
}

public void setQ15(String q15) {
	Q15 = q15;
}

public String getQ16() {
	return Q16;
}

public void setQ16(String q16) {
	Q16 = q16;
}

public String getQ17() {
	return Q17;
}

public void setQ17(String q17) {
	Q17 = q17;
}

public String getQ18() {
	return Q18;
}

public void setQ18(String q18) {
	Q18 = q18;
}

public String getQ19() {
	return Q19;
}

public void setQ19(String q19) {
	Q19 = q19;
}

public String getQ20() {
	return Q20;
}

public void setQ20(String q20) {
	Q20 = q20;
}

public String getQ21() {
	return Q21;
}

public void setQ21(String q21) {
	Q21 = q21;
}

public String getQ22() {
	return Q22;
}

public void setQ22(String q22) {
	Q22 = q22;
}

public String getQ23() {
	return Q23;
}

public void setQ23(String q23) {
	Q23 = q23;
}

public String getQ24() {
	return Q24;
}

public void setQ24(String q24) {
	Q24 = q24;
}

public String getQ25() {
	return Q25;
}

public void setQ25(String q25) {
	Q25 = q25;
}

public String getQ26() {
	return Q26;
}

public void setQ26(String q26) {
	Q26 = q26;
}

public String getQ27() {
	return Q27;
}

public void setQ27(String q27) {
	Q27 = q27;
}

public String getQ28() {
	return Q28;
}

public void setQ28(String q28) {
	Q28 = q28;
}

public String getQ29() {
	return Q29;
}

public void setQ29(String q29) {
	Q29 = q29;
}

public String getQ30() {
	return Q30;
}

public void setQ30(String q30) {
	Q30 = q30;
}

public String getQ31() {
	return Q31;
}

public void setQ31(String q31) {
	Q31 = q31;
}

public String getQ32() {
	return Q32;
}

public void setQ32(String q32) {
	Q32 = q32;
}

public String getQ33() {
	return Q33;
}

public void setQ33(String q33) {
	Q33 = q33;
}

public String getQ34() {
	return Q34;
}

public void setQ34(String q34) {
	Q34 = q34;
}

public String getQ35() {
	return Q35;
}

public void setQ35(String q35) {
	Q35 = q35;
}

public String getQ36() {
	return Q36;
}

public void setQ36(String q36) {
	Q36 = q36;
}

public String getQ37() {
	return Q37;
}

public void setQ37(String q37) {
	Q37 = q37;
}

public String getQ38() {
	return Q38;
}

public void setQ38(String q38) {
	Q38 = q38;
}

public Date getCreatetime() {
	return createtime;
}

public void setCreatetime(Date createtime) {
	this.createtime = createtime;
}

public Date getUpdatetime() {
	return updatetime;
}

public void setUpdatetime(Date updatetime) {
	this.updatetime = updatetime;
}

public String getQ39() {
	return Q39;
}

public void setQ39(String q39) {
	Q39 = q39;
}

public String getQ40() {
	return Q40;
}

public void setQ40(String q40) {
	Q40 = q40;
}

public String getQ41() {
	return Q41;
}

public void setQ41(String q41) {
	Q41 = q41;
}




}