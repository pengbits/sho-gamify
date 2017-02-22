	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		series purchase page
	@file			_faux_carousel.jsp
	@type			partial
	@author			dpaul
	@modified		Thu May 15 18:06:21 EDT 2014
	@desc			# single-panel carousel with floated two column est links for purchase page
	@note			# introducing a new kind of psuedo-markup for setting the lists of purchase urls:
	@note			# pass in via [label])(url),[label])(url),[label])(url),[label])(url)
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
	
	<div class="carousel">
		<div class="carousel-content">				
			<div class="flash-panel"></div>
			<div class="panel">
				<img src="${image}" alt="${headline}" />
						
				<div class="text-block text-block-purchase align-vert">
					<span class="options tunein"><span class="accent"></span></span>
					<h2 class="title">${headline}</h2>				
					
					<c:if test="${!empty sub_title}">
					<span class="sub-title">${sub_title}</span>
					</c:if>
				
					<c:if test="${!empty videos_arr}">
						<span class="options more-info">
							<c:forEach items="${videos_arr}" var="pair">
								<c:set var="label" 	value="${fn:trim(fn:replace(fn:substringBefore(pair, ']'),'[', ''))}" />
								<c:set var="url" 	value="${fn:trim(fn:replace(fn:substringAfter(pair , '('), ')',''))}" />
								<c:set var="id"		value="${fn:trim(fn:substringBefore(fn:substringAfter(url, '/sho/video/titles/'),'/'))}" />
								<a href="${url}" class="video" data-behavior="play-video" data-video-id="${id}" >${label}</a>
							</c:forEach>
						</span>
					</c:if>
		
					<c:if test="${!empty purchase_urls_arr}">
						<c:set var="length" value="${fn:length(purchase_urls_arr)}" />
						<fmt:formatNumber var="break" value="${length / 2}" maxFractionDigits="0" />
						<c:set var="break" value="${break > 1 ? break : 1}" />
						<span class="sub-title sub-title-purchase">${sub_copy}</span>

						<div class="purchase-links">
							<ul class="left">
							<c:forEach items="${purchase_urls_arr}" var="pair" begin="0" end="${break-1}">
								<c:set var="label" 	value="${fn:trim(fn:replace(fn:substringBefore(pair, ']'),'[', ''))}" />
								<c:set var="url" 	value="${fn:trim(fn:replace(fn:substringAfter(pair , '('), ')',''))}" />
								<li><a href="${url}" class="more" data-behavior="track-click" data-click-id="${label}">${label}</a></li>
							</c:forEach>
							</ul>
							
							<ul class="right">
							<c:forEach items="${purchase_urls_arr}" var="pair" begin="${break}">
								<c:set var="label" 	value="${fn:trim(fn:replace(fn:substringBefore(pair, ']'),'[', ''))}" />
								<c:set var="url" 	value="${fn:trim(fn:replace(fn:substringAfter(pair , '('), ')',''))}" />
								<li><a href="${url}" class="more" data-behavior="track-click" data-click-id="${label}">${label}</a></li>
							</c:forEach>
							</ul>
						</div>
					</c:if>
				
				</div>
			</div>
		</div>
	</div>