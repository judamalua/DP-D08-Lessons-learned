<%--
 * list.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<display:table name="comments" id="row" pagesize="5" class="displaytag" requestURI="${requestURI}">

	<spring:message code="comment.moment.format" var = "momentFormat"/>
	<spring:message code="comment.moment" var = "commentMoment" />
	<display:column property="moment" title="${commentMoment}" sortable="true" format="${momentFormat}"/>
	
	<spring:message code="comment.text" var = "commentText" />
	<display:column property="text" title="${commentText}" sortable="false"/>
	
	<spring:message code="comment.pictureUrl" var = "commentPictureUrl" />
	<display:column title="${commentPictureUrl}">
		<img src="${row.pictureUrl}" width="150" height="150"/>
	</display:column>
	
	<spring:message code="comment.replies" var = "commentReplies" />
	<display:column title="${commentReplies}" sortable="false">
		<jstl:if test="${row.comments != null and fn:length(row.comments)>0}"> <!-- Comprueba que tenga respuestas -->
			<a href="comment/list.do?commentId=${row.id}"><spring:message code="comment.view.replies"/></a>
		</jstl:if>
	</display:column>
	
	<security:authorize access="hasRole('USER')"> 
	<spring:message code="comment.reply" var = "commentReply" />
	<display:column >
		<a href="comment/user/reply.do?commentId=${row.id}"><jstl:out value="${commentReply}"/></a>
	</display:column>
	</security:authorize>
</display:table>