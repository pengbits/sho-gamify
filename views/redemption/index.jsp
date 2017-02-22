	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		red redemption
	@file			index.jsp
	@type			page
	@author			dpaul
	@modified		09.19.14
	@desc			# page to hold item gallery
	-----------------------------------------------------------------------------
	--%>
	
	<c:set var="is_authenticated" 					value="${securityContext.isAuthenticated}" />
	<c:set var="user"								value="${securityContext.user}" />
	<c:set var="is_gamified" 						value="${is_authenticated && user.isGamificationParticipant == 'YES' }" />
	<c:set var="user_points"						value="${is_gamified ? user.gamification.pointsBalance.points : '0'}" />
	
	<tiles:insertDefinition name="modules.layouts.two_col_fixed_fluid">
		<tiles:putAttribute name="content_left">
		
				<tiles:insertDefinition name="gamify.user_snapshot">
					<tiles:putAttribute name="avatar_size"				value="large" />
				</tiles:insertDefinition>

				<tiles:insertDefinition name="gamify.vertical_nav" />

		</tiles:putAttribute>
		<tiles:putAttribute name="content_right">
			
			<tiles:insertDefinition name="gamify.redemption_banner" />
			
			<h2 class="gamify-section-header">Available Red Rewards Points: ${user_points}
				<a id="available-points-info" class="gamify-icon-info "href="/sho/red-rewards/faq"></a>
			</h2>
			
			<tiles:insertDefinition name="gamify.item_gallery" />
		
		</tiles:putAttribute>
	</tiles:insertDefinition>
