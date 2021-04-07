package com.cos.util;

public class DateUtil {

	String birth ;
	String y ;
	String m ;
	String d ;
	
	public DateUtil(String y,String m,String d) {
		
		this.y = y;
		this.m = m;
		this.d = d;
	}
	public String birthFormat() {
		if(m.length()==1) {
			m="0"+m;
			birth = y+"-"+m+"-"+d;
		}else {
			birth = y+"-"+m+"-"+d;
		}
		
		return birth;
	}
	
	
}
