<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Szczegóły zamówienia</title>
</head>
<body>
	<ul>
		<li>Data utworzenia - ${basket.createdDate}</li>
		<li>Data dostarczenia- ${basket.shippingDate}</li>
		<li>Data platnosci - ${basket.paymentDate}</li>
		<li>Kwota - ${basket.totalPrice}</li>
		<li>Zamowione przedmioty - </li>
	</ul>
</body>
</html>