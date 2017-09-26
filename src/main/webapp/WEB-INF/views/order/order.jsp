<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
		<c:forEach items="${orders}" var="order" varStatus="count">
			<tr>
				<td>${order.createdDate}</td>
				<td>${order.shippingDate}</td>
				<td>${order.paymentDate}</td>
				<td>${order.totalPrice}</td>
				 <td><button>
						<a href="/ProjectErp/order/get/${order.id}"
							style="text-decoration: none">SzczegÃ³Åy</a>
					</button></td>
				<td><button>
						<a href="/ProjectErp/order/delete/${order.id}"
							style="text-decoration: none">UsuÅ</a>
					</button></td> 
				<td><button>
				<a href="/ProjectErp/">WrÃ³Ä</a>
				</button></td> 
			</tr>
		</c:forEach>
	</table>
</body>
</html>