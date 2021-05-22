<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>user-info</title>

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

        .inputA {
            border: 1px solid lightgray;
            border-radius: 5px;
            width: 350px;
            height: 40px;
            padding: 5px;
            float: right;
        }

        #signIn {
            width: 400px;
        }

        .mt-4 {
            margin: 10px auto !important;
        }

        .wrong {
            color: rgb(235, 68, 68);
        }

        .right {
            color: rgb(81, 81, 206);
        }

        .log-In {
            float: right;
        }

        .hide {
            display: none;
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

    <h1>${user.userId}님의 회원정보</h1>

    <form>
        <fieldset class="insert">
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">아이디</label><br>
                <p>${user.userId}</p>
            </div>
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">이름</label><br>
                <p>${user.userName}</p>
            
            <br>
            <p>
                <a href="/bulletin/list" class="btn btn-primary btn-lg" id="list">목록보기</a>
                <a href="/users/modify?userId=${user.userId}" class="btn btn-primary btn-lg" id="register">회원 정보 변경</a>
                <a href="/users/withdraw?userId=${user.userId}" class="btn btn-primary btn-lg" id="delete">회원 탈퇴</a>
            </p>
        </fieldset>
    </form>

    <script>
        fetch('http://localhost:8181/users/now-user')
            .then(res => res.json())
            .then(nowUser => {
                console.log(nowUser);
                // 현재 로그인된 사용자 정보가 없으면
                if (nowUser === null) {
                    document.getElementById('information').classList.add('hide');
                } else {
                    document.getElementById('loginform').classList.add('hide');
                    document.getElementById('logoutform').classList.remove('hide');
                }
            });
    </script>
</body>

</html>