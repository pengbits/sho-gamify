<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

JSP
--------------------------------------------------------------------------------
@site			sho.com <desktop>
@project		series
@file			_nav_secondary_dummy.jsp
@type			partial
@author			dpaul
@modified		Tue Aug 27 17:09:09 EDT 2013
@desc			# static navigation for use in interim homeland red rewards pages (which do not have access to series data to build real nav)
@note			notes
-----------------------------------------------------------------------------
--%>

		<div id="nav-secondary" class="nav docked nav-secondary">
			<span class="series-title"><a href="/sho/homeland/home">Homeland</a></span>
			<ul class="inline">
				<li id="about" class="nav-item">
					<a href="#">About</a>
				</li>
				<li id="video" class="nav-item">
					<a href="#">Video</a>
				</li>
				<li id="episode-guide" class="nav-item">
					<a href="#">Episode Guide</a>
				</li>
				<li id="socialize" class="nav-item">
					<a href="#">Community</a>
				</li>
				<li id="extras" class="nav-item">
					<a href="#">Apps &amp; Extras</a>
				</li>
				<li id="shop" class="nav-item">
					<a href="#">Shop</a>
				</li>
				<li id="red-rewards" class="nav-item">
					<a href="#">Red Rewards</a></li>
				</li>
			</ul><!-- dropdown includes -->
			<!-- about dropdown -->
			<div id="nav-content-about" class="nav-content x4">
				<div class="nav-col nav-promo" style="height: 121px;">
					<div class="nav-promo-img">
						<a data-behavior="play-video" data-video-id="22113" href="/sho/video/titles/22113/untitled" data-click-id="series_nav:about:find out more about homeland"><img src="http://www.sho.com/site/image-bin/images/804_3_0/804_3_0_abt01_144x81.jpg"><img src="/assets/images/series/lib/icons/play-video_20x20.png" class="play-icon"></a>
					</div><a data-behavior="play-video" data-video-id="22113" href="/sho/video/titles/22113/untitled" data-click-id="series_nav:about:find out more about homeland"><b>Find Out More About Homeland</b></a>
				</div>
				<div class="nav-col callout stroke-right">
					<ul style="height: 121px;">
						<li>
							<a href="/sho/homeland/about">About the Series</a>
						</li>
						<li>
							<a href="/sho/homeland/cast/17762/carrie-mathison">Carrie Mathison</a>
						</li>
						<li>
							<a href="/sho/homeland/cast/21086/nicholas-brody">Nicholas Brody</a>
						</li>
						<li>
							<a href="/sho/homeland/cast/9439/jessica-brody">Jessica Brody</a>
						</li>
						<li>
							<a href="/sho/homeland/cast/16474/saul-berenson">Saul Berenson</a>
						</li>
					</ul>
				</div>
				<div class="nav-col">
					<ul>
						<li>
							<a href="/sho/homeland/cast/9440/david-estes">David Estes</a>
						</li>
						<li>
							<a href="/sho/homeland/cast/9441/capt-mike-faber">Capt. Mike Faber</a>
						</li>
						<li>
							<a href="/sho/homeland/cast/9442/chris-brody">Chris Brody</a>
						</li>
						<li>
							<a href="/sho/homeland/cast/9443/dana-brody">Dana Brody</a>
						</li>
						<li>
							<a href="/sho/homeland/cast/5636/vice-president-walden">Vice President Walden</a>
						</li>
					</ul>
				</div>
				<div class="nav-col">
					<ul>
						<li>
							<a href="/sho/homeland/cast/9611/abu-nazir">Abu Nazir</a>
						</li>
						
					</ul>
				</div>
			</div><!-- video dropdown -->
			<div id="nav-content-video" class="nav-content x4">
				<div class="nav-col nav-promo" style="height: 121px;">
					<div class="nav-promo-img">
						<a data-behavior="play-video" data-video-id="21993" href="/sho/video/titles/21993/untitled" data-click-id="series_nav:video:watch the season 3 trailer"><img src="http://www.sho.com/site/image-bin/images/804_3_0/804_3_0_trl01_144x81.jpg"><img src="/assets/images/series/lib/icons/play-video_20x20.png" class="play-icon"></a>
					</div><a data-behavior="play-video" data-video-id="21993" href="/sho/video/titles/21993/untitled" data-click-id="series_nav:video:watch the season 3 trailer"><b>Watch the Season 3 Trailer</b></a>
				</div>
				<div class="nav-col callout stroke-right">
					<ul style="height: 121px;">
						<li>
							<a href="/sho/video/titles/18433/homeland-season-2-premiere">Season 2 Premiere Full Episode</a>
						</li>
						<li>
							<a href="/sho/homeland/video/season/1">Season 1</a>
						</li>
						<li>
							<a href="/sho/homeland/video/season/2">Season 2</a>
						</li>
						<li>
							<a href="/sho/homeland/video/season/3">Season 3</a>
						</li>
					</ul>
				</div>
				<div class="nav-col"></div>
				<div class="nav-col"></div>
			</div><!-- episode guide dropdown -->
			<div id="nav-content-episode-guide" class="nav-content x5">
				<div class="nav-col nav-promo" style="height: 121px;">
					<div class="nav-promo-img">
						<a data-behavior="play-video" data-video-id="21993" href="/sho/video/titles/21993/untitled" data-click-id="series_nav:episode:watch the season 3 trailer"><img src="http://www.sho.com/site/image-bin/images/804_3_0/804_3_0_trl01_144x81.jpg"><img src="/assets/images/series/lib/icons/play-video_20x20.png" class="play-icon"></a>
					</div><a data-behavior="play-video" data-video-id="21993" href="/sho/video/titles/21993/untitled" data-click-id="series_nav:episode:watch the season 3 trailer"><b>Watch the Season 3 Trailer</b></a>
				</div>
				<div class="nav-col">
					<ul>
						<li>
							<a href="/sho/homeland/season/3">Season 3</a>
						</li>
						<li>
							<a href="/sho/homeland/season/3/episode/1">Episode 1</a>
						</li>
					</ul>
				</div>
				<div class="nav-col callout stroke-left">
					<ul style="height: 121px;">
						<li>
							<a href="/sho/homeland/season/1">Season 1</a>
						</li>
						<li>
							<a href="/sho/homeland/season/2">Season 2</a>
						</li>
					</ul>
				</div>
			</div><!-- socialize dropdown -->
			<div id="nav-content-socialize" class="nav-content x4">
				<div class="nav-col nav-promo" style="height: 121px;">
					<div class="nav-promo-img">
						<a href="/sho/homeland/socialize" data-behavior="track-click" data-click-id="series_nav:socialize:join the conversation"><img src="http://www.sho.com/assets/images/series/homeland/s1/promos/804_1_0_prm-socialize_144x81.jpg"></a>
					</div><a href="/sho/homeland/socialize" data-behavior="track-click" data-click-id="series_nav:socialize:join the conversation"><b>Join the Conversation</b></a>
				</div>
				<div class="nav-col callout stroke-right">
					<ul style="height: 121px;">
						<li>
							<a href="/sho/homeland/socialize">Socialize</a>
						</li>
						<li>
							<a href="https://www.facebook.com/HomelandOnShowtime">Facebook</a>
						</li>
						<li>
							<a href="http://www.twitter.com/SHO_Homeland">Twitter</a>
						</li>
						<li>
							<a href="http://getglue.com/tv_shows/homeland">GetGlue</a>
						</li>
						<li>
							<a href="https://plus.google.com/+HomelandOnShowtime/posts">Google+</a>
						</li>
					</ul>
				</div>
				<div class="nav-col">
					<ul>
						<li>
							<a href="http://pinterest.com/shonetworks/">Pinterest</a>
						</li>
						<li>
							<a href="http://instagram.com/showtime">Instagram</a>
						</li>
						<li>
							<a href="http://www.sho.com/site/message/boards.do?groupid=1633">Message Boards</a>
						</li>
					</ul>
				</div>
			</div><!-- apps & extras dropdown -->
			<div id="nav-content-extras" class="nav-content x3">
				<div class="nav-col nav-promo" style="height: 121px;">
					<div class="nav-promo-img">
						<a href="http://itunes.apple.com/us/app/id462311198?mt=8" data-behavior="track-click" data-click-id="series_nav:extras:download the showtime sync app for ipad"><img src="http://www.sho.com/site/image-bin/images/0_0_0/0_0_0_prm-shosyncgen_144x81.jpg"></a>
					</div><a href="http://itunes.apple.com/us/app/id462311198?mt=8" data-behavior="track-click" data-click-id="series_nav:extras:download the showtime sync app for ipad"><b>Download the Showtime Sync App for iPad</b></a>
				</div>
				<div class="nav-col callout stroke-right">
					<ul style="height: 121px;">
						<li>
							<a href="/sho/homeland/extras">All Apps &amp; Extras</a>
						</li>
						<li>
							<a href="http://ad.apps.fm/4DvcoZStUSKwmGmxo8Zo66914wHrDm-B2krNaaQ_1TOzni7UebzjtmglWn0K0RKjP7ww8D5FpYNUktHIhG7Wo6UamcgRKwRyofz5S_DexOQ">Showtime Sync App for iPad</a>
						</li>
						<li>
							<a href="http://www.youtube.com/watch?v=z1qCW2gnkbE">Interactive Surveillance Game</a>
						</li>
						<li>
							<a href="/sho/homeland/extras">Carrie's Wall Wallpaper</a>
						</li>
						<li>
							<a href="/sho/promotions/whats-the-diff">What's the Diff?</a>
						</li>
					</ul>
				</div>
				<div class="nav-col">
					<ul>
						<li>
							<a href="/sho/homeland/extras">Podcasts</a>
						</li>
					</ul>
				</div>
				<div class="nav-col"></div>
			</div><!-- shop dropdown -->
			<div id="nav-content-shop" class="nav-content x4">
				<div class="nav-col nav-promo" style="height: 121px;">
					<div class="nav-promo-img">
						<a href="http://store.sho.com/homeland-the-complete-first-season-dvd/detail.php?p=374146&amp;v=showtime_shows_homeland&amp;ecid=PRF-SHO-S01760&amp;pa=PRF-SHO-S01760" data-behavior="track-click" data-click-id="series_nav:shop:buy the homeland season 1 dvd today"><img src="http://www.sho.com/site/image-bin/images/804_2_0/804_2_0_prm-homedvd_144x81.jpg"></a>
					</div><a href="http://store.sho.com/homeland-the-complete-first-season-dvd/detail.php?p=374146&amp;v=showtime_shows_homeland&amp;ecid=PRF-SHO-S01760&amp;pa=PRF-SHO-S01760" data-behavior="track-click" data-click-id="series_nav:shop:buy the homeland season 1 dvd today"><b>Buy the Homeland Season 1 DVD Today</b></a>
				</div>
				<div class="nav-col">
					<ul>
						<li>
							<a data-behavior="track-click" data-click-id="navigation:shop" href="http://store.sho.com/homeland-the-complete-first-season-dvd/detail.php?p=374146&amp;v=showtime_shows_homeland&amp;ecid=PRF-SHO-S01438&amp;pa=PRF-SHO-S01438">Season 1 on DVD</a>
						</li>
						<li>
							<a data-behavior="track-click" data-click-id="navigation:itunes" href="http://itunes.apple.com/au/tv-season/homeland-season-1/id494918009">Apple iTunes</a>
						</li>
						<li>
							<a data-behavior="track-click" data-click-id="navigation:amazon" href="http://www.amazon.com/gp/product/B00932HEX2">Amazon Instant Video</a>
						</li>
						<li>
							<a data-behavior="track-click" data-click-id="navigation:shop" href="http://store.sho.com/homeland/index.php?v=showtime_shows_homeland&amp;ecid=PRF-SHO-S01355&amp;pa=PRF-SHO-S01355">T-Shirts</a>
						</li>
						<li>
							<a data-behavior="track-click" data-click-id="navigation:shop" href="http://store.sho.com/homeland-logo-zip-hoodie/detail.php?p=457918&amp;v=showtime_shows_homeland">Homeland Sweatshirt</a>
						</li>
					</ul>
				</div>
				<div class="nav-col">
					<ul>
						<li>
							<a data-behavior="track-click" data-click-id="navigation:shop" href="http://store.sho.com/new-arrivals/index.php?v=showtime_new-arrivals&amp;ecid=PRF-SHO-S01250&amp;pa=PRF-SHO-S01250">Showtime New Arrivals</a>
						</li>
						<li>
							<a data-behavior="track-click" data-click-id="navigation:shop" href="http://showtime.seenon.com/best-sellers/index.php?v=showtime_bestsellers&amp;ecid=PRF-SHO-S00902&amp;pa=PRF-SHO-S00902">Showtime Best Sellers</a>
						</li>
					</ul>
				</div>
				<div class="nav-col"></div>
			</div><!-- content dropdown -->
			<div id="nav-content-red-rewards" class="nav-content x1 aktiv" style="display: block;">
				<div class="nav-col nav-promo" style="height: 121px;">												
					<div class="nav-promo-img">
						<a href="/sho/homeland/red-rewards/challenges" data-behavior="track-click" data-click-id="series_nav:redrewards:Earn Points for Being a Fan"><img src="http://www.sho.com/site/image-bin/images/0_0_0/0_0_0_prm-redrewards_144x81.jpg"></a>				
					</div>
					<a href="/sho/homeland/red-rewards/challenges" data-behavior="track-click" data-click-id="series_nav:redrewards:Earn Points for Being a Fan"><b>Earn Points for Being a Fan</b></a>
				</div>



					<div class="nav-col">
						<ul>
							<li><a href="/sho/homeland/red-rewards/challenges">Challenges</a></li>
							<li><a href="/sho/homeland/red-rewards/achievements">Achievements</a></li>
							<li><a href="/sho/homeland/red-rewards/leaderboards">Leaderboards</a></li>
							<li><a href="/sho/homeland/red-rewards/faq">FAQ</a></li>
						</ul>
					</div>

				</div>
		</div>
