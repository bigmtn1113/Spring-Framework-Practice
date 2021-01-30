# Spring-Framework-Practice

## ch01. Dev Env
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

## ch02. Controller - RequestMapping
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
