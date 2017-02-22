	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify v3
	@file			series/views/gamify/fan_clubs/index.jsp
	@type			page
	@author			dpaul
	@modified		06.10.14
	@desc			fan clubs page
	@note			notes
	-----------------------------------------------------------------------------
	--%>
	<tiles:insertDefinition 
		name="gamify.series_name_setup" />
	
	<tiles:insertDefinition 
		name="gamify.two_col_layout">
	
		<tiles:putAttribute name="left">
		
			<tiles:insertDefinition name="gamify.user_snapshot" />
			<tiles:insertDefinition name="gamify.vertical_nav">
				<tiles:putAttribute name="base_url"			value="${data.series.baseUrl}" />
				<tiles:putAttribute name="theme"			value="series" />
			</tiles:insertDefinition>
		
		</tiles:putAttribute>
		
		<tiles:putAttribute name="right">
			
			<h2 class="gamify-section-header">Fan Clubs</h2>
		
			<tiles:insertDefinition name="gamify.fan_clubs_gallery">
				<tiles:putAttribute name="folder" value="www" />
			</tiles:insertDefinition>

		</tiles:putAttribute>
	</tiles:insertDefinition>
