<!DOCTYPE html>
<html lang="en">
  <#include "/header/default-css.ftl">
  <script>
    var postingRequest = RestClient.GET('/api/posting/${postingId}');
    var userId = ${user.userId};
    postingRequest.done(function (data) {
      console.log(data);
      var user = data.user;

      $('#posting-title').text(data.title);
      data.postingCategories.sort(function (a, b) {
        if (a.categoryIndex > b.categoryIndex) {
          return 1;
        } else if (a.categoryIndex < b.categoryIndex) {
          return -1;
        } return 0;
      });
      var categoryList = data.postingCategories;
      $('#postig-category').text(categoryList[0].category);
      $('#posting-author').text(user.name);
      $('#posting-created-datetime').text(data.createdDatetime);
      $('#posting-comment-count').text(data.postingComments.length);

      var cardImageDom = $('#posting-card-images')
      for (var postingImage of data.postingImages) {
        addCardImage(postingImage.imageUrl, cardImageDom);
      }

      var contentDom = $('#posting-content')
      data.postingContentParagraphs.sort(function (a, b) {
        if (a.paragraphIndex > b.paragraphIndex) {
          return 1;
        } else if (a.paragraphIndex < b.paragraphIndex) {
          return -1;
        } return 0;
      });
      for (var paragraph of data.postingContentParagraphs) {
        addParagraphToContent(paragraph.content,contentDom);
      }

      var tagsDom = $('#posting-tags')
      for (var tag of categoryList) {
        addCategoryTags(tag.category, tagsDom)
      }

      var authorDom = $('#posting-footer-author');
      addUserInfo(data.user, authorDom)

      var commentsDom = $('#posting-comment');
      addCommentInfo(data.postingComments, commentsDom);
    })

    function addCardImage(imageUrl, cardDom) {
      var imgTagDom = "<div class='card__cover__slide-item'><img src='"+
              imageUrl
              +"' alt=''/></div>"
      cardDom.append(imgTagDom)
    }

    function addParagraphToContent(paragraph, contentDom) {
      var paragraphDom = "<p class='paragraph'> " +
              paragraph
      + "</p>"
      contentDom.append(paragraphDom)
    }

    function addCategoryTags(tag, tagsDom) {
      var tagDom = '<a class="tag-btn" href="/category?categoryName='+tag+'">'+
              tag
              +'</a>';
      tagsDom.append(tagDom);
    }

    function addUserInfo(user, authorDom) {
      var userImg = "<div class='author__avatar'>" +
              "<img src='"+ user.imageUrl +"'/>" +
              "</div>"
      var userSubInfo = '<div class="author__info">' +
              '<h5>'+user.name+'</h5>' +
              '<p>'+user.introduction+'</p>' +
              '</div>'
      authorDom.append(userImg);
      authorDom.append(userSubInfo);
    }

    function addCommentInfo(comments, commentsDom) {
      var commentTitle = '<span>'+comments.length+' comment</span>'
      commentsDom.children('.comment-title').append(commentTitle)

      var commentsDomReal = commentsDom.children('.post-footer__comment__detail');
      comments.sort(function (a,b) {
        if (a.commentIndex > b.commentIndex) return 1;
        else if (a.commentIndex < b.commentIndex) return -1;
        else return 0;
      })
      for (var comment of comments) {
        var comment = '<div class="comment__item">' +
                '<div class="comment__item__avatar">' +
                '<img src="'+comment.user.imageUrl+'"/>' +
                '</div>' +
                '<div class="comment__item__content">' +
                '<div class="comment__item__content__header">' +
                '<h5>'+comment.user.name+'</h5>' +
                '<div class="data">' +
                '<p><i class="far fa-clock"></i>'+comment.createdDatetime+'</p>' +
                // '<p><i class="far fa-heart"></i>12</p>' +
                // '<p><i class="far fa-share-square"></i>1</p>' +
                '</div>' +
                '</div>' +
                '<p>'+comment.content+'</p>' +
                '</div>'
        commentsDomReal.append(comment);
      }
    }
  </script>
  <body>
  <#include "/header/default.ftl">
    <div id="content">
      <div class="post">
        <div class="container">
          <div class="post-standard -slide">
            <div class="row">
              <#include "/common/common-rights.ftl">
              <#include "/posting/post_gallery_center.ftl">
            </div>
          </div>
        </div>
      </div>
    </div>
    <#include "/footer/default.ftl">
  </body>
</html>