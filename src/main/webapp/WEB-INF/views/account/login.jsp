<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="pl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<title>Autoryzacja</title>

<!-- Bootstrap -->
<link
	href="<c:url value="/resources/vendors/bootstrap/dist/css/bootstrap.min.css" />"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="<c:url value="/resources/vendors/font-awesome/css/font-awesome.min.css" />"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="<c:url value="/resources/vendors/nprogress/nprogress.css" />"
	rel="stylesheet">
<!-- Animate.css -->
<link
	href="<c:url value="/resources/vendors/animate.css/animate.min.css" />"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="<c:url value="/resources/build/css/custom.min.css" />"
	rel="stylesheet">
</head>

<body class="login">
	<div>
		<a id="signup"></a>
		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form:form modelAttribute="account" method="post">
						<h1>Zaloguj się</h1>
						<div>
							${errorInfo}
							<form:input path="username" type="text" class="form-control"
								placeholder="Nazwa użytkownika" required="true" />
						</div>
						<div>
							<form:input path="password" type="password" class="form-control"
								placeholder="Hasło" required="true" />
						</div>
							<div>
							<input type="submit" class="btn btn-default submit" value="Zaloguj"/>
							</div>
						<div></div>
						<div class="separator">
							<p>
								Nie masz konta? <a href="/ProjectErp/account/register">
									Zarejestruj </a>
							</p>
							<br />
							<div>
								<h1>ProjectERP!</h1>
							</div>
						</div>
					</form:form>
				</section>
			</div>
		</div>
	</div>
</body>
</html>
