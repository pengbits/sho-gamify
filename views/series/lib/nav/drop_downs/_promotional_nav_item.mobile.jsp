	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 
	
	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		_
	@file			series/lib/views/nav/drop_downs/_promotional_nav_item.jsp
	@type			partial
	@author			dpaul	
	#
	# Provides a wrapper around pce-driven menu promotional items in the drop-down menu. 
	# These are graphic promos in the desktop site, but a simple text treatment is used for mobile 
	# todo: add data-attributes for click-tracking
	--------------------------------------------------------------------------------
	--%>
	<tiles:useAttribute name="promo_key" 	scope="page" />
	<tiles:useAttribute name="promo_label" 	scope="page" />
	
	<c:set var="promo_object" 	  		value="${data.navigation.navigationPromotion.promotionMap[promo_key]}" />
	<c:set var="promo_label_text" 		value="${promo_object.fieldMap[promo_label]}" />
	<c:set var="promo_type"       		value="${promo_object.fieldMap['promo_type']}" />
	<c:set var="promo_link"       		value="${promo_object.fieldMap['link']}" />
	<c:set var="promo_nav_section"	    value="${promo_object.fieldMap['nav_section']}"/>
	
	<c:if test="${promo_type == 'video'}">
		<c:set var="promo_video_id" value="${promo_link}" /><%-- 'currently we only store the VAMS id in PCE `link` field' --%>
		<c:set var="promo_link">/sho/video/titles/${promo_video_id}/untitled</c:set>
		<c:set var="promo_attrs">data-video-id="${promo_video_id}" </c:set>
	</c:if>
			<li class="nav-menu-promo-item ${promo_type}"><a ${promo_attrs} 
				href="${promo_link}" data-behavior="track-click" data-click-id="series_nav:${promo_nav_section}:${fn:toLowerCase(promo_label_text)}">${promo_label_text}</a>
			</li>