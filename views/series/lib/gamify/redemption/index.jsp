	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		red redemption
	@file			index.jsp
	@type			page
	@author			dpaul
	@modified		09.17.14
	@desc			# renders item gallery in series context
	-----------------------------------------------------------------------------
	--%>
	
	<c:set var="is_authenticated" 					value="${securityContext.isAuthenticated}" />
	<c:set var="user"								value="${securityContext.user}" />
	<c:set var="is_gamified" 						value="${is_authenticated && user.isGamificationParticipant == 'YES' }" />
	<c:set var="user_points"						value="${is_gamified ? user.gamification.pointsBalance.points : '0'}" />
	
	<tiles:insertDefinition 
		name="gamify.series_name_setup" />
	
	<tiles:insertDefinition 
		name="gamify.two_col_layout">
		
		<tiles:putAttribute name="has_welcome_panel" 		value="false" />
		
		<tiles:putAttribute name="left">
			<tiles:insertDefinition name="gamify.user_snapshot" />
			
			<tiles:insertDefinition name="gamify.vertical_nav">
				<tiles:putAttribute name="base_url"			value="${data.series.baseUrl}" />
				<tiles:putAttribute name="theme"			value="series" />
			</tiles:insertDefinition>
		</tiles:putAttribute>
		
		<tiles:putAttribute name="right">		
		
			<tiles:insertDefinition name="gamify.redemption_banner" />
			<h2>Available Red Rewards Points: ${user_points} <a id="available-points-info" class="gamify-icon-info" href="${data.series.baseUrl}/red-rewards/faq"></a></h2>
			<tiles:insertDefinition name="gamify.item_gallery" />
		
		</tiles:putAttribute>  

	</tiles:insertDefinition>
