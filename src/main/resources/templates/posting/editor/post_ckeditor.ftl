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

  window.watchdog = watchdog;

  watchdog.setCreator( ( element, config ) => {
    return CKSource.Editor
      .create( element, config )
      .then( editor => {
        return editor;
      } )
  } );

  watchdog.setDestructor( editor => {



    return editor.destroy();
  } );

  watchdog.on( 'error', handleError );

  watchdog
    .create( document.querySelector( '.editor' ), {
      licenseKey: '',
      removePlugins: ['Title'],
    } )
    .catch( handleError );

  function handleError( error ) {
    console.error( 'Oops, something went wrong!' );
    console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
    console.warn( 'Build id: fkleqib0upuz-mkxcczoq04jk' );
    console.error( error );
  }

</script>