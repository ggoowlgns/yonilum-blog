<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Checkout</title>
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
        <div class="header-wrapper"><a class="header__logo" href="index.html"><img src="./assets/images/logo.png" alt="Logo"/></a>
          <nav>
            <ul>
              <li class="nav-item"><a href="index.html">Home</a>
                <ul class="dropdown-menu">
                  <li><a href="index.html">HOMEPAGE1</a></li>
                  <li><a href="homepage2.html">HOMEPAGE2</a></li>
                  <li><a href="homepage3.html">HOMEPAGE3</a></li>
                  <li><a href="homepage4.html">HOMEPAGE4</a></li>
                  <li><a href="homepage5.html">HOMEPAGE5</a></li>
                  <li><a href="homepage6.html">HOMEPAGE6</a></li>
                  <li><a href="homepage7.html">HOMEPAGE7</a></li>
                  <li><a href="homepage8.html">HOMEPAGE8</a></li>
                  <li><a href="homepage9.html">HOMEPAGE9</a></li>
                </ul>
              </li>
              <li class="nav-item"><a>Blog</a>
                <ul class="dropdown-menu">
                  <li><a href="blog_category_grid.html">BLOG CATEGORY GRID</a></li>
                  <li><a href="blog_category_list.html">BLOG CATEGORY LIST</a></li>
                  <li><a href="post_standard.html">POST STANDARD</a></li>
                  <li><a href="post_standard_image_full.html">POST STANDARD IMAGE FULLWIDTH</a></li>
                  <li><a href="post_standard_sidebar.html">POST STANDARD SIDEBAR</a></li>
                  <li><a href="post_gallery.html">POST GALLERY</a></li>
                  <li><a href="post_video.html">POST VIDEO</a></li>
                  <li><a href="post_audio.html">POST AUDIO</a></li>
                  <li><a href="post_quote.html">POST QUOTE</a></li>
                </ul>
              </li>
              <li class="nav-item active"><a href="#">Pages</a>
                <ul class="dropdown-menu">
                  <li><a href="author.html">AUTHOR</a></li>
                  <li><a href="about.html">ABOUT</a></li>
                  <li><a href="contact.html">CONTACT</a></li>
                  <li><a href="shop.html">SHOP</a></li>
                  <li><a href="product_detail.html">PRODUCT DETAIL</a></li>
                  <li><a href="cart.html">CART</a></li>
                  <li><a href="checkout.html">CHECKOUT</a></li>
                  <li><a href="error_404.html">ERROR</a></li>
                </ul>
              </li>
              <li class="nav-item"><a href="about.html">About</a></li>
              <li class="nav-item"><a href="contact.html">Contact</a></li>
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
                <li><a href="index.html"> <i class="fas fa-home"></i>Home</a></li>
                <li><a href="#">Blog</a></li>
                <li class="active"><a href="#">Checkout</a></li>
              </ul>
            </div>
        <div class="checkout"><a class="checkout__coupon-alert" href="#">Have a coupon? Click here to enter your code.</a>
          <div class="row">
            <div class="col-12 col-md-7 col-lg-8">
              <div class="checkout__form">
                <h3 class="checkout-title">BILLING DETAIL</h3>
                <form action="/" method="POST">
                  <div class="row">
                    <div class="col-12 col-sm-6">
                      <div class="input-group">
                        <label>First name</label>
                        <input type="text" name="first-name"/>
                      </div>
                    </div>
                    <div class="col-12 col-sm-6">
                      <div class="input-group">
                        <label>Last name</label>
                        <input type="text" name="last-name"/>
                      </div>
                    </div>
                  </div>
                  <div class="input-group">
                    <label>First Country</label>
                    <input type="text" name="country"/>
                  </div>
                  <div class="input-group">
                    <label>Address</label>
                    <input class="mb-20" type="text" name="address" placeholder="Street Address"/>
                    <input type="text" name="address" placeholder="Apartment. suite, unite ect ( optinal )"/>
                  </div>
                  <div class="input-group">
                    <label>Town/City</label>
                    <input type="text" name="city"/>
                  </div>
                  <div class="input-group">
                    <label>Country/State</label>
                    <input type="text" name="state"/>
                  </div>
                  <div class="input-group">
                    <label>Postcode/ZIP</label>
                    <input type="text" name="zip"/>
                  </div>
                  <div class="row">
                    <div class="col-12 col-sm-6">
                      <div class="input-group">
                        <label>Phone</label>
                        <input type="text" name="Phone"/>
                      </div>
                    </div>
                    <div class="col-12 col-sm-6">
                      <div class="input-group">
                        <label>Email</label>
                        <input type="text" name="Email"/>
                      </div>
                    </div>
                  </div>
                  <label class="checkbox-group customed mb-15">Create an acount?
                    <input type="checkbox" id="create-acc" name="create-acc" value="create-acc"/><span class="checkmark"></span>
                  </label>
                  <p class="label-description">Create am acount by entering the information below. If you are a returing customer login at the top of the page</p>
                  <div class="input-group mb-15">
                    <label>Acc Password</label>
                    <input type="text" name="password"/>
                  </div>
                  <label class="checkbox-group customed">Note about your order, e.g, special noe for delivery
                    <input type="checkbox" id="note" name="note" value="note"/><span class="checkmark"></span>
                  </label>
                  <div class="input-group">
                    <label>Order notes</label>
                    <input type="text" name="order-note" placeholder="Note about your order, e.g, special noe for delivery"/>
                  </div>
                </form>
              </div>
            </div>
            <div class="col-12 col-md-5 col-lg-4">
              <div class="checkout__total">
                <h3 class="checkout-title">Your order</h3>
                <table class="total__provisional">
                  <colgroup>
                    <col style="width: 70%"/>
                    <col style="width: 30%"/>
                  </colgroup>
                  <thead>
                    <tr>
                      <th>Product</th>
                      <th>Total</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><span>01.</span>
                        <p>Chain buck bag</p>
                      </td>
                      <td>$ 300</td>
                    </tr>
                    <tr>
                      <td><span>02.</span>
                        <p>Zip-pockets pebbled tote briefcase</p>
                      </td>
                      <td>$ 170</td>
                    </tr>
                    <tr>
                      <td><span>03.</span>
                        <p>Black jean</p>
                      </td>
                      <td>$ 170</td>
                    </tr>
                    <tr>
                      <td><span>04.</span>
                        <p>Cotton shirt</p>
                      </td>
                      <td>$ 170</td>
                    </tr>
                  </tbody>
                </table>
                <table class="total__final">
                  <colgroup>
                    <col style="width: 70%"/>
                    <col style="width: 30%"/>
                  </colgroup>
                  <tbody>
                    <tr>
                      <td>Subtotal</td>
                      <td>$ 750</td>
                    </tr>
                    <tr>
                      <td>Total</td>
                      <td>$ 750</td>
                    </tr>
                  </tbody>
                </table>
                <div class="total__payment-method">
                  <div class="total__payment-method__block">
                    <label class="checkbox-group customed">Create an account ?
                      <input type="checkbox" id="pay-create-acc" name="pay-create-acc" value="pay-create-acc" checked="checked"/><span class="checkmark"></span>
                    </label>
                    <p class="payment__content">Create am acount by entering the inform ation below. If you are a returing customer login at the top of the page.</p>
                  </div>
                  <div class="total__payment-method__block">
                    <label class="checkbox-group customed">Cheque payment
                      <input type="checkbox" id="pay-cheque" name="pay-cheque" value="pay-cheque"/><span class="checkmark"></span>
                    </label>
                    <p class="payment__content">Create am acount by entering the inform ation below. If you are a returing customer login at the top of the page.</p>
                  </div>
                  <div class="total__payment-method__block">
                    <label class="checkbox-group customed">Paypal
                      <input type="checkbox" id="pay-paypal" name="pay-paypal" value="pay-paypal"/><span class="checkmark"></span>
                    </label>
                    <p class="payment__content">Create am acount by entering the inform ation below. If you are a returing customer login at the top of the page.</p>
                  </div><a class="btn" href="#">PLACE ODER</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
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
                      <div class="post-card -tiny"><a class="card__cover" href="post_standard.html"><img src="assets/images/posts/1.png" alt="Looking for some feedback for this rejected track"/></a>
                        <div class="card__content">
                          <h5 class="card__content-category">Technology</h5><a class="card__content-title" href="post_standard.html">Looking for some feedback for this rejected track</a>
                          <div class="card__content-info">
                            <div class="info__time"><i class="far fa-clock"></i>
                              <p>Clock  Wed 02, 2019</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="post-card -tiny"><a class="card__cover" href="post_standard.html"><img src="assets/images/posts/2.png" alt="How to name, save and export a finish template"/></a>
                        <div class="card__content">
                          <h5 class="card__content-category">Typography</h5><a class="card__content-title" href="post_standard.html">How to name, save and export a finish template</a>
                          <div class="card__content-info">
                            <div class="info__time"><i class="far fa-clock"></i>
                              <p>Clock  Wed 02, 2019</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="post-card -tiny"><a class="card__cover" href="post_standard.html"><img src="assets/images/posts/3.png" alt="I want to create a logo with illustrator hacker"/></a>
                        <div class="card__content">
                          <h5 class="card__content-category">Graphic</h5><a class="card__content-title" href="post_standard.html">I want to create a logo with illustrator hacker</a>
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
                    <div class="tags-group"><a class="tag-btn" href="blog_category_grid.html">Gutenews</a><a class="tag-btn" href="blog_category_grid.html">Lifestyle</a><a class="tag-btn" href="blog_category_grid.html">Fashion</a><a class="tag-btn" href="blog_category_grid.html">Technology</a><a class="tag-btn" href="blog_category_grid.html">Food</a><a class="tag-btn" href="blog_category_grid.html">Travel</a>
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
    <!--build:js assets/js/main.min.js-->
    <script rel="script/javascript" src="assets/js/jquery.min.js"></script>
    <script rel="script/javascript" src="assets/js/slick.min.js"></script>
    <script rel="script/javascript" src="assets/js/plyr.min.js"></script>
    <script rel="script/javascript" src="assets/js/masonry.pkgd.min.js"></script>
    <script rel="script/javascript" src="assets/js/imagesloaded.pkgd.min.js"></script>
    <script rel="script/javascript" src="assets/js/vimeo.player.min.js"></script>
    <script rel="script/javascript" src="assets/js/main.js"></script>
    <!--endbuild-->
  </body>
</html>