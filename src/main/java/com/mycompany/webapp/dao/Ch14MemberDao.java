package com.mycompany.webapp.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Ch14Member;

@Repository
public class Ch14MemberDao {
	@Resource private SqlSessionTemplate sst;

	public int insert(Ch14Member member) {
		int rows = sst.insert("mybatis.mapper.member.insert", member);

		return rows;
	}

	public Ch14Member selectByMid(String mid) {
		Ch14Member dbMember = sst.selectOne("mybatis.mapper.member.selectByMid", mid);

		return dbMember;
	}
}
