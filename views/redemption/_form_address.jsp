<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/redemption/_form_address.jsp
	@type			
	@author			wlee
	@author			
	@modified		Wed Sep 17 09:50:39 EST 2014
	@desc			# form for user to enter shipping address to redeem red-rewards redemption product
	-----------------------------------------------------------------------------
	--%>
	
	<fieldset class="userInfoform:input userInfoInput">
	
		<form:label path="name"
			cssErrorClass="error"
			for="name">Name: </form:label>

		<form:input path="name"
			id="name"
			title="Please enter a name"
			cssErrorClass="error"
			cssClass="required"
			maxlength="200" />
			
		<form:label path="street"
			cssErrorClass="error"
			for="street">Address Line 1: </form:label>

		<form:input path="street"
			id="street"
			title="Please enter a shipping address"
			cssErrorClass="error"
			cssClass="required"
			maxlength="250" />
			
		<form:label path="street2"
			cssErrorClass="error"
			for="street2">Address Line 2: </form:label>

		<form:input path="street2"
			id="street2"
			title="Shipping Address Line 2"
			cssErrorClass="error"
			maxlength="250" />
			
		<form:label path="city"
			cssErrorClass="error"
			for="city">City: </form:label>

		<form:input path="city"
			id="city"
			title="Please enter a city"
			cssErrorClass="error"
			cssClass="required"
			maxlength="200" /> 
		
		<form:label path="state"
			cssErrorClass="error"
			for="state">State: </form:label>

        <form:select path="state" 
        	class="drop-down" 
        	cssClass="required">
        	
        	<form:option selected="selected" value="" label="select one..." />
        	<form:options items="${addressRegistrationForm.stateMap}" cssClass="" title="Please select a state"/>
		</form:select>
		
		<form:label path="zipcode"
			cssErrorClass="error"
			for="zipcode">ZipCode: </form:label>

		<form:input path="zipcode"
			id="zipcode"
			title="Please enter a valid 5-digit zip code"
			cssErrorClass="error"
			cssClass="required validate-digits"
			maxlength="5" />	

		<form:label path="phoneNumber"
			cssErrorClass="error"
			for="phoneNumber">Phone Number</form:label>

		<form:input path="phoneNumber"
			id="phoneNumber"
			title="Please enter a valid phone number"
			cssErrorClass="error"
			cssClass="required"
			maxlength="22" /> 

	</fieldset>
	