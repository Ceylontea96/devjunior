<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>user-info-modify</title>
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

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <div class="gradle"><img class="gradle-img" src="/images/gradle.png"></div>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01"
                aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor01">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a href="/bulletin/list" class="nav-link active" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Pricing</a>
                    </li>
                    <li class="nav-item" id="information">
                        <a class="nav-link" href="#">About</a>
                    </li>


            </div>
            <form class="log-In" id="loginform">
                <a href="/users/login" class="btn btn-warning">LOG IN</a>
                <a href="/users/sign-up" class="btn btn-info">SIGN UP</a>
            </form>
            <form class="log-In" id="logoutform">
                <a href="/users/logout" class="btn btn-warning hide">LOG OUT</a>
            </form>
        </div>
    </nav>

    <br><br>

    <h1>${user.userId}님의 회원정보 수정</h1>
    <br><br>

    <form action="/users/modify" method="post">
        <input type="hidden" name="userId" value="${user.userId}">
        <input type="hidden" name="userPw" value="${user.userPw}">
        
        <fieldset class="insert">
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">이름</label><br>
                <input class="inputA" type="text" name="userName" value="${user.userName}">
            </div>
            
            <br>
            <p>
            <button class="btn btn-primary btn-lg" id="register">완료</button>
            <a href="/users/info?userId=${user.userId}" class="btn btn-primary btn-lg" id="list">취소</a>
            </p>
        </fieldset>
    </form>

</body>
</html>