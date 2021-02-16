## Ch16. Transaction
### Transaction이란
데이터베이스의 상태를 변화시키기 위해 수행하는 작업의 단위이다.

계좌이체 서비스로 돈을 송금했는데 오류가 발생했다고 가정하자.  
문제는 내 돈은 빠져나갔는데 상대방은 돈을 받지 못한 것이다.  
이런 경우를 막으려면 서비스중에 오류가 발생할 경우 이전 상태로 돌아가게 하는 것이다.  
Transacton 처리를 하면 이 같은 문제를 해결할 수 있다.

<br/>

### Spring Transaction 구현
#### XML 설정
```xml
<!-- 트랜잭션 관리자 설정 -->
<bean id="transactionManager" class="">
  <property name="dataSource" ref="dataSource"/>
</bean>

<!-- 프로그래밍 트랜잭션을 위한 설정 -->
<bean id="transactionTemplate" class="">
  <property name="transactionManager" ref="transactionManager"/>
</bean>

<!-- 선언적 트랜잭션을 위한 설정 -->
<bean>
  <tx:annotaion-driven transaction-manager="transactionManager"/>
</bean>
```

#### 프로그래밍 방식
Service에서 작성
```java
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
        status.setRollbackOnly();   // 롤백 실행
        throw e;    // Ch10ExceptionHandler에서 예외를 처리할 수 있도록 런타임 에러 발생
      }
    }
  });

  if (result.equals("success")) {
    // 성공했을 때의 내용
  } else {
    // 실패했을 때의 내용
  }
}
```

#### 선언적 방식
Service에서 작성
```java
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
```
