	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify v3
	@file			index.jsp
	@type			page
	@author			dpaul
	@modified		03.03.14
	@desc			featured challenges gallery
	-----------------------------------------------------------------------------
	--%>

	<tiles:insertDefinition name="modules.layouts.two_col_fixed_fluid">
		<tiles:putAttribute name="content_left">
			
				<tiles:insertDefinition name="gamify.user_snapshot">
					<tiles:putAttribute name="avatar_size"				value="large" />
				</tiles:insertDefinition>

				<tiles:insertDefinition name="gamify.vertical_nav" />

		</tiles:putAttribute>
		<tiles:putAttribute name="content_right">
			
			<c:if test="${securityContext.user.isGamificationParticipant != 'YES'}">
				<tiles:insertDefinition name="gamify.welcome" />
			</c:if>
		
			<h2 class="gamify-section-header">Featured Challenges</h2>
			
			<tiles:insertDefinition 
				name="gamify.challenge_gallery">
				<tiles:putAttribute name="folder" value="www" />
				<tiles:putAttribute name="filter" value="featured:yes" />
			
			</tiles:insertDefinition>

		</tiles:putAttribute>
	</tiles:insertDefinition>
