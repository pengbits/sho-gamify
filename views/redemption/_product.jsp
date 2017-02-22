<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/redemption/_product.jsp
	@type			
	@author			dmccleod
	@modified		Wed Sep 24
	@desc			product display for redemption: image, name, description and points
	-----------------------------------------------------------------------------
	--%>

	<tiles:useAttribute name="imageUrl"		ignore="false" />
	<tiles:useAttribute name="name"			ignore="true" />		
	<tiles:useAttribute name="description"	ignore="true" />
	<tiles:useAttribute name="price"		ignore="true" />
	<tiles:useAttribute name="showPoints"	ignore="true" />
	
	<figure class="item-details">
		<img src="${imageUrl}" class="item-details__product-image u-float-l" alt="${name}" />
		<figcaption class="item-details__details u-float-l">
			<h1 class="item-details__name">${name}</h1>
	 		<p class="item-details__description">${description}</p>
			<h4 class="item-details__price">${price}<em>Points</em></h4>
		</figcaption>
	</figure>
	
	