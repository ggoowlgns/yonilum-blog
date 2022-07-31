<link rel="stylesheet" type="text/css" href="/assets/css/ckeditor/styles.css">
<div class="centered">
  <div class="row row-editor">
    <div class="editor-container">
      <div class="editor">
      </div>
    </div>
  </div>
</div>

<script src="/assets/js/ckeditor/ckeditor.js"></script>
<script>
  const watchdog = new CKSource.EditorWatchdog();
  let ckeditor;

  window.watchdog = watchdog;

  watchdog.setCreator( ( element, config ) => {
    return CKSource.Editor
      .create( element, config )
      .then( newEditor => {
          ckeditor = newEditor;
          return newEditor;
      } )
  } );

  watchdog.setDestructor( editor => {



    return editor.destroy();
  } );

  watchdog.on( 'error', handleError );

  watchdog
    .create( document.querySelector( '.editor' ), {
      extraPlugins: [ MyCustomUploadAdapterPlugin ],
      licenseKey: '',
      removePlugins: ['Title','Markdown'],
    } )
    .catch( handleError );

  function handleError( error ) {
    console.error( 'Oops, something went wrong!' );
    console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
    console.warn( 'Build id: fkleqib0upuz-mkxcczoq04jk' );
    console.error( error );
  }
  function MyCustomUploadAdapterPlugin( editor ) {
      editor.plugins.get( 'FileRepository' ).createUploadAdapter = ( loader ) => {
          return new MyUploadAdapter( loader );
      };
  }

  class MyUploadAdapter {
      constructor( loader ) {
          this.loader = loader;
          this.url = '${redirect_uri}/api/image/uploads';
      }

      // Starts the upload process.
      upload() {
          return new Promise( ( resolve, reject ) => {
              this.loader.file.then((file) => {
                  this._initRequest();
                  this._initListeners(resolve, reject, file);
                  this._sendRequest(file);
              });
          } );
      }

      // Aborts the upload process.
      abort() {
          if ( this.xhr ) {
              this.xhr.abort();
          }
      }

      // Example implementation using XMLHttpRequest.
      _initRequest() {
          const xhr = this.xhr = new XMLHttpRequest();

          xhr.open( 'POST', this.url, true );
          xhr.responseType = 'json';
      }

      // Initializes XMLHttpRequest listeners.
      _initListeners( resolve, reject, file ) {
          const xhr = this.xhr;
          const loader = this.loader;
          const genericErrorText = 'Couldn\'t upload file:' + loader.file.name

          xhr.addEventListener( 'error', () => reject( genericErrorText ) );
          xhr.addEventListener( 'abort', () => reject() );
          xhr.addEventListener( 'load', () => {
              const response = xhr.response;

              if (!response || response.error) {
                  return reject(response && response.error ? response.error.message : genericErrorText);
              }
          // If the upload is successful, resolve the upload promise with an object containing
         // at least the "default" URL, pointing to the image on the server.
              resolve( {
                  default: response.path
              } );
          } );

          if ( xhr.upload ) {
              xhr.upload.addEventListener( 'progress', evt => {
                  if ( evt.lengthComputable ) {
                      loader.uploadTotal = evt.total;
                      loader.uploaded = evt.loaded;
                  }
              } );
          }
      }

      // Prepares the data and sends the request.
      _sendRequest(file) {
          const data = new FormData();

          data.append( 'file', file);

          this.xhr.send( data );
      }
  }

</script>