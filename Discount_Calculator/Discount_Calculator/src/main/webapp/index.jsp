<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>

<form action="/display_discount" method="post">
  <input name="productDescription" placeholder="productDescription">
  <input name="listPrice" placeholder="listPrice">
  <input name="discountPercent" placeholder="discountPercent">
  <button type="submit">Send</button>
</form>
</body>
</html>