	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			series/lib/views/cast/_related_videos.mobile.jsp
	@type			page
	@author			dpaul	
	@desc			# related videos in cast page. bundles related video module with section header
	@desc			# and ensures module is only drawn if there are videos present
	@modified		10.01.12
	--------------------------------------------------------------------------------
	--%>
	<tiles:importAttribute name="videos" />
	<c:if test="${!empty videos}">
	<tiles:insertDefinition 
		name="modules.section_header.gradient">
		<tiles:putAttribute name="title" value="related videos" /></tiles:insertDefinition>
			
	<tiles:insertDefinition 
		name="modules.video_gallery.mobile">
		<tiles:putAttribute name="videos" value="${videos}" /></tiles:insertDefinition>
	</c:if>