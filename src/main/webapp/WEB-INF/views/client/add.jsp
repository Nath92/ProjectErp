<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add</title>
</head>
<body>
	<h2>Dodaj klienta</h2>
	<form:form method="post" modelAttribute="client">
		Nazwa:<form:input path="name" />
		<form:errors path="name" cssClass="error" />
		<br>
		
		NIP:<form:input path="nip" />
		<form:errors path="nip" cssClass="error" />
		<br>
		
		Numer telefonu:<form:input path="phone" />
		<form:errors path="phone" cssClass="error" />
		<br>
		
		E-mail:<form:input path="email" />
		<form:errors path="email" cssClass="error" />
		<br>
		
		Opis:<form:textarea path="description" />
		<form:errors path="description" cssClass="error" />
		<br>

		<input type="submit" value="Dodaj adres">
	</form:form>
</body>
</html>