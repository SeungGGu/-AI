<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/admHeader.jsp" %>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">PAIX</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Modify DataTables</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Check</th>
                        <th>댓글번호</th>
                        <th>내용</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>분류</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${modifiedComments}" var="comment">
                        <tr>
                            <td class="text-center"><input type="checkbox" value="${comment.modify_replyNo}"></td>
                            <td>${comment.modify_replyNo}</td>
                            <td>${comment.modify_replyText}</td>
                            <td>${comment.modify_replyWriter}</td>
                            <td>${comment.modify_regDate}</td>
                            <td>${comment.modify_replyCtg}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
<%--            <div class="d-flex justify-content-end mt-3">--%>
<%--                <button type="button" class="btn btn-primary btn-flat"--%>
<%--                        style="padding: 5px 10px; font-size: 14px;">--%>
<%--                    <i class="fa fa-sign-in"></i> 재 학습--%>
<%--                </button>--%>
<%--            </div>--%>
        </div>
    </div>
</div>
<!-- /.container-fluid -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

</script>
<%@include file="../include/admFooter.jsp" %>
