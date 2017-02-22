	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			series/lib/views/gamify/challenges/index.jsp
	@type			page
	@author			dpaul
	@author			ncavanagh
	@modified		03.04.14
	@desc			# renders challenge gallery in series context
	-----------------------------------------------------------------------------
	--%>
	<tiles:insertDefinition 
		name="gamify.series_name_setup" />
	
	<tiles:insertDefinition 
		name="gamify.two_col_layout">
		
		<tiles:putAttribute name="has_welcome_panel" 		value="true" />
		<tiles:putAttribute name="welcome_panel_remix"		value="false" />
		
		<tiles:putAttribute name="left">
			<tiles:insertDefinition name="gamify.user_snapshot" />
			
			<tiles:insertDefinition name="gamify.vertical_nav">
				<tiles:putAttribute name="base_url"			value="${data.series.baseUrl}" />
				<tiles:putAttribute name="theme"			value="series" />
			</tiles:insertDefinition>
		</tiles:putAttribute>

		<tiles:putAttribute name="right">		
			
			<h2 class="gamify-section-header">Challenges</h2>
			
			<tiles:insertDefinition name="gamify.challenge_gallery">
				<tiles:putAttribute name="folder" 		value="www_series_${data.series.id}" />
				<tiles:putAttribute name="filter" 		value="list:yes" />
			</tiles:insertDefinition>
		</tiles:putAttribute>  

	</tiles:insertDefinition>
