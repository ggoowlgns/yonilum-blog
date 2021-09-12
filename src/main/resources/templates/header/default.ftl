<div id="load">
    <div class="load__content">
        <div class="load__icon"><img src="/assets/images/icons/load.gif" alt="Loading icon"/></div>
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
        <div class="header-wrapper"><a class="header__logo" href="/"><img src="/assets/images/logo.png" alt="Logo"/></a>
            <nav>
                <ul>
                    <#if springMacroRequestContext.requestUri?contains("/category")>
                        <li class="nav-item"><a href="/">Home</a></li>
                        <li class="nav-item active"><a href="/category">Category</a></li>
                        <li class="nav-item"><a href="/about">About</a></li>
                    <#elseif springMacroRequestContext.requestUri?contains("/about")>
                        <li class="nav-item"><a href="/">Home</a></li>
                        <li class="nav-item"><a href="/category">Category</a></li>
                        <li class="nav-item active"><a href="/about">About</a></li>
                    <#else>
                        <li class="nav-item active"><a href="/">Home</a></li>
                        <li class="nav-item"><a href="/category">Category</a></li>
                        <li class="nav-item"><a href="/about">About</a></li>
                    </#if>

<#--                    <li class="nav-item"><a href="#">Pages</a>
                        <ul class="dropdown-menu">
                            <li><a href="author.ftl">AUTHOR</a></li>
                            <li><a href="about.ftl">ABOUT</a></li>
                            <li><a href="contact.ftl">CONTACT</a></li>
                            <li><a href="deprecated/shopping/shop.ftl">SHOP</a></li>
                            <li><a href="deprecated/shopping/product_detail.ftl">PRODUCT DETAIL</a></li>
                            <li><a href="deprecated/shopping/cart.ftl">CART</a></li>
                            <li><a href="deprecated/shopping/checkout.ftl">CHECKOUT</a></li>
                            <li><a href="error_404.ftl">ERROR</a></li>
                        </ul>
                    </li>-->
                </ul>
            </nav>
            <div class="header__icon-group"><a href="#" id="search"><i class="fas fa-search"></i></a>
                <div class="social">
                    <#--<a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-dribbble"></i></a>-->
                    <a id="mobile-menu-controller" href="#"><i class="fas fa-bars"></i></a>
                    <#if user.id == 99999>
                        <a href="/oauth2/authorize/kakao?redirect_uri=http://localhost:8080/"><img src="/assets/images/icons/kakao/kakao_login_medium_narrow.png"></a>
                    <#else >
                        <div class="card__content-title" style="height: 50px; width: 200px; vertical-align: middle; display: flex">

                            <img src="${user.imageUrl}" style="height: 100%; width: auto; float: left">
                            <br>
                            <div style="align-items: center; display: flex; float: right">
                                welcome '${user.name}'
                            </div>


                        </div>

                    </#if>
                </div>
            </div>
        </div>
    </div>
</header>