<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="modifier.client.title" /></title>
</head>
<body>
		<spring:message code="modifier.client.header" />
			<form method="POST" action="${pageContext.request.contextPath}/clientcontroller/modifier" modelAttribute="client">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<form:label path="client.nom"><spring:message code="client.nom" /><span class="required">*</span></form:label>
		<form:input path="client.nom" />&nbsp;<form:errors path="client.nom" cssClass="errors" />
		<br>
		<form:label path="client.prenom"><spring:message code="client.prenom" /><span class="required">*</span></form:label>
		<form:input path="client.prenom" />&nbsp;<form:errors path="client.prenom" cssClass="errors" />
		<br>
		<form:label path="client.mail"><spring:message code="client.mail" /><span class="required">*</span></form:label>
		<form:input path="client.mail" />&nbsp;<form:errors path="client.mail" cssClass="errors" />
		<br>
		<form:label path="client.age"><spring:message code="client.age" /><span class="required">*</span></form:label>
		<form:input path="client.age" />&nbsp;<form:errors path="client.age" cssClass="errors" />
		<br>
		<form:label path="client.adresse"><spring:message code="client.adresse" /><span class="required">*</span></form:label>
		<form:input path="client.adresse" />&nbsp;<form:errors path="client.adresse" cssClass="errors" />
		<br>
		<form:label path="client.telFix"><spring:message code="client.telFix" /><span class="required">*</span></form:label>
		<form:input path="client.telFix" />&nbsp;<form:errors path="client.telFix" cssClass="errors" />
		<br>
		<form:label path="client.telMobile"><spring:message code="client.telMobile" /><span class="required">*</span></form:label>
		<form:input path="client.telMobile" />&nbsp;<form:errors path="client.telMobile" cssClass="errors" />
		<br>
		<form:label path="client.miseMax"><spring:message code="client.miseMax" /><span class="required">*</span></form:label>
		<form:input path="client.miseMax" />&nbsp;<form:errors path="client.miseMax" cssClass="errors" />
		<br>
		<form:label path="client.listeSports"><spring:message code="client.listeSports" /></form:label>
		<form:select path="client.listeSports" multiple="true">
			<form:option value="" label="" />
			<form:options items="${sports}" itemValue="id" itemLabel="nom" />
		</form:select>
		<br>
		<form:label path="client.credentials.username"><spring:message code="client.username" /><span class="required">*</span></form:label>
		<form:password path="client.credentials.username" />&nbsp;<form:errors path="client.credentials.username" cssClass="errors" />
		<br>
		<form:label path="client.credentials.password"><spring:message code="client.password" /><span class="required">*</span></form:label>
		<form:password path="client.credentials.password" />&nbsp;<form:errors path="client.credentials.password" cssClass="errors" />
		<br>
		<input type="hidden" name="client.credentials.role" value="ROLE_USER" />
		<input type="submit" value="<spring:message code="client.creer.submit" />" />
	</form>
	<h3><a href="<c:url value="/paricontroller/goToMenu" />"><spring:message code="menu.retour" /></a></h3>
	

</body>
</html>