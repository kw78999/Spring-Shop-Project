package com.cos.util;

public class ZipUtil {
	
	String zipCode ;
	String zip1 ;
	String zip2 ;
	String zip3 ;
	
	public ZipUtil(String zip1,String zip2,String zip3) {
		
		this.zip1 = zip1;
		this.zip2 = zip2;
		this.zip3 = zip3;
	}
	
	public String zipFormat() {
		zipCode = zip1+"&"+zip2+"&"+zip3;
		
		return zipCode;
	}
	
}
