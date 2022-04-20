<!DOCTYPE html>

<html lang="en">
  <#include "header/default-meta.ftl">
  <body>
    <#include "header/default.ftl">
<script>
  var postings = []
  var userId = ${user.userId};
  var postingRequest = RestClient.GET('/api/posting/latest');

  var $posting_content_dom;

  var last_posting_id = Number.MAX_VALUE;

  $( document ).ready(function() {
      $posting_content_dom = $("#posting-contents-home");
      postingRequest.done(function (data) {
          console.log("latest posting : " );
          console.log(data)
          for (var posting_index in data.content) {
              var posting = data.content[posting_index]
              if (posting_index == 0) {
                  addMainPosting(posting)
              } else {
                  addSubPosting(posting)
              }
              last_posting_id = posting.postingId;
          }
          addLoadPostingButton();
      });

  });

  function addMainPosting(posting) {
      let posting_id = posting.postingId
      let categorys = posting.postingCategories //array
      let category_str = ""
      for (let category_idx in categorys) {
          category_str += categorys[category_idx].category
          if (category_idx != (categorys.length - 1)) category_str += ',';
      }
      let title = posting.title
      let author_name = posting.user.name
      let created_datetime = posting.createdDatetime
      let comment_count = posting.postingComments.length
      let thumbnail_url = posting.thumbnailUrl

      var main_posting_dom = '<div class="col-12">' +
          '<div class="post-card -center -banner -inner-text">' +
          '<a class="card__cover" href="/posting/'+posting_id+'">' +
          '<img src="'+thumbnail_url+'"/>' +
          '</a>' +
          '<div class="card__content">' +
          '<h5 class="card__content-category">'+category_str+'</h5><a class="card__content-title" href="/posting/'+posting_id+'">'+title+'</a>' +
          '<div class="card__content-info">' +
          '<div class="info__time info__author"><i class="far fa-user"></i>' +
          '<p>'+author_name+'</p>' +
          '</div>' +
          '<div class="info__time"><i class="far fa-clock"></i>' +
          '<p>'+created_datetime+'</p>' +
          '</div>' +
          '<div class="info__comment"><i class="far fa-comment"></i>' +
          '<p>'+comment_count+'</p>' +
          '</div>' +
          '</div>'+
          '</div>'+
          '</div>' +
          '</div>';

      $posting_content_dom.append(main_posting_dom)
  }

  function addSubPosting(posting, loadPostingOnClick=false) {
      let posting_id = posting.postingId
      let categorys = posting.postingCategories //array
      let category_str = ""
      for (let category_idx in categorys) {
          category_str += categorys[category_idx].category
          if (category_idx != (categorys.length - 1)) category_str += ',';
      }
      let title = posting.title
      let author_name = posting.user.name
      let created_datetime = posting.createdDatetime
      let comment_count = posting.postingComments.length
      let thumbnail_url = posting.thumbnailUrl

      var sub_posting_dom = '<div class="col-12 col-lg-6 posting">' +
          '<div class="post-card -image-less">' +
          '<div class="category-icon"><img src="'+thumbnail_url+'" alt="'+category_str+'"/></div>' +
          '<div class="card__content">' +
          '<h5 class="card__content-category">'+category_str+'</h5><a class="card__content-title" href="/posting/'+posting_id+'">'+title+'</a>' +
          '<div class="card__content-info">' +
          '<div class="info__time info__author"><i class="far fa-user"></i>' +
          '<p>'+author_name+'</p>' +
          '</div>' +
          '<div class="info__time"><i class="far fa-clock"></i>' +
          '<p>'+created_datetime+'</p>' +
          '</div>' +
          '<div class="info__comment"><i class="far fa-comment"></i>' +
          '<p>'+comment_count+'</p>' +
          '</div>' +
          '</div>' +
          '</div>' +
          '</div>' +
          '</div>';
      if (loadPostingOnClick) {
          $(".col-lg-6.posting").last().after(sub_posting_dom)
      } else {
          $posting_content_dom.append(sub_posting_dom);
      }
  }

  function addLoadPostingButton() {
      //TODO : 신규 포스팅 4개를 불러오고 다음 posting 이 있으면 계속 button 노출 & 없으면 노출x
      let load_more_posting = '<div id="load-posting-btn" class="col-12">' +
          '<div class="center"><a class="btn -normal load-more-btn" onclick="loadMorePostingOnClick()">Load more posts</a></div>' +
          '</div>'
      $posting_content_dom.append(load_more_posting);
  }
  function loadMorePostingOnClick() {
      var loadPostingRequest = RestClient.GET('/api/posting/latestFrom?postingId='+last_posting_id);
      loadPostingRequest.done(function (data) {
          for (var posting_index in data.content) {
              var posting = data.content[posting_index]
              addSubPosting(posting, true)
          }
          last_posting_id = posting.postingId;
          if(data.last) {
              $('#load-posting-btn').hide()
          }
      });
  }

</script>

    <div id="content">
      <div class="container">
        <div class="blog-imageless">
          <div class="row" id="posting-contents-home">
<#--            add posting dynamically-->
          </div>
        </div>
      </div>
    </div>
    <#include "/footer/default.ftl">
  </body>
</html>