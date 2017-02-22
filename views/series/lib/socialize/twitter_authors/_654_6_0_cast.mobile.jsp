	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		livefyre_dev
	@file			social_collections/_654_5_0_cast.mobile.jsp
	@type			partial
	@author			droy
	@modified		03.19.13
	@note			# contains list of talent tweeters for cast module in socialize page
	@note			# currently, only ways-to-watch has the toggle behavior,
	@note			# while the more generic 'disclosure list' is static. we should change this
	@note			# so that we don't have to use the ways-to-watch classnames here
	-----------------------------------------------------------------------------
	--%>
	<div class="disclosure-list theme-twitter toggleable" data-component="sho.ui.mobile.DisclosureList">
		<div class="disclosure-list-header header-closed">
			<h1>Follow the Leads <canvas class="icon-canvas icon-down"></canvas></h1>
		</div>

		<div class="disclosure-list-menu">
			<ul>
				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/nursejackie/socialize/twitter_authors/NurseJackie-Socialize-Peter-Facinelli-Twitter-35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/peterfacinelli">Peter Facinelli</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/peterfacinelli">@peterfacinelli</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/nursejackie/socialize/twitter_authors/NurseJackie-Socialize-Anna-Deveares-Twitter-35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/AnnaDeavereS">Anna Deavere Smith</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/AnnaDeavereS ">@AnnaDeavereS </a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/nursejackie/socialize/twitter_authors/NurseJackie-Socialize-Stephen-Wallem-Twitter-35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/stephenwallem">Stephen Wallem</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/stephenwallem">@stephenwallem </a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/nursejackie/socialize/twitter_authors/NurseJackie-Socialize-Lenny-Jacobson-Twitter-35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/Lennyjacobson">Lenny Jacobson </a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/Lennyjacobson ">@Lennyjacobson </a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/nursejackie/socialize/twitter_authors/NurseJackie-Socialize-Richie-Jackson-Twitter-35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/Richie_Jackson">Richie Jackson (EP)</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/Richie_Jackson">@Richie_Jackson</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/nursejackie/socialize/twitter_authors/NurseJackie-Socialize-Arjun-Gupta-Twitter-35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/ArjunGuptaBK">Arjun Gupta</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/Arjun Gupta">@ArjunGuptaBK</a></span></h2>
				</li>
			</ul>
		</div>
	</div><!-- END modules.disclosure-list -->

			