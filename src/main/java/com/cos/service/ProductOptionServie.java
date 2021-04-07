package com.cos.service;

import java.util.List;

import com.cos.domain.ProductOptionVO;
import com.cos.domain.ProductTextureVO;

public interface ProductOptionServie {
	public void optionUpload(ProductOptionVO productOption)throws Exception;
	public void textureUpload(ProductTextureVO productTexture)throws Exception;
	public List<ProductOptionVO> optionSelect(int pNum) throws Exception;
}
