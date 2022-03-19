<script src="https://unpkg.com/stackedit-js@1.0.7/docs/lib/stackedit.min.js"></script>

<script>
  // Get the textarea.
  const el = document.querySelector('textarea');

  // Create the Stackedit object.
  const stackedit = new Stackedit();

  // Open the iframe
  stackedit.openFile({
    name: 'Filename', // with a filename
    content: {
      text: el.value // and the Markdown content.
    }
  });

  // Listen to StackEdit events and apply the changes to the textarea.
  stackedit.on('fileChange', (file) => {
    el.value = file.content.text;
  });
</script>
