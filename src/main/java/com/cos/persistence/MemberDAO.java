package com.cos.persistence;


import java.util.HashMap;
import java.util.List;

import com.cos.domain.MemberVO;

public interface MemberDAO {
	public void insert(MemberVO member) throws Exception;
	public int login(MemberVO member) throws Exception;
	public int idCheck(String id) throws Exception;
	public void emailCheck(String id) throws Exception;
	public List<MemberVO> mlist() throws Exception;
}
