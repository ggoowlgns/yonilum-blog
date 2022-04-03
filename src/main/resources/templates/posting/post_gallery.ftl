<!DOCTYPE html>
<html lang="en">
  <#include "/header/default-meta.ftl">
  <#include "/tui-markdown-editor/tui-md-editor-dependency.ftl">
  <script>
    var postingRequest = RestClient.GET('/api/posting/${postingId}');
    var userId = ${user.userId};

    var $contentDom = ""
    var $cardImageDom = ""
    var $tagsDom = ""
    var $authorDom = ""
    var $commentsDom = ""
    $(document).ready(function (){
        $contentDom = $('#posting-content')
        $cardImageDom = $('#posting-card-images')
        $tagsDom = $('#posting-tags')
        $authorDom = $('#posting-footer-author');
        $commentsDom = $('#posting-comment');

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

            addCardImages(data.postingImages)

            //TODO : md 로 만들어준 결과물을 그대로 가져와서 arg 로 넣어주기
            addContent(data.postingContents[0]['content'])

            for (var tag of categoryList) {
                addCategoryTags(tag.category)
            }
            addUserInfo(data.user)
            addCommentInfo(data.postingComments);
        })
    });

    function addCardImages(postingImages) {
        for (var postingImage of postingImages) {
            addCardImage(postingImage.imageUrl);
        }
    }

    function addCardImage(imageUrl) {
      var imgTagDom = "<div class='card__cover__slide-item'><img src='"+
              imageUrl
              +"' alt=''/></div>"
      $cardImageDom.append(imgTagDom)
    }

    function addContent(content) {
        console.log('content : ' + content)
        if (content === undefined) {
          content = `![image](https://uicdn.toast.com/toastui/img/tui-editor-bi.png)

# Awesome Editor!

It has been _released as opensource in 2018_ and has ~~continually~~ evolved to **receive 10k GitHub ⭐️ Stars**.

## Create Instance

You can create an instance with the following code and use \`getHtml()\` and \`getMarkdown()\` of the [Editor](https://github.com/nhn/tui.editor).


> See the table below for default options
> > More API information can be found in the document

| name | type | description |
| --- | --- | --- |
| el | \`HTMLElement\` | container element |

## Features

* CommonMark + GFM Specifications
   * Live Preview
   * Scroll Sync
   * Auto Indent
   * Syntax Highlight
        1. Markdown
        2. Preview

## Support Wrappers

> * Wrappers
>    1. [x] React
>    2. [x] Vue
>    3. [ ] Ember`
        }
      const { chart, codeSyntaxHighlight, colorSyntax, tableMergedCell, uml } = toastui.Editor.plugin;
        const chartOptions = {
          minWidth: 100,
          maxWidth: 600,
          minHeight: 100,
          maxHeight: 300
        };
      const viewer = new toastui.Editor.factory({
          el: document.querySelector('#tui-md-viewer'),
          viewer: true,
          initialValue: content,
          plugins: [[chart, chartOptions], [codeSyntaxHighlight, { highlighter: Prism }], tableMergedCell, uml]
      });
      // viewer.setMarkdown(content)

    }

    function addParagraphToContent(paragraph) {
      var paragraphDom = "<p class='paragraph'> " +
              paragraph
      + "</p>"
      $contentDom.append(paragraphDom)
    }

    function addCategoryTags(tag) {
      var tagDom = '<a class="tag-btn" href="/category?categoryName='+tag+'">'+
              tag
              +'</a>';
      $tagsDom.append(tagDom);
    }

    function addUserInfo(user) {
      var userImg = "<div class='author__avatar'>" +
              "<img src='"+ user.imageUrl +"'/>" +
              "</div>"
      var userSubInfo = '<div class="author__info">' +
              '<h5>'+user.name+'</h5>' +
              '<p>'+user.introduction+'</p>' +
              '</div>'
      $authorDom.append(userImg);
      $authorDom.append(userSubInfo);
    }

    function addCommentInfo(comments) {
      var commentTitle = '<span>'+comments.length+' comment</span>'
      $commentsDom.children('.comment-title').append(commentTitle)

      var commentsDomReal = $commentsDom.children('.post-footer__comment__detail');
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