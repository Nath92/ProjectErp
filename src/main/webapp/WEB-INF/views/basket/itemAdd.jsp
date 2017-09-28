<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Add order</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<table>
		<c:set var="total" value="${0}"/>
		<c:forEach items="${basketItems}" var="bIt" varStatus="count">
			<c:if test="${not empty basketItems}">
				<c:if test="${count.index == 0}">
					<tr>
						<th colspan="5"><h2>Lista produktów w koszyku</h2></th>
					</tr>
					<tr>
						<th>Nazwa produktu</th>
						<th>Próba</th>
						<th>Ilość</th>
						<th>Masa</th>
						<th>Cena końcowa</th>
					</tr>
				</c:if>
				<tr>
					<td>${bIt.name}</td>
					<td>${bIt.standard}</td>
					<td>${bIt.quantity}</td>
					<td>${bIt.weight}</td>
					<td>${bIt.price}</td>
					<c:set var="total" value="${total + bIt.price}" />
				</tr>
				<c:if test="${count.last}">
					<tr>
						<td colspan="3">Kwota zamówienia</td>
						<td colspan="2">${total} piniędzy</td>
					</tr>
				</c:if>
			</c:if>
		</c:forEach>
	</table>
	<c:if test="${total > 0}">
		<form:form method="post" action="/ProjectErp/basket/add/${total}">
			<input type="submit" value="Zatwierdź koszyk">
		</form:form>
	</c:if>

	<h2>Dodaj produkt do koszyka</h2>
	<form:form action="/ProjectErp/basketItem/add" method="post" modelAttribute="basketItem">

		<label for="picked">Wybierz z listy dostępnych produktów:</label>
		<form:select id="picked" path="" required="true">
			<form:option disabled="true" selected="selected"
				label="Wybierz produkt" value="" />
			<form:options items="${availableProducts}" itemLabel="name" itemValue="id" />
		</form:select><br>

		<label for="pName">Nazwa produktu:</label>
		<form:input id="pName" path="name" readonly="true"/><br>
		
		<label for="pStandard">Próba:</label>
		<form:input id="pStandard" path="standard" readonly="true"/><br>
		
		<!-- moze edytowac -->
		<label for="pQuantity">Ilość:</label>
		<form:input id="pQuantity" path="quantity" type="number"/><span id="max"></span>
		<form:errors path="quantity" cssClass="error"/><br>
		
		<label for="pWeight">Masa:</label>
		<form:input id="pWeight" path="weight" readonly="true"/><br>
		
		<label for="pPrice">Cena końcowa:</label>
		<form:input id="pPrice" path="price" readonly="true"/>
		
		<!-- dane produktu -->
		<form:input id="pProductId" path="productId" hidden="true"/><br>

		<input type="submit" value="Dodaj produkt">
	</form:form>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			var data = eval('('+'${JSONProducts}'+')');

			var name = $("#pName");
			var standard = $("#pStandard");
			var quantity = $("#pQuantity");
			var weight = $("#pWeight");
			var price = $("#pPrice");
			var productId = $("#pProductId");
			
			var max = $("#max");
			var posPicked;

			$("#picked").on('change', function() {
				var valPicked = $(this).val();
				
				for (var i = 0; i < data.length; i++) {
					if (data[i].id == valPicked) {
						posPicked = i;
						name.val(data[i].name);
						standard.val(data[i].standard);
						weight.val(data[i].weight);
						productId.val(data[i].id);
						
						quantity.val(0);
						quantity.attr("min", "1");
						quantity.attr("max", data[i].availability);
						price.val(0);
						max.text("max:"+data[i].availability);
						
						break;
					}
				}
			});
			
			quantity.on('change', function() {
				var total = $(this).val();
				if ((total > 0) && (total <= data[posPicked].availability)) {
					price.val(total * data[posPicked].currentPrice);
				}
			});
			
		});
	</script>
</body>
</html>
