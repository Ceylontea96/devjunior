<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
</head>
<body>

    <p>아이디 : ${user.userId}</p>
    <p>이름 : ${user.userName}</p>

    <a href="/users/modify?userId=${user.userId}">회원 정보 변경</a>
    <a href="/users/withdraw?userId=${user.userId}">회원 탈퇴</a>

</body>
</html>