<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log-In</title>

    <!-- main css -->
    <link rel="stylesheet" href="/css/main.css">

    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css"
        integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <style>
        h1 {
            text-align: center;
            padding: 150px;
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
            width: 400px;
            height: 40px;
        }

        #logIn {
            width: 400px;
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
            <a class="navbar-brand" href="/bulletin/list">
                <div class="gradle"><img class="gradle-img" src="/images/gradle.png"></div>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01"
                aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor01">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="/bulletin/list">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"
                            href="https://itstar.edueroom.co.kr/lecture.php?action=view&no=177&code=0b0104" target="_blank">Education</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="https://github.com/" target="_blank">Git Site</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/users/myInfo">My Info</a>
                    </li>

                    <form class="log-In" id="loginBtn">
                        <a href="/users/login" id="loginBtn" class="btn btn-warning">LOG IN</a>
                        <a href="/users/sign-up" id="singupBtn" class="btn btn-info">SIGN UP</a>
                    </form>
                    <form class="log-In" id="logoutBtn">
                        <a href="/users/logout" id="logoutBtn" class="btn btn-secondary">LOG OUT</a>
                    </form>
            </div>
        </div>
    </nav>

    <br><br>

    <h1>로그인</h1>
    <form action="/users/login" method="POST">
        <fieldset class="insert">
            <div class="form-group">
                <input class="inputA" type="text" name="userId" placeholder="아이디를 입력해주세요."><br>
                <input class="inputA" type="password" name="userPw" placeholder="비밀번호를 입력해주세요.">
            </div>
            <br>
            <p>
                <button type="submit" class="btn btn-primary btn-lg" id="logIn">로그인</button>
            </p>
        </fieldset>
    </form>

    <script>
        //접속중인 유저 확인
        fetch('http://localhost:8181/users/now-user')
            .then(res => res.json())
            .then(nowUser => {
                console.log(nowUser.userName);
                hideLogin(nowUser.userName);
                hideLogout(nowUser.userName);

            });

        const $loginBtn = document.getElementById('loginBtn');
        // const $signupBtn = document.getElementById('signupBtn');
        const $logoutBtn = document.getElementById('logoutBtn');

        function hideLogout(uName) {
            if (uName == "anonymous") {
                $logoutBtn.classList.add('hide');
            } else {
                $logoutBtn.classList.remove('hide');
            }
        }

        function hideLogin(uName) {
            if (uName == "anonymous") {
                $loginBtn.classList.remove('hide');
                // $signupBtn.classList.remove('hide');
            } else {
                $loginBtn.classList.add('hide');
                // $signupBtn.classList.add('hide');
            }
        }
    </script>

</body>

</html>