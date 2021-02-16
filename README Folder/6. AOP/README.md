## Ch15. AOP
### AOP(Aspect Oriented Programming)
#### 관점 지향 프로그래밍
핵심 기능 코드에 부가 기능 코드(성능 측정, 로깅, 트랜잭션, 보안 등)가 필요할 경우, 모든 핵심 기능 코드에 부가 기능 코드를 작성해야 한다.  
이러면 코드 중복이 심해지고 핵심 기능 코드의 이해도도 떨어지며 유지보수도 힘들어진다.  
이런 문제로 인해 부가 기능 코드를 핵심 기능 코드로부터 따로 분리해서 관리할 필요성이 생겼다.

AOP는 공통 관심사(Cross-cutting Concerns)를 핵심 관심사(Core Concerns)로부터 분리해 설계 및 개발하는 방법이다.  
분리한 부가 기능은 호출하지 않아도 핵심 기능 코드를 컴파일하거나, 컴파일 된 클래스를 로딩하거나, 로딩한 클래스의 객체를 생성할 때  
AOP가 적용되어 핵심 기능 코드 안에 삽입된다.

#### AOP 용어
- **Aspect**: 공통 기능을 모듈화 한 것. Advice + PointCut.
- **Advice**: 언제 공통 기능을 핵심 기능에 적용할 지를 정의한 것.
- **JoinPoint**: Advice를 적용 가능한 지점. 핵심 기능의 호출 지점. Spring Aop에선 메서드 호출 JoinPoint만을 지원(AspectJ는 다양한 JoinPoint를 지원)
- **PointCut**: Advice가 적용되는 JoinPoint를 지정. ex) 어떠한 패키지에서 어떠한 클래스의 어떤 메소드에 적용할 것인가
- **Weaving**: Advice를 핵심 기능에 적용하는 것. 짜다, 엮다의 뜻을 가진 단어이며 부가 기능과 핵심 기능을 엮는 과정을 지칭
- **Target**: Advice가 적용되는 대상. ex) 핵심 기능을 구현한 클래스

**※ 프록시**  
Spring은 프록시를 이용하여 AOP를 구현한다.  
Spring은 Aspect의 적용 대상이 되는 객체에 대한 프록시를 만들어 제공하며,  
대상 객체를 사용하는 코드는 대상 객체에 직접 접근하지 않고 프록시를 통해서 간접적으로 접근하게 된다.  
대상 객체는 빈 객체가 되어야 하며, 대상 빈 객체에 대한 프록시 객체를 생성한 뒤에는 원본 빈 객체 대신에 프록시 객체가 사용된다.

#### Spring AOP 설정
- dispatcher
  ```xml
  <aop:aspectj-autoproxy/>    <!-- Bean으로 등록된 클래스 중에서 @Aspect가 선언된 클래스를 모두 Aspect로 자동 등록해준다. -->
  ```

- pom.xml
  ```xml
  <dependency>
    <groupId>org.aspectj</groupId>
      <artifactId>aspectjweaver</artifactId>
    <version>1.9.4</version>
  </dependency>
  ```

#### Advice 종류
- **Before**: 핵심 기능을 호출하기 전에 공통 기능을 실행
- **After**: 핵심 기능을 실행하는 도중에 예외가 발생 유무에 상관없이 핵심 기능 실행 후 공통 기능을 실행
- **Around**: 핵심 기능 실행 전, 후 또는 예외 발생 시점에 공통 기능을 실행.
- **AfterReturning**: 핵심 기능이 예외 없이 실행된 후에 공통 기능을 실행
- **AfterThrowing**: 핵심 기능을 실행하는 도중 예외가 발생할 경우 공통 기능을 실행

<br/>

### Example
**@Before**  
```java
@Component
@Aspect
@Order(1)
public class Aspect1Before {
  // @Before("execution(accessModifier returnType packageName...className.methodName(parameter))")
  @Before("execution(public * com.mycompany.webapp.controller.Ch15Controller.before(..))")
  public void method() {
    // 전처리 내용
  }
}

@Component
@Aspect
@Order(2)
public class Aspect2Before {
  @Before("execution(public * com.mycompany.webapp.controller.Ch15Controller.before(..))")
  public void method() {
    // 전처리 내용
  }
}
```

**@After**  
```java
@Component
@Aspect
public class Aspect3After {
  @After("execution(public * com.mycompany.webapp.controller.Ch15Controller.after(..))")
  public void method() {
    // 후처리 내용
  }
}
```

**@Around**  
```java
@Component
@Aspect
public class Aspect4Around {
  @Around("execution(public * com.mycompany.webapp.controller.Ch15Controller.around(..))")
  public Object method(ProceedingJoinPoint joinPoint) throws Throwable {
    // 전처리 내용
    
    // 핵심 기능 실행
    Object result = joinPoint.proceed();
    
    // 후처리 내용
    
    return result;
  }
}
```

**@AfterReturning**  
```java
@Component
@Aspect
public class Aspect5AfterReturning {
  @AfterReturning("execution(public * com.mycompany.webapp.controller.Ch15Controller.afterReturning(..))", returning = "ret")
  public void method(String ret) {
    // 후처리 내용
  }
}
```

**@AfterThrowing**  
```java
@Component
@Aspect
public class Aspect6AfterThrowing {
  @AfterThrowing("execution(public * com.mycompany.webapp.controller.Ch15Controller.afterThrowing(..))", throwing = "ex")
  public void method(Throwable ex) {
    // 후처리 내용
  }
}
```
