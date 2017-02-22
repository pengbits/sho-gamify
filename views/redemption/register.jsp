<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><%-- 

JSP
--------------------------------------------------------------------------------
@site			sho.com <rebuild>
@project		gamify
@file			gamify/views/redemption/register.jsp
@type			page
@author			wlee	
@desc			# register new address to redeem
--------------------------------------------------------------------------------
--%>
<!-- redemption-content  -->
<div class="redemption-column">		
	<tiles:insertTemplate template="/gamify/views/redemption/_product.jsp">
		<tiles:putAttribute name="name" value="${redemptionProduct.name}" />
		<tiles:putAttribute name="description" value="${redemptionProduct.description}" />
		<tiles:putAttribute name="price" value="${redemptionProduct.price}" />
		<tiles:putAttribute name="imageUrl" value="${redemptionProduct.imageFullUrl}" />
	</tiles:insertTemplate>

	<div class="address-form">		
		<form:form method="post" modelAttribute="addressRegistrationForm">					
			<legend class="address-form__headline">Please enter your shipping address:</legend>
			<form:errors path="*" cssClass="errorMsg" />

				<fieldset class="userInfoform:input userInfoInput">			
					<form:label path="name" cssErrorClass="error u-float-l" cssClass="u-float-l" for="name">Name:</form:label>
					<form:input path="name" id="name" cssErrorClass="error u-float-r input-long" cssClass="u-float-r input-long" title="Enter your full name" maxlength="200" required="required" />	
				
				 	<form:label path="streetLineOne" cssErrorClass="error u-float-l" cssClass="u-float-l" for="address1">Address Line 1:</form:label>
					<form:input path="streetLineOne" id="address1" cssErrorClass="error u-float-r input-long" cssClass="u-float-r input-long" title="Enter your street address" maxlength="250" required="required" />
				
					<form:label path="streetLineTwo" cssErrorClass="error" cssClass="u-float-l" for="address2">Address Line 2:</form:label>
					<form:input path="streetLineTwo" id="address2" cssClass="u-float-r input-long" maxlength="250" />
				
					<form:label path="city" cssErrorClass="error u-float-l" cssClass="u-float-l" for="city">City:</form:label>
					<form:input path="city" id="city" cssErrorClass="error u-float-r input-long" cssClass="u-float-r input-long" title="Enter a city name" maxlength="200" required="required" />
							
					<form:label path="state" cssErrorClass="error u-float-l" cssClass="u-float-l" for="state">State:</form:label>
					<div class="select-wrapper u-float-l">
						<form:select path="state" id="state" cssErrorClass="error state" class="state" title="Select a state">
							<form:option selected="selected" value="" label="select one..." />
							<form:options items="${addressRegistrationForm.stateMap}" />
						</form:select>
						<span class="select-arrow u-float-l">&#x25BC;</span>
					</div>
			
				<form:input path="zipcode" id="zipCode" cssErrorClass="error u-float-r zip-code" cssClass="u-float-r zip-code" title="Enter a 5-digit zip code" maxlength="5" required="required" />
				<form:label path="zipcode" cssErrorClass="error u-float-r" cssClass="u-float-r" for="zipCode">Zip Code:</form:label>
										
				<form:label path="phoneNumber" cssErrorClass="error u-float-l" cssClass="u-float-l" for="phone">Phone:</form:label>
				<form:input path="phoneNumber" pattern="^([0-9\-]{10,})$" type="tel" id="phone" cssErrorClass="error u-float-l" cssClass="u-float-l" placeholder="  -      -  " title="Use the format xxx-xxx-xxxx" maxlength="22" required="required" />
			</fieldset>
		
			<fieldset>	
				<input type="hidden" name="execution" value="${flowExecutionKey}" />		
				<button name="_eventId_saveToRedeem" class="button">next</button>
			</fieldset>			
		</form:form>
		<a href="/sho/red-rewards/redemption" class="cancel">Cancel</a>
	</div>
</div> <!-- / end redemption-content -->

<script>
	(function($){
		// loads custom form elements
		$("select, input:checkbox, input:radio, input:file").uniform();
	})(sho.$)
</script>