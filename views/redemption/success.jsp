	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		gamify
	@file			gamify/views/redemption/error.jsp
	@type			page
	@author			wlee	
	@desc			# red-rewards redemption error page
	--------------------------------------------------------------------------------
	--%>
	
	<div id="nav-secondary" class="nav docked nav-secondary">
		<span class="page-title">Red Rewards</span>
	</div>
	
	<div class="redemption-column">
		
		<div class="success-messaging">
			<span class="messaging-header">Thank you! Your reward is being processed.</span>		
			<div class="sub-header">You will receive a confirmation email soon. Please allow 4-6 weeks for delivery.</div>
		</div>
		
		<div class="success-product-wrap">
			<tiles:insertTemplate template="/gamify/views/redemption/_product.jsp">
				<tiles:putAttribute name="name" value="${redemptionProduct.name}" />
				<tiles:putAttribute name="imageUrl" value="${purchasedProduct.gamificationCatalogItem.imageThumbUrl}" />
			</tiles:insertTemplate>
			
			<div class="sub-header">Available Red Rewards points:</div>
			<h4 class="item-details__price">${purchasedProduct.gamificationPointsBalance.points}</h4>

			<p class="u-cf">
				<a href="/sho/red-rewards/redemption" class="button u-float-l">redeem more rewards</a>
				<a href="/sho/red-rewards/featured-challenges" class="button u-float-r">find a new challenge</a>
			</p>
		</div>		
		
	</div><!-- / end redemption-content -->