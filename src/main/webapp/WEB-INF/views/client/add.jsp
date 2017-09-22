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
		NIP:<form:input path="nip" />
		Kod pocztowy:<form:input path="postalcode" />
		Miasto<form:input path="city" />
		Ulica:<form:input path="street" />
		Numer domu:<form:input path="housenumber" />
		Numer mieszkania:<form:input path="localnumber" />
		Numer telefonu:<form:input path="phonenumber" />
		E-mail:<form:input path="email" />
		Tag<form:input path="tag" />
		<input type="submit" value="Dodaj">
</form:form>
</body>
</html>