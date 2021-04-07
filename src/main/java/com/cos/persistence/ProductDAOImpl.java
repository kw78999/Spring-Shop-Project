package com.cos.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cos.domain.ProductVO;
import com.cos.domain.ProductTextureVO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	
	@Inject
	private SqlSession session;
	private static final String namespace ="com.cos.domain.product";

	@Override
	public void upload(ProductVO product) throws Exception {
		 session.insert(namespace+".upload",product);
	}
	@Override
	public List<ProductVO> select() throws Exception {
		return session.selectList(namespace+".select");
	}
	@Override
		public ProductVO pSelectOne(int pNum) throws Exception {
			
			return session.selectOne(namespace+".pSelectOne",pNum);
		}
	@Override
	public ProductTextureVO tSelectOne(int pNum) throws Exception {
		
		return session.selectOne(namespace+".tSelectOne",pNum);
	}

}
