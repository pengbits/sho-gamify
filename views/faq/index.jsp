	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify v3
	@file			gamify/views/faq/index.jsp
	@type			page
	@author			dmccleod
	@modified		03.18.14
	@desc			faq page
	-----------------------------------------------------------------------------
	--%>	
	<tiles:insertDefinition name="modules.layouts.two_col_fixed_fluid">
	
		<tiles:putAttribute name="content_left">
			
			<tiles:insertDefinition name="gamify.user_snapshot">
				<tiles:putAttribute name="include_points_details"	value="false" />
				<tiles:putAttribute name="include_level"			value="true" />
				<tiles:putAttribute name="avatar_size"				value="large" />
				<tiles:putAttribute name="contextual_points"		value="false" />
			</tiles:insertDefinition>				
			<tiles:insertDefinition name="gamify.vertical_nav" />

		</tiles:putAttribute>
		<tiles:putAttribute name="content_right_class"		value="is-remix" />
		<tiles:putAttribute name="content_right">
			
			<c:if test="${securityContext.user.isGamificationParticipant != 'YES'}">
				<tiles:insertDefinition name="gamify.welcome" />
			</c:if>
				
			<tiles:insertDefinition name="gamify.faq" />
		</tiles:putAttribute>
	</tiles:insertDefinition>
