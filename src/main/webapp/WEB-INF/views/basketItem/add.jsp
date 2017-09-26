<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add basket item</title>

</head>
<body>
	<form:form method="post" modelAttribute="basketItem">
Nazwa<form:input path="name" />
		<form:errors path="name" cssClass="error" />
		<br>
Ilość<form:input path="quantity" />
		<form:errors path="quantity" cssClass="error" />
		<br>
Waga<form:input path="weight" />
		<form:errors path="weight" cssClass="error" />
		<br>
Cena<form:input path="price" />
		<form:errors path="price" cssClass="error" />
		<br>
Produkt
	<form:select path="productId" items="${products}" itemValue="id"
			itemLabel="name" />
		<input type="submit" value="Dodaj">
	</form:form>
	<br>
</body>
</html>