<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Products</title>
</head>
<body>
	<table>
		<tr>
			<th>Nazwa</th>
			<th>Próba</th>
			<th>Dostępna ilość na magazynie</th>
			<th>Masa</th>
			<th>Aktualna cena</th>
			<th colspan="2">Linki</th>
		</tr>
		<c:forEach items="${products}" var="product">
			<tr>
				<td>${product.name}</td>
				<td>${product.standard}</td>
				<td>${product.availability}</td>
				<td>${product.weight}</td>
				<td>${product.currentPrice}</td>
				<td><button>
						<a href="/ProjectErp/order/get/${product.id}"
							style="text-decoration: none">Szczegóły</a>
					</button></td>
				<td><button>
						<a href="/ProjectErp/order/delete/${product.id}"
							style="text-decoration: none">Usuń</a>
					</button></td> 
			</tr>
		</c:forEach>
	</table>
	<td><button><a href="/ProjectErp/">Wróć</a></button></td>
</body>
</html>