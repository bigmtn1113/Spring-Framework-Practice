## Ch17. Security
### Spring Security 기본 설정
#### 의존 라이브러리 설정
- Spring Security Web
- Spring Security Config
- Spring Security Taglibs
```xml
<dependency>
  <groupId>org.springframework.security</groupId>
    <artifactId>spring-security-web</artifactId>
  <version>5.3.4.RELEASE</version>
</dependency>

<dependency>
  <groupId>org.springframework.security</groupId>
    <artifactId>spring-security-config</artifactId>
  <version>5.3.4.RELEASE</version>
</dependency>

<dependency>
  <groupId>org.springframework.security</groupId>
    <artifactId>spring-security-taglibs</artifactId>
  <version>5.3.4.RELEASE</version>
</dependency>
```

#### DelegatingFilterProxy 등록
서블릿 컨테이너와 스프링 컨테이너는 다르기 때문에 서블릿 필터는 스프링에서 정의된 빈을 주입해서 사용할 수 없다.

DelegatingFilterProxy는 서블릿 필터이며 web.xml(서블릿 컨테이너)과 Application Context(스프링 컨테이너) 사이의 연결을 제공한다.  
서플릿 필터 처리를 하지 않고 Spring IoC 컨테이너에 존재하는 특정 빈에게 위임할 때 사용한다.  
위임할 때 대상의 이름을 지정하는데, 지정한 이름과 동일한 빈을 Application Context에서 찾아 위임을 요청힌다.
이때 springSecurityFilterChain을 이름으로 지정한다.
그러면 springSecurityFilterChain의 이름을 가진 FilterChainProxy가 DelegatingFilterProxy로부터 요청을 위임받아
Spring Security의 Filter들을 순서대로 호출해 전달한다.

**※ 동작 순서**  
URL 요청 -> DelegatingFilterProxy -> FilterChainProxy -> SecurityFilterChain(여러 Filter를 순서대로 적용)

```xml
<filter>
  <filter-name>springSecurityFilterChain</filter-name>
  <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
</filter>
<filter-mapping>
  <filter-name>springSecurityFilterChain</filter-name>
  <url-pattern>/*</url-pattern>
</filter-mapping>
```
이렇게 필터를 등록하고 Spring MVC를 사용할 경우 ContextLoaderListener가 Root WAC로 등록되어 있어야 한다고 한다.  
DispatcherServlet만으로 Spring MVC를 구성할 경우 에러가 발생한다는데 Root WAC를 사용할 경우엔 문제가 없다고 한다.
