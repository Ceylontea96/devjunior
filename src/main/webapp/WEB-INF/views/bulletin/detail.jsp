<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 보기</title>

    <!-- main css -->
    <link rel="stylesheet" href="/css/main.css">

    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css"
        integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

    <style>
        h1 {
            text-align: center;
            padding: 50px;
            margin-bottom: 50px;
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
            transform: translate(-50%, -40%);
        }

        .inputA {
            border: 1px solid lightgray;
            border-radius: 5px;
            width: 500px;
            height: 40px;
            padding: 5px;
        }

        #register,
        #list,
        #delete {
            width: 150px;
        }

        .post-time {
            font-size: 12px;
            float: right;
        }

        .thumbs {
            font-size: 30px;
            position: absolute;
            right: 0;
        }

        .content-container {
            display: flex;
            position: relative;

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

    <h1>게시글 보기</h1>

    <form>
        <fieldset class="insert">
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">NO</label><br>
                <p>${bulletin.boardNo}</p>
            </div>
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">TITLE</label><br>
                <p>${bulletin.title}</p>
            </div>
            <div class="post-time">
                <label for="exampleTextarea" class="form-label mt-4">POST TIME</label>
                <p>
                    <fmt:formatDate pattern="yyyy년 MM월 dd일 HH:MM:SS" value="${bulletin.postTime}" />
                </p>
            </div>
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">WRITER</label><br>
                <p>${bulletin.writer}</p>
            </div>
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">VIEWS</label><br>
                <p>${bulletin.viewCnt}</p>
            </div>
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">RECOMMEND</label><br>
                <p>${bulletin.recommend}</p>
            </div>
            <div class="content-container">



                <div class="form-group">
                    <label for="exampleTextarea" class="form-label mt-4">CONTENT</label><br>
                    <p>${bulletin.content}</p>
                </div>
                <div class="thumbs">
                    <a href="/bulletin/recommend?boardNo=${bulletin.boardNo}&viewFlag=false"><span class="lnr lnr-thumbs-up"></span></a>
                </div>
            </div>
            <br>
            <p>
                <a href="/bulletin/list" class="btn btn-primary btn-lg" id="list">목록보기</a>
                <a href="/bulletin/modify?boardNo=${bulletin.boardNo}&viewFlag=false" class="btn btn-primary btn-lg" id="register">수정하기</a>
                <a href="/bulletin/delete?boardNo=${bulletin.boardNo}" class="btn btn-primary btn-lg" id="delete">삭제하기</a>
            </p>
        </fieldset>
    </form>

</body>

</html>