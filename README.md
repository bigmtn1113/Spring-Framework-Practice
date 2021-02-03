# Spring-Framework-Practice

## Ch01. Dev Env
### 메이븐 저장소
#### 메이븐
- 자바용 프로젝트 관리도구  
- 프로젝트의 전체적인 라이프 사이클을 관리  
- 필요한 라이브러리를 pom.xml에 정의해두면 해당 라이브러리가 작동하는데 필요한 다른 라이브러리들까지 네트워크를 통해 자동으로 다운한다.

#### 중앙 저장소
- 오픈 소스 라이브러리 관리

#### 사내 원격 저장소
- 회사내에서만 개발자들이 공유하기 위해 사용

#### 로컬 저장소
- 다운되는 의존 라이브러리가 저장되는 위치: <USER_HOME>/.m2/repository

사내 원격 저장소 or 메이븐 중앙 저장소 -> 로컬 저장소 -> 프로젝트

<br/>

### 로깅 테스트

<br/>

### Spring IoC 컨테이너
#### 스프링에서 제공하는 IoC 컨테이너
- ContextLoaderListener: 공유 빈을 관리하는 WebApplicationContext
- DispatcherServlet: 개별 빈을 관리하는 WebApplicationContext

**WebApplication**  
Spring Web MVC에서 사용하는 IoC 컨테이너  
상속 관계: BeanFactory - ApplicationContext - WebApplicationContext

<br/>

### 문자 인코딩 필터
client -(POST 방식)-> CharacterEncodingFilter -> DispatcherServlet -> Controller

<br/>

### Annotation
#### IoC 관련 Annotation
- Root WebApplicationContext에선 @Service, @Repository 지정
- DispatcherServlet WebApplicationContext에선 @Service, @Repository를 제외한 나머지(@Controller, @Component 등) 지정

#### MVC 관련 Annotation
- @RequestParam, @GetMapping, @PostMapping, @ModelAttribute 등

<br/>

### View 이름을 JSP 경로로 매핑
#### InternalResourceViewResolver 객체 생성

<br/>

## Ch02. Controller - RequestMapping
### RequestMapping
#### 요청 방식 매핑
**GET/POST**  
- @RequestMapping("/경로")

**GET**  
- @RequestMapping(value="/경로", method="RequestMapping.GET)
- @GetMapping("/경로")

**POST**  
- @RequestMapping(value="/경로", method="RequestMapping.POST)
- @PostMapping("/경로")

<br/>

## Ch03. Controller - Request Parameter
### 요청 파라미터 얻기
※ 요청 파라미터명을 param1로 가정

#### 요청 파라미터명과 동일한 매개변수 선언
```java
public String method(String param1) { ... }
```

#### 요청 파라미터명과 매개변수명이 다를 경우
```java
@RequestParam("param1") String arg1
```

#### 필수 요청 파라미터
```java
@RequestParam(required=true) String param1
```

#### 파라미터 디폴트 값 설정
```java
@RequestParam(defaultValue="문자열") String param1
```

#### 객체 파라미터
```java
public String method(Ch03Dto dto) { ... }
```

<br/>

## Ch04. Controller - Validation
### Validation
#### 준비 사항
- .properties 파일 생성
- 메시지를 관리하는 ResourceBundleMessageSource 빈 등록
- @Valid(폼 유효성 검사 요구)를 사용하기 위한 의존성 설정

#### Validator 클래스 작성
```java
public class JoinFormValidator implements Validator {
  @Override
  public boolean supports(Class<?> clazz) { ... }   // 유효성 검사 가능 여부 확인(객체 타입 검증)
  
  @Override
  public void validate(Object target, Errors errors) { ... }    // 유효성 검사 실시
  // target: 검증할 객체
  // errors: 검증 객체가 올바르지 않을 경우 에러 정보를 저장
  // errors.rejectValue(): 필드 혹은 객체에 대한 에러코드를 추가. 에러코드에 대한 메시지가 존재하지 않을 경우 defaultMessage를 지정 가능
}
```

#### Validator 설정
```java
@InitBinder("joinForm")   // joinForm 객체에만 바인딩이나 Validation 설정 적용
public void joinForm(WebDataBinder binder) {    // binder가 객체를 바인딩
  binder.setValidator(new JoinFormValidator());   // 특정 Validator를 사용하겠다고 지정
}

public String join(@ModelAttribute("joinForm") @Valid Member member, BindingResult bindingResult) { ... }
// BindingResult
// 유효성 검증 결과를 저장할 때 사용하는 Errors 인터페이스의 하위 인터페이스이다.
// 인터페이스 Validator를 상속받는 클래스에서 객체값을 검증한다. ex) JoinFormValidator
```

- **@InitBinder**  
  validate() 메소드를 직접 호출하지 않고 스프링프레임워크에서 호출하는 방법이다.  
  @InitBinder로 지정한 메소드가 먼저 data 검증을 거치므로 validate()를 호출할 필요가 없다.

- **@ModelAttribute**  
  @ModelAttribute로 지정되는 클래스는 빈 클래스여야 하며, getter와 setter가 만들어져야 한다.

  1. 파라미터로 선언한 객체 타입의 오브젝트를 자동으로 생성한다.
  2. HTTP로 넘어온 값들을 생성된 객체에 자동으로 바인딩한다.
  3. 생성된 객체가 자동으로 Model 객체에 주가되고 뷰로 전달된다.

  ※ @RequestParam은 매개변수와 1대 1 매핑할 때 사용하고 @ModelAttribute는 객체로 매핑할 때 사용한다.

- **@Valid**  
  어노테이션으로 지정한 객체가 유효한 객체인지 검사하도록 지정한다.

#### 에러 메시지 출력
```jsp
<form:errors cssClass="error" path="joinForm.mid"/>
```

Errors, BindingResult 객체를 이용하여 에러 정보를 추가한 경우 에러정보를 출력할 수 있다.  
path 속성을 이용하여 객체의 특정 프로퍼티와 관련된 에러 메시지를 출력할 수 있다.

<br/>

## Ch05. Controller - Header/Cookie
### 요청 HTTP 헤더값 얻기
```java
public String method1(@RequestHeader("user-Agent") String userAgent) { ... }
```

<br/>

### 쿠키 얻기
※ mid와 memail의 이름을 가진 쿠키가 저장되어 있다고 가정

```java
public String method3(@CookieValue String mid, @CookieValue("memail") String email) { ... }
```

저장된 쿠키 이름과 매개변수명이 같을 경우엔 @CookieValue  
저장된 쿠키 이름과 매개변수명이 다를 경우엔 @CookieValue("저장된 쿠키 이름")

<br/>

## Ch06. Controller - Forward/Redirect
### Forward
포워드된 JSP는 동일한 HttpServletRequest, HttpServletResponse 객체를 사용  
request 범위로 데이터 저장 가능

<br/>

### Redirect
경로를 재지정하면 기존 데이터를 사용할 수 없으므로 Session 객체를 이용하거나  
경로 뒤에 ?name=value 식으로 기존 데이터를 전송

<br/>

## Ch07. Controller - Data Delivery
### View(JSP)로 객체 전달
#### ModelAndView
```java
public ModelAndView method() {
  // object 객체 생성 코드 생략
  ModelAndView mav = new ModelAndView();
  
  mav.addObject("objectName", object);
  mav.setViewName("뷰 경로");
  return mav;
}
```

#### Model
```java
public String method(Model model) {
  // object 객체 생성 코드 생략
  model.addAttribute("objectName", object);
  return "경로";
}
```

#### @ModelAttribute
```java
@ModelAttribute("objectName")
public Object getObject() {
  // object 객체 생성 코드 생략
  return object;
}

public String method() {
  return "경로";
}
```
다른 메소드보다 먼저 실행된 후, request에 객체를 저장하므로 공통 객체로서 사용이 가능하다.  
getObject()가 다른 메소드보다 먼저 실행되고, 리턴한 객체는 objectName으로 request에 저장된다.

#### Command Object
```java
public String method(Board b) {
  return "경로";
}
```
Command Object(폼의 데이터를 저장하는 객체)는 클래스 이름의 첫 자를 소문자로 한 이름으로 저장된다.  
즉, b가 아니라 board라는 이름으로 저장된다.
