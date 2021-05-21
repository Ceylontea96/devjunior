<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Developer's Community</title>

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

        .d-flex {
            float: right;
            padding: 10px;
        }

        .d-flex .keyword {
            border: 2px solid lightgray;
            border-radius: 5px;
        }

        .d-flex .search {
            border: 2px solid lightgray;
            border-radius: 5px;
        }

        .gradle-img {
            width: 50px;
            height: 50px;
        }

        .gradle {
            width: 100%;
            height: 100%;
        }

        .pageMaker {
            position: absolute;
            left: 50%;
            bottom: 5%;
            transform: translate(-50%, -50%);
        }
        #btn-write{
            float: right;
            margin: 30px;
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

    <img src="/images/community.png">

    <h1>Developer's Community</h1>
    <br><br>

    <form class="d-flex">
        <select name="keyword" class="keyword">
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="writer">작성자</option>
            <option value="TiAndCo">제목+내용</option>
        </select>
        <input class="search" type="text" placeholder="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>

    <br>

    <c:if test="${bulletinList.size() <= 0}">
        <p>게시물이 존재하지 않습니다.</p>
    </c:if>

    <c:if test="${bulletinList.size() > 0}">
        <table class="table table-hover">
            <tbody>
                <tr>
                    <th scope="col">글번호</th>
                    <th scope="col">작성자</th>
                    <th scope="col">글제목</th>
                    <th scope="col">등록일자</th>
                    <th scope="col">조회수</th>
                    <th scope="col">추천</th>
                </tr>
                <c:forEach var="bulletin" items="${bulletinList}">
                    <tr class="table-active">
                        <td>${bulletin.boardNo}</td>
                        <td>${bulletin.writer}</td>
                        <td><a href="/bulletin/detail?boardNo=${bulletin.boardNo}&viweFlag=true">${bulletin.title}</a>
                        </td>
                        <td>
                            <fmt:formatDate pattern="yyyy년 MM월 dd일 HH:MM:SS" value="${bulletin.postTime}" />
                        </td>
                        <td>${bulletin.viewCnt}</td>
                        <td>${bulletin.recommend}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 페이지 영역 -->
        <div class="pageMaker">
            <ul class="pagination">

                <c:if test="${pageMaker.prev}">
                    <li class="page-item">
                        <a class="page-link" href="/bulletin/list?page=${pageMaker.beginPage - 1}">&laquo;</a>
                    </li>
                </c:if>

                <c:forEach var="i" begin="${pageMaker.beginPage}" end="${pageMaker.endPage}" step="1">
                    <li data-page="${i}" class="page-item">
                        <a class="page-link" href="/bulletin/list?page=${i}">[${i}]</a>
                    </li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="page-item">
                        <a class="page-link" href="/bulletin/list?page=${pageMaker.endPage + 1}">&raquo;</a>
                    </li>
                </c:if>

            </ul>
        </div>
    </c:if>

    <p>
        <a href="/bulletin/insert" class="btn btn-primary btn-lg" id="btn-write">글쓰기</a>
    </p>



    <script>
        function appendPageActive(curPageNum){
            const $ul = document.querySelector('.pagination');
            for(let $li of [...$ul.children]){
                if($li.dataset.page === curPageNum){
                    $li.classList.add('active');
                }
            }
        }

        (function () {
            appendPageActive('${pageMaker.criteria.page}');
        }());

    </script>

</body>

</html>