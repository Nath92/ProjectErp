<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add order</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( ".datepicker" ).datepicker({ minDate: 0 });
  } );
  </script>
  <script>
   $( function() {
	   var date = new Date();
	   yr = date.getFullYear();
	   month = date.getMonth() < 10 ? '0' + date.getMonth() : date.getMonth(),
	   day = date.getDate() < 10 ? '0' + date.getDate()  : date.getDate(),
		newDate = month + '/' + day + '/' + yr;	    		   
	   $('#today').attr('value', newDate);
  } );
  </script>
</head>
<body>
	<form:form method="post" modelAttribute="order">
		Data zamowienia:<form:input path="createdDate" id="today" disabled="true" required="true"/><br>
		Data dostarczenia:<form:input path="shippingDate" class="datepicker" required="true"/><br>
		Data platnosci:<form:input path="paymentDate" class="datepicker" required="true"/><br>
		Kwota:<form:input path="totalPrice" min="0.1" required="true"/><br>
		<input type="submit" value="Dodaj">
	</form:form>
</body>
</html>