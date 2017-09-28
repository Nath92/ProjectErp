<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Podsumowanie</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<form:form action="/ProjectErp/basket/submit" method="post" modelAttribute="basket">
		Data zamowienia:<form:input path="createdDate" id="today"/>
		<form:errors path="createdDate" cssClass="error"/><br>

		Data dostarczenia:<form:input path="shippingDate" class="datepicker"/>
		<form:errors path="shippingDate" cssClass="error"/><br>

		Data platnosci:<form:input path="paymentDate" class="datepicker"/>
		<form:errors path="paymentDate" cssClass="error"/><br>

		Kwota:<form:input path="totalPrice" required="true" readonly="true"/>
		<form:errors path="totalPrice" cssClass="error"/><br>

		<input type="submit" value="Dodaj">
	</form:form>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$(".datepicker").datepicker({ minDate: 0 });
			var today = $("#today");
			
			today.datepicker({minDate:0,maxDate:0}).attr('readonly','readonly');
			
		});
	</script>
</body>
</html>
