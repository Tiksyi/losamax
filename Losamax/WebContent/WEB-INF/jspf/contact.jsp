<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<title><spring:message code="contact.titre" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/static/css/styles.css" />">
<%-- <link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.css" />">
<script src="<c:url value="/static/bootstrap3/js/bootstrap.js" />"></script>
<script src="<c:url value="/static/jquery/js/jquery.js" />"></script> --%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	 <link rel="icon" href="<c:url value="/static/icones/www.ico" />">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<c:import url="./header.jsp"/>

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="well well-sm">
					<form class="form-horizontal" action="" method="post">
						<fieldset>
							<legend class="text-center"><spring:message code="contact.titre" /></legend>

							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name"><spring:message code="contact.nom" /></label>
								<div class="col-md-9">
									<input id="name" name="name" type="text"
										placeholder="${nom}" class="form-control">
								</div>
							</div>

							<!-- Email input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="email"><spring:message code="contact.email" /></label>
								<div class="col-md-9">
									<input id="email" name="email" type="text"
										placeholder="<c:out value="${email}"/>" class="form-control">
								</div>
							</div>
							<!-- Message body -->
							<div class="form-group">
								<label class="col-md-3 control-label" for="message"><spring:message code="contact.message" /></label>
								<div class="col-md-9">
									<textarea class="form-control" id="message" name="message"
										placeholder="${message}" rows="5"></textarea>
								</div>
							</div>

							<!-- Form actions -->
							<div class="form-group">
								<div class="col-md-12 text-right">
									<a href="<c:url value="/paricontroller/goToMenu" />" type="button" class="btn btn-primary btn-lg"><spring:message code="contact.validation" /></a>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>