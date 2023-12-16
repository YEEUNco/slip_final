<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Potato Market</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        .card-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }
        .card-body {
            padding: 15px;
        }
        .product-info {
            margin-bottom: 10px;
        }
        .product-info span {
            font-weight: bold;
        }
        .love-button {
            cursor: pointer;
        }
        .card-img-top {
            width: 300px; /* 이미지 너비 설정 */
            height: auto; /* 이미지 높이 자동 조절 */
        }
    </style>
</head>
<body>
<main>
    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">감자 마켓</h1>
                <p class="lead text-muted">Discover and buy amazing things!</p>
                <p>
                    <a href="add" class="btn btn-primary my-2">중고거래 글 쓰기</a>
                </p>
            </div>
        </div>
    </section>

    <div class="container">
        <c:forEach items="${list}" var="u">
            <div class="card mb-3">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <span class="product-name">${u.productName}</span>
                    <span class="seller-name">${u.nickname}</span>
                </div>
                <div class="card-body">
                    <img src="${u.image_url}" class="card-img-top mb-3" alt="Product Image">
                    <p class="product-info"><span>Description:</span> ${u.description}</p>
                    <p class="product-info"><span>Price:</span> ${u.price}원</p>
                    <p class="product-info"><span>Condition:</span> ${u.prod_condition}</p>
                    <p class="product-info"><span>Location:</span> ${u.location}</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <small class="text-muted">${u.registration_date}</small>
                        <div>
                            <span id="loveNum${u.seq}" class="px-2">${u.likecount}</span>
                            <span class="love-button" onclick="javascript:love('${u.seq}')">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                                    </svg>
                                </span>
                            <button type="button" class="btn btn-sm btn-outline-success" onclick="javascript:edit_ok('${u.seq}')">Edit</button>
                            <button type="button" class="btn btn-sm btn-outline-danger" onclick="javascript:delete_ok('${u.seq}')">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

<footer class="text-muted py-5">
    <div class="container">
        <p class="float-end mb-1">
            <a href="#">Back to top</a>
        </p>
        <div class="col-sm-8 col-md-7 py-4">
            <h4 class="text-dark">Creators</h4>
            <p class="text-muted">이예은 22200550<br>이시온 22200538</p>
        </div>
    </div>
</footer>

<script>
    function delete_ok(id) {
        let pw = prompt("Enter pw", "");
        if (pw != null && pw != "") {
            location.href = "delete/" + id + "?pw=" + pw;
        }
    }

    function edit_ok(id) {
        let pw = prompt("Enter pw", "");
        if (pw != null && pw != "") {
            location.href = "editpost/" + id + "?pw=" + pw;
        }
    }

    function love(seq) {
        console.log("love function called with seq: " + seq); // 함수 호출 로그

        const xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            console.log("Ready state changed: " + this.readyState); // 상태 변경 로그

            if (this.readyState == 4) {
                console.log("Response received with status: " + this.status); // 응답 상태 로그

                if (this.status == 200) {
                    console.log("Updating like count to: " + this.responseText); // 좋아요 숫자 업데이트 로그
                    document.getElementById("loveNum" + seq).innerHTML = this.responseText;
                } else {
                    console.error("Error in request: " + this.statusText); // 오류 로그
                }
            }
        };

        xhttp.open("GET", "like?q=" + seq, true);
        xhttp.send();
        console.log("Request sent for seq: " + seq); // 요청 전송 로그
    }

</script>
</body>
</html>
