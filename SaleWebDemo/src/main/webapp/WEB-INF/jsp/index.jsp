<%-- 
    Document   : index
    Created on : Jul 13, 2022, 4:46:35 PM
    Author     : NhatTien
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="javascript:void(0)">SaleApp Online</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="mynavbar">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0)">&#128293; Trang chủ</a>
                        </li>
                        <c:forEach items="${categories}" var="c">
                            <c:url value="/" var="cUrl">
                                <c:param name="cateId" value="${c.id}" />
                            </c:url>
                            <li class="nav-item">
                                <a class="nav-link" href="${cUrl}">${c.name}</a>
                            </li>
                        </c:forEach>
                    </ul>

                    <c:url value="/" var="action"/>
                    <form class="d-flex" method="get" action="${action}">
                        <!--                        method-->
                        <!--                        action-->
                        <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa">
                        <!--                        name-->
                        <button type="submit" class="btn btn-primary" type="button">Tìm</button>
                        <!--                        type-->
                    </form>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <c:if test="${products.size() == 0}">
                <p class="alert-danger"><em>Không có sản phẩm nào!</em></p>
            </c:if>
            <div class="row">
                <c:forEach items="${products}" var="p">
                    <div class="col-md-3 col-xs-12" style="padding: 5px;">
                        <div class="card">
                            <img class="card-img-top img-fluid" src="https://res.cloudinary.com/ou-hcm/image/upload/v1658410958/iphone-13-pro-aar-xanh-la-didongviet_vqtz8n.jpg" alt="Card image">
                            <div class="card-body">
                                <h4 class="card-title">${p.name}</h4>  
                                <p class="card-text">
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.price}" /> VND
                                </p>
                                <a href="#" class="btn btn-primary">Xem chi tiết</a>
                            </div>
                        </div>
                    </div> 
                </c:forEach>
            </div>   
        </div>

        <div class="mt-4 p-5 bg-primary text-white rounded">
            <h1>SaleWeb Online</h1>
            <p>Nguyen Nhat Tien &copy; 2022</p>
        </div>
    </body>
</html>
