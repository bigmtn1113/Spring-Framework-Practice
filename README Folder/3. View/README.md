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
  ...
</form:form>
```
- **path**: 입력한 값으로 바인딩 될 Command 객체의 필드

Command 객체의 필드에 값이 있으면 태그의 value처럼 값이 표시된다.

#### select, options
```jsp
<form:form modelAttribute="member">
  회원종류: <form:select path="mtype" items="${typeList}"/><br/>
  직업: <form:select path="mjob">
    <option>---선택하세요---</option>
    <form:options items="${jobList}"/>
  </form:select><br/>
  회원도시: <form:select path="mcity" items="${cityList}" itemLabel="label" itemValue="value"/><br/>
  ...
</form:form>
```
- **items**: scope에 저장된 객체(영역 객체)
- **itemLabel**: 화면에 표시할 내용
- **itemValue**: path값으로 대입할 내용

Command 객체의 필드에 값이 있으면 그 값과 일치하는 item 값이 option의 selected처럼 표시된다.

#### checkboxes
```jsp
<form:form modelAttribute="member">
  개발언어: <form:checkboxes path="mlanguage" items="${languageList}"/><br/>
  개발스킬: <form:checkboxes path="mskill" items="${skillList}" itemLabel="label" itemValue="value"/><br/>
...
</form:form>
```

#### radiobuttons
```jsp
<form:form modelAttribute="member">
  회원종류: <form:radiobuttons path="mtype" items="${typeList}"/><br/>
  회원도시: <form:radiobuttons path="mcity" items="${cityList}" itemLabel="label" itemValue="value"/><br/>
...
</form:form>
```

options, checkboxes, radiobuttons에서 특정 값을 active 상태로 만들고 싶다면 active 처리할 값을 지정하고  
form 태그를 사용하면 된다. 그러면 복잡하게 반복문을 돌릴 필요없이 알아서 지정한 값을 active 처리해준다.
