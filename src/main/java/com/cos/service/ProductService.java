package com.cos.service;

import java.util.List;

import com.cos.domain.ProductVO;
import com.cos.domain.ProductTextureVO;

public interface ProductService {
	public void productUpload(ProductVO product) throws Exception;
	public List<ProductVO> productSelect() throws Exception;
	public ProductVO pSelectOne(int pNum) throws Exception;
	public ProductTextureVO tSelectOne(int pNum) throws Exception;
}
