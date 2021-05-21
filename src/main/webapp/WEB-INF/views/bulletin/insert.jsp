<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 작성</title>

<!-- main css -->
<link rel="stylesheet" href="/css/main.css">

<!-- bootstrap css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css"
    integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

<style>
    h1 {
        text-align: center;
        padding: 50px;
    }
    .gradle-img {
        width: 50px;
        height: 50px;
    }
    .gradle {
        width: 100%;
        height: 100%;
    }
    .insert {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
    }
    .inputA{
        border: 1px solid lightgray;
        border-radius: 5px;
        width: 400px;
        height: 40px;
        padding: 5px;
    }
    #register, #list{
        width: 200px;
    }

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