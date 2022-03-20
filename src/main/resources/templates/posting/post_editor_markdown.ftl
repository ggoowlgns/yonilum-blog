<#--https://simplemde.com/-->

<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
  <script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
  <script src="https://cdn.jsdelivr.net/highlight.js/latest/highlight.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/highlight.js/latest/styles/github.min.css">
  <style>
      .editor-preview h1,
      .editor-preview h2,
      .editor-preview h3,
      .editor-preview h4,
      .editor-preview h5{
          margin-bottom:10px;
      }

      .editor-preview h1{
          border-bottom:1px solid #ddd;
      }

      .editor-preview h1{
          border-bottom:1px solid #eee;
      }
  </style>
</head>
<body>
  <textarea id="MyID">
  </textarea>

</body>

<script>
  // Most options demonstrate the non-default behavior
  var simplemde = new SimpleMDE({
    autofocus: true,
    autosave: {
      enabled: true,
      uniqueId: "MyUniqueID",
      delay: 1000,
    },
    blockStyles: {
      bold: "__",
      italic: "_"
    },
    element: document.getElementById("MyID"),
    forceSync: true,
    hideIcons: ["guide", "heading"],
    indentWithTabs: false,
    initialValue: "Hello world!",
    insertTexts: {
      horizontalRule: ["", "\n\n-----\n\n"],
      image: ["![](http://", ")"],
      link: ["[", "](http://)"],
      table: ["", "\n\n| Column 1 | Column 2 | Column 3 |\n| -------- | -------- | -------- |\n| Text     | Text      | Text     |\n\n"],
    },
    lineWrapping: false,
    /*parsingConfig: {
      allowAtxHeaderWithoutSpace: true,
      strikethrough: true,
      underscoresBreakWords: true,
    },*/
    placeholder: "Type here...",
/*    previewRender: function(plainText) {
      return customMarkdownParser(plainText); // Returns HTML from a custom parser
    },
    previewRender: function(plainText, preview) { // Async method
      setTimeout(function(){
        preview.innerHTML = customMarkdownParser(plainText);
      }, 250);

      return "Loading...";
    },*/
    /*promptURLs: true,
    renderingConfig: {
      singleLineBreaks: false,
      codeSyntaxHighlighting: true,
    },
    shortcuts: {
      drawTable: "Cmd-Alt-T"
    },
    showIcons: ["code", "table"],
    spellChecker: false,
    status: false,
    status: ["autosave", "lines", "words", "cursor"], // Optional usage
    status: ["autosave", "lines", "words", "cursor", {
      className: "keystrokes",
      defaultValue: function(el) {
        this.keystrokes = 0;
        el.innerHTML = "0 Keystrokes";
      },
      onUpdate: function(el) {
        el.innerHTML = ++this.keystrokes + " Keystrokes";
      }
    }], // Another optional usage, with a custom status bar item that counts keystrokes

    styleSelectedText: false,
    tabSize: 4,*/
  });
</script>