<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>HTML Preview (markdown to html) - Editor.md examples</title>
        <link rel="stylesheet" href="../../css/style.css" />
        <link rel="stylesheet" href="../../js/editormd.preview.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
        <style>
            body {padding: 40px;}
            
            #layout > header, .btns {
                width: auto;
            }
            
            #sidebar {
                width: 400px;
                height: 100%;
                position: fixed;
                top: 0;
                right: 0;
                overflow: hidden;
                background: #fff;
                z-index: 100;
                padding: 18px; 
                border: 1px solid #ddd;
                border-top: none;
                border-bottom: none;
            }
            
            #sidebar:hover {
                overflow: auto;
            }
            
            #sidebar h1 {
                font-size: 16px;
            }
            
            #custom-toc-container {
                padding-left: 0;
            }
            
            #test-editormd-view, #test-editormd-view2 {
                padding-left: 0;
                padding-right: 430px;
                margin: 0;
            }
        </style>
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>Markdown转HTML的显示处理之自定义 ToC 容器</h1> 
                <p>即：非编辑情况下的HTML预览</p>
                <p>HTML Preview (markdown to html and custom ToC container)</p>       
            </header>
            <div class="btns">
                <button onclick="location.href='html-preview-markdown-to-html.html';">返回 Back</button>
            </div>
            <div id="sidebar">
                <h1>Table of Contents</h1>
                <div class="markdown-body editormd-preview-container" id="custom-toc-container">#custom-toc-container</div>
            </div>
            <div id="test-editormd-view">
               <textarea style="display:none;" name="test-editormd-markdown-doc">###Hello world!</textarea>               
            </div>
            <div id="test-editormd-view2">
                <textarea id="append-test" style="display:none;">

###科学公式 TeX(KaTeX)
                    
$$E=mc^2$$

行内的公式$$E=mc^2$$行内的公式，行内的$$E=mc^2$$公式。

$$\(\sqrt{3x-1}+(1+x)^2\)$$
                    
$$\sin(\alpha)^{\theta}=\sum_{i=0}^{n}(x^i + \cos(f))$$

$$X^2 > Y$$

#####上标和下标

上标：X&lt;sup&gt;2&lt;/sup&gt;

下标：O&lt;sub&gt;2&lt;/sub&gt;

##### 代码块里包含的过滤标签及属性不会被过滤

```html
&lt;style type="text/style"&gt;
body{background:red;}
&lt;/style&gt;

&lt;script type="text/javscript"&gt;
alert("script");
&lt;/script&gt;

&lt;iframe height=498 width=510 src="http://player.youku.com/embed/XMzA0MzIwMDgw" frameborder=0 allowfullscreen&gt;&lt;/iframe&gt;
```

#####Style

&lt;style&gt;
body{background:red;}
&lt;/style&gt;

&lt;style type="text/style"&gt;
body{background:red;}
&lt;/style&gt;

#####Script

&lt;script&gt;
alert("script");
&lt;/script&gt;

&lt;script type="text/javscript"&gt;
alert("script");
&lt;/script&gt;</textarea>          
            </div>
        </div>
        <!-- <script src="js/zepto.min.js"></script>
		<script>		
			var jQuery = Zepto;  // 为了避免修改flowChart.js和sequence-diagram.js的源码，所以使用Zepto.js时想支持flowChart/sequenceDiagram就得加上这一句
		</script> -->
        <script src="../../js/jquery.min.js"></script>
        <script src="../lib/marked.min.js"></script>
        <script src="../lib/prettify.min.js"></script>
        
        <script src="../lib/raphael.min.js"></script>
        <script src="../lib/underscore.min.js"></script>
        <script src="../lib/sequence-diagram.min.js"></script>
        <script src="../lib/flowchart.min.js"></script>
        <script src="../lib/jquery.flowchart.min.js"></script>

        <script src="../../js/editormd.js"></script>
        <script type="text/javascript">
            $(function() {
                var testEditormdView, testEditormdView2;
                
                $.get("test.md", function(markdown) {
                    
				    testEditormdView = editormd.markdownToHTML("test-editormd-view", {
                        markdown        : markdown ,//+ "\r\n" + $("#append-test").text(),
                        //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
                        htmlDecode      : "style,script,iframe",  // you can filter tags decode
                        //toc             : false,
                        tocm            : true,    // Using [TOCM]
                        tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
                        //gfm             : false,
                        //tocDropdown     : true,
                        // markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
                        emoji           : true,
                        taskList        : true,
                        tex             : true,  // 默认不解析
                        flowChart       : true,  // 默认不解析
                        sequenceDiagram : true,  // 默认不解析
                    });
                    
                    //console.log("返回一个 jQuery 实例 =>", testEditormdView);
                    
                    // 获取Markdown源码
                    //console.log(testEditormdView.getMarkdown());
                    
                    //alert(testEditormdView.getMarkdown());
                });
                    
                testEditormdView2 = editormd.markdownToHTML("test-editormd-view2", {
                    htmlDecode      : "style,script,iframe",  // you can filter tags decode
                    emoji           : true,
                    taskList        : true,
                    tex             : true,  // 默认不解析
                    flowChart       : true,  // 默认不解析
                    sequenceDiagram : true,  // 默认不解析
                });
            });
        </script>
    </body>
</html>