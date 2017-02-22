	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/canonical_url/show.jsp
	@type			page
	@author			dpaul	
	@desc			canonical url for a challenge.
	@todo 			# change gallery url from  /sho/dexter/red-rewards/challenges to /sho/red-rewards/featured-challenges  w/ release
	--------------------------------------------------------------------------------
	--%>
		
	<h1>Redirecting to Challenge...</h1>
	<pre>
		
	CHALLENGE DATA
	---------------------------------------------------------------
	<c:if test="${!empty data && !empty data.challenge && !empty data.challenge.name}">
	
	mode : '${development_mode}',
	name : '${data.challenge.name}',
	id : '${data.challenge.id}',
	description : '${data.challenge.description}',
	folderName : '${data.challenge.folderName}',
	pointAward : '${data.challenge.pointAward}',
	pointCategory : '${data.challenge.pointCategory}',
	dateIssued : '${data.challenge.dateIssued}',
	iconUrl : '${data.challenge.iconUrl}',
	fullUrl : '${data.challenge.fullUrl}',
	thumbUrl : '${data.challenge.thumbUrl}',
	actionPhrase : '${data.challenge.actionPhrase}',
	ruleList : [],
	rewardList : [],
	homeBaseUrl : '${data.homeBaseUrl}'
	<c:if test="${!empty data.homeBaseUrl}"><c:set var="challengeUrl" value="${data.homeBaseUrl}" />
	challengeUrl: '${data.homeBaseUrl}'
	</c:if>
	
	META OUTPUT
	---------------------------------------------------------------
	title: '${title}'
	description: '${description}'
	pageTracking: '${pageTracking}'
	og:site_name: 'SHO.com'
	og:type: 'tv_show'			
	og_title: '${og_title}'
	og_image: '${og_image}'
	og_description: '${og_description}'
	og_url: '${og_url}'
	
	</c:if>
	
	<c:if test="${empty challengeUrl }">
	<c:set var="challengeUrl" value="/sho/red-rewards/featured-challenges" />

	<c:if test="${!empty data.url}">
		<c:set var="challengeUrl">${challengeUrl}#${fn:substringAfter(data.url, '?name=')}</c:set>
	</c:if>
	No challenge data found.
	</c:if>
	
	<span class="countdown">
	Redirecting to `${challengeUrl}` in <span class="countdown-seconds">${development_mode ? '5' : '1'}</span> seconds.. <a class="cancel" href="#">cancel</a>
	</span>
	</pre>
	
	<script type="text/javascript">
	sho.dom.ready(function()
	{
		var el = sho.$('.countdown-seconds'),
		i=Number(el.html()),
	    
		challengeUrl = 	'${challengeUrl}',
	    
		tick = (function(){
			el.html(i); i--; 
			if(i==0)
			{
				clearInterval(intvl);
				redirectToChallenge()
			}
			// log(i)
		}),
        
		redirectToChallenge = (function()
		{
			window.location = challengeUrl;
		}),
        
		intvl = setInterval(tick, 1000);
        
		sho.$('.cancel').on('click', function(e)
		{
			log('cancelled redirect to `'+challengeUrl+'`')
			clearInterval(intvl);
		})

	})
	</script>