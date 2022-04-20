<#--Deprecated-->
<head>
  <!-- Editor's Dependecy Style -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
  <!-- Editor's Style -->
  <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>
<div id="editor"></div>
</body>

<body>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.js"></script>
<script>
  const editor = new toastui.Editor({
    el: document.querySelector('#editor'),
    // previewStyle: 'vertical',
    previewStyle: 'tab',
    height: '500px',
    initialValue: 'asdasd'
  });

  editor.getMarkdown();
</script>
</body>