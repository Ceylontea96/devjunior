<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<style>

</style>
</head>
<body>
    <h1>게시글 등록</h1>
    <form action="/bulletin/insert" method="post">
        <p>
            # 작성자: <input type="text" name="writer"><br>
            # 제목 : <input type="text" name="title"><br>
            # 내용 :
            <br>
            <textarea rows="5" cols="30" name="content"></textarea>
            <br>
        </p>
        <button type="submit">등록</button>
    </form>
    <br>
    <a href="/bulletin/list">글 목록보기</a>
</body>
</html>