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
        </div>
    </div>


    <#--Posting Contents-->
    <header>
        <link rel="stylesheet" type="text/css" href="/assets/css/ckeditor/styles.css">
    </header>
    <div id="posting-content" class="ck-content">
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
        </div>

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