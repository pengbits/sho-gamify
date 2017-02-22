	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/modules/_activity_stream.jsp
	@type			component/tile
	@author			dpaul
	@modified		04.26.13	
	-----------------------------------------------------------------------------
	--%>
	<tiles:useAttribute name="src"			ignore="false" />
	<tiles:useAttribute name="title"		ignore="false" />		
	<tiles:useAttribute name="classname"	ignore="true"  />
	<tiles:useAttribute name="sortby" 		ignore="true"  />
	<tiles:useAttribute name="filter" 		ignore="true"  />
	<tiles:useAttribute name="folder" 		ignore="true"  />
	
	<div class="activity-stream-container ${classname}">
		<h4>${title}</h4>
		<div class="nitro-widget activity-stream" 
			data-component="sho.gamify.ActivityStream"
			data-defer="nitro:init" 
			data-source="${src}" 
			data-sort-by="${sortby}" 
			data-filter="${filter}" 
			data-nitro-folder="${folder}">
		</div>
	</div>
	
	