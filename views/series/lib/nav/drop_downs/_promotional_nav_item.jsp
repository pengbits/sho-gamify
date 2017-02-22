	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 
	
	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		_
	@file			series/lib/views/nav/drop_downs/_promotional_nav_item.jsp
	@type			partial
	@author			ncavanagh	
	@edited 		droy added link tracking to promos
	#
	# Provides a wrapper around pce-driven menu promotional items in the drop-down menu. 
	--------------------------------------------------------------------------------
	--%>
	<tiles:useAttribute name="promo_key" 	scope="page" />
	
	<c:set var="promo_object" 	  		value="${data.navigation.navigationPromotion.promotionMap[promo_key]}" />
	<c:set var="promo_label_text" 		value="${promo_object.fieldMap['link_copy']}" />
	<c:set var="promo_type"       		value="${promo_object.fieldMap['promo_type']}" />
	<c:set var="promo_link"       		value="${promo_object.fieldMap['link']}" />
	<c:set var="promo_image_url"       	value="${promo_object.fieldMap['image_url']}" />
	<c:set var="promo_nav_section"	    value="${promo_object.fieldMap['nav_section']}"/>
	
	<c:if test="${promo_type == 'video'}">
		<c:set var="promo_video_id" value="${promo_link}" /><%-- 'currently we only store the VAMS id in PCE `link` field' --%>
		<c:set var="promo_link">/sho/video/titles/${promo_video_id}/untitled</c:set>
		<c:set var="promo_attrs">data-behavior="play-video" data-video-id="${promo_video_id}" </c:set>
		<c:set var="promo_video_icon"><img src="/assets/images/series/lib/icons/play-video_20x20.png" class="play-icon"></c:set>
	</c:if>
	
	<div class="nav-col nav-promo">												
		<div class="nav-promo-img">
			<a ${promo_attrs} href="<c:out value='${promo_link}' />" data-behavior="track-click" data-click-id="series_nav:${promo_nav_section}:${fn:toLowerCase(promo_label_text)}"><img src="<c:out value='${promo_image_url}' />" />${promo_video_icon}</a>				
		</div>
		<a ${promo_attrs} href="<c:out value='${promo_link}' />" data-behavior="track-click" data-click-id="series_nav:${promo_nav_section}:${fn:toLowerCase(promo_label_text)}"><b><c:out value="${promo_label_text}" /></b></a>
	</div>
	
