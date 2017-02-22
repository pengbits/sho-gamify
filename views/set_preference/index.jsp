<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

JSP
--------------------------------------------------------------------------------
@site			sho.com <desktop>
@project		gamify
@file			gamify/set_preference/index.jsp
@type			page
@author			nwebb
@modified		04.03.14
@desc			set preference stub
@note			notes
-----------------------------------------------------------------------------
--%>

<style>
	.set-preference {
		padding:20px;
		background:#fff;
	}
		
	.set-preference p {
		font-size:14px;
		line-height:24px;
		margin-bottom:15px;
	}
		
	.set-preference .btn {
		display:inline-block;
		padding:5px 10px;
		color:#FFF;
		background:#666;
		border-radius:5px 5px 5px 5px;
	}
</style>

<div class="set-preference">
	<p><a href="#" class="btn" id="set-preference">Set Anonymous = True</a></p>
	<p><a href="#" class="btn" id="remove-preference">Remove Anonymous Preference</a></p>
</div>


