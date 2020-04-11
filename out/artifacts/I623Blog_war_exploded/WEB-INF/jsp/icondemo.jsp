<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head><!--[if lt IE 9]>
    <script language="javascript" type="text/javascript" src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <meta charset="UTF-8"><style>/*
 * Bootstrap v2.2.1
 *
 * Copyright 2012 Twitter, Inc
 * Licensed under the Apache License v2.0
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Designed and built with all the love in the world @twitter by @mdo and @fat.
 */
.clearfix {
  *zoom: 1;
}
.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
  line-height: 0;
}
.clearfix:after {
  clear: both;
}
html {
  font-size: 100%;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
}
a:focus {
  outline: thin dotted #333;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px;
}
a:hover,
a:active {
  outline: 0;
}
button,
input,
select,
textarea {
  margin: 0;
  font-size: 100%;
  vertical-align: middle;
}
button,
input {
  *overflow: visible;
  line-height: normal;
}
button::-moz-focus-inner,
input::-moz-focus-inner {
  padding: 0;
  border: 0;
}
body {
  margin: 0;
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 14px;
  line-height: 20px;
  color: #333;
  background-color: #fff;
}
a {
  color: #08c;
  text-decoration: none;
}
a:hover {
  color: #005580;
  text-decoration: underline;
}
.row {
  margin-left: -20px;
  *zoom: 1;
}
.row:before,
.row:after {
  display: table;
  content: "";
  line-height: 0;
}
.row:after {
  clear: both;
}
[class*="span"] {
  float: left;
  min-height: 1px;
  margin-left: 20px;
}
.container,
.navbar-static-top .container,
.navbar-fixed-top .container,
.navbar-fixed-bottom .container {
  width: 940px;
}
.span12 {
  width: 940px;
}
.span11 {
  width: 860px;
}
.span10 {
  width: 780px;
}
.span9 {
  width: 700px;
}
.span8 {
  width: 620px;
}
.span7 {
  width: 540px;
}
.span6 {
  width: 460px;
}
.span5 {
  width: 380px;
}
.span4 {
  width: 300px;
}
.span3 {
  width: 220px;
}
.span2 {
  width: 140px;
}
.span1 {
  width: 60px;
}
[class*="span"].pull-right,
.row-fluid [class*="span"].pull-right {
  float: right;
}
.container {
  margin-right: auto;
  margin-left: auto;
  *zoom: 1;
}
.container:before,
.container:after {
  display: table;
  content: "";
  line-height: 0;
}
.container:after {
  clear: both;
}
p {
  margin: 0 0 10px;
}
.lead {
  margin-bottom: 20px;
  font-size: 21px;
  font-weight: 200;
  line-height: 30px;
}
small {
  font-size: 85%;
}
h1 {
  margin: 10px 0;
  font-family: inherit;
  font-weight: bold;
  line-height: 20px;
  color: inherit;
  text-rendering: optimizelegibility;
}
h1 small {
  font-weight: normal;
  line-height: 1;
  color: #999;
}
h1 {
  line-height: 40px;
}
h1 {
  font-size: 38.5px;
}
h1 small {
  font-size: 24.5px;
}
body {
  margin-top: 90px;
}
.header {
  position: fixed;
  top: 0;
  left: 50%;
  margin-left: -480px;
  background-color: #fff;
  border-bottom: 1px solid #ddd;
  padding-top: 10px;
  z-index: 10;
}
.footer {
  color: #ddd;
  font-size: 12px;
  text-align: center;
  margin-top: 20px;
}
.footer a {
  color: #ccc;
  text-decoration: underline;
}
.the-icons {
  font-size: 14px;
  line-height: 24px;
}
.switch {
  position: absolute;
  right: 0;
  bottom: 10px;
  color: #666;
}
.switch input {
  margin-right: 0.3em;
}
.codesOn .i-name {
  display: none;
}
.codesOn .i-code {
  display: inline;
}
.i-code {
  display: none;
}
@font-face {
      font-family: 'fontello';
      src: url('../../iconp/font/fontello.eot?1304040');
      src: url('../../iconp/font/fontello.eot?1304040#iefix') format('embedded-opentype'),
           url('../../iconp/font/fontello.woff?1304040') format('woff'),
           url('../../iconp/font/fontello.ttf?1304040') format('truetype'),
           url('../../iconp/font/fontello.svg?1304040#fontello') format('svg');
      font-weight: normal;
      font-style: normal;
    }
     
     
    .demo-icon
    {
      font-family: "fontello";
      font-style: normal;
      font-weight: normal;
      speak: none;
     
      display: inline-block;
      text-decoration: inherit;
      width: 1em;
      margin-right: .2em;
      text-align: center;
      /* opacity: .8; */
     
      /* For safety - reset parent styles, that can break glyph codes*/
      font-variant: normal;
      text-transform: none;
     
      /* fix buttons height, for twitter bootstrap */
      line-height: 1em;
     
      /* Animation center compensation - margins should be symmetric */
      /* remove if not needed */
      margin-left: .2em;
     
      /* You can be more comfortable with increased icons size */
      /* font-size: 120%; */
     
      /* Font smoothing. That was taken from TWBS */
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
     
      /* Uncomment for 3D effect */
      /* text-shadow: 1px 1px 1px rgba(127, 127, 127, 0.3); */
    }
     </style>
    <link rel="stylesheet" href="../../iconp/css/animation.css"><!--[if IE 7]>
    <link rel="stylesheet" href="../../iconp/css" + font.fontname + "-ie7.css"><![endif]-->
    <script>
      function toggleCodes(on) {
        var obj = document.getElementById('icons');
      
        if (on) {
          obj.className += ' codesOn';
        } else {
          obj.className = obj.className.replace(' codesOn', '');
        }
      }
      
    </script>
  </head>
  <body>
    <div class="container header">
      <h1>fontello <small>font demo</small></h1>
      <label class="switch">
        <input type="checkbox" onclick="toggleCodes(this.checked)">show codes
      </label>
    </div>
    <div class="container" id="icons">
      <div class="row">
        <div class="the-icons span3" title="Code: 0xe800"><i class="demo-icon icon-emo-happy">&#xe800;</i> <span class="i-name">icon-emo-happy</span><span class="i-code">0xe800</span></div>
        <div class="the-icons span3" title="Code: 0xe801"><i class="demo-icon icon-search">&#xe801;</i> <span class="i-name">icon-search</span><span class="i-code">0xe801</span></div>
        <div class="the-icons span3" title="Code: 0xe802"><i class="demo-icon icon-emo-unhappy">&#xe802;</i> <span class="i-name">icon-emo-unhappy</span><span class="i-code">0xe802</span></div>
        <div class="the-icons span3" title="Code: 0xe803"><i class="demo-icon icon-mail">&#xe803;</i> <span class="i-name">icon-mail</span><span class="i-code">0xe803</span></div>
      </div>
      <div class="row">
        <div class="the-icons span3" title="Code: 0xe804"><i class="demo-icon icon-star-empty">&#xe804;</i> <span class="i-name">icon-star-empty</span><span class="i-code">0xe804</span></div>
        <div class="the-icons span3" title="Code: 0xe805"><i class="demo-icon icon-star">&#xe805;</i> <span class="i-name">icon-star</span><span class="i-code">0xe805</span></div>
        <div class="the-icons span3" title="Code: 0xe806"><i class="demo-icon icon-ok">&#xe806;</i> <span class="i-name">icon-ok</span><span class="i-code">0xe806</span></div>
        <div class="the-icons span3" title="Code: 0xe807"><i class="demo-icon icon-ok-circled">&#xe807;</i> <span class="i-name">icon-ok-circled</span><span class="i-code">0xe807</span></div>
      </div>
      <div class="row">
        <div class="the-icons span3" title="Code: 0xe808"><i class="demo-icon icon-ok-circled2">&#xe808;</i> <span class="i-name">icon-ok-circled2</span><span class="i-code">0xe808</span></div>
        <div class="the-icons span3" title="Code: 0xe809"><i class="demo-icon icon-cancel">&#xe809;</i> <span class="i-name">icon-cancel</span><span class="i-code">0xe809</span></div>
        <div class="the-icons span3" title="Code: 0xe80a"><i class="demo-icon icon-link">&#xe80a;</i> <span class="i-name">icon-link</span><span class="i-code">0xe80a</span></div>
        <div class="the-icons span3" title="Code: 0xe80b"><i class="demo-icon icon-lock">&#xe80b;</i> <span class="i-name">icon-lock</span><span class="i-code">0xe80b</span></div>
      </div>
      <div class="row">
        <div class="the-icons span3" title="Code: 0xe80c"><i class="demo-icon icon-emo-grin">&#xe80c;</i> <span class="i-name">icon-emo-grin</span><span class="i-code">0xe80c</span></div>
        <div class="the-icons span3" title="Code: 0xe80d"><i class="demo-icon icon-lock-open">&#xe80d;</i> <span class="i-name">icon-lock-open</span><span class="i-code">0xe80d</span></div>
        <div class="the-icons span3" title="Code: 0xe80e"><i class="demo-icon icon-thumbs-up">&#xe80e;</i> <span class="i-name">icon-thumbs-up</span><span class="i-code">0xe80e</span></div>
        <div class="the-icons span3" title="Code: 0xe839"><i class="demo-icon icon-spin6 animate-spin">&#xe839;</i> <span class="i-name">icon-spin6</span><span class="i-code">0xe839</span></div>
      </div>
      <div class="row">
        <div class="the-icons span3" title="Code: 0xf14a"><i class="demo-icon icon-ok-squared">&#xf14a;</i> <span class="i-name">icon-ok-squared</span><span class="i-code">0xf14a</span></div>
        <div class="the-icons span3" title="Code: 0xf164"><i class="demo-icon icon-thumbs-up-alt">&#xf164;</i> <span class="i-name">icon-thumbs-up-alt</span><span class="i-code">0xf164</span></div>
        <div class="the-icons span3" title="Code: 0xf234"><i class="demo-icon icon-user-plus">&#xf234;</i> <span class="i-name">icon-user-plus</span><span class="i-code">0xf234</span></div>
        <div class="the-icons span3" title="Code: 0xf235"><i class="demo-icon icon-user-times">&#xf235;</i> <span class="i-name">icon-user-times</span><span class="i-code">0xf235</span></div>
      </div>
    </div>
    <div class="container footer">Generated by <a href="http://fontello.com">fontello.com</a></div>
  </body>
</html>