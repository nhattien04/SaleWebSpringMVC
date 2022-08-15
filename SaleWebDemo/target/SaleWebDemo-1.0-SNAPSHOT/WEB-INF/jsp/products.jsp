<%-- 
    Document   : products
    Created on : Jul 27, 2022, 11:02:40 AM
    Author     : NhatTien
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-primary">QUẢN LÝ SẢN PHẨM</h1>

<c:url value="/admin/products" var="action" />
<form:form method="post" action="${action}" modelAttribute="product">
    <form:errors path="*" cssClass="alert alert-danger" element="div" />

    <div class="form-floating mb-3 mt-3">
        <form:input path="name" type="text" class="form-control" id="name" placeholder="name" name="name" />
        <label for="name">Tên sản phẩm</label>
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input path="price" type="number" class="form-control" id="price" placeholder="price" name="price" />
        <label for="price">Giá</label>
    </div>

    <div class="form-floating">
        <form:select path="categoryId" class="form-select" id="cate" name="cate">
            <c:forEach items="${categories}" var="c">
                <option value="${c.id}">${c.name}</option>
            </c:forEach>
        </form:select>
        <label for="sel1" class="form-label">Danh mục sản phẩm</label>
    </div>
        
    <br>
    <div>
        <input type="submit" value="Thêm sản phẩm" class="btn btn-primary"/>
    </div>
</form:form>

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
    window.onload = function () {
        getProducts('${u}');
    }
</script>