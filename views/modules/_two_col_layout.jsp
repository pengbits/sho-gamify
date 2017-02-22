	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/modules/_two_col_layout.jsp
	@type			component/tile
	@author			dpaul
	@modified		09.19.14
	@desc			# handles fixed-left,fluid-right two col layout pattern, for gamification context
	@note			# use presence of welcome_panel_remix="	true" to trigger new styles while redesign is pending
	@note			# the two-col fixed-fluid layout popularized by the sports site (modules.layouts.two_col_fixed_fluid) is in use elsewhere around the site,
	@note			# but not here, because of a desire to keep the left-nav docked to left of viewport while in the series context:
	
	-----------------------------------------------------------------------------
	--%>
	
	<tiles:importAttribute />
	<tiles:useAttribute name="content_right_class"		ignore="true" />
	<c:set var="content_right_class"					value="${!empty content_right_class ? content_right_class : ''}" /> 		
	<tiles:useAttribute name="content_left_class"		ignore="true" />
	<c:set var="content_left_class"						value="${!empty content_left_class ? content_left_class : ''}" />

	<tiles:useAttribute name="has_welcome_panel"		ignore="true" />
	<c:set var="has_welcome_panel"						value="${!empty has_welcome_panel ? has_welcome_panel : false}" /> 			
	
	<div class="series-gamify-container${' '}${classname}">
		
		<div class="docked gamify-column-left">
			<tiles:insertAttribute name="left" />	
		</div>
	
		<c:if test="${has_welcome_panel && securityContext.user.isGamificationParticipant != 'YES'}"> 
			<tiles:insertDefinition name="gamify.welcome" />
		</c:if>
		
		<tiles:insertAttribute name="right" />
	</div>
	

	

