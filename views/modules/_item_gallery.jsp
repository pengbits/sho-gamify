	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/modules/_item_gallery.jsp
	@type			component/tile
	@author			dpaul
	@modified		09.17.13
	@desc			# draws the markup needed to trigger the item gallery component		
	@desc			# an item gallery is a catalog of redeemable items, rendered as tiles w/ masonry layout
	-----------------------------------------------------------------------------
	# no need to configure these at the moment...
	# 	[tiles:useAttribute name="folder"			ignore="false" /]
	# 	[tiles:useAttribute name="sort"				ignore="true"  /]
	# 	[c:set var="sort"							value="${!empty sort ? sort : 'sort'}" /] 
	# 	[tiles:useAttribute name="sort_dir"		 	ignore="true"  /]
	# 	[tiles:useAttribute name="display_size"	 	ignore="true"  /]
	# 	[tiles:useAttribute name="filter"			ignore="true"  /]
	--%>
	
	<div class="nitro-widget challenge-gallery item-gallery group" 
	    data-component="sho.gamify.itemgallery.Widget" 
		data-defer="nitro:init" 
		data-sort-by="sort" 
		data-sort-direction="" 
	>
		<div class="challenge-gallery-stage">
		</div>
	</div>