<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Orders</title>
</head>
<body>
	<table>
		<tr>
			<th>Data utworzenia</th>
			<th>Data dostarczenia</th>
			<th>Data platnosci</th>
			<th>Kwota</th>
			<th colspan="2">Linki</th>
		</tr>
		<c:forEach items="${baskets}" var="basket" varStatus="count">
			<tr>
				<td>${basket.createdDate}</td>
				<td>${basket.shippingDate}</td>
				<td>${basket.paymentDate}</td>
				<td>${basket.totalPrice}</td>
				 <td><button>
						<a href="/ProjectErp/order/get/${basket.id}"
							style="text-decoration: none">Szczegóły</a>
					</button></td>
				<td><button>
						<a href="/ProjectErp/order/delete/${basket.id}"
							style="text-decoration: none">Usuń</a>
					</button></td> 
				<td><button>
				<a href="/ProjectErp/">Wróć</a>
				</button></td> 
			</tr>
		</c:forEach>
	</table>
</body>
</html>