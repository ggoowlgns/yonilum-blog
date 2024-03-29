<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Blog Category Grid</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap"/>
    <link rel="stylesheet" href="https://kit-pro.fontawesome.com/releases/v5.13.0/css/pro.min.css"/>
    <link rel="shortcut icon" type="image/png" href="./assets/images/fav.png"/>
    <!--build:css assets/css/styles.min.css-->
    <link rel="stylesheet" href="assets/css/elegant.css"/>
    <link rel="stylesheet" href="assets/css/custom_bootstrap.css"/>
    <link rel="stylesheet" href="assets/css/slick.css"/>
    <link rel="stylesheet" href="assets/css/plyr.min.css"/>
    <link rel="stylesheet" href="assets/css/style.css"/>
    <!--endbuild-->
  </head>
  <body>
    <div id="load">
      <div class="load__content">
        <div class="load__icon"><img src="assets/images/icons/load.gif" alt="Loading icon"/></div>
      </div>
    </div>
    <header class="theme-default">
      <div id="search-box">
        <div class="container">
          <form action="/" method="POST">
            <input type="text" placeholder="Searching for news" name="search"/>
            <button><i class="fas fa-arrow-right"></i></button>
          </form>
        </div>
      </div>
      <div class="container">
        <div class="header-wrapper"><a class="header__logo" href="index.ftl"><img src="./assets/images/logo.png" alt="Logo"/></a>
          <nav>
            <ul>
              <li class="nav-item"><a href="index.ftl">Home</a>
                <ul class="dropdown-menu">
                  <li><a href="index.ftl">HOMEPAGE1</a></li>
                  <li><a href="homepage2.ftl">HOMEPAGE2</a></li>
                  <li><a href="homepage3.ftl">HOMEPAGE3</a></li>
                  <li><a href="../homepage4.ftl">HOMEPAGE4</a></li>
                  <li><a href="homepage5.ftl">HOMEPAGE5</a></li>
                  <li><a href="homepage6.ftl">HOMEPAGE6</a></li>
                  <li><a href="homepage7.ftl">HOMEPAGE7</a></li>
                  <li><a href="homepage8.ftl">HOMEPAGE8</a></li>
                  <li><a href="homepage9.ftl">HOMEPAGE9</a></li>
                </ul>
              </li>
              <li class="nav-item active"><a>Blog</a>
                <ul class="dropdown-menu">
                  <li><a href="blog_category_grid.ftl">BLOG CATEGORY GRID</a></li>
                  <li><a href="../category/blog_category_list.ftl">BLOG CATEGORY LIST</a></li>
                  <li><a href="post_standard.ftl">POST STANDARD</a></li>
                  <li><a href="post_standard_image_full.ftl">POST STANDARD IMAGE FULLWIDTH</a></li>
                  <li><a href="post_standard_sidebar.ftl">POST STANDARD SIDEBAR</a></li>
                  <li><a href="../detail/post_gallery.ftl">POST GALLERY</a></li>
                  <li><a href="post_video.ftl">POST VIDEO</a></li>
                  <li><a href="post_audio.ftl">POST AUDIO</a></li>
                  <li><a href="post_quote.ftl">POST QUOTE</a></li>
                </ul>
              </li>
              <li class="nav-item"><a href="#">Pages</a>
                <ul class="dropdown-menu">
                  <li><a href="../author.ftl">AUTHOR</a></li>
                  <li><a href="../about.ftl">ABOUT</a></li>
                  <li><a href="../contact.ftl">CONTACT</a></li>
                  <li><a href="shopping/shop.ftl">SHOP</a></li>
                  <li><a href="shopping/product_detail.ftl">PRODUCT DETAIL</a></li>
                  <li><a href="shopping/cart.ftl">CART</a></li>
                  <li><a href="shopping/checkout.ftl">CHECKOUT</a></li>
                  <li><a href="../error_404.ftl">ERROR</a></li>
                </ul>
              </li>
              <li class="nav-item"><a href="../about.ftl">About</a></li>
              <li class="nav-item"><a href="../contact.ftl">Contact</a></li>
            </ul>
          </nav>
          <div class="header__icon-group"><a href="#" id="search"><i class="fas fa-search"></i></a>
            <div class="social"><a href="#"><i class="fab fa-facebook-f"></i></a><a href="#"><i class="fab fa-twitter"></i></a><a href="#"><i class="fab fa-instagram"></i></a><a href="#"><i class="fab fa-dribbble"></i></a><a id="mobile-menu-controller" href="#"><i class="fas fa-bars"></i></a></div>
          </div>
        </div>
      </div>
    </header>
    <div class="no-pd" id="content">
      <div class="container">
            <div class="breadcrumb">
              <ul>
                <li><a href="index.ftl"> <i class="fas fa-home"></i>Home</a></li>
                <li><a href="#">Blog</a></li>
                <li class="active"><a href="#">Category</a></li>
              </ul>
            </div>
        <div class="category">
          <div class="row">
            <div class="col-12 col-md-5 col-lg-4 order-md-2">
              <div class="blog-sidebar">
                <div class="blog-sidebar-section -category">
                  <div class="center-line-title"> 
                    <h5>Categories</h5>
                  </div><a class="category -bar " href="blog_category_grid.ftl">
                                  <div class="category__background" style="background-image: url(assets/images/backgrounds/category-1.png)"></div>
                                  <h5 class="title">Design</h5>
                                  <h5 class="quantity">12</h5></a><a class="category -bar " href="blog_category_grid.ftl">
                                  <div class="category__background" style="background-image: url(assets/images/backgrounds/category-2.png)"></div>
                                  <h5 class="title">Graphic</h5>
                                  <h5 class="quantity">6</h5></a><a class="category -bar " href="blog_category_grid.ftl">
                                  <div class="category__background" style="background-image: url(assets/images/backgrounds/category-3.png)"></div>
                                  <h5 class="title">Illustrator</h5>
                                  <h5 class="quantity">15</h5></a><a class="category -bar " href="blog_category_grid.ftl">
                                  <div class="category__background" style="background-image: url(assets/images/backgrounds/category-4.png)"></div>
                                  <h5 class="title">Typography</h5>
                                  <h5 class="quantity">8</h5></a>
                </div>
                <div class="blog-sidebar-section -trending-post">
                  <div class="center-line-title"> 
                    <h5>Trending post</h5>
                  </div>
                                <div class="trending-post">
                                  <div class="trending-post_image">
                                    <div class="rank">1</div><img src="assets/images/backgrounds/trending-post-1.png" alt="Shifting to Vegan Diets May Cause Brain Nutrient..."/>
                                  </div>
                                  <div class="trending-post_content">
                                    <h5>Illustrator</h5><a href="post_standard.ftl">Shifting to Vegan Diets May Cause Brain Nutrient...</a>
                                    <div class="info__time"><i class="far fa-clock"></i>
                                      <p>Seb 27, 2019</p>
                                    </div>
                                  </div>
                                </div>
                                <div class="trending-post">
                                  <div class="trending-post_image">
                                    <div class="rank">2</div><img src="assets/images/backgrounds/trending-post-2.png" alt="The GQ Men Of The Year Awards 2019: Hrithik..."/>
                                  </div>
                                  <div class="trending-post_content">
                                    <h5>Design</h5><a href="post_standard.ftl">The GQ Men Of The Year Awards 2019: Hrithik...</a>
                                    <div class="info__time"><i class="far fa-clock"></i>
                                      <p>Seb 27, 2019</p>
                                    </div>
                                  </div>
                                </div>
                                <div class="trending-post">
                                  <div class="trending-post_image">
                                    <div class="rank">3</div><img src="assets/images/backgrounds/trending-post-3.png" alt="Here's How Your Diet Can Help Yo Excel in Exams"/>
                                  </div>
                                  <div class="trending-post_content">
                                    <h5>Illustrator</h5><a href="post_standard.ftl">Here's How Your Diet Can Help Yo Excel in Exams</a>
                                    <div class="info__time"><i class="far fa-clock"></i>
                                      <p>Seb 27, 2019</p>
                                    </div>
                                  </div>
                                </div>
                                <div class="trending-post">
                                  <div class="trending-post_image">
                                    <div class="rank">4</div><img src="assets/images/backgrounds/trending-post-4.png" alt="why others accept while AudioJungle..."/>
                                  </div>
                                  <div class="trending-post_content">
                                    <h5>Graphic</h5><a href="post_standard.ftl">why others accept while AudioJungle...</a>
                                    <div class="info__time"><i class="far fa-clock"></i>
                                      <p>Seb 27, 2019</p>
                                    </div>
                                  </div>
                                </div>
                                <div class="trending-post">
                                  <div class="trending-post_image">
                                    <div class="rank">5</div><img src="assets/images/backgrounds/trending-post-5.png" alt="Podcast audio episode with YouTube license question"/>
                                  </div>
                                  <div class="trending-post_content">
                                    <h5>Typography</h5><a href="post_standard.ftl">Podcast audio episode with YouTube license question</a>
                                    <div class="info__time"><i class="far fa-clock"></i>
                                      <p>Seb 27, 2019</p>
                                    </div>
                                  </div>
                                </div>
                </div>
                <form class="subcribe-box subcribe-box" action="/" method="POST">
                  <h5>Subcribe</h5>
                  <p>Lorem ipsum dolor amet, consectetur adipiscing elit, sed tempor.</p>
                  <input placeholder="Your email" name="email" type="email"/><a class="btn -normal" href="#">Subcribe</a>
                </form>
              </div>
            </div>
            <div class="col-12 col-md-7 col-lg-8 order-md-1">
              <div class="category__header">
                <div class="category__header__text">
                  <h5>Categories:</h5><a href="#">Typography</a>
                </div>
                <div class="category__header__filter"><a class="category__header__filter__item active" href="javascript:void(0)" data-layout="grid"><i class="fas fa-th"></i></a><a class="category__header__filter__item" href="javascript:void(0)" data-layout="list"><i class="fas fa-bars"></i></a></div>
              </div>
              <div class="category_content"></div>
                  <div class="pagination">
                    <ul>
                      <li class="active"><a href="javascript:void(0)">1</a></li>
                      <li class="pagination__page-number"><a href="javascript:void(0)">2</a></li>
                      <li class="pagination__page-number"><a href="javascript:void(0)">3</a></li>
                      <li><a class="next" href="javascript:void(0)">></a></li>
                    </ul>
                  </div>
            </div>
          </div>
        </div>
        <div class="instagrams">
          <div class="instagrams-container"><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/1.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/2.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/3.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/4.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/5.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/1.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/3.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/4.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a>
          </div>
        </div>
      </div>
    </div>
    <footer>
      <div class="container">
        <div class="footer-content">
          <div class="row">
            <div class="col-12 col-md-6 col-lg-4">
              <div class="footer-col -about">
                <div class="center-line-title"> 
                  <h5>About us</h5>
                </div>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida lacus vel facilisis. </p>
                <div class="contact-method">
                  <p> <i class="fas fa-map-marker-alt"></i>5 South Main Street Los Angeles, ZZ-96110 USA</p>
                  <p> <i class="far fa-mobile-android"></i>125-711-811   |   125-668-886</p>
                  <p> <i class="fas fa-headphones-alt"></i>Support.hosting@gmail.com</p>
                </div>
              </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4">
              <div class="footer-col -feature-post">
                <div class="center-line-title"> 
                  <h5>Feature posts</h5>
                </div>
                <div class="feature-post-block">
                      <div class="post-card -tiny"><a class="card__cover" href="post_standard.ftl"><img src="assets/images/posts/1.png" alt="Looking for some feedback for this rejected track"/></a>
                        <div class="card__content">
                          <h5 class="card__content-category">Technology</h5><a class="card__content-title" href="post_standard.ftl">Looking for some feedback for this rejected track</a>
                          <div class="card__content-info">
                            <div class="info__time"><i class="far fa-clock"></i>
                              <p>Clock  Wed 02, 2019</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="post-card -tiny"><a class="card__cover" href="post_standard.ftl"><img src="assets/images/posts/2.png" alt="How to name, save and export a finish template"/></a>
                        <div class="card__content">
                          <h5 class="card__content-category">Typography</h5><a class="card__content-title" href="post_standard.ftl">How to name, save and export a finish template</a>
                          <div class="card__content-info">
                            <div class="info__time"><i class="far fa-clock"></i>
                              <p>Clock  Wed 02, 2019</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="post-card -tiny"><a class="card__cover" href="post_standard.ftl"><img src="assets/images/posts/3.png" alt="I want to create a logo with illustrator hacker"/></a>
                        <div class="card__content">
                          <h5 class="card__content-category">Graphic</h5><a class="card__content-title" href="post_standard.ftl">I want to create a logo with illustrator hacker</a>
                          <div class="card__content-info">
                            <div class="info__time"><i class="far fa-clock"></i>
                              <p>Clock  Wed 02, 2019</p>
                            </div>
                          </div>
                        </div>
                      </div>
                </div>
              </div>
            </div>
            <div class="col-12 col-md-12 col-lg-4">
              <div class="footer-col -util">
                <div class="row">
                  <div class="col-12 col-md-6 col-lg-12">
                    <div class="center-line-title"> 
                      <h5>Tag clouds</h5>
                    </div>
                    <div class="tags-group"><a class="tag-btn" href="blog_category_grid.ftl">Gutenews</a><a class="tag-btn" href="blog_category_grid.ftl">Lifestyle</a><a class="tag-btn" href="blog_category_grid.ftl">Fashion</a><a class="tag-btn" href="blog_category_grid.ftl">Technology</a><a class="tag-btn" href="blog_category_grid.ftl">Food</a><a class="tag-btn" href="blog_category_grid.ftl">Travel</a>
                    </div>
                  </div>
                  <div class="col-12 col-md-6 col-lg-12">
                    <div class="center-line-title"> 
                      <h5>Follow us</h5>
                    </div>
                    <div class="social-block"><a href="#"><i class="fab fa-facebook-f"></i></a><a href="#"><i class="fab fa-twitter"></i></a><a href="#"><i class="fab fa-instagram"></i></a><a href="#"><i class="fab fa-dribbble"></i></a></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="copyright">
          <p>© 2019, GuteNews - News Magazine WordPress Theme. All rights reserved.</p>
        </div>
      </div>
    </footer>
  </body>
</html>