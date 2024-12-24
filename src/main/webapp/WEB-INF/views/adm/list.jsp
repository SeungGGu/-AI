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
            <h6 class="m-0 font-weight-bold text-primary">Reply DataTables</h6>
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
                    <c:forEach items="${comments}" var="comment">
                        <tr>
                            <td class="text-center"><input type="checkbox" value="${comment.replyNo}"></td>
                            <td>${comment.replyNo}</td>
                            <td>${comment.replyText}</td>
                            <td>${comment.replyWriter}</td>
                            <td>${comment.regDate}</td>
                            <td>${comment.replyCtg}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="d-flex justify-content-end mt-3">
                <%--                <div>--%>
                <%--                    <button type="button" class="btn btn-primary btn-flat" onclick="restoreComments()"--%>
                <%--                            style="padding: 5px 10px; font-size: 14px;">--%>
                <%--                        <i class="fa fa-sign-in"></i> 댓글 복원--%>
                <%--                    </button>--%>
                <%--                </div>--%>
                <div style="margin-left: 10px;">
                    <button type="button" class="btn btn-primary btn-flat" id="categoryButton"
                            style="padding: 5px 10px; font-size: 14px;" onclick="showCategoryOptions()">
                        <i class="fa fa-sign-in"></i> 분류 수정
                    </button>
                    <div id="categoryOptions" style="display: none;">
                        <label for="categorySelect">분류 선택:</label>
                        <select id="categorySelect" class="form-select" style="margin-top: 10px;">
                            <option value="일반문장">일반문장</option>
                            <option value="악플/욕설">악플/욕설</option>
                            <option value="여성/가족">여성/가족</option>
                            <option value="남성">남성</option>
                            <option value="성소수자">성소수자</option>
                            <option value="인종/국적">인종/국적</option>
                            <option value="연령">연령</option>
                            <option value="지역">지역</option>
                            <option value="종교">종교</option>
                            <option value="기타혐오">기타혐오</option>
                        </select>
                        <button type="button" class="btn btn-primary btn-flat" onclick="updateCategory()"
                                style="padding: 5px 10px; font-size: 14px; margin-top: 10px;">
                            저장
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function restoreComments() {
        var checkedComments = [];
        $("input[type=checkbox]:checked").each(function () {
            checkedComments.push($(this).val());
        });

        $.ajax({
            url: '/adm/restoreComments',
            type: 'POST',
            data: JSON.stringify(checkedComments),
            contentType: 'application/json; charset=utf-8',
            success: function (response) {
                alert('댓글이 복원되었습니다.');
                location.reload();
            },
            error: function (error) {
                alert('댓글 복원에 실패했습니다.');
            }
        });
    }

    function showCategoryOptions() {
        document.getElementById("categoryButton").style.display = "none";
        document.getElementById("categoryOptions").style.display = "block";
    }

    function updateCategory() {
        var selectedCategory = $("#categorySelect").val();
        var checkedComments = [];
        document.getElementById("categoryButton").style.display = "block";
        document.getElementById("categoryOptions").style.display = "none";
        $("input[type=checkbox]:checked").each(function () {
            checkedComments.push($(this).val());
        });

        $.ajax({
            url: '/adm/updateCommentCategory',
            type: 'POST',
            data: JSON.stringify({comments: checkedComments, category: selectedCategory}),
            contentType: 'application/json; charset=utf-8',
            success: function (response) {
                alert('댓글이 ' + selectedCategory + '(으)로 분류되었습니다.');
                location.reload();
            },
            error: function (error) {
                alert('댓글 분류에 실패했습니다.');
            }
        });
    }
</script>
<%@include file="../include/admFooter.jsp" %>
