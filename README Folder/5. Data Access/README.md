## Ch14. Data Access
### Maven 의존 라이브러리 설정
- spring-jdbc 모듈
- Apache Commons DBCP
- MyBatis
- Log4jdbc JDBC Proxy Driver
- JDBC Driver

<br/>

### DataSource
#### Web Application 내부 설정
**장점**: WAS 설정에 의존하지 않고 Web Application을 배치할 수 있다.  
**단점**: Web Application이 다수일 때 전체 Connection 관리가 어렵다.  
-> WAS에 하나의 Web Application만 배치할 경우에 유리하다.

**log4j.xml**
```xml
<logger name="jdbc.sqltiming">
  <level value="info" />
</logger>
```

**datasource.xml**
```xml
<bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource" destroy-method="close">
  <!--
  <property name="driverClassName" value="oracle.jdbc.OracleDriver"/>
  <property name="url" value="jdbc:oracle:thin:@localhost:1521:orcl"/>
  -->

  <!--원래는 위 코드처럼 사용하나 SQL 로깅을 하기 위해 사용 -->
  <property name="driverClassName" value="net.sf.log4jdbc.DriverSpy"/>
  <property name="url" value="jdbc:log4jdbc:oracle:thin:@localhost:1521:orcl"/>
  <property name="username" value="study"/>   <!-- DB 계정 id -->
  <property name="password" value="12345"/>   <!-- DB 계정 pw -->
  <property name="maxTotal" value="1"/>   <!-- 이전 버전은 maxActive. 동시에 사용할 수 있는 최대 커넥션 개수 (default = 8) -->
  <property name="initialSize" value="1"/>    <!-- 최초로 커넥션을 맺을 때 Connection pool에 생성되는 connection 수 -->
  <property name="maxIdle" value="1"/>    <!-- 사용한 connection을 pool에 반납할 시 최대로 유지할 개수 (default = 8)-->
</bean>
```

#### WAS(Tomcat Server) 설정
**장점**: 전체 Connection 관리가 쉽다.  
**단점**: WAS의 DataSource 설정이 별도로 필요하다.  
-> WAS에 다수의 Web Application을 배치할 경우에 유리하다.

- Tomcat 설치 폴더/lib에 ojdbc6.jar 파일 배치

- Tomcat 설치 폴더/conf/server.xml
  ```xml
  <GlobalNamingResources>
    ...
    <Resource name="jdbc/spring" auth="Container"
      type="javax.sql.DataSource"
      driverClassName="oracle.jdbc.OracleDriver"
      url="jdbc:oracle:thin:@localhost:1521:orcl"
      username="study"
      password="12345"
      maxTotal="1"
      initialSize="1"
      maxIdle="1"/>
  </GlobalNamingResources>
  ```
  
- Tomcat 설치 폴더/conf/context.xml
  ```xml
  <Context>
    ...
    <ResourceLink name="jdbc/spring" global="jdbc/spring" type="javax.sql.DataSource"/>
  </Context>
  ```
  
- Tomcat 재등록

- **datasource.xml**
  ```xml
  <jee:jndi-lookup id="dataSource" jndi-name="jdbc/spring" expected-type="javax.sql.DataSource"/>
  ```

<br/>

### MyBatis
JDBC를 이용하면 클래스에 반복된 코드가 존재하게 되고 한 파일에 java언어와 sql언어가 있어서 재사용성이 안좋아지는 단점이 있다.  
MyBatis를 사용함으로써 이러한 단점들을 없앨 수 있다.

#### 특징
- SQL과 객체를 매핑하는 Mapper XML 문서를 사용한다.
- SQL 기반 매핑이므로 기술적 난이도가 적다.
- 복잡한 JDBC 코드를 간소화할 수 있다.

#### Mapper XML 문서 템플릿을 위한 Plugin 설치
- MyBatipse

#### DataSource XML 설정
```xml
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
  <property name="dataSource" ref="dataSource"/>
  <property name="configLocation" value="classpath:mybatis/mapper-config.xml"/>
  <property name="mapperLocations" value="classpath:mybatis/mapper/*.xml"/>
</bean>

<bean id="sqlSessionTemplate" class="org.mybatis.spring.SqlSessionTemplate">
  <constructor-arg ref="sqlSessionFactory"/>
</bean>
```

#### Mapper Config XML 설정
```xml
<configuration>
  <typeAliases>
    <typeAlias alias="name" type="package...ClassName" />
    <typeAlias alias="name" type="package...ClassName" />
    ...
  </typeAliases>
</configuration>
```

#### Mapper XML
프로그램 객체로 DB 테이블과 작업을 하도록 SQL과 매핑을 정의한 XML 파일이다.  
DB 테이블 당 하나의 XML 파일로 작성하는 것이 원칙이다.

**member.xml**
```xml
<mapper namespace="mybatis.mapper.member">

  <insert id="insert" parameterType="member">
    insert into member (mid, mname, mpassword, menabled, mrole, mphoto)
    values (#{mid}, #{mname}, #{mpassword}, #{menabled}, #{mrole}, #{mphoto})
  </insert>

  <select id="selectByMid" parameterType="string" resultType="member">
    select *
    from member
    where mid = #{mid}
  </select>
  
  ...
</mapper>
```

<br/>

### DAO(Data Access Object)
#### DAO 클래스 작성 요령
- @Repository를 이용해 관리 빈으로 설정한다.
- 향후 DBMS가 변경될 소지가 있다면 인터페이스 구현 클래스로 작성한다.
- 애플리케이션의 로직 코드는 작성하지 않는다.
- 테이블 당 1개씩 작성하는 것을 원칙으로 한다.
- DB 입출력 코드만 작성하되, DBMS 의존적인 연결 코드는 작성하지 않는다. ex) DBMS 연결 문자열
- 메소드 이름은 작업하고자 하는 SQL 문과 동일한 이름을 짓는다. ex) insert(), update(), ...
- 메소드 내부에서 예외 처리를 하지 말아야 한다.
- 컬럼의 값을 따로 매개값으로 받기 보다는 행을 표현하는 DTO로 받는다.
- insert, update, delete 메소드의 리턴 값은 반영된 행수로 한다.

**MemberDao**  
```java
@Repository
public class MemberDao {
  @Resource private SqlSessionTemplate sst;

  public int insert(Member member) {
    int rows = sst.insert("mybatis.mapper.member.insert", member);
    return rows;
  }

  public Member selectByMid(String mid) {
    Member dbMember = sst.selectOne("mybatis.mapper.member.selectByMid", mid);
    return dbMember;
  }
}
```
