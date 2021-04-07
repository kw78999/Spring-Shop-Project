package com.cos.domain;

import java.util.List;

import lombok.Data;

@Data
public class ProductOptionVO {
	private int pNum;
	private int oNum;
	private String oSize;
	private String oColor;
	private int oStock;
	private int oPrice;
	private String oDetailSize;
	private List<ProductOptionVO> list;
	
}
