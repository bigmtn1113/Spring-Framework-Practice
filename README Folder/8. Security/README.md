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

#### 보안 필터 체인 설정
- 핸들러를 사용하여 로그인/로그아웃
- 핸들러를 사용하지 않고 로그인/ 로그아웃

[1] 핸들러를 사용하여 로그인/로그아웃
```xml
<security:http>
  <!--
  login-page: 로그인 폼 경로
  login-processing-url: 로그인 처리 경로
  username-parameter, password-parameter: 로그인 파라미터명
  authentication-success/failure-handler-ref: 로그인 결과 핸들러
  -->
  <security:form-login login-page="/ch17/loginForm"
                       login-processing-url="/login"
                       username-parameter="mid"
                       password-parameter="mpassword"
                       authentication-success-handler-ref="ch17AuthenticationSuccessHandler"
                       authentication-failure-handler-ref="ch17AuthenticationFailureHandler"/>			 

  <!--
  logout-url: 로그아웃 처리 경로
  success-handler-ref: 로그아웃 결과 핸들러
  -->
  <security:logout logout-url="/logout" 
                   success-handler-ref="ch17LogoutSuccessHandler"/>
</security:http>

<!-- 로그인 성공 핸들러 -->
<bean id="ch17AuthenticationSuccessHandler" 
      class="com.mycompany.webapp.security.Ch17AuthenticationSuccessHandler">
  <!-- 
  alwaysUseDefaultTargetUrl: false(기본)면 요청 경로로, true면 지정한 경로로 리다이렉트
  -->
  <property name="alwaysUseDefaultTargetUrl" value="false"/>
  <property name="defaultTargetUrl" value="/ch17/content"/>
</bean>

<!-- 로그인 실패 핸들러 -->
<bean id="ch17AuthenticationFailureHandler" 
      class="com.mycompany.webapp.security.Ch17AuthenticationFailureHandler">
  <!-- 
  useForward: false(기본)면 defaultFailureUrl로 리다이렉트, true면 defaultFailureUrl로 포워드
  -->
  <!-- 포워드할 경우 JSP로 경로 지정
  <property name="useForward" value="true"/>
  <property name="defaultFailureUrl" value="/WEB-INF/views/ch17/loginForm.jsp"/>
  -->
  <property name="useForward" value="false"/>
  <property name="defaultFailureUrl" value="/ch17/loginForm"/>
</bean>

<!-- 로그아웃 핸들러 -->
<bean id="ch17LogoutSuccessHandler" 
  class="com.mycompany.webapp.security.Ch17LogoutSuccessHandler">
  <!-- 
  defaultTargetUrl:생략하면 컨텍스트 루트 경로(/index.jsp)로, 지정하면 defaultTargetUrl로 리다이렉트
  -->
  <property name="defaultTargetUrl" value="/ch17/content"/>
</bean>
```

로그인 성공 핸들러
```java
public class Ch17AuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
  @Override
  public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
      Authentication authentication) throws IOException, ServletException {
    super.onAuthenticationSuccess(request, response, authentication);
  }
}
```

로그인 실패 핸들러
```java
public class Ch17AuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {
  @Override
  public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
      AuthenticationException exception) throws IOException, ServletException {
    if (super.isUseForward()) {
      // 포워드일 경우
    } else {
      // 리다이렉트일 경우
    }
    super.onAuthenticationFailure(request, response, exception);
  }
}
```

로그아웃 핸들러
```java
public class Ch17LogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {
  @Override
  public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
      throws IOException, ServletException {
    super.onLogoutSuccess(request, response, authentication);
  }
}
```

**[2] 핸들러를 사용하지 않고 로그인/로그아웃**  
```xml
<security:http>
  <!--
  always-use-default-target="false" -> default. 요청 경로로 리다이렉트
                           ="true" -> default-target-url로 리다이렉트
  -->
  <security:form-login login-page="/ch17/loginForm"
                       login-processing-url="/login"	 
                       username-parameter="mid"
                       password-parameter="mpassword"
                       default-target-url="/ch17/content"
                       authentication-failure-url="/ch17/loginForm"/>

  <security:logout logout-url="/logout" 
                   logout-success-url="/ch17/content"/> 
</security:http>
```
