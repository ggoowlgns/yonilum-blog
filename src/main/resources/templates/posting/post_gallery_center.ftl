<div class="col-12 col-md-8 order-md-1">
    <#--Posting Title-->
    <div class="post-card -center post-title">
        <div class="card__content">
            <h5 id="postig-category" class="card__content-category">Technology</h5>
            <a id="posting-title" class="card__content-title" href="../post_standard.ftl">Looking for some feedback for this rejected track</a>
            <div class="card__content-info">
                <div class="info__time info__author"><i class="far fa-user"></i>
                    <p id="posting-author">Jessica Stephens</p>
                </div>
                <div class="info__time"><i class="far fa-clock"></i>
                    <p id="posting-created-datetime" >Clock  Wed 02, 2019</p>
                </div>
                <div class="info__comment"><i class="far fa-comment"></i>
                    <p id="posting-comment-count">3</p>
                </div>
            </div>
        </div>
    </div>

    <#--Posting Images-->
    <div class="post-card -center">
        <div id="posting-card-images" class="card__cover -slide">
            <#--<div class="card__cover__slide-item">
                <img src="/assets/images/posts/hi-res-1.png" alt="How to name, save and export a finish template"/>
            </div>-->
        </div>
    </div>


    <#--Posting Contents-->
    <div id="posting-content" class="post-standard__content">
        <#--<p class="paragraph">Sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliqui.paragraphex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit.</p>-->
        <div id="tui-md-viewer">
            <strong>The example code can be slower than your environment because the code is transpiled by
                babel-standalone in runtime.</strong>
        </div>
    </div>


    <div class="post-footer">
        <#--Posting Tags-->
        <div class="post-footer__tags center">
            <div id="posting-tags" class="tags-group">
                <#--<a class="tag-btn" href="/category/{categoryName}">{categoryName}</a>-->
            </div>
        </div>

        <#--Posting 작성자-->
        <div id="posting-footer-author" class="post-footer__author">
<#--            <div class="author__avatar">
            </div>
            <div class="author__info">
&lt;#&ndash;                <div class="social-media">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-dribbble"></i></a>
                </div>&ndash;&gt;
            </div>-->
        </div>

        <#--이전, 다음 Posting-->
        <#--<div class="post-footer__related">
            <div class="post-footer__related__item -prev"><a href="../post_standard.ftl"> <i class="fas fa-chevron-left"></i>Previous posts</a>
                <div class="post-footer__related__item__content"><img src="/assets/images/posts/2.png" alt="Relate news image"/>
                    <div class="post-card ">
                        <div></div>
                        <div class="card__content">
                            <h5 class="card__content-category">Typography</h5><a class="card__content-title" href="../post_standard.ftl">How to name, save and export a finish template</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="post-footer__related__item -next"><a href="../post_standard.ftl">
                    Next posts<i class="fas fa-chevron-right"></i></a>
                <div class="post-footer__related__item__content">
                    <div class="post-card -right">
                        <div></div>
                        <div class="card__content">
                            <h5 class="card__content-category">Graphic</h5><a class="card__content-title" href="../post_standard.ftl">I want to create a logo with illustrator hacker</a>
                        </div>
                    </div><img src="/assets/images/posts/3.png" alt="Relate news image"/>
                </div>
            </div>
        </div>-->

        <#--댓글-->
        <div id="posting-comment" class="post-footer__comment">
            <h3 class="comment-title"></h3>
            <div class="post-footer__comment__detail">
                <#--<div class="comment__item">
                    <div class="comment__item__avatar"><img src="/assets/images/post_detail/avatar/1.png" alt="Author avatar"/></div>
                    <div class="comment__item__content">
                        <div class="comment__item__content__header">
                            <h5>Brandon Kelley</h5>
                            <div class="data">
                                <p><i class="far fa-clock"></i>Aug,15, 2019</p>
                                <p><i class="far fa-heart"></i>12</p>
                                <p><i class="far fa-share-square"></i>1</p>
                            </div>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore aliqua. Quis ipsum suspendisse ultrices gravida lacus vel facilisis.</p>
                    </div>-->
                    <#--댓글 답글-->
                    <#--<div class="comment__item__reply">
                        <div class="comment__item">
                            <div class="comment__item__avatar"><img src="/assets/images/post_detail/avatar/2.png" alt="Author avatar"/></div>
                            <div class="comment__item__content">
                                <div class="comment__item__content__header">
                                    <h5>Brandon Kelley</h5>
                                    <div class="data">
                                        <p><i class="far fa-clock"></i>Aug,15, 2019</p>
                                        <p><i class="far fa-heart"></i>12</p>
                                        <p><i class="far fa-share-square"></i>1</p>
                                    </div>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis ipsum suspendisse ultrices gravida lacus vel facilisis, sed do eiusmod tempor.</p>
                            </div>
                        </div>
                    </div>-->
                </div>
            </div>

            <#--댓글 남기기-->
            <h3 class="comment-title"> <span>Leave a comment</span></h3>
            <div class="post-footer__comment__form">
                <form action="/">
                    <div class="row">
                        <div class="col-12 col-sm-4">
                            <input type="text" placeholder="Name" name="name"/>
                        </div>
                        <div class="col-12 col-sm-4">
                            <input type="email" placeholder="Email" name="email"/>
                        </div>
                        <div class="col-12 col-sm-4">
                            <input type="text" placeholder="Webiste" name="website"/>
                        </div>
                    </div>
                    <textarea cols="30" rows="5" placeholder="Messages" name="message"></textarea>
                </form>
                <div class="center">
                    <button class="btn -normal">Submit</button>
                </div>
            </div>
        </div>
    </div>

</div>