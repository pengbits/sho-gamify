	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			series/lib/views/gamify/faq/index.jsp
	@type			page
	@author			ncavanagh
	@modified		06.03.14
	-----------------------------------------------------------------------------
	--%>
	
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
			<tiles:insertDefinition name="gamify.faq" />
		</tiles:putAttribute>  

	</tiles:insertDefinition>
	
	