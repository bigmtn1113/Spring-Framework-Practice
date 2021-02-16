package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import com.mycompany.webapp.dao.Ch16AccountDao;
import com.mycompany.webapp.dto.Ch16Account;
import com.mycompany.webapp.exception.Ch10NotFoundAccountException;

@Service
public class Ch16Service {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch16Service.class);

	@Resource private Ch16AccountDao accountDao;
	
	@Resource private TransactionTemplate transactionTemplate;

	public void transfer1(int fromAno, int toAno, int amount) {
		String result = transactionTemplate.execute(new TransactionCallback<String>() {

			@Override
			public String doInTransaction(TransactionStatus status) {
				try {
					// 출금
					Ch16Account fromAccount = accountDao.selectByAno(fromAno);
					if (fromAccount == null) {
						throw new Ch10NotFoundAccountException("출금 계좌가 없음");
					}
					fromAccount.setBalance(fromAccount.getBalance() - amount);
					accountDao.updateBalance(fromAccount);

					// 입금
					Ch16Account toAccount = accountDao.selectByAno(toAno);
					if (toAccount == null) {
						throw new Ch10NotFoundAccountException("입금 계좌가 없음");
					}
					toAccount.setBalance(toAccount.getBalance() + amount);
					accountDao.updateBalance(toAccount);

					return "success";
				} catch (Exception e) {
					// 롤백 실행
					status.setRollbackOnly();
					// Ch10ExceptionHandler에서 예외를 처리할 수 있도록 런타임 에러 발생
					throw e;
				}
			}
		});

		if (result.equals("success")) {
			LOGGER.info("성공");
		} else {
			LOGGER.info("실패");
		}
	}

	@Transactional
	public void transfer2(int fromAno, int toAno, int amount) {
		// 출금
		Ch16Account fromAccount = accountDao.selectByAno(fromAno);
		if (fromAccount == null) {
			throw new Ch10NotFoundAccountException("출금 계좌가 없음");
		}
		fromAccount.setBalance(fromAccount.getBalance() - amount);
		accountDao.updateBalance(fromAccount);

		// 입금
		Ch16Account toAccount = accountDao.selectByAno(toAno);
		if (toAccount == null) {
			throw new Ch10NotFoundAccountException("입금 계좌가 없음");
		}
		toAccount.setBalance(toAccount.getBalance() + amount);
		accountDao.updateBalance(toAccount);
	}

	public List<Ch16Account> getAccountList() {
		List<Ch16Account> list = accountDao.selectAll();
		
		return list;
	}
}
