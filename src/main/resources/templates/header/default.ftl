<script rel="script/javascript" src="/assets/js/slick.min.js"></script>
<script rel="script/javascript" src="/assets/js/plyr.min.js"></script>
<script rel="script/javascript" src="/assets/js/masonry.pkgd.min.js"></script>
<script rel="script/javascript" src="/assets/js/imagesloaded.pkgd.min.js"></script>
<script rel="script/javascript" src="/assets/js/vimeo.player.min.js"></script>
<script rel="script/javascript" src="/assets/js/main.js"></script>
<script>
    var user = {}
    user['id'] = ${user.userId};
    user['name'] = '${user.name}';
    user['email'] = '${user.email}';
    console.log('user : ' + JSON.stringify(user))
</script>
<#--<div id="load">-->
<#--    <div class="load__content">-->
<#--        <div class="load__icon"><img src="/assets/images/icons/load.gif" alt="Loading icon"/></div>-->
<#--    </div>-->
<#--</div>-->
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
        <div class="header-wrapper"><a href="/"><img src="/assets/images/logo-2.png" alt="Logo"/></a>
            <nav>
                <ul>
                    <li class="nav-item <#if !springMacroRequestContext.requestUri?contains("/category")
                                            && !springMacroRequestContext.requestUri?contains("/about")
                                            && !springMacroRequestContext.requestUri?contains("/posting/editor")> active</#if>">
                        <a href="/">Home</a></li>
                    <li class="nav-item <#if springMacroRequestContext.requestUri?contains("/category")> active</#if>">
                        <a href="/category">Category</a></li>
                    <li class="nav-item <#if springMacroRequestContext.requestUri?contains("/about")> active</#if>">
                        <a href="/about">About</a></li>
                    <#if user.userId != 99999>
                    <li class="nav-item <#if springMacroRequestContext.requestUri?contains("/posting/editor")> active</#if>">
<#--                            <a href="/posting/editor">Add Posting</a></li>-->
                            <a href="/posting/editor">Add Posting</a></li>
                    </#if>

                    <li class="nav-item" style="margin-left: 30px">
                        <#if user.userId == 99999>
                            <a href="/oauth2/authorize/kakao?redirect_uri=${redirect_uri}">
                                <img src="/assets/images/icons/kakao/kakao_login_medium_narrow.png">
                            </a>
                        <#else >
                            <div class="card__content-title" style="height: 50px; width: 200px; vertical-align: middle; display: flex">
                                <img src="${user.imageUrl}" style="height: 100%; width: auto; float: left">
                                <br>
                                <div style="align-items: center; display: flex; float: right">
                                    welcome '${user.name}'
                                </div>
                            </div>
                        </#if>
                    </li>
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

            <div class="header__icon-group">
                <a href="#" id="search"><i class="fas fa-search"></i></a>
                <div class="social">
                    <#--<a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-dribbble"></i></a>-->
                    <a id="mobile-menu-controller" href="#"><i class="fas fa-bars"></i></a>
                </div>

            </div>
        </div>
    </div>
</header>