	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--
	
	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			series/lib/views/socialize/index.mobile.jsp
	@type			page
	@author			ncavanagh	
	@desc			socialize page for series / mobile
	@modified		12.1.11
	--------------------------------------------------------------------------------
	--%>
	<tiles:importAttribute scope="request" />
	<c:set var="article_id_series" value="${data.series.id}_0_0" />
	<c:set var="article_id_season" value="${customValueMap['livefyreCollectionPrefix']}" />
	<c:set var="hero_img_prefix"   value="${fn:toLowerCase(fn:replace(data.series.shortTitle, ' ', ''))}" />
	<c:set var="hero_img_path"	   value="/assets/images/series/${hero_img_prefix}/socialize/${hero_img_prefix}-fan-page_640x390.jpg" />
		
	<tiles:insertDefinition 
		name="modules.tune_in_block">
		<tiles:putAttribute name="tunein_text" value="${data.tuneIn}" /></tiles:insertDefinition>

	<tiles:insertDefinition 
		name="modules.section_header.gradient">
		<tiles:putAttribute name="title" value="Join the Community" /></tiles:insertDefinition>
	
	<c:if test="${include_socialize_modules != 'legacy'}">
	<tiles:insertDefinition 
		name="modules.social.fan_pages.mobile">
		<tiles:putAttribute name="hero_img" value="${hero_img_path}" />
		<tiles:putAttribute name="livefyre_article_id" value="${article_id_series}" /></tiles:insertDefinition>

	<%-- '(for now, just bypass the social collection component and include the twitter_authors partial directly)' --%>
	
	<jsp:include page="/series/lib/views/socialize/twitter_authors/_${article_id_season}_cast.mobile.jsp" />
	
	</c:if><%-- 'END if include_socialize_modules=all ' --%>
	
	
	<%-- 'include_social_stream is always true for mobile' --%>
	<tiles:insertDefinition 
		name="modules.section_header.gradient">
		<tiles:putAttribute name="title" value="Discuss the Latest Episode" /></tiles:insertDefinition>

	<tiles:insertDefinition 
		name="modules.social.social_stream.mobile">
		<tiles:putAttribute name="title" value="hidden" />
		<tiles:putAttribute name="livefyre_article_id" value="${article_id_series}" /></tiles:insertDefinition>