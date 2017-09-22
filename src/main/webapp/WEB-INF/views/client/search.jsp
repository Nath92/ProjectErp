<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search</title>
</head>
<body>
	<h2>Wyszukaj klienta</h2>

	<table>
		<tr>
			<c:forEach items="${clientAttributePl}" var="pl">
				<th>${pl}</th>
			</c:forEach>
		</tr>
		<form:select path="clientAttributesPl" items="${clientAttributesPl}"></form:select>
			<c:forEach items="${clients}" var="clients">
		<tr>
				<th>${clients.name}</th>
				<th>${clients.nip}</th>
				<th>${clients.postalcode}</th>
				<th>${clients.city}</th>
				<th>${clients.street}</th>
				<th>${clients.housenumber}</th>
				<th>${clients.localnumber}</th>
				<th>${clients.phonenumber}</th>
				<th>${clients.email}</th>
				<th>${clients.tag}</th>
		</tr>
			</c:forEach>
	</table>
</body>
</html>