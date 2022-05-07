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

<script>
  $(function(){
    /*
     * For the sake keeping the code clean and the examples simple this file
     * contains only the plugin configuration & callbacks.
     *
     * UI functions ui_* can be located in:
     *   - assets/demo/uploader/js/ui-main.js
     *   - assets/demo/uploader/js/ui-multiple.js
     *   - assets/demo/uploader/js/ui-single.js
     */
    $('#drag-and-drop-zone').dmUploader({
      url: '/api/image/uploads',
      allowedTypes: "image/*",
      extFilter: ['jpg', 'jpeg','png','gif'],
      maxFileSize: 10000000, // 3 Megs
      onDragEnter: function(){
        // Happens when dragging something over the DnD area
        this.addClass('active');
      },
      onDragLeave: function(){
        // Happens when dragging something OUT of the DnD area
        this.removeClass('active');
      },
      onInit: function(){
        // Plugin is ready to use
        ui_add_log('Penguin initialized :)', 'info');
      },
      onComplete: function(){
        // All files in the queue are processed (success or error)files
        ui_add_log('All pending tranfers finished');
      },
      onNewFile: function(id, file){
        // When a new file is added using the file selector or the DnD area
        ui_add_log('New file added #' + id);
        ui_multi_add_file(id, file);
        if (typeof FileReader !== 'undefined'){
          var reader = new FileReader();
          var img = $('<img />');

          reader.onload = function (e) {
            img.attr('src', e.target.result);
          }
          /* ToDo: do something with the img! */
          console.log("IN ONNEWFILE")

          editImageBeforeUpload(file, reader)
          reader.readAsDataURL(file);
        }
      },
      onBeforeUpload: function(id){
        // about tho start uploading a file
        ui_add_log('Starting the upload of #' + id);
        ui_multi_update_file_progress(id, 0, '', true);
        ui_multi_update_file_status(id, 'uploading', 'Uploading...');
      },
      onUploadProgress: function(id, percent){
        // Updating file progress
        ui_multi_update_file_progress(id, percent);
      },


      onUploadSuccess: function(id, data){
        // A file was successfully uploaded
        ui_add_log('Server Response for file #' + id + ': ' + JSON.stringify(data));
        ui_add_log('Upload of file #' + id + ' COMPLETED', 'success');
        ui_multi_update_file_status(id, 'success', 'Upload Complete');
        ui_multi_update_file_progress(id, 100, 'success', false);

        // 들어감
        $('#uploaderFile' + id).prop('path', data.path);
      },

      onUploadError: function(id, xhr, status, message){
        // Happens when an upload error happens
        ui_multi_update_file_status(id, 'danger', message);
        ui_multi_update_file_progress(id, 0, 'danger', false);
      },
      onFallbackMode: function(){
        // When the browser doesn't support this plugin :(
        ui_add_log('Plugin cant be used here, running Fallback callback', 'danger');
      },
      onFileSizeError: function(file){
        ui_add_log('File \'' + file.name + '\' cannot be added: size excess limit', 'danger');
      }
    });
  });

</script>