/* ------------------ GENERAL --------------- */
img {
        border: none;
}

a {
    text-decoration: underline;
    color: white;
}

a.visited {
    text-decoration: underline;
    color: white;
}

/* ------------------ LAYOUT ---------------- */
.wrapper{
    width: 1024px;
    margin: 0 auto;
    -moz-background-clip:border;
    -moz-background-inline-policy:continuous;
    -moz-background-origin:padding;
}
.header{
    float: left;
    width: 100%;
    /*background-color: #f4f4f4;
    border: red solid 1px;*/
    height: 65px;
    margin-top:15px;
}
.content_wrapper{
    float: left;
    width: 100%;
    margin-top: 10px;
    /*border: yellow solid 5px;*/
    /*background-color: #fff*/
}
.main_content{
    margin-right:18px;
    margin-left:18px;
    /*background-color: #afeeee;
    border: yellow solid 1px; */
    height: 650px;
    filter:alpha(opacity=80);
    -moz-opacity: 0.8;
    opacity: 0.8;
}
.left{
    float: left;
    width: 18px;
    margin-left: -100%;
    height: 200px;
    /*background-color: #cfcfcf;*/
}
.right{
    float: left;
    width: 18px;
    margin-left: -18px;
    height: 200px;
    /*background-color: #cfcfcf;*/
}
.footer{
    border: 1px solid #2e3436;
    display:block;
    margin-bottom:10px;
    margin-top:10px;
    overflow:hidden;
    position: relative;
    background-color: #D0D0D0;
    height: 30px;
    float: left;
    width: 100%;
}
body {
    padding: 0px;
    margin: 0px;
    background: #2e3436 url('../images/06022010_1024.jpg') no-repeat fixed top center;
    font-size: 8pt;
    /*font-family: verdana, arial, helvetica, sans-serif;*/
    font-family: "Avant Garde", "Century Gothic", sans-serif;
    color: white;

}
.wrapper_header{
    width: 100%;
    margin: 0 auto;
    position: relative;
    float: left;
    width: 100%;
    left: 0%;
}
.header_header{
    position: relative;
    float: left;
    width: 100%;
    left: 0%;
    height: 0px;
    font-size: 10pt;
    /*font-family: verdana, arial, helvetica, sans-serif;*/
    font-family: "Avant Garde", "Century Gothic", sans-serif;
    text-align: left;
    margin-left: 585px;
}
.wrapbranding{
   position: relative;
   float: left;
   left: 0.00%;
   width: 40.00%;
   text-align: center;
}

.login_box{
   float: right;
   position: relative;

   right: 0%;
   width: 48%;
   margin-left: -100%;
   left: 0px;
}

.user_info{
   float: right;
   right: 0%;
   width: 48%;
   text-align: right;
   font-size: 12px;
   margin-right: 35px;
}

.branding{

    /*background-color: #afeeee;*/
    height: 80px;
    margin-top: 0px;
    padding-right: 25px;
}

.branding h1 {
    margin: 0px;
    color:white;
    font-weight:bold;
    font-size: 36px;
    letter-spacing:-1px;
    padding: 0px;
    text-decoration: none;
}

.branding h1 a {
     text-decoration: none;
}

.beta {
    color: yellow;
    vertical-align: super;
    font-size: 11px;
    font-family: Verdana;
    text-decoration: none;
}

.beta a {
    color: yellow;
    vertical-align: super;
    font-size: 11px;
    font-family: Verdana;
    text-decoration: none;
}

.branding h2{
    font-style: normal;
    font-weight: bold;
    color: #666;
    font-size: 1.5em;
    margin: 0px;
}

.footer_header{
   position: relative;
   float: left;
   left: 0.00%;
   width: 100.00%;
}

/* ------------------ ELADIO -------------- */
/* ------------------ FORMS ---------------- */

input, select, button {
    font-size: 12px;
    /*font-family: Arial, Helvetica, sans-serif;*/
    font-family: "Avant Garde", "Century Gothic", sans-serif;
}

div.row {
    clear: both;
    padding-top: 5px;
    height: 0px;
}

div.row label.c_label {
    float: left;
    width: 50px;
    text-align: right;
    margin-right: 5px;
    font-size: 14px;
    /*font-family: Arial, Helvetica, sans-serif;*/
    font-family: "Avant Garde", "Century Gothic", sans-serif;
}

div.row input {
    float: left;
    width: 100px;
    text-align: left;
    border: 1px solid ;
    margin-left: 30px;
}

/* Quitado por botones de courses
div.row button {
    float: left;
    width: 100px;
    text-align: left;
    border: 1px solid ;
    margin-left: 30px;
}
*/

div.row .submit {
    width: 102px;
    text-align: center;
}

/* --- Navigation ---------------------------------------------------------- */

#navigation_main {
    /*float: left;*/
    border: 0px solid #FFF;
    height: 40px;
    width: 1002px;
    margin: 0px auto;
    margin-top: 15px;
    margin-bottom: 0px;
    margin-left: 17px;
/*    color: black;
    text-align: center;
    padding-top: 10px;
    padding-bottom: 10px;
*/
    filter: alpha(opacity=90);
    -moz-opacity: 0.9;
    opacity: 0.9;
}

/**
#navigation_main li {
    display:inline;
    margin: 25px;
    font-size: 14px;
}

#navigation_main li a {
    padding:0.2em 1em;
    background:#fc6;
    color:#000;
    text-decoration:none;
    float:left;
    border:1px solid #000;
}

#navigation_main li a:hover {
    background:#08c;
    color:#fff;
}
**/

   /* defaults for all examples */
.kwicks {
    list-style: none;
    position: relative;
    margin: 0;
    padding: 0;
}
.kwicks li{
    display: block;
    overflow: hidden;
    padding: 0;
    cursor: pointer;
}

.kwicks li{
    float: left;
    /*width: 154px;*/
    width: 187px;
    height: 25px;
    margin-right: 5px;
}

#menu a {
    text-decoration: none;
    color: #fff;
    font-size: 14px;
    font-weight: bold;
}
#kwick1 {
    background-color: #369D47;
    /*background-image: url('images/meet.gif');*/
    font-size: 14px;
    text-align: center;
    padding-top: 10px;
    border: 2px outset #1d5c2a;
}
#kwick2 {
    background-color: #1D5C2A;
    /*background-image: url('images/kwicks.gif');*/
    font-size: 14px;
    text-align: center;
    padding-top: 10px;
    border: 2px outset #369D47;
}
#kwick3 {
    background-color: #369D47;
    /*background-image: url('images/for.gif');*/
    font-size: 14px;
    text-align: center;
    padding-top: 10px;
    border: 2px outset #1d5c2a;
}
#kwick4 {
    background-color: #1D5C2A;
    /*background-image: url('images/jquery.gif');*/
    margin-right: none;
    font-size: 14px;
    text-align: center;
    padding-top: 10px;
    border: 2px outset #1d5c2a;
}
#kwick5 {
    background-color: #369D47;
    /*background-image: url('images/jquery.gif');*/
    margin-right: none;
    font-size: 14px;
    text-align: center;
    padding-top: 10px;
    border: 2px outset #1d5c2a;
}
#kwick6 {
    background-color: #1D5C2A;
    /*background-image: url('images/jquery.gif');*/
    margin-right: none;
    font-size: 14px;
    text-align: center;
    padding-top: 10px;
    border: 2px outset #1d5c2a;
}
#menu .current {
    border: 2px inset #1d5c2a;
    font-style: italic;
}
.returnToKwicks {
    display:block;
    border:1px dashed #888;
    padding:5px;
    float:right;
}

.returnToKwicks:hover {
    background-color: #5e5e76;
    text-decoration: none;
    color: #aaa;
}


/* --- User Info ----------------------------------------------------------- */

#user {
    float: left;
    font-size: 12px;
}

#logout {
    margin-top: 0px;
    margin-left: 5px;
    float: left;
}

/* --- Rounded boxes ------------------------------------------------------- */

/* Show only to IE PC \*/
* html .boxhead h2 {height: 1%;} /* For IE 5 PC */

.sidebox {
    margin: 0 auto; /* center for now */
    width: 1024px; /* ems so it will grow */
    background: url(../images/sbbody-r_g.gif) no-repeat bottom right;
    font-size: 100%;
}
.boxhead {
    background: url(../images/sbhead-r_g.gif) no-repeat top right;
    margin: 0;
    padding: 0;
    text-align: center;
}
.boxhead h2 {
        background: url(../images/sbhead-l_g.gif) no-repeat top left;
        margin: 0;
        padding: 2px 30px 5px;
        color: white;
        font-weight: bold;
        font-size: 1.2em;
        line-height: 1em;
        text-shadow: rgba(0,0,0,.4) 0px 2px 5px; /* Safari-only, but cool */
}
.boxbody {
        background: url(../images/sbbody-l_g.gif) no-repeat bottom left;
        margin: 0;
        padding: 5px 30px 31px;
}

#main_content {
   filter:alpha(opacity=80);
   -moz-opacity: 0.8;
   opacity: 0.8;

}

#login_box {
    position: absolute;
    top: 0px;
    left: 100px;
    margin-left: 0px;
    margin-top: 0px;
}


/* ---------------- TEXTBOX --------------------- */

.text_box {
    padding-left:20px;
    border: 10px solid #369d47;
    background-color: #1d5c2a;
    border-radius: 12px;
    -moz-border-radius: 12px;
    -webkit-border-radius: 12px;
    margin: 10px 14px 20px 0px;
}

.text_box h2 {
    color: white;
    font-size: 20px;
    font-weight: normal;
    /*font-family: Arial, Helvetica, sans-serif;*/
    font-family: "Avant Garde", "Century Gothic", sans-serif;
    font-weight: bold;
    margin-top: 10px;
    margin-bottom: 10px;
}

/*
.text_box a:link {
    color: white;
    font-style: italic;
    font-size: 14px;
    font-weight: normal;
    font-family: "Avant Garde", "Century Gothic", sans-serif;
    font-weight: bold;
}
*/

.masinfo {
    color: white;
    font-style: italic;
    font-size: 14px;
    font-weight: normal;
    font-family: "Avant Garde", "Century Gothic", sans-serif;
    font-weight: bold;
}

a.masinfo:link {
    color: white;
    font-style: italic;
    font-weight: normal;
    font-family: "Avant Garde", "Century Gothic", sans-serif;
    font-weight: bold;
}

a.masinfo:visited {
    color: white;
    font-style: italic;
    font-weight: normal;
    font-family: "Avant Garde", "Century Gothic", sans-serif;
    font-weight: bold;
}

.text_box h2
{
    color: white;
    font-size: 20px;
    font-weight: normal;
    /*font-family: Arial, Helvetica, sans-serif;*/
    font-family: "Avant Garde", "Century Gothic", sans-serif;
    font-weight: bold;
    text-decoration: none;
}

.text_box h2 a
{
    color: white;
    font-size: 20px;
    font-weight: normal;
    /*font-family: Arial, Helvetica, sans-serif;*/
    font-family: "Avant Garde", "Century Gothic", sans-serif;
    font-weight: bold;
    text-decoration: none;
}

.text_box h2 a:hover
{
    color: white;
    font-size: 20px;
    font-weight: normal;
    /*font-family: Arial, Helvetica, sans-serif;*/
    font-family: "Avant Garde", "Century Gothic", sans-serif;
    font-weight: bold;
    text-decoration: underline;
}

#internal_text {
    font-size: 18px;
}

#internal_text.presentation {
    font-size: 18px;
    margin-top: 20px;
    margin-bottom: 30px;
    margin-left: 0px;
    margin-right: 20px;
    overflow: auto;
}

#internal_text.presentation ul {
    list-style-type: none;
    text-decoration: none;
    margin-left: 0px;
    font-size:   13px;
    line-height: 18px;
}

#internal_text.presentation ol {
    font-size:   13px;
    line-height: 18px;
}

#internal_text.presentation li {
    font-size: 1.2em;
    margin-bottom: 15px;
    margin-left: 0px;
}

#textbox_2_2 {
    width: 440px;
    height: 180px;
    float: left;
}

#stats_resume {
    margin: 5px;
}


/*-- CARD STYLES -- */

/*
table.card td {
    text-align: center;
    font-size: 14px;
    color:black;
}
*/

table.card th {
    text-align: center;
    font-size: 12px;
    color: black;
}

table.card td.totals {
    font-weight: bold;
}

.card {
    font-size: 14px;
    text-align: center;
    width: 900px;
    background-color: white;
    color:black;
}

.card_player_name {
    font-size: 14px;
    text-align: left;
}

.card_player_info {
    font-size: 14px;
    text-align: center;
}

.car_player {
    text-align: center;
    color:black;
}

.card_info {
    color: black;
}

.card_info_leyend {
    color: black;
    text-align: right;
}

.hole_blue {
    background-color: #0000FF;
    text-align: center;
    color: black;
}

.hole_red {
    background-color: #FF0000;
    text-align: center;
    color: black;
}

.hole_yellow {
    background-color: #FFFF00;
    text-align: center;
    color: black;
}

.hole_white {
    background-color: #FFFFFF;
    text-align: center;
    color: black;
}

.stroke_edit {
font-size: 11px;
text-align: center;
}

.stroke_total {
font-size: 11px;
text-align: center;
border: none;
padding: 4px;
}

.putt_edit {
font-size: 11px;
text-align: center;
}

#toolbar {
    padding: 10px 4px;
}

/********** TABLAS DE RESULTADOS **************/
#result table a:link, #result table a:visited, #result table a:active {
    background-color: transparent;
    color: red;
    text-decoration: none;
}

#result table a:hover {
    background: transparent;
    color: #000000;
    text-decoration: underline;
}

#result table, #result td, #result th {
    margin: 0px;
    padding: 10px;
    height: 25px;
}

#result table tr {
    height: 125px;
}

#result tbody th {
    background-color: #524123;
    border-bottom: 2px solid #3d3019;
    border-top: 3px solid #6e572e;
    padding: 0px;
    color: #fff;
    font-size: 14px;
}

#result tbody td {
    text-align: left;
    padding-left: 10px;
    padding-top: 5px;
    padding-bottom: 5px;
    background-color: #D6F2C3;
    border-bottom: 2px solid #B3DE94;
    border-top: 3px solid #FFFFFF;
    font-size: 12px;
}

#result tbody tr.odd th, #result tbody tr.odd td {
    background-color: #C8EDAE;
    border-bottom: 2px solid #67BD2A;
}

#result tbody tr:hover td {
    background-color: #aAE899;
}

#result td, #result th {
    vertical-align: middle;
}

#result tfoot td, #result tfoot th {
    font-weight: bold;
    padding: 0px;
}

#result thead th {
    /*font-family: Arial, Helvetica, sans-serif;*/
    font-family: "Avant Garde", "Century Gothic", sans-serif;
    font-size: 12px;
    font-weight: bold;
    line-height: 19px;
    padding: 0px;
    white-space: nowrap;
}

#result table a {
    color: red;
    text-decoration: overline;
}

/* --------------- GALLERY -------------- */
.gallery ul.display {
    float: left;
    width: 910px;
    margin: 0;
    padding: 0;
    list-style: none;
    border-top: 1px solid #333;
    border-right: 1px solid #333;

}

.gallery ul.display {
    /*background: #572;*/
    /*background: #d0f48a;*/
    background: #b6f9a6;
}

.gallery ul.display li {
    float: left;
    width: 910px;
    padding: 0px;
    margin: 0;
    border-top: 1px solid #111;
    border-right: 1px solid #111;
    border-bottom: 1px solid #333;
    border-left: 1px solid #333;
    color: #0d6f1f;
}

.gallery ul.display li a {
    text-decoration: none;
    font-style: italic;
    color: #0d6f1f;
    font-weight: bold;
}

.gallery ul.display li .content_block {
    padding: 10px;
    text-align: center;
}

.gallery ul.display li .content_block h2 {
    margin: 0;
    padding: 5px;
    font-size: 1.1em;
}

.gallery ul.display li .content_block h2 a {
    margin: 0;
    padding: 5px;
    font-weight: bold;
    font-size: 14px;
}

.gallery ul.display li .content_block p {
    margin: 0;
    padding: 5px 5px 5px 2px;
    font-size: 1.2em;
}

.gallery ul.display li .content_block a img{
    padding: 3px;
    border: 2px solid #ccc;
    background: #fff;
    margin: 0 15px 0 0;
    float: left;
}

.gallery ul.thumb_view li {
    width: 180px;
    height: 190px;
}

.gallery ul.list_view li .content_block h2 a {
    margin: 0;
    margin-left: -10px;
    padding: 5px;
    padding-right: 10px;
    font-weight: bold;
    font-size: 17px;
    display: inline-block;
    float:left;
    white-space: nowrap;
    /*border: 1px solid red;
    background-color: gray;*/
}

.gallery ul.list_view li .content_block h3 {
    font-weight: normal;
    font-size: 13px;
    white-space: nowrap;
    text-align: right;
    /*border: 1px solid blue;*/
    background-color: silver;
    padding: 5px;
    margin-top: 2px;
    margin-right: 2px;
}

.gallery ul.list_view li .content_block p {
    text-align: left;
    margin-top: -7px;
    padding-bottom: 5px;
    /*border: 1px solid yellow;
    margin-bottom: 5px;*/
}

/*
.gallery ul.list_view li .content_block .content_block_image {
   position: relative;
   float: left;
   left: 5px;
   width: 20%;
   background-color:
}

.gallery ul.list_view li .content_block .content_block_text {
   position: relative;
   float: right;
   left: 5px;
   width: 80%;
}
*/

.gallery ul.thumb_view li h2 {
    display: inline;
    font-size: 20px;
}

.gallery ul.thumb_view li h3 {
    display: none;
}

.gallery ul.thumb_view li p {
    display: none;
}

.gallery ul.thumb_view li .content_block a img {
    margin: 15px 5px 5px 5px;
}

.gallery div.thumb_view_nav {
    text-align: right;
    font-size: 9px;
    z-index: -1;
}

.gallery ul.list_view li {
    font-size: 12px;
    height: 130px;
}

a.switch_thumb {
    width: 122px;
    height: 26px;
    background: url(../images/switch.gif) no-repeat;
    display: block;
    line-height: 26px;
    padding: 0;
    margin: 10px 0;     
    outline: none;
    text-indent: -9999px;
}

a:hover.switch_thumb {
    filter:alpha(opacity=75);
    opacity:.75;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=75)";
}

a.swap { background-position: left bottom; }

.gallery {
    margin-top:20px;
    overflow: auto;
    height:450px
}

.gallery img {
    border-top: 3px solid green;
    border-left: 3px solid green;
    border-bottom: 3px solid lime;
    border-right: 3px solid lime;
}

/* COURSES */

.webbies {
    overflow: hidden;
}

.webbies li {
    display: block;
    float: left;
}

.gallery .hidden {
    display: none;
}

.google_pos {

}

/* FORMS */

form.cmxform fieldset {
    margin-bottom: 10px;
    margin-right: 20px;
    font-size: 14px;
}

form.cmxform legend {
    padding: 0 2px;
    font-weight: bold;
    color: white;
}

form.cmxform label {
    display: inline-block;
    line-height: 1.0;
    vertical-align: top;
    font-weight: bold;
}

form.cmxform fieldset ol {
    margin: 0;
    padding: 0;
}

form.cmxform fieldset li {
    list-style: none;
    padding: 0px;
    margin: 0;
}

form.cmxform fieldset fieldset {
    border: none;
    margin: 3px 0 0;
}

form.cmxform fieldset fieldset legend {
    padding: 0 0 5px;
    font-weight: normal;
    color: white;
}

form.cmxform fieldset fieldset label {
    display: block;
    width: auto;
}

form.cmxform em {
    font-weight: bold;
    font-style: normal;
    color: #f00;
}

form.cmxform label {
    width: 150px; /* Width of labels */
}

form.cmxform fieldset fieldset label {
    margin-left: 123px; /* Width plus 3 (html space) */
}

.li-label {
    display: inline-block;
    width: 140px;
    vertical-align: top;
}
.row-form .label-accordion {
    font-weight: bold;
    width: 100px;
    display:inline-block;
    vertical-align: baseline;
}

.li-field {
    display: inline-block;
    width: 200px;
    vertical-align: top;
}

.li-field-column {
    display: inline-block;
    width: 140px;
    vertical-align: top;
}

.wrap-field {
    display: inline-block;
    width: 500px;
    word-wrap: break-word;
    vertical-align: top;
}

.pair-form {
    width: 290px;
    display: inline-block;
    vertical-align: top;
}

.ul-form {
    margin-left: 0px;
    padding-left: 0px;
    vertical-align: top;
    /*white-space: nowrap;*/
    list-style-type: none;
    padding-bottom: 10px;
    /*width: 150px;*/
    padding-bottom: 15px;
}

.ul-accordion {
    margin-left: 0px;
    padding-left: 0px;
    vertical-align: top;
    list-style-type: none;
    margin-bottom: 0px;
    padding-bottom: -10px;
}

/*.row-form {
    background-color: red;
    padding-bottom: 15px;
}
*/

  div.cmxform fieldset {
      margin-bottom: 10px;
      margin-right: 20px;
      font-size: 12px;
  }

  div.cmxform legend {
      padding: 0 2px;
      font-weight: bold;
      font-size: 14px;
      font-style: italic;
      color: white;
  }

  div.cmxform label {
      display: inline-block;
      line-height: 1.0;
      vertical-align: top;
      font-weight: bold;
  }

  div.cmxform fieldset ol {
      margin: 0;
      padding: 0;
  }

  div.cmxform fieldset li {
      list-style: none;
      padding: 0px;
      margin: 0;
  }

  div.cmxform fieldset fieldset {
      border: none;
      margin: 3px 0 0;
  }

  div.cmxform fieldset fieldset legend {
      padding: 0 0 5px;
      font-weight: normal;
      color: white;
  }

  div.cmxform fieldset fieldset label {
      display: block;
      width: auto;
  }

  div.cmxform em {
      font-weight: bold;
      font-style: normal;
      color: #f00;
  }

  div.cmxform label {
      width: 150px; /* Width of labels */
  }

  div.cmxform fieldset fieldset label {
      margin-left: 123px; /* Width plus 3 (html space) */
  }

  fieldset {
      width: 97%;
  }

  /* INFO MATCH */

  .list-info-match {
    border: 0px white outset;
    text-align: center;
    margin-top: 5px;
    margin-bottom: -15px;
    padding: 5px;
    width: 890px;
    list-style: none outside none;
}

.info-match {
    display: inline-block;
    border: 2px #000000 outset;
    width: 200px;
    text-align: center;
    vertical-align: middle;
    margin: 0px;
    padding: 5px;
}

.content-list-info-match {
    border: 0px solid blue;
    text-align: center;
    margin: 0px;
    padding: 5px;
    list-style: none outside none;
}

.content-info-match {
    border: 0px solid red;
    width: 190px;
    height: 90px;
    text-align: left;
    vertical-align: middle;
    margin: 0px;
    padding: 5px;
}

.content-info-match img {
    width: 190px;
    height: 100px;
    border: 1px solid white;
}

.content-label-match {
    width: 145px;
    font-weight: bold;
    display: inline-block;
}

.content-label-info-match {
    width: 40px;
    display: inline-block;
    text-align: right;
}

.tooltip {
  display:none;
  background:transparent url(/images/white.png);
  font-size:11px;
  height:60px;
  width:160px;
  padding:25px;
  color:#000;
}