<%-- 
    Document   : products
    Created on : Jul 27, 2022, 11:02:40 AM
    Author     : NhatTien
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-primary">QUẢN LÝ SẢN PHẨM</h1>
<div class="spinner-border text-success" id="mySpinner"></div>
<table class="table">
    <tr>
        <th></th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th></th>
    </tr>
    <tbody id="myProduct">
        
    </tbody>
</table>

<script src="<c:url value="/js/product.js"/>"></script>
<script>
    <c:url value="/api/products" var="u"></c:url>
//        Lay tu "/api/products" do vao "/js/product.js", xuat ra "admin/products"
    window.onload = function() {
        getProducts('${u}');
    }
</script>