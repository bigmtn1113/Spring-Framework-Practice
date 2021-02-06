## Ch11. View - Spring Tag Library
### Spring form 태그 라이브러리
#### 태그 라이브러리 추가
```jsp
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
```

#### 사용 방식
```jsp
<form:form modelAttribute="" method="" action="">
```
- **method**: POST가 기본
- **action**: 요청경로. 생략할 시 현재 요청 URL
- **modelAttribute**: Command 객체의 이름

#### input, password, hidden
```jsp
<form:form modelAttribute="member">
  아이디: <form:input type="text" path="mid"/><br/>    <!-- type="text" 생략가능 -->
  이름: <form:hidden path="mname"/><br/>
  비밀번호: <form:password path="mpassword"/><br/>
</form:form>
```
**path**: 입력한 값으로 바인딩 될 Command 객체의 필드

객체의 필드에 값이 있으면 태그의 value처럼 값이 표시된다.
