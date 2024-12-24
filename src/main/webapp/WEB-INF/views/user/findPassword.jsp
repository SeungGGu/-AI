<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<body class="hold-transition login-page">
    <div class="register-box">
        <div class="register-logo">
            <a href="${path}/">
                <b>SCV</b>&nbsp BOARD
            </a>
        </div>

        <div class="register-box-body">
            <p class="login-box-msg">비밀번호 찾기</p>

            <form action="${path}/user/findPassword" method="post">
                <div class="form-group has-feedback">
                    <input type="text" name="userId" class="form-control" placeholder="Enter your ID">
                    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="email" name="userEmail" class="form-control" placeholder="Enter your email">
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">비밀번호 찾기</button>
                    </div>
                </div>
            </form>
            <!-- Other content -->
        </div>
        <!-- /.form-box -->
    </div>
    <!-- /.register-box -->

    <%@ include file="../include/plugin_js.jsp" %>
    <script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    </script>
</body>
</html>
