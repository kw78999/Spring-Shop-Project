package com.cos.persistence;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cos.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession session;
	private static final String namespace ="com.cos.domain.member";

	@Override
	public void insert(MemberVO member)  throws Exception{
		session.insert(namespace+".insert",member);
		
	}
	@Override
	public int login(MemberVO member) throws Exception {
		return session.selectOne(namespace+".login", member);
	}
	@Override
	public int idCheck(String id) throws Exception {
		int cnt = session.selectOne(namespace+".idCheck",id);
		
		
		return cnt;
	}
	@Override
	public void emailCheck(String id) throws Exception {
		session.update(namespace+".emailCheck",id);
		
	}
		
}
