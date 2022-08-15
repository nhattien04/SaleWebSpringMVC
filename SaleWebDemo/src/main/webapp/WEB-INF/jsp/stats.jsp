<%-- 
    Document   : stats
    Created on : Aug 15, 2022, 10:15:04 AM
    Author     : NhatTien
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-primary">THỐNG KÊ BÁO CÁO</h1>

<div class="row">
    <div class="col-md-6 col-xs-12">
        <table class="table">
            <tr>
                <th>ID</th>
                <th>Tên danh mục</th>
                <th>Số lượng</th>
            </tr>

            <c:forEach items="${stats}" var="c">
                <tr>
                    <td>${c[0]}</td>
                    <td>${c[1]}</td>
                    <td>${c[2]}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-6 col-xs-12"></div>   
</div>
