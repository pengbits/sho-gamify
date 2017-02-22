	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/modules/_challenge_gallery.jsp
	@type			component/tile
	@author			dpaul
	@modified		04.24.13
	@desc			# draws the markup needed to trigger the challenge gallery component		
	-----------------------------------------------------------------------------
	--%>
	<tiles:useAttribute name="folder"			ignore="false" />
	<tiles:useAttribute name="sort"				ignore="true"  />
	<c:set var="sort"							value="${!empty sort ? sort : 'sort'}" /> 
	<tiles:useAttribute name="sort_dir"		 	ignore="true"  />
	<tiles:useAttribute name="display_size"	 	ignore="true"  />
	<tiles:useAttribute name="filter"			ignore="true" />
	
	<div class="nitro-widget challenge-gallery group" 
	    data-component="sho.gamify.challengegallery.Widget" 
		data-defer="nitro:init" 
		data-nitro-folder="${folder}" 
		data-sort-by="${sort}" 
		data-sort-direction="${sort_dir}" 
		data-display-size="${display_size}" 
		data-filter="${filter}">
		<div class="challenge-gallery-stage">
		</div>
	</div>