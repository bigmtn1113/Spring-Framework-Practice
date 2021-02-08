## Ch13. DI(Dependency Injection)
### IoC 관리 빈 생성
#### XML 설정 방식
```xml
<bean [id|name]="name" class="package..ClassName"/>
<bean [id|name]="name" class="package..ClassName" factory-method="getInstance"/>   <!-- static 메소드 이용 -->
<bean [id|name]="name" class="package..ClassName" factory-bean="관리 빈" factory-method="getInstance"/>   <!-- 관리 빈의 메소드 이용 -->
```
- 웹 애플리케이션 구동 시 자동으로 객체가 생성되고 관리된다.
- id 또는 name이 주어지지 않으면 클래스 이름의 첫자를 소문자로 한 이름을 사용한다.
- 기본 생성자가 필요하다.

※ 객체화 지연  
기본적으로 IoC 컨테이너 생성 시점(애플리케이션 시작)에 빈 객체가 생성이 된다.  
그런데 빈이 필요한 시점으로 객체화를 지연시킬 수 있다.  
하지만 빈이 필요한 순간에 만들어지므로 속도가 느려질 수 있어서 잘 사용하지 않는다.  
사용빈도가 굉장히 적은 빈일 경우 사용할 수도 있겠다.
```xml
<bean [id|name]="name" class="package..ClassName" lazy-init="true"/>    <!-- 지정한 빈을 객체화 지연 -->
<beans default-lazy-init="true"/>   <!-- 모든 설정된 빈을 객체화 지연 -->
```

#### Annotation 설정 방식
```java
[@Controller("name") | @Service("name") | @Repository("name") | @Component("name")]
public class ClassName {...}
```
- 웹 애플리케이션 구동 시 자동으로 객체가 생성되고 관리된다.
- id 또는 name이 주어지지 않으면 클래스 이름의 첫자를 소문자로 한 이름을 사용한다.
- 기본 생성자가 필요하다.
