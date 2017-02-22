	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/_assets-css.jsp
	@type			partial
	@author			dpaul	
	@desc			imports util styles and styles for canonical url (main gamify styles are in lib)
	--------------------------------------------------------------------------------
	--%>
	<tiles:insertDefinition name="assets.css_tag">
	    <tiles:putAttribute name="path" 					value="/gamify/css/index" />
		<tiles:putAttribute name="use_build_extensions"		value="false" />
	</tiles:insertDefinition>
