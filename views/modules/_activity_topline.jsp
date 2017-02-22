	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/modules/_activity_topline.jsp
	@type			component/tile
	@author			dpaul
	@modified		03.20.14
	-----------------------------------------------------------------------------
	--%>
	
	<%-- `configure for the context` --%>
	<tiles:useAttribute name="theme"				ignore="true" />
	<c:set var="theme"								value="${!empty theme ? theme : 'user-snapshot'}" /> 		
	<c:set var="map_store" 							value="${theme == 'user-snapshot' ? 'contextualProgressMap' : 'progressMap'}" />
	<c:set var="use_border_element"					value="${theme == 'user-snapshot' }" />	
	
	<%-- `set up some helper vars` --%>
	<c:set var="is_authenticated" 					value="${securityContext.isAuthenticated}" />
	<c:set var="user"								value="${securityContext.user}" />
	<c:set var="is_gamified" 						value="${is_authenticated && user.isGamificationParticipant == 'YES' }" />
	
	<%-- `define lists for itemized points labels/values` --%>
	<c:set var="countable_keys"   	   				value="video,photo,comment,share" />
	<c:set var="countable_labels_str"  				value="Videos Watched,Photo Galleries Viewed,Comments Posted,Content Shared" />
	<c:set var="countable_labels"	   				value="${fn:split(countable_labels_str, ',')}" />
	
	
	<ul class="${theme}-points-details">
		<c:if test="${use_border_element}"><li class="${theme}-border"></li></c:if>
		<c:forTokens items="${countable_keys}" delims="," var="key" varStatus="i">
		<li>
			${countable_labels[i.index]}
			<span>
				${is_gamified ? user.gamification[map_store][key].completionCount : '0'}
			</span>
		</li>		
		<c:if test="${use_border_element}"><li class="${theme}-border"></li></c:if>
		</c:forTokens>
	</ul>
