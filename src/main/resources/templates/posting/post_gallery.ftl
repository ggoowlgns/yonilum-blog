<!DOCTYPE html>
<html lang="en">
  <#include "/header/default-css.ftl">
  <script>
    var postingReq = RestClient.GET('/api/posting/${postingId}');
    postingReq.done(function (data) {
      console.log(data);
      var user = data.user;

      //TODO : 하나씩 dom 으로 들어가서 생성하는 방법밖에 없다..
      $('#posting-title').text(data.title);
      $('#postig-category').text(data.category);
      $('#posting-author').text(user.name);
      $('#posting-created-datetime').text(data.createdDatetime);
      $('#posting-comment-count').text(data.postingComments.length);

    })
    var userId = ${user.userId};

    console.log(userId);
  </script>
  <body>
  <#include "/header/default.ftl">
    <div id="content">
      <div class="post">
        <div class="container">
          <div class="post-standard -slide">
            <div class="row">
              <#include "/posting/post_gallery_rights.ftl">
              <#include "/posting/post_gallery_center.ftl">
            </div>
          </div>
        </div>
      </div>
    </div>
    <#include "/footer/default.ftl">
  </body>
</html>