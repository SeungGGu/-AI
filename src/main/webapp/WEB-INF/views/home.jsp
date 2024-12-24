<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%@ include file="include/head.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

    <!-- Main Header -->
    <%@ include file="include/main_header.jsp"%>

    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="include/left_column.jsp"%>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                PAIX Model Board
            </h1>
            <ol class="breadcrumb">
                <li><a href="${path}/"><i class="fa fa-dashboard"></i> home</a></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content container-fluid">
            <div class="image-container">
                <img src="/resources/upload/user/SCV_logo.png" class="full-width-image">
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <style>
        .image-container {
            position: relative;
            width: 100%;
            height: 100vh; /* 화면 높이에 맞게 조정합니다. */
            overflow: hidden;
        }

        .full-width-image {
            position: absolute;
            width: 100%;
            height: auto;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>

    <!-- Main Footer -->
    <%@ include file="include/main_footer.jsp"%>

</div>
<!-- ./wrapper -->

<%@ include file="include/plugin_js.jsp"%>

</body>

</html>
