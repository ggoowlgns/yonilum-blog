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
<#--                            <form action="/api/posting">-->
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

                              <#--Markdown Editor (TUI)-->
                              <div class="row form-group" style="margin-bottom: 100px">
                                <div class="col-12 col-xm-12">
                                  <div id="tui-md-editor"></div>
                                </div>
                              </div>

                              <#--Image Upload-->
                              <div class="row">
                                <!-- /uploader -->
                                <div class="col-md-6 col-sm-12">
                                  <!-- Our markup, the important part here! -->
                                  <div id="drag-and-drop-zone" class="dm-uploader p-5">
                                    <h3 class="mb-5 mt-5 text-muted">Drag &amp; drop files here</h3>
                                    <div class="btn btn-primary btn-block mb-5">
                                      <span>Open the file Browser</span>
                                      <input type="file" title='Click to add Files' />
                                    </div>
                                  </div>
                                </div>

                                <!-- /file list -->
                                <div class="col-md-6 col-sm-12">
                                  <div class="card h-100">
                                    <div class="card-header">
                                      File List
                                    </div>
                                    <ul class="list-unstyled p-2 d-flex flex-column col" id="files">
                                      <li class="text-muted text-center empty">No files uploaded.</li>
                                    </ul>
                                  </div>
                                </div>
                              </div>

                              <!--debug message-->
                              <div class="row">
                                <div class="col-12">
                                  <div class="card h-100">
                                    <div class="card-header">
                                      Debug Messages
                                    </div>
                                    <ul class="list-group list-group-flush" id="debug">
                                      <li class="list-group-item text-muted empty">Loading plugin....</li>
                                    </ul>
                                  </div>
                                </div>
                              </div>

                            </form>
                        </div>

                        <#--Submit Button-->
                        <div class="row center">
                            <#if postingId??>
                              <button id="posting-update-btn" class="btn -normal btn-primary" onclick="updatePosting()">Update Posting</button>
                            <#else >
                              <button id="posting-add-btn" class="btn -normal btn-primary" onclick="addPosting()">Add Posting</button>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    // Add New Posting || Edit Existing Posting
    var userId = ${user.userId};
    <#if postingId??>
    var postingRequest = RestClient.GET('/api/posting/${postingId}');
    postingRequest.done(function (data) {
        console.log(data);
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
        data.postingContentParagraphs.sort(function (a, b) {
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

        var contentParagraphList = data.postingContentParagraphs;
        var contentStr = "";
        for (var paragraph of contentParagraphList) {
            contentStr += paragraph.content + "\n\n";
        }

        $("#posting-category").val(categoriesStr);
        $("#posting-title").val(data.title);
        //TODO : 기존에 있던 content tui-md-editor 에 가져다 넣기

        var imageList = data.postingImages;
    });
    </#if>


    function addContentParagraph() {

    }

    function addImage() {

    }

    function addPosting() {
        var categoryList = $("#posting-category").val().split(",");
        var title = $("#posting-title").val();
        var imagePaths = []
        for (var imageDom of $("#files").children(".media")) {
            imagePaths.push(imageDom.path);
        }
        var contentParagraphs = quill.getContents().ops[0].insert.split('\n\n');

        console.log(contentParagraphs)

        var requestBody = {
            'title' : title,
            'userId' : userId,
            'thumbnailUrl' : imagePaths[0],
            'postingType' : '0',
            'categories' : categoryList,
            'images' : imagePaths,
            'paragraphs' : contentParagraphs
        };

        RestClient.POST(
            '/api/posting',
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

    function updatePosting() {

    }
</script>

<script type="text/template" id="qq-template-gallery">
  <div class="qq-uploader-selector qq-uploader qq-gallery" qq-drop-area-text="Drop files here">
    <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
      <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
    </div>
    <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
      <span class="qq-upload-drop-area-text-selector"></span>
    </div>
    <div class="qq-upload-button-selector qq-upload-button">
      <div>Upload a file</div>
    </div>
    <span class="qq-drop-processing-selector qq-drop-processing">
                <span>Processing dropped files...</span>
                <span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>
            </span>
    <ul class="qq-upload-list-selector qq-upload-list" role="region" aria-live="polite" aria-relevant="additions removals">
      <li>
        <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
        <div class="qq-progress-bar-container-selector qq-progress-bar-container">
          <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
        </div>
        <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
        <div class="qq-thumbnail-wrapper">
          <img class="qq-thumbnail-selector" qq-max-size="120" qq-server-scale>
        </div>
        <button type="button" class="qq-upload-cancel-selector qq-upload-cancel">X</button>
        <button type="button" class="qq-upload-retry-selector qq-upload-retry">
          <span class="qq-btn qq-retry-icon" aria-label="Retry"></span>
          Retry
        </button>

        <div class="qq-file-info">
          <div class="qq-file-name">
            <span class="qq-upload-file-selector qq-upload-file"></span>
            <span class="qq-edit-filename-icon-selector qq-edit-filename-icon" aria-label="Edit filename"></span>
          </div>
          <input class="qq-edit-filename-selector qq-edit-filename" tabindex="0" type="text">
          <span class="qq-upload-size-selector qq-upload-size"></span>
          <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete">
            <span class="qq-btn qq-delete-icon" aria-label="Delete"></span>
          </button>
          <button type="button" class="qq-btn qq-upload-pause-selector qq-upload-pause">
            <span class="qq-btn qq-pause-icon" aria-label="Pause"></span>
          </button>
          <button type="button" class="qq-btn qq-upload-continue-selector qq-upload-continue">
            <span class="qq-btn qq-continue-icon" aria-label="Continue"></span>
          </button>
        </div>
      </li>
    </ul>

    <dialog class="qq-alert-dialog-selector">
      <div class="qq-dialog-message-selector"></div>
      <div class="qq-dialog-buttons">
        <button type="button" class="qq-cancel-button-selector">Close</button>
      </div>
    </dialog>

    <dialog class="qq-confirm-dialog-selector">
      <div class="qq-dialog-message-selector"></div>
      <div class="qq-dialog-buttons">
        <button type="button" class="qq-cancel-button-selector">No</button>
        <button type="button" class="qq-ok-button-selector">Yes</button>
      </div>
    </dialog>

    <dialog class="qq-prompt-dialog-selector">
      <div class="qq-dialog-message-selector"></div>
      <input type="text">
      <div class="qq-dialog-buttons">
        <button type="button" class="qq-cancel-button-selector">Cancel</button>
        <button type="button" class="qq-ok-button-selector">Ok</button>
      </div>
    </dialog>
  </div>
</script>

<script type="text/html" id="debug-template">
  <li class="list-group-item text-%%color%%"><strong>%%date%%</strong>: %%message%%</li>
</script>
<script type="text/html" id="files-template">
  <li class="media" >
    <div class="media-body mb-1">
      <p class="mb-2">
        <strong>%%filename%%</strong> - Status: <span class="text-muted">Waiting</span>
      </p>
      <div class="progress mb-2">
        <div class="progress-bar progress-bar-striped progress-bar-animated bg-primary"
             role="progressbar"
             style="width: 0%"
             aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
        </div>
      </div>

      <hr class="mt-1 mb-1" />
    </div>
  </li>
</script>

<#--toast-ui -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.js"></script>
<script>
    const editor = new toastui.Editor({
        el: document.querySelector('#tui-md-editor'),
        // previewStyle: 'vertical',
        previewStyle: 'tab',
        height: '500px',
        initialValue: 'asdasd'
    });

    editor.getMarkdown();
</script>
</html>