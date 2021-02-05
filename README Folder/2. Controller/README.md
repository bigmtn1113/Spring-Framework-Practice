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
public String method(@RequestHeader("user-Agent") String userAgent) { ... }
```

<br/>

### 쿠키 얻기
※ mid와 memail의 이름을 가진 쿠키가 저장되어 있다고 가정

```java
public String method(@CookieValue String mid, @CookieValue("memail") String email) { ... }
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

<br/>

## Ch08. Controller - Session Support
### 세션 지원
#### HttpSession
웹 애플리케이션에서 지속적으로 유지되어야 할 사용자 데이터를 저장할 때 사용한다. ex) 로그인 정보

- **데이터 저장**
  ```java
  public String method(String mid, HttpSession session) {   // 데이터 저장
    session.setAttribute("sessionMid", mid);
    ...
  }
  ```

- **데이터 읽기**
  ```java
  public String method(@SessionAttribute("sessionMid") String mid, HttpSession session) {   // 데이터 읽기
    // String mid = (String) session.getAttribute("sessionMid");
    // @SessionAttribute("sessionMid")를 통해 sessionMid라는 객체의 값을 찾아와 mid에 대입 했으므로 그냥 mid를 사용하면 된다.
    ...
  }
  ```

- **데이터 제거**
  ```java
  public String method(HttpSession session) {    // 데이터 제거
    // session.removeAttribute("sessionMid");
    session.invalidate();
    ...
  }
  ```

#### @SessionAttributes
화면과 화면 사이에 임시적으로 데이터를 유지할 때 사용한다. ex) 단계별 입력 폼 작성(이전 단계 입력 내용 유지)  
Controller위에 세션으로 공유할 객체 이름을 명시한다. 그러면 해당 Controller에서만 공유 객체로 사용된다.

- **공유 객체 이름 설정**
  ```java
  @SessionAttributes({"objectName"})
  public class Ch08Controller { ... }
  ```

- **객체 저장**
  ```java
  @ModelAttribute("objectName")
  public Object createObject() {
    return new Object();
  }
  // 세션에 objectName이 없으면 메소드 실행 후 리턴 객체를 objectName으로 생성한다.
  // 없으면 메소드를 실행하지 않고 기존 객체 사용한다.
  
  // @SessionAttributes에 objectName이 선언되었으므로 objectName은 세션 객체로 사용된다.
  // objectName이 선언되어 있지 않을 경우엔 reqeust 범위로 사용된다.
  ```

- **객체 가져오기**
  ```java
  public String method(@ModelAttribute("objectName") Object object) { ... }
  // object로 넘어온 값이 없다 = objectName -(값 대입)-> object
  // object로 넘어온 값이 있다 = object -(값 대입)-> objectName
  // 단, objectName 객체가 세션에 존재하지 않으면 예외가 발생한다.
  ```

- **객체 제거**
  ```java
  public String method(SessionStatus sessionStatus) {
    sessionStatus.setComplete();
    ...
  }
  // @SessionAttributes로 선언한 공유 객체들이 제거된다.
  // @SessionAttributes로 지정하지 않은 세션들은 제거되지 않는다.
  ```

<br/>

## Ch09. Controller - File Upload/Download
### File Upload
#### 흐름
multipart/form-data -> MultipartResolver(파싱) -> 문자 파트, 파일 파트(MultipartFile) -> 요청 매핑 메소드

#### MultipartResolver 설정
- pom.xml에 의존 라이브러리 추가
- MultipartResolver 빈 생성하는 xml 작성(root에 배치)

#### 메소드 작성
```java
public String method(MultipartFile attach) {
  String fileName = new Date().getTime() + "_" + attach.getOriginalFilename();  // 중복 방지를 위해 파일 이름 앞에시간 붙이기
  attach.transferTo(new File("파일 경로" + fileName));
  ...
}
```

<br/>

### File Download
```java
public void method(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
  // 파일의 데이터를 읽기 위한 입력 스트림 얻기
  String saveFilePath = "파일 경로" + fileName;
  InputStream is = new FileInputStream(saveFilePath);

  // 응답 HTTP 헤더 구성
  // 1) Content-Type 헤더 구성
  ServletContext application = request.getServletContext();
  String fileType = application.getMimeType(fileName);
  response.setContentType(fileType);

  // 2) Content-Disposition 헤더 구성
  String originalFileName = fileName.split("_")[1];
  originalFileName = new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1");	// 한글 아스키코드화
  response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName + "\"");

  // 3) Content-Length 헤더 구성(다운로드할 파일의 크기를 지정)
  int fileSize = (int) new File(saveFilePath).length();
  response.setContentLength(fileSize);

  // 응답 HTTP의 바디(본문) 구성
  OutputStream os = response.getOutputStream();
  FileCopyUtils.copy(is, os);
  os.flush();
  os.close();
  is.close();
}
```
리턴값이 void라 JSP로 가지 않고 바로 요청에 대한 응답내용으로 전송한다.

<br/>

### File list 출력
```java
public String method(Model model) {
  File uploadDir = new File("파일 경로");
  String[] fileNames = uploadDir.list();
  model.addAttribute("fileNames", fileNames);
  ...
}
```
fileNames의 원소들을 꺼내면서 View에 표시하면 된다.

<br/>

## Ch10. Controller - Execution Handling
### Exception Handling
try-catch를 서블릿마다 작성하면 중복 코드가 많아지므로 유지보수가 힘들어진다.  
exception을 비지니스 로직에 넣지 않고 분리함으로써 비지니스 로직에 좀 더 집중할 수 있게 한다.  

#### DAO, Service에서 발생된 예외는 최종 Controller에서  처리
DAO -> Service -> Controller

#### web.xml로 에러 처리
```xml
<error-page>
  <error-code>404</error-code>
  <location>예외 처리 결과 페이지 경로</location>
</error-page>
```

#### Controller 예외 처리 클래스 작성
- @Component와 @ControllerAdvice 적용
- 예외별로 처리하는 메소드에 @ExceptionHandler 적용

```java
@Component
@ControllerAdvice
public class Ch10ExceptionHandler {
  @ExceptionHandler
	public String handleException(NullPointerException e) { ... }
  
  @ExceptionHandler
	public String handleException(RuntimeException e) { ... }
}
```
Controller에서 예외 발생 -> 예외 처리 클래스에서 해당 예외를 처리하는 메소드 실행

**@Component**  
빈 등록할 때 사용한다.  
xml에서 component-scan으로 @Component를 검색하도록 설정한 뒤 사용한다.

**@ControllerAdvice**  
모든 @Controller 즉, 전역에서 발생할 수 있는 예외를 잡아 처리해주는 annotation이다.

**@ExceptionHandler**  
@Controller가 적용된 Bean내에서 발생하는 예외를 잡아서 하나의 메서드에서 처리해주는 기능을 한다.
