<%-- 
    Document   : index
    Created on : Jul 13, 2022, 4:46:35 PM
    Author     : NhatTien
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${products.size() == 0}">
    <p class="alert-danger"><em>Không có sản phẩm nào!</em></p>
</c:if>

<!--    Phan trang-->
<ul class="pagination" style="margin-left: 50px; margin-top: 10px;">
    <c:forEach begin="1" end="${Math.ceil(productsCount / pageSize)}" var="i">
        <c:url value="/" var="u">
            <c:param name="page" value="${i}" />
        </c:url>
        <li class="page-item"><a class="page-link" href="${u}">Trang ${i}</a></li>
    </c:forEach>
</ul>

<div class="row" style="margin: 50px;">
    <c:forEach items="${products}" var="p">
        <div class="col-md-3 col-xs-12" style="padding: 20px;">
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
