	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series tune-in
	@file			series/lib/views/_tune-in.jsp
	@type			partial
	@author			ncavanagh
	@note 			exception logic because of reference in /video/views/series/index_series
	--------------------------------------------------------------------------------
	--%>
    <tiles:useAttribute name="classname" 			 ignore="true" />
    <c:set var="classname"							 value="${!empty classname ? classname : ''}" />

	<c:catch var="exception"><c:set var="tuneIn" value="${data.tuneIn}"/></c:catch>
	<c:if test="${empty exception}">
		<div class="tune-in ${classname}">
			<c:if test="${tuneIn != 'false'}">
			<c:choose>
			  <c:when test="${fn:contains(tuneIn, 'ET/PT')}">
		      	<c:set var="tuneInPartial" value="${fn:substringBefore(tuneIn,'ET/')}"/>
				<c:out value = "${tuneInPartial}"/> <em class="etpt">ET/PT</em>
		      </c:when>
		      <c:otherwise>
		      	<c:out value = "${tuneIn}"/>
		      </c:otherwise>
			 </c:choose>
			</c:if>
		</div>
	</c:if>
	