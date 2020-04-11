<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html lang="zh">
<head Set-Cookie: widget_session=abc123; SameSite=None; Secure>
<%--    <link rel="stylesheet" type="text/css" href="mystyle.css" />--%>
    <meta charset="utf-8"/>
    <title>md编辑</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/editormd.css"/>
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon">
    <style>
        body {
            background-color: #d0e4fe;
            padding: 20px
        }

        h1 {
            /*color:orange;*/
            /*text-align:center;*/
        }

        p {
            /*font-family:"Times New Roman";*/
            /*font-size:20px;*/
        }

        label {
            font-family: "Times New Roman";
            font-size: 22px;
            text-align: left;
        }

        input {
            font-family: "Times New Roman";
            font-size: 18px;
            text-align: left; margin-bottom: 10px;

        }
        form div{

        }

    </style>

</head>
<body>
<a href="${pageContext.request.contextPath }/blog/findlist"> 查看列表<a />
<a href="${pageContext.request.contextPath }/beta/icon"> 图标库<a />
<br>
用户：${user.name}
<form name="BlogEditorForm">
    <div  style="color: sienna; margin-left: 150px ;text-align: left" >
        <label for="title">标题:</label>
        <input type="text" name="title" id="title" autofocus="autofocus"/><br/>
        <label for="author">作者:</label>
        <input type="text" name="author" id="author"/><br/>
        <%--    E-mail: <input type="email" name="email" autocomplete="off" /><br />--%>
        <%--    <input type="submit" />--%>
    </div>
    <div id="test-editormd">
        <!--该区域内容为md文本内容，非html内容-->
        <textarea name="content" id="content" style="display:none;" charset=UTF-8>>text文本内容</textarea>
    </div>
</form>

<%--
<div id="layout">
    <header>
        <h1>Simple example</h1>
    </header>
    <div id="test-editormd2">
                <textarea style="display:none;">[TOC]

#### Disabled options

- TeX (Based on KaTeX);
- Emoji;
- Task lists;
- HTML tags decode;
- Flowchart and Sequence Diagram;

#### Editor.md directory

    editor.md/
            lib/
            css/
            scss/
            tests/
            fonts/
            images/
            plugins/
            examples/
            languages/
            editormd.js
            ...

```html
&lt;!-- English --&gt;
&lt;script src="../dist/js/languages/en.js"&gt;&lt;/script&gt;

&lt;!-- 繁體中文 --&gt;
&lt;script src="../dist/js/languages/zh-tw.js"&gt;&lt;/script&gt;
```
</textarea>
    </div>
</div>
--%>


<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/editormd.min.js"></script>
<script type="text/javascript">
    var testEditor;

    /*提交表单的js*/
    function contentCommit() {
        BlogEditorForm.method = "post";
        BlogEditorForm.action = "${pageContext.request.contextPath}/blog/add";//提交至服务器的路径
        BlogEditorForm.submit();
    }

    $(function () {
        testEditor = editormd("test-editormd", {
            width: "90%",
            height: 640,
            syncScrolling: "single",
            path: "${pageContext.request.contextPath }/js/lib/",
            saveHTMLToTextarea : false,
            /**下述为新增，上面一行记得加逗号结束*/
            /*指定需要显示的功能按钮*/
            toolbarIcons: function () {
                return ["undo", "redo", "|", "bold", "italic", "ucwords", "uppercase", "lowercase", "|", "h1", "h2", "h3", "h4", "h5", "h6", "|", "list-ul", "list-ol", "table", "datetime", "hr", "||", "watch", "fullscreen", "preview", "releaseIcon", "index"]
            },

            /*自定义功能按钮，下面我自定义了2个，一个是发布，一个是返回首页*/
            toolbarIconTexts: {
                releaseIcon: "<span bgcolor=\"gray\">提交</span>",
                index: "<span bgcolor=\"red\">其他</span>",
            },

            /*给自定义按钮指定回调函数*/
            toolbarHandlers: {
                releaseIcon: function (cm, icon, cursor, selection) {
                    contentCommit();//提交表单代码在下面
                    console.log("日志输出 testIcon =>", this, cm, icon, cursor, selection);
                },
                index: function () {
                    window.location.href = '返回首页的路径.html';
                },
            }
        });
        //读取剪切板
        $("#test-editormd").on('paste', function (ev) {
            var topicCode = $("#topicCode").val();
            //详细可查看clipboardData属性的使用方式
            var data = (ev.clipboardData || ev.originalEvent.clipboardData);
            var items1 = data.items;
            console.log(items1);//输出 DataTransferItem对象
            var imageFile;
            for(var index in items1){
                var item = items1[index];
                //如果kind是file，可以用getAsFile()方法获取到文件
                if (item.kind === 'file') {
                    imageFile = item.getAsFile();
                    console.log('获取到剪贴板的文件' + item.kind);
                    break;
                }else if(item.kind === 'string'){
                    console.log('获取到剪贴板的字符串' + item.kind);
                }
            }

            //执行上传
            uploadTrigger(imageFile,topicCode);
        });
        //执行上传
        function uploadTrigger(imageFile,topicCode){
            //topicCode为文章代码，需要在关联图片，从而实现预览时准确加载到图片
            var url = "uploadMdFile.json?topicCode="+topicCode;
            var formdata = new FormData();
            formdata.append("file", imageFile);

            $.ajax({
                url: url,
                type: "post",
                data: formdata,
                //关闭序列化
                processData: false,
                contentType: false,
                success: function (data) {
                    //data为后台返回的retMap数据
                    if(data.retCode == "success"){
                        //向markdown区域插入该格式的值，从而实现图片在右侧显示
                        testEditor.insertValue("\n![" + data.file + "](" + data.rootPath + ")");
                    } else {
                        console.log(data.msg);
                    }
                },
                error : function(data){
                }
            });
        }
        /*
        // or
        testEditor = editormd({
            id      : "test-editormd",
            width   : "90%",
            height  : 640,
            path    : "../lib/"
        });
        */
        // ------


    });


</script>
</body>
<foot>
    <a href="http://beian.miit.gov.cn/" target="_blank" style="color:#666">陕ICP备18016856号</a>
</foot>
</html>