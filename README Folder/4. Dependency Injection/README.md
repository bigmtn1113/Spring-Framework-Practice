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

<br/>

### DI
의존적인 객체를 직접 생성하지 않고 객체 실행에 필요한 다른 객체를 외부에서 주입하는 것을 말한다.  
결합도를 낮추고 유연하게 동작하기 위해 사용한다.

#### XML을 이용한 주입
- 생성자 주입
  ```xml
  <bean name="name" class="package...ClassName">
    <constructor-arg ref="beanName">
    <constructor-arg value="value">
  </bean>
  ```
  
- 프로퍼티(Setter) 주입
  ```xml
  <bean name="name" class="package...ClassName">
    <property name="propertyName" ref="beanName">
    <property name="propertyName" value="value">
  </bean>

  <!-- p NameSpace 사용 -->
  <bean name="name" class="package...ClassName">
    <p:propertyName-ref="beanName">
    <p:propertyName="value">
  </bean>
  ```
  
- Collections 주입
  ```xml
  <!-- List -->
  <bean name="name" class="package...ClassName">
    <property name="propertyName">
      <list>
        <value>문자열</value>    <!-- 값 대입 -->
        <ref bean="beanName"/>    <!-- 객체 대입 -->
      </list>
    </property>
  </bean>

  <!-- Set -->
  <bean name="name" class="package...ClassName">
    <property name="propertyName">
      <set>
        <value>문자열</value>
        <ref bean="beanName"/>
      </set>
    </property>
  </bean>

  <!-- Map -->
  <bean name="name" class="package...ClassName">
    <property name="propertyName">
      <map>
        <entry key="key1" value="value1"/>
        <entry key="key2" value-ref="beanName"/>
      </map>
    </property>
  </bean>

  <!-- Properties -->
  <bean name="name" class="package...ClassName">
    <property name="propertyName">
      <props>
        <prop key="key1">value1</prop>
        <prop key="key2">value2</prop>
      </props>
    </property>
  </bean>
  ```
  Properties는 Java에서 지원하며, Map처럼 key와 value로 이루어져 있다.  
  .properties 파일을 읽어서 key와 value 값을 사용한다.

#### Annotation을 이용한 주입
| | @Autowired | @Resource | @Inject |
| :---: | :---: | :---: | :---: |
| 지원 | Spring | Java | Java |
| 사용 위치 | 필드, 생성자, Setter | 필드, Setter | 필드, 생성자, Setter |
| Bean 검색 순서 | 타입 -> 이름 | 이름 -> 타입 | 타입 -> 이름 |
| Bean이 없을 시 | required=false 옵션으로 예외 발생 방지 가능 | 예외 발생 | 예외 발생
| 주입 Bean 지정 | @Autowired @Qualifier("name") | @Resource(name="name") | @Inject @Named("name") |

- **@Autowired**  
  주입하고자 하는 객체의 타입과 일치하는 객체를 자동으로 주입한다.  
  타입으로 찾다가 없으면 이름으로 찾는다.  
  Spring에서 지원하며, Spring에 의존적이어서 다른 프레임워크으로 전환 시 사용할 수 없다.
  
  ```java
  public class XXXService {
    @Autowired private TestDao1 td1;   // 필드 주입
    private TestDao2 td2;
    private TestDao3 td3;

    @Autowired
    public XXXService(TestDao2 td2) {   // 생성자 주입
      this.td2 = td2;
    }
    
    @Autowired
    public void setTestDao3(TestDao3 td3) {   // Setter 주입
      this.td3 = td3;
    }
  }
  ```
  td1, 2, 3의 이름을 가진 객체를 대입하는 것이 아니라 TestDao1, 2, 3의 타입을 가진 객체를 대입한다.

- **@Resource**  
  주입하고자 하는 객체의 이름과 일치하는 객체를 자동으로 주입한다.  
  이름으로 객체를 찾다가 없으면 타입으로 찾는다.
  
  ```java
  public class XXXService {
    @Resource private TestDao1 td1;   // 필드 주입
    private TestDao2 td2;
    
    @Resource
    public void setTestDao2(TestDao2 td2) {   // Setter 주입
      this.td2 = td2;
    }
  }
  ```
  @Autowired와 @Inject와 다르게 생성자로 주입할 수 없다.

- **@Inject**  
  주입하고자 하는 객체의 타입과 일치하는 객체를 자동으로 주입한다.  
  타입으로 찾다가 없으면 이름으로 찾는다.  
  의존 라이브러리 설정을 추가로 해야 사용 가능하다.
  
  ```java
  public class XXXService {
    @Inject private TestDao1 td1;   // 필드 주입
    private TestDao2 td2;
    private TestDao3 td3;

    @Inject
    public XXXService(TestDao2 td2) {   // 생성자 주입
      this.td2 = td2;
    }
    
    @Inject
    public void setTestDao3(TestDao3 td3) {   // Setter 주입
      this.td3 = td3;
    }
  }
  ```
  td1, 2, 3의 이름을 가진 객체를 대입하는 것이 아니라 TestDao1, 2, 3의 타입을 가진 객체를 대입한다.

#### 외부 프로퍼티 파일(.properties)의 값 주입
- **properties 파일 작성**  
  ```
  test.prop1=1
  test.prop2=test
  test.prop3=false
  ```

- **프로퍼티 파일 설정**  
  ```xml
  <context:property-placeholder location="properties 폴더 경로/*.properties"/>
  ```

- **XML을 이용한 주입**  
  ```xml
  <bean name="name" class="package...ClassName">
    <constructor-arg index="0" value="${test.prop2}"/>
    <property name="prop3" value="${test.prop3}"/>
  </bean>
  ```

- **Annotation을 이용한 주입**  
  ```java
  public class XXXService {
    @Value("${test.prop1}") private int prop1;
    private String prop2;
    private boolean prop3;

    public XXXService(@Value("${test.prop2}") String prop2) {
      this.prop2 = prop2;
    }
    
    @Value("${test.prop3}")
    public void setProp3(boolean prop3) {
      this.prop3 = prop3;
    }
  }
  ```
