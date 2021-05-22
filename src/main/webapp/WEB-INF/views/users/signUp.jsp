<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign-Up</title>

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
            width: 350px;
            height: 40px;
            padding: 5px;
            float: right;
        }
        #signIn{
            width: 400px;
        }
        .mt-4{
            margin: 10px auto !important;
        }        
        .wrong {
            color: rgb(235, 68, 68);
        }
        .right {
            color: rgb(81, 81, 206);
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
                        <a class="nav-link active" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Pricing</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>

                    <form class="log-In">
                        <a href="/users/login" class="btn btn-warning">LOG IN</a>
                        <a href="/users/sign-up" class="btn btn-info">SIGN UP</a>
                    </form>

            </div>
        </div>
    </nav>

    <br><br>

    <h1>회원가입</h1>
    <br><br>

    <form action="/users/sign-up" id="reg-form" method="POST">
        <fieldset class="insert">
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">ID</label>
                <input class="inputA" name="userId" id="inputId" type="text" placeholder="아이디">
            </div>
            <div>
                <p id="idcheck"></p>
            </div>
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">PW</label>
                <input class="inputA" name="userPw" id="pw1" type="password" placeholder="비밀번호">
            </div>
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">PW</label>
                <input class="inputA" type="password" id="pw2" placeholder="비밀번호 확인">
            </div>
            <div class="checkmsg">
                <p class="msg"></p>
            </div>
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">NAME</label>
                <input class="inputA" name="userName" type="text" placeholder="이름">
            </div>
            

            <br>
            <p>
            <button type="button" class="btn btn-primary btn-lg" id="signIn">가입하기</button>
            </p>
        </fieldset>
    </form>

    <script>

        const $inputId = document.getElementById('inputId');
        const $idcheck = document.getElementById('idcheck');
        
        function idCheck() {
            fetch('http://localhost:8181/users/'+$inputId.value)
            .then(res => res.json())
            .then(result => {
                console.log(result);
                if (result) {
                    if ($idcheck.classList.contains('right')) {
                    $idcheck.classList.replace('right', 'wrong');
                } else {
                    $idcheck.classList.add('wrong');
                }
                $idcheck.textContent = "이미 사용중인 ID입니다."
                } else {
                    if ($idcheck.classList.contains('wrong')) {
                    $idcheck.classList.replace('wrong', 'right');
                } else {
                    $idcheck.classList.add('right');
                }
                $idcheck.textContent = "사용 가능한 ID입니다.";
                }
            });
        }

        $inputId.onkeyup = e => {
            console.log('중복확인 클릭');
            idCheck();
        }


        // 비밀번호 체크 단계
        const $pw1 = document.getElementById('pw1');
        const $pw2 = document.getElementById('pw2');

        const $msg = document.querySelector('.msg');
        //비밀번호 확인 함수
        function passwordCheck() {
            if ($pw1.value === $pw2.value) {
                if ($msg.classList.contains('wrong')) {
                    $msg.classList.replace('wrong', 'right');
                } else {
                    $msg.classList.add('right');
                }
                $msg.textContent = "비밀번호가 확인되었습니다.";
            } else {
                if ($msg.classList.contains('right')) {
                    $msg.classList.replace('right', 'wrong');
                } else {
                    $msg.classList.add('wrong');
                }
                $msg.textContent = "비밀번호가 다릅니다."
            }
        }
        $pw2.addEventListener("keyup", passwordCheck);


        document.getElementById('signIn').onclick = e => {
            e.preventDefault();

            const $form = document.getElementById('reg-form');
            if ($msg.classList.contains('right')) {
                $form.submit();
            } else {
                alert('비밀번호를 확인해주세요.');
            }
        };

    </script>
    

</body>

</html>