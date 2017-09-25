<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../header.jsp" />
	<h2>Wyszukaj klienta</h2>

	<table>
		<tr>
			<th>Nazwa</th>
			<th>NIP</th>
			<th>Nr. telefonu</th>
			<th>Email</th>
			<th>Opis</th>
			<th colspan="2">Linki</th>
		</tr>
		<c:forEach items="${clients}" var="client" varStatus="count">
			<tr>
				<td>${client.name}</td>
				<td>${client.nip}</td>
				<td>${client.phone}</td>
				<td>${client.email}</td>
				<td>${client.description}</td>
				<td><button><a href="/ProjectErp/client/get/${client.id}" style="text-decoration: none">Szczegóły</a></button></td>
				<td><button><a href="/ProjectErp/client/delete/${client.id}" style="text-decoration: none">Usuń</a></button></td>
			</tr>
		</c:forEach>
	</table>
<jsp:include page="../footer.jsp" />