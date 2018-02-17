<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<spring:message var="inputError" code="answer.input.error"/>
<form action="answer/user/edit.do" method="post">
	<input type="hidden" name="rendezvousId" value="${rendezvousId}">
	<jstl:forEach var="question" items="${questions}">
		<h4>${question.text}</h4>
		<input type="text" name="answers" id="answers" required oninvalid="setCustomValidity('${inputError}')"
    	onchange="try{setCustomValidity('')}catch(e){}">
	</jstl:forEach>
	<br>
	<p class="error"/><spring:message code="${messageCode}"/><p>
	<br>
	<input type="submit" name="save" class="btn" value="<spring:message code="answer.save"/>">
</form>