<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Tigris - Personal Portfolio Template" />
	<meta name="keywords" content="business card, creative, creative portfolio, cv theme, online resume, personal, portfolio, professional cv, responsive portfolio, resume, resume theme, vcard" />
	<meta name="author" content="beingeorge" />
	<meta name="theme-color" content="#1f1f20">

	<title>Tigris - Personal Portfolio Template</title>

	<!-- CSS -->
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">

	<!-- Font Awesome CSS -->
	<link href="assets/css/all.css" rel="stylesheet" media="screen">

	<!--[if lte IE 7]> 
		<script src="assets/js/icons-lte-ie7.js"></script>
	<![endif]-->

	<link href="assets/css/vendor.css" rel="stylesheet">

	<!-- Tigris styles CSS -->
	<link href="assets/css/Tigris.css" rel="stylesheet" media="screen">


	<link href="assets/css/custom.css" rel="stylesheet" media="screen">
</head>
<body>

	<!-- Preloader : Start -->

	<div id="loading">
		<div id="loading-center">
			<div class="spinner-grow" role="status">
			  <span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>

	<!-- Preloader : End  -->


	<div class="menu-wrapper">
		<button class="hamburger-menu">
			<span class='hamburger'></span>
			<span class='hamburger-overlay'></span>	
		</button>
		<div class="Menu ham-tilt">
			<ul class="Menu-list" >
				<li class="Menu-list-item">
					<a href="#home">Home</a>
				</li>
				<li class="Menu-list-item">
					<a href="#portfolio">Work</a>
				</li>
				<li class="Menu-list-item">
					<a href="#services">Services</a>
				</li>
				<li class="Menu-list-item">
					<a href="#blog">Blog</a>
				</li>
				<li class="Menu-list-item">
					<a href="#contact">Contact</a>
				</li>
			</ul>
		</div>
	</div>

	<!-- Home Banner : Start -->

	<section id="home" class="home-banner module-image js-height-full">
		
		<div class="hero-banner-content d-flex align-items-center">
			<div class="container">
				<div class="d-table">
					<div class="hero-banner-left d-table-cell w-60 v-align-middle">
						<div class="intro">
							<h3>Hello,</h3>
							<h1>나는 <span>김지연 이오</span></h1>
							<p class="typed" data-elements="한낱 백수, 한낱 외룡생, 한낱 취준생"> </p>
						</div>
					</div>
					<div class="hero-banner-right d-table-cell w-40 v-align-middle">
						<div class="hero-right"  id="scene">
							<img  data-depth="0.5" src="assets/images/about.jpg" alt="side-image">
							<span data-depth="1"></span>
						</div>
					</div>
				</div>
			</div>
		</div>	
		
		<canvas class="background"></canvas>
	
	</section>

	<!-- Home Banner : End -->

    <!-- Blog start -->

    	<section id="blog" class="module blog ">
    		<div class="container">

    			<div class="module-header wow fadeInUp">
    				<h2 class="module-title"> Articles </h2>
    				<div class="module-line"></div>
    			</div>

    			<div class="row">

    				<div class="col-sm-6">
    					<a href="blog-detail.html" class="blogList wow fadeInUp">
    						<div class="blogList-img">
    							<img src="assets/images/blog1.jpg" alt="Blog Desc">
    							<span>Design</span>
    						</div>
    						<div class="blogList-desc">
    							<h3>10 tips for drawing with coloured pencils</h3>
    							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...</p>
    						</div>
    					</a>
    				</div>

    				<div class="col-sm-6">
    					<a href="blog-detail.html" class="blogList wow fadeInUp">
    						<div class="blogList-img">
    							<img src="assets/images/blog2.jpg" alt="Blog Desc">
    							<span>Travel</span>
    						</div>
    						<div class="blogList-desc">
    							<h3>The single greatest gift to get your friend who always travels</h3>
    							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...</p>
    						</div>
    					</a>
    				</div>

    				<div class="col-sm-12">
    					<a class="custom-btn blog-viewMore" href="blog.ftl">VIEW MORE</a>
    				</div>

    			</div>
    		</div><!-- .container -->
    	</section>

    	<!-- Blog end -->
	<!-- Portfolio start -->

	<section id="portfolio" class="module module-gray">
		<div class="container">
			<div class="row">

				<div class="module-header wow fadeInUp">
					<h2 class="module-title"> My works </h2>
					<div class="module-line"></div>
				</div>

			</div><!-- .row -->

			<!-- Portfolio Filter start-->

			<div class="row">

				<div class="col-sm-12">

					<ul id="filter" class=" wow fadeInUp">
						<li class="active" data-group="all">All</li>
						<li data-group="slideshow">Slideshow</li>
						<li data-group="video">Video</li>
						<li data-group="image">Image</li>
					</ul>

				</div>

			</div><!-- .row -->

			<!-- Portfolio Filter end -->

			<ul class="list-items-container">

				<li class="list-item" data-groups="all slideshow">
					<figure>
						<img src="assets/images/p1-1.jpg" alt="p1">
						<figcaption>
							<a href="assets/images/p1-1.jpg" class="simple-ajax-popup"></a>
							<div class="caption-inner">
								<h3 class="portfolio-item-title">Some work</h3>
								<div class="portfolio-item-desc">Slideshow</div>
							</div>
						</figcaption>
					</figure>
				</li>

				<li class="list-item" data-groups="all video">
					<figure>
						<img src="assets/images/p2-2.jpg" alt="p2">
						<figcaption>
							<a href="assets/images/p2-2.jpg" class="simple-ajax-popup"></a>
							<div class="caption-inner">
								<h3 class="portfolio-item-title">Some work</h3>
								<div class="portfolio-item-desc">Video</div>
							</div>
						</figcaption>
					</figure>
				</li>

				<li class="list-item" data-groups="all image">
					<figure>
						<img src="assets/images/p3-3.jpg" alt="p3">
						<figcaption>
							<a href="assets/images/p3-3.jpg" class="simple-ajax-popup"></a>
							<div class="caption-inner">
								<h3 class="portfolio-item-title">Some work</h3>
								<div class="portfolio-item-desc">Image</div>
							</div>
						</figcaption>
					</figure>
				</li>

				<li class="list-item" data-groups="all slideshow">
					<figure>
						<img src="assets/images/p4-4.jpg" alt="p4">
						<figcaption>
							<a href="assets/images/p4-4.jpg" class="simple-ajax-popup"></a>
							<div class="caption-inner">
								<h3 class="portfolio-item-title">Some work</h3>
								<div class="portfolio-item-desc">Slideshow</div>
							</div>
						</figcaption>
					</figure>
				</li>

				<li class="list-item" data-groups="all video">
					<figure>
						<img src="assets/images/p5-5.jpg" alt="p5">
						<figcaption>
							<a href="assets/images/p5-5.jpg" class="simple-ajax-popup"></a>
							<div class="caption-inner">
								<h3 class="portfolio-item-title">Some work</h3>
								<div class="portfolio-item-desc">Video</div>
							</div>
						</figcaption>
					</figure>
				</li>

				<li class="list-item" data-groups="all image">
					<figure>
						<img src="assets/images/p6-6.jpg" alt="p6">
						<figcaption>
							<a href="assets/images/p6-6.jpg" class="simple-ajax-popup"></a>
							<div class="caption-inner">
								<h3 class="portfolio-item-title">Some work</h3>
								<div class="portfolio-item-desc">Image</div>
							</div>
						</figcaption>
					</figure>
				</li>

				<li class="list-item" data-groups="all image">
					<figure>
						<img src="assets/images/p7-7.jpg" alt="p6">
						<figcaption>
							<a href="assets/images/p7-7.jpg" class="simple-ajax-popup"></a>
							<div class="caption-inner">
								<h3 class="portfolio-item-title">Some work</h3>
								<div class="portfolio-item-desc">Image</div>
							</div>
						</figcaption>
					</figure>
				</li>

				<li class="list-item" data-groups="all image">
					<figure>
						<img src="assets/images/p8-8.jpg" alt="p6">
						<figcaption>
							<a href="assets/images/p8-8.jpg" class="simple-ajax-popup"></a>
							<div class="caption-inner">
								<h3 class="portfolio-item-title">Some work</h3>
								<div class="portfolio-item-desc">Image</div>
							</div>
						</figcaption>
					</figure>
				</li>

				<li class="list-item" data-groups="all image">
					<figure>
						<img src="assets/images/p9-9.jpg" alt="p6">
						<figcaption>
							<a href="assets/images/p9-9.jpg" class="simple-ajax-popup"></a>
							<div class="caption-inner">
								<h3 class="portfolio-item-title">Some work</h3>
								<div class="portfolio-item-desc">Image</div>
							</div>
						</figcaption>
					</figure>
				</li>

			</ul><!-- .projects-container -->

		</div><!-- .contaier -->

	</section>

	<!-- Portfolio end -->

	<!-- Services start -->

	<section id="services" class="module">
		<div class="container">

			<div class="module-header wow fadeInUp">
				<h2 class="module-title"> My Services </h2>
				<div class="module-line"></div>
			</div>

			<div class="row">

				<div class="col-md-6 col-lg-4">
					<div class="iconbox wow fadeInUp">
						<div class="iconbox-icon">
							<i class="fas fa-desktop"></i>
						</div>
						<div class="iconbox-text">
							<h3 class="iconbox-title">Web Design</h3>
							<div class="iconbox-desc">
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4">
					<div class="iconbox wow fadeInUp">
						<div class="iconbox-icon">
							<i class="fas fa-code"></i>
						</div>
						<div class="iconbox-text">
							<h3 class="iconbox-title">Web Development</h3>
							<div class="iconbox-desc">
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4">
					<div class="iconbox wow fadeInUp" data-wow-delay=".2s">
						<div class="iconbox-icon">
							<i class="fab fa-sketch"></i>
						</div>
						<div class="iconbox-text">
							<h3 class="iconbox-title">Logo Design</h3>
							<div class="iconbox-desc">
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-4">

					<div class="iconbox wow fadeInUp" data-wow-delay=".4s">
						<div class="iconbox-icon">
							<i class="far fa-comments"></i>
						</div>
						<div class="iconbox-text">
							<h3 class="iconbox-title">Marketing</h3>
							<div class="iconbox-desc">
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...
							</div>
						</div>
					</div>

				</div>

				<div class="col-md-6 col-lg-4">

					<div class="iconbox wow fadeInUp" data-wow-delay=".6s">
						<div class="iconbox-icon">
							<i class="fas fa-palette"></i>
						</div>
						<div class="iconbox-text">
							<h3 class="iconbox-title">Design</h3>
							<div class="iconbox-desc">
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...
							</div>
						</div>
					</div>

				</div>

				<div class="col-md-6 col-lg-4">

					<div class="iconbox wow fadeInUp" data-wow-delay=".8s">
						<div class="iconbox-icon">
							<i class="fas fa-rocket"></i>
						</div>
						<div class="iconbox-text">
							<h3 class="iconbox-title">Branding</h3>
							<div class="iconbox-desc">
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...
							</div>
						</div>
					</div>

				</div>

			</div><!-- .row -->
		</div><!-- .container -->
	</section>

	<!-- Services end -->


	<!-- Testimonial start -->

	<div id="testimonial" class="module module-gray text-center">
		<div class="container">
			
			<div class="module-header wow fadeInUp">
				<h2 class="module-title"> Testimony </h2>
				<div class="module-line"></div>
			</div>

			<div class="row">

				<div class="col-md-8 offset-md-2 wow fadeInUp">

					<div class="wow fadeInUp">
						<div class="module-icon"><i class="fas fa-quote-left"></i></div>
					</div>

					<div class="testimonials owl-carousel wow fadeInUp">
						<div class="single-testimonials">
							<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica.</p>
							<h3>Jon Doe, Web Developer</h3>
						</div>
						<div class="single-testimonials">
							<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica.</p>
							<h3>Jon Doe, Web Developer</h3>
						</div>
						<div class="single-testimonials">
							<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica.</p>
							<h3>Jon Doe, Web Developer</h3>
						</div>
					</div>

				</div>

			</div><!-- .row -->
		</div><!-- .container -->
	</div>

	<!-- Testimonial end -->



	<!-- Hire start-->

	<div class="module module-gray text-center">
		<div class="container">	
			<div class="module-header wow fadeInUp">
				<h2 class="module-title">I am available for Freelancer
				</h2>
				<div class="module-line"></div>
			</div>

			<button class="custom-btn">Hire Me</button>
		</div>
	</div>

	<!-- Hire end -->

	<!-- Contact start -->

	<section id="contact" class="module ">
		<div class="container">

			<div class="module-header wow fadeInUp">
				<h2 class="module-title"> Contact </h2>
				<div class="module-line"></div>
			</div>

			<div class="row">

				<div class="col-md-6 offset-md-3">

					<form method="post" action="php/contact.php" id="contactForm"  data-toggle="validator">
						<div class="form-group mb-3 wow fadeInUp">
							<input name="name" id="name" type="text" class="form-control b-box" placeholder="* Your Name " required>
						</div>
						<div class="form-group mb-3 wow fadeInUp" data-wow-delay=".1s">
							<input name="email" id="email" type="email" class="form-control b-box" placeholder="* Your Email" required>
						</div>

						<div class="form-group mb-3 wow fadeInUp" data-wow-delay=".2s">
							<input type="text" class="form-control b-box" id="subject" placeholder="* Your Subject.." required>
						</div>

						<div class="form-group mb-3 wow fadeInUp" data-wow-delay=".3s">
							<textarea name="comments" id="comments" rows="4" class="form-control b-box" placeholder="* Your message..."></textarea>
						</div>
						<div class="form-group mb-3 wow fadeInUp" data-wow-delay=".3s">
							<button type="submit" class="submitBnt btn btn-block custom-btn wow fadeInUp">Send</button>
						</div>
					</form>

				</div>

			</div><!-- .row -->
		</div><!-- .container -->
	</section>

	<!-- Contact end -->

	<!-- Footer start -->

	<footer id="footer" class="module-gray">
		<div class="container">
			<div class="row">

				<div class="col-sm-12">

					<a href="#home" class="footer-logo"><h2>Tigris</h2></a>

					<ul class="social-links">
						<li><a href="#" class="wow fadeInUp">Facebook</a></li>
						<li><a href="#" class="wow fadeInUp" data-wow-delay=".1s">Twitter</a></li>
						<li><a href="#" class="wow fadeInUp" data-wow-delay=".2s">Dribble</a></li>
						<li><a href="#" class="wow fadeInUp" data-wow-delay=".3s">Linkedin</a></li>
						<li><a href="#" class="wow fadeInUp" data-wow-delay=".4s">Pinterest</a></li>
					</ul>

					<p class="copyright wow fadeInUp">
						© 2020 beingeorge, All Rights Reserved.
					</p>

				</div>

			</div><!-- .row -->
		</div><!-- .container -->
	</footer>

	<!-- Footer end -->

	<!-- Scroll-up -->

	<div class="scroll-up">
		<a href="#home" id="scroll-up"><i class="fas fa-arrow-up"></i></a>
	</div>

	<!-- Javascript files -->

	<script src="assets/js/vendor.js"></script>
	
	<!-- Popper JS -->
	<script src="assets/bootstrap/js/popper.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>

	<!-- Contact scripts -->
	<script src="assets/js/contact.js"></script>

	<!-- Custom scripts -->
	<script src="assets/js/custom.js"></script>
	<script src="assets/js/custom-shuffle-init.js"></script>

</body>
</html>