<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SzczegÃ³Åy zamÃ³wienia</title>
</head>
<body>
	<c:forEach items="${orders}" var="order">
		<li>Data utworzenia - ${order.createdDate}</li>
		<li>Data dostarczenia- ${order.shippingDate}</li>
		<li>Data platnosci - ${order.paymentDate}</li>
		<li>Kwota - ${order.totalPrice}</li>
		<li>Zamowione przedmioty - <c:forEach items="${order.items}"
				var="item">
				<table>${item}
				</table>
			</c:forEach></li>
		<li>
		Dane klienta -
		<li>Nazwa - ${client.name}</li>
		<li>NIP - ${client.nip}</li>
		<li>Telefon - ${client.phone}</li>
		<li>Email - ${client.email}</li>
		<li>Opis - ${client.description}</li>
		</li>
	</c:forEach>
</body>
</html>