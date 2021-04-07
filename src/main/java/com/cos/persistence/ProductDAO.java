package com.cos.persistence;

import java.util.List;

import com.cos.domain.ProductVO;
import com.cos.domain.ProductTextureVO;

public interface ProductDAO {
	public void upload(ProductVO product) throws Exception;
	public List<ProductVO> select() throws Exception; 
	public ProductVO pSelectOne(int pNum) throws Exception;
	public ProductTextureVO tSelectOne(int pNum) throws Exception;
}
