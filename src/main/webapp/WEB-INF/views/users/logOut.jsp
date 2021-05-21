<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log-Out</title>

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
        .ptag{
            display: inline-block;
        }
        #logIn{
            width: 400px;
        }
        #log-Out{
            width: 400px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <div class="gradle"><img class="gradle-img" src="../gradle.png"></div>
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
                        <button type="button" class="btn btn-warning">LOG IN</button>
                        <button type="button" class="btn btn-info">SIGN UP</button>
                    </form>

            </div>
        </div>
    </nav>
    <br><br>

    <h1>로그아웃</h1>
    <div class="card border-light mb-3" id="log-Out">
        <div class="card-header">###ID님###</div>
        <div class="card-body">
            <h5 class="card-title">로그아웃이 완료되었습니다.</h5>
        </div>
    </div>



</body>
</html>