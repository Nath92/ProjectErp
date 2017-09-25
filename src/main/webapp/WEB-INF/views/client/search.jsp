<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../header.jsp" />
	<h2>Wyszukaj klienta</h2>

	<table>
		<c:forEach items="${clients}" var="client" varStatus="count">
			<tr>
				Nazwa:<td>${client.name}</td>
				NIP:<td>${client.nip}</td>
				Kod pocztowy:<td>${client.postalcode}</td>
				Miasto:<td>${client.city}</td>
				Ulica:<td>${client.street}</td>
				Numer domu:<td>${client.housenumber}</td>
				Numer mieszkania:<td>${client.localnumber}</td>
				Numer telefonu:<td>${client.phonenumber}</td>
				Email:<td>${client.email}</td>
				Opis:<td>${client.description}</td>
			</tr>
		</c:forEach>
	</table>
<jsp:include page="../footer.jsp" />