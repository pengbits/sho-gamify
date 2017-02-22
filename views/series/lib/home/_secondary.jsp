	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		_
	@file			series/lib/views/home/_secondary.jsp
	@type			partial
	@author			ncavanagh	
	@author			dpaul
	@modfied		01.27.15
	@desc			# secondary content in home/landing pages
	@todo			# move email signup module setup to filter.jsp so it can be shared
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
	
	
	<div class="secondary table">
		<div class="tr">
			<div class="mod">
				<div class="mod-body">
					<tiles:insertDefinition name="modules.social_components_with_overlay" />
					<tiles:insertDefinition name="series.ways-to-watch" />
					
					<c:if test="${!empty email_signup and email_signup == 'left'}">${email_signup_module}</c:if>
				</div>
			</div>
			
			<div class="mod secondary-promos thumb mod50">
				<div class="mod-body">
					<tiles:insertDefinition name="secondary.promos" />
				</div>
			</div>
			
			<div class="mod news">
				<div class="mod-body">
					<tiles:insertDefinition name="series.about" />
					<c:if test="${!empty email_signup and email_signup == 'right'}">${email_signup_module}</c:if>
				</div>
			</div>
			
		</div>
	</div>
