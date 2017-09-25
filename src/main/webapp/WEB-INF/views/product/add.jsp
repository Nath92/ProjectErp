<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add product</title>
</head>
<body>
	<form:form method="post" modelAttribute="product">
		Nazwa:<form:input path="name" required="true"/><br>
		Proba:<form:input path="standard" required="true"/><br>
		Ilosc:<form:input path="availability" required="true"/><br>
		Waga<form:input path="weight" min="0.1" required="true"/><br>
		Cena za 1 gram:<form:input path="currentPrice" min="0.1" required="true"/><br>
		<input type="submit" value="Dodaj">
	</form:form>
</body>
</html>