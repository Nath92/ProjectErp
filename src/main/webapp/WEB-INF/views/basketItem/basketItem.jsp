<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Basket items</title>
</head>
<body>
	<table>
		<tr>
			<th>Nazwa</th>
			<th>Ilość</th>
			<th>Waga</th>
			<th>Cena</th>
			<th>Id produktu</th>
			<th>Linki</th>
		</tr>
		<c:forEach items="${basketItems}" var="basketItem">
			<tr>
				<td>${basketItem.name}</td>
				<td>${basketItem.quantity}</td>
				<td>${basketItem.weight}</td>
				<td>${basketItem.price}</td>
				<td>${basketItem.productId}</td>
				<td><button>
						<a href="/ProjectErp/basketItem/delete/${basketItem.id}">Usuń</a>
					</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>