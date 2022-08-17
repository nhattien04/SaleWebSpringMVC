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
    <div class="col-md-6 col-xs-12">
        <canvas id="myChart"></canvas>
    </div>   
</div>

<div class="row">
    <div class="col-md-6 col-xs-12">
        <table class="table">
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Doanh thu</th>
            </tr>

            <c:forEach items="${revenueStats}" var="r">
                <tr>
                    <td>${r[0]}</td>
                    <td>${r[1]}</td>
                    <td>
                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${r[2]}" /> VND
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-6 col-xs-12">
        <c:url value="/admin/stats" var="action"/>
        <form action="${action}">
            <div class="mb-3 mt-3">
                <label for="quarter" class="form-label">Quý:</label>
                <select type="email" class="form-control" id="quarter" placeholder="Enter quarter" name="quarter">
                    <c:forEach begin="1" end="4" var="i">
                        <option value="${i}">${i}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label for="year" class="form-label">Năm:</label>
                <input type="number" class="form-control" id="year" placeholder="Enter year" name="year">
            </div>
            <button type="submit" class="btn btn-primary">Lọc dữ liệu</button>
        </form>
        <canvas id="myChart2"></canvas>
    </div>   
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/stats.js" />"></script>
<script>
    window.onload = function () {
        let data = [];
        let labels = [];
        let data2 = [];
        let labels2 = [];
    <c:forEach items="${stats}" var="c">
        data.push(${c[2]});
        labels.push('${c[1]}');
    </c:forEach>

    <c:forEach items="${revenueStats}" var="r">
        data2.push(${r[2]});
        labels2.push('${r[1]}');
    </c:forEach>

        loadCateChart(data, labels);
        loadRevenueChart(data2, labels2);
    }
</script>