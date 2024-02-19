<%--
  Created by IntelliJ IDEA.
  User: TUONG VY
  Date: 31/01/2024
  Time: 8:10 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh Sách Khách Hàng </h1>
<table border="1">
    <tr>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customerList}" varStatus="status">
        <tr>
            <td>${customer.getName()}</td>
            <td>${customer.getDob()}</td>
            <td>${customer.getAddress()}</td>
            <td><img style="width: 40px;height: 40px" src="https://ceacopiniones.es/wp-content/uploads/2019/03/user-8-1024x1024.png"></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
