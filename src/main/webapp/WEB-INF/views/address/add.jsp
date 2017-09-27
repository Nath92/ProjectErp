<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add</title>
</head>
<body>
	<h2>Dodaj adres</h2>
	<form:form modelAttribute="address">
			Kod pocztowy:<form:input path="postalcode" class="postal-code" maxlength="6" pattern="[0-9]{2}-[0-9]{3}"/>
		<form:errors path="postalcode" cssClass="error" />
		<br>
			
			Województwo:<form:input path="province" />
		<br>
			
			Miasto<form:input path="city" />
		<form:errors path="city" cssClass="error" />
		<br>
			
			Ulica:<form:input path="street" />
		<form:errors path="street" cssClass="error" />
		<br>
			
			Numer domu:<form:input path="housenumber" />
		<form:errors path="housenumber" cssClass="error" />
		<br>
			
			Numer mieszkania:<form:input path="localnumber" />
		<br>
		<input type="submit" value="Dodaj">
	</form:form>
	<spring:url value="/resources/build/js/cleave.js" var="coreJs" />
	<spring:url value="/resources/build/js/cleave.min.js" var="cleaveJs" />

	<script src="${coreJs}"></script>
	<script src="${cleaveJs}"></script>
	<script>
		var cleave = new Cleave('.postal-code', {
			delimiter: '-',
			blocks: [2, 3],
			numeral : true
		});
	</script>
</body>
</html>