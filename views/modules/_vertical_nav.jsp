	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/modules/_vertical_nav.jsp
	@type			component/tile
	@author			ncavanagh
	@modified		06.10.14
	@desc			# fan-clubs are now in the series context, so url logic is simplified
	@desc			# also, it seems like we need to remove the fan club item entirely 
	@desc			# in generic context, but i dont like the idea (https://issues.sho.com/browse/SITE-7528)
	-----------------------------------------------------------------------------
	--%>
	<tiles:useAttribute name="theme"		ignore="true" />
	<c:set var="theme"						value="${!empty theme ? theme : 'generic'}" /> 		
	
	<c:set var="base_url_generic"			value="/sho" />
	<tiles:useAttribute name="base_url"		ignore="true" />
	<c:set var="base_url"					value="${!empty base_url ? base_url : base_url_generic}" /> 		
	
	<c:set var="nav_items_generic" 			value="Featured Challenges,Fan Clubs,My Activity,Achievements,Leaderboards,Redemption" />
	<c:set var="nav_items_series"			value="Fan Clubs,Challenges,Achievements,Leaderboards,Redemption" />
	<c:set var="is_series"					value="${theme == 'series'}" />
	<c:set var="nav_items"					value="${is_series ? nav_items_series : nav_items_generic}" />
	
	<ul class="vertical-nav">
		<li class="vertical-nav-border"></li>
		<c:forTokens items="${nav_items}" delims="," var="k" varStatus="i">
			
			<c:set var="key" 	value="${fn:replace(fn:toLowerCase(k), ' ', '-')}" 				/>
			<c:set var="url" 	value="${base_url}/red-rewards/${key}" 							/>
			
			<li class="vertical-nav-item vertical-nav-${key}">
			  <a href="${url}">
				<div class="vertical-nav-icon"></div>
				<div class="vertical-nav-text">${fn:replace(k,'Redemption','Redeem Rewards')}</div>
			  </a>
			</li>
			<li class="vertical-nav-border"></li>
		</c:forTokens>
		<li class="vertical-nav-faqs">
			<a href="${base_url}/red-rewards/faq">FAQs</a>
		</li>
	</ul>
