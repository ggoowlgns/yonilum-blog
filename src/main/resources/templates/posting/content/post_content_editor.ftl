<!-- Modal -->
<div class="modal fade" id="tuiImageEditorModal" tabindex="-1" aria-labelledby="tuiImageEditorModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen-xxl-down">
    <div class="modal-content">
        <#--      <div class="modal-header">-->
        <#--        <h5 class="modal-title" id="exampleModalLabel">Image Editor</h5>-->
        <#--        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>-->
        <#--      </div>-->
      <div class="modal-body">
        <div id="tui-image-editor"></div>
      </div>
        <#--      <div class="modal-footer">-->
        <#--        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>-->
        <#--        <button type="button" class="btn btn-primary">Save changes</button>-->
        <#--      </div>-->
    </div>
  </div>
</div>


<#--toast-ui -->
<#include "/tui-markdown-editor/tui-md-editor-dependency.ftl">
<script>
  var tuiImageEditorModal = new bootstrap.Modal(document.getElementById('tuiImageEditorModal'))
  var tuiImageEditorEl = document.getElementById('tuiImageEditorModal')
  tuiImageEditorEl.addEventListener('hidden.bs.modal', function (event) {
    // do something...
    console.log("destory tui_image_editor !")
    tui_image_editor.destroy();
  })
  var tui_md_editor;
  makeMdEditor();

  function makeMdEditor() {
    const { Editor } = toastui;
    const { chart, codeSyntaxHighlight, colorSyntax, tableMergedCell, uml } = Editor.plugin;
    const chartOptions = {
      minWidth: 100,
      maxWidth: 600,
      minHeight: 100,
      maxHeight: 300
    };

    tui_md_editor = new toastui.Editor({
      el: document.querySelector('#tui-md-editor'),
      // previewStyle: 'vertical',
      previewStyle: 'tab',
      height: '500px',
      initialValue: 'asdasd',
      placeholder: 'Please enter text.',
      plugins: [[chart, chartOptions], [codeSyntaxHighlight, { highlighter: Prism }], colorSyntax, tableMergedCell, uml],
      hooks : {
        addImageBlobHook: function(blob, callback) {
          console.log("blob before edit : " + blob)
          blob = editImageBeforeUpload(blob, callback);
        }
      }
    });

    function editImageBeforeUpload(imageFile, mdEditorCallback) {
      tuiImageEditorModal.show()
      var tui_image_editor = createImageEditor(mdEditorCallback);
      tui_image_editor.ui.activeMenuEvent();
      tui_image_editor.loadImageFromFile(imageFile, imageFile.name).then(result => {
        console.log('old : ' + result.oldWidth + ', ' + result.oldHeight);
        console.log('new : ' + result.newWidth + ', ' + result.newHeight);
      });



      //TODO : Image edit 하고 결과물을 upload 하기
      return imageFile;
    }
  }

  function uploadImageToServerAndGetPath(blob) {
    var image_path = "";
    const formData = new FormData();
    formData.append("file", blob);
    $.ajax({
      async:false,
      type:"POST",
      url: "/api/image/uploads",
      allowedTypes: "image/*",
      extFilter: ['jpg', 'jpeg','png','gif'],
      maxFileSize: 10000000, // 3 Megs
      processData: false,
      contentType: false,
      data: formData,
      success: function(rtn){
        console.log("upload success, response data : ", rtn)
        image_path += rtn.path;
      },
      err: function(err){
        console.error("err:", err)
      }
    })
    return image_path;
  }

</script>
<#--Image Editor-->
<link rel="stylesheet" href="https://uicdn.toast.com/tui-image-editor/latest/tui-image-editor.css"/>
<script src="https://uicdn.toast.com/tui-image-editor/latest/tui-image-editor.js"></script>
<script>
  // const ImageEditor = require('tui-image-editor');
  // const FileSaver = require('file-saver'); //to download edited image to local. Use after npm install file-saver
  // const blackTheme = require('./js/theme/black-theme.js');
  var tui_image_editor
  function createImageEditor(mdEditorCallback) {
    tui_image_editor = new tui.ImageEditor('#tui-image-editor', {
      usageStatistics: false,
      includeUI: {
        // loadImage: {
        //     path: 'img/sampleImage.jpg',
        //     name: 'SampleImage',
        // },
        // locale: locale_ru_RU,
        // theme: blackTheme, // or whiteTheme
        initMenu: 'filter',
        menuBarPosition: 'bottom',
      },
      cssMaxWidth: 1000,
      cssMaxHeight: 800,
      selectionStyle: {
        cornerSize: 20,
        rotatingPointOffset: 70,
      },
    });
    $('.tui-image-editor-header-buttons .tui-image-editor-download-btn').
    replaceWith('<button id="tui-image-editor-save-btn" class="tui-image-editor-download-btn" >Save</button>')
    document.querySelector('#tui-image-editor-save-btn').addEventListener('click', () => {
      const resultBase64Image = tui_image_editor.toDataURL();
      const imageName = tui_image_editor.getImageName();
      console.log("resultBase64Image : " + resultBase64Image)
      var blob = convertBase64ToFile(resultBase64Image, imageName);
      var uploadedImageURL = uploadImageToServerAndGetPath(blob);
      console.log("blob : " + blob);
      console.log("uploadedImageURL : " + uploadedImageURL);
      mdEditorCallback(uploadedImageURL, blob.name);
      tuiImageEditorModal.hide();
    });
    return tui_image_editor;
  }

  function convertBase64ToFile(base64Image, imageName) {
    var arr = base64Image.split(','),
      mime = arr[0].match(/:(.*?);/)[1],
      bstr = atob(arr[1]),
      n = bstr.length,
      u8arr = new Uint8Array(n);

    while(n--){
      u8arr[n] = bstr.charCodeAt(n);
    }

    return new File([u8arr], imageName, {type:mime});
  }
</script>