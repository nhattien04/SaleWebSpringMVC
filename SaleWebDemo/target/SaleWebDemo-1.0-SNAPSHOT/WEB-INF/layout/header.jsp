<%-- 
    Document   : header
    Created on : Jul 26, 2022, 10:24:43 PM
    Author     : NhatTien
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
