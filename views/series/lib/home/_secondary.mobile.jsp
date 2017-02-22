	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		_
	@file			series/lib/views/home/_secondary.jsp
	@type			partial
	@author			dpaul
	@modfied		01.27.15
	@desc			# secondary content in home/landing pages
	@todo			# move email signup module setup to filter.jsp
	@desc			# secondary content in home/landing pages for mobile
	@desc			# contents are as follows:
	@desc			# - social components
	@desc			# - ways to watch
	@desc			# - email signup widget
	@desc			# - secondary promos
	@desc			# - about
	--------------------------------------------------------------------------------
	--%>
	<tiles:useAttribute name="email_signup"	ignore="true" /><c:if test="${!empty email_signup and email_signup != 'false'}">	
		<c:set var="email_signup_module">
			<tiles:insertDefinition name="modules.accounts.email_signup_widget">
				<tiles:putAttribute name="pub_id" 		value="${customValueMap['newsletter_id']}" />		
				<tiles:putAttribute name="pub_title" 	value="${customValueMap['newsletter_title']}" />
			</tiles:insertDefinition>
		</c:set>
	</c:if>
	
	<tiles:insertDefinition
		name="modules.social_components_urls" />
	
	<tiles:insertDefinition
		name="modules.social_components.follow" >
		<tiles:putAttribute name="fb_url" value="${facebookURL}" />
		<tiles:putAttribute name="twitter_url" value="${twitterURL}" />
		<tiles:putAttribute name="url" value="${'http://www.sho.com'}" /></tiles:insertDefinition>
	
	<tiles:insertDefinition 
		name="modules.ways_to_watch.series" />
		
	<c:if test="${!empty email_signup and email_signup == 'top'}">${email_signup_module}</c:if>
			
	<tiles:insertDefinition 
		name="modules.secondary_promos">
		<tiles:putAttribute name="theme" value="thumb-headline" />
		<tiles:putAttribute name="items" value="${data.secondaryPromotion.promotions}" /></tiles:insertDefinition>
		
	<tiles:insertDefinition 
		name="series.featured_videos.mobile">
		<tiles:putAttribute name="videos" value="${data.featuredVideoList}" /></tiles:insertDefinition>
	
	<tiles:insertDefinition 
		name="series.about.mobile" />
		
	<c:if test="${!empty email_signup and email_signup == 'bottom'}">${email_signup_module}</c:if>
	