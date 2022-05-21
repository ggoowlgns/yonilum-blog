<!DOCTYPE html>
<html lang="en">
<#include "/header/default-meta.ftl">

<body>
<#include "/header/default.ftl">
<div id="content">
    <div class="post">
        <div class="container">
            <div class="post-standard -slide">
                <div class="row">
                    <div class="post-footer" style="width: 100%">
                        <h3 class="comment-title"> <span>Posting Editor Page</span></h3>
                        <div class="post-footer__comment__form">
                            <form>
                              <div class="row form-group">
                                <div class="col-12 col-sm-12">
                                  <input id="posting-category" type="text" placeholder="Category" name="category" style="max-width: 500px"/>
                                </div>
                              </div>
                              <div class="row form-group">
                                <div class="col-12 col-sm-12">
                                  <input id="posting-title" type="text" placeholder="Title" name="title" style="max-width: 500px"/>
                                </div>
                              </div>

                              <#--Post Card-->
                              <div class="row form-group">
                                <!-- /uploader -->
                                <div class="col-md-3 col-sm-12">
                                  <!-- Our markup, the important part here! -->
                                  <div id="drag-and-drop-zone" class="dm-uploader p-2">
                                    <h3 class="mb-5 mt-5 text-muted">Drag &amp; drop Read Images here</h3>
                                    <div class="btn -normal tag-btn">
                                      <span>Open the file Browser</span>
                                      <input type="file" title='Click to add Files' />
                                    </div>
                                  </div>
                                </div>
                                <!-- /file list -->
                                <div class="col-md-8 col-sm-12">
                                  <div class="card h-100">
                                    <div class="card-header">
                                      Read Image List
                                    </div>
                                    <ul class="list-group p-2 d-flex flex-column col overflow-auto" id="files" style="overflow:scroll;">
                                      <li class="text-muted text-center empty">No files uploaded.</li>
                                    </ul>
                                  </div>
                                </div>
                              </div>

                              <#--Markdown Editor (TUI)-->
                              <div class="row form-group" style="margin-bottom: 100px">
                                <div class="col-12 col-xm-12">
                                  <div id="tui-md-editor"></div>
                                </div>
                              </div>


                            </form>
                        </div>

                        <#--Submit Button-->
                        <div class="row center">
                            <#if postingId??>
                              <button id="posting-update-btn" class="btn -normal btn-primary" onclick="addPostingOnClick()">Update Posting</button>
                            <#else >
                              <button id="posting-add-btn" class="btn -normal btn-primary" onclick="addPostingOnClick()">Add Posting</button>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<#include "/posting/editor/post_content_editor.ftl">
<#include "/posting/editor/post_read_image_uploader.ftl">


<script>
    // Add New Posting || Edit Existing Posting
    var userId = ${user.userId};
    var $postingCategory;
    var $postingTitle;
    $(document).ready(function () {
        $postingCategory = $("#posting-category");
        $postingTitle = $("#posting-title");
    })

  <#if postingId??>
    var postingRequest = RestClient.GET('/api/posting/${postingId}');
    postingRequest.done(function (data) {
        console.log(data);
        setExistingPosting(data);
    });
  </#if>

    function addPostingOnClick() {
        var categoryList = $postingCategory.val().split(","); //애초에 입력할때 , 를 구분해서 넣어줘야함 (띄어쓰기 하지 말고)
        var title = $postingTitle.val();
        var imagePaths = []
        for (var imageDom of $("#files").children(".media")) {
            imagePaths.push(imageDom.path);
        }
        var content = getPostingMarkDownContentFromMDEditor();

        var requestBody = {
            'title' : title,
            'userId' : userId,
            'thumbnailUrl' : imagePaths[0],
            'postingType' : '0',
            'categories' : categoryList,
            'images' : imagePaths,
            'content' : content
        };

        requestBody = checkIfThumbnailIsEmptyAndPutThumbnailFromContent(requestBody);

        postPosting('/api/posting', requestBody);
    }


    function getPostingMarkDownContentFromMDEditor() {
      return tui_md_editor.getMarkdown()
    }

    function checkIfThumbnailIsEmptyAndPutThumbnailFromContent(requestBody) {
        if (requestBody['thumbnailUrl'] != undefined) return requestBody;
        requestBody['thumbnailUrl'] = getFirstImageUrlFromContent(requestBody['content'])
        return requestBody;
    }

    function getFirstImageUrlFromContent(content) {
        var imageSearchRegex = /!\[.*?\]\((.*?)\)/
        if (content.match(imageSearchRegex) == null) alertWarning();
        return content.match(imageSearchRegex)[1];
        //ref : https://stackoverflow.com/questions/26024796/what-type-of-regexp-would-i-need-to-extract-image-url-from-markdown
    }
    function alertWarning() {
        alert("card view 혹은 content 상에 image 가 필수적으로 존재해야 합니다.",{em:'Billible',title:'인사'})
    }

    function postPosting(path, requestBody) {
      RestClient.POST(
          path,
          requestBody,
      ).done(function (data, textStatus, request) {
          console.log(data);
          var createdPostingPath = request.getResponseHeader('Location')
          window.location.replace(
              window.location.protocol + "//" +
              window.location.hostname +
              createdPostingPath
          )
      })
    }

    function setExistingPosting (data) {
        data.postingCategories.sort(function (a, b) {
            if (a.categoryIndex > b.categoryIndex) {
                return 1;
            } else if (a.categoryIndex < b.categoryIndex) {
                return -1;
            } return 0;
        });
        data.postingImages.sort(function (a, b) {
            if (a.postingImageId > b.postingImageId) {
                return 1;
            } else if (a.postingImageId < b.postingImageId) {
                return -1;
            } return 0;
        })
        data.postingContents.sort(function (a, b) {
            if (a.paragraphIndex > b.paragraphIndex) {
                return 1;
            } else if (a.paragraphIndex < b.paragraphIndex) {
                return -1;
            } return 0;
        })
        var categoryList = data.postingCategories;
        var categoriesStr = "";
        for (var category of categoryList) {
            categoriesStr += category.category+",";
        }

        var contentParagraphList = data.postingContents;
        var contentStr = "";
        for (var paragraph of contentParagraphList) {
            contentStr += paragraph.content + "\n\n";
        }

        $postingCategory.val(categoriesStr);
        $postingTitle.val(data.title);
        //TODO : 기존에 있던 content tui-md-editor 에 가져다 넣기

        var imageList = data.postingImages;
        //TODO : 기존에 있던 Card Images 넣기
    }
</script>
</html>