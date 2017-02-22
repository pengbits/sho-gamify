	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			series/lib/views/home/index.mobile.jsp
	@type			page
	@author			dpaul	
	@desc			# homepage for templated series site in mobile site.
	@modified		# 01.21.15
	@desc			# secondary content in home/landing pages
	@desc			# contents are as follows:
	@desc			# - social components
	@desc			# - ways to watch
	@desc			# - email signup widget
	@desc			# - secondary promos
	@desc			# - featured videos	
	@desc			# - about
	--------------------------------------------------------------------------------
	--%>
	<tiles:insertDefinition 
		name="modules.tune_in_block">
		<tiles:putAttribute name="tunein_text" value="${data.tuneIn}" /></tiles:insertDefinition>
	
	<tiles:insertDefinition 
		name="modules.carousel.series" />
		
	<tiles:insertDefinition 
		name="series.secondary.mobile">
		<tiles:putAttribute name="email_signup"	value="top" /></tiles:insertDefinition>

	<c:if test="${customValueMap['facebookTracking'] == 'default'}">
		<tiles:insertDefinition name="facebook_tracking" />
	</c:if>
	
	<c:if test="${customValueMap['facebookTracking'] == 'sports'}">
		<tiles:insertDefinition name="facebook_tracking.sports" />
	</c:if>
	
	<%-- # JIRA SITE-6507 Penny Dreadful--%> 
	<c:if test="${data.series.id == 1000323 || data.series.id == 1003223}">  
	<tiles:insertDefinition name="facebook_tracking">
		<tiles:putAttribute name="pixelId" value="1481884938701307" /></tiles:insertDefinition>
	</c:if>