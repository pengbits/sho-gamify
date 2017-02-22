	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		gamify
	@file			gamify/views/canonical_url/_filters.jsp
	@type			partial
	@author			dpaul	
	@desc			# Loaded before meta jsp is drawn, this our chance to override xml properties with dynamic data.
	@desc			# used here to populate the title and analytics before base meta is drawn
	--------------------------------------------------------------------------------
	--%>
	<tiles:insertDefinition name="filters.base" />
	<c:if test="${!empty data && !empty data.challenge && !empty data.challenge.name}">
	
	<c:set var="c" 						value="${data.challenge}" />
	<c:set var="challenge_series_name"	value="${(empty c.seriesName || c.seriesName == 'red rewards') ? 'showtime' : c.seriesName}" />
	<c:set var="pageTracking" 			value="red rewards:${fn:toLowerCase(challenge_series_name)}:challenges:${fn:toLowerCase(c.name)}:redirect" scope="request" />

	<%-- 'alter action phrase pronoun for shared context' --%>
	<c:set var="og_title" value="${fn:replace(c.actionPhrase, 'You just', 'I just')}" scope="request" />
					
	<c:set var="title" 				value="${c.name}" 							scope="request" />
	<c:set var="description" 		value="${c.description}" 					scope="request" />
	<c:set var="og_description" 	value="${c.description}" 					scope="request" />
	<c:set var="og_image" 			value="${c.fullUrl}" 			 			scope="request" />
	<c:set var="og_url" 			value="http://www.sho.com${data.url}" 		scope="request" />
	
	</c:if>
	
	<c:set var="development_mode" 	value="${fn:contains('LOCAL DEV', global.environment.server)}" scope="request" />
	<c:set var="bodyCssClass"		scope="request">${bodyCssClass} ${development_mode ? ' development':''}</c:set>
	