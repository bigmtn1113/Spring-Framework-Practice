package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.Ch16Account;

@Repository
public class Ch16AccountDao {
	@Resource private SqlSessionTemplate sst;

	public List<Ch16Account> selectAll() {
		List<Ch16Account> list = sst.selectList("mybatis.mapper.account.selectAll");

		return list;
	}

	public Ch16Account selectByAno(int ano) {
		Ch16Account account = sst.selectOne("mybatis.mapper.account.selectByAno", ano);

		return account;
	}

	public int updateBalance(Ch16Account account) {
		int rows = sst.update("mybatis.mapper.account.updateBalance", account);

		return rows;
	}
}
