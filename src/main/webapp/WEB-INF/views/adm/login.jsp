<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(function(){
            var msg = "${msg}";
            if(msg != ""){
                alert(msg);
            }
        });

        function frmCheck() {
            if ($("#me_id").val() == "") {
                alert("아이디를 입력해주세요.");
                $("#me_id").focus();
                return false;
            }
            if ($("#me_pwd").val() == "") {
                alert("비밀번호를 입력해주세요.");
                $("#me_pwd").focus();
                return false;
            }

            document.getElementById('loginform').submit();
            return false;
        }
    </script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>SCV PAIX</title>
    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fc;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
            width: 900px;
            height: 400px;
            border-radius: 10px;
        }
        /* Add any additional styling as needed */
    </style>
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg">
            <div class="card-body p-0">
                <div class="row">
                    <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                    <div class="col-lg-6">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Welcome</h1>
                            </div>
                           <form id="loginform" action="${path}/adm/login_action" method="post">
                                <c:if test="${not empty rememberCookie.getValue()}">
                                    <c:set value="checked" var="checked" />
                                </c:if>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="me_id" name="me_id" aria-describedby="emailHelp" placeholder="Enter Id..." value="${rememberCookie.getValue() }"/>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user" id="me_pwd" name="me_pwd" placeholder="Password" />
                                </div>
                                <a href="#" class="btn btn-primary btn-user btn-block" onclick="return frmCheck();">로그인</a>
                                <hr>
                                   <a href="${path}/" class="btn btn-warning btn-user btn-block">홈페이지</a>
                            </form>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap and other scripts -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>
</body>
</html>
