<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

JSP
--------------------------------------------------------------------------------
@site			sho.com <mobile>
@project		livefyre_dev
@file			social_collections/_805_3_0_cast.mobile.jsp
@type			partial
@author			dmccleod
@modified		01.14.13
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
				<span class="twitter-avatar"><img src="/assets/images/series/houseoflies/socialize/twitter_authors/35x35/IamDonCheadle_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/IAmDonCheadle">Don Cheadle</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/IAmDonCheadle">@IAmDonCheadle</a></span></h2>
			</li>

			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/houseoflies/socialize/twitter_authors/35x35/IMKristenBell_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/IMKristenBell">Kristen Bell</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/IMKristenBell">@IMKristenBell</a></span></h2>
			</li>

			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/houseoflies/socialize/twitter_authors/35x35/joshlaw81_35x35.png" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/JoshLaw81">Josh Lawson</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/JoshLaw81">@JoshLaw81</a></span></h2>
			</li>

			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/houseoflies/socialize/twitter_authors/35x35/rejectedjokes_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/RejectedJokes">Ben Schwartz</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/RejectedJokes">@RejectedJokes</a></span></h2>
			</li>

			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/houseoflies/socialize/twitter_authors/35x35/DawnOlivieri_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/DawnOlivieri">Dawn Olivieri</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/DawnOlivieri">@DawnOlivieri</a></h2>
			</li>

			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/houseoflies/socialize/twitter_authors/35x35/LisaEdelstein_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/LisaEdelstein">Lisa Edelstein</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/LisaEdelstein">@LisaEdelstein</a></h2>
			</li>

			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/houseoflies/socialize/twitter_authors/35x35/LarenzTate_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/LarenzTate">Larenz Tate</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/LarenzTate">@LarenzTate</a></h2>
			</li>

			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/houseoflies/socialize/twitter_authors/35x35/NiaLong_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/NiaLong">Nia Long</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/NiaLong">@NiaLong</a></h2>
			</li>

			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/houseoflies/socialize/twitter_authors/35x35/JessikaBTweets_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/JessikaBTweets">Jessika Borsiczky</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/JessikaBTweets">@JessikaBTweets</a></h2>
			</li>			
		</ul>
	</div>
</div><!-- END modules.ways_to_watch -->

