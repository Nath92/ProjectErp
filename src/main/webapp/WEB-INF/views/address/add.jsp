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
<link href="<c:url value="/resources/build/css/city-autocomplete.min.css" />" rel="stylesheet">
</head>
<body>
	<h2>Dodaj adres</h2>
	<form:form modelAttribute="address" method="post">
			Kod pocztowy:<form:input path="postalcode" class="postal-code"
			maxlength="6" pattern="[0-9]{2}-[0-9]{3}" />
		<form:errors path="postalcode" cssClass="error" />
		<br>
		
			Województwo:<form:select path="province">
			<form:option disabled="true" selected="selected"
				label="Proszę wybrać" value="" />
			<form:options items="${provinces}"/>
		</form:select>
		<form:errors path="province" cssClass="error" />
		<br>
			
			Miasto<form:input path="city" id="city" autocomplete="off" data-country="pl" list="cities"/>
		<form:errors path="city" cssClass="error" />
		<br>
			
			Ulica:<form:input path="street" id="street" pattern="[A-Za-z]{3,74}"/>
		<form:errors path="street" cssClass="error" />
		<br>
			
			Numer domu:<form:input path="housenumber" />
		<form:errors path="housenumber" cssClass="error" />
		
		<br>
			
			Numer mieszkania:<form:input path="localnumber" pattern="[0-9]{0,4}"/>
			<form:errors path="localnumber" cssClass="error" />
			
		<br>
		<input type="submit" value="Dodaj">
	</form:form>
	
	<spring:url value="/resources/build/js/cleave.min.js" var="cleaveJs" />
	<spring:url value="/resources/build/js/jquery.city-autocomplete.min.js" var="citiesJs" />
	<spring:url value="/resources/build/js/jquery.js" var="jQuery" />
	<spring:url value="//maps.googleapis.com/maps/api/js?key=AIzaSyANc_kBCCjhESTLWNhHaPkpWS1Xyyyqvgslibraries=places&language=pl" var="googleJs" />
	<script src="${jQuery}"></script>	
	<script src="${cleaveJs}"></script>
	<script src="${citiesJs}"></script>	
	<script src="//maps.googleapis.com/maps/api/js?key=AIzaSyCzrPKnpTqA1pOu9w7LADyh3uJoNqyZScE&libraries=places&language=pl"></script>	
	<script>
		$('#city').cityAutocomplete();

		var cleave = new Cleave('.postal-code', {
			delimiter : '-',
			blocks : [ 2, 3 ],
			numeral : true
		});
	</script>
</body>
</html>