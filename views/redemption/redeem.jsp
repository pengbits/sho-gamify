	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		gamify
	@file			gamify/views/redemption/redeem.jsp
	@type			page
	@author			wlee	
	@desc			# register new address to redeem
	--------------------------------------------------------------------------------
	--%>

		<div id="nav-secondary" class="nav docked nav-secondary">
			<span class="page-title">Red Rewards</span>
		</div>
		
		<div class="redemption-column">		
			<tiles:insertTemplate template="/gamify/views/redemption/_product.jsp">
				<tiles:putAttribute name="name" value="${redemptionProduct.name}" />
				<tiles:putAttribute name="description" value="${redemptionProduct.description}" />
				<tiles:putAttribute name="price" value="${redemptionProduct.price}" />
				<tiles:putAttribute name="imageUrl" value="${redemptionProduct.imageFullUrl}" />
			</tiles:insertTemplate>
				
			<div class="address-form address-form--read-only">
				<form:form modelAttribute="addressRegistrationForm">
					<h3 class="address-form__headline">Please confirm your shipping address: 
						<input type="submit" name="_eventId_editAddress" class="edit-address u-float-r" value="Edit"/>
					</h3>
					<address>
						<span class="address-form__line">${fn:escapeXml(addressRegistrationForm.name)}</span>
						<span class="address-form__line">${fn:escapeXml(addressRegistrationForm.streetLineOne)}</span>
						<span class="address-form__line">${fn:escapeXml(addressRegistrationForm.streetLineTwo)}</span>
						<span class="address-form__line">${fn:escapeXml(addressRegistrationForm.city)}, ${addressRegistrationForm.state}&nbsp;${addressRegistrationForm.zipcode}</span>
						<span class="address-form__line">${addressRegistrationForm.phoneNumber}</span>
					</address>
					<input type="hidden" name="execution" value="${flowExecutionKey}" />
					<input type="submit" name="_eventId_submitToRedeem" class="button u-cf" value="SUBMIT"/>
					<a href="/sho/red-rewards/redemption" class="cancel">Cancel</a>				
				</form:form>			
			</div>
		
		</div> <!-- / end redemption-column -->