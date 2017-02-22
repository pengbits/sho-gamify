	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series purchase page
	@file			_faux_carousel.mobile.jsp
	@type			partial
	@author			dpaul
	@modified		Thu May 15 18:06:21 EDT 2014
	@desc			# single-panel carousel with floated two column est links for purchase page
	-----------------------------------------------------------------------------
	--%>

	<tiles:useAttribute name="image"				ignore="true" />	
		
	<tiles:useAttribute name="headline"		 		ignore="true" />
	<c:set var="headline"					 		value="${!empty headline ? headline : 'Purchase Episodes'}" /> 		
	<tiles:useAttribute name="sub_title"		 	ignore="true" />
	<tiles:useAttribute name="videos"		 		ignore="true" />	
	<c:set var="videos_arr"							value="${!empty videos ? fn:split(fn:trim(videos), ',') : ''}" />
	<tiles:useAttribute name="purchase_urls"		ignore="true" />
	<c:set var="purchase_urls_arr"					value="${!empty purchase_urls ? fn:split(fn:trim(purchase_urls), ',') : ''}" />
	<c:set var="default_sub_copy"					value="Download your HD digital copy now from these retailers:" /> 	
	<tiles:useAttribute name="sub_copy"		 		ignore="true" />
	<c:set var="sub_copy"					 		value="${!empty sub_copy ? sub_copy : default_sub_copy}" /> 	
	
	<div class="purchase-content">

		<div class="carousel carousel-type-collection" data-component="sho.ui.mobile.Carousel">
		<div class="carousel-wrapper">
		<div class="carousel-scroller" style="overflow: hidden; visibility: visible;">
			<ul class="carousel-content">
			<li class="carousel-panel">
				<div class="carousel-image-area">
					<img src="${image}">					
					<c:if test="${!empty headline}">
						<div class="carousel-text-block">
							<span class="accent"></span>
							<span class="title">${headline}</span>
						</div>
					</c:if>	
				</div>
				<c:if test="${!empty sub_title}">
					<div class="carousel-subtitle">
						<p>${sub_title}</p>
					</div>
				</c:if>
				
				<c:if test="${!empty videos_arr}">
				<div class="carousel-panel-options">
				<ul class="carousel-panel-options-inner">
					<c:forEach items="${videos_arr}" var="pair">
						<c:set var="label" 	value="${fn:trim(fn:replace(fn:substringBefore(pair, ']'),'[', ''))}" />
						<c:set var="url" 	value="${fn:trim(fn:replace(fn:substringAfter(pair , '('), ')',''))}" />
						<li class="has-more-options">
							<canvas class="icon-canvas icon-play" width="10" height="10"></canvas>
							<a class="text-overflow" href="${url}">${label}</a>
						</li>
					</c:forEach>
				</ul>
				</div>
				</c:if>
				
				
			</li>
			</ul>

		</div>
		</div>
		</div>
	
		<h2>${sub_copy}</h2>
		<ul class="purchase-cta">		
			<c:forEach items="${purchase_urls_arr}" var="pair">
				<c:set var="label" 	value="${fn:trim(fn:replace(fn:substringBefore(pair, ']'),'[', ''))}" />
				<c:set var="url" 	value="${fn:trim(fn:replace(fn:substringAfter(pair , '('), ')',''))}" />
				<li>
					<span class="raquo">&raquo;</span><a data-behavior="track-click" data-click-id="${label}" href="${url}" class="more">${label}</a>
				</li>
			</c:forEach>
		</ul>
	
	</div><!-- END purchase-content -->