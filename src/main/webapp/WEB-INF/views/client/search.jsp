<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../header.jsp" />
	<h2>Wyszukaj klienta</h2>
	
	<form:select path="clientAttributesPl" items="${clientAttributesPl}"></form:select>

	<table>
		<c:forEach items="${clients}" var="client" varStatus="count">
			<c:if test="${count.index == 0}">
				<tr>
					<c:forEach items="${clientAttributePl}" var="pl">
						<th>${pl}</th>
					</c:forEach>
				</tr>
			</c:if>
				
			<tr>
				<td>${client.name}</td>
				<td>${client.nip}</td>
				<td>${client.postalcode}</td>
				<td>${client.city}</td>
				<td>${client.street}</td>
				<td>${client.housenumber}</td>
				<td>${client.localnumber}</td>
				<td>${client.phonenumber}</td>
				<td>${client.email}</td>
				<td>${client.tag}</td>
			</tr>
		</c:forEach>
	</table>
<jsp:include page="../footer.jsp" />