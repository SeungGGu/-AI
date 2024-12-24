<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%--head.jsp--%>
<%@ include file="../include/head.jsp" %>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <%--main_header.jsp--%>
    <%-- Main Header --%>
    <%@ include file="../include/main_header.jsp" %>

    <%--left_column.jsp--%>
    <%-- Left side column. contains the logo and sidebar --%>
    <%@ include file="../include/left_column.jsp" %>

    <%-- Content Wrapper. Contains page content --%>
    <div class="content-wrapper">
        <%-- Content Header (Page header) --%>
        <section class="content-header">
            <h1>
                회원 정보
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> user</a></li>
                <li class="active">profile</li>
            </ol>
        </section>

        <%-- Main content --%>
        <section class="content container-fluid">
            <div class="col-md-8">

                <!-- Profile Image -->
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <img class="profile-user-img img-responsive img-circle"
                             src="${path}/user/default-user.png" alt="User profile picture">
                        <h3 class="profile-username text-center">${login.userName}</h3>
                        <div class="text-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myInfoMod">
                                    회원 정보 수정
                                </button>
                                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myPwMod">
                                    비밀번호 수정
                                </button>
<%--                                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myProfileImgMod">--%>
<%--                                    프로필 이미지 수정--%>
<%--                                </button>--%>
                                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#Withdrawal">
                                    회원 탈퇴
                                </button>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
            <div class="col-md-4">

                <!-- About Me Box -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">가입 정보</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <strong><i class="fa fa-user-plus margin-r-5"></i> 회원가입일</strong>
                        <p class="text-muted">
                            <fmt:formatDate value="${login.userJoinDate}" pattern="yyyy-MM-dd"/>
                        </p>

                        <hr>

                        <strong><i class="fa fa-sign-in margin-r-5"></i> 최종 접속일</strong>
                        <p class="text-muted">
                            <fmt:formatDate value="${login.userLoginDate}" pattern="yyyy-MM-dd a HH:mm"/>
                        </p>

                        <hr>

                        <strong><i class="fa fa-envelope-o margin-r-5"></i> 이메일</strong>
                        <p class="text-muted">
                            ${login.userEmail}
                        </p>

                        <hr>

                        <strong><i class="fa fa-file-text-o margin-r-5"></i> 자기소개</strong>
                        <p>${login.userSignature}</p>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </section>
    </div>
    <%-- /.content-wrapper --%>

        <div class="modal fade" id="myInfoMod">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form role="form" id="userInfoModForm" action="${path}/user/info/modify" method="post">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">회원정보 수정</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group has-feedback">
                                <input type="text" id="userId" name="userId" class="form-control" placeholder="아아디" value="${login.userId}" readonly>
                                <span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <input type="text" id="userName" name="userName" class="form-control" placeholder="이름" value="${login.userName}">
                                <span class="glyphicon glyphicon-user form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                            <input type="email" id="userEmail" name="userEmail" class="form-control" placeholder="이메일" value="${login.userEmail}">
                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <input type="password" id="userPw" name="userPw" class="form-control" placeholder="비밀번호">
                                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <textarea class="form-control" name="userSignature" id="userSignature" rows="3" placeholder="자기소개" style="resize: none">${login.userSignature}</textarea>
                                <span class="glyphicon glyphicon-pencil form-control-feedback"></span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                            <button type="submit" class="btn btn-primary myInfoModBtn">수정 저장</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="myPwMod">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form role="form" action="${path}/user/info/password/modify" method="post">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">비밀번호 수정</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group has-feedback">
                                <input type="hidden" name="userId" class="form-control" value="${login.userId}">
                                <input type="password" name="oldUserPw" class="form-control" placeholder="현재 비밀번호">
                                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <input type="password" name="newUserPw" class="form-control" placeholder="변경할 비밀번호">
                                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <input type="password" class="form-control" placeholder="변경할 비밀번호 확인">
                                <span class="glyphicon glyphicon-check form-control-feedback"></span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                            <button type="submit" class="btn btn-primary">비밀번호 수정</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

<%--        <div class="modal fade" id="myProfileImgMod">--%>
<%--            <div class="modal-dialog">--%>
<%--                <div class="modal-content">--%>
<%--                    <form role="form" id="uploadForm" method="post" action="${path}/user/img/upload" enctype="multipart/form-data">--%>
<%--                        <div class="modal-header">--%>
<%--                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                <span aria-hidden="true">×</span></button>--%>
<%--                            <h4 class="modal-title">프로필 이미지 수정</h4>--%>
<%--                        </div>--%>
<%--                        <div class="modal-body">--%>
<%--                            <div class="text-center">--%>
<%--                                <div class="fileinput fileinput-new" data-provides="fileinput">--%>
<%--                                    <div class="fileinput-new thumbnail" style="width: 150px; height: 150px;">--%>
<%--                                        <img src="${path}/user${login.userImg}" alt="...">--%>
<%--                                    </div>--%>
<%--                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 200px;"></div>--%>
<%--                                    <div>--%>
<%--                                    <span class="btn btn-default btn-file">--%>
<%--                                        <span class="fileinput-new">이미지 선택</span>--%>
<%--                                        <span class="fileinput-exists">변경</span>--%>
<%--                                        <input type="file" id="userImgFile" name="userImgFile">--%>
<%--                                        <input type="hidden" name="userId" value="${login.userId}">--%>
<%--                                    </span>--%>
<%--                                        <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">제거</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="modal-footer">--%>
<%--                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>--%>
<%--                            <c:if test="${login.userImg ne '/default-user.png'}">--%>
<%--                                <button type="button" class="btn btn-primary">프로필 이미지 삭제</button>--%>
<%--                            </c:if>--%>
<%--                            <button type="submit" class="btn btn-primary">프로필 이미지 변경 저장</button>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

    <div class="modal fade" id="Withdrawal" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <form role="form" action="${path}/user/info/delete" method="post">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title">회원 탈퇴</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group has-feedback">
                            <input type="password" name="userPw" class="form-control" placeholder="비밀번호를 입력해주세요">
                            <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                        </div>
                         <input type="hidden" name="userId" value="${login.userId}">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                        <button type="submit" class="btn btn-primary">회원 탈퇴</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%--main_footer.jsp--%>
    <%@ include file="../include/main_footer.jsp" %>
</div>
<%-- ./wrapper --%>
<%--plugin_js.jsp--%>
<%@ include file="../include/plugin_js.jsp" %>
<script>
    $(document).ready(function () {
        var result = "${msg}";
        if (result === "INVALID userPw") {
            alert("비밀번호가 일치하지 않습니다.");
        } else if (result === "MODIFIED userInfo") {
            alert("회원정보 수정이 완료되었습니다.");
        } else if (result === "MODIFIED userPw") {
            alert("비밀번호 변경이 완료되었습니다.");
        } else if (result === "SAME userPw") {
            alert("현재 비밀번호와 변경할 비밀번호가 동일합니다.");
        }

        var userImg = "${login.userImg}";

        if (userImg !== "/user/default-user.png") {

        }
    });
</script>
</body>
</html>
