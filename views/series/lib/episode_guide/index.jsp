	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		generic series
	@file			series/lib/views/episode_guide/index.jsp
	@type			page
	@author			ncavanagh
	@desc			landing page for episode guide "/season" action - logic determines page content
	--------------------------------------------------------------------------------
	--%>
	<!-- temp remove getglue from ie9 and below because of bug on their end -->
	<!--[if lte IE 9]>
	<style>
		.social-sharing .share-component.getglue {
		    display:none;
		}
	</style>
	<![endif]-->
	<c:if test='${data.pageType == "season"}'>
		<tiles:insertDefinition name="series.season" />
	</c:if>  
	<c:if test='${data.pageType == "episode"}'>
		<tiles:insertDefinition name="series.episode" />
	</c:if>

	
	
	
