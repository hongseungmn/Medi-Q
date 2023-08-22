<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>

    html{-webkit-text-size-adjust:none; /*-ms-user-select:none; -khtml-user-select:none; -webkit-user-select:none; user-select:none;*/-webkit-touch-callout:none; }
    *{-webkit-box-sizing:border-box; -moz-box-sizing:border-box; box-sizing:border-box;}
    body,a,p,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,tr,th,td,
    form,fieldset,label,legend,input,textarea,button,menu{margin:0px;padding:0px; -webkit-text-size-adjust:none;}
    body,input,textarea,select,table,button,code{color: #787E8B;; letter-spacing:-0.1px;
        font-weight: 500; font-family: 'Pretendard'; text-align: left; }
    body{width:100%; position:relative;word-wrap:break-word;word-break:break-all; background: #F8F8FA;
        -ms-overflow-style: none;}
    body::-webkit-scrollbar {display: none;}

    nav,menu,ul,li,ol{list-style:none;}
    div{display:block;}
    table{border-collapse:collapse; border-spacing:0;}
    img,fieldset{border:none;}
    em,address{font-style:normal;}
    select{cursor: pointer;}
    section,article,header,footer,nav,aside,hgroup{display:block;}
    button{border:none; background:none;}
    button:focus{outline: 1px solid #111;}
    a{margin:0px; padding:0px; text-decoration:none; cursor:pointer;}
    a:hover, a:active{text-decoration:none !important;}
    table{table-layout: fixed;}



    /*fix*/
    .clear_fix:after{content:""; display:block; clear:both;}
    .ib_fix{line-height:0px;}
    .lb_hide {overflow: hidden; position: absolute; width: 0; height: 0; line-height: 0;text-indent: -9999px;}
    .t-center{text-align: center;}
    .l-cont{float: left;} .l-cont:after{content:""; display:block; clear:both;}
    .r-cont{float: right;} .r-cont:after{content:""; display:block; clear:both;}
    .clearfix:after{content:""; display:block; clear:both;}
    .u960{display: none;}
    .u890{display: none;}
    .u820{display: none;}
    .u680{display: none;}
    .u510{display: none;}
    .u510b{display: none;}
    .u1280{display: none;}
    .bg-type2{background: #F8F8FA;}
    .bg-white{background: #fff !important;}
    .strong{font-weight: 700 !important;}

    /*레이아웃*/
    h1{width:0; height: 0px; font-size: 0; overflow: hidden;}
    .all-wrap{width: 100%; position: relative; /*background: #fff;*/}
    .all-wrap-in{width: 100%; padding: 72px 0px 0px}
    /*.all-wrap-in.with-top-bar{padding: 138px 0px 0px}*/
    .all-wrap.fixed{position: fixed; top: 0px; width: 100%; /*max-width: 900px;*/ margin: 0 auto;}
    .section{width: 100%; position: relative;}
    .section .content{width: 1320px; margin: 0px auto; text-align: center; position: relative;}
    .section .content:after{content:""; display:block; clear:both;}
    .f-footer-row2 .content{width: 1320px; margin: 0px auto; text-align: center; position: relative;}
    .f-footer-row2 .content:after{content:""; display:block; clear:both;}


    /*헤더*/
    .h-header{display: block; width: 100%; z-index: 190; position: fixed; top: 0px; left: 0px; transition: all 0.3s;
        height: 72px; padding: 0px; background: #fff; box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);}/*최상단헤더용*/
    .h-header .content{width: 1280px; margin: 0px auto; padding: 15px 20px 0px; position: relative;}
    .h-header .ipt-main-wrap{height: 38px; width: 480px; margin: 0px auto 0px; position: relative;}
    .h-header .ipt-main-wrap-in{width: 100%; height: 38px; background: #F4F6FA;
        line-height: 38px; border-radius: 21px; position: absolute;
        padding: 0px 48px 0px 20px; top:0px; left:0px; z-index: 88;}
    .h-header .ipt-menu2.active{padding: 40px 0px 30px;}
    .h-header .ipt-menu2 .auto-keyword .keyword{padding:0px 30px 0px;}
    .h-header .ipt-h-search{width: 100%; height: 38px; border: none; background: none;
        color: #101219; text-align: center; font-size: 16px; line-height: 38px;}
    .h-header .ipt-h-search:focus{outline: none !important;}
    .h-header .ipt-h-search::placeholder{color: #C4C8CE;}



    /*top-bar*/
    .top-bar{display: none;}




    /*푸터*/
    .f-footer{width: 100%;}

    .f-footer-row1{display: block; width: 100%; height: 70px; background: #6C2FF2; text-align: center;
        position: fixed; z-index: 150; left:0px; bottom:-100px; transition: bottom 0.5s;}
    .f-footer-banner-170{background: rgba(74, 0, 238, 0.8); backdrop-filter: blur(4px)}
    .f-footer-row1.active{bottom:0px; transition: bottom 0.5s;}
    .f-footer-row1 .content{display: inline-block; margin:0px auto;}
    .f-footer-row1 .content:after{content:""; display:block; clear:both;}
    .f-footer-row1 .content .txt1{float: left; font-weight: 500;
        font-size: 16px; color: #fff; text-align: left; line-height: 1; margin: /*28*/29px 0px 0px;}
    .f-footer-row1 .content .txt2{float: left; margin: /*25*/26px 0px 0px 20px;}
    .f-footer-row1 .content .txt2 .applink{font-weight: 500;
        font-size: 20px; line-height: 1; text-align: left; color: #EF605D;
        background: url(https://cdn.pillyze.io/web/img/arrow-right1.webp) right no-repeat; background-size: 9px 16px;
        padding-right: 18px;}/*이미지 디자인 원본 특징상 미세하게 깨짐*/
    .f-footer-row1 .content .qrcode{float: left; font-size: 0; width: 50px; height: 50px;
        background: #fff url(https://cdn.pillyze.io/web/img/qrcode.webp) center no-repeat;
        background-size: 40px 40px; border-radius: 5px; margin: 11px 0px 0px 45px}
    .f-footer-row1 .content .p-in-hand{float: right; font-size: 0; width: 54px; height: 57px;
        background: url(https://cdn.pillyze.io/web/img/p-in-hand.webp) center no-repeat;
        background-size: 54px 57px; margin: 13px 0px 0px 45px}
    .f-footer-banner-170 .applink span{color: #FFEA8D;}


    .f-footer-row2{background: #2D3142;}
    .f-footer-row2 .content{padding: 56px 0px 126px;}
    .f-footer-row2 .f-logo{background: url(https://cdn.pillyze.io/web/img/f-logo.webp) center no-repeat; float: left;
        background-size: 107px 28px; display: inline-block; width: 107px; height: 28px;}
    .f-footer-row2 .r-col{float: right; width: calc(100% - 147px); position: relative;}
    .f-footer-row2 .r-col:after{content:""; display:block; clear:both;}
    .f-footer-row2 .r-col .footer-menu{}
    .f-footer-row2 .r-col .footer-menu:after{content:""; display:block; clear:both;}
    .f-footer-row2 .r-col .footer-menu .menu{float: left; color: #fff; font-size: 16px; line-height: 1;
        margin-left: 20px;}
    .f-footer-row2 .r-col .footer-menu .menu:first-child{margin-left: 0px;}
    .f-footer-row2 .r-col .txt1{font-size: 14px; font-weight: 500; color: #EF605D !important;
        text-align: left; display: block; margin: 30px 0px 0px;
        line-height: 24px;}
    .f-footer-row2 .r-col .txt1 span{padding-right: 20px;}
    .f-footer-row2 .r-col .txt2{font-size: 14px; font-weight: 500; color: EF605D;
        text-align: left; display: block; margin: 30px 0px 0px;
        line-height: 1;}



    /*팝업류*/
    /* modal */
    .dimm-area{display: none;}
    .dimm-area.active{display: block; position:fixed; top:0; left:0; width:100%; height:100%;
        background:rgba(0,0,0,0.5); z-index:300;}
    .modal-wrap{display: none;}
    .modal-wrap.active{display: block; position:fixed; top:70px;
        left:calc(50% - 400px); background:#fff; width: 800px;
        z-index:320; border-radius: 40px; padding: 60px 0px; text-align: center;}
    .p-btn-close{width: 38px; height: 38px; position: absolute; top: 20px; right: 20px;
        z-index: 130;
        background: url(https://cdn.pillyze.io/web/img/modal-close.webp) center no-repeat; background-size: 18px 18px; }
    .modal-body{width: 100%; padding: 0px 40px; max-height: calc(100vh - 260px);
        overflow-y: auto;}


    /*팝업 : 로그인 유도 - 앱 다운 바텀 시트*/
    .app-down-bottom{width: 100% !important; top: auto !important; bottom: 0px !important;
        left: 0px !important; padding: 0px !important;
        border-radius: 20px 20px 0px 0px !important; background: #fff !important; height: 255px!important;}

    .app-down-bottom .content{width: 100%; max-width: 1280px;
        margin: 0px auto; padding: 0px 20px 0px; position: relative;}
    .app-down-bottom .content:after{content: ""; display: block; clear: both;}
    .app-down-bottom .content .app-down-btm-txt1{float: left; width: calc(100% - 118px);
        text-align: left; font-weight: 700; font-size: 22px; color: #101219;
        height: 113px; margin: 30px 0px 0px; line-height: 33px; padding: 11px 0px 0px;}
    .app-down-bottom .content .app-down-btm-txt1 span{color: #6C2FF2;}
    .app-down-bottom .content .p-in-hand{float: left; font-size: 0; width: 107px; height: 113px;
        background: url(https://cdn.pillyze.io/web/img/p-in-hand2.webp) center no-repeat;
        background-size: 107px 113px; margin: 30px 10px 0px 0px}
    .app-down-bottom .content .btn-goto-app{float: left; display: block;
        width: 100%; background: #6C2FF2; border-radius: 10px; text-align: center;
        height: 52px; line-height: 52px; font-weight: 500;
        font-size: 18px; color: #fff;}
    .app-down-bottom .content .btn-goto-app:link,
    .app-down-bottom .content .btn-goto-app:visited{color: #fff;}
    .app-down-bottom .content .btn-stay-here-wrap{float: left; width: 100%; text-align: center;}
    .app-down-bottom .content .btn-stay-here{display: inline-block;
        margin: 10px auto 0px; color: #9BA1AA; font-weight: 500; font-size: 14px;
        border-bottom: 1px solid #9BA1AA;}
    .app-down-bottom .content .btn-stay-here:link,
    .app-down-bottom .content .btn-stay-here:visited{color: #9BA1AA;}



    /*페이징 새 버전*/
    #pagination-container{width: 100%;}
    .paginationjs{width: 100%;}
    .paginationjs-pages{width: 100%; text-align: center;}
    .paginationjs-pages ul{display: inline-block; margin: 0px auto;  transform: translateX(5px);}
    .paginationjs-pages ul:after{content: ""; display: block; clear: both;}
    .paginationjs-prev{float: left; margin:0px 10px 10px 0px;}
    .paginationjs-prev a{width: 36px; height: 36px; border: 1px solid #E6E9ED;
        text-align: center; line-height: 34px; display: block;
        background: #FFF url(https://cdn.pillyze.io/web/img/p-prev.webp) center no-repeat; background-size: 8px 14px;}
    .paginationjs-next a{width: 36px; height: 36px;border: 1px solid #E6E9ED;
        text-align: center; line-height: 34px;  display: block;
        background: #FFF url(https://cdn.pillyze.io/web/img/p-next.webp) center no-repeat; background-size: 8px 14px;}
    .paginationjs-next{float: left; margin:0px 10px 10px 0px;}
    .paginationjs-page a{width: 36px; height: 36px; background: #FFFFFF; border: 1px solid #E6E9ED;
        text-align: center; line-height: 34px; font-weight: 500; display: block;
        font-size: 16px; color: #535968; }
    .paginationjs-page{float: left; margin:0px 10px 10px 0px;}
    .paginationjs-page.active a{color: #FFFFFF; background: #6C2FF2; }
    .paginationjs-last{display: none;}
    .paginationjs-ellipsis{display: none;}
    .paginationjs-pages .disabled{display: none;}


    /*#######  000-home.html  #######*/
    /*.section1-1*/
    .section1-1{/*padding:30px 20px;*/padding:30px 0px 0px; width:calc(100% - 40px); max-width: 1800px;
        margin:0px auto; overflow: hidden !important;}
    .section1-1 .swiper-slide{height: 272px; border-radius: 20px;
        overflow: hidden;}
    .section1-1 .swiper-pagination-bullet {background: #000 !important; opacity: 0.5 !important;
        width:10px !important; height: 10px !important;}
    .section1-1 .swiper-pagination-bullet-active {opacity: 1 !important; background: #ece4ff !important;
        width:/*18px*/10px !important; height: 10px !important; border-radius: 5px !important}
    .main-banner1{width:100%; height: 100%; background: #6C2FF2}
    .main-banner1 .content{position: relative; width:960px; height: 272px; margin:0px auto;
        background: url(https://cdn.pillyze.io/web/img/main_banner.webp) right no-repeat; background-size: 421px 272px;}
    .main-banner1 .content:after{content: ""; display: block; clear: both;}
    .main-banner1 .content .col1{float:left;}
    .main-banner1 .content .col1:after{content: ""; display: block; clear: both;}
    .main-banner1 .content .col1 .txt1{font-weight: 700; display: block;
        font-size: 36px; line-height: 45px; color:#EF605D; text-align: left; margin:65px 0px 0px;}
    .main-banner1 .content .col1 .txt2{font-weight: 500; display: block;
        font-size: 20px; line-height:30px; color:#EF605D; text-align: left; margin:26px 0px 0px;}


    /*.section1-2*/
    .section1-2{}
    .section1-2 .content{padding: 140px 0px}
    .section1-2 .txt1{font-weight: 700; font-size: 48px; line-height: 1; text-align: center;
        display: block; color: #101219; /*padding: 0px;*/ }
    .section1-2 .txt1 span{color:#6C2FF2;}
    .section1-2 .txt2{font-weight: 500; font-size: 26px; line-height: 1; text-align: left;
        display: block; color: #EF605D; width: 960px; margin: 0px auto;}
    .section1-2 .txt2 span{color:#EF605D; font-weight: 700;}
    .section1-2 .ipt-main-wrap{width: 960px; height: 64px;
        margin: 40px auto 0px; position: relative; }
    .section1-2 .ipt-main-wrap-in{width:100%; height: 64px; background: #FFF;
        padding: 0px 3px; z-index:89; display: block; position: absolute;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1); border-radius: 32px;}
    .section1-2 .ipt-main-wrap .ipt-main{width: 100%; border: none !important;
        height: 64px; text-align: center; color: #101219; border-radius: 32px;
        display: block;
        font-weight: 500; font-size: 20px; position: absolute; z-index: 90; left:0px; top:0px;}
    .section1-2 .ipt-main-wrap .ipt-main {
        padding-left: 20px;
    }
    .section1-2 .ipt-main-wrap .ipt-main::placeholder{color: #C4C8CE;}
    .section1-2 .ipt-main-wrap .ipt-main:focus{outline: none !important;}
    .section1-2 .ipt-main-wrap .btn-search{position: absolute; z-index: 91;
        width: 124px; top: 0px; right: 1px; border-radius: 32px;
        height: 64px; background: linear-gradient(90deg, #FDCDBC 0%, #EF605D 100%);}
    .section1-2 .ipt-main-wrap .btn-search:after{position: absolute; content: "";
        display: block; width: 20px; height: 20px; top: 22px; left: calc(50% - 10px);
        background:url(https://cdn.pillyze.io/web/img/plz-search.webp) center no-repeat;
        background-size: 20px 20px;}

    .ipt-menu1{display: none;}
    .ipt-menu1.active{display: block;}
    .ipt-menu{
        width:calc(100% - 4px); position: absolute; z-index: 50;
        top:30px; left:2px; padding:74px 0px 30px;
        background: #FFFFFF;
        border: 1px solid #E6E9ED;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 0px 0px 20px 20px; }
    .ipt-menu:after{content: ""; display: block; clear: both;}
    .ipt-menu .col1{float: left; width:50%; text-align: left; padding:0px 40px;}
    .ipt-menu .col2{float: left; width:50%; text-align: left; padding:0px 40px;
        position: relative;}
    .ipt-menu .txt1{font-weight: 700; font-size: 20px; line-height: 1; text-align: left;
        display: block;}
    .ipt-menu .col2 .txt2{font-weight: 500; color: #EF605D; font-size: 14px;
        text-align: right; position: absolute; top:4px; right: 40px;}
    .ipt-menu .col1 .keywords{padding:14px 0px 0px;}
    .ipt-menu .col1 .keywords .keyword{display: block; height: 30px; line-height: 30px;
        font-weight: 500; font-size: 20px; color:#101219; text-align: left;
        background: url(https://cdn.pillyze.io/web/img/clock.webp) left no-repeat;
        overflow:hidden; text-overflow: ellipsis; white-space: nowrap;
        background-size:16px 16px; padding:0px 0px 0px 36px; margin:16px 0px 0px;}
    .ipt-menu .col2 .keywords{padding:14px 0px 0px;}
    .ipt-menu .col2 .keywords .keyword{display: block; height: 30px; line-height: 30px;
        font-weight: 500; font-size: 20px; color:#101219; text-align: left;
        margin:16px 0px 0px; overflow:hidden; text-overflow: ellipsis; white-space: nowrap;}
    .ipt-menu .col2 .keywords .keyword:after{content: ""; display: block; clear: both;}
    .ipt-menu .col2 .keywords .keyword .no{float: left; height: 30px; line-height: 30px;
        text-align: left; font-weight: 500; color: #6C2FF2; font-size: 20px; width:44px;}
    .ipt-menu .col2 .keywords .keyword .txt{float: left;}

    .ipt-menu2{display: none;}
    .ipt-menu2.active{display: block; padding:60px 0px 30px;}
    .ipt-menu2 .auto-keyword .keyword{color:#c4c8ce;
        display: block; height: 50px; line-height: 50px; text-align: left;
        padding:0px 40px;}
    .ipt-menu2 .auto-keyword .keyword:hover, .ipt-menu2 .auto-keyword .keyword:focus
    {background: #F4F2FF;}
    .ipt-menu2 .auto-keyword .keyword span{color: #101219;}


    .section1-2 .search-etc{margin: 30px auto 0px; display: inline-block;}
    .section1-2 .search-etc .s-txt1{height: 42px; line-height: 42px; font-weight: 700;
        font-size: 18px; float: left; color: #787E8B; padding-right: 40px;}
    .section1-2 .search-etc .search-keywords{float: left;}
    .section1-2 .search-etc .search-keywords:after{content: ""; display: block; clear: both;}
    .section1-2 .search-etc .search-keywords .search-keyword{float: left; height: 42px;
        line-height: 42px; display: inline-block; background: #F4F6FA;
        border-radius: 21px; font-weight: 500; color: #787E8B;
        font-size: 18px; padding: 0px 15px; margin-left: 20px;}
    .section1-2 .search-etc .search-keywords .search-keyword:first-child{margin-left: 0px;}
    .section1-2 .search-etc .s-txt2{font-weight: 500; line-height: 1;
        font-size: 14px; color: #EF605D; float: left; margin: 20px 0px 0px 30px}

    .section1-2.type2 .content{padding: 40px 0px}
    .section1-2.type2 .ipt-main-wrap{margin: 20px auto 0px;}




    /*section1-2c*/
    .section1-2c{}
    .section1-2c .content{padding: 0px 0px 80px; width: 938px;}
    .section1-2c .txt1{display: block; width: 100%;}
    .section1-2c .txt1:after{content: ""; display: block; clear: both;}
    .section1-2c .txt1 .lottie1{width: 36px; height: 36px; float: left; display: block;
        overflow: hidden; transform: translate3d(0,0,0);text-align: center;opacity: 1;}
    .section1-2c .txt1 span{display: block; color: #000; text-align: left;
        font-weight: 700; font-size: 26px; line-height: 1; float: left;
        padding: 7px 0px 0px 5px;}

    .section1-2c .txt1{}

    .section1-2c .txt2{display: block; color: #EF605D; font-weight: 500; font-size: 18px;
        line-height: 1; margin-top: 10px; text-align: left;}
    .section1-2c .banner-wrap{background: #F4F2FF; border-radius: 20px; height: 180px;
        display: block; margin: 20px 0px 0px; position: relative;}
    .section1-2c .banner-wrap .banner-txt1{font-weight: 500; text-align: center;
        font-size: 16px; color: #535968; padding: 20px 0px 0px;}
    .section1-2c .banner-wrap .banner-txt2{font-weight: 800; text-align: center;
        font-size: 34px; color: #EF605D; padding: 0px 0px 0px;
        line-height: 42px;}
    .section1-2c .banner-wrap .banner-txt2 span{background: linear-gradient(360deg, #6C2FF2 0%, #EF605D 85.29%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        text-fill-color: transparent;
    }
    .section1-2c .banner-wrap .banner-bg{position:absolute; width:397px; height:204px;
        left: calc(50% - 198px); z-index: 40; top: 9px;}

    .section1-2d{}
    .section1-2d .content{padding: 120px 0px 200px; width: 938px;}
    .section1-2d .txt1{font-weight: 700; color: #101219; line-height: 1; text-align: center;
        font-size: 26px; display: block; width: 100%; margin: 0px 0px 40px;}
    .health-wrap {
        width: calc(100% + 20px);
        margin-top: 10px;
    }
    .health-wrap:after{content: ""; display: block; clear: both;}
    .health-wrap .health-one {
        width: calc(20% - 20px);
        height: 150px;
        margin: 0px 20px 20px 0px;
        float: left;
        /*padding: 0px 27px;*/
        border-radius: 20px;
        box-shadow: 0px 2px 10px rgb(70 56 147 / 10%);
        text-align: center;
        background: #FFFFFF;
        display: table;
        border: 1px solid #E6E9ED;
    }

    .health-wrap .health-one .txt-fix {
        display: table-cell;
        vertical-align: middle;
        /*height: 150px;*/
        font-weight: 500;
        font-size: 18px;
        line-height: 26px;
        color: #101219;
        text-align: center;
        width: 100%;
    }
    .health-wrap .health-one .txt-fix .h-icon
    {width: 45px; height: 45px; display: block; margin: 0 auto 20px;}
    .health-wrap .health1 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon001.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health2 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon002.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health3 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon003.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health4 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon004.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health5 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon005.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health6 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon006.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health7 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon007.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health8 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon008.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health9 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon009.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health10 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon010.webp) center no-repeat; background-size: 45px 45px;}

    .health-wrap .health11 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon011.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health12 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon012.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health13 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon013.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health14 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon014.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health15 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon015.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health16 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon016.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health17 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon017.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health18 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon018.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health19 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon019.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health20 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon020.webp) center no-repeat; background-size: 45px 45px;}

    .health-wrap .health21 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon021.webp) center no-repeat; background-size: 45px 45px;}
    .health-wrap .health22 .txt-fix .h-icon{background: url(https://cdn.pillyze.io/web/img/hicon022.webp) center no-repeat; background-size: 45px 45px;}

    .section1-2d .more-pop-health {
        float: right;
        font-weight: 500;
        font-size: 16px;
        line-height: 1;
        text-align: right;
        margin: 20px 0px 0px;
        text-decoration: underline;
        color: #9BA1AA;
    }
    .section1-2e .swiper-container4{display: none;}
    .section1-2d .content{padding: 120px 0px 200px; width: 938px;}

    /*section1-2s*/
    .section1-2s .content{padding: 0px 20px 53px; width: 100%; max-width: 978px;}
    .section1-2s .txt2 {
        display: block;
        font-weight: 700;
        color: #EF605D;
        font-size: 26px;
        text-align: center;
        line-height: 34px;
        margin: 0px 0px 40px;
    }

    .section1-2s .txt2 span{color: #EF605D;}
    .section1-2s .more-pop-health {
        float: right;
        font-weight: 500;
        font-size: 16px;
        line-height: 1;
        text-align: right;
        margin: 20px 0px 0px;
        text-decoration: underline;
        color: #9BA1AA;
    }



    /*section1-2e*/
    .section1-2e{position: relative;}
    .section1-2e .content{padding: 0px 0px 200px; width: 938px; }
    .section1-2e .txt1{display: block; color: #9BA1AA; text-align: center; font-weight: 700;
        font-size: 20px; line-height: 1;}
    .section1-2e .txt2{display: block; font-weight: 700; color: #EF605D;;
        font-size: 26px; text-align: center; line-height: 34px; margin: 10px 0px 28px;}
    .section1-2e .txt2 span{color: #EF605D;}
    .section1-2e .review-one{float: left; width: calc(50% - 10px); margin:0px 0px 0px 20px;
        background: #FFFFFF; box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 20px; padding: 30px;}
    .section1-2e .review-one:first-child{margin:0px;}
    .section1-2e .swiper-slide{padding: 10px;}
    .section1-2e .review-info-row1e{position: relative; display: block; width: 100%;}
    .section1-2e .review-info-row1e:after{content:""; display:block; clear:both;}
    .section1-2e .review-info-row2e{position: relative; display: block; width: 100%; margin: 20px 0px 0px;}
    .section1-2e .review-info-row2e:after{content:""; display:block; clear:both;}
    .section1-2e .star-point-small-bg{width: 82px; height: 13px;
        background: url(https://cdn.pillyze.io/web/img/stars1-bg2.webp) left no-repeat; background-size: 82px 13px;
        top:0px; left:0px; position: absolute; z-index: 60}
    .section1-2e .star-point-small{width: 82px; height: 13px;
        background: url(https://cdn.pillyze.io/web/img/stars1-cv.webp) left no-repeat; background-size: 82px 13px;}
    .section1-2e .date{font-weight: 500; font-size: 14px; line-height: 1;
        color: #9BA1AA; text-align: right; float: right;}
    .section1-2e .review-info-row2e .img1wrap{float: left; width: 55px; border-left: 4px solid #E6E9ED;
        padding: 0px 0px 0px 3px; height: 48px; position: relative;}
    /*.section1-2e .review-info-row2e .img1wrap:before{content: ""; display: block; z-index: 40;
width: 48px; height: 48px; top: 0px; right: 0px; background: #FF416D; opacity: 0.2; position: absolute;}*/
    .section1-2e .review-info-row2e .img1wrap .img1{width: 48px; height: 48px;}
    .section1-2e .review-info-row2e .right{float: right; width: calc(100% - 59px);  height: 48px;}
    .section1-2e .review-info-row2e .right .s-txt1{font-size: 14px; font-weight: 500; color: #9BA1AA;
        line-height: 1; text-align: left; margin: 6px 0px 0px; overflow:hidden; text-overflow: ellipsis; white-space: nowrap;}
    .section1-2e .review-info-row2e .right .s-txt2{font-size: 14px; font-weight: 700; color: #EF605D;
        line-height: 1; text-align: left; margin: 6px 0px 0px; overflow:hidden; text-overflow: ellipsis; white-space: nowrap;}
    .section1-2e .review-title1{font-weight: 700; color: #8760F4; font-size: 20px; text-align: left;
        line-height: 1; margin: 20px 0px 0px;}
    .section1-2e .review-title2{margin: 30px 0px 0px;}
    .section1-2e .review-content{width: 100%; text-align: left; font-weight: 500;
        font-size: 16px; line-height: 24px; color: #101219; margin: 6px 0px 0px;
        height: 120px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 5;
        -webkit-box-orient: vertical;}
    .section1-2e .btn-r-write-review{ background: #6C2FF2; font-weight: 700;
        font-size: 24px; color: #fff; line-height: 70px; margin: 0px 0px 0px;
        border-radius: 15px; text-align: center; height: 70px; display: block;}
    .section1-2e .swiper-container-horizontal>.swiper-pagination-bullets{
        bottom: 35px !important;
    }
    .section1-2e .swiper-pagination-bullet {background: #EAE7FD !important; opacity: 1 !important;
        width: 10px !important; height: 10px !important;}
    .section1-2e .swiper-pagination-bullet-active {opacity: 1 !important; background: #6C2FF2 !important;
        width: /*18px*/10px !important; height: 10px !important; border-radius: 5px !important;}


    .section1-2e .swiper-container2{overflow: hidden; width: calc(100% + 20px);
        padding: 0px 0px 80px;
        transform: translateX(-10px);}
    .section1-2e{}
    .section1-2e{}
    .section1-2e{}
    .section1-2e{}
    .section1-2e{}




    .section3-6 .review-content-wrap{margin: 50px 0px 0px;}
    .section3-6 .review-content-wrap .review-content{padding: 60px 0px 60px;
        border-top: 1px solid #E6E9ED;
        /*border-bottom: 1px solid #E6E9ED;*/ position: relative;}
    .section3-6 .review-content-wrap .review-content:first-child{padding: 0px 0px 60px; border-top: none}
    .section3-6 .review-content .user-name{font-weight: 700; font-size: 18px; line-height: 1; text-align: left;
        color: #101219; display: block;}
    .section3-6 .review-content .user-agesex{font-weight: 500; font-size: 16px; line-height: 1;
        text-align: left; margin: 20px 0px 0px; color: #535968; display: block;}
    .section3-6 .review-content .review-info-row1{margin: 11px 0px 0px; position: relative;
        height:13px;}

    .section3-6 .review-content .review-info-row2{margin: 20px 0px 0px;}
    .section3-6 .review-content .review-info-row2:after{content:""; display:block; clear:both;}
    .section3-6 .review-content .review-info-row2 .txt1{display: inline-block; float: left;
        height: 28px; line-height: 28px; padding: 0px 14px; border-radius: 14px; text-align: left;
        background: #EAE7FD; color: #6C2FF2; font-weight: 700; font-size: 14px;
        margin: 3px 0px 0px 0px;}
    .section3-6 .review-content .review-info-row2 .txt2{display: inline-block; float: left;
        height: 35px; line-height: 35px; border-radius: 5px;
        font-weight: 500; font-size: 14px; color: #787E8B; padding: 0px 10px 0px 40px;
        margin: 0px 0px 0px 10px;
        background: #EF605D url(https://cdn.pillyze.io/web/img/capsule.webp) 10px 10px no-repeat; background-size: 25px 14px;}
    .section3-6 .review-content .sub-title-small{font-weight: 800; text-align: left;
        font-size: 16px; display: /*inline-*/block; color: #8760F4; line-height: 1;
        margin: 24px 0px 0px}
    .section3-6 .review-content .sub-title-small.sts2{margin-top: 30px;}
    .section3-6 .review-content .review-full-txt{font-weight: 500; display: block;
        font-size: 16px; color: #101219; line-height: 24px; text-align: left;
        margin: 6px 0px 0px;}
    .section3-6 #pagination-container{padding: 60px 0px 30px; border-top: 1px solid #E6E9ED;}


    /*블러처리*/
    .blur-area{width: 100%; position: relative;}
    .blur .review-info-row1{filter: blur(4px)}
    .blur .sub-title-small{filter: blur(4px)}
    .blur .review-full-txt{filter: blur(4px)}
    .blur .sub-title-wrap{filter: blur(4px)}
    .blur .card-tags{filter: blur(4px)}
    .review-content .btn-goto-login{display: none;}
    .review-content .btn-goto-app{display: none;font-size: 16px}
    .review-content.blur .btn-goto-login{display: inline-block;
        border-radius: 10px; background: #fee500; text-align: center;
        margin: 0px 0px 5px; padding: 14px 22px; position: absolute; left: 50%; /*transform: translateX(-50%);*/
        top: 50%; transform: translate(-50%, -50%); z-index: 50;}
    .review-content.blur .btn-goto-login span{ font-weight: 500;
        background: url(https://cdn.pillyze.io/web/img/kakao-login-14.webp) left 2px no-repeat; display: inline-block;
        background-size: 20px 20px; font-size: 16px; color: #101219; padding: 0px 0px 0px 26px;
        text-align: left; height: 24px;  line-height: 24px;}


    .section3-6 .review-row.blur {}
    .section3-6 .review-row .btn-goto-login{display: none;}
    .section3-6 .review-row.blur .btn-goto-login{display: inline-block;
        border-radius: 10px; background: #fee500; text-align: center;
        margin: 0px 0px 5px; padding: 14px 22px; position: absolute; left: 50%; /*transform: translateX(-50%);*/
        top: 50%; transform: translate(-50%, -50%); z-index: 60;}
    .section3-6 .review-row .btn-goto-login span{ font-weight: 500;
        background: url(https://cdn.pillyze.io/web/img/kakao-login-14.webp) left 2px no-repeat; display: inline-block;
        background-size: 20px 20px; font-size: 16px; color: #101219; padding: 0px 0px 0px 26px;
        text-align: left; height: 24px;  line-height: 24px;}


    /*section1-3*/
    .section1-3{background: #F8F8FA;}
    .section1-3 .content{padding: 80px 0px}
    .section1-3 .txt1{display: block; color: #9BA1AA; font-weight: 700; font-size: 26px; line-height: 1;}
    .section1-3 .txt2{display: block; color: #EF605D; font-weight: 700; font-size: 26px; line-height: 1; margin-top: 20px;}
    .section1-3 .txt3{display: block; color: #101219; font-weight: 700; font-size: 26px; line-height: 1; margin-top: 20px;}
    .section1-3 .txt3 span{color:#6C2FF2;}




    /*section1-4*/
    .section1-4{overflow-x: hidden;}
    .section1-4 .content{padding: 80px 0px 200px; /*overflow: hidden;*/ width:960px;
        margin:0px auto;}
    .section1-4 .col1{width: 50%; float: left; padding:214px 0px 0px 20px;}
    .section1-4 .txt1{display: block; color: #101219; font-weight: 700; font-size: 36px; line-height: 1;
        text-align: left;}
    .section1-4 .txt1 span{color:#6C2FF2;}
    .section1-4 .txt2{display: block; font-weight: 500; font-size: 20px; line-height: 31px;
        color: #EF605D; text-align: left; margin-top: 30px;}
    .section1-4 .img1-2bg{width:332px; height: 518px; float: left;}
    .section1-4 .swiper-pagination-bullet {background: #EAE7FD !important; opacity: 1 !important;
        width: 10px !important; height: 10px !important;}
    .section1-4 .swiper-pagination-bullet-active {opacity: 1 !important; background: #6C2FF2 !important;
        width: /*18px*/10px !important; height: 10px !important; border-radius: 5px !important;}
    .section1-4 .swiper-container-horizontal>.swiper-pagination-bullets{bottom:120px;}


    /*section1-5*/
    .section1-5{background: #F8F8FA;}
    .section1-5 .content{padding: 160px 0px 120px}
    .section1-5 .txt1{display: block; color: #101219; font-weight: 700; font-size: 48px; line-height: 1;}
    .section1-5 .txt2{display: block; color: #EF605D; font-weight: 500; font-size: 20px; line-height:30px;
        margin-top: 80px; position: relative;}
    .section1-5 .txt2:after{content: ""; position: absolute; width:14px; height: 4px;
        background: #EF605D; top:-40px; left:calc(50% - 7px); z-index: 90;}
    .section1-5 .rl-companies{margin: 60px auto 0px; display: inline-block;}
    .section1-5 .rl-companies:after{content:""; display:block; clear:both;}
    .section1-5 .rl-companies .rl-company{float: left; width: 186px; margin: 0px 0px 40px 40px;
        height: 186px; background: #FFFFFF; box-shadow: 2px 2px 8px rgba(70, 56, 147, 0.1);
        border-radius: 93px; font-size: 0;}
    .section1-5 .rl-companies .rl-company:first-child{margin-left: 0px; }
    .section1-5 .rl-company.rl-company1{background: #fff url(https://cdn.pillyze.io/web/img/c-logo1.webp) center no-repeat;
        background-size: 155px 88px;}
    .section1-5 .rl-company.rl-company2{background: #fff url(https://cdn.pillyze.io/web/img/c-logo2.webp) center no-repeat;
        background-size: 158px 89px;}
    .section1-5 .rl-company.rl-company3{background: #fff url(https://cdn.pillyze.io/web/img/c-logo3.webp) center no-repeat;
        background-size: 161px 91px;}
    .section1-5 .rl-company.rl-company4{background: #fff url(https://cdn.pillyze.io/web/img/c-logo4.webp) center no-repeat;
        background-size: 155px 100px;}
    .section1-5 .rl-company.rl-company5{background: #fff url(https://cdn.pillyze.io/web/img/c-logo5.webp) center no-repeat;
        background-size: 143px 106px;}
    .section1-5 .rl-company.rl-company6{background: #fff url(https://cdn.pillyze.io/web/img/c-logo6.webp) center no-repeat;
        background-size: 141px 104px;}


    /*section2-1*/
    .section2-1{background: #F8F8FA;}
    .section2-1 .content{width: 958px; padding: 40px 0px 60px;}
    .section2-1 .item-cards:after{content:""; display:block; clear:both;}
    .section2-1 .item-card{width: calc((100% - 40px) / 3); margin: 20px 0px 0px 20px; display: block;
        border: 1px solid #E6E9ED; box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 20px; background: #fff; height: 372px; float: left;
        padding: 0px 20px;}
    .section2-1 .item-card:nth-child(3n - 2){margin: 20px 0px 0px 0px;}
    .section2-1 .item-card .item-img{width: 130px; height: 130px; display: block; margin: 50px auto 0px;}
    .section2-1 .item-card .txt1{font-weight: 500; display: block;
        font-size: 14px; color: #9BA1AA; text-align: left; margin: 40px 0px 0px}
    .section2-1 .item-card .txt2{font-weight: 700; color: #EF605D; display: block;
        font-size: 18px; text-align: left; line-height: 27px; margin: 4px 0px 0px;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .section2-1 .item-card .txt2 span{color:#EF605D;}
    .section2-1 .item-card .card-tags{margin: 20px 0px 0px}
    .section2-1 .item-card .card-tags:after{content:""; display:block; clear:both;}
    .section2-1 .item-card .card-tags .card-tag{display: inline-block; float: left; margin-left: 10px;
        border: 1px solid #D6D9E0; height: 30px; line-height: 28px; text-align: center; padding: 0px 15px;
        border-radius: 15px; color: #535968; font-weight: 500;}
    .section2-1 .item-card .card-tags .card-tag:first-child{margin-left: 0px;}
    .section2-1 .item-more {width: 100%; display: block; text-align: center;
        background: #FFFFFF;  height: 52px; line-height: 50px; margin: 20px 0px 0px;
        border: 1px solid #E6E9ED; font-size: 18px; color: #787E8B;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1); border-radius: 10px;}
    .section2-1 .txt-more, .section2-2 .txt-more
    {font-size: 16px; color: #9BA1AA; font-weight: 500; text-align: center;
        line-height: 24px; margin: 56px auto 0px; display: block;}
    .section2-1 .our-email, .section2-2 .our-email
    {display: block; font-weight: 500;
        font-size: 16px; line-height: 1; color: #9BA1AA; text-align: center; margin: 5px auto 0px;}


    /*section2-2*/
    .section2-2{}
    .section2-2 .content{width: 958px; padding: 140px 0px;}
    .section2-2 .img-no-result{display: block; width: 179px; height: 200px; margin: 0px auto;}
    .section2-2 .txt-more{margin: 37px auto 0px; }




    /*020-product-detail.html*/
    .all-wrap-in-product{background: #F5F5F5;}
    .all-wrap-in-product-in{width: 960px; margin: 0px auto; }
    .all-wrap-in-product .card-wrap{width: 100%; padding: 30px 40px; background: #fff;
        border: 1px solid #E6E9ED;
        border-radius: 20px; }
    .all-wrap-in-product .ge-title{font-weight: 700; margin: 0px 0px 30px; display: block;
        font-size: 20px; color: #101219; line-height: 1; text-align: left;}
    .all-wrap-in-product .ge-title .txt-small{font-weight: 500; font-size: 14px;}


    .new-wide-main-020-002 .card-wrap {
        width: 100%;
        padding: 30px 40px;
        background: #fff;
        border: 1px solid #E6E9ED;
        border-radius: 20px;
    }


    /*section3-1*/
    .section3-1{padding: 40px 0px 0px;}
    .section3-1 .card-wrap{padding: 60px 40px; position: relative;}
    .section3-1 .card-wrap:after{content:""; display:block; clear:both;}
    .section3-1 .btn-share{position: absolute; top:30px; right: 30px;
        width: 176px; font-weight: 700; color: #8760F4; border-radius: 10px;
        font-size: 16px; text-align: left; padding-left: 15px;
        height: 44px; line-height: 44px; display: block; background: #F4F2FF;}
    .section3-1 .btn-share:after{content: ""; display: block; width: 19px; height: 20px;
        background: url(https://cdn.pillyze.io/web/img/share.webp) center no-repeat; position: absolute;
        background-size: 19px 20px; top: 12px; right: 14px;}
    .section3-1 .item-img-big{width: 250px; height: 250px; float: left;border-radius: 20px}
    .section3-1 .col{width: calc(100% - 310px); float: right;}
    .section3-1 .col .card-tags{}
    .section3-1 .col .card-tags:after{content:""; display:block; clear:both;}
    .section3-1 .col .card-tags .card-tag{margin-left: 10px; background: #F4F6FA;
        border-radius: 15px; color: #535968; padding: 0px 15px; text-align: center;
        display: inline-block;
        float: left; font-weight: 500; font-size: 16px; height: 30px; line-height: 30px;}
    .section3-1 .col .card-tags .card-tag:first-child{margin-left: 0px;}
    .section3-1 .col .txt1 {font-weight: 500; display: block;
        font-size: 16px; color: #9BA1AA; margin-top: 30px;}
    .section3-1 .col .txt2 {font-weight: 700;
        font-size: 24px; line-height: 33px; display: block;
        color: #EF605D; margin-top: 11px;}
    .section3-1 .col .review{margin-top: 10px;}
    .section3-1 .col .review:after{content:""; display:block; clear:both;}
    .section3-1 .col .review .star-point{float: left; font-weight: 700;
        font-size: 16px; color: #535968; text-align: left; line-height: 1;
        background: url(https://cdn.pillyze.io/web/img/star-icon.webp) left 0px no-repeat;
        background-size: 14px 13px; padding-left: 20px}
    .section3-1 .col .review .amount{float: left; margin: 1px 0px 0px 20px; color: #6C2FF2;
        font-weight: 500; font-size: 14px; line-height: 1; display: inline-block;}
    .section3-1 .col .marks{margin-top: 30px;}
    .section3-1 .col .mark:after{content:""; display:block; clear:both;}
    .section3-1 .col .mark{float: left; margin-left: 40px; height: 36px; line-height: 36px;
        font-weight: 500; font-size: 16px; color: #101219; padding-left: 56px;}
    .section3-1 .col .mark.disable{color: #C4C8CE;}
    .section3-1 .col .mark:first-child{margin-left: 0px;}
    .section3-1 .col .mark.mark1{background: url(https://cdn.pillyze.io/web/img/mark1.webp) left 0px no-repeat;
        background-size: 36px 36px;}
    .section3-1 .col .mark.mark2{background: url(https://cdn.pillyze.io/web/img/mark2.webp) left 0px no-repeat;
        background-size: 36px 36px;}
    .section3-1 .col .mark.mark3{background: url(https://cdn.pillyze.io/web/img/mark3.webp) left 0px no-repeat;
        background-size: 36px 36px;}
    .section3-1 .col .mark.mark1d{background: url(https://cdn.pillyze.io/web/img/mark1d.webp) left 0px no-repeat;
        background-size: 36px 36px;}
    .section3-1 .col .mark.mark2d{background: url(https://cdn.pillyze.io/web/img/mark2d.webp) left 0px no-repeat;
        background-size: 36px 36px;}
    .section3-1 .col .mark.mark3d{background: url(https://cdn.pillyze.io/web/img/mark3d.webp) left 0px no-repeat;
        background-size: 36px 36px;}


    /*section3-2*/
    .section3-2 {margin: 80px 0px 0px;}
    .section3-2 .sub-title{font-weight: 700; display: block; text-align: left;
        font-size: 16px; color: #535968; margin: 30px 0px 0px;}
    .section3-2 .sub-title:first-child{margin: 0px 0px 0px;}
    .section3-2 .card-wrap{padding: 30px 40px 20px; }
    .section3-2 .card-tags{margin: 12px 0px 0px}
    .section3-2 .card-tags:after{content:""; display:block; clear:both;}
    .section3-2 .card-tags .card-tag{display: inline-block; float: left; margin-right: 10px;
        margin-bottom: 10px;
        border: 1px solid #D6D9E0; height: 30px; line-height: 28px; text-align: center; padding: 0px 15px;
        border-radius: 15px; color: #535968; font-weight: 500;}


    /*section3-3*/
    .section3-3 {margin: 80px 0px 0px;}
    .section3-3 .card-wrap {padding: 10px 40px}
    .section3-3 .card-wrap .clearfix{padding: 20px 0px; border-top: 1px solid #E6E9ED;}
    .section3-3 .card-wrap .clearfix:first-child{border-top: none}
    .section3-3 .card-wrap .clearfix img{width: 70px; height: 70px; display: block; float: left;}
    .section3-3 .card-wrap .clearfix .txt1{margin-left: 40px; display: block; float: left;
        font-weight: 700; color: #101219; height: 70px; line-height: 70px; text-align: left;
        font-size: 20px;}
    .section3-3 .card-wrap .clearfix .txt2{float: right; background: #EAE7FD;
        border-radius: 15px; text-align: center; font-weight: 700;
        font-size: 16px; color: #EF605D; margin: 20px 0px 0px;
        padding: 0px 15px; height: 30px; line-height: 30px;}
    .section3-3 .card-wrap2 {margin: 20px 0px 0px; padding: 27px 40px}
    .section3-3 .card-wrap2 .txt3{font-weight: 500;
        font-size: 18px; color: #101219; line-height: 26px;}
    /*.section3-3 .card-wrap2 .txt-info{background: url(https://cdn.pillyze.io/web/img/info.webp) left 1px no-repeat;
background-size: 18px 18px; margin: 20px 0px 0px}*/
    .section3-3 .card-wrap2 .txt-info{background: url(https://cdn.pillyze.io/web/img/info.webp) left 4px no-repeat;
        background-size: 14px 14px; margin: 20px 0px 0px}
    .section3-3 .card-wrap2 .txt-info:after{content:""; display:block; clear:both;}
    .section3-3 .card-wrap2 .txt-info .txt-info-content{float: right;
        width: calc(100% - 25px); font-weight: 500; color: #181E6A;
        font-size: 14px; line-height: 22px; text-align: left;}


    /*section3-4*/
    .section3-4 {margin: 80px 0px 0px; text-align: center;}
    .section3-4 .filter-btns {padding:0px 0px 0px 0px;}
    .section3-4 .filter-btns:after{content:""; display:block; clear:both;}
    .section3-4 .filter-btns-in{position: relative;
        font-size: 0; text-align: left; float: left;}
    .section3-4 .filter-btns-in:after{content:""; display:block; clear:both;}
    .section3-4 .filter-btns .filter-btn{display: inline-block; /*display: block; float: left; */
        margin: 0px 10px 10px 0px;
        padding: 0px 15px; background: #FFFFFF; border: 1px solid #E6E9ED;
        border-radius: 24px; line-height: 40px; height: 42px; color: #9BA1AA; font-weight: 500;
        font-size: 18px;}
    .section3-4 .filter-btns .filter-btn.active{color: #fff; background: #6C2FF2;
        /*font-weight: 700*/}

    .section3-4 .info-cards{margin: 10px 0px 0px;}
    .section3-4 .info-cards:after{content:""; display:block; clear:both;}
    .section3-4 .info-cards-inside{width: 100%; display: block;}
    .section3-4 .info-cards-inside:after{content:""; display:block; clear:both;}
    .section3-4 .info-cards .card-wrap{border: 1px solid #E6E9ED; float: left; padding: 27px 20px 30px;
        border-radius: 10px; height: 152px; width: calc((100% - 40px) / 3); margin: 0px 20px 20px 0px;
        text-align: left;}

    .section3-4 .info-cards .txt1{font-weight: 500; text-align: left; display: block;
        font-size: 16px; line-height: 24px; color: #101219;}
    .section3-4 .info-cards .txt1:after{content:""; display:block; clear:both;}
    .section3-4 .info-cards .txt1 span{max-width: calc(100% - 41px); float: left; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}

    .section3-4 .info-cards .txt2{font-weight: 500; color: #EF605D; line-height: 1;
        font-size: 14px; display: block; margin: 7px 0px 0px;}

    .section3-4 .info-cards .txt2 .txt2-hide{color: #EF605D; padding: 0px 22px 0px 0px;
        display: inline-block;
        background: url(https://cdn.pillyze.io/web/img/check-this.webp) right 0px no-repeat; background-size: 16px 16px;}

    .section3-4 .info-cards .txt3{font-weight: 700; font-size: 16px; display: inline-block;
        text-align: center; line-height: 30px; height: 30px; border-radius: 15px; padding: 0px 11px;
        float: left; margin: 0px;}
    .section3-4 .info-cards .txt3.type1{background: #FFEFF2; color: #FF416D;}
    .section3-4 .info-cards .txt3.type2{background: #EFFFF4; color: #15E74E;}
    .section3-4 .info-cards .txt3.type3{background: #EFFFFF; color: #00C7C7;}
    .section3-4 .info-cards .txt3.type4{background: #FFF9DE; color: #FFB800;}

    .section3-4 .info-more {width: calc(100% - 20px); display: block; text-align: center;
        background: #FFFFFF;  height: 52px; line-height: 50px;
        border: 1px solid #E6E9ED; font-size: 18px; color: #787E8B;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1); border-radius: 10px;}
    .section3-4 .txt-question-mark{position: relative; font-size: 14px; color: #9BA1AA;
        font-weight: 500; padding: 7px 0px 7px 21px; display: inline-block;
        margin: 20px auto 0px; border-bottom: 1px solid #C4C8CE;
        background: url(https://cdn.pillyze.io/web/img/qmark-s.webp) left no-repeat; background-size: 15px 15px;}
    .section3-4 .info-cards .txt3wrap{float: left; margin: 27px 0px 0px;}
    .section3-4 .info-cards .txt3wrap:after{content: ""; display: block; clear: both;}
    .new-wide-main-020-002 .section3-4 .info-cards .card-wrap .info-card-more-info{
        display: none; /*이것을 display: block으로 바꾸면 width 510px이상의 화면에서도 버튼 노출합니다.*/
        width: 16px; float: left;
        height: 29px;
        cursor: pointer;
        background: url(https://cdn.pillyze.io/web/img/caution-more.webp) right no-repeat;
        background-size: 7px 13px;
        opacity: 0.6;
    }

    .section3-4 .info-more-content{display: none;}
    .section3-4 .info-more-content.active{padding: 40px; width: calc(100% - 20px);
        display: block; margin: 0px 0px 20px;
        height: auto; background: #FFFFFF; border: 1px solid #E6E9ED; border-radius: 20px;
        font-weight: 500; font-size: 16px; line-height: 24px; color: #101219; text-align: left;}

    .section3-4 .info-more-content{display: none;}
    .section3-4 .info-more-content.active .product-name{font-weight: 700;}


    .section3-4 .imw-show{display: none !important;}
    .section3-4 .imw-show.active{display: block !important;}
    .section3-4 .imw-hide{display: none !important;}
    .section3-4 .imw-hide.active{display: block !important;}


    /*section3-5*/
    .section3-5 {margin:80px 0px 0px;}
    .section3-5 .top-deco{position: relative;}
    .section3-5 .top-deco:after{content:""; display:block; clear:both;}
    .section3-5 .top-deco .character{float: left; width: 70px; height: 70px; display: block;}
    .section3-5 .top-deco .col{float: right; width: calc(100% - 110px); display: block;}
    .section3-5 .top-deco .col .txt1{font-weight: 700; font-size: 16px; color: #101219;
        text-align: left; line-height: 1; display: block;}
    .section3-5 .top-deco .col .txt2{font-weight: 500; font-size: 16px; color: #fff;
        text-align: left; min-height: 46px; line-height: 24px; display: inline-block; background: #EF605D;
        padding: 11px 30px 11px; margin: 7px 0px 0px; border-radius: 0px 20px 20px 20px;}
    .section3-5 .accordian-wrap{margin: 30px 0px 0px;}
    .section3-5 .accordian-wrap .card-wrap{padding: 0px 40px; margin: 20px 0px 0px}
    .section3-5 .accordian-wrap .card-wrap .acd-title{display: block; padding: 27px 0px;}
    .section3-5 .accordian-wrap .card-wrap .acd-title:after{content:""; display:block; clear:both;}
    .section3-5 .accordian-wrap .card-wrap .acd-title .txt1{width: 46px; color: #6C2FF2;
        margin: 3px 0px 0px; font-weight: 700; font-size: 20px; line-height: 20px; line-height: 20px; float: left;}
    .section3-5 .accordian-wrap .card-wrap .acd-title .txt2{width: calc(100% - 90px); float: left;
        margin-left: 14px; color: #EF605D; font-weight: 500; font-size: 18px; line-height: 25px;}
    .section3-5 .accordian-wrap .card-wrap .acd-title .m-arrow{width: 16px; height: 8px; float: right;
        background: url(https://cdn.pillyze.io/web/img/m-open.webp) center no-repeat; background-size: 16px 8px;
        margin: 8px 0px 0px; transition: all 0.5s;}
    .section3-5 .accordian-wrap .card-wrap .acd-title.active .m-arrow{transform: rotate(180deg);
        background: url(https://cdn.pillyze.io/web/img/m-open.webp) center no-repeat; background-size: 16px 8px; transition: all 0.5s;}
    .section3-5 .accordian-wrap .card-wrap .acd-content{display: none}
    .section3-5 .accordian-wrap .card-wrap .acd-content{display: none;
        border-top: 1px solid #E6E9ED; padding: 27px 0px 30px 60px}
    .section3-5 .accordian-wrap .card-wrap .acd-content .ac-txt1{font-weight: 700;
        font-size: 16px; line-height: 23px; text-align: left; color: #101219;
        margin: 27px 0px 0px; display: block;}
    .section3-5 .accordian-wrap .card-wrap .acd-content .ac-txt1:first-child{margin-top: 0px;}
    .section3-5 .accordian-wrap .card-wrap .acd-content .ac-txt2{font-weight: 500;
        font-size: 16px; line-height: 23px; text-align: left; color: #EF605D;
        margin: 4px 0px 0px; display: block;}


    /*section3-5a*/
    .section3-5a {margin:80px 0px 0px;}
    .section3-5a {}
    .section3-5a .swiper-container2{margin: 30px auto 0px; width: 100%; display: block; overflow: hidden;}
    .section3-5a .swiper-container3{margin: 30px auto 0px; width: 100%; display: block; overflow: hidden;}
    .section3-5a .swiper-container4{margin: 30px auto 0px; width: 100%; display: block; overflow: hidden;}
    .section3-5a:after{content:""; display:block; clear:both;}
    .section3-5a .swiper-slide .item-card-col{width: 100%;
        display: block; padding: 20px; height: 384px;
        background: #FFFFFF; border: 1px solid #E6E9ED; border-radius: 20px;}
    .section3-5a .swiper-slide .item-card-col .item-img{width: 100%; height: 180px}
    .section3-5a .swiper-slide .item-card-col .txt1{display: inline-block;
        font-weight: 500; font-size: 18px; color: #101219; line-height: 26px;
        overflow: hidden; margin: 26px 0px 0px;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;}
    .section3-5a .swiper-slide .item-card-col .txt2{display: inline-block;
        font-weight: 500; font-size: 16px; color: #EF605D; line-height: 24px;
        overflow: hidden; margin: 8px 0px 0px;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;}
    .section3-5a .swiper-slide .item-card-col{}
    .section3-5a .swiper-slide .item-card-col{}
    .section3-5a .swiper-slide .item-card-col{}
    .section3-5a .swiper-slide .item-card-col{}
    .section3-5a .tqm-35a{position: absolute; top: 0px; right: 0px; margin: 0px;
        text-decoration: underline; font-weight: 500; color: #9BA1AA;
        font-size: 16px; text-align: right;}
    .section3-5a .tqm-35a:link, .section3-5a .tqm-35a:visited{color: #9BA1AA;}
    .section3-5a .swiper-button-next {
        background: #fff url(https://cdn.pillyze.io/web/img/h120-sw-n.webp) center no-repeat;
        background-size: 20px 20px;
        width: 40px;
        height: 40px;
        z-index: 40;
        border-radius: 20px;
        border: 1px solid #E6E9ED;
        right: -20px;
        filter: drop-shadow(3px 3px 6px rgba(70, 56, 147, 0.1));
    }
    .section3-5a .swiper-button-prev {
        background: #fff url(https://cdn.pillyze.io/web/img/h120-sw-p.webp) center no-repeat;
        background-size: 20px 20px;
        width: 40px;
        height: 40px;
        z-index: 40;
        border-radius: 20px;
        border: 1px solid #E6E9ED;
        left: -20px;
        filter: drop-shadow(3px 3px 6px rgba(70, 56, 147, 0.1));
    }


    .s35a1{display: block; width: 100%;}
    .s35a2{display: none;}
    .s35a3{display: none;}



    .section3-5b .info-more {width: calc(100%); display: block; text-align: center;
        background: #FFFFFF;  height: 52px; line-height: 50px;  margin: 20px 0px 0px;
        border: 1px solid #E6E9ED; font-size: 18px; color: #787E8B;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1); border-radius: 10px;}


    .new-wide-main-020-002 .section3-5b .info-cards .card-wrap .info-card-more-info{
        display: none; /*이것을 display: block으로 바꾸면 width 510px이상의 화면에서도 버튼 노출합니다.*/
        width: 16px; float: left;
        height: 29px;
        cursor: pointer;
        background: url(https://cdn.pillyze.io/web/img/caution-more.webp) right no-repeat;
        background-size: 7px 13px;
        opacity: 0.6;
    }

    .section3-5b .info-more-content{display: none;}
    .section3-5b .info-more-content.active{padding: 40px; width: calc(100%);
        display: block; margin:20px 0px 20px;
        height: auto; background: #FFFFFF; border: 1px solid #E6E9ED; border-radius: 20px;
        font-weight: 500; font-size: 16px; line-height: 24px; color: #101219; text-align: left;}

    .section3-5b .info-more-content{display: none;}
    .section3-5b .info-more-content.active .product-name{font-weight: 700;}


    .section3-5b .imw-show{display: none !important;}
    .section3-5b .imw-show.active{display: block !important;}
    .section3-5b .imw-hide{display: none !important;}
    .section3-5b .imw-hide.active{display: block !important;}
    .info-more-wrap2{width: 100%;}
    .info-more-wrap3{width: 100%;}

    .section3-5b .info-more-wrap-b2.imw-show{display: none !important;}
    .section3-5b .info-more-wrap-b2.imw-show.active{display: none !important;}
    .section3-5b .info-more-wrap-b2.imw-hide{display: none !important;}
    .section3-5b .info-more-wrap-b2.imw-hide.active{display: block !important;}
    .section3-5b .info-more-content-b {display: none !important;}
    .section3-5b .info-more-content-b.active {display: none !important;}


    /*section3-6*/
    .section3-6 {margin:80px 0px 0px;}
    .section3-6 .review-row{background: #F8F8FA; border-radius: 20px; padding: 20px 0px; position: relative;}
    .section3-6 .review-row:after{content:""; display:block; clear:both;}
    .section3-6 .review-row .col1{float: left; width: 50%; height: 122px;}
    .section3-6 .review-row .col2{float: left; width: 50%; height: 122px;
        border-left: 1px solid #E6E9ED; text-align: center;}
    .section3-6 .review-row .col1 .txt1{display: block; font-weight: 700; margin: 26px auto 0px;
        font-size: 40px; line-height: 1; text-align: center; color: #101219;}
    .section3-6 .review-row .col1 .star-point-bg{width: 110px; height: 17px; margin: 12px auto 0px;
        background: url(https://cdn.pillyze.io/web/img/stars2-bg2.webp) left no-repeat; background-size: 110px 17px;}
    .section3-6 .review-row .col1 .star-point{width: 110px; height: 17px;
        background: url(https://cdn.pillyze.io/web/img/stars2-cv.webp) left no-repeat; background-size: 110px 17px;}
    .section3-6 .bar-graph{margin: 0px auto; display: inline-block;}
    .section3-6 .bar-graph:after{content:""; display:block; clear:both;}
    .section3-6 .bar-graph .bar-graph-one{width: 30px; height: 122px; float: left; position: relative; }
    .section3-6 .bar-graph .bar-graph-one .bar-graph-bg{width: 69px; height: 8px;
        background: #E6E9ED; transform: rotate(-90deg); border-radius: 4px; margin-left: -13px;
        margin-top: 60px}
    .section3-6 .bar-graph .bar-graph-one .bar-graph-bg:after{content:""; display:block; clear:both;}
    .section3-6 .bar-graph .bar-graph-one .bar-graph-bar{width: 69px; height: 8px;
        background: #D6D9E0; float: left; border-radius: 4px;}
    .section3-6 .bar-graph .bar-graph-one.active .bar-graph-bar/*,
.section3-6 .bar-graph .bar-graph-one:hover .bar-graph-bar*/{width: 69px; height: 8px;
        background: #6C2FF2; float: left; border-radius: 4px;}
    .section3-6 .bar-graph .bar-graph-one .bar-graph-mark{width: 42px; height:19px;
        position: absolute; left: 0px; top: -2px; text-align: center; }
    .section3-6 .bar-graph .bar-graph-one .bar-graph-mark span{display: none;}
    .section3-6 .bar-graph .bar-graph-one.active .bar-graph-mark span/*,
.section3-6 .bar-graph .bar-graph-one:hover .bar-graph-mark span*/
    {display: inline-block;
        height: 19px; line-height: 19px;  padding: 0px 4px;
        background: #6C2FF2; font-weight: 500; font-size: 12px; color: #fff; border-radius: 5px;}
    .bar-graph-txt{width: 100%; text-align: center; font-weight: 500;
        font-size: 14px; color: #C4C8CE; line-height: 1; margin-top: 40px; margin-left:7px;}
    .bar-graph-one.active .bar-graph-txt/*,
.bar-graph-one:hover .bar-graph-txt*/
    {width: 100%; text-align: center; font-weight: 500;
        font-size: 14px; color: #6C2FF2; line-height: 1; margin-top: 40px}


    .section3-6 .review-row.blur .col1{filter: blur(10px);}
    .section3-6 .review-row.blur .col2{filter: blur(10px);}




    .section3-6 .spec-rows-wrap{margin: 40px 0px 60px;}
    .section3-6 .spec-rows-wrap .sub-title{font-weight: 700; font-size: 14px; color: #101219;
        margin: 30px 0px 0px; text-align: left;}
    .section3-6 .spec-rows-wrap .sub-title:first-child{margin: 0px 0px 0px}
    .section3-6 .spec-rows{margin: 20px 0px 0px;}
    .section3-6 .spec-row{margin: 10px 0px 0px; background: url(https://cdn.pillyze.io/web/img/spec-row-bg.webp) repeat-x;
        background-size: 10px 30px;}
    .section3-6 .spec-row:first-child{margin: 0px 0px 0px}
    .section3-6 .spec-row:after{content:""; display:block; clear:both;}
    .section3-6 .spec-row .spec-txt{float: left; display: inline-block;
        padding: 0px 20px 0px 0px; background: #fff;}
    .section3-6 .spec-row .spec-txt span{display: inline-block; height: 30px; line-height: 30px;
        text-align: left; border-radius: 15px; padding: 0px 15px; font-weight: 500;
        font-size: 16px; color: #101219;}
    .section3-6 .spec-row .spec-txt.type1 span{background: #EFFFFF;}
    .section3-6 .spec-row .spec-txt.type2 span{background: #FFF9DE;}
    .section3-6 .spec-row .spec-percent{float: right; display: inline-block;
        width: 69px; background: #fff; text-align: right;}
    .section3-6 .spec-row .spec-percent span{height: 30px; line-height: 30px; text-align: right;
        font-weight: 700; font-size: 18px; color: #535968;}
    .section3-6 .sub-title-big-wrap{margin: 80px 0px 0px}
    .section3-6 .sub-title-big-wrap:after{content:""; display:block; clear:both;}
    .section3-6 .sub-title-big-wrap .sub-title-big{float: left; font-weight: 700;
        font-size: 20px; line-height: 43px; line-height: 43px; text-align: left;}
    .section3-6 .sub-title-big-wrap .sub-title-big span{color:#6C2FF2;}
    .section3-6 .slt-sort-list{width: 177px; background: #F8F8FA;
        border-radius: 10px; height: 43px; line-height: 43px; float: right; font-weight: 500;
        font-size: 16px; padding: 0px 20px; border: none !important}
    .section3-6 .slt-sort-list option{height: 43px; line-height: 43px;}
    /*.section3-6 .filter-btns2 {margin: 20px 0px 0px;}
.section3-6 .filter-btns2:after{content:""; display:block; clear:both;}
.section3-6 .filter-btns2 .filter-btn{display: block; float: left; margin: 0px 10px 10px 0px;
padding: 0px 25px; background: #FFFFFF; border: 1px solid #E6E9ED;
border-radius: 24px; line-height: 46px; height: 48px; color: #9BA1AA; font-weight: 500;
font-size: 18px;}
.section3-6 .filter-btns2 .filter-btn.active{color: #fff; background: #6C2FF2;}
.section3-6 .filter-btns2 .filter-btn:first-child{}*/

    .section3-6 .filter-btns {padding:0px 0px 0px 0px; margin:20px 0px 0px;}
    .section3-6 .filter-btns:after{content:""; display:block; clear:both;}
    .section3-6 .filter-btns-in{position: relative;
        font-size: 0; text-align: left; float: left;}
    .section3-6 .filter-btns-in:after{content:""; display:block; clear:both;}
    .section3-6 .filter-btns .filter-btn{display: inline-block; /*display: block; float: left; */
        margin: 0px 10px 10px 0px;
        padding: 0px 15px; background: #FFFFFF; border: 1px solid #E6E9ED;
        border-radius: 24px; line-height: 40px; height: 42px; color: #9BA1AA; font-weight: 500;
        font-size: 18px;}
    .section3-6 .filter-btns .filter-btn.active{color: #fff; background: #6C2FF2;
        /*font-weight: 700*/}



    /*brisak-select*/
    .section3-6 .sub-title-big-wrap .brisak-select{float: right; position: relative; width:177px;}
    .bs-select{display: block; position: absolute; top:0px; letter-spacing: 0px; width:100%;
        background: #F8F8FA; border-radius: 10px; z-index: 150; display: block;
        height: 43px; line-height: 43px; font-weight: 500; font-size: 16px; padding: 0px 20px;}
    .bs-select:after{position: absolute; z-index: 151; content: ""; display: block;
        background: url(https://cdn.pillyze.io/web/img/select-tri.webp) center no-repeat; transition: all 0.5s;
        background-size: 13px 8px; top:17px; right:18px; width:13px; height: 8px;}
    .bs-select.active:after{position: absolute; z-index: 151; content: ""; display: block;
        background: url(https://cdn.pillyze.io/web/img/select-tri.webp) center no-repeat; width:13px; height: 8px;
        background-size: 13px 8px; top:17px; right:18px; transform: rotate(180deg); transition: all 0.5s;}
    .bs-value{}
    .bs-options{display: none; width:100%; z-index: 55; background: #fff; padding:44px 0px 16px;
        position: absolute; top:15px; left:0px; border: 1px solid #E6E9ED;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1); border-radius: 0px 0px 20px 20px;}
    .bs-option{display: block; width:100%; height: 42px; line-height: 42px;
        background: #fff; padding: 0px 0px 0px 35px}
    .bs-option.active{background: #F4F2FF;}
    .bs-option:hover, .bs-option:focus{background: #eceafb;}


    .section3-6 .review-content-wrap{margin: 50px 0px 0px;}
    .section3-6 .review-content-wrap .review-content{padding: 60px 0px 60px;
        border-top: 1px solid #E6E9ED;
        /*border-bottom: 1px solid #E6E9ED;*/ position: relative;}
    .section3-6 .review-content-wrap .review-content:first-child{padding: 0px 0px 60px; border-top: none}
    .section3-6 .review-content .user-name{font-weight: 700; font-size: 18px; line-height: 1; text-align: left;
        color: #101219; display: block;}
    .section3-6 .review-content .user-agesex{font-weight: 500; font-size: 16px; line-height: 1;
        text-align: left; margin: 20px 0px 0px; color: #535968; display: block;}
    .section3-6 .review-content .review-info-row1{margin: 11px 0px 0px; position: relative;
        height:13px;}
    .section3-6 .review-content .star-point-small-bg{width: 82px; height: 13px;
        background: url(https://cdn.pillyze.io/web/img/stars1-bg2.webp) left no-repeat; background-size: 82px 13px;
        top:0px; left:0px; position: absolute; z-index: 60}
    .section3-6 .review-content .star-point-small{width: 82px; height: 13px;
        background: url(https://cdn.pillyze.io/web/img/stars1-cv.webp) left no-repeat; background-size: 82px 13px;}
    .section3-6 .review-content .date{font-weight: 500; font-size: 14px; line-height: 1;
        color: #C4C8CE; top:0px; left:93px; position: absolute; z-index: 60}
    .section3-6 .review-content .btn-report{float: left; font-weight: 500; font-size: 14px;
        line-height: 1;
        color: #C4C8CE; top:0px; left:178px; position: absolute; z-index: 60}
    .section3-6 .review-content .review-info-row2{margin: 20px 0px 0px;}
    .section3-6 .review-content .review-info-row2:after{content:""; display:block; clear:both;}
    .section3-6 .review-content .review-info-row2 .txt1{display: inline-block; float: left;
        height: 28px; line-height: 28px; padding: 0px 14px; border-radius: 14px; text-align: left;
        background: #EAE7FD; color: #6C2FF2; font-weight: 700; font-size: 14px;
        margin: 3px 0px 0px 0px;}
    .section3-6 .review-content .review-info-row2 .txt2{display: inline-block; float: left;
        height: 35px; line-height: 35px; border-radius: 5px;
        font-weight: 500; font-size: 14px; color: #EF605D; padding: 0px 10px 0px 40px;
        margin: 0px 0px 0px 10px;
        background: #F4F6FA url(https://cdn.pillyze.io/web/img/capsule.webp) 10px 10px no-repeat; background-size: 25px 14px;}
    .section3-6 .review-content .sub-title-small{font-weight: 800; text-align: left;
        font-size: 16px; display: /*inline-*/block; color: #8760F4; line-height: 1;
        margin: 24px 0px 0px}
    .section3-6 .review-content .sub-title-small.sts2{margin-top: 30px;}
    .section3-6 .review-content .review-full-txt{font-weight: 500; display: block;
        font-size: 16px; color: #101219; line-height: 24px; text-align: left;
        margin: 6px 0px 0px;}
    .section3-6 #pagination-container{padding: 60px 0px 30px; border-top: 1px solid #E6E9ED;}


    /*section3-7*/
    .section3-7{padding: 144px 0px 60px;}
    .section3-7 .c-card-wrap{ background: #6C2FF2; border-radius: 20px;
        padding: 46px 0px 0px 60px; position: relative; min-height: 261px;}
    .section3-7 .c-card-wrap:after{content:""; display:block; clear:both;}


    .section3-7 .col1{float: left; position: relative;}
    .section3-7 .col1 .img-caution{position: absolute; width: 69px; height: 62px;
        /*background: #F4F6FA url(https://cdn.pillyze.io/web/img/img_state_caution.png) center no-repeat;
background-size: 69px 62px;*/ left: 0px; top: -100px; display: block;}
    .section3-7 .col1 .txt1{float: left; font-weight: 700; display: block;
        font-size: 20px; line-height: 30px; color: #EF605D; text-align: left; width: 100%}
    .section3-7 .col1 .txt2{float: left; font-weight: 700; margin: 3px 0px 0px;
        font-size: 25px; line-height: 35px; color: #EF605D; text-align: left; display: block;
        width: 100%}
    .section3-7 .col1 .txt2 span{color: #EF605D}
    .section3-7 .col1 .txt3{float: left; margin: 16px 0px 0px;
        font-weight: 500; font-size: 18px; line-height: 28px; color: #EAE7FD; display: block;
        text-align: left;}
    .section3-7 .col2 {position: absolute; width: 358px; height: 305px;
        bottom: 0px; right: 60px; background: #FFFFFF;
        box-shadow: 5px -5px 10px rgba(70, 56, 147, 0.1);
        border-radius: 45px 45px 0px 0px; padding: 63px 20px 0px;}
    .section3-7 .col2:before{content: ""; display: block; position: absolute;
        width: 56px; height: 5px; top: 32px; left: calc(50% - 28px); border-radius: 3px;
        background: #E6E9ED;}
    .section3-7 .col2 .p-content{width: 100%; height: 100%;
        background: #FFFFFF; padding: 26px 20px;
        border: 1px solid #F8F8FA; border-bottom: none; border-radius: 15px 15px 0px 0px;}
    .section3-7 .col2 .p-content .txt1{font-weight: 700; font-size: 18px; line-height: 1;
        color: #000; text-align: left;}
    .section3-7 .col2 .p-content .txt2wrap{background: #EF605D;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1); margin: 15px 0px 0px;
        border-radius: 10px; width: 100%; height: 83px; padding: 30px 0px 0px 20px}
    .section3-7 .col2 .p-content .txt2wrap:after{content:""; display:block; clear:both;}
    .section3-7 .col2 .p-content .txt3{font-weight: 700; margin: 28px 0px 0px;
        font-size: 18px; line-height: 26px; display: block; color: #EF605D;}
    .section3-7 .col2 .p-content .txt2wrap .icon1{width: 22px; height: 22px;
        border-radius: 11px; background: #EF605D; float: left;
        box-shadow:-1px 1px 2px rgba(0, 0, 0, 0.2);}
    .section3-7 .col2 .p-content .txt2wrap .icon2{width: 8px; height: 15px;
        display: block; float: right; background: url(https://cdn.pillyze.io/web/img/caution-more.webp) center no-repeat;
        background-size: 8px 15px; margin: 3px 14px 0px 0px}
    .section3-7 .col2 .p-content .txt2wrap .txt2{ color: #EF605D;
        box-shadow: inset 0 -10px 0 #FFEA8D; padding: 0px 2px;
        line-height: 1; font-weight: 700; font-size: 22px;
        margin: 1px 0px 0px 10px;
    }
    .section3-7 .col2 .p-content {}


    /*## 030-modal.html ##*/
    .modal-content1 .txt1{font-weight: 700; font-size: 26px; line-height: 1;
        color: #101219; text-align: center; display: block;}
    .modal-content1 .txt2{font-weight: 500;
        font-size: 18px; line-height: 26px; display: block; color: #101219;
        text-align: center; margin: 27px auto 0px;}
    .modal-content1 .condition-cards{margin: 27px auto 0px;}
    .modal-content1 .condition-card{margin: 20px auto 0px; padding: 20px 20px 20px;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 10px; text-align: left;}
    .modal-content1 .condition-card .c-txt1{font-weight: 700; display: block;
        font-size: 20px; line-height: 1;}
    .modal-content1 .condition-card .c-txt2{font-weight: 500; display: block;
        font-size: 16px; line-height: 24px; color: #535968;
        margin: 12px auto 0px;}
    .modal-content1 .condition-card .c-txt2 span{font-weight: 700; color: #2D3142;}
    .modal-content1 .condition-card.type1{background: #EFFFFF;}
    .modal-content1 .condition-card.type2{background: #EFFFF4;}
    .modal-content1 .condition-card.type3{background: #FFEFF2;}
    .modal-content1 .condition-card.type4{background: #FFF9DE;}
    .modal-content1 .condition-card.type1 .c-txt1{color: #00C7C7;}
    .modal-content1 .condition-card.type2 .c-txt1{color: #15E74E;}
    .modal-content1 .condition-card.type3 .c-txt1{color: #FF416D;}
    .modal-content1 .condition-card.type4 .c-txt1{color: #FFB800;}
    .modal-content1 .line1{width: 100%; height: 1px; background: #E6E9ED; margin: 60px auto 0px;}
    .modal-content1 .txt3{font-weight: 700; margin: 60px auto 0px; text-align: center;
        font-size: 26px; color: #101219; line-height: 1; display: block;}
    .modal-content1 .chat-style-wrap{margin: 30px auto 0px;}
    .modal-content1 .chat-style-wrap .user-chat-wrap{display: block; margin: 20px auto 0px;}
    .modal-content1 .chat-style-wrap .user-chat-wrap:after{content:""; display:block; clear:both;}
    .modal-content1 .chat-style-wrap .user-chat-wrap .user-chat{float: right; min-height: 46px;
        line-height: 22px; background: #BDAAFF; color: #fff; padding: 12px 20px 11px;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 20px 0px 20px 20px; text-align: left !important;}
    .modal-content1 .chat-style-wrap .consultant-chat-wrap{padding:15px 20px 20px; display: block;
        background: #FFFFFF; box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 0px 20px 20px 20px; margin:20px auto 0px;}
    .modal-content1 .chat-style-wrap .consultant-chat-wrap .row1{}
    .modal-content1 .chat-style-wrap .consultant-chat-wrap .row1:after{content:""; display:block; clear:both;}
    .modal-content1 .chat-style-wrap .consultant-chat-wrap .row1 .character{float: left; width:48px; height: 48px; display: block;}
    .modal-content1 .chat-style-wrap .consultant-chat-wrap .row1 .name{float: left;
        font-weight: 700; font-size: 18px; display: block; height: 48px; line-height: 48px; text-align: left;
        color: #2D3142; margin-left: 10px;}
    .modal-content1 .chat-style-wrap .consultant-chat-wrap .row2{margin:12px 0px 0px; display: block;
        font-weight: 500; font-size: 16px; line-height: 24px; text-align: left !important; color: #535968;}
    .modal-content1 .chat-style-wrap .consultant-chat-wrap .row2 span{font-weight: 700; color: #8760F4;}
    .modal-content1 .info-more{display: block; margin:20px auto 0px; text-align: left;
        font-weight: 500; font-size: 14px; line-height: 22px; color: #787E8B;}
    .modal-content1 .chat-style-wrap div:first-child{margin: 0px auto 0px;}




    /*헤더*/
    .h-main-menu{position: absolute; width: 27px; height:41px; display: block;
        background: url(https://cdn.pillyze.io/web/img/btn-menu.webp) center no-repeat;  transition: all 0.3s;
        background-size: 27px 21px; top: 15px; left: 20px; cursor: pointer;}
    .h-logo{position: absolute; width: 107px; height:28px; display: block;  transition: all 0.3s;
        background: url(https://cdn.pillyze.io/web/img/logo.webp) center no-repeat;
        background-size: 107px 28px; top: 22px; left: 84px;}
    .ipt-main-wrap-2-0{height: 42px; width: 355px !important; position: absolute !important;
        margin: 0 !important; left: auto; right: 512px; height: 38px; line-height: 38px; border-radius: 19px;}
    .h-header .ipt-main-wrap-2-0 .ipt-main-wrap-in .ipt-h-search{text-align: left;}
    .btn-h-partner{float: left; font-weight: 500; font-size: 18px; color: #101219; height: 42px; line-height: 42px;
        margin: 0px 0px 0px 40px}
    .btn-h-write-review{float: left; font-weight: 500; font-size: 18px; color: #101219; height: 42px; line-height: 42px;
        margin: 0px 0px 0px 40px}
    .btn-h-app-down{float: left; font-weight: 700; font-size: 18px; color: #6C2FF2; height: 42px;
        line-height: 42px; display: block;
        margin: 0px 0px 0px 40px; transition: all 0.3s;}
    .h-header .btn-search{width: 35px; height: 35px;
        position: absolute; top: 1px; right: 13px; background: #FDCDBC;}
    .h-header .btn-search:before{content: ""; position: absolute;
        width: 20px; height: 38px; display: block;
        top: -1px; left: -20px;
        background:linear-gradient(90deg, transparent, #FDCDBC );}
    .h-header .btn-search .icon{width: 38px; height: 38px;
        background:  url(https://cdn.pillyze.io/web/img/plz-search2-1.webp) center no-repeat;
        background-size: 17px 17px; }
    .h-header .ipt-h-search:focus + .btn-search .icon
    {width: 35px; height: 35px;
        background: url(https://cdn.pillyze.io/web/img/plz-search2-2.webp) center no-repeat;
        background-size: 17px 17px;}
    .btn-h-login{float: left; font-weight: 700; font-size: 18px; color: #101219;
        height: 42px; line-height: 42px; padding: 0px 20px 0px 49px; text-align: center;
        margin: 0px 0px 0px 40px; transition: all 0.3s; display: block;
        background: #FEE500 url(https://cdn.pillyze.io/web/img/kakao-login.webp) 20px no-repeat;
        background-size: 24px 24px; border-radius: 21px;}



    /*메인메뉴*/
    .sm-dimm-area {display: none;}
    .sm-dimm-area.active {
        display: block; position: fixed; top: 0; left: 0;
        width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 300;}
    .s-main-menu {display: block; position: fixed; top: 0px; left: -380px;
        transition: left 0.3s;}
    .s-main-menu.active{display: block; position: fixed; top: 0; left: 0;
        width: 380px; height: 100%; background: #fff; z-index: 350;
        transition: left 0.3s;}
    .sm-row1{display: block; background: #6C2FF2; height: 78px; position: relative;}
    .sm-logo{position: absolute; width: 106px; height:28px; display: block;
        background: url(https://cdn.pillyze.io/web/img/f-logo.webp) center no-repeat;
        background-size: 106px 28px; top: 25px; left: 40px;}
    .sm-close{position: absolute; width: 40px; height:40px; display: block;
        background: url(https://cdn.pillyze.io/web/img/sm-close.webp) center no-repeat;
        background-size: 18px 18px; top: 19px; right: 32px;}

    .sm-login{position: absolute; height:30px; line-height: 30px; display: block; text-align: left;
        top: 25px; left: 164px; font-weight: 500; font-size: 16px; color: #fff; padding: 0px 0px 0px 15px;}
    .sm-login:before{position: absolute; content: ""; display: block; width: 1px; height: 14px; background: #fff;
        top: 8px; left: 0px;}
    .sm-login:link, .sm-login:visited{color: #fff;}
    .sm-logout{position: absolute; height:30px; line-height: 30px; display: block; text-align: left;
        top: 25px; left: 164px; font-weight: 500; font-size: 16px; color: #fff; padding: 0px 0px 0px 15px;}
    .sm-logout:before{position: absolute; content: ""; display: block; width: 1px; height: 14px; background: #fff;
        top: 8px; left: 0px;}
    .sm-logout:link, .sm-logout:visited{color: #fff;}

    .sm-menu-wrap{width: 100%; display: block; margin: 10px 0px 0px;
        padding: 0px 40px 90px;}

    .sm-menu-wrap-all{width: 100%; display: block; height: calc(100% - 78px); overflow-y: auto;}


    .sm-menu-wrap .sm-menu{width: 100%; display: block; height: 91px; font-weight: 700;
        font-size: 22px; text-align: left; color: #101219; /*border-top: 2px dashed #E6E9ED;*/
        padding: 30px 0px 0px; position: relative;}
    .sm-menu-wrap .sm-menu:before{content: ""; position: absolute; width: 100%;
        height: 2px; top: 0px; left: 0px;
        background: url(https://cdn.pillyze.io/web/img/menu-line.webp) repeat-x;
        background-size: 12px 2px;}

    .sm-menu-wrap .sm-menu:first-child{border-top: none;}
    .sm-menu-wrap .sm-menu:first-child:before{display: none;}
    .sm-menu-wrap .sm-menu a{display: block; height: 30px; line-height: 30px;
        width: 100%; position: relative;}
    .sm-menu > a > span {color: #101219;}
    .stop-scrolling { height: 100%; overflow: hidden;}
    .sm-menu-child-wrap{display: none;}
    .sm-menu-child-wrap.active{display: block; padding: 0px 0px 30px}
    .sm-menu-child-wrap .sm-menu-child{color: #9BA1AA; display: block; width: 100%;
        font-weight: 500; font-size: 18px; margin-top: 20px;}
    .sm-menu-child-wrap .sm-menu-child:first-child{margin-top: 0px;}
    .sm-menu-child-wrap .sm-menu-child.active{color: #6C2FF2 !important;}
    .sm-menu-wrap .sm-menu a.haschild .m-arrow{width: 16px; height: 8px; float: right;
        background: url(https://cdn.pillyze.io/web/img/m-open.webp) center no-repeat; background-size: 16px 8px;
        margin: 12px 0px 0px; transition: all 0.1s;}
    .sm-menu-wrap .sm-menu a.haschild.active .m-arrow{transform: rotate(180deg);
        background: url(https://cdn.pillyze.io/web/img/m-open.webp) center no-repeat; background-size: 16px 8px;
        transition: all 0.1s;}

    .body-no-scroll{overflow-y: hidden;}



    /*위로가기*/
    a#goto_top{position: fixed; width:70px; height: 70px;  right:100px;
        bottom:100px; display: none; z-index: 290;
        background:url(https://cdn.pillyze.io/web/img/go_top76.webp) no-repeat;
        box-shadow:2px 2px 2px gray;
        border-radius:50%;
        background-size:70px 70px;}






    /*성분상세 페이지*/
    .section4-1{/*padding:30px 20px;*/padding:0px 0px 0px;
        width:calc(100% - 40px); max-width: 1800px;
        margin:30px auto 0px;}

    .s4-banner1{width:100%; height: 100%;
        background: #8760F4 url(https://cdn.pillyze.io/web/img/s4-b1-bg.webp) bottom no-repeat;
        background-size: 1800px 125px; border-radius: 20px;}
    .s4-banner1 .content{position: relative; width:960px; height: 180px;
        margin:0px auto;
    }
    .s4-banner1 .content:after{content: ""; display: block; clear: both;}
    .s4-banner1 .content .img1{float: left; margin: 46px 0px 0px;
        width: 148px; height: 134px;}
    .s4-banner1 .content .col1{float:left; margin-left: 40px; width: calc(100% - 376px)}
    .s4-banner1 .content .col1:after{content: ""; display: block; clear: both;}
    .s4-banner1 .content .col1 .txt1{font-weight: 700; display: block;
        font-size: 32px; line-height: 37px; color:#fff;
        text-align: left; margin:48px 0px 0px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;}
    .s4-banner1 .content .col1 .txt2{font-weight: 500; display: block;
        font-size: 20px; line-height:30px; color:#fff; text-align: left; margin:11px 0px 0px;}

    .btn-share-s4{font-weight: 700; color: #fff;
        font-size: 16px; display: inline-block; height: 40px; line-height: 40px;
        text-align: left; padding: 0px 49px 0px 16px;
        border-radius: 20px; margin: 48px 0px 0px; float: right;
        background: #A084FF url(https://cdn.pillyze.io/web/img/btn-share-s4.webp) calc(100% - 18px) 10px no-repeat;
        background-size: 19px 20px;}

    .clm-wrap{display: block; width: 100%; text-align: center;}
    .col-list-more2{font-weight: 500; line-height: 18px; display: inline-block;
        font-size: 16px; color: #9BA1AA; border-bottom: 1px solid #9BA1AA; text-align: center;
        margin: 20px auto 55px;}

    .new-040-col-title{
        color: #101219; margin: 0px 0px 30px;
        font-weight: 700;
        font-size: 20px;
        line-height: 28px;
        float: left;
        text-align: left;
    }

    /*신 레이아웃*/
    .new-wide-wrap{width: 1560px; margin: 40px auto 60px; }
    .new-wide-wrap:after{content: ""; display: block; clear: both;}
    .new-wide-wrap .left-wing{width: 240px; margin: 0px 40px 0px 20px; float: left;}
    .new-wide-wrap .left-wing:after{content: ""; display: block; clear: both;}
    .new-wide-wrap .right-wing{width: 260px; margin: 0px 0px 0px 40px; float: left;}
    .new-wide-wrap .right-wing:after{content: ""; display: block; clear: both;}
    .new-wide-wrap .new-wide-main{width: 960px; margin: 0px 0px 0px 0px; float: left;
        position: relative;}
    .new-wide-wrap .new-wide-main:after{content: ""; display: block; clear: both;}
    .new-wide-wrap .new-wide-main-in{background: #FFFFFF; border: 1px solid #E6E9ED; border-radius: 20px;
        padding: 0px 40px 0px; position: relative;}
    .new-wide-wrap .new-wide-main-in:after{content: ""; display: block; clear: both;}
    .new-wide-wrap .left-wing .sm-menu-wrap{padding: 0px 0px 0px 20px}

    .new-wide-wrap .left-wing .sm-menu-wrap .sm-menu:first-child
    {padding: 0px; height: 61px;}



    .r-fixed-1{width: 100%; display: block;}
    .r-fixed-1 .txt1{font-weight: 700;
        font-size: 18px; line-height: 28px; color: #101219; margin: -3px 0px 0px}
    .r-fixed-1 .txt1 span{color: #6C2FF2;}
    .r-fixed-1 .txt1 span.nochange{color: #101219;}
    .r-fixed-1 .txt1 a{color: #6C2FF2;}
    .r-fixed-1 .txt1 a:iink, .r-fixed-1 .txt1 a:visited{color: #6C2FF2;}
    .r-fixed-1 .item-cards{width: 100%; display: block; background: #fff;
        padding: 40px 30px 0px; text-align: left; margin: 13px 0px 0px;
        border: 1px solid #E6E9ED; border-radius: 20px;}
    .r-fixed-1 .item-cards:after{content:""; display:block; clear:both;}
    .r-fixed-1 .item-card{width: 100%; margin: 0px 0px 0px 0px; display: block;
        padding: 40px 0px 30px; border-top: 1px solid #E6E9ED;}
    .r-fixed-1 .item-card:first-child{padding: 0px 0px 30px; border-top: none;}
    .r-fixed-1 .item-card .item-img{width: 80px; height: 80px; display: block;
        margin: 0px;}
    .r-fixed-1 .item-card .txt1{font-weight: 500; display: block;
        font-size: 14px; color: #9BA1AA; line-height: 21px; text-align: left; margin: 18px 0px 0px}
    .r-fixed-1 .item-card .txt2{font-weight: 700; color: #101219; display: block;
        font-size: 16px; text-align: left; line-height: 24px; margin: 0px 0px 0px;
        overflow: hidden; text-overflow: ellipsis; /*white-space: nowrap;*/
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;}
    .r-fixed-1 .item-card .txt2 span{color:#6C2FF2;}
    .r-fixed-1 .item-card .card-tags{margin: 20px 0px 0px}
    .r-fixed-1 .item-card .card-tags:after{content:""; display:block; clear:both;}
    .r-fixed-1 .item-card .card-tags .card-tag{display: inline-block; float: left;
        margin: 0px 10px 10px 0px;
        border: 1px solid #D6D9E0; height: 30px; line-height: 28px;
        text-align: center; padding: 0px 15px;
        border-radius: 15px; color: #535968; font-weight: 500;}
    /*.r-fixed-1 .item-card .card-tags .card-tag:first-child{margin-left: 0px;}*/

    .r-fixed-1 .item-card .review{margin-top: 10px;}
    .r-fixed-1 .item-card .review:after{content:""; display:block; clear:both;}
    .r-fixed-1 .item-card .review .star-point{float: left; font-weight: 700;
        font-size: 16px; color: #535968; text-align: left; line-height: 1;
        background: url(https://cdn.pillyze.io/web/img/star-icon.webp) left 0px no-repeat;
        background-size: 14px 13px; padding-left: 20px}

    .r-fixed-1 .item-card .review .txt3{float: left;
        font-weight: 500; line-height: 15px; height: 16px; color: #9BA1AA;
        font-size: 14px; margin: 0px 0px 0px 10px}

    .r-fixed-1 .btn-more-product{background: #6C2FF2;
        margin: 27px 0px 0px; display: block; color: #fff;
        border-radius: 10px; text-align: center; font-weight: 500;
        font-size: 18px; width: 100%; height: 52px; line-height: 52px;}

    .r-fixed-1 .btn-more-product:link, .r-fixed-1 .btn-more-product:visited
    {color: #fff;}

    .r-fixed-area.fixed{position: fixed; top: 112px; left: calc(50% + 520px);
        width: 260px}


    .nwm-row {width: 100%; display: block; padding: 60px 0px; border-top: 1px solid #E6E9ED;;}
    .nwm-row:after{content:""; display:block; clear:both;}

    .nwm-row:first-child{border-top: none;}
    .nwm-row .title-wrap {width: 100%; display: block;}
    .nwm-row .title-wrap:after{content:""; display:block; clear:both;}
    .nwm-row .title-wrap .title{color: #101219; font-weight: 700;
        font-size: 20px; line-height: 28px; float: left; text-align: left;}
    .nwm-row .title-wrap .question-mark{width: 16px; height: 16px; display: block;
        background: url(https://cdn.pillyze.io/web/img/qmark-s2.webp) center no-repeat;
        background-size: 16px 16px; margin: 6px 0px 0px 6px; float: left;}
    .nwm-row1 .txt1{font-weight: 500; color: #2D3142; margin: 20px 0px 0px;
        font-size: 18px; text-align: left; line-height: 26px;}
    .nwm-row2{padding: 60px 0px 50px}
    .nwm-row2 .tag-wrap{width: 100%; display: block; margin: 20px 0px 0px;}
    .nwm-row2 .tag-wrap:after{content:""; display:block; clear:both;}
    .nwm-row2 .tag-wrap .tag{float: left; display: block; height: 30px; line-height: 30px;
        padding: 0px 15px; background: #F4F6FA; color: #535968; font-weight: 500;
        font-size: 16px; text-align: center;
        border-radius: 15px; margin: 0px 10px 15px 0px;}
    .nwm-row3 .btn-toggle-wrap{margin: 0px 0px 10px 0px;}
    .btn-toggle-wrap{display: block; width: 100%; padding: 2px 0px;}
    .btn-toggle-wrap:after{content:""; display:block; clear:both;}
    .btn-toggle{float: left; }
    .btn-toggle:after{content:""; display:block; clear:both;}
    .btn-toggle .tg-body{float: left; width: 40px; height: 16px; background: #D6D9E0;
        border-radius: 8px; position: relative; transition: all 0.3s;}
    .btn-toggle .tg-body:before{content: ""; display: block; width: 20px; height: 20px;
        position: absolute; left: 0px; top: -2px; background: #F4F6FA; transition: all 0.3s;
        box-shadow: -1px 1px 2px rgba(0, 0, 0, 0.2); border-radius: 10px; z-index: 100;}
    .btn-toggle.active .tg-body{float: left; width: 40px; height: 16px; background: #EAE7FD;
        border-radius: 8px; position: relative; transition: all 0.3s;}
    .btn-toggle.active .tg-body:before{content: ""; display: block; width: 20px; height: 20px;
        position: absolute; left: auto; right: 0px; top: -2px; background: #A084FF; transition: all 0.3s;
        box-shadow: -1px 1px 2px rgba(0, 0, 0, 0.2); border-radius: 10px; z-index: 100;}
    .btn-toggle .tg-txt{float: left; font-size: 0; width: 50px; height: 11px;
        background: url(https://cdn.pillyze.io/web/img/logo-for-me-d.webp) left 0px no-repeat;
        background-size: 50px 11px; margin: 2px 0px 0px 10px; transition: all 0.3s;}
    .btn-toggle.active .tg-txt{background: url(https://cdn.pillyze.io/web/img/logo-for-me.webp) left 0px no-repeat;
        background-size: 50px 11px; transition: all 0.3s;}
    .nwm-row3 .txt1{font-weight: 500; color: #535968; line-height: 26px;
        font-size: 18px; text-align: left; width: 100%; display: block; margin: 20px 0px 0px;}

    .nwm-row3 .txt-info{background: url(https://cdn.pillyze.io/web/img/info.webp) left 4px no-repeat;
        background-size: 14px 14px; margin: 5px 0px 0px}
    .nwm-row3 .txt-info:after{content:""; display:block; clear:both;}
    .nwm-row3 .txt-info .txt-info-content{float: right;
        width: calc(100% - 18px); font-weight: 500; color: #181E6A;
        font-size: 14px; line-height: 22px; text-align: left;}


    .nwm-row3 .status-wrap{display: block; width: 100%; margin: 30px 0px 0px;}
    .nwm-row3 .status-wrap:after{content:""; display:block; clear:both;}
    .nwm-row3 .status-wrap .status{float: left; display:block; height: 30px; border-radius: 15px;
        text-align: center; padding: 0px 15px; font-weight: 700; line-height: 30px;
        font-size: 14px;  background: #EFFFFF; color: #00C7C7;}
    .nwm-row3 .status-wrap .status.status1{background: #FFEFF2; color: #FF416D;}/*부족*/
    /*.nwm-row3 .status-wrap .status.status1{background: #FFF9DE; color: #FFB800;}*//*부족*/
    .nwm-row3 .status-wrap .status.status2{background: #EFFFF4; color: #15E74E;}/*충족*/
    .nwm-row3 .status-wrap .status.status3{background: #EFFFFF; color: #00C7C7;}/*최적*/
    .nwm-row3 .status-wrap .status.status4{background: #FFF9DE; color: #FFB800;}/*부족*/

    .nwm-row3 .status-wrap .status-txt{height: 30px; line-height: 30px; margin: 0px 0px 0px 10px;
        font-weight: 500; float: left; font-size: 16px; color: #2D3142;}
    .nwm-row3 .status-wrap .status-txt span{font-weight: 700;}


    .nwm-row3 .EF605D{width: 100%; display: block; font-weight: 700;
        font-size: 18px; line-height: 26px; color: #2d3142;  text-align: left;
        margin: 20px 0px 0px}
    .nwm-row3 .txt2 span{color: #6C2FF2;}
    .nwm-row3 .txt3{width: 100%; display: block; font-weight: 500;
        font-size: 18px; line-height: 26px; color: #535968; text-align: left;
        margin: 15px 0px 0px}



    .nwm-row4 .caution-wrap{display: block; width: 100%;}
    .nwm-row4 .caution-wrap:after{content:""; display:block; clear:both;}
    .nwm-row4 .caution-wrap .caution{float: left; width: 50%; margin: 20px 0px 0px;}
    .nwm-row4 .caution-wrap .caution:after{content:""; display:block; clear:both;}
    .nwm-row4 .caution-wrap .caution .img{float: left; width: 90px; height: 90px;
        border-radius: 45px;}
    .nwm-row4 .caution-wrap .caution.type1 .img{
        background: #F8F8FA url(https://cdn.pillyze.io/web/img/caution1.webp) center no-repeat;
        background-size: 50px 50px;}
    .nwm-row4 .caution-wrap .caution.type2 .img{
        background: #F8F8FA url(https://cdn.pillyze.io/web/img/caution2.webp) center no-repeat;
        background-size: 50px 50px;}
    .nwm-row4 .caution-wrap .caution .ct-txt{width: calc(100% - 90px);
        height: 90px; display: table-cell; vertical-align: middle; font-weight: 500;
        font-size: 16px; color: #101219; text-align: left; padding: 0px 0px 0px 20px}

    .nwm-row5 {padding: 60px 0px 0px;}
    .nwm-row5 .section3-5{margin: 30px 0px 0px;}
    .nwm-row5 .section3-5 .accordian-wrap .card-wrap{padding: 0px;
        border-bottom: 1px solid #E6E9ED; margin: 0px;}
    .section3-5 .accordian-wrap .card-wrap .acd-title{padding: 31px 0px 32px}
    .nwm-row5 .section3-5 .accordian-wrap .card-wrap .acd-content{/*border-top: none;*/}
    .nwm-row5 + .nwm-row{border-top: none;}
    .nwm-row7 {padding: 60px 0px 40px}
    .nwm-row7 .txt1{font-weight: 500; width: 100%; display: block;
        margin: 5px 0px 0px;
        font-size: 18px; line-height: 26px; text-align: left; color: #535968;}

    .nwm-row7 .daily-food-wrap{margin: 20px 0px 0px;}
    .nwm-row7 .daily-food-wrap .daily-food{background: #F8F8FA; float: left;
        width: calc((100% - 80px) / 5) !important; margin: 0px 0px 20px 20px;
        padding: 0px 20px;
        border-radius: 15px; height: 160px; text-align: center; display: table;}
    .nwm-row7 .daily-food-wrap .daily-food:nth-child(5n - 4){margin: 0px 0px 20px 0px}
    .nwm-row7 .daily-food-wrap .daily-food .daily-food-in{display: table-cell;
        vertical-align: middle; height: 160px; text-align: center; width: 100%;}

    .df-txt1{width: 100%; display: block; font-weight: 700;
        font-size: 18px; color: #2D3142; line-height: 26px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;}

    .df-txt2{width: 100%; display: block; font-weight: 500;
        font-size: 16px; line-height: 24px; color: #535968; margin-top: 9px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;}


    .nwm-row8{padding: 0px; }
    .nwm-r-col{float: left; width: 50%; padding: 60px 20px 45px 40px; margin-left: -1px;
        border-left: 1px solid #E6E9ED}
    .nwm-r-col:first-child{border-right: 1px solid #E6E9ED; border-left: none;}
    .nwm-row8 .tag-wrap{width: 100%; display: block; margin: 30px 0px 0px;}
    .nwm-row8 .tag-wrap:after{content:""; display:block; clear:both;}
    .nwm-row8 .tag-wrap .tag{float: left; display: block; height: 30px; line-height: 30px;
        padding: 0px 15px; background: #F4F6FA; color: #535968; font-weight: 500;
        font-size: 16px; text-align: center;
        border-radius: 15px; margin: 0px 10px 15px 0px;}
    .nwm-row8 .tag-wrap .tag:hover{text-decoration: underline !important; color: #535968;}
    .nwm-row8 .tag-wrap .tag:link, .nwm-row8 .tag-wrap .tag:visited{color: #535968;}

    .nwm-row9 {border-top: none !important;}
    .nwm-row9 .tag-wrap{width: 100%; display: block; margin: 0px 0px 0px;}
    .nwm-row9 .tag-wrap:after{content:""; display:block; clear:both;}
    .nwm-row9 .tag-wrap .tag{float: left; display: block; height: 30px; line-height: 28px;
        padding: 0px 15px; background: none; color: #C4C8CE; font-weight: 500;
        font-size: 16px; text-align: center;
        border: 1px solid #D6D9E0;
        border-radius: 15px; margin: 0px 10px 15px 0px;}
    .nwm-row9 .tag-wrap .tag:hover{text-decoration: underline !important; color: #C4C8CE;}
    .nwm-row9 .tag-wrap .tag:link, .nwm-row8 .tag-wrap .tag:visited{color: #C4C8CE;}

    .section4-bt{margin: 0px 0px 0px;}
    .section4-bt .c-card-wrap {
        background: #EF605D;
        border-radius: 20px;
        padding: 46px 0px 0px 60px;
        position: relative;
        min-height: 271px;
    }

    .section4-bt .col1{float: left; position: relative;}
    .section4-bt .col1 .img-caution{position: absolute; width: 69px; height: 62px;
        /*background: #F4F6FA url(https://cdn.pillyze.io/web/img/img_state_caution.png) center no-repeat;
background-size: 69px 62px;*/ left: 0px; top: -92px; display: block;}
    .section4-bt .col1 .txt1{float: left; font-weight: 500; display: block;
        font-size: 18px; line-height: 30px; color: #fff; text-align: left; width: 100%}
    .section4-bt .col1 .txt2{float: left; font-weight: 700; margin: 2px 0px 0px;
        font-size: 26px; line-height: 35px; color: #fff; text-align: left; display: block;
        width: 100%}
    .section4-bt .col1 .txt2 span{color: #ffcd00}
    .section4-bt .col1 .txt3{float: left; margin: 16px 0px 0px;
        font-weight: 500; font-size: 14px; line-height: 22px; color: #EAE7FD; display: block;
        text-align: left; display: block; width: 100%;}
    .section4-bt .col2 {position: absolute; width: 358px; height: auto /*305px*/;
        bottom: 0px; right: 60px; background: #FFFFFF;
        box-shadow: 5px -5px 10px rgba(70, 56, 147, 0.1);
        border-radius: 45px 45px 0px 0px; padding: 63px 20px 0px;}
    .section4-bt .col2:before{content: ""; display: block; position: absolute;
        width: 56px; height: 5px; top: 32px; left: calc(50% - 28px); border-radius: 3px;
        background: #E6E9ED;}
    .section4-bt .col2 .p-content{width: 100%; height: 100%;
        background: #FFFFFF; padding: 20px 20px;
        border: 1px solid #F8F8FA; border-bottom: none; border-radius: 15px 15px 0px 0px;}
    .section4-bt .col2 .p-content .txt1{font-weight: 500;
        font-size: 16px; text-align: left; color: #535968; width: 100%;
        display: block; line-height: 24px; margin: 15px 0px 0px;}
    .section4-bt .col2 .p-content .txt1 span{font-weight: 700;}
    .section4-bt .app-down-btns{display: block; margin: 20px 0px 0px; float: left;}
    .section4-bt .app-down-btns:after{content:""; display:block; clear:both;}

    .section4-bt .app-down-btns .btn-app-down-apple{float: left; height: 44px;
        color: #6C2FF2; line-height: 44px; padding: 0px 22px 0px 54px;
        background: #F8F8FA url(https://cdn.pillyze.io/web/img/app-apple.webp) 18px no-repeat;
        background-size: 24px 24px; border-radius: 22px;}
    .section4-bt .app-down-btns .btn-app-down-google{float: left; height: 44px;
        color: #6C2FF2; line-height: 44px; padding: 0px 22px 0px 54px;
        margin: 0px 0px 0px 15px; border-radius: 22px;
        background: #F8F8FA url(https://cdn.pillyze.io/web/img/app-google.webp) 18px no-repeat;
        background-size: 24px 24px;}

    .btn-toggle-wrap-nouse{display: block; width: 100%; padding: 2px 0px;}
    .btn-toggle-wrap-nouse:after{content:""; display:block; clear:both;}
    .btn-toggle-nouse{float: left; }
    .btn-toggle:after{content:""; display:block; clear:both;}
    .btn-toggle-nouse .tg-body{float: left; width: 40px; height: 16px; background: #D6D9E0;
        border-radius: 8px; position: relative; transition: all 0.3s;}
    .btn-toggle-nouse .tg-body:before{content: ""; display: block; width: 20px; height: 20px;
        position: absolute; left: 0px; top: -2px; background: #F4F6FA; transition: all 0.3s;
        box-shadow: -1px 1px 2px rgba(0, 0, 0, 0.2); border-radius: 10px; z-index: 100;}
    .btn-toggle-nouse.active .tg-body{float: left; width: 40px; height: 16px; background: #EAE7FD;
        border-radius: 8px; position: relative; transition: all 0.3s;}
    .btn-toggle-nouse.active .tg-body:before{content: ""; display: block; width: 20px; height: 20px;
        position: absolute; left: auto; right: 0px; top: -2px; background: #A084FF; transition: all 0.3s;
        box-shadow: -1px 1px 2px rgba(0, 0, 0, 0.2); border-radius: 10px; z-index: 100;}
    .btn-toggle-nouse .tg-txt{float: left; font-size: 0; width: 50px; height: 11px;
        background: url(https://cdn.pillyze.io/web/img/logo-for-me-d.webp) left 0px no-repeat;
        background-size: 50px 11px; margin: 2px 0px 0px 10px; transition: all 0.3s;}
    .btn-toggle-nouse.active .tg-txt{background: url(https://cdn.pillyze.io/web/img/logo-for-me.webp) left 0px no-repeat;
        background-size: 50px 11px; transition: all 0.3s;}


    .section4-bt .status-wrap{display: block; width: 100%; margin: 16px 0px 0px;}
    .section4-bt .status-wrap:after{content:""; display:block; clear:both;}
    .section4-bt .status-wrap .status{float: left; display:block; height: 30px; border-radius: 15px;
        text-align: center; padding: 0px 15px; font-weight: 700; line-height: 30px;
        font-size: 14px;  background: #EFFFFF; color: #00C7C7;}
    .section4-bt .status-wrap .status.status1{background: #FFF9DE; color: #FFB800;}/*부족*/
    .section4-bt .status-wrap .status.status2{background: #EFFFF4; color: #15E74E;}/*충족*/
    .section4-bt .status-wrap .status.status3{background: #EFFFFF; color: #00C7C7;}/*최적*/
    .section4-bt .status-wrap .status.status4{background: #FFEFF2; color: #FF416D;}/*주의*/
    .section4-bt .status-wrap .status-txt{height: 30px; line-height: 30px; margin: 0px 0px 0px 10px;
        font-weight: 500; float: left; font-size: 16px; color: #2D3142;}
    .section4-bt .status-wrap .status-txt span{font-weight: 700;}
    .section4-bt .bar-graph-txt1{font-weight: 500; color: #787E8B;
        font-size: 14px; display: block; line-height: 1; margin: 14px 0px 0px;}

    .section4-bt .bar-graph-wrap{background: #F8F8FA; margin: 7px 0px 0px;
        border-radius: 5px; width: 100%; display: block; overflow: hidden; height: 20px;}
    .section4-bt .bar-graph-wrap:after{content:""; display:block; clear:both;}
    .section4-bt .bar-graph-bar{background: #FFEA8D; float: left;
        border-radius: 5px 0px 0px 5px; height: 20px; width: 90%}
    .section4-bt .bar-graph-txt2{font-weight: 500; color: #9BA1AA;
        font-size: 14px; display: block; width: 100%; margin: 5px 0px 0px;}


    .effect-info-wrap{display: block; width: 100%; border: 1px solid #E6E9ED;}
    .effect-info-wrap:after{content: ""; display: block; clear: both;}
    .effect-info-wrap .effect-info{float: left; width: 50%; }
    .effect-info-wrap .effect-info + .effect-info-wrap .effect-info
    {margin: 0px 0px 0px -1px; border-left: 1px solid #E6E9ED;}
    .effect-info-wrap .effect-info:first-child{border-right: 1px solid #E6E9ED;}
    .effect-info-wrap .effect-info .title{width: 100%; display: block;
        height: 58px; line-height: 58px; font-size: 20px; font-weight: 700;
        color: #101219; text-align: left; padding: 0px 20px 0px 30px;
        background: #F8F8FA; border-bottom: 1px solid #e6e9ed}
    .effect-info-wrap .effect-info .content{padding: 30px 50px 30px 30px;
        font-weight: 500; font-size: 18px; line-height: 26px;}



    /*050 모달*/
    .modal-content2{background: #6C2FF2 !important; padding: 60px 0px 0px !important;
        top: calc(50% - 322px) !important;}
    .modal-content2 .modal-body{max-height: 10000px !important;}
    .modal-content2 .modal-body .txt1{color: #fff; font-weight: 700; line-height: 44px; display: block;
        font-size: 36px; width: 100%; text-align: center;}
    .modal-content2 .modal-body .txt2{color: #fff; font-weight: 500;
        font-size: 18px; margin: 20px 0px 0px; display: block; width: 100%; text-align: center;}

    .modal-content2 .modal-body .app-down-btns{display: inline-block; margin: 38px auto 0px; }
    .modal-content2 .modal-body .app-down-btns:after{content:""; display:block; clear:both;}
    .modal-content2 .modal-body .app-down-btns .btn-app-down-apple{float: left; height: 44px;
        color: #6C2FF2; line-height: 44px; padding: 0px 22px 0px 54px; font-weight: 500;
        background: #F8F8FA url(https://cdn.pillyze.io/web/img/app-apple.webp) 18px no-repeat;
        background-size: 24px 24px; border-radius: 22px;}
    .modal-content2 .modal-body .app-down-btns .btn-app-down-google{float: left; height: 44px;
        color: #6C2FF2; line-height: 44px; padding: 0px 22px 0px 54px; font-weight: 500;
        margin: 0px 0px 0px 15px; border-radius: 22px;
        background: #F8F8FA url(https://cdn.pillyze.io/web/img/app-google.webp) 18px no-repeat;
        background-size: 24px 24px;}


    .modal-content2 .modal-body .col2 {width: 438px; height: 373px;
        background: #FFFFFF; background: #FFFFFF; margin: 40px auto 0px;
        box-shadow: 5px -5px 10px rgba(70, 56, 147, 0.1); position: relative;
        border-radius: 60px 60px 0px 0px;  padding: 78px 26px 0px;}
    .modal-content2 .modal-body .col2:before{content: ""; display: block; position: absolute;
        width: 56px; height: 5px; top: 32px; left: calc(50% - 28px); border-radius: 3px;
        background: #E6E9ED;}
    .modal-content2 .modal-body .col2 .p-content{width: 100%; height: 100%;
        background: #FFFFFF; padding: 36px 24px; position: relative;
        border: 1px solid #F8F8FA; border-bottom: none; border-radius: 15px 15px 0px 0px;}

    .modal-content2 .modal-body .col2 .p-content .txt2-1{font-weight: 700; font-size: 26px; line-height: 1;
        color: #101219; text-align: left; display: block; width: 100%;}
    .modal-content2 .modal-body .col2 .p-content .txt2-2{font-weight: 700; font-size: 16px; line-height: 1;
        color: #535968; text-align: left; display: block; width: 100%; margin: 5px 0px 0px;}
    .modal-content2 .modal-body .col2 .p-content .txt2-3{font-weight: 500;
        font-size: 16px; line-height: 1;
        color: #787E8B; text-align: left; display: block; width: 100%; margin: 5px 0px 0px;}



    .modal-content2 .modal-body .col2 .p-content .item2{display: block; width: 100%; padding: 22px 0px 0px}
    .modal-content2 .modal-body .col2 .p-content .item2.first{padding: 50px 0px 0px}
    .modal-content2 .modal-body .col2 .p-content .item2 .title{font-weight: 500; float: left;
        font-size: 18px; color: #2D3142; line-height: 30px; height: 30px; text-align: left;}
    .modal-content2 .modal-body .col2 .p-content .item2{}

    .modal-content2 .modal-body .col2 .p-content .item2 .status{float: left; display:block; height: 30px; border-radius: 15px;
        text-align: center; padding: 0px 15px; font-weight: 700; line-height: 30px;
        font-size: 14px;  background: #EFFFFF; color: #00C7C7;}
    .modal-content2 .modal-body .col2 .p-content .item2 .status.status1{background: #FFF9DE; color: #FFB800;}/*부족*/
    .modal-content2 .modal-body .col2 .p-content .item2 .status.status2{background: #EFFFF4; color: #15E74E;}/*충족*/
    .modal-content2 .modal-body .col2 .p-content .item2 .status.status3{background: #EFFFFF; color: #00C7C7;}/*최적*/
    .modal-content2 .modal-body .col2 .p-content .item2 .status.status4{background: #FFEFF2; color: #FF416D;}/*주의*/
    .modal-content2 .modal-body .col2 .p-content .img2-1{width: 90px; height: 90px;
        border-radius: 45px; background: #F8F8FA url(https://cdn.pillyze.io/web/img/energy.webp) center no-repeat;
        background-size: 60px 60px; position: absolute; top: 20px; right: 26px; z-index: 100;}
    .modal-content2 .modal-body .col2 .p-content .item2 .s-r-arrow{float: left; width: 7px; height: 29px;
        background: url(https://cdn.pillyze.io/web/img/caution-more.webp) center no-repeat;
        background-size: 7px 13px; margin: 0px 0px 0px 9px; opacity: 0.6;}

    .modal-content2 .p-btn-close{background: url(https://cdn.pillyze.io/web/img/sm-close.webp) center no-repeat;
        background-size: 18px 18px;}




    /*171 모달*/
    /*050 모달*/
    .modal-content172{background: #fff            !important; padding: 60px 0px 0px !important;
        top: 50% !important; transform: translateY(-50%);}
    .modal-content172 .modal-body{max-height: 10000px !important;}
    .modal-content172 .modal-body .txt1{color: #101219; font-weight: 700; line-height: 44px;
        display: block; font-size: 36px; width: 100%; text-align: center;}
    .modal-content172 .modal-body .txt2{color: #535968; font-weight: 500;
        font-size: 18px; line-height: 26px;
        margin: 10px 0px 0px; display: block; width: 100%; text-align: center;}
    .modal-content172 .modal-body .txt3{display: inline-block; height: 32px;
        line-height: 32px; padding: 0px 20px; text-align: center;
        color: #6C2FF2; font-weight: 500; font-size: 16px; border-radius: 16px;
        margin: 20px auto  0px; background: #F4F2FF;}
    .modal-content172 .modal-body .txt3 span{font-weight: 700;}

    .modal-content172 .modal-body .img1{width: 472px; height: 338px; margin: 20px auto 0px;
        display: block;}
    .modal-content172 .modal-body .img1x{width: 305px; height: 256px; margin: 77px auto 0px;
        display: block;}

    .modal-content172 .row-bottom{ background: #6C2FF2;  width: 100%; height: 89px;
        border-radius: 0px 0px 40px 40px; text-align: center;}
    .modal-content172 .row-bottom .inside{display: inline-block; margin: 25px auto 0px;}
    .modal-content172 .row-bottom .inside:after{content: ""; display: block; clear: both;}
    .modal-content172 .row-bottom .inside .i-txt1{float: left; color: #FFF; font-weight: 500; font-size: 24px; line-height: 39px;line-height: 39px;}
    .modal-content172 .row-bottom .inside .i-txt2{float: left; color: #FFF; font-weight: 500; font-size: 24px; line-height: 39px; line-height: 39px;}
    .modal-content172 .row-bottom .inside .i-ipt-wrap{float: left; position: relative; margin: 0px 10px;}
    .modal-content172 .row-bottom .inside .i-ipt-wrap .fake-btn-search{width: 22px; height: 22px; top: 8px; left: 8px;
        background: url(https://cdn.pillyze.io/web/img/ic-search22.webp) center no-repeat; position: absolute;
        background-size: 22px 22px;}
    .modal-content172 .row-bottom .inside .i-ipt-wrap .fake-ipt-search{text-align: left;
        width: 281px; height: 39px; background: #F8F8FA; box-shadow: 0px 1px 2px rgba(70, 56, 147, 0.1); border-radius: 10px;
        font-weight: 500; font-size: 22px; color: #101219; padding: 0px 0px 0px 40px; line-height: 39px;}
    .modal-content172 .row-bottom .inside2{display: none;}


    /*인기 성분 검색*/
    .section6-1{padding:30px 0px 0px;
        width:calc(100% - 40px); max-width: 1800px;
        margin:0px auto; }

    .s6-banner1{width:100%; height: 100%;
        border-radius: 20px; background: #FFF4BC;}
    .s6-banner1 .content{position: relative; width:960px; height: 180px;
        margin:0px auto;
    }
    .s6-banner1 .content:after{content: ""; display: block; clear: both;}
    .s6-banner1 .content .img1{float: left; margin: 30px 0px 0px;
        width: 120px; height: 120px;}

    .s6-banner1 .content .col1{float:left; margin-left: 60px;}
    .s6-banner1 .content .col1:after{content: ""; display: block; clear: both;}
    .s6-banner1 .content .col1 .txt1{font-weight: 700; display: block;
        font-size: 32px; line-height: 1;
        text-align: left; color: #101219; margin:52px 0px 0px;}
    .s6-banner1 .content .col1 .txt2{font-weight: 500; display: block;
        font-size: 20px; line-height:30px;
        text-align: left; color: #535968; margin:11px 0px 0px;}



    .right-wing .r-banner-card{width: 100%; height: 287px; display: block;
        background: #F4F2FF url(https://cdn.pillyze.io/web/img/r-banner1.webp) right calc(100% - 15px) no-repeat;;
        border: 1px solid #EAE7FD; background-size: 220px 165px;
        border-radius: 10px; padding: 18px 20px; position: relative;}
    .right-wing .r-banner-card .rb-txt1{font-weight: 700;
        font-size: 22px; line-height: 30px; text-align: left; color: #101219}
    .right-wing .r-banner-card .rb-txt1 span{color: #6C2FF2;}

    .new-wide-wrap-060 {margin: 40px auto 100px;}
    .new-wide-main-060 .tab-wrap{display: block; width: 100%;}
    .new-wide-main-060 .tab-wrap:after{content:""; display:block; clear:both;}
    .new-wide-main-060 .tab-wrap .tab{display: block; float: left; height: 42px; line-height: 33px;
        text-align: center; font-weight: 700; color: #101219;
        font-size: 22px; border-bottom: 1px solid #E6E9ED;}
    .new-wide-main-060 .tab-wrap .tab.active{border-bottom: 3px solid #6C2FF2;}
    .new-wide-main-060 .tab-wrap .tab.tab-1in4{width: 25%}

    .new-wide-main-060 .ingredient-wrap{width: calc(100% + 20px); margin-top: 10px;}
    .new-wide-main-060 .ingredient-wrap:after{content:""; display:block; clear:both;}

    .new-wide-main-060 .ingredient-wrap {
        display: none;
    }

    .new-wide-main-060 .ingredient-wrap.active {
        display: block;
    }
    .new-wide-main-060 .ingredient-wrap .ingredient-one{width: calc(20% - 20px); height: 150px;
        margin: 20px 20px 0px 0px; float: left;
        padding: 0px 27px;
        border-radius: 20px; box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        text-align: center; background: #FFFFFF;
        display: table; border: 1px solid #E6E9ED;}
    .new-wide-main-060 .ingredient-wrap .ingredient-one:hover{box-shadow: 0px 2px 20px rgba(70, 56, 147, 0.2);}
    .ingredient-wrap .ingredient-one:hover{box-shadow: 0px 2px 20px rgba(70, 56, 147, 0.2);}
    .new-wide-main-060 .ingredient-wrap .ingredient-one .txt-fix{    display: table-cell;
        vertical-align: middle;
        height: 150px; font-weight: 500;
        font-size: 18px; line-height: 26px; color: #101219;
        text-align: center;
        width: 100%;}

    .new-wide-main-060.p190-t6 .ingredient-wrap .ingredient-one.active{
        background: #F4F2FF;
        border: 1px solid #E6E9ED;
        box-shadow: 0px 2px 20px rgba(70, 56, 147, 0.2); border-radius: 20px;}

    .new-wide-main-060 .ingredient-wrap .ingredient-one .txt-fix span{
        font-size: 18px; line-height: 26px; color: #101219;
        text-align: center;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 4;
        -webkit-box-orient: vertical;}

    .new-wide-main-070{ /*width: calc(980px) !important;
margin: -10px 0px 0px -10px !important; padding: 10px !important;*/}
    .new-wide-main-070 .item-cards:after{content:""; display:block; clear:both;}
    .new-wide-main-070 .item-card{width: calc((100% - 40px) / 3); margin: 20px 0px 0px 20px;
        display: block;
        border: 1px solid #E6E9ED; box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 20px; background: #fff; height: 352px; float: left;
        padding: 0px 20px;}
    .new-wide-main-070 .item-card:nth-child(3n - 2){margin: 20px 0px 0px 0px;}
    .new-wide-main-070 .item-card .item-img{width: 130px; height: 130px; display: block;
        margin: 40px auto 0px;}
    .new-wide-main-070 .item-card .txt1{font-weight: 500; display: block;
        font-size: 14px; color: #9BA1AA; text-align: left; margin: 30px 0px 0px}
    .new-wide-main-070 .item-card .txt2{font-weight: 700; color: #101219; display: block;
        font-size: 18px; text-align: left; line-height: 27px; margin: 4px 0px 0px;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .new-wide-main-070 .item-card .txt2 span{color:#EF605D;}
    .new-wide-main-070 .item-card .review{margin-top: 10px;}
    .new-wide-main-070 .item-card .review:after{content:""; display:block; clear:both;}
    .new-wide-main-070 .item-card .review .star-point{float: left; font-weight: 700;
        font-size: 17px; color: #535968; text-align: left; line-height: 20px;
        background: url(https://cdn.pillyze.io/web/img/star-icon.webp) left 2px no-repeat;
        background-size: 16px 15px; padding-left: 20px; height:20px; }
    .new-wide-main-070 .item-card .review .txt3{float: left;
        font-weight: 500; line-height: 19px; height: 20px; color: #9BA1AA;
        font-size: 16px; margin: 0px 0px 0px 10px }
    .new-wide-main-070 .txt-dot{width: 100%; font-weight: 500; margin: 21px 0px 0px;
        font-size: 16px; line-height: 22px; min-height: 22px; position: relative;
        color: #787E8B; padding: 0px 0px 0px 20px;}
    .new-wide-main-070 .txt-dot:before{position: absolute; width: 5px; height: 5px; border-radius: 3px;
        background: #787E8B; left:7px; top:9px; content: ""; display: block;}
    .new-wide-main-070 .item-more {width: 100%; display: block; text-align: center;
        background: #FFFFFF;  height: 52px; line-height: 50px; margin: 20px 0px 0px;
        border: 1px solid #E6E9ED; font-size: 18px; color: #787E8B;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1); border-radius: 10px;}
    .new-wide-main-070 .txt-more, .section2-2 .txt-more
    {font-size: 16px; color: #9BA1AA; font-weight: 500; text-align: center;
        line-height: 24px; margin: 56px auto 0px; display: block;}
    .new-wide-main-070 .our-email, .section2-2 .our-email
    {display: block; font-weight: 500;
        font-size: 16px; line-height: 1; color: #9BA1AA; text-align: center; margin: 5px auto 0px;}

    .new-wide-main-070 .sr-banner1{background: #FFFFFF; display: block; width: 100%;
        border: 1px solid #E6E9ED; box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 20px; height: 153px; padding: 30px 65px 0px 30px}
    .new-wide-main-070 .sr-banner1:after{content:""; display:block; clear:both;}

    .new-wide-main-070 .sr-banner1 .img1{float: left; width: 128px;
        height: 116px; /*background: url(https://cdn.pillyze.io/web/img/anna3.webp) left 2px no-repeat;
background-size: 128px 116px; */margin: 6px 0px 0px 0px;}
    .new-wide-main-070 .sr-banner1 .txt-wrap{float: left; margin: 0px 0px 0px 30px;
        width: calc(100% - 158px);}
    .new-wide-main-070 .sr-banner1 .txt1{font-weight: 700; color: #101219;
        font-size: 20px; line-height: 30px; text-align: left; display: block;}
    .new-wide-main-070 .sr-banner1 .txt1 span{color:#6C2FF2;}
    .new-wide-main-070 .sr-banner1 .txt2{text-align: left; display: block; width: 100%;
        font-weight: 500; color: #9BA1AA; line-height: 26px; margin-top: 12px;
        font-size: 18px; overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;}

    .ingredient-search-top{text-align: center;}
    .ingredient-search-top .content{padding: 40px 0px 60px; background: #fff;}
    .ingredient-search-top .txt1{font-weight: 700; font-size: 48px; line-height: 1; text-align: center;
        display: block; color: #101219; /*padding: 0px;*/ }
    .ingredient-search-top .txt1 span{color:#6C2FF2;}
    .ingredient-search-top .txt2{font-weight: 500; font-size: 26px; line-height: 1; text-align: left;
        display: block; color: #101219; width: 960px; margin: 10px auto;}
    .ingredient-search-top .txt2 span{color:#EF605D; font-weight: 700;}
    .ingredient-search-top .ipt-main-wrap{width: 960px; height: 64px;
        margin: 20px auto 0px; position: relative; }
    .ingredient-search-top .ipt-main-wrap-in{width:100%; height: 64px; background: #FFF;
        padding: 0px 3px; z-index:89; display: block; position: absolute;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1); border-radius: 32px;}
    .ingredient-search-top .ipt-main-wrap .ipt-main{width: 100%; border: none !important;
        height: 64px; text-align: center; color: #101219; border-radius: 32px;
        display: block;
        font-weight: 500; font-size: 20px; position: absolute; z-index: 90; left:0px; top:0px;}



    .ingredient-search-top .ipt-main-wrap .ipt-main::placeholder{color: #C4C8CE;}
    .ingredient-search-top .ipt-main-wrap .ipt-main:focus{outline: none !important;}
    .ingredient-search-top .ipt-main-wrap .btn-search{position: absolute; z-index: 91;
        width: 124px; top: 0px; right: 1px; border-radius: 32px;
        height: 64px; background: #EF605D;}
    .ingredient-search-top .ipt-main-wrap .btn-search:after{position: absolute; content: "";
        display: block; width: 20px; height: 20px; top: 22px; left: calc(50% - 10px);
        background:url(https://cdn.pillyze.io/web/img/plz-search.webp) center no-repeat;
        background-size: 20px 20px;}

    .ingredient-search-top .search-etc{margin: 30px auto 0px; display: inline-block;}
    .ingredient-search-top .search-etc .s-txt1{height: 42px; line-height: 42px; font-weight: 700;
        font-size: 18px; float: left; color: #787E8B; padding-right: 40px;}
    .ingredient-search-top .search-etc .search-keywords{float: left;}
    .ingredient-search-top .search-etc .search-keywords:after{content: ""; display: block; clear: both;}
    .ingredient-search-top .search-etc .search-keywords .search-keyword{float: left; height: 42px;
        line-height: 42px; display: inline-block; background: #F4F6FA;
        border-radius: 21px; font-weight: 500; color: #787E8B;
        font-size: 18px; padding: 0px 15px; margin-left: 20px;}
    .ingredient-search-top .search-etc .search-keywords .search-keyword:first-child{margin-left: 0px;}
    .ingredient-search-top .search-etc .s-txt2{font-weight: 500; line-height: 1;
        font-size: 14px; color: #C4C8CE; float: left; margin: 20px 0px 0px 30px}

    .ingredient-search-top.type2 .content{padding: 40px 0px}
    .ingredient-search-top.type2 .ipt-main-wrap{margin: 20px auto 0px;}
    .top-nav{font-weight: 500; color: #9BA1AA; line-height: 1; text-align: left; font-size: 14px;
        display: block; width: 960px; margin: 0px auto; text-decoration: underline;text-underline-position: under;}
    .top-nav span{font-weight: 700;}
    .top-nav .top-nav-thispage{font-weight: 700;}
    .top-nav:hover {
        text-decoration: underline !important;
    }


    /*제품상세페이지*/
    .section3-4 .info-cards .txt1 .btn-open-info{float: left; margin:  4px 0px 0px 5px;}

    .section3-4 .info-cards{width: calc(100% + 20px);}
    .section3-4 .info-cards .card-wrap{width: calc((100% - 60px) / 3);}

    .new-wide-main-020-002 .section3-1 .card-wrap{padding: 60px 40px;}

    .new-wide-main-020-002 .ge-title {
        font-weight: 700;
        margin: 0px 0px 30px;
        display: block;
        font-size: 20px;
        color: #101219;
        line-height: 1;
        text-align: left;
    }

    .new-wide-main-020-002 .ge-title .txt-small{font-size: 14px; font-weight: 500; padding: 0px 0px 0px 8px}


    .section3-1-002{padding: 15px 0px 0px}
    .r-fixed-1-02-002{margin: 28px 0px 0px 0px}
    .r-fixed-area.r-fixed-1-02-002.fixed {
        top: 96px;}

    .left-wing-20-002{padding-top: 19px;}
    .section3-1 .col .txt1.txt1-002:hover{text-decoration: underline !important;}
    .section3-1 .col .txt1.txt1-002:link, .section3-1 .col .txt1.txt1-002: visited{color: #9BA1AA;}




    .section3-1 .btn-share.btn-share-002{
        position: absolute;
        top: 30px;
        right: 30px;
        width: 176px;
        font-weight: 700;
        color: #8760F4;
        border-radius: 22px;
        font-size: 16px;
        text-align: left;
        padding: 0px 0px 0px 15px;
        height: 44px;
        line-height: 44px;
        display: block;
        background: #F4F2FF;
    }

    .section3-1 .btn-share.btn-share-002:after {
        content: "";
        display: block;
        width: 19px;
        height: 20px;
        background: url(https://cdn.pillyze.io/web/img/share.webp) center no-repeat;
        position: absolute;
        background-size: 19px 20px;
        top: 12px;
        right: 15px;
    }


    .btn-open-info{background:url(https://cdn.pillyze.io/web/img/info.webp) center no-repeat;
        background-size: 16px 16px; width: 16px; height: 16px; display: block;}

    .section3-5b {margin: 80px 0px 0px; padding: 0px 0px 0px;}
    .section3-5b .card-wrap{padding: 40px 40px 25px;}
    .section3-5b .card-wrap:after{content: ""; display: block; clear: both;}
    .section3-5b .col1{width: calc(50% - 40px); float: left; display: block;}
    .section3-5b .col2{width: calc(50% - 40px); float: right; display: block;}
    .section3-5b .col .col-title{font-weight: 700; color: #8760F4;
        font-size: 20px; line-height: 1; text-align: left;}
    .section3-5b .material-wrap{display: block; width: 100%; margin: 10px 0px 0px;}
    .section3-5b .material-wrap .material{display: block; width: 100%; padding: 20px 0px 15px;
        border-top: 1px solid #E6E9ED;}
    .section3-5b .material-wrap .material:first-child{border-top: none;}
    .section3-5b .material-wrap .material:after{content: ""; display: block; clear: both;}
    .section3-5b .material-wrap .material .icon{width: 30px; height: 30px; display: block;
        float: left;}

    .section3-5b .txt1-wrap{width: calc(100% - 70px); display: block; float: left;}
    .section3-5b .txt1-wrap:after{content: ""; display: block; clear: both;}
    .section3-5b .txt1-wrap .txt1{float: left; font-weight: 700; color: #101219;
        font-size: 18px; height: 30px; line-height: 30px; margin: 0px 0px 0px 10px;}

    .section3-5b .btn-open-info{float: left; margin: 6px 0px 0px 7px}
    .section3-5b .txt2{float: right; height: 30px; display: block; line-height: 30px;
        font-weight: 500; text-align: right; color: #101219;
        font-size: 18px;}
    .section3-5b .txt3{display: block; width: 100%; color: #787E8B;
        font-weight: 500; line-height: 24px; margin: 10px 0px 0px;
        font-size: 16px;}



    .section3-5c {margin: 80px 0px 0px;}
    .section3-5c .card-wrap{padding: 60px 40px 0px; margin: 60px 0px 0px;}
    .section3-5c .sub-title-wrap{display: block; width: 100%; }
    .section3-5c .sub-title-wrap:after{content: ""; display: block; clear: both;}
    .section3-5c .sub-title{font-weight: 700;font-size: 22px; color: #101219; line-height: 1;
        float: left;}
    .section3-5c .sub-title span{color:#6C2FF2;}
    .section3-5c .btn-open-info{float: left; margin: 3px 0px 0px 7px}
    .section3-5c .card-tags{display: block; margin: 30px 0px 50px;}
    .section3-5c .card-tags:after{content: ""; display: block; clear: both;}
    .section3-5c .card-tags .card-tag{padding: 0px 15px; border-radius: 15px; height: 30px;
        line-height: 30px; margin: 0px 10px 10px 0px; text-align: center; font-weight: 500;
        font-size: 16px; color: #101219; float: left;}
    .section3-5c .card-tags .card-tag.card-tag1{background: #FFF9DE}
    .section3-5c .card-tags .card-tag.card-tag2{background: #EFFFFF}


    .section3-6 {margin: 80px 0px 0px;}
    .section3-6 .card-wrap{padding: 60px 40px 0px; margin: 60px 0px 0px;}
    .section3-6 .sub-title-wrap{display: block; width: 100%; margin: 30px 0px 0px}
    .section3-6 .sub-title-wrap:after{content: ""; display: block; clear: both;}
    .section3-6 .sub-title{font-weight: 700;
        font-size: 16px; color: #101219; line-height: 1;
        float: left;}
    .section3-6 .btn-open-info{float: left; margin: 3px 0px 0px 7px}
    .section3-6 .card-tags{display: block; margin: 10px 0px 0px;}
    .section3-6 .card-tags:after{content: ""; display: block; clear: both;}
    .section3-6 .card-tags .card-tag{padding: 0px 15px; border-radius: 15px; height: 30px;
        line-height: 30px; margin: 0px 10px 10px 0px; text-align: center; font-weight: 500;
        font-size: 16px; color: #101219; float: left;}
    .section3-6 .card-tags .card-tag.card-tag1{background: #FFF9DE}
    .section3-6 .card-tags .card-tag.card-tag2{background: #EFFFFF}

    .section3-6b{padding: 40px 0px 0px;}


    .user-review-wrap-1{width: 100%; border-top: 1px solid #E6E9ED;
        border-bottom: 1px solid #E6E9ED; padding: 40px 0px;}
    .user-review-wrap-1 .title-wrap{display: block;
        width: 100%; text-align: left;}
    .user-review-wrap-1 .title-wrap:after{content: ""; display: block; clear: both;}
    .user-review-wrap-1 .title-wrap .title{display: block; font-weight: 700; line-height: 28px;
        font-size: 20px; color: #101219; width: calc(100% - 30px); float: left; /*padding: 0px 30px 0px 0px;
background: url(https://cdn.pillyze.io/web/img/arrow-down.webp) right 7px no-repeat; background-size: 20px 11px;*/}


    .user-review-wrap-1 .title-wrap .m-arrow{
        width: 16px; display: block;
        height: 8px;
        float: right;
        background: url(https://cdn.pillyze.io/web/img/m-open.webp) center no-repeat;
        background-size: 16px 8px;
        margin: 8px 0px 0px;
        transition: all 0.5s;
    }

    .user-review-wrap-1.active .title-wrap .m-arrow{
        transform: rotate(180deg);
        background: url(https://cdn.pillyze.io/web/img/m-open.webp) center no-repeat;
        background-size: 16px 8px;
        transition: all 0.5s;
    }


    .user-review-wrap-1.active .title-wrap .title{
        /*background: url(https://cdn.pillyze.io/web/img/arrow-up.webp) right 7px no-repeat; background-size: 20px 11px;*/}
    .user-review-wrap-1 .title-wrap .title span{color: #6C2FF2; }
    .user-review-wrap-1 .review-content{display: none; padding: 30px 40px;
        font-size: 16px; line-height: 24px;}



    .user-review-wrap-1 + .sub-title-big-wrap{margin: 60px 0px 0px}


    .hide-this-review{font-weight: 500; color: #9BA1AA; line-height: 20px; height: 20px;
        font-size: 16px; padding: 0px 0px 0px 32px; margin: 22px 0px 0px;
        background:url(https://cdn.pillyze.io/web/img/icon-hide.webp) left no-repeat; text-align: left;
        background-size: 20px 20px;}
    .section3-7-002 .col1 .img-caution{top: -92px}
    .section3-7-002 .c-card-wrap{height: 271px; padding: 46px 0px 0px 40px;}
    .section3-7-002 .col1 .txt1{float: left; font-weight: 500; display: block;
        font-size: 18px; line-height: 30px; color: #fff; text-align: left; width: 100%}
    .section3-7-002 .col1 .txt2{float: left; font-weight: 700; margin: 1px 0px 0px;
        font-size: 26px; line-height: 35px; color: #fff; text-align: left; display: block;
        width: 100%}
    .section3-7-002 .col1 .txt2 span{color: #ffcd00}
    .section3-7-002 .col1 .txt3{float: left; margin: 16px 0px 0px;
        font-weight: 500; font-size: 14px; line-height: 22px; color: #EAE7FD; display: block;
        text-align: left; width: 100%;}
    .section3-7-002 .app-down-btns{display: block; margin: 20px 0px 0px; float: left;}
    .section3-7-002 .app-down-btns:after{content:""; display:block; clear:both;}

    .section3-7-002 .app-down-btns .btn-app-down-apple{float: left; height: 44px;
        color: #6C2FF2; line-height: 44px; padding: 0px 22px 0px 54px; font-weight: 500;
        background: #F8F8FA url(https://cdn.pillyze.io/web/img/app-apple.webp) 18px no-repeat;
        background-size: 24px 24px; border-radius: 22px;}
    .section3-7-002 .app-down-btns .btn-app-down-google{float: left; height: 44px;
        color: #6C2FF2; line-height: 44px; padding: 0px 22px 0px 54px; font-weight: 500;
        margin: 0px 0px 0px 15px; border-radius: 22px;
        background: #F8F8FA url(https://cdn.pillyze.io/web/img/app-google.webp) 18px no-repeat;
        background-size: 24px 24px;}


    /*홈*/
    .all-wrap-type-home{background: #fff;}
    .section1-2b .content{max-width: 938px; padding: 60px 0px 200px;}
    .section1-2b .txt1{font-weight: 700; font-size: 26px; color: #101219;}
    .section1-2b .txt1 span{color:#6C2FF2;}
    .section1-2b .ingredient-wrap{width: calc(100% + 20px); margin-top: 10px;}
    .section1-2b .ingredient-wrap:after{content:""; display:block; clear:both;}
    .section1-2b .ingredient-wrap .ingredient-one{width: calc(20% - 20px); height: 150px;
        margin: 20px 20px 0px 0px; float: left;
        padding: 0px 27px;
        border-radius: 20px; box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        text-align: center; background: #FFFFFF;
        display: table; border: 1px solid #E6E9ED;}
    .section1-2b .ingredient-wrap .ingredient-one:hover{box-shadow: 0px 2px 20px rgba(70, 56, 147, 0.2);}
    .section1-2b .ingredient-wrap .ingredient-one .txt-fix{    display: table-cell;
        vertical-align: middle;
        height: 150px; font-weight: 500;
        font-size: 18px; line-height: 26px; color: #101219;
        text-align: center;
        width: 100%;}

    .section1-2b .more-pop-ingredient{float: right; font-weight: 500;
        font-size: 16px; line-height: 1;
        text-align: right; margin: 20px 0px 0px;
        text-decoration: underline;
        color: #9BA1AA;}
    .section1-2b .more-pop-ingredient:hover{text-decoration: underline !important;
        color: #9BA1AA;}
    .section1-2b .more-pop-ingredient:link, .section1-2b .more-pop-ingredient:focus{
        text-decoration: underline !important;
        color: #9BA1AA;
    }
    .home-bg-fix{background: #F8F8FA;}
    .section3-6 .spec-rows-wrap .sub-title{/*float: none;*/ float: unset;}


    /*제품상세*/
    .new-wide-wrap .right-wing-mo{display: none;}
    .all-wrap-in-020-002 .section3-4 .info-cards .txt1{overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .all-wrap-in-020-002 .section3-4 .info-cards .txt2{overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .section3-6 .card-wrap{margin: 20px 0px 0px;}
    .bs-select{text-align: left;}

    .section3-6b{padding: 30px 0px 0px;}


    /*토글팝업*/
    .u770{display: none;}


    /*도움말팝업*/
    .modal-help{background: #181E6A !important; width: 500px !important; left: calc(50% - 250px) !important;
        border-radius: 10px !important; text-align: center !important;}
    .modal-help.active{top: 50%; transform: translateY(-50%); padding: 20px 0px;}
    .modal-help .p-btn-close { top: 12px; right: 10px;
        background: url(https://cdn.pillyze.io/web/img/sm-close.webp) center no-repeat;
        background-size: 12px 12px;}
    .modal-help .modal-body{padding: 0px 46px 0px 20px !important}


    .m-txt-1{width: 100%; position: relative; margin-top: 5px;}
    .m-txt-1:after{content: ""; display: block; clear: both;}
    .m-txt-1 .txt{float: right; font-weight: 500; font-size: 16px; line-height: 24px; color: #F4F6FA; text-align: left; width: calc(100% - 14px);}
    .m-txt-1.dot:before{width: 4px; height: 4px; border-radius: 2px; position: absolute;
        top: 10px; left: 0px; content: ""; z-index: 321; background: #fff; display: block;}
    .m-txt-normal {width: 100%; position: relative; margin-top: 5px; text-align: left;}
    .m-txt-normal .txt{font-weight: 500; font-size: 16px; line-height: 24px; color: #F4F6FA; text-align: left; width:100%; text-align: left;}
    .m-txt-info-icon{width: 100%; position: relative; margin-top: 5px;}
    .m-txt-info-icon:after{content: ""; display: block; clear: both;}
    .m-txt-info-icon .txt{float: right; font-weight: 500; font-size: 16px; line-height: 24px; color: #F4F6FA; text-align: left; width: calc(100% - 26px);}
    .m-txt-info-icon:before{width: 15px; height: 15px; position: absolute;
        top: 4px; left: 0px; content: ""; z-index: 321;  display: block;     background: url(https://cdn.pillyze.io/web/img/info3.webp) center no-repeat;
        background-size: 15px 15px;}
    .m-txt:first-child{margin-top: 0px;}




    /*홈 배너 추가 : 리뷰 이벤트 배너*/
    .main-banner2{width:100%; height: 100%; background: #4098FA}
    .main-banner2 .content{position: relative; width:960px; height: 272px; margin:0px auto;
        background: url(https://cdn.pillyze.io/web/img/banner2022julya.webp) calc(50% + 92px) bottom no-repeat; background-size: 502px 270px;}
    .main-banner2 .content:after{content: ""; display: block; clear: both;}
    .main-banner2 .content .col1{float:left; text-align: center; width: 350px; margin: 53px 0px 0px calc(50% - 340px)}
    .main-banner2 .content .col1:after{content: ""; display: block; clear: both;}
    .main-banner2 .content .col1 .banner-5stars{display: block; width: 108px; height: 20px; margin: 0px auto;
        background: url(https://cdn.pillyze.io/web/img/banner-5stars.webp) center no-repeat; background-size: 108px 20px; font-size: 0;}

    .main-banner2 .content .col1 .txt1{font-weight: 700; height: 41px; line-height: 41px;
        background: #0059FF; padding: 0px 10px; display: inline-block; margin: 12px auto 0px;
        font-size: 26px; color: #00FFFF;}
    .main-banner2 .content .col1 .txt2{font-weight: 700; display: block;
        font-size: 36px; color:#fff; text-align: center; line-height: 1; margin: 14px auto 0px;}
    .main-banner2 .content .col1 .txt3{font-weight: 500;
        font-size: 20px; display: block; color:#fff; text-align: center; line-height: 1; margin: 14px auto 0px;}


    /*홈 배너 추가 : 상단에  Q&A 배너*/
    .main-banner-202210-qna{width:100%; height: 100%; background: #8760F4;}
    .main-banner-202210-qna .content{position: relative; width: 100%; max-width:960px; height: 272px;
        margin:0px auto;
        background: url(https://cdn.pillyze.io/web/img/qna_anna_2x.webp) right bottom no-repeat; background-size: 315px 210px;}
    .main-banner-202210-qna .content:after{content: ""; display: block; clear: both;}
    .main-banner-202210-qna .content .col1{float:left; text-align: left; margin: 69px 0px 0px;}
    .main-banner-202210-qna .content .col1:after{content: ""; display: block; clear: both;}
    .main-banner-202210-qna .content .col1 .img1{display: block; width: 60px; height: 24px;
        background: url(https://cdn.pillyze.io/web/img/qna-txt.webp) center no-repeat; width: 60px; height: 24px;
        background-size: 60px 24px; margin: 0px 0px 16px;}

    .main-banner-202210-qna .content .col1 .txt1{font-weight: 500; line-height: 42px;
        text-align: left; display: block;
        font-size: 36px; color: #FFF;}
    .main-banner-202210-qna .content .col1 .txt2{font-weight: 700; display: block; line-height: 42px;
        font-size: 36px; color:#fff; text-align: left; margin: 7px 0px 0px}



    /*메인메뉴 배너*/
    .main-menu-banner-wrap{padding: 10px 40px 60px;}
    .main-menu-banner{display: block; width: 100%; height: 175px; background: #4098FA; border-radius: 20px; position: relative;}
    .main-menu-banner .content{height: 175px; background: url(https://cdn.pillyze.io/web/img/banner2022julyab.webp) calc(50% + 92px) 34px no-repeat;
        background-size: 113px 125px;}
    .main-menu-banner .content .col1{float:left; text-align: left; width: 180px; margin: 40px 0px 0px 20px; position: relative;}
    .main-menu-banner .content .col1 .banner-5stars{display: block; position: absolute; width: 98px; height: 56px; margin: 0px auto;
        background: url(https://cdn.pillyze.io/web/img/banner-5stars2.webp) center no-repeat; background-size: 98px 56px; font-size: 0; left: 0px; top: -65px}

    .main-menu-banner .content .col1 .txt1{font-weight: 700; height: 26px; line-height: 26px;
        background: #0059FF; padding: 0px 10px; display: inline-block; margin: 0px auto;
        font-size: 14px; color: #00FFFF;}
    .main-menu-banner .content .col1 .txt2{font-weight: 700; display: block; line-height: 26px;
        font-size: 18px; color:#fff; text-align: left; margin: 9px auto 0px;}
    .main-menu-banner .content .col1 .txt3{font-weight: 500;
        font-size: 14px; display: block; color:#fff; text-align: left; line-height: 1; margin: 4px auto 0px;}



    /*제품상세*/
    .txt-question-mark.tqm-1{position: absolute; top: -4px; right: 0px; margin: 0px;}
    .txt-question-mark.tqm-2{display: none;}



    /*성분그래프 : 시작*/
    .status-bar-graph-wrap{position: relative; width: 100%; display: block; margin: 47px 0px 65px; float: left;}
    .status-bar-graph{width: 100%; display: block; border-radius: 5px; overflow: hidden; background: #F8F8FA;
        height: 20px; position: relative;}
    .status-bar-graph .minmax-bar{position: absolute; display: block; width: 20px; height: 20px; left: 0px;
        background: rgba(155,161,170, 0.2); z-index: 50;}
    .status-bar-graph .minmax-bar:before{position: absolute; content: ""; display: block; width: 1px; height: 20px;
        top: 0px; left: -1px; border-left: 1px dashed rgba(0,0,0,0.4);}
    .status-bar-graph .minmax-bar:after{position: absolute; content: ""; display: block; width: 1px; height: 20px;
        top: 0px; right: -1px; border-right: 1px dashed rgba(0,0,0,0.4);}
    .status-bar-graph .amount-bar{position: absolute; display: block; width: 20px; height: 20px; left: 0px;
        background: #ba1234; z-index: 40;}
    .status-bar-graph .minmax-bar.right-border-none:after{display: none;}
    .status-bar-graph .amount-bar.status1{background: #FF416D;;}
    .status-bar-graph .amount-bar.status2{background: #8CF8AD;;}
    .status-bar-graph .amount-bar.status3{background: #8FEFEF;;}
    .status-bar-graph .amount-bar.status4{background: #FFEA8D;}
    .status-bar-graph-wrap .label{font-weight: 500; position: absolute;z-index: 50; top: -25px;
        left: 0px; font-size: 14px; color: #787E8B; width: 66px; height: 20px; line-height: 20px; display: block; text-align: center;}
    .status-bar-graph-wrap .rtxt{font-size: 0 !important;}
    .status-bar-graph-wrap .min{position: absolute; bottom: -20px; text-align: right; width: 33px; z-index: 49;
        font-size: 14px; color: #787E8B; height: 20px; line-height: 20px; display: block;}
    .status-bar-graph-wrap .max{position: absolute; bottom: -20px; text-align: left; width: 33px; z-index: 49;
        font-size: 14px; color: #787E8B; height: 20px; line-height: 20px; display: block;}
    /*성분그래프 : 끝*/



    /*기타 정리 : 시작*/
    .ipt-main-wrap-2-0.no-review{right: 140px}
    .section3-4 .filter-btns .filter-btn{display: inline-block; /*display: block; float: left; */
        margin: 0px 10px 10px 0px;
        padding: 0px 15px; background: #FFFFFF; border: 1px solid #E6E9ED;
        border-radius: 24px; line-height: 40px; height: 42px; color: #9BA1AA; font-weight: 500;
        font-size: 18px;}
    .section3-4 .filter-btns .filter-btn.active{font-weight: 500;}
    .section3-6 .filter-btns .filter-btn.active{font-weight: 500;}
    .section3-6 .filter-btns .filter-btn {
        display: inline-block;
        margin: 0px 10px 10px 0px;
        padding: 0px 15px;
        background: #FFFFFF;
        border: 1px solid #E6E9ED;
        border-radius: 24px;
        line-height: 40px;
        height: 42px;
        color: #9BA1AA;
        font-weight: 500;
        font-size: 18px;
    }
    #lab-min.lab-min-center {text-align: center; margin-left: 17px;}
    #lab-min.lab-min-center .txt{text-align: center;}
    .sm-menu-wrap .sm-menu{font-size: 18px;}
    .sm-menu-child-wrap .sm-menu-child{font-size: 16px; margin-top: 16px;}
    .right-wing .r-banner-card .rb-txt1{font-size: 18px; line-height: 28px;}
    .r-fixed-1 .btn-more-product{margin: 20px 0px 0px;}

    .new-wide-main-020-002 .section3-4 .info-cards .card-wrap .info-card-more-info{display: none}

    /*기타 정리 : 끝*/

    /*커스텀 : 시작*/
    .ingredient-search-top .ipt-main-wrap .ipt-main {
        padding-left: 20px;
    }

    .ingredient-search-top .txt1 {
        font-weight: 700;
        font-size: 20px;
        line-height: 1;
        text-align: left;
        display: block;
        color: #101219; /*padding: 0px;*/
    }

    .item-cards .item-card .card-tags {
        margin: 20px 0px 0px;
        max-height: /*70*/80px;
        overflow: hidden;
    }

    .item-cards .item-card .card-tags:after {
        content: "";
        display: block;
        clear: both;
    }

    .item-cards .item-card .card-tags .card-tag {
        display: inline-block;
        float: left;
        margin-right: 10px;
        border: 1px solid #D6D9E0;
        height: 30px;
        line-height: 28px;
        text-align: center;
        padding: 0px 15px;
        border-radius: 15px;
        color: #535968;
        font-weight: 500;
        margin-bottom: 10px;
        max-width: 100%;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
    }

    .bread-crumb .top-nav {
        display: inline;
    }

    .section3-1 .col .mark.mark4{
        background-size: 20px 20px;
        height: 20px;
        line-height: 20px;
        padding-left: 30px;
    }

    .section3-4 .info-cards .txt2 {
        line-height: 1.2;
    }

    .product-result .item-cards .item-card {
        height: 400px;
    }

    .section4-bt .col1 .txt3 {
        width: 100%;
    }

    .nwm-r-col:last-child {
        border-right:none
    }

    .new-wide-main-060 .tab-wrap .tab.active {
        border-bottom: 2px solid #6C2FF2;
    }

    .new-wide-main-070 .sr-banner1 .txt1 {
        font-weight: 500;
    }

    .new-wide-main-070 .sr-banner1 .txt1 span {
        font-weight: 700;
    }

    .section1-1 .swiper-pagination-bullet-active {
        background: #ffffff !important;
    }

    .section1-1 .swiper-pagination-bullet {
        background: #ffffff !important;
    }

    .section3-1 .col .txt2 {
        margin-top: 10px;
    }

    .ingredient-search-top .txt2 {
        line-height: 1.4;
    }

    .section3-7 {
        padding: 110px 0px 60px;
    }

    .section4-bt {
        padding: 110px 0px 60px;
    }

    .section3-1 .col .txt1 {
        text-decoration: underline !important;
        text-underline-position: under;
    }

    /*.section3-6 .filter-btns-in {
        height: 100px;
    }*/

    .related-tag {
        color: #9BA1AA;
        font-weight: 700;
        font-size: 16px;
    }

    .nwm-row.nwm-row9 {
        padding: 40px 0px;
    }

    .section3-4 .info-cards .txt1 {
        background: url(https://cdn.pillyze.io/web/img/caution-more.webp) right no-repeat;
        background-size: 7px 13px;
    }

    .section3-4 .info-cards .card-wrap {
        padding: 20px 30px 30px;
    }

    .nutrient-detail-link {
        color : unset !important;
        padding-right: 20px;
        background: url(https://cdn.pillyze.io/web/img/caution-more.webp) right no-repeat;
        background-size: 9px 16px;
    }

    .p-diagnosis-popup-body {
        padding: 40px 40px;
    }

    /*.modal-wrap.active {
        padding: 20px 0px;
    }*/

    .p-diagnosis-btn-close {
        top: -60px;
        right: -10px;
        background: url(https://cdn.pillyze.io/web/img/modal_close_v2.png) center no-repeat;
        background-size: 30px 30px;
    }

    .right-wing-no-mo {
        max-width: 260px;
    }

    /*배너를 버튼태그로 만들기 위함*/
    .right-wing .r-banner-card {
        display: flex !important;
    }

    .section3-1 .col .review .amount {
        text-decoration: underline;
    }


    /*커스텀 : 끝*/



    /*건강고민 검색*/
    .new-wide-wrap-090 {margin: 40px auto 100px !important;}
    .new-wide-main-090{margin: 0px 0px 0px !important;}
    .section9-1{padding:30px 0px 0px;
        width:calc(100% - 40px); max-width: 1800px;
        margin:0px auto; }
    .s9-banner1{width:100%; height: 100%;
        border-radius: 20px; background: #EAE7FD;;}
    .s9-banner1 .content{position: relative; width:960px; height: 180px;
        margin:0px auto;}
    .s9-banner1 .content:after{content: ""; display: block; clear: both;}
    .s9-banner1 .content .img1{float: left; margin: 35px 0px 0px;
        width: 110px; height: 110px;}
    .s9-banner1 .content .col1{float:left; margin-left: 60px;}
    .s9-banner1 .content .col1:after{content: ""; display: block; clear: both;}
    .s9-banner1 .content .col1 .txt1{font-weight: 700; display: block;
        font-size: 32px; line-height: 1;
        text-align: left; color: #101219; margin:52px 0px 0px;}
    .s9-banner1 .content .col1 .txt2{font-weight: 500; display: block;
        font-size: 20px; line-height:30px;
        text-align: left; color: #535968; margin:11px 0px 0px;}

    /*건강고민 검색 - 선택*/
    .s9-banner1.group1{background: #EAF4FF;}
    .s9-banner1.group2{background: #FFEFF2;}
    .s9-banner1.group3{background: #FFF9DE;}
    .s9-banner1.group4{background: #EAE7FD;}
    .h100-title{font-weight: 700; background: url(https://cdn.pillyze.io/web/img/check-2.webp) left 6px no-repeat;
        background-size: 20px 20px; padding: 0px 18px 0px 30px; color: #101219;
        font-size: 24px; line-height: 32px; min-height: 32px; text-align: left; position: relative;}
    .h100-title a:link span, .h100-title a:visited span{color: #101219;}
    .h100-title a span, .h100-title a span{color: #101219;}
    .h100-title:link, .h100-title:visited{color: #101219;}
    .h100-title .btn-more{width: 24px; height: 32px; position: absolute;
        background: url(https://cdn.pillyze.io/web/img/health-more.webp) right no-repeat;
        background-size: 11px 20px; top: 0px; right: 0px;}
    .h100-row2{width: 100%; display: block; margin: 15px 0px 0px;}
    .h100-row2:after{content: ""; display: block; clear: both;}
    .h100-row2 .tag{height: 30px; background: #FFFFFF; border: 1px solid #D6D9E0;
        color: #535968; padding: 0px 15px; text-align: center; float: left; line-height: 28px;
        border-radius: 15px;}
    .h100-row2 .txt1{height: 30px; line-height: 30px; text-align: left; color: #787E8B;
        font-weight: 500; font-size: 16px; margin: 0px 0px 0px 5px; float: left;}

    .new-wide-main-100 .swiper-container{width: 100%; }
    .new-wide-main-100 .item-cards:after{content:""; display:block; clear:both;}
    .new-wide-main-100 .item-card{width: calc((100% - 40px) / 3); margin: 20px 0px 0px 20px;
        display: block;
        border: 1px solid #E6E9ED; box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 20px; background: #fff; height: 400px; float: left;
        padding: 0px 20px;}
    .new-wide-main-100 .item-card:nth-child(3n - 2){margin: 20px 0px 0px 0px;}
    .new-wide-main-100 .item-card .item-img{width: 130px; height: 130px; display: block;
        margin: 40px auto 0px;}
    .new-wide-main-100 .item-card .txt1{font-weight: 500; display: block;
        font-size: 14px; color: #9BA1AA; text-align: left; margin: 30px 0px 0px}
    .new-wide-main-100 .item-card .txt2{font-weight: 700; color: #101219; display: block;
        font-size: 18px; text-align: left; line-height: 27px; margin: 4px 0px 0px;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .new-wide-main-100 .item-card .txt2 span{color:#6C2FF2;}
    .new-wide-main-100 .item-card .review{margin-top: 10px;}
    .new-wide-main-100 .item-card .review:after{content:""; display:block; clear:both;}
    .new-wide-main-100 .item-card .review .star-point{float: left; font-weight: 700;
        font-size: 17px; color: #535968; text-align: left; line-height: 20px;
        background: url(https://cdn.pillyze.io/web/img/star-icon.webp) left 2px no-repeat;
        background-size: 16px 15px; padding-left: 20px; height:20px; }
    .new-wide-main-100 .item-card .review .txt3{float: left;
        font-weight: 500; line-height: 19px; height: 20px; color: #9BA1AA;
        font-size: 16px; margin: 0px 0px 0px 10px }
    .new-wide-main-100 .item-card .tag-type1-wrap{width: 100%; margin: 20px 0px 0px; overflow: hidden; height: 40px;}
    .new-wide-main-100 .item-card .tag-type1-wrap:after{content:""; display:block; clear:both;}
    .new-wide-main-100 .item-card .tag-type2-wrap{width: 100%; margin: 0px 0px 0px; overflow: hidden; height: 40px;}
    .new-wide-main-100 .item-card .tag-type2-wrap:after{content:""; display:block; clear:both;}
    .new-wide-main-100 .item-card .tag-type1{ color: #535968;
        height: 30px; background: #FFFFFF; border: 1px solid #D6D9E0;
        padding: 0px 15px; text-align: center; float: left; line-height: 28px;
        border-radius: 15px; margin: 0px 10px 10px 0px;
        max-width: 100%;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .new-wide-main-100 .item-card .tag-type2{color: #535968;
        height: 30px; background: #F4F6FA; border: 1px solid #F4F6FA;
        padding: 0px 15px; text-align: center; float: left; line-height: 28px;
        border-radius: 15px; margin: 0px 10px 10px 0px; max-width: 100%;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .new-wide-main-100 .item-more {
        width: 100%;
        display: block;
        text-align: center;
        background: #FFFFFF;
        height: 52px;
        line-height: 50px;
        margin: 20px 0px 0px;
        border: 1px solid #E6E9ED;
        font-size: 18px;
        color: #787E8B;
        box-shadow: 0px 2px 10px rgb(70 56 147 / 10%);
        border-radius: 10px;
    }

    .new-wide-main-100-inside{margin: 0px 0px 100px;}
    .new-wide-main-100-inside:last-child{margin: 0px 0px 40px;}
    .item-cards-mo{display: none;}


    /*건강고민 검색 - 결과*/
    .h110-title{font-weight: 500; /*background: url(https://cdn.pillyze.io/web/img/check-2.webp) left no-repeat;
background-size: 20px 20px; padding: 0px 0px 0px 30px; */color: #101219;
        margin: 8px 0px 20px;
        font-size: 26px; line-height: 34px; min-height: 34px; text-align: left; position: relative;}

    .h110-title .st1{border-bottom: 2px solid #101219; /*text-decoration: underline !important;*/}
    .h110-title .st1:link{color: #101219;}
    .h110-title .st1:visited{color: #6C2FF2;}
    .h110-title .st2{color: #6C2FF2 !important; font-weight: 700;}
    .r-fixed-1-03-110 .txt1{margin: 79px 0px 0px}
    .r-fixed-1-03-110 .item-card{background: #FFFFFF;
        border: 1px solid #E6E9ED; padding: 20px 20px 0px !important; display: block;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 20px; margin: 20px 0px 0px;}
    .r-fixed-1-03-110 .item-card:first-child{margin: 0px;}
    .r-fixed-1-03-110 .item-card .txt2{font-size: 18px; line-height: 26px;
        white-space: normal;}
    .r-fixed-1-03-110 .item-card .txt3{font-weight: 500; color: #9BA1AA;
        font-size: 14px; line-height: 22px; text-align: left;}
    .r-fixed-1-03-110 .item-card .dot-txt{font-weight: 500; color: #101219;
        padding: 0px 0px 0px 16px; margin: 7px 0px 0px;
        font-size: 14px; line-height: 22px; text-align: left; position: relative;}
    .r-fixed-1-03-110 .item-card .dot-txt span{font-weight: 700; color: #6C2FF2;}
    .r-fixed-1-03-110 .item-card .dot-txt:before{content: ""; position: absolute;
        width: 4px; height: 4px; border-radius: 2px; display: block;
        top: 9px; left: 5px; background: #101219;}
    .r-fixed-1-03-110 .item-card .h-line{width: 100%; height: 1px; background: #E6E9ED;
        margin: 0px 0px 20px;}
    .r-fixed-1-03-110 .item-card .txt3wrap{padding: 0px 0px 20px}
    .r-fixed-1.r-fixed-1-03-110 .item-cards {
        width: 100%;
        display: block;
        background: none;
        padding: 0px;
        text-align: left;
        margin: 13px 0px 0px;
        border: none;
        border-radius: 0px;
    }

    .r-fixed-1.r-fixed-1-03-110 .item-card .txt2x {
        font-weight: 700;
        color: #101219;
        display: block;
        font-size: 16px;
        text-align: left;
        line-height: 24px;
        margin: 0px 0px 0px;;
    }
    .item-cards .item-card .card-tags.card-tags-type2
    {margin: 13px 0px 9px;}
    .item-cards .item-card .card-tags .card-tag-type2
    {
        display: inline-block;
        float: left;
        margin-right: 10px;
        background: #F4F6FA;
        border: 1px solid #F4F6FA;
        height: 30px;
        line-height: 28px;
        text-align: center;
        padding: 0px 15px;
        border-radius: 15px;
        color: #535968;
        font-weight: 500;
        margin-bottom: 10px;
        max-width: 100%;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
    }
    .new-wide-main-110-inside .item-more {
        width: 100%; /*float: left;*/
        display: block;
        text-align: center;
        background: #FFFFFF;
        height: 52px;
        line-height: 50px;
        margin: 20px 0px 0px;
        border: 1px solid #E6E9ED;
        font-size: 18px;
        color: #787E8B;
        box-shadow: 0px 2px 10px rgb(70 56 147 / 10%);
        border-radius: 10px;
    }



    /*120 - 제품/브랜드 검색 : 시작*/
    .section12-1 {margin: 20px 0px 0px;}
    .section12-1 .swiper-container{width: calc(100% + 20px); padding: 0px 10px;
        transform: translateX(-10px);}

    .new-wide-main-120 .title-txt1{font-weight: 500; font-size: 24px; line-height: 1;
        text-align: left; color: #101219; margin: 12px 0px 0px;}
    .new-wide-main-120 .title-txt1 span{font-weight: 700; color: #6C2FF2;}
    .new-wide-main-120 .title-txt2{margin: 140px 0px 0px}
    .new-wide-main-120 .item-card-t120s:after{content:""; display:block; clear:both;}
    .new-wide-main-120 .item-card-t120{width: 100%; margin: 20px 0px;
        display: block;
        border: 1px solid #E6E9ED; box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 20px; background: #fff; /*height: 289px; */float: left;
        padding: 20px 20px 18px;}
    .new-wide-main-120 .item-card-t120 .item-img{width: 130px; height: 130px; display: block;
        margin: 0px auto;}



    .new-wide-main-120 .item-card-t120 .btn-goto-login{display: block; width: 100%; height: 25px;
        border-radius: 13px; background: #fee500; text-align: center; display: block;
        margin: 0px 0px 5px;}

    .new-wide-main-120 .section12-1b .item-card-t120 .btn-goto-login{display: inline-block; width: auto; height: 25px;
        border-radius: 13px; background: #fee500; text-align: center; float: left;
        margin: 0px 5px 5px 0px; padding: 0px 10px;}

    .new-wide-main-120 .section12-1c .item-card-t120 .btn-goto-login{display: inline-block; width: auto; height: 25px;
        border-radius: 13px; background: #fee500; text-align: center; float: left;
        margin: 0px 5px 5px 0px; padding: 0px 10px;}

    .new-wide-main-120 .section12-1b .item-card-t120 .btn-goto-login + .txt3,
    .new-wide-main-120 .section12-1c .item-card-t120 .btn-goto-login + .txt3
    {margin: 3px 0px 10px; width: 88px; height: 22px; line-height: 20px;}

    .new-wide-main-120 .item-card-t120 .btn-goto-login span{ font-weight: 500;
        background: url(https://cdn.pillyze.io/web/img/kakao-login-14.webp) left 5px no-repeat; display: inline-block;
        background-size: 14px 14px; font-size: 12px; color: #101219; padding: 0px 0px 0px 19px;
        text-align: left; height: 25px;  line-height: 26px;}
    .new-wide-main-120 .item-card-t120 .txt1{font-weight: 500; display: block;
        font-size: 14px; color: #9BA1AA; text-align: left; margin: 20px 0px 0px}
    .new-wide-main-120 .item-card-t120 .txt2{font-weight: 700; color: #101219; display: block;
        font-size: 16px; text-align: left; line-height: 24px; margin: 5px 0px 0px;
        overflow: hidden; height: 48px;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;}


    .new-wide-main-120 .item-card-t120 .txt2 span{color:#6C2FF2;}
    .new-wide-main-120 .item-card-t120 .review{margin-top: 10px;}
    .new-wide-main-120 .item-card-t120 .review:after{content:""; display:block; clear:both;}
    .new-wide-main-120 .item-card-t120 .review .star-point{float: left; font-weight: 700;
        font-size: 17px; color: #535968; text-align: left; line-height: 20px;
        background: url(https://cdn.pillyze.io/web/img/star-icon.webp) left 2px no-repeat;
        background-size: 16px 15px; padding-left: 20px; height:20px;
        margin: 0px 10px 0px 0px /*2022-09-09 중요*/}
    .new-wide-main-120 .item-card-t120 .review .txt3{float: left;
        font-weight: 500; line-height: 20px; height: 20px; color: #9BA1AA;
        font-size: 14px; /*margin: 0px 0px 0px 10px*/ }
    .new-wide-main-120 .item-card-t120 .tag-type1-wrap{width: 100%; margin: 20px 0px 0px;}
    .new-wide-main-120 .item-card-t120 .tag-type1-wrap:after{content:""; display:block; clear:both;}
    .new-wide-main-120 .item-card-t120 .tag-type2-wrap{width: 100%; margin: 0px 0px 0px;}
    .new-wide-main-120 .item-card-t120 .tag-type2-wrap:after{content:""; display:block; clear:both;}
    .new-wide-main-120 .item-card-t120 .tag-type1{ color: #535968;
        height: 30px; background: #FFFFFF; border: 1px solid #D6D9E0;
        padding: 0px 15px; text-align: center; float: left; line-height: 28px;
        border-radius: 15px; margin: 0px 10px 10px 0px}
    .new-wide-main-120 .item-card-t120 .tag-type2{color: #535968;
        height: 30px; background: #F4F6FA; border: 1px solid #F4F6FA;
        padding: 0px 15px; text-align: center; float: left; line-height: 28px;
        border-radius: 15px; margin: 0px 10px 10px 0px}
    .new-wide-main-120 .item-more {
        width: 100%;
        display: block;
        text-align: center;
        background: #FFFFFF;
        height: 52px;
        line-height: 50px;
        margin: 20px 0px 0px;
        border: 1px solid #E6E9ED;
        font-size: 18px;
        color: #787E8B;
        box-shadow: 0px 2px 10px rgb(70 56 147 / 10%);
        border-radius: 10px;
    }

    .new-wide-main-120 .item-card-t120 .tag-type3-wrap{width: 100%; margin: 0px 0px 0px;
        overflow: hidden; height: 40px;}
    .new-wide-main-120 .item-card-t120 .tag-type3-wrap:after{content:""; display:block; clear:both;}
    .new-wide-main-120 .item-card-t120 .tag-type3{color: #101219;
        height: 30px; background: #EFFFFF; border: 1px solid #EFFFFF; font-weight: 500;
        padding: 0px 15px; text-align: center; float: left; line-height: 28px;
        border-radius: 15px; margin: 0px 10px 10px 0px; max-width: 100%;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap; margin: 10px 10px 0px 0px;}
    .new-wide-main-120 .item-card-t120 .tag-type3 span{font-weight: 700;}


    .popular-brands{width: calc(100% + 20px); padding: 40px 0px 60px}
    .popular-brands:after{content:""; display:block; clear:both;}
    .popular-brand{float: left; width: calc(20% - 20px); margin: 0px 20px 30px 0px;
        display: block;}
    .popular-brands-b{display: none;}
    .popular-brand .brand-img{width: 100%; display: block; background: #fff;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);}
    .popular-brand .brand-img img{width: 100%; height: auto; margin-top: 50%;
        transform: translateY(-50%);}
    .popular-brand:hover .brand-img{box-shadow: 0px 2px 20px rgba(70, 56, 147, 0.2);}
    .popular-brand .brand-cont{width: 100%; height: 100px; margin: 20px 0px 0px}
    .popular-brand .brand-cont .txt1{width: 100%; text-align: center; font-weight: 700;
        font-size: 16px; color: #101219;
        overflow: hidden; max-height: 48px;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;}
    .popular-brand .brand-cont .txt2{width: 100%; text-align: center; font-weight: 500;
        font-size: 14px; color: #787E8B; line-height: 20px; margin: 9px 0px 0px;
        height: 20px;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .popular-brand .brand-cont .txt3{width: 100%; text-align: center; font-weight: 500;
        font-size: 14px; color: #787E8B; line-height: 20px; height: 20px;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .section12-1 .swiper-button-prev {
        background: #fff url(https://cdn.pillyze.io/web/img/h120-sw-p.webp) center no-repeat;
        background-size: 20px 20px; width: 40px; height: 40px; z-index: 40;
        border-radius: 20px; border: 1px solid #E6E9ED; left: -20px;
        filter: drop-shadow(3px 3px 6px rgba(70, 56, 147, 0.1))
    }
    .section12-1 .swiper-button-next {
        background: #fff url(https://cdn.pillyze.io/web/img/h120-sw-n.webp) center no-repeat;
        background-size: 20px 20px; width: 40px; height: 40px; z-index: 40;
        border-radius: 20px; border: 1px solid #E6E9ED; right: -20px;
        filter: drop-shadow(3px 3px 6px rgba(70, 56, 147, 0.1))
    }
    /*120 - 제품/브랜드 검색 : 끝*/


    /*130 - 필라이즈 칼럼 : 시작*/
    .column-top {text-align: center;}
    .column-top .content {padding: 0px;}

    .column-top .p-c-banner{width: 100%; height: 302px;}
    .column-top .p-c-banner .p-c-content{width: 100%;}
    .column-top .p-c-banner1{background: rgba(0,0,0,0.5);}
    .column-top .p-c-banner1 .txt1{height: 45px; line-height: 45px; padding: 0px 20px;
        text-align: center; background: #fff; border-radius: 23px; margin: 80px auto 0px;
        font-weight: 700; color: #787E8B; font-size: 18px; display: inline-block;}
    .column-top .p-c-banner1 .txt2{width: 100%; font-weight: 700; font-size: 24px; line-height: 32px;
        color: #fff; display: block; text-align: center; margin: 28px auto 0px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;}
    .column-top .p-c-banner2{width: 100%; height: 302px; background: rgba(0,0,0,0.5);}
    .column-top .swiper-pagination-bullet {
        background: rgba(255, 255, 255, 0.5) !important;
        width: 10px !important;
        height: 10px !important;
    }
    .column-top .swiper-container-horizontal>.swiper-pagination-bullets{bottom: 30px}
    .column-top .swiper-pagination-bullet-active{background: #fff !important;}
    .h130-title-txt1{font-weight: 500; text-align: left;
        font-size: 30px; line-height: 38px; color: #101219}
    .h130-title-txt1 span{color: #6C2FF2; font-weight: 700;}
    .tip-list-wrap{display: block; width: calc(100% + 20px); margin: 60px 0px;}
    .tip-list-wrap:after{content: ""; display: block; clear: both;}
    .tip-list-wrap .tip-list{width: calc(50% - 20px); margin: 0px 20px 20px 0px; float: left;}
    .tip-list-wrap .tip-list .img1wrap{display: block; width: 100%; line-height: 0;}
    .tip-list-wrap .tip-list .img1wrap .img1{display: block; width: 100%; border-radius: 20px;}
    .tip-list-wrap .tip-list .img1wrap .img1x{display: block; width: 100%; border-radius: 20px;}
    .tip-list-wrap .tip-list .tag-wrap{display: block; width: 100%; margin: 20px 0px 0px;}
    .tip-list-wrap .tip-list .tag-wrap:after{content: ""; display: block; clear: both;}
    .tip-list-wrap .tip-list .tag{color: #535968;
        height: 30px; font-size: 16px; font-weight: 500;
        background: #FFFFFF;
        border: 1px solid #D6D9E0;
        padding: 0px 15px;
        text-align: center;
        float: left;
        line-height: 28px;
        border-radius: 15px;
        margin: 0px 10px 10px 0px;}
    .tip-list-wrap .tip-list .title{font-weight: 700; margin: 13px 0px 0px;
        font-size: 22px; text-align: left; color: #101219; line-height: 30px;
        overflow: hidden; height: 60px;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;}
    .tip-list-wrap .tip-list .title:link,
    .tip-list-wrap .tip-list .title:visited{color: #101219}
    .tip-list-wrap .tip-list .content{font-weight: 500; margin: 18px 0px 0px;
        font-size: 16px; line-height: 24px; text-align: left; color: #9BA1AA;
        overflow: hidden; height: 48px;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;}
    .tip-list-wrap .tip-list .date{color: #C4C8CE; font-weight: 500; font-size: 16px;
        text-align: left; line-height: 1; margin: 10px 0px 0px;}
    .new-wide-wrap-130 #pagination-container{margin: 60px 0px 0px;}
    /*130 - 필라이즈 칼럼 : 끝*/

    /*건강고민 검색*/
    .from-right-wing{display: none;}
    .fr-line1{display: none;}
    .new-wide-main-120 .section12-1b{display: none;}
    .new-wide-main-120 .section12-1c{display: none;}


    /*건강검진 상세*/
    .section15-1{width: 100%; height: 300px; background: #F4F2FF;}
    .section15-1 .content{width: 100%; max-width: 1120px; margin: 0px auto; height: 300px;  text-align: center; position: relative;
        padding: 38px 0px 0px;}
    .section15-1 .banner-wrap .banner-txt1{font-size: 34px; line-height: 42px; font-weight: 800; color: #101219; text-align: center;}
    .section15-1 .banner-wrap .banner-txt2{font-size: 34px; line-height: 42px; font-weight: 800; color: #101219;
        text-align: center; margin: 4px 0px 0px;}
    .section15-1 .banner-wrap .banner-txt2 span{
        background: linear-gradient(360deg, #6C2FF2 0%, #A084FF 85.29%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        text-fill-color: transparent;
    }
    .section15-1 .banner-wrap .banner-txt3{color: #535968; font-size: 16px;
        font-weight: 500;
        line-height: 24px; text-align: center; margin: 6px 0px 0px; display: block;}
    .section15-1 .banner-wrap .banner-bg1 {
        position: absolute;
        width: 550px;
        height: 274px;
        left: calc(50% - 275px);
        z-index: 40;
        bottom: -46px;
    }
    .section15-1 .banner-wrap .banner-bg2{display: none;}

    .section15-2{width: 100%; background: #fff;}
    .section15-2 .content{width: 100%; max-width: 1080px; margin: 0px auto; height: 980px; position: relative;}
    .section15-2 .content .txt-wrap{position: absolute; top: 220px; left: 60px; z-index: 10;}
    .section15-2 .content .txt-wrap .txt1{font-weight: 500; font-size: 20px; color: #787E8B; text-align: left; line-height: 1;}
    .section15-2 .content .txt-wrap .txt2{font-weight: 700; font-size: 36px; line-height: 44px; color: #101219; text-align: left;
        margin: 20px 0px 0px;}
    .section15-2 .content .txt-wrap .txt2 span{color: #6C2FF2;}
    .section15-2 .content .img1{position: absolute; top: 636px; left: 0px; z-index: 10; width: 200px; height: 119px;}
    .section15-2 .content .img2{position: absolute; top: 636px; left: 192px; z-index: 10; width: 200px; height: 119px;}
    .section15-2 .content .img3{position: absolute; top: 636px; right: 192px; z-index: 10; width: 200px; height: 119px;}
    .section15-2 .content .img4{position: absolute; top: 636px; right: 0px; z-index: 10; width: 200px; height: 119px;}
    .section15-2 .content .img5{position: absolute; top: 100px; left: calc(50% - 250px); z-index: 11; width: 500px; height: 780px;}


    .section15-3{width: 100%; background: #F8F8FA;}
    .section15-3 .content{width: 100%; max-width: 1080px; margin: 0px auto; height: 900px; position: relative;}
    .section15-3 .content .txt-wrap{position: absolute; top: 152px; left: 60px; z-index: 10;}
    .section15-3 .content .txt-wrap .txt1{font-weight: 500; font-size: 20px; color: #787E8B; text-align: left; line-height: 1;}
    .section15-3 .content .txt-wrap .txt2{font-weight: 700; font-size: 36px; line-height: 44px; color: #101219; text-align: left;
        margin: 20px 0px 0px;}
    .section15-3 .content .txt-wrap .txt2 span{color: #6C2FF2;}
    .section15-3 .content .img1{position: absolute; top: 389px; left: 30px; z-index: 10; width:339px; height:398px;}
    .section15-3 .content .img2{position: absolute; top: 60px; right : -30px; z-index: 10; width: 500px; height: 780px;}


    .section15-4{width: 100%; background: #fff;}
    .section15-4 .content{width: 100%; max-width: 1080px; margin: 0px auto; height: 900px; position: relative;}
    .section15-4 .content .txt-wrap{position: absolute; top: 152px; left: 60px; z-index: 10;}
    .section15-4 .content .txt-wrap .txt1{font-weight: 500; font-size: 20px; color: #787E8B; text-align: left; line-height: 1;}
    .section15-4 .content .txt-wrap .txt2{font-weight: 700; font-size: 36px; line-height: 44px; color: #101219; text-align: left;
        margin: 20px 0px 0px;}
    .section15-4 .content .txt-wrap .txt2 span{color: #6C2FF2;}
    .section15-4 .content .goto-checkup-wrap{position: absolute; top: 430px; left: 60px; z-index: 10;
        width: 335px; height: 298px; background: #FFEFF2; border-radius: 15px; padding: 36px 0px 0px 20px;
        filter: drop-shadow(-10px 16px 16px rgba(57, 71, 106, 0.3));}
    .section15-4 .content .goto-checkup-wrap .txt1{text-align: left; font-weight: 700; font-size: 22px;
        line-height: 30px; color: #101219; margin: 0px 0px 17px; width: 100%;}
    .section15-4 .content .goto-checkup-wrap .txt2{text-align: left; font-weight: 700; font-size: 16px;
        line-height: 1; color: #101219; padding: 0px 0px 0px 16px; position: relative; margin: 0px 0px 8px; width: 100%;}
    .section15-4 .content .goto-checkup-wrap .txt2:before{position: absolute; content: ""; display: block; width: 6px; height: 6px;
        border-radius: 3px; background: #101219; top: 4px; left: 0px;}
    .section15-4 .content .goto-checkup{display: block; width: 190px; height: 52px; line-height: 52px; color: #fff !important;
        background: #FF416D; border-radius: 10px; text-align: center; font-weight: 500;
        font-size: 16px; color: #fff; margin: 30px auto; transform: translateX(-10px);}

    .section15-4 .content .img1{position: absolute; top: -23px; left: 20px; z-index: 11; width:45px; height:45px;}
    .section15-4 .content .img2{position: absolute; top: 60px; right : -30px; z-index: 10; width: 500px; height: 780px;}


    .section15-5{width: 100%; background: #F8F8FA;}
    .section15-5 .content{width: 100%; max-width: 1080px; margin: 0px auto; height:1110px; position: relative;}
    .section15-5 .content .txt-wrap{position: absolute; top: 152px; left: 60px; z-index: 10;}
    .section15-5 .content .txt-wrap .txt1{font-weight: 500; font-size: 20px; color: #787E8B; text-align: left; line-height: 1;}
    .section15-5 .content .txt-wrap .txt2{font-weight: 700; font-size: 36px; line-height: 44px; color: #101219; text-align: left;
        margin: 20px 0px 0px;}
    .section15-5 .content .txt-wrap .txt2 span{color: #6C2FF2;}
    .section15-5 .content .img1{position: absolute; top: 60px; right : -30px; z-index: 10; width: 500px; height: 780px;}
    .section15-5 .content .btn-app-down-150{display: block; width:calc(100% - 120px); background: #6C2FF2; font-weight: 700;
        font-size: 24px; border-radius: 15px; color: #fff; text-align: center; height: 70px; line-height: 70px;
        left: 60px; bottom: 80px; position: absolute; z-index: 10;}

    .section15-5 .content .btn-app-down-150-s{
        display: block; width:346px; left:calc(50% - 173px); color: #6C2FF2;
        background: #EAE7FD; font-weight: 500; bottom: 180px;
        font-size: 24px; line-height: 50px; line-height: 50px;
        border-radius: 20px;text-align: center; position: absolute; z-index: 10;}
    .section15-5 .content .btn-app-down-150-s span{font-weight: 700}
    .section15-5 .content .btn-app-down-150-s:link,
    .section15-5 .content .btn-app-down-150-s:visited{font-weight: 700;}
    .section15-5 .content .btn-app-down-150-s:after{content: ""; display: block;
        position: absolute; width: 0; bottom: -30px; left: calc(50% - 16px) ; z-index: 18;
        height: 0;
        border-bottom: 16px solid transparent;
        border-top: 16px solid #EAE7FD;
        border-left: 16px solid transparent;
        border-right: 16px solid transparent;}









    /*140칼럼상세 기타*/
    .bg-140{background: #fff;}
    .section14-1{width: 100%; height: 360px; overflow: hidden; text-align: center;}
    .section14-1 img{width: 100%; height: auto;}
    .new-wide-wrap .new-wide-main-140{margin: 0px auto; float: none; padding: 20px 0px 0px;}

    .col-convert .page-title{display: block !important; width: 100%; height: auto;
        overflow: auto; font-weight: 700; font-size: 40px; line-height: 48px; color: #101219;}
    .col-convert .properties .property-row{margin: 20px 0px 0px; display: block;
        width: 100%; max-height: 80px; overflow: hidden;}
    .col-convert .properties .property-row:after{content: ""; display: block; clear: both;}
    .col-convert .properties .property-row th{display: none;}
    .col-convert .properties .property-row td{display: inline-block;
        float: left;
        margin-right: 10px;
        border: 1px solid #D6D9E0;
        height: 30px;
        line-height: 28px;
        text-align: center;
        padding: 0px 15px;
        border-radius: 15px;
        color: #535968;
        font-weight: 500;
        margin-bottom: 10px;
        max-width: 100%;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;}
    .col-convert .page-body hr{background: #E6E9ED; width: 100%; height: 1px; display: block;
        margin: 50px 0px 60px; border: none;}
    .col-convert hr{background: #E6E9ED; width: 100%; height: 1px; display: block;
        margin: 0px 0px 0px; border: none;}
    .col-convert .page-body{color: #101219;}
    .col-convert .page-body h2{font-size: 32px; text-align: left; line-height: 32px;
        font-weight: 700; margin: 0px 0px 36px 0px}
    .col-convert .page-body h3{font-size: 28px; text-align: left; line-height: 32px;
        font-weight: 700; margin: 40px 0px 20px 0px}
    .col-convert .page-body h3.h3-dot{position: relative; padding: 0px 0px 0px 42px;}
    .col-convert .page-body h3.h3-dot:before{position: absolute;
        content: "";
        display: block;
        width: 8px;
        height: 8px;
        border-radius: 4px;
        background: #101219;
        top: 12px;
        left: 14px;}
    .col-convert .page-body h5{font-size: 24px; text-align: left; line-height: 32px;
        font-weight: 700; width: 100%; margin: 0px 0px 40px;}

    .col-convert .page-body p{font-size: 18px; text-align: left; line-height: 26px;
        white-space: pre-wrap;}
    .col-convert .page-body p a{    color: #6C2FF2; text-decoration: underline;}
    .col-convert .page-body p a:link,
    .col-convert .page-body p a:visited{color: #6C2FF2;}

    .col-convert .page-body figure.block-color-gray_background
    {height: 139px; background: #F8F8FA; width: 100%;
        border-radius: 20px; display: flex;
        flex-direction: row; text-align: center;
        justify-content: center; font-size: 16px; line-height: 24px;
        align-items: center;
        padding: 30px 0px;
        gap: 10px; margin: 40px auto 100px;}
    .col-convert .page-body figure .icon{display: none;}
    figure{
        margin-block-start: 0px;
        margin-block-end: 0px;
        margin-inline-start: 0px;
        margin-inline-end:0px
    }
    .col-convert .page-body figure.block-color-gray_background strong:first-child
    {font-size: 18px; line-height: 26px; padding: 0px 0px 8px 0px; display: inline-block;}

    .col-convert .page-body figure.block-color-gray_background .highlight-red
    {background: none !important;}
    .col-convert .page-body .table_of_contents{margin: 30px 0px 0px;}
    .col-convert .page-body .table_of_contents-item .table_of_contents-link
    {font-size: 20px; font-weight: 500; line-height: 28px; color: #535968;
        border-bottom: 1px solid #D6D9E0;}
    .col-convert .page-body .table_of_contents-item .table_of_contents-link:link,
    .col-convert .page-body .table_of_contents-item .table_of_contents-link:visited{color: #535968;}
    .col-convert .page-body .table_of_contents-item .table_of_contents-link:hover{color: #6C2FF2;
        font-weight: 500;}
    .col-convert .page-body .table_of_contents-item{margin: 15px 0px 0px}
    .col-convert .page-body .table_of_contents-item:first-child{margin: 0px;}
    .col-convert .page-body figure.image figcaption{width: 100%; font-weight: 500;
        font-size: 16px; line-height: 1; margin: 10px auto 40px; text-align: center;
        color: #9BA1AA;}
    .col-convert .page-body figure.image img{width: 100%; height: auto; margin: 40px 0px 0px;}
    .col-convert .page-body ol.numbered-list{margin: 0px 0px 30px; font-size: 18px;
        font-weight: 500;}
    .col-convert .page-body ol.numbered-list h4{color: #101219; font-weight: 700;
        font-size: 18px; line-height: 26px; width: 100%; margin: 0px 0px 10px;}

    .col-convert .page-body blockquote {
        display: block;
        margin-block-start: 0px;
        margin-block-end: 0px;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
    }
    .col-convert .page-body blockquote a{color: #6C2FF2; text-decoration: underline;
        font-weight: 500; line-height: 26px; font-size: 18px;}
    .col-convert .page-body blockquote a:link,
    .col-convert .page-body blockquote a:visited{color: #6C2FF2;}


    .col-convert .page-body .block-color-gray{color: #9BA1AA;}
    .col-convert .page-body .bulleted-list li{list-style: none !important;
        font-weight: 500; line-height: 26px; color: #101219; font-size: 18px; margin: 0px 0px 10px;
        position: relative; padding: 0px 0px 0px 20px}
    .col-convert .page-body .bulleted-list li:before{position: absolute; content: ""; display: block;
        width: 6px; height: 6px; border-radius: 3px; background: #101219;
        top: 10px; left: 5px;}
    .col-convert .page-body .col-title-wrap{display: block; width: 100%; margin: 60px 0px 20px}
    .col-convert .page-body .col-title-wrap:after{content: ""; display: block; clear: both;}
    .col-convert .page-body .col-title-wrap .title-txt1{float: left;
        font-weight: 500; font-size: 22px; line-height: 30px; text-align: left;}
    .col-convert .page-body .col-title-wrap .title-txt1 span{color: #6C2FF2; font-weight: 700;}
    .col-convert .page-body .col-title-wrap .btn-more-product-col{float: right;
        font-weight: 500; color: #9BA1AA; background: url(https://cdn.pillyze.io/web/img/col-more.webp) right no-repeat;
        background-size: 9px 17px; padding: 0px 15px 0px 0px;
        font-size: 18px; text-align: right;}
    .col-convert .page-body .col-title-wrap .btn-more-product-col:link,
    .col-convert .page-body .col-title-wrap .btn-more-product-col:visited
    {color: #9BA1AA;}
    .col-convert .page-body .col-card-wrap{width: calc(100% + 20px); display: block;
        padding: 0px 0px 30px;}
    .col-convert .page-body .col-card-wrap:after{content: ""; display: block; clear: both;}

    .col-convert .page-body .item-card-t120s:after{content:""; display:block; clear:both;}
    .col-convert .page-body .item-card-t120{width: calc(20% - 20px);
        display: block; float: left; margin: 0px 20px 0px 0px;
        border: 1px solid #E6E9ED; box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 20px; background: #fff; height: 289px; float: left;
        padding: 20px 20px;}
    .col-convert .page-body .item-card-t120 .item-img{width: 130px; height: 130px; display: block;
        margin: 0px auto;}
    .col-convert .page-body .item-card-t120 .txt1{font-weight: 500; display: block;
        font-size: 14px; color: #9BA1AA; text-align: left; margin: 20px 0px 0px}
    .col-convert .page-body .item-card-t120 .txt2{font-weight: 700; color: #101219; display: block;
        font-size: 16px; text-align: left; line-height: 24px; margin: 5px 0px 0px;
        overflow: hidden; height: 48px;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }
    .col-convert .page-body .item-card-t120 .txt2 span{color:#6C2FF2;}
    .col-convert .page-body .item-card-t120 .review{margin-top: 10px;}
    .col-convert .page-body .item-card-t120 .review:after{content:""; display:block; clear:both;}
    .col-convert .page-body .item-card-t120 .review .star-point{float: left; font-weight: 700;
        font-size: 17px; color: #535968; text-align: left; line-height: 20px;
        background: url(https://cdn.pillyze.io/web/img/star-icon.webp) left 2px no-repeat;
        background-size: 16px 15px; padding-left: 20px; height:20px; }
    .col-convert .page-body .item-card-t120 .review .txt3{float: left;
        font-weight: 500; line-height: 19px; height: 20px; color: #9BA1AA;
        font-size: 16px; margin: 0px 0px 0px 10px }
    .col-convert .page-body .item-card-t120 .tag-type1-wrap{width: 100%; margin: 20px 0px 0px;}
    .col-convert .page-body .item-card-t120 .tag-type1-wrap:after{content:""; display:block; clear:both;}
    .col-convert .page-body .item-card-t120 .tag-type1{ color: #535968;
        height: 30px; background: #FFFFFF; border: 1px solid #D6D9E0;
        padding: 0px 15px; text-align: center; float: left; line-height: 28px;
        border-radius: 15px; margin: 0px 10px 10px 0px}
    .col-review-wrap{width: calc(100% + 20px);}
    .col-review-wrap:after{content:""; display:block; clear:both;}
    .col-review-wrap .review-one{float: left; width: calc((100% - 60px) / 3); margin:0px 20px 0px 0px;
        background: #FFFFFF; box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 20px; padding: 30px;}
    .col-review-wrap .swiper-slide{padding: 10px;}
    .col-review-wrap .review-info-row1e{position: relative; display: block; width: 100%;}
    .col-review-wrap .review-info-row1e:after{content:""; display:block; clear:both;}
    .col-review-wrap .review-info-row2e{position: relative; display: block; width: 100%; margin: 20px 0px 0px;}
    .col-review-wrap .review-info-row2e:after{content:""; display:block; clear:both;}
    .col-review-wrap .star-point-small-bg{width: 82px; height: 13px;
        background: url(https://cdn.pillyze.io/web/img/stars1-bg2.webp) left no-repeat; background-size: 82px 13px;
        top:0px; left:0px; position: absolute; z-index: 60}
    .col-review-wrap .star-point-small{width: 82px; height: 13px;
        background: url(https://cdn.pillyze.io/web/img/stars1-cv.webp) left no-repeat; background-size: 82px 13px;}
    .col-review-wrap .user-name{font-weight: 500; font-size: 14px; line-height: 1;
        color: #9BA1AA; text-align: left; float: left;}
    .col-review-wrap .review-info-row2e .img1wrap{float: left; width: 55px; border-left: 4px solid #E6E9ED;
        padding: 0px 0px 0px 3px; height: 48px; position: relative;}
    /*.col-review-wrap .review-info-row2e .img1wrap:before{content: ""; display: block; z-index: 40;
width: 48px; height: 48px; top: 0px; right: 0px; background: #FF416D; opacity: 0.2; position: absolute;}*/
    .col-review-wrap .review-info-row2e .img1wrap .img1{width: 48px; height: 48px;}
    .col-review-wrap .review-info-row2e .right{float: right; width: calc(100% - 59px);  height: 48px;}
    .col-review-wrap .review-info-row2e .right .s-txt1{font-size: 14px; font-weight: 500; color: #9BA1AA;
        line-height: 1; text-align: left; margin: 6px 0px 0px; overflow:hidden; text-overflow: ellipsis; white-space: nowrap;}
    .col-review-wrap .review-info-row2e .right .s-txt2{font-size: 14px; font-weight: 700; color: #101219;
        line-height: 1; text-align: left; margin: 6px 0px 0px; overflow:hidden; text-overflow: ellipsis; white-space: nowrap;}
    .col-review-wrap .review-title1{font-weight: 700; color: #8760F4; font-size: 20px; text-align: left;
        line-height: 1; margin: 20px 0px 0px;}
    .col-review-wrap .review-title2{margin: 30px 0px 0px;}
    .col-review-wrap .review-content{width: 100%; text-align: left; font-weight: 500;
        font-size: 16px; line-height: 24px; color: #101219; margin: 20px 0px 0px;
        height: 120px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 5;
        -webkit-box-orient: vertical;}
    .col-review-wrap .btn-r-write-review{ background: #6C2FF2; font-weight: 700;
        font-size: 24px; color: #fff; line-height: 70px; margin: 0px 0px 0px;
        border-radius: 15px; text-align: center; height: 70px; display: block;}

    .col-review-wrap .card-tags {
        margin: 20px 0px 0px;
        max-height: /*70*//*80*/40px;
        overflow: hidden;
    }

    .col-review-wrap .card-tags:after {
        content: "";
        display: block;
        clear: both;
    }

    .col-review-wrap .card-tags .card-tag {
        display: inline-block;
        float: left;
        margin-right: 10px;
        border: 1px solid #EFFFFF;
        height: 30px;
        line-height: 28px;
        text-align: center;
        padding: 0px 15px;
        border-radius: 15px;
        color: #101219;
        background: #EFFFFF;
        font-weight: 500;
        margin-bottom: 10px;
        max-width: 100%;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
    }

    .col-convert .page-body{padding: 0px 0px 60px;}
    .col-convert .page-body .section4-bt.section-140-b{padding: 50px 0px 100px;}
    .col-convert .section4-bt.section-140-b{padding: 100px 0px 100px;}
    .col-convert .page-body .section4-bt.section-140-b .c-card-wrap {height: 360px;}
    .col-convert .section4-bt.section-140-b .c-card-wrap {height: 360px;}
    .section4-bt.section-140-b .c-card-wrap .col1 .txt4 {
        font-weight: 500; color: #EAE7FD; margin: 20px 0px 0px;
        font-size: 14px;	 text-align: left; float: left; width: 100%;
    }

    /*.col-convert .page-body .share-btns-wrap-wide{width: 100vw; text-align: center;
transform: translateX(calc(480px - 50vw)); height: 251px; background: #F8F8FA;}
.col-convert .page-body .share-btns-wrap-wide .share-title{padding: 60px 0px 0px;
font-weight: 700; font-size: 24px; color: #787E8B; text-align: center;
}
.col-convert .page-body .share-btns{display: inline-block; margin: 30px auto 0px;}
.col-convert .page-body .share-btns:after {content: "";display: block;clear: both;}
.col-convert .page-body .share-btn{width: 70px; height: 70px; border-radius: 35px;
float: left; margin: 0px 0px 0px 20px; display: block;}
.col-convert .page-body .share-btn:first-child{margin: 0px;}
.col-convert .page-body .share-btn.share-btn-kakao{
	background:  url(https://cdn.pillyze.io/web/img/share-kakao.webp) center no-repeat;
	background-size: 70px 70px;
}
.col-convert .page-body .share-btn.share-btn-facebook{
	background:  url(https://cdn.pillyze.io/web/img/share-facebook.webp) center no-repeat;
	background-size: 70px 70px;
}
.col-convert .page-body .share-btn.share-btn-url{
	background: #E6E9ED; color: #787E8B;
	font-size: 18px; line-height: 70px; text-align: center;
	font-weight: 500;
}*/

    .col-convert .share-btns-wrap-wide{width: 100vw; text-align: center;
        transform: translateX(calc(480px - 50vw)); height: 251px; background: #F8F8FA;}
    .col-convert .share-btns-wrap-wide .share-title{padding: 60px 0px 0px;
        font-weight: 700; font-size: 24px; color: #787E8B; text-align: center;
    }
    .col-convert .share-btns{display: inline-block; margin: 30px auto 0px;}
    .col-convert .share-btns:after {content: "";display: block;clear: both;}
    .col-convert .share-btn{width: 70px; height: 70px; border-radius: 35px;
        float: left; margin: 0px 0px 0px 20px; display: block;}
    .col-convert .share-btn:first-child{margin: 0px;}
    .col-convert .share-btn.share-btn-kakao{
        background:  url(https://cdn.pillyze.io/web/img/share-kakao.webp) center no-repeat;
        background-size: 70px 70px;
    }
    .col-convert .share-btn.share-btn-facebook{
        background:  url(https://cdn.pillyze.io/web/img/share-facebook.webp) center no-repeat;
        background-size: 70px 70px;
    }
    .col-convert .share-btn.share-btn-url{
        background: #E6E9ED; color: #787E8B;
        font-size: 18px; line-height: 70px; text-align: center;
        font-weight: 500;
    }


    .col-convert .tip-title {color: #101219; font-weight: 700;
        font-size: 22px; line-height: 30px; text-align: left;
        margin: 100px 0px 0px;}
    /*.col-convert .page-body .tip-list-wrap{margin: 20px 0px 0px;}*/
    .col-convert .tip-list-wrap{margin: 20px 0px 60px;}
    .col-convert .page-body .c140-banner-wrap{
        width: 100%; height: 185px; border-radius: 20px;
        overflow: hidden; margin: 0px 0px 60px;
    }


    .col-convert .top-deco{position: relative; margin: 40px 0px 0px;}
    .col-convert .top-deco:after{content:""; display:block; clear:both;}
    .col-convert .top-deco .character{float: left; width: 70px; height: 70px; display: block;}
    .col-convert .top-deco .col{float: right; width: calc(100% - 90px); display: block;}
    .col-convert .top-deco .col .txt1{font-weight: 700; font-size: 16px; color: #101219;
        text-align: left; line-height: 1; display: block;}
    .col-convert .top-deco .col .txt2{font-weight: 500; font-size: 18px; color: #101219;
        text-align: left; min-height: 46px; line-height: 26px; display: inline-block; background: #F4F2FF;
        padding: 20px 40px; margin: 7px 0px 0px; border-radius: 0px 20px 20px 20px;}
    .col-convert .top-deco .col .txt2 span{font-weight: 700;}

    .col-card-wrap-mo{display: none;}
    .col-review-wrap-mo1{display: none;}
    .col-review-wrap-mo2{display: none;}
    .col-convert .page-body{color: #101219;}
    .all-wrap-in-140{padding: 0px 0px 0px; margin: 72px 0px 0px;}



    /*분석 인트로*/
    .section16-1{width: 100%; height: 300px; background: #EFFFFF;}
    .section16-1 .content{width: 100%; max-width: 1120px; margin: 0px auto;
        height: 300px;  text-align: center; position: relative;
        padding: 50px 0px 0px;}
    .section16-1 .content .inner{display: inline-block;}
    .section16-1 .content .inner:after{content: ""; display: block; clear: both;}
    .section16-1 .content .img1{width: 200px; height: 200px; float: left; line-height: 0;}
    .section16-1 .content .img1 img{width: 200px; height: 200px; display: block;}
    .section16-1 .content .img2{width: 199px; height: 185px; float: left; line-height: 0;}
    .section16-1 .content .img2 img{width: 199px; height: 185px; display: block;}
    .section16-1 .content .col1{float: left; text-align: left; padding: 38px 0px 0px 40px;}
    .section16-1 .content .col1 .txt1{display: block; font-size: 26px; line-height: 1.4; font-weight: 500; color: #2D3142;}
    .section16-1 .content .col1 .txt2{display: block; font-size: 36px; line-height: 1.4; font-weight: 800; color: #2D3142; margin: 5px 0px 0px;}
    .section16-1 .content .col1 .txt3{display: block; font-size: 18px; line-height: 1.4; font-weight: 500; color: #2D3142; margin: 15px 0px 0px;}




    .section16-2{width: 100%; background: #FFF;}
    .section16-2 .content{width: 100%; max-width: 1080px; margin: 0px auto; height:981px; position: relative;}
    .section16-2 .content .txt-wrap{position: absolute; top: 212px; left: 140px; z-index: 10;}
    .section16-2 .content .txt-wrap .txt1{font-weight: 500; font-size: 28px; color: #787E8B; text-align: left; line-height: 1;}
    .section16-2 .content .txt-wrap .txt2{font-weight: 700; font-size: 36px; line-height: 44px; color: #101219; text-align: left;
        margin: 20px 0px 0px;}
    .section16-2 .content .txt-wrap .txt2 span{color: #6C2FF2;}
    .section16-2 .content .img1{position: absolute; top: 100px; right : -30px; z-index: 10; width: 500px; height: 780px;}


    .section16-3{width: 100%; background: #F8F8FA;}
    .section16-3 .content{width: 100%; max-width: 1080px; margin: 0px auto; height:981px; position: relative;}
    .section16-3 .content .txt-wrap{position: absolute; top: 210px; left: 140px; z-index: 10; text-align: left;}
    .section16-3 .content .txt-wrap .txt1{font-weight: 500; font-size: 28px; color: #787E8B; text-align: left; line-height: 1;}
    .section16-3 .content .txt-wrap .txt2{font-weight: 700; font-size: 36px; line-height: 44px; color: #101219; text-align: left;
        margin: 20px 0px 0px;}
    .section16-3 .content .txt-wrap .txt2 span{color: #6C2FF2;}
    .section16-3 .content .txt-wrap .txt3{padding: 0px 20px; display: inline-block; position: relative;
        font-weight: 700; font-size: 20px; line-height: 48px; height: 48px; color: #6C2FF2;
        background: #eae7fd; color: #6C2FF2; text-align: left; margin: 33px 0px 0px;
        border-radius: 10px;}
    .section16-3 .content .txt-wrap .txt3:before{position: absolute; content: "";
        display: block; left: 15px; top:-18px;
        width: 0px;
        height: 0px;
        border-bottom: 30px solid #eae7fd;
        border-left: 20px solid transparent;
        border-right: 20px solid transparent;}
    .section16-3 .content .img1{position: absolute; top: 100px; right : -30px; z-index: 10; width: 500px; height: 780px;}



    .section16-4{width: 100%; background: #FFF;}
    .section16-4 .content{width: 100%; max-width: 1080px; margin: 0px auto; height:1225px; position: relative;}
    .section16-4 .content .txt-wrap{position: absolute; top: 195px; left: 140px; z-index: 10;}
    .section16-4 .content .txt-wrap .txt1{font-weight: 500; font-size: 28px; color: #787E8B;
        text-align: left; line-height: 1;}
    .section16-4 .content .txt-wrap .txt2{font-weight: 700; font-size: 36px; line-height: 44px; color: #101219; text-align: left;
        margin: 20px 0px 0px;}
    .section16-4 .content .txt-wrap .txt2 span{color: #6C2FF2;}
    .section16-4 .content .txt-wrap .txt3{padding: 10px 20px; display: block; position: relative;
        font-weight: 700; font-size: 20px; line-height: 38px; color: #6C2FF2;
        background: #eae7fd; color: #6C2FF2; text-align: left; margin: 33px 0px 0px;
        border-radius: 10px;}
    .section16-4 .content .txt-wrap .txt3:before{position: absolute; content: "";
        display: block; left: 13px; top:-13px;
        width: 0px;
        height: 0px;
        border-bottom: 30px solid #eae7fd;
        border-left: 30px solid transparent;
        border-right: 30px solid transparent;}
    .section16-4 .content .img0{position: absolute; top:325px; left : 140px;z-index: 10; width: 500px; height: 780px;}
    .section16-4 .content .img1{position: absolute; top: 100px; right : -30px; z-index: 10; width: 500px; height: 780px;}
    .section16-4 .mo-images{display: none;}


    .section16-5{width: 100%; background: #F8F8FA;}
    .section16-5 .content{width: 100%; max-width: 1080px; margin: 0px auto; height:1225px; position: relative;}
    .section16-5 .content .txt-wrap{position: absolute; top: 195px; left: 140px; z-index: 10;}
    .section16-5 .content .txt-wrap .txt1{font-weight: 500; font-size: 28px; color: #787E8B;
        text-align: left; line-height: 1;}
    .section16-5 .content .txt-wrap .txt2{font-weight: 700; font-size: 36px; line-height: 44px; color: #101219; text-align: left;
        margin: 20px 0px 0px;}
    .section16-5 .content .txt-wrap .txt2 span{color: #6C2FF2;}
    .section16-5 .content .txt-wrap .txt3{padding: 10px 20px; display: block; position: relative;
        font-weight: 700; font-size: 20px; line-height: 38px; color: #6C2FF2;
        background: #eae7fd; color: #6C2FF2; text-align: left; margin: 33px 0px 0px;
        border-radius: 10px;}
    .section16-5 .content .txt-wrap .txt3:before{position: absolute; content: "";
        display: block; left: 13px; top:-13px;
        width: 0px;
        height: 0px;
        border-bottom: 30px solid #eae7fd;
        border-left: 30px solid transparent;
        border-right: 30px solid transparent;}
    .section16-5 .content .img0{position: absolute; top:325px; left : 140px;z-index: 10; width: 500px; height: 780px;}
    .section16-5 .content .img1{position: absolute; top: 100px; right : -30px; z-index: 10; width: 500px; height: 780px;}
    .section16-5 .mo-images{display: none;}


    .section16-6 .content{height: auto;}
    .section16-6 .content{width: 100%; max-width: 1080px; margin: 0px auto; height:auto; position: relative;
        padding: 20px 20px 30px;}
    .section16-6 .content .btn-app-down{border-radius: 10px; height: 70px; line-height: 70px; font-weight: 500; font-size: 18px;
        background: #6C2FF2; text-align: center; font-weight: 700; display: block; margin: 0px auto;
        font-size: 24px; text-align: center; width: 100%; max-width: 960px;
        color: #FFFFFF;
        border-radius: 15px;}

    .pillyze-grade-wrap{border-top: 1px solid #E6E9ED; border-bottom: 1px solid #E6E9ED;
        padding: 60px 0px; text-align: center;}
    .pillyze-grade-wrap .txt1 {font-weight: 700; font-size: 20px; line-height: 1; color: #000;
        text-align: center;}
    .pillyze-grade-wrap .txt2{
        display: block;font-weight: 700; margin: 20px auto 0px;
        font-size: 40px; line-height: 1; text-align: center; color: #101219;}
    .pillyze-grade-wrap .star-point-bg{width: 110px; height: 17px; margin: 12px auto 0px;
        background: url(https://cdn.pillyze.io/web/img/stars2-bg2.webp) left no-repeat; background-size: 110px 17px;}
    .pillyze-grade-wrap .star-point{width: 110px; height: 17px;
        background: url(https://cdn.pillyze.io/web/img/stars2-cv.webp) left no-repeat; background-size: 110px 17px;}
    .pillyze-grade-wrap .txt3{font-weight: 500; text-align: center;
        font-size: 14px; line-height: 1; color: #9BA1AA;}

    .pillyze-grade-wrap .line-140-1{width: 100px; height: 1px; background: #e6e9ed;
        margin: 32px auto 30px;}


    .pillyze-grade-wrap .tags{display: inline-block; margin: 0px 0px 15px;}
    .pillyze-grade-wrap .tags:after{content: ""; display: block; clear: both;}
    .pillyze-grade-wrap .tags .tag-title{float: left; height: 30px; line-height: 30px;
        font-weight: 700; font-size: 14px; color: #101219; text-align: left; padding: 0px 10px 0px 0px }
    .pillyze-grade-wrap .tags .tag-wrap{float: left;}
    .pillyze-grade-wrap .tags .tag-wrap:after{content: ""; display: block; clear: both;}
    .pillyze-grade-wrap .tags .tag-wrap .tag{float: left; display: block; height: 30px; line-height: 30px;
        padding: 0px 15px; background: #EFFFFF; color: #535968; font-weight: 500;
        font-size: 16px; text-align: center; max-width: 100%;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
        border-radius: 15px; margin: 0px 10px 15px 0px;}
    .pillyze-grade-wrap .tags .tag-wrap .tag.tag1{background: #FFF9DE;}
    .pillyze-grade-wrap .tags .tag-wrap .tag.tag2{background: #EFFFFF;}
    .pillyze-grade-wrap .tags .tag-wrap .tag span{font-weight: 700;}







    /*제휴문의*/
    .section18-1{width: 100%; height: 300px; background: #EAE7FD;}
    .section18-1 .content{width: 100%; max-width: 960px; margin: 0px auto;
        height: 300px;  text-align: left; position: relative;
        padding:72px 0px 0px;}
    .section18-1 .content .inner{display: inline-block;}
    .section18-1 .content .inner:after{content: ""; display: block; clear: both;}
    .section18-1 .content .img1{width: 260px; height: 156px; float: left; line-height: 0;}
    .section18-1 .content .img1 img{width: 260px; height: 156px; display: block;}
    .section18-1 .content .col1{float: left; text-align: left; padding: 6px 0px 0px 40px;}
    .section18-1 .content .col1 .txt1{display: inline-block; font-size: 18px; line-height: 35px; height: 36px;
        font-weight: 500; color: #8760F4; border: 1px solid #8760F4; border-radius: 18px; padding: 0px 20px; text-align: center;}
    .section18-1 .content .col1 .txt2{display: block; font-size: 36px; line-height: 44px; font-weight: 800; color: #8760F4; margin: 20px 0px 0px;}
    .section18-1 .content .col1 .txt3{display: block; font-size: 20px; line-height: 28px; font-weight: 500; color: #8760F4; margin: 10px 0px 0px;}


    .section18-2{width: 100%; background: #fff;}
    .section18-2 .content{width: 100%; max-width: 960px; margin: 0px auto; padding:80px 0px 60px;}
    .section18-2 .content .partner-cards{width: calc(100% + 20px);}
    .section18-2 .content .partner-cards:after{content: ""; display: block; clear: both;}
    .section18-2 .content .partner-card{width: calc((100% - 60px) / 3); margin: 0px 20px 20px 0px; float: left; background: #F8F8FA;
        border-radius: 20px; height: 243px; padding: 25px 25px 0px;}
    .section18-2 .content .partner-card .img1{display: block; height: 86px; width: auto;}
    .section18-2 .content .partner-card .txt1{color: #787E8B; font-weight: 500; font-size: 16px; line-height: 22px; margin: 28px 0px 0px; text-align: left;}
    .section18-2 .content .partner-card .txt2{color: #101219; font-weight: 700; font-size: 18px; line-height: 25px; height: 50px; margin: 5px 0px 0px; text-align: left;}


    .section18-3{width: 100%; background: #F8F8FA;}
    .section18-3 .content{width: 100%; max-width: 960px; margin: 0px auto; padding:80px 0px;}
    .section18-3 .content .partner-more-row{width: 100%;}
    .section18-3 .content .partner-more-row:after{content: ""; display: block; clear: both;}
    .section18-3 .content .partner-col{width: calc((100%) / 2); margin: 0px; float: left;}
    .section18-3 .content .partner-col .txt1{width: 100%; display: block; text-align: center; margin: 0px 0px 10px;}
    .section18-3 .content .partner-col .txt1 span{display: inline-block; height: 35px; line-height: 35px; background: #EAE7FD; border-radius: 18px;
        padding: 0px 20px; font-weight: 700; font-size: 18px; color: #6C2FF2;}
    .section18-3 .content .partner-col .img2{display: block; width: 100%; height: auto;}



    /*필라이즈 랭킹*/
    .ranking-190 {margin: 40px auto 100px;}
    .ranking-190 .tab-wrap{display: block; width: 100%;}
    .ranking-190 .tab-wrap:after{content:""; display:block; clear:both;}
    .ranking-190 .tab-wrap .tab{display: block; float: left; height: 42px; line-height: 33px;
        text-align: center; font-weight: 700; color: #101219;
        font-size: 22px; border-bottom: 1px solid #E6E9ED;}
    .ranking-190 .tab-wrap .tab.active{border-bottom: 3px solid #6C2FF2;}
    .ranking-190 .tab-wrap .tab.tab-1in6{width: calc(100% / 6);}
    .ranking-190 .tab-wrap .tab.tab-1in5{width: calc(100% / 5);}

    .ranking-190 .width-flt1 {padding: 30px 0px 0px; text-align: center;}
    .ranking-190 .width-flt1 .filter-btns {padding:0px 0px 0px 0px;}
    .ranking-190 .width-flt1 .filter-btns:after{content:""; display:block; clear:both;}
    .ranking-190 .width-flt1 .filter-btns-in{position: relative;
        font-size: 0; text-align: left; /*float: left;*/ overflow-x: auto;
        white-space: nowrap;}
    .ranking-190 .width-flt1 .filter-btns-in:after{content:""; display:block; clear:both;}
    .ranking-190 .width-flt1 .filter-btns .filter-btn{display: inline-block; /*display: block; float: left; */
        margin: 0px 10px 10px 0px;
        padding: 0px 15px; background: #FFFFFF; border: 1px solid #E6E9ED;
        border-radius: 24px; line-height: 40px; height: 42px; color: #9BA1AA; font-weight: 500;
        font-size: 18px;}
    .ranking-190 .width-flt1 .filter-btns .filter-btn.active{color: #fff; background: #6C2FF2;
        /*font-weight: 700*/}
    .e190-fb3-1{float: left; display: inline-block;}
    .e190-fb3-1:after{content:""; display:block; clear:both;}
    .section18-btm{position: fixed; bottom: 0px; z-index: 150;}



    .section19-1{}
    .section19-1 .s6-banner1{background: #A084FF;}
    .section19-1 .s6-banner1 .content{width: 100%; max-width: 960px;}
    .section19-1 .s6-banner1 .content .col1{color: #fff; width: calc(100% - 180px)}
    .section19-1 .s6-banner1 .content .col1 .txt1{color: #fff}
    .section19-1 .s6-banner1 .content .col1 .txt2{color: #fff}

    .ranking-190 .tab-content{display: none;}
    .ranking-190 .tab-content.active{display: block; position: relative;}


    .ranking-190 .tab-content.active .plz-login{display: none;}

    .ranking-190.plz-login-wrap .tab-content.active .plz-login{opacity: 0; display: block; position: fixed; z-index: 500;
        width:100%; max-width:960px; /*background: #fff;*/ height:calc(100vh - 300px); left:50%;
        bottom:calc(-100vh); transform: translateX(-50%); transition: opacity 0.5s,}


    .ranking-190.plz-login-wrap .tab-content.active .plz-login.scroll{opacity: 1; display: block; position: fixed; z-index: 500;
        width:100%; max-width:960px; /*background: #fff; */height:calc(100vh - 300px);left:50%;
        bottom:70px; transform: translateX(-50%); transition: opacity 0.5s,}
    .ranking-190 .tab-content.active .plz-login .plz-login-inside{opacity: 0; }
    .ranking-190 .tab-content.active .plz-login.scroll .plz-login-inside{opacity: 1;}
    .plz-login .btn-goto-login{display: inline-block;
        border-radius: 10px; background: #fee500; text-align: center;
        margin: 20px auto 0px; padding: 14px 22px; }
    .plz-login .btn-goto-login span{ font-weight: 500;
        background: url(https://cdn.pillyze.io/web/img/kakao-login-14.webp) left 2px no-repeat; display: inline-block;
        background-size: 20px 20px; font-size: 16px; color: #101219; padding: 0px 0px 0px 26px;
        text-align: left; height: 24px;  line-height: 24px;}



    .plz-login-wrap.scroll .item-card:before{width: 100%; height: 100%; position: absolute; bottom: 0px; left: 0px;
        background: linear-gradient(to top, #fff 69%, transparent); content: ""; border-radius: 20px; z-index: 51;}




    .ranking-190 .filter-btns2 {transform: translateX(-20px); width: calc(100% + 40px);}
    .ranking-190 .filter-btns2:after{content:""; display:block; clear:both;}
    .ranking-190 .filter-btns2 .filter-btns-in{overflow-x: auto; white-space: nowrap; width: 100%;}
    .ranking-190 .filter-btns2 .filter-btn{display: inline-block; padding: 10px 0px 0px; margin: 0px 10px 0px 10px; }
    .ranking-190 .filter-btns2 .filter-btn:first-child{margin: 0px 10px 0px 20px; }
    .ranking-190 .filter-btns2 .filter-btn:last-child{margin: 0px 20px 0px 10px; }
    .ranking-190 .filter-btns2 .filter-btn .icon{display: block; width: 70px; height: 70px;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1); background: #fff;
        border: 2px solid #fff; margin: 0px 0px 10px;
        border-radius: 20px; text-align: center;
        padding: 13px 0px 0px;}

    .ranking-190 .filter-btns2 .filter-btn .txt1{text-align: center; display: block;
        font-weight: 500; font-size: 16px; line-height: 22px; color: #787E8B;}
    .ranking-190 .filter-btns2 .filter-btn .txt1:link, .ranking-190 .filter-btns2 .filter-btn .txt1:visited{color: #787E8B;}

    .ranking-190 .filter-btns2 .filter-btn.active .icon{border: 2px solid #8760F4; background: none;}
    .ranking-190 .filter-btns2 .filter-btn-b001.active .icon{border: 2px solid #8760F4;}
    .ranking-190 .filter-btns2 .filter-btn-b002.active .icon{border: 2px solid #15E74E;}
    .ranking-190 .filter-btns2 .filter-btn-b003.active .icon{border: 2px solid #00C7C7;}
    .ranking-190 .filter-btns2 .filter-btn-b004.active .icon{border: 2px solid #1AA7EC;}
    .ranking-190 .filter-btns2 .filter-btn-b005.active .icon{border: 2px solid #0076FF;}
    .ranking-190 .filter-btns2 .filter-btn-b006.active .icon{border: 2px solid #0041D5;}
    .ranking-190 .filter-btns2 .filter-btn-b007.active .icon{border: 2px solid #FFB800;}

    .ranking-190 .plz-login{text-align: center;}
    .ranking-190 .plz-login .plz-login-inside{display: inline-block;}
    .ranking-190 .plz-login .plz-login-inside .img1{display: inline-block; width: 140px; height: 140px;
        margin: 0px auto;}

    .ranking-190 .plz-login .plz-login-inside .txt1{color: #000;
        font-weight: 700; text-align: center; line-height: 30px;
        font-size: 22px; margin: 30px 0px 0px;
    }

    .ranking-190 .plz-login .plz-login-inside .txt2{color: #787E8B;
        font-weight: 500; text-align: center; line-height: 26px;
        font-size: 18px; margin: 15px 0px 0px;
    }


    .ranking-190 .filter-btns2 .filter-btn .icon span{display: inline-block; width: 40px; height: 40px; border-radius: 20px;
        background: #000;
        text-align: center; line-height: 40px; font-family: 'Montserrat', sans-serif; font-weight: 700; font-size: 18px; color: #fff;}
    .ranking-190 .filter-btns2 .filter-btn.active .txt1{color: #8760F4; font-weight: 700;}
    .ranking-190 .filter-btns2 .filter-btn-b001.active .txt1{color: #8760F4;}
    .ranking-190 .filter-btns2 .filter-btn-b002.active .txt1{color: #15E74E;}
    .ranking-190 .filter-btns2 .filter-btn-b003.active .txt1{color: #00C7C7;}
    .ranking-190 .filter-btns2 .filter-btn-b004.active .txt1{color: #1AA7EC;}
    .ranking-190 .filter-btns2 .filter-btn-b005.active .txt1{color: #0076FF;}
    .ranking-190 .filter-btns2 .filter-btn-b006.active .txt1{color: #0041D5;}
    .ranking-190 .filter-btns2 .filter-btn-b007.active .txt1{color: #FFB800;}

    .ranking-190 .filter-btns2 .filter-btn.filter-btn-b001 .icon span{background: linear-gradient(148.15deg, #A084FF 12.96%, #6C2FF2 83.48%);}
    .ranking-190 .filter-btns2 .filter-btn.filter-btn-b002 .icon span{background: linear-gradient(148.15deg, #8CF8AD 12.96%, #15E74E 83.48%);}
    .ranking-190 .filter-btns2 .filter-btn.filter-btn-b003 .icon span{background: linear-gradient(148.15deg, #94FFFF 12.96%, #00C7C7 83.48%);}
    .ranking-190 .filter-btns2 .filter-btn.filter-btn-b004 .icon span{background: linear-gradient(148.15deg, #92E5FF 12.96%, #1AA7EC 83.48%);}
    .ranking-190 .filter-btns2 .filter-btn.filter-btn-b005 .icon span{background: linear-gradient(148.15deg, #B3D6FF 12.96%, #0076FF 83.48%);}
    .ranking-190 .filter-btns2 .filter-btn.filter-btn-b006 .icon span{background: linear-gradient(148.15deg, #8FB1FF 12.96%, #0041D5 83.48%);}
    .ranking-190 .filter-btns2 .filter-btn.filter-btn-b007 .icon span{background: linear-gradient(148.15deg, #FFEA8D 12.96%, #FFB800 83.48%);}

    .ranking-190 .filter-btns3{padding: 20px 40px 0px; background: #FFFFFF; border: 1px solid #E6E9ED; border-radius: 15px;
        width: 100%; height: 62px; margin: 30px 0px 0px;}
    .ranking-190 .filter-btns3:after{content:""; display:block; clear:both;}

    .checkbox-type2{display: none;}
    .checkbox-type2 + label{display: block; float: left; background: url(https://cdn.pillyze.io/web/img/ch2-off.webp) left no-repeat;
        background-size: 18px 18px; color: #9BA1AA; font-weight: 500; margin: 0px 0px 0px 60px;
        font-size: 16px; line-height: 18px; line-height: 18px; padding: 0px 0px 0px 23px;}
    .checkbox-type2:checked + label{display: block; float: left;
        background: url(https://cdn.pillyze.io/web/img/ch2-on.webp) left no-repeat;
        background-size: 18px 18px; color: #101219;}
    .checkbox-type2:first-child + label{margin: 0px;}
    .checkbox-style-t2{display: block; float: left; background: url(https://cdn.pillyze.io/web/img/ch2-off.webp) left no-repeat;
        background-size: 18px 18px; color: #9BA1AA; font-weight: 500; margin: 0px 0px 0px 60px;
        font-size: 16px; line-height: 18px; line-height: 18px; padding: 0px 0px 0px 23px;}
    .checkbox-style-t2.active{display: block; float: left;
        background: url(https://cdn.pillyze.io/web/img/ch2-on.webp) left no-repeat;
        background-size: 18px 18px; color: #101219;}
    .checkbox-style-t2:first-child{margin: 0px;}
    .checkbox-style-t2.cst1{margin: 0px !important;}
    .checkbox-style-t2.cst1:first-child{margin: 0px !important;}
    .cst1-wrap{margin:0px 0px 20px !important; float:left; width:20%;}

    .ranking-190 .swiper-container{width: 100%; }
    .ranking-190 .item-cards{width: calc(100% + 20px)}
    .ranking-190 .item-cards:after{content:""; display:block; clear:both;}
    .ranking-190 .item-card{width: calc((100% - 60px) / 3); margin: 20px 20px 0px 0px;
        display: block; position: relative;
        border: 1px solid #E6E9ED; box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 20px; background: #fff; height: 400px; float: left;
        padding: 0px 20px;}
    .ranking-190 .swiper-container-rank-mo .item-card{width: 100% !important}


    /*.ranking-190 .item-card:nth-child(3n - 2){margin: 20px 0px 0px 0px;}*/
    .ranking-190 .item-card .item-img{width: 130px; height: 130px; display: block;
        margin: 40px auto 0px;}
    .ranking-190 .item-card .txt1{font-weight: 500; display: block;
        font-size: 14px; color: #9BA1AA; text-align: left; margin: 30px 0px 0px}
    .ranking-190 .item-card .txt2{font-weight: 700; color: #101219; display: block;
        font-size: 18px; text-align: left; line-height: 27px; margin: 4px 0px 0px;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .ranking-190 .item-card .txt2 span{color:#6C2FF2;}
    .ranking-190 .item-card .review{margin-top: 10px;}
    .ranking-190 .item-card .review:after{content:""; display:block; clear:both;}
    .ranking-190 .item-card .review .star-point{float: left; font-weight: 700;
        font-size: 17px; color: #535968; text-align: left; line-height: 20px;
        background: url(https://cdn.pillyze.io/web/img/star-icon.webp) left 2px no-repeat;
        background-size: 16px 15px; padding-left: 20px; height:20px; }
    .ranking-190 .item-card .review .txt3{float: left;
        font-weight: 500; line-height: 19px; height: 20px; color: #9BA1AA;
        font-size: 16px; margin: 0px 0px 0px 10px }
    .ranking-190 .item-card .tag-type1-wrap{width: 100%; margin: 20px 0px 0px; overflow: hidden; height: 40px;}
    .ranking-190 .item-card .tag-type1-wrap:after{content:""; display:block; clear:both;}
    .ranking-190 .item-card .tag-type2-wrap{width: 100%; margin: 0px 0px 0px; overflow: hidden; height: 40px;}
    .ranking-190 .item-card .tag-type2-wrap:after{content:""; display:block; clear:both;}
    .ranking-190 .item-card .tag-type1{ color: #535968;
        height: 30px; background: #FFFFFF; border: 1px solid #D6D9E0;
        padding: 0px 15px; text-align: center; float: left; line-height: 28px;
        border-radius: 15px; margin: 0px 10px 10px 0px;
        max-width: 100%;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .ranking-190 .item-card .tag-type2{color: #535968;
        height: 30px; background: #F4F6FA; border: 1px solid #F4F6FA;
        padding: 0px 15px; text-align: center; float: left; line-height: 28px;
        border-radius: 15px; margin: 0px 10px 10px 0px; max-width: 100%;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}


    .ranking-190 .item-card .tag-type3 .card-tag{background: #EFFFFF; border: none; line-height: 30px;
        font-size: 14px; font-weight: 500; clear: both}
    .ranking-190 .item-card .tag-type3 .card-tag span{font-weight: 700;}

    .ranking-190 .ranking-no{position: absolute; top: 20px; left: 20px; z-index: 50;}
    .ranking-190 .ranking-no img{width: 40px; height: 40px;}
    .ranking-190 .ranking-no .txt{width: 40px; height: 40px; display: inline-block;
        height: 25px; line-height: 25px; color: #9BA1AA; font-weight: 700;}

    .ranking-banner{width: calc(100% - 20px); height: 70px; display: block; float: left;
        padding: 15px 40px; margin: 20px 0px 0px;
        background: #EAE7FD;
        border-radius: 20px;}
    .ranking-banner:after{content:""; display:block; clear:both;}
    .ranking-banner .txt1{font-weight: 700; color: #8760F4; font-size: 20px; float: left;
        height: 40px; line-height: 40px;}
    .ranking-banner .txt2{font-weight: 500; color: #8760F4; font-size: 16px; float: left;
        height: 20px; line-height: 20px; margin: 11px 0px 0px 10px}
    .ranking-banner .txt2 span{background: url(https://cdn.pillyze.io/web/img/ic-arrow-v1.webp) right no-repeat;
        background-size: 14px 14px; padding: 0px 16px 0px 0px; }

    .ranking-banner .img1{width: 40px; height: 40px; float: right;}
    .ranking-last-update{color: #9BA1AA; font-weight: 500; text-align: left;
        font-size: 14px; line-height: 1; margin: 60px 0px 0px;}


    .h190-title{font-weight: 500; /*background: url(https://cdn.pillyze.io/web/img/check-2.webp) left no-repeat;
background-size: 20px 20px; padding: 0px 0px 0px 30px; */color: #101219;
        margin: 30px 0px 0px;
        font-size: 26px; line-height: 34px; min-height: 34px; text-align: left; position: relative;}

    .h190-title span{color: #6C2FF2 !important; font-weight: 700;}

    .ranking-last-update2 {
        color: #9BA1AA;
        font-weight: 500;
        text-align: left;
        font-size: 14px;
        line-height: 1;
        margin: 5px 0px 0px;
    }

    .tab-content-004 .health-wrap{margin-top:30px;}
    .filter-btns3-x label{margin:0px 60px 20px 0px;}
    .filter-btns3-x .checkbox-type2:first-child + label{margin:0px 60px 20px 0px;}
    .ranking-190 .filter-btns3-x{height: auto; padding:20px 40px 0px;}

    .filter-btns3-x .checkbox-style-t2{margin:0px 60px 20px 0px;}
    .filter-btns3-x .checkbox-style-t2:first-child{margin:0px 60px 20px 0px;}


    /*Q&A*/
    .section20-1{padding:30px 0px 0px;
        width:calc(100% - 40px); max-width: 1800px;
        margin:0px auto; }

    .s20-banner1{width:100%; height: 100%;
        border-radius: 20px;}
    .s20-banner1 .content{/*position: relative; width:960px;
margin:0px auto;*/}

    .ipt-qna-top-wrap{width: 100%; position: relative; margin: 0px 0px 20px;}
    .ipt-qna-top-wrap .ipt-qna-top{width: 100%; position: relative;
        padding: 15px 54px 15px 20px;height: 50px; display: block;
        background: #FFFFFF;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 25px; border: none; font-weight: 700;
        font-size: 16px;}
    .ipt-qna-top-wrap .ipt-qna-top::placeholder{color: #C4C8CE;}
    .ipt-qna-top-wrap .btn-qna-top{width: 28px; height: 28px; display: block;
        background: url(https://cdn.pillyze.io/web/img/plz-search2-3.webp) center no-repeat; background-size: 28px 28px;
        position: absolute; top: 11px; right: 20px; z-index: 50;}


    .new-wide-main-200 .filter-btns {padding:0px 0px 0px 0px; width: calc(100% + 20px);}
    .new-wide-main-200 .filter-btns:after{content:""; display:block; clear:both;}
    .new-wide-main-200 .filter-btns-in{position: relative;
        font-size: 0; text-align: left; float: left;}
    .new-wide-main-200 .filter-btns-in:after{content:""; display:block; clear:both;}
    .new-wide-main-200 .filter-btns .filter-btn{display: inline-block; /*display: block; float: left; */
        margin: 0px 10px 10px 0px;
        padding: 0px 15px; background: #FFFFFF; border: 1px solid #E6E9ED;
        border-radius: 24px; line-height: 40px; height: 42px; color: #9BA1AA; font-weight: 500;
        font-size: 18px;}
    .new-wide-main-200 .filter-btns .filter-btn.active{color: #fff; background: #6C2FF2;
        /*font-weight: 700*/}

    .ge-title.get-20-2{font-weight: 700; color: #101219; line-height: 1;
        font-size: 20px; margin: 30px 0px 0px; display: block;}
    .ge-title.get-20-4{font-weight: 700; color: #101219; line-height: 1;
        font-size: 20px; margin: 8px 0px 0px !important; display: block; padding: 0px !important}
    .ipt-qna-top-wrap + .ge-title.get-20-2{margin: 40px 0px 0px;}

    .ge-title.get-20-3{font-weight: 700; color: #101219; line-height: 1;
        font-size: 20px; margin: 60px 0px 22px; display: block;}
    .chk-type3{display: inline-block; float: left; height: 24px; line-height: 24px;
        color: #535968; font-weight: 500; text-align: left; padding: 0px 0px 0px 27px;
        font-size: 16px; background: url(https://cdn.pillyze.io/web/img/check-3.webp) left no-repeat;
        background-size: 24px 24px;}

    .chk-type3.active{background: url(https://cdn.pillyze.io/web/img/check-3c.webp) left no-repeat;
        background-size: 24px 24px;}
    .btn-myqna{display: none;}
    .qna-list-wrap{width: 100%; display: block;}
    .qna-card{width: 100%; display: block; padding: 25px 40px;
        background: #FFFFFF; border: 1px solid #E6E9ED;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 20px; margin: 20px 0px 0px; text-align: left;}
    .qna-card:after{content:""; display:block; clear:both;}
    .qna-card .ingredient-tags{display: block; width: 100%; margin: 0px 0px 19px}
    .qna-card .ingredient-tags:after{content:""; display:block; clear:both;}
    .qna-card .ingredient-tags .ingredient-tag{background: #F4F2FF;
        border-radius: 5px; height: 22px; line-height: 22px; text-align: center;
        color: #8760F4; font-weight: 500; display: inline-block; padding: 0px 5px;
        border-radius: 5px;
        font-size: 12px; float: left; margin: 0px 10px 0px 0px;}
    .qna-card .ingredient-tags .reply-tag{background: #F4F6FA;
        border-radius: 5px; height: 22px; line-height: 22px; text-align: center;
        color: /*#8760F4*/#787E8B; font-weight: 500; display: inline-block; padding: 0px 5px;
        border-radius: 5px;
        font-size: 12px; float: right; margin: 0px 10px 0px 0px;}
    .qna-card .qna-main{display: block; width: 100%;}
    .qna-card .qna-main .txt1{font-weight: 700; display: block;
        font-size: 18px; line-height: 26px; text-align: left; color: #101219;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;}
    .qna-card .qna-main .txt1 .qmark{color: #6C2FF2;}
    .qna-card .qna-main .txt2{font-weight: 500; display: block; text-align: left;
        font-size: 16px; line-height: 24px; color: #787E8B; margin: 8px 0px 0px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;}

    .qna-card .card-tags{margin: 19px 0px 0px}
    .qna-card .card-tags:after{content:""; display:block; clear:both;}
    .qna-card .card-tags .card-tag{display: inline-block; float: left; margin-right: 10px;
        margin-bottom: 10px;
        border: 1px solid #D6D9E0; height: 30px; line-height: 28px; text-align: center; padding: 0px 15px;
        border-radius: 15px; color: #535968; font-weight: 500; max-width: 100%;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}


    .qna-card .qna-user-wrap{display: block; width: 100%; margin: 20px 0px 0px;}
    .qna-card .qna-user-wrap:after{content:""; display:block; clear:both;}
    .qna-card .qna-user-wrap .qna-user-icon{width: 30px; height: 30px; float: left;}

    .qna-card .qna-user-wrap .qna-user-icon.qna-user-icon-1
    {background: url(https://cdn.pillyze.io/web/img/user-s-1.webp) center no-repeat; background-size: 30px 30px;}
    .qna-card .qna-user-wrap .qna-user-icon.qna-user-icon-2
    {background: url(https://cdn.pillyze.io/web/img/user-s-2.webp) center no-repeat; background-size: 30px 30px;}
    .qna-card .qna-user-wrap .qna-user-icon.qna-user-icon-3
    {background: url(https://cdn.pillyze.io/web/img/user-s-3.webp) center no-repeat; background-size: 30px 30px;}

    .qna-card .qna-user-wrap .qna-user-txt{float: right; width: calc(100% - 40px);
        font-weight: 500; color: #101219; text-align: left; line-height: 24px;
        font-size: 16px; overflow: hidden; padding: 3px 0px 0px;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;}
    .qna-card .qna-user-wrap .user-info-row{display: block; width: 100%;
        margin: 20px 0px 0px; float: left;}
    .qna-card .qna-user-wrap .user-info-row .user-name{color: #787E8B; font-weight: 700;
        font-size: 14px; line-height: 22px;}
    .qna-card .qna-user-wrap .user-info-row .user-agesex{color: #9BA1AA; font-weight: 500;
        font-size: 14px; line-height: 22px;}
    .qna-card .qna-user-wrap .user-info-row .img-icon{display: block; float: right;
        width: 16px; height: 14px;
        background: url(https://cdn.pillyze.io/web/img/img-icon.webp) center no-repeat; background-size: 16px 15px;
        margin: 4px 0px 0px; font-size: 0;}


    .page-200{margin: 60px 0px 0px;}
    .qna-card .item-cards{overflow-x: hidden; margin: 20px 0px 0px;
        width: calc(100% + 45px); transform: translateX(-5px);
        /*width: calc(100% + 80px); transform: translateX(-40px);*/}
    .qna-card .item-cards .swiper-slide{padding: 5px;}
    .qna-card .item-cards .item-card{
        height: 79px; display: block; padding: 10px 15px;
        background: #FFFFFF;
        box-shadow: 0px 2px 5px rgba(70, 56, 147, 0.1);
        border-radius: 10px;

    }
    .qna-card .item-cards .item-card:after{content:""; display:block; clear:both;}
    .qna-card .item-cards .item-card .item-img{display: block; float: left;
        width: 50px; height: 50px; margin: 5px 0px 0px;}
    .qna-card .item-cards .item-card .txt1{color: #9BA1AA; font-weight: 500;
        width: 100%; display: block;
        font-size: 12px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .qna-card .item-cards .item-card .txt2{width: 100%;
        color: #101219; font-weight: 500; line-height: 20px; margin: 4px 0px 0px;
        font-size: 14px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;}
    .qna-card .item-cards .item-card .txt-wrap{float: right; width: calc(100% - 60px);
        display: flex; flex-wrap: wrap; align-items: center; height: 60px;}
    .qna-card .item-cards .item-card .txt-wrap-fix{width: 100%;}
    .banner-200-right .r-banner-card
    {background: #8760F4 url(https://cdn.pillyze.io/web/img/rb002bg.webp) calc(100% - 1vw) bottom no-repeat !important;
        background-size: 150px 154px !important;}
    .banner-200-right .r-banner-card .rb-txt1{color: #fff !important}
    .banner-200-right .r-banner-card .rb-txt2{color: #fff !important;
        position: absolute; bottom: 20px; left: 20px; display: inline-block;
        background: url(https://cdn.pillyze.io/web/img/arrow-right2.webp) right 2px no-repeat;
        background-size: 16px 16px; font-weight: 500; padding: 0px 21px 0px 0px;
        font-size: 14px; line-height: 20px; height: 20px; text-align: left;
    }

    .section20-2-home .content{width: 100% !important;
        max-width: 978px !important; margin: 0px auto; padding: 0px 20px}
    .section20-2-home .get-20-2{text-align: left;}
    .section20-2-002 .content{padding: 80px 0px 0px;}
    .page-20-2-002{margin: 40px 0px 0px;}
    .qna-mark-home{display: block; font-size: 0;
        background: url(https://cdn.pillyze.io/web/img/qna-txt2.webp) left no-repeat;
        width: 50px; height: 20px; background-size: 50px 20px;}
    .qna-mark-home + .get-20-2{margin: 10px 0px 0px; font-size: 26px;}
    .get-20-2-home-txt2{font-weight: 500; text-align: left; margin: 10px 0px 0px;
        font-size: 16px; line-height: 24px; color: #787E8B; }
    .more-qna{
        float: right;
        font-weight: 500;
        font-size: 16px;
        line-height: 1;
        text-align: right;
        margin: 20px 0px 0px;
        text-decoration: underline;
        color: #9BA1AA;
    }


    .section20-2-home + .ranking-190{margin: 200px 0px 0px;}

    .section1-2e{margin: 147px 0px 0px;}


    .title-new-big{font-weight: 700;
        font-size: 26px; text-align: left;
        line-height: 1; padding: 12px 0px 0px;
        color: #000000;}

    .press-cards{width: 100%; display: block;}
    .press-card{width: 100%; border-top: 1px solid #E6E9ED;
        padding: 40px; transition: all 0.35s ease 0s;}
    .press-card:first-child{border-top: none;}
    .press-card:hover{transform: scale(1.01);}
    .press-card .row1{display: block; width: 100%;}
    .press-card .row2{display: block; width: 100%; margin: 18px 0px 0px;}
    .press-card .row1:after{content:""; display:block; clear:both;}
    .press-card .row2:after{content:""; display:block; clear:both;}
    .press-card .txt1{font-weight: 700;
        font-size: 18px; color: #6C2FF2; float: left;
        line-height: 26px; height: 26px; text-align: left;}
    .press-card .txt2{font-weight: 500;
        font-size: 16px; color: #9BA1AA; margin: 0px 0px 0px 15px;
        line-height: 26px; height: 26px; float: left; text-align: left;}
    .press-card .txt3{font-weight: 500; display: block; float: left;
        width: calc(100% - 30px);
        font-size: 22px; color: #101219; line-height: 30px; text-align: left;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .press-card .btn-goto-press{float: right; width: 24px; height: 24px; display: block;
        margin: 4px 0px 0px;
        background: url(https://cdn.pillyze.io/web/img/arrow-right3.webp) center no-repeat; background-size: 24px 24px;}
    .press-card:hover .btn-goto-press{
        background: url(https://cdn.pillyze.io/web/img/arrow-right3h.webp) center no-repeat; background-size: 24px 24px;}
    .new-wide-main-230{padding: 0px 0px 100px}



    /*q&a detail*/
    .new-wide-main-210{padding: 0px 0px 90px}
    .qna-detail-wrap{display: block; width: 100%; padding: 30px 40px;
        background: #FFFFFF;
        border: 1px solid #E6E9ED;
        border-radius: 20px;}
    .qna-detail-wrap:after{content:""; display:block; clear:both;}
    .qna-detail-wrap .title{font-weight: 700; font-size: 22px; line-height: 140%;
        color: #101219; line-height: 30px; text-align: left; margin: 0px 0px 30px}
    .qna-detail-wrap .title2{ font-weight: 500; font-size: 16px; line-height: 24px;
        color: #2D3142; margin: 0px 0px 30px; text-align: left;}
    .qna-detail-wrap .pic-row{width: 100%; display: block; margin: 0px 0px 20px;}
    .qna-detail-wrap .pic-row:after{content:""; display:block; clear:both;}
    .qna-detail-wrap .pic-row .pic-row-inside{width: calc(100% + 20px)}
    .qna-detail-wrap .pic-row .pic-row-inside:after{content:""; display:block; clear:both;}
    .qna-detail-wrap .pic-row .pic-row-inside .img1wrap{display: block; width: calc((100% - 100px) / 5); margin: 0px 20px 20px 0px;
        float: left; }
    .qna-detail-wrap .pic-row .pic-row-inside .img1wrap .img1{width: 100%; height: auto; border-radius: 10px;}
    /*.qna-detail-wrap .pic-row{width: 100%; display: block; margin: 30px 0px 0px; overflow-x: auto; white-space: nowrap; position: relative;}
.qna-detail-wrap .pic-row .pic-row-inside{}
.qna-detail-wrap .pic-row .pic-row-inside .img1{display: inline-block; width: 160px; height: 160px; margin: 0px 0px 0px 20px}
.qna-detail-wrap .pic-row .pic-row-inside .img1:first-child{margin: 0px}*/
    .qna-detail-wrap .q210-title{font-weight: 700;
        font-size: 14px; line-height: 1; float: left; text-align: left; color: #101219;}
    .qna-detail-wrap .q210-amount{font-weight: 500; font-size: 14px;
        line-height: 1; float: right; text-align: right; color: #9BA1AA;}
    .qna-detail-wrap .q210-amount span{font-weight: 700; color: #6C2FF2}

    .qna-detail-wrap .item-cards{overflow-x: hidden; margin: 20px 0px 0px;
        width: calc(100% + 45px); transform: translateX(-5px);
        /*width: calc(100% + 80px); transform: translateX(-40px);*/}
    .qna-detail-wrap .item-cards .swiper-slide{padding: 5px;}
    .qna-detail-wrap .item-cards .item-card{
        height: 79px; display: block; padding: 10px 15px;
        background: #FFFFFF;
        box-shadow: 0px 2px 5px rgba(70, 56, 147, 0.1);
        border-radius: 10px;
        margin: 0px 0px 40px;
    }
    .qna-detail-wrap .item-cards .item-card:after{content:""; display:block; clear:both;}
    .qna-detail-wrap .item-cards .item-card .item-img{display: block; float: left;
        width: 50px; height: 50px; margin: 5px 0px 0px;}
    .qna-detail-wrap .item-cards .item-card .txt1{color: #9BA1AA; font-weight: 500;
        width: 100%; display: block; text-align: left;
        font-size: 12px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .qna-detail-wrap .item-cards .item-card .txt2{width: 100%;  text-align: left;
        color: #101219; font-weight: 500; line-height: 20px; margin: 4px 0px 0px;
        font-size: 14px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;}
    .qna-detail-wrap .item-cards .item-card .txt-wrap{float: right; width: calc(100% - 60px);
        display: flex; flex-wrap: wrap; align-items: center; height: 60px;}
    .qna-detail-wrap .item-cards .item-card .txt-wrap-fix{width: 100%;}
    .qna-detail-wrap .card-tags{margin: 19px 0px 30px}
    .qna-detail-wrap .card-tags:after{content:""; display:block; clear:both;}
    .qna-detail-wrap .card-tags .card-tag{display: inline-block; float: left; margin-right: 10px;
        margin-bottom: 10px;
        border: 1px solid #D6D9E0; height: 30px; line-height: 28px; text-align: center; padding: 0px 15px;
        border-radius: 15px; color: #535968; font-weight: 500; max-width: 100%;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
    .line-210-1{width: 100%; height: 1px; background: #E6E9ED; margin: 40px 0px}
    .qna-detail-wrap .card-tags + .line-210-1{width: 100%; height: 1px; background: #E6E9ED; margin: 0px 0px 40px}


    .qna-detail-wrap .q210-title2{font-weight: 700; font-size: 14px; line-height: 1; text-align: left; color: #787E8B;}
    .counselling-information-wrap{padding: 15px 20px; margin: 10px 0px 40px;
        width: 100%; background: #F8F8FA; border-radius: 15px;}
    .counselling-information-wrap .ci-user .t1{font-weight: 700; font-size: 16px; line-height: 16px; height: 16px; color: #535968;}
    .counselling-information-wrap .ci-user .t2{font-weight: 500; font-size: 14px; line-height: 16px; height: 16px; color: #9BA1AA;
        padding: 0px 0px 0px 5px;}
    .counselling-information-wrap .ci-tag-wrap{width: 100%; margin: 11px 0px 0px; display: block;}
    .counselling-information-wrap .ci-tag-wrap:after{content:""; display:block; clear:both;}
    .counselling-information-wrap .ci-tag-wrap-inside{width: calc(100% - 20px); float: left;}
    .counselling-information-wrap .ci-tag-wrap-inside:after{content:""; display:block; clear:both;}
    .counselling-information-wrap .ci-tag{float: left; font-weight: 500;
        font-size: 16px; line-height: 16px; height: 16px; float: left; max-width: 100%;
        overflow: hidden; text-overflow: ellipsis; white-space: nowrap; margin: 0px 10px 5px 0px;
        color: #535968;}
    .counselling-information-wrap .ci-tag span{color: #8760F4; padding: 0px 0px 0px 3px; font-weight: 600;}

    .counselling-information-wrap .ci-info-table{width: 100%; display: block; margin: 15px 0px 0px;}
    .counselling-information-wrap .ci-info-table .row1{width: 100%; display: block; margin: 10px 0px 0px;}
    .counselling-information-wrap .ci-info-table .row1:first-child{margin:0px;}
    .counselling-information-wrap .ci-info-table .row1:after{content:""; display:block; clear:both;}
    .counselling-information-wrap .ci-info-table .row1 .col1{width: 66px; float: left; text-align: left; line-height: 24px; text-align: 16px;
        color: #787E8B; font-weight: 500;}
    .counselling-information-wrap .ci-info-table .row1 .col2{width: calc(100% - 67px); float: right;
        text-align: left; line-height: 24px; text-align: 16px;
        color: #8760F4; font-weight: 500;}
    .counselling-information-wrap .ci-info-table .row1 .col2:after{content:""; display:block; clear:both;}


    .qna-detail-wrap .ci-date{font-weight: 500; text-align: left;
        font-size: 14px; line-height: 1; color: #C4C8CE; margin: 0px 0px 40px;}
    .qna-detail-wrap .ci-user-like{font-weight: 500;
        font-size: 14px; line-height: 22px; color: #787E8B; text-align: left; /*margin: 40px 0px 0px;*/}
    .qna-detail-wrap .ci-user-like span{font-weight: 700;}

    .qna-reply-wrap{display: block; width: 100%; padding: 30px 0px; margin: 60px 0px 0px;
        background: #FFFFFF; border: 1px solid #E6E9ED; border-radius: 20px;}
    .qna-reply-wrap .row1{display: block; width: calc(100% + 2px); transform: translateX(-1px);
        padding: 20px; background: #F4F2FF;}
    .qna-reply-wrap .row1:after{content:""; display:block; clear:both;}
    .qna-reply-wrap .row1 .ci-img1{float: left; width: 50px; height: 50px;}
    .qna-reply-wrap .row1 .txt-wrap{float: right; width: calc(100% - 60px); height: 50px; display: flex; flex-wrap: wrap;
        align-items: center;}
    .qna-reply-wrap .row1 .txt-wrap .t-txt1{width: 100%; height: 28px; line-height: 28px; text-align: left;
        font-weight: 700; font-size: 20px; color: #101219;}
    .qna-reply-wrap .row1 .txt-wrap .t-txt2{width: 100%; line-height: 1; text-align: left;
        font-weight: 500; font-size: 14px; margin: 3px 0px 0px;
        color: #9BA1AA;}
    .qna-reply-wrap .row1.waiting{background: #F8F8FA;}


    .qna-reply-wrap .row2 .r-row2-content{display: block; width: 100%; font-weight: 500;
        font-size: 16px; line-height: 24px; color: #2D3142; margin: 0px 0px 30px;}
    .qna-reply-wrap .row2 .r-row2-content mark{background: #fff9de;}
    .qna-reply-wrap .row2 .r-row2-content strong{font-weight: 700;}
    .qna-reply-wrap .row2 .r-row2-content hr{width: 100%; height: 1px;
        background: #E6E9ED !important; margin: 60px 0px; display: block; border: none !important}
    .qna-reply-wrap .row2 .r-row2-content blockquote{    display: block;
        width: 100%;
        font-weight: 500;
        padding: 0px 0px 0px 18px;
        font-size: 14px;
        line-height: 22px;
        color: #2D3142;
        position: relative;
        margin: 9px 0px 30px;}
    .qna-reply-wrap .row2 .r-row2-content blockquote:before {
        content: "";
        display: block;
        width: 3px;
        height: calc(100% - 4px);
        background: #E6E9ED;
        border-radius: 2px;
        left: 0px;
        top: 3px;
        position: absolute;
    }
    .qna-reply-wrap .row2 .r-row2-content a{display: inline; color: #9BA1AA; border-bottom: 1px solid #9BA1AA;}
    .qna-reply-wrap .row2 .r-row2-content img {
        width: 100%;
        max-width: 600px;
        height: auto;
        display: block;
        margin: 0px 0px 20px;
    }


    .qna-reply-wrap .row2{display: block; width: 100%; padding: 30px 40px 0px;}
    .qna-reply-wrap .row2 .r2-txt1{display: block; width: 100%; font-weight: 500;
        font-size: 16px; line-height: 24px; color: #2D3142; margin: 0px 0px 30px;}
    .qna-reply-wrap .row2 .r2-txt2{display: block; width: 100%; font-weight: 500;
        font-size: 14px; line-height: 1; color: #787E8B; /*margin: 30px 0px 0px;*/}
    .qna-reply-wrap .row2 .r2-txt2 span{font-weight: 700;}
    .r2-readme{width: 100%; background: #F8F8FA; border-radius: 10px;
        padding: 15px 20px; color: #787E8B; text-align: left; font-weight: 500;
        font-size: 14px; line-height: 22px; margin: 40px 0px 0px;}
    .qna-reply-wrap .row2 .r3-txt1{display: block; width: 100%; font-weight: 500;
        font-size: 16px; line-height: 24px; color: #2D3142; margin: 0px 0px 30px;}
    .link-mark{display: inline; color: #9BA1AA; border-bottom: 1px solid #9BA1AA;}
    .link-mark:link, .link-mark:visited{color: #9BA1AA;}
    .qna-reply-wrap .row2 .r4-title{display: block; width: 100%; font-weight: 500;
        font-size: 16px; line-height: 24px; color: #2D3142;}
    .qna-reply-wrap .qr-line1{width: calc(100%); height: 1px; background: #E6E9ED; margin: 60px 0px; display: block;}

    .qna-reply-wrap .row2 .r4-txt1{display: block; width: 100%; font-weight: 500; padding: 0px 0px 0px 18px;
        font-size: 14px; line-height: 22px; color: #2D3142; position: relative; margin: 9px 0px 30px;}
    .qna-reply-wrap .row2 .r4-txt1:before{content: ""; display: block; width: 3px; height: calc(100% - 4px);
        background: #E6E9ED; border-radius: 2px; left: 0px; top: 3px; position: absolute; }
    .qna-reply-wrap .row2 .r5-txt1{display: block; width: 100%; font-weight: 500;
        font-size: 16px; line-height: 24px; color: #2D3142;}

    .qna-reply-wrap .row2 .r2-img1{width: 100%; max-width: 600px; height: auto; display: block; margin: 0px 0px 20px;}
    .qna-reply-wrap .row2 .r2-img1 + .r2-txt2{margin: 30px 0px 0px;}
    .qna-bottom-btns{display: block; width: 100%; margin: 30px 0px 0px; position: relative;}
    .qna-bottom-btns:after{content:""; display:block; clear:both;}
    .qna-bottom-btns .btn-prev{display: inline-block; height: 24px; line-height: 25px; text-align: left;
        background: url(https://cdn.pillyze.io/web/img/arrow-left3.webp) left no-repeat; background-size: 24px 24px;
        padding: 0px 0px 0px 36px; float: left;}
    .qna-bottom-btns .btn-prev:hover, .qna-bottom-btns .btn-prev:focus{color: #6C2FF2; font-weight: 700;
        background: url(https://cdn.pillyze.io/web/img/arrow-left3h.webp) left no-repeat; background-size: 24px 24px;}


    .qna-bottom-btns .btn-list{display: inline-block; height: 24px; line-height: 25px; text-align: right;
        background: url(https://cdn.pillyze.io/web/img/btn-list.webp) right no-repeat; background-size: 18px 14px;
        padding: 0px 31px 0px 0px; position: absolute; top: 0px; left: 50%; transform: translateX(-50%);}

    .qna-bottom-btns .btn-list:hover, .qna-bottom-btns .btn-list:focus{color: #6C2FF2; font-weight: 700;
        background: url(https://cdn.pillyze.io/web/img/btn-list-h.webp) right no-repeat; background-size: 18px 14px;}

    .qna-bottom-btns .btn-next{display: inline-block; height: 24px; line-height: 25px; text-align: right;
        background: url(https://cdn.pillyze.io/web/img/arrow-right3.webp) right no-repeat; background-size: 24px 24px;
        padding: 0px 36px 0px 0px; float: right;}

    .qna-bottom-btns .btn-next:hover, .qna-bottom-btns .btn-next:focus{color: #6C2FF2; font-weight: 700;
        background: url(https://cdn.pillyze.io/web/img/arrow-right3h.webp) right no-repeat; background-size: 24px 24px;}



    .qna-detail-wrap .pic-row2{width: 100%; display: block; margin: 15px 0px 0px;}
    .qna-detail-wrap .pic-row2:after{content:""; display:block; clear:both;}
    .qna-detail-wrap .pic-row2 .pic-row2-inside{width: calc(100% + 20px)}
    .qna-detail-wrap .pic-row2 .pic-row2-inside:after{content:""; display:block; clear:both;}
    .qna-detail-wrap .pic-row2 .pic-row2-inside .img2wrap
    {display: block; margin: 0px 5px 5px 0px; float: left;
        width: 90px;
        height: 90px; padding: 5px 5px;
        background: #FFFFFF;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 10px;}

    .qna-detail-wrap .pic-row2 .pic-row2-inside .img2wrap .img2{width: 80px;
        height: 80px; display: block; border-radius: 5px;}

    .p-question-cards{margin: 0px 0px 40px; width: 100%;
    }
    .p-question-card{display: block; width: 100%;  margin: 20px 0px 0px;
        padding: 20px; display: block;
        background: #FFFFFF;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 15px;}
    .p-question-card .pq-txt1{font-weight: 700; color: #101219;
        font-size: 18px; line-height: 26px; text-align: left;overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }
    .p-question-card .pq-txt1 span{color: #6C2FF2;}
    .p-question-card .pq-txt2{font-weight: 500; width: 100%; display: block;
        font-size: 16px;line-height: 24px; margin: 10px 0px 0px;
        color: #787E8B;overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
    }
    .btn-accd-210-1{width: 20px; height: 20px; background: url(https://cdn.pillyze.io/web/img/arrow-down2.webp) center no-repeat;
        background-size: 14px 8px; float: right; display: block; margin: -3px 0px 0px;  transition: all 0.5s;}
    .btn-accd-210-1.active{transform: rotate(180deg);    transition: all 0.5s;}
    .mark-strong{background: #fff9de; font-weight: 700;}

    .an-report-title{margin: 40px 0px 0px;}
    /*.qna-detail-wrap .title2 + .an-report-title{margin: 40px 0px 0px;}*/
    .an-report{padding: 20px 20px 20px; width: 100%; background: #FFFFFF; box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 20px; margin: 15px 0px 30px;}
    .an-report .anr-date{font-weight: 500; display: block; width: 100%; font-size: 14px; line-height: 22px; color: #9BA1AA;
        text-align: left;}
    .an-report .anr-point{display: block; width: 100%; margin: 15px 0px 0px;}
    .an-report .anr-point:after{content: ""; display: block; clear: both;}
    .an-report .anr-point .point{float: left; height: 43px;}
    .an-report .anr-point .p1{font-weight: 700; font-size: 36px; color: #000;}
    .an-report .anr-point .p2{font-weight: 500; font-size: 20px; color: #787E8B;}
    .an-report .anr-point .potin-txt{float: right; line-height: 1;font-weight: 500; font-size: 14px; color: #6C2FF2; margin: 21px 0px 0px;}
    .an-report .anr-point .potin-txt span{font-weight: 700;}
    .an-report .an-line1{width: 100%; height: 1px; background: #E6E9ED; margin: 15px 0px;}
    .an-report .an-pic-wrap{display: block; margin: 15px 0px 0px;}
    /*.an-report .an-pic-wrap .an-pic-wrap-inside{display: block; width: calc(100% + 20px);}
.an-report .an-pic-wrap .an-pic-wrap-inside:after{content: ""; display: block; clear: both;}
.an-report .an-pic-wrap .an-pic-wrap-inside .anrp-wrap{display: block; width: 75px; height: 75px; position: relative;
margin: 0px 20px 20px 0px; float: left;}
.an-report .an-pic-wrap .an-pic-wrap-inside .anrp-wrap .anrp-amount{position: absolute; top: 0px; right: 0px;
background: rgba(0,0,0,0.5); color: #fff; display: inline-block; height: 24px; line-height: 24px; font-weight: 500;
font-size: 14px; text-align: center; padding: 0px 10px; border-radius: 12px; }
.an-report .an-pic-wrap .an-pic-wrap-inside .anrp-wrap .item-img{width: 75px; height: 75px;}
*/
    /*.an-report{padding: 20px}*/

    .an-report .an-pic-wrap .an-pic-wrap-inside{display: block; overflow-x: auto; white-space: nowrap; width: calc(100% + 20px)}
    .an-report .an-pic-wrap .an-pic-wrap-inside:after{content: ""; display: block; clear: both;}
    .an-report .an-pic-wrap .an-pic-wrap-inside .anrp-wrap{display: inline-block; margin: 0px 0px 0px 20px; position: relative;}
    .an-report .an-pic-wrap .an-pic-wrap-inside .anrp-wrap .anrp-amount{position: absolute; top: 0px; right: 0px;
        background: rgba(0,0,0,0.5); color: #fff; display: inline-block; height: 24px; line-height: 24px; font-weight: 500;
        font-size: 14px; text-align: center; padding: 0px 10px; border-radius: 12px; }
    .an-report .an-pic-wrap .an-pic-wrap-inside .anrp-wrap .item-img{width: 75px; height: 75px;}


    /*.an-report .an-pic-wrap .an-pic-wrap-inside{display: block; overflow-x: auto; white-space: nowrap;}
.an-report .an-pic-wrap .an-pic-wrap-inside .anrp-wrap{display: inline-block; margin: 0px 0px 0px 20px; float: none;}*/
    .an-report .an-pic-wrap .an-pic-wrap-inside .anrp-wrap:first-child{margin: 0px;}
    .an-report .an-pic-wrap .an-pic-wrap-inside .anrp-wrap:before{position: absolute; width: 1px; height: 55px; top: 10px; left: -10px;
        content: ""; background: #E6E9ED;}
    .an-report .an-pic-wrap .an-pic-wrap-inside .anrp-wrap:first-child:before{display: none;}




    .an-report.an-report-200 .anr-point{margin:  0px;}
    .an-report.an-report-200 .anr-point .point{height: 16px;}
    .an-report.an-report-200 .anr-point .p1{font-size: 16px;}
    .an-report.an-report-200 .anr-point .p2{font-size: 14px;}
    .an-report.an-report-200 .anr-point .potin-txt{margin: 3px 0px 0px;}
</style>
<style>
    html, body {
        max-width: 100%;
        overflow-x: hidden;
    }

    .ranking-guide-wrapper {
        padding-right: 20px;
    }
    .ranking-guide-banner {
        text-align: left;
        background: url(https://cdn.pillyze.io/web/img/ranking_guide_icon.png) right no-repeat;
        background-size: 40px 40px;
        display: inline-block;
        margin-top: 20px;
        padding: 15px 40px;
        width: 100%;
        height: 100%;
        background-color: #EAE7FD;
        background-position: right 40px top 50%;
        border-radius: 20px;
    }

    .ranking-guide-banner .txt1 {
        font-weight: 700;
        font-size: 20px;
        line-height: 140%;
        color: #8760F4;
        margin-right: 10px;
    }

    .ranking-guide-banner .link {
        font-weight: 500;
        font-size: 16px;
        line-height: 140%;
        color: #8760F4;
        background: url(https://cdn.pillyze.io/web/img/ranking_guide_arrow.png) right no-repeat; background-size: 7px 12px;
        padding-right: 10px;
    }

    .new-wide-main-120 .title-txt1.workout-detail {
        margin-top: 120px;
        margin-bottom: 10px
    }

    .new-wide-main-120 .title-txt2.workout-detail {
        margin-top: 0px;
        margin-bottom: 20px;
        font-weight: 500;
        font-size: 16px;
        line-height: 140%;
        color: #9BA1AA;
    }

    .workout-home .btn-more {
        margin-top: 20px;
        margin-bottom: 0px;
        text-align: center;
        background: #FFFFFF;
        border: 1px solid #E6E9ED;
        font-size: 18px;
        color: #787E8B;
        box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
        border-radius: 10px;
        padding: 14px;
        width: 100%;
    }

    .ingredient-one.hide {
        display: none !important;
    }

    .modal-wrap .modal-body .img1 {
        object-fit: contain;
    }

    .workout-home .section1-2 .content {
        padding: 100px 0px 40px;
    }

    .f-footer-row1 .content2 {
        display: none;
    }

    .f-footer-row1 .content2 .txt {
        font-weight: 500;
        font-size: 14px;
        line-height: 18px;
        color: #787E8B;
        padding-top: 5px;
    }

    .f-footer-row1 .gradient {
        display: none;
        height: 20px;
        background: linear-gradient(180deg, rgba(255, 255, 255, 0) 0%, #FFFFFF 100%);
    }

    .f-footer-row1 .content2 .applink {
        padding: 17px 10px;
        background: #6C2FF2;
        border-radius: 10px;
        width: 100%;
        font-weight: 500;
        font-size: 18px;
        line-height: 18px;
        text-align: center;
        color: #FFFFFF;
        margin-bottom: 15px;
        margin-top: 10px;
    }

    .nav-top-selector {
        vertical-align: middle;
        -webkit-appearance: none;
        appearance: none;
        width: 46px;
        height: 38px;
        background: url(https://cdn.pillyze.io/web/img/arrow_down.png) no-repeat center;
        background-size: 13.3px 8px;
        background-position: right 13px;
        border: none;
        font-size: 20px;
        margin-right: 5px;
    }

    .item-card.food-search-card .brand-txt {
        float: left;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        max-width: 50%;
        display: inline-block;
    }

    .item-card.food-search-card .unit-txt {
        float: left;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        display: inline-block;
        color: #9BA1AA;
        padding-left: 5px;
    }

    .item-card.food-search-card .separator {
        margin-top: 5px;
        border-right: 1px solid #D6D9E0;
        margin-left: 15px;
        margin-right: 10px;
        height: 12px;
        display: inline-block;
        float: left;
    }

    .item-card.food-search-card .left {
        width: 70%;
        float: left;
    }

    .item-card.food-search-card .right {
        width: 30%;
        float: right;
        margin-top: 15px;
        text-align: right;
    }


    .section3-7-002.product-detail .c-card-wrap .txt1 {
        margin-top: 28px;
    }

    .food-nutrient-table .blur {
        filter: blur(6px);
        opacity: 30%;
    }

    .food-nutrient-table2 .blur {
        filter: blur(6px);
        opacity: 30%;
    }

    .btn-h-login.product-detail {
        float: right;
        font-size: 12px;
        padding: unset;
        padding-top: 2px;
        padding-left: 14px;
        width: 131px;
        height: 25px;
        border-radius: 27px;
        background-size: 14px 14px;
        line-height: 1px;
        background-position-x: 10px;
    }


    .h-header .ipt-main-wrap-2-0 .ipt-main-wrap-in .ipt-h-search {
        position: absolute;
    }

    .join-banner-btn {
        color: white;
        width: 190px;
        height: 36px;
        background: #6C2FF2 url(https://cdn.pillyze.io/web/img/arrow-right1.webp) right no-repeat;
        border-radius: 18px;
        padding: 10px 15px;
        background-size: 7px 14px;
        font-size: 16px;
        background-position-x: 170px;
        line-height: 100%;
        margin-bottom: 40px;
        margin-top: 15px;
    }

    .join-banner-btn2 {
        display: block;
        color: white;
        width: 190px;
        border-radius: 10px;
        padding: 18px 20px;
        background: #6C2FF2;
        background-size: 7px 14px;
        font-size: 16px;
        background-position-x: 125px;
        line-height: 100%;
        text-align: center;
    }

    .food-notice-caution {
        background-image: url(https://cdn.pillyze.io/web/img/ic_info_fillic_info_fill_grey.png);
        background-repeat: no-repeat;
        background-size: 19px;
        background-position-y: 1px;
        padding-left: 22px;
        margin-top: 80px
    }

    .food-notice-caution2 {
        background-image: url(https://cdn.pillyze.io/web/img/ic_info.png);
        background-repeat: no-repeat;
        background-size: 19px;
        background-position-y: 1px;
        padding-left: 22px;
        margin-top: 20px;
        color: #C4C8CE;
    }

    .sm-menu > a.colorful.active > span {
        color: #6C2FF2 !important;
    }

    .new-wide-main-020-002 .section3-1 .card-wrap.food-detail {
        padding: 30px 40px;
    }

    .food-wing-name {
        margin-bottom: 5px;
        font-weight: 500;
        font-size: 16px;
        line-height: 140%;
        color: #101219;
    }

    .food-wing-calorie {
        font-weight: 500;
        font-size: 14px;
        line-height: 140%;
        color: #9BA1AA;
    }

    .food-wing-brand {
        float: left;
        display: inline-block;
        margin-right: 5px;
        font-weight: 500;
        font-size: 14px;
        line-height: 140%;
        color: #535968;
    }

    .food-wing-unit {
        font-weight: 500;
        font-size: 14px;
        line-height: 140%;
        color: #9BA1AA;
        padding-right: 3px;
    }

    .section3-7.food .col2:before {
        display: none;
    }

    .section3-7-002.food .col1 .txt3 {
        font-size: 16px;
    }

    .section3-7.food .col2 {
        position: absolute;
        width: 200px;
        height: 347px;
        bottom: -1px;
        right: 40px;
        background: url(https://cdn.pillyze.io/web/img/food_bottom_banner.png) no-repeat;
        background-size: 200px 347px;
        box-shadow: unset;
        border-radius: unset;
        padding: unset;
    }

    .section3-7.food .col3 {
        position: absolute;
        width: 296px;
        height: 261px;
        right: 40px;
        bottom: 0;
        background: url(https://cdn.pillyze.io/web/img/product_detail_banner2.png) no-repeat;
        background-size: 296px 261px;
        box-shadow: unset;
        border-radius: unset;
        padding: unset;
    }

    .section3-7-002.food .c-card-wrap {
        height: 262px;
    }

    .section3-7.food .col1 {
        float: left;
        position: relative;
        margin: unset;
    }

    .food-item-cards .food-item-card {
        width: 100%;
        height: 92px;
        margin: 20px 0px 0px 0px;
        padding: 20px 40px;
        display: block;
        border: 1px solid #E6E9ED;
        box-shadow: 0px 2px 10px rgb(70 56 147 / 10%);
        border-radius: 20px;
        background: #fff;
        overflow: hidden;
    }

    .food-item-cards .food-item-card .name {
        margin-bottom: 5px;
        color: #101219;
        font-weight: 500;
        font-size: 18px;
        line-height: 140%;
    }

    .food-item-cards .food-item-card .brand {
        font-weight: 500;
        font-size: 16px;
        line-height: 140%;
        color: #535968;
    }

    .food-item-cards .food-item-card .cal {
        font-weight: 500;
        font-size: 18px;
        line-height: 140%;
        color: #787E8B;
    }

    .section3-1 .col .mark {
        margin-bottom: 30px;
    }

    .section3-1 .btn-share.food {
        top: unset;
    }

    .food-nutrient-table {
        border: 1px solid #E6E9ED;
        width: 100%;
        color: black;
        font-weight: 500;
        font-size: 18px;
        line-height: 140%;
    }

    .food-nutrient-table .left-col {
        background: #F8F8FA;
        padding: 20px;
    }

    .food-nutrient-table .right-col {
        padding: 20px;
        text-align: right;
    }

    .food-nutrient-table2 {
        margin-top: 30px;
        width: 100%;
        color: black;
        font-weight: 500;
        font-size: 16px;
        line-height: 140%;
        color: #535968;
    }

    .food-nutrient-table2 .left-col {
        font-weight: 500;
        font-size: 16px;
        line-height: 140%;
        color: #535968;
    }

    .food-nutrient-table2 .mid-col {
        text-align: center;
        font-weight: 700;
        font-size: 16px;
        line-height: 140%;
        color: #535968;
    }

    .food-nutrient-table2 .right-col {
        font-weight: 700;
        font-size: 16px;
        line-height: 140%;
        text-align: right;
        color: #535968;
    }

    .food-nutrient-table2 tr {
        border-bottom: 1px solid #E6E9ED;
    }

    .food-nutrient-table2 td {
        padding: 15px 0;
    }

    .food-nutrient-table2 .square {
        width: 14px;
        height: 14px;
        border-radius: 5px;
        margin-right: 8px;
        display: inline-block;
    }

    .food-detail-name {
        font-weight: 700;
        font-size: 24px;
        line-height: 130%;
        color: #101219;
        margin-bottom: 40px;
    }

    .food-detail-name-sub {
        font-weight: 500;
        font-size: 16px;
        line-height: 130%;
        color: #9BA1AA;
        margin-bottom: 40px;
    }

    .food-nutrient-table .indent-icon {
        width: 15px;
        height: 12px;
        margin-right: 10px;
    }

    .food-nutrient-table .indent-icon2 {
        width: 15px;
        height: 12px;
        margin-right: 10px;
        margin-left: 12px;
    }

    .food-nutrient-table .indent-icon3 {
        width: 15px;
        height: 12px;
        margin-right: 10px;
        margin-left: 24px;
    }

    .food-search-brand {
        text-underline-position: under;
        font-weight: 500;
        font-size: 16px;
        line-height: 140%;
        text-decoration-line: underline;
        text-transform: uppercase;
        color: #9BA1AA;
        margin-bottom: 10px;
        display: inline-block;
    }

    .new-wide-main-070 .item-card.food-search-card {
        overflow: hidden;
        width: 100% !important;
        height: 92px !important;
        margin: 20px 0px 0px 0px !important;
        padding: 20px 40px !important;
    }

    .new-wide-main-070 .item-card .txt3 {
        font-weight: 500;
        font-size: 18px;
        line-height: 140%;
        color: #6C2FF2;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }

    .new-wide-main-070 .item-card .txt4 {
        font-weight: 500;
        font-size: 16px;
        line-height: 140%;
        color: #535968;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }

    .new-wide-main-070 .item-card .txt5 {
        font-weight: 500;
        font-size: 18px;
        line-height: 140%;
        color: #787E8B;
    }

    .blur .product-pic-row {
        filter: blur(4px);
    }

    .product-pic-row {
        text-align: left;
        width: calc(100% + 40px);
        display: block;
        margin: 20px 0px 20px;
    }

    .product-pic-row:after {
        content: "";
        display: block;
        clear: both;
    }

    .product-pic-row .pic-row-inside {
        overflow: auto;
        white-space: nowrap;
        width: 100%;
    }

    .product-pic-row .pic-row-inside .img1wrap {
        display: inline-block;
        width: 180px;
        margin: 0px 20px 20px 0px;
    }

    .product-pic-row .pic-row-inside .img1wrap .img1 {
        width: 180px;
        height: 180px;
        object-fit: cover;
        border-radius: 10px;
    }

    .product-detail-rank {
        margin-top: 30px;
        display: inline-block;
    }

    .product-detail-rank .row1 {
        width: 100%;
        display: block;
    }

    .product-detail-rank .row1 .col1 {
        width: 75px;
        float: left;
        text-align: left;
        line-height: 24px;
        color: #787E8B;
        font-weight: 500;
        background: url(https://cdn.pillyze.io/web/img/ic_info.png) center no-repeat;
        background-size: 18px 18px;
        cursor: pointer;
    }

    .product-detail-rank .row1 .col2 {
        width: calc(100% - 75px);
        float: right;
        text-align: left;
        font-size: 16px;
        line-height: 140%;
        text-align: 16px;
        font-weight: 500;
        color: #787E8B;
    }

    .product-detail-rank .row1 .col2 .emp {
        color: #6C2FF2;
    }

    .product-detail-rank .rank-arrow {
        padding-left: 30px;
        width: 7px;
        margin: 5px 0px 0px;
        height: 12px;
        float: right;
        background: url(https://cdn.pillyze.io/web/img/renewed_arrow.png) center no-repeat;
        background-size: 7px 12px;
    }

    .product-detail-rank .rank-link {
        color: #787E8B;
    }

    .p-review-tester1 {
        height: 17px;
        margin-top: 20px;
        background: url(https://cdn.pillyze.io/web/img/logo_for_me.png) left 0px no-repeat;
        background-size: 36px 13px;
        padding-left: 40px;
        font-weight: 500;
        font-size: 14px;
        color: #9BA1AA;
        line-height: 13px;
        text-align: left;
    }

    .p-review-tester2 {
        height: 17px;
        font-weight: 500;
        font-size: 14px;
        color: #C4C8CE;
        text-align: left;
    }

    .blur .p-review-tester1 {
        filter: blur(4px);
    }

    .blur .p-review-tester2 {
        filter: blur(4px);
    }

    .section3-5 .accordian-wrap .card-wrap .acd-content .ac-txt2 span {
        color: #8760F4;
    }

    .qna-profile {
        display: none;
    }

    .qna-reply-wrap .row1 .ci-img1 {
        border-radius: 50%;
    }

    .qna-card .qna-user-wrap .qna-user-icon.qna-user-icon-1 {
        background-size: contain !important;
        border-radius: 50%;
    }

    .qna-card .qna-user-wrap .qna-user-icon.qna-user-icon-2 {
        background-size: contain !important;
        border-radius: 50%;
    }

    .p-mark-faved {
        color: #6C2FF2;
        border: solid 1px #6C2FF2;
        border-radius: 5px;
        padding: 5px 10px;
        font-size: 16px;
        font-weight: 500;
        width: 95px;
        height: 32px;
        float: left
    }

    .p-mark-faved.active {
        background-color: #6C2FF2;
        color: white;
    }

    .qna-profile.active {
        display: block;
        width: calc(100% + 2px);
        transform: translateX(-1px);
        padding: 20px;
        background: #F4F2FF;
    }

    .p-arrow-down {
        width: 16px;
        float: left;
        height: 16px;
        background: url(https://cdn.pillyze.io/web/img/ic_arrow_down.png) center no-repeat;
        background-size: 16px 16px;
        margin-left: 5px;
        transition: all 0.1s;
    }

    .p-arrow-down.active {
        transform: rotate(180deg);
        transition: all 0.1s;
    }

    .p-qna-answerer-icon {
        float: left;
        width: 28px;
        height: 28px;
        border-radius: 50%;
        padding: 10px;
        background-color: white;
        background-position-x: 50%;
        background-size: 16px;
        background-repeat: no-repeat;
        background-position-y: 50%;
    }

    .section14-1-mo {
        display: none;
    }

    .qna-bottom-btns .btn-prev {
        color: #9BA1AA;
    }

    .section1-1 .swiper-pagination-bullet-active {
        width: 8px !important;
        height: 8px !important;
    }

    .section1-1 .swiper-pagination-bullet {
        width: 8px !important;
        height: 8px !important;
    }

    .qna-bottom-btns .btn-next {
        color: #9BA1AA;
    }

    .qna-bottom-btns .btn-list {
        color: #9BA1AA;
    }

    .qna-reply-wrap .row1.waiting {
        border-left: 1px solid #E6E9ED;
        border-right: 1px solid #E6E9ED;
    }

    .ranking-190 .filter-btns2 .filter-btn.active .icon {
        background: #F4F2FF;
    }

    .ranking-190 .filter-btns2 .filter-btn-b002.active .icon {
        border: 2px solid #8760F4;
    }

    .ranking-190 .filter-btns2 .filter-btn-b003.active .icon {
        border: 2px solid #8760F4;
    }

    .ranking-190 .filter-btns2 .filter-btn-b004.active .icon {
        border: 2px solid #8760F4;
    }

    .ranking-190 .filter-btns2 .filter-btn-b005.active .icon {
        border: 2px solid #8760F4;
    }

    .ranking-190 .filter-btns2 .filter-btn-b006.active .icon {
        border: 2px solid #8760F4;
    }

    .ranking-190 .filter-btns2 .filter-btn-b007.active .icon {
        border: 2px solid #8760F4;
    }

    .ranking-190 .filter-btns2 .filter-btn-b001.active .txt1 {
        color: #8760F4;
    }

    .ranking-190 .filter-btns2 .filter-btn-b002.active .txt1 {
        color: #8760F4;
    }

    .ranking-190 .filter-btns2 .filter-btn-b003.active .txt1 {
        color: #8760F4;
    }

    .ranking-190 .filter-btns2 .filter-btn-b004.active .txt1 {
        color: #8760F4;
    }

    .ranking-190 .filter-btns2 .filter-btn-b005.active .txt1 {
        color: #8760F4;
    }

    .ranking-190 .filter-btns2 .filter-btn-b006.active .txt1 {
        color: #8760F4;
    }

    .ranking-190 .filter-btns2 .filter-btn-b007.active .txt1 {
        color: #8760F4;
    }

    .ranking-190 .tab-wrap .tab {
        border-bottom: 2px solid #E6E9ED;
    }

    .f-footer-row2 .r-col .footer-menu .menu {
        color: #9BA1AA;
    }

    button:hover, button:focus {
        outline: none;
    }

    .review .btn-goto-login {
        cursor: pointer;
    }

    .blur .review-full-txt {
        color: #bebebe !important;
    }

    .blur .card-tags .card-tag {
        color: #bebebe !important;
    }

    .col-convert .page-body .col-title-wrap .title-txt1 {
        font-size: 20px;
    }

    .col-convert .page-body .col-title-wrap .btn-more-product-col {
        line-height: 30px;
    }

    .item-cards .item-card .card-tags {
        margin: 10px 0px 0px;
    }

    .new-wide-main-100 .item-card .tag-type1-wrap {
        margin: 10px 0px 0px;
        height: 30px;
    }

    .new-wide-main-100 .item-card .tag-type1 {
        margin: 0px 10px 0px 0px;
    }

    .new-wide-main-100 .item-card .tag-type2-wrap {
        margin: 10px 0px 0px;
    }

    ards .item-card .card-tags {
        margin: 10px 0px 0px;
    }

    .new-wide-main-070 .txt-dot {
        height: 20px;
        overflow: hidden;
        margin: 10px 0px 0px;
    }

    .col-convert .page-body .item-card-t120 .review .txt3 {
        font-size: 15px;
    }

    .review .btn-goto-login {
        width: 125px;
        height: 25px;
        border-radius: 13px;
        background: #fee500;
        text-align: center;
        display: inline-block;
        margin-right: 5px;
        float: left;
    }

    .new-wide-main-120 .item-card-t120 .btn-goto-login {
        width: 125px;
        height: 25px;
        border-radius: 13px;
        background: #fee500;
        text-align: center;
        display: inline-block;
        margin-right: 5px;
        float: left;
    }

    .review .btn-goto-login span {
        font-weight: 500;
        background: url(https://cdn.pillyze.io/web/img/kakao-login-14.webp) left 5px no-repeat;
        display: inline-block;
        background-size: 14px 14px;
        font-size: 12px;
        color: #101219;
        padding: 0px 0px 0px 19px;
        text-align: left;
        height: 25px;
        line-height: 26px;
    }

    .p-txt3-not-login {
        line-height: 25px !important;
        height: 25px !important;
        margin: unset !important;
        font-size: 14px !important;
    }

    .r-fixed-1-03-110 .item-card .txt3 {
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .r-fixed-1 .item-card .txt2 {
        -webkit-line-clamp: 1;
    }

    .h130-title-txt1 {
        line-height: 42px;
    }

    .h130-title-txt2 {
        margin-top: 10px;
        font-weight: 500;
        text-align: left;
        font-size: 18px;
        line-height: 25px;
        color: #787E8B
    }

    .p-review-period {
        display: inline-block;
        float: left;
        height: 28px;
        line-height: 28px;
        padding: 0px 14px;
        border-radius: 14px;
        text-align: left;
        background: #EAE7FD;
        color: #6C2FF2;
        font-weight: 700;
        font-size: 14px;
        margin: 20px 0px 20px 0px;
    }


    h1 {
        width: unset;
        height: unset;
        font-size: unset;
        overflow: unset;
    }

    /*여기부터 신규로 추가*/
    .section3-1 .col .mark.mark4 {
        background: url(https://cdn.pillyze.io/icons/product_detail/otc.png) left 0px no-repeat;
        background-size: 20px 20px;
        height: 20px;
        line-height: 20px;
        padding-left: 30px;
    }

    .section3-6 .filter-btns-in {
        height: 104px;
        overflow: hidden;
    }

    .nutrient-detail-link {
        color: unset !important;
        padding-right: 13px;
        background: url(https://cdn.pillyze.io/web/img/caution-more.webp) right no-repeat;
        background-size: 6px 12px;
        font-weight: 500;
    }

    .modal-wrap.active {
        z-index: 420;
    }

    .modal-content172.active.ranking-guide {
        left: calc(50% - 210px);
    }

    .section3-4 .info-cards .txt3.type5 {
        background: #F8F8FA;
        color: #9BA1AA;
        font-weight: 500;
    }

    .section3-1 .btn-share {
        border-radius: 80px;
    }

    .p-intake-guide {
        color: #2D3142 !important;
    }

    /*배너를 버튼태그로 만들기 위함*/
    .right-wing .r-banner-card {
        display: flex !important;
    }

    .section3-1 .col .review .amount {
        text-decoration: underline;
    }

    .section1-2e .review-info-row2e .img1wrap {
        border-left: 3px solid #E6E9ED;
    }

    .h110-title .st1 {
        text-underline-position: under;
    }

    .p-side-menu-banner {
        width: 100%;
        display: none;
    }

    .main-menu-banner-wrap {
        width: 100%;
    }

    .p-side-menu-banner img {
        width: 100%;
    }

    .p-home-top-banner {
        height: 100%;
    }

    .p-home-top-banner img {
        height: 100%;
    }

    .p-column-category {
        display: inline-block;
        float: left;
        margin-top: 24px;
        margin-bottom: 7px;
        border: 1px solid #D6D9E0;
        height: 30px;
        line-height: 28px;
        text-align: center;
        padding: 0px 15px;
        border-radius: 15px;
        color: #535968;
        font-weight: 500;
    }

    .tip-list-wrap .tip-list {
        margin-bottom: 60px;
    }

    .s-main-menu.active .p-side-menu-banner {
        display: block;
    }

    .page-cover-image {
        margin-bottom: 30px;
    }

    .column-top .p-c-banner1 .txt2 {
        padding: 0 40px;
    }

    .col-convert .page-body li a {
        color: #6C2FF2;
        text-decoration: underline;
    }

    .col-convert .page-body li a:link,
    .col-convert .page-body li a:visited {
        color: #6C2FF2;
    }

    .col-convert hr {
        background: #E6E9ED;
        width: 100%;
        height: 1px;
        display: block;
        margin: 50px 0px 60px;
        border: none;
    }

    .p-more-item .btn-more-product-col {
        text-decoration: underline;
        text-underline-position: under;
        font-weight: 500;
        color: #9BA1AA;
        font-size: 14px;
    }

    .section3-5a .swiper-slide .item-card-col {
        height: 394px;
    }

    .section3-5a .swiper-slide .item-card-col .item-img {
        border-radius: 10px;
    }

    .section3-5a .swiper-slide .item-card-col .txt2 {
        margin-top: 15px;
    }

    .f-footer-row2 .r-col .txt1 {
        color: #9BA1AA !important;
    }

    .f-footer-row2 .r-col .txt2 {
        color: #787E8B;
    }

    .col-review-wrap .card-tags {
        height: 40px;
    }

    .user-review-wrap-1 .review-content {
        color: #101219;
    }

    .new-wide-wrap .new-wide-main-140 {
        padding: 60px 0px 0px;
    }

    .bs-option {
        padding: unset;
        text-align: center;
    }

    .qna-reply-wrap .row2 .r-row2-content hr {
        margin: 0px 0px;
    }

    .qna-reply-wrap .row2 .r-row2-content p {
        line-height: 28px;
    }

    .r-row2-content ul {
        list-style: unset;
        margin-left: 20px;
    }

    .r-row2-content li {
        list-style: unset;
    }

    .ipt-qna-top-wrap .ipt-qna-top {
        background: #F4F6FA;
        box-shadow: unset !important;
    }

        .health-wrap .fatigue .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/ZMRFlYGcp8jgvkT0hiNtU6ZjmJTVf1hcUw4YnIZI0EU/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2ZhdGlndWUucG5n) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .eyes .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/hlGUVSeFIjT1R2qL8SZ-X1yJF2AWOaUja2gA6zENZP8/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2V5ZXMucG5n) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .skincare .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/9hxxZJcJXEN140bUHh9E3c1lQcp1Wbefbw0Rmnpt3Wo/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL3NraW5jYXJlLnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .fat .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/dkJw00WkM2gzj6zx85N-Hw8Na3X1_G4V-VNnTKO8wnY/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2ZhdC5wbmc) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .blood_circulation .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/rB1Q3HjFQm_teat6bKTSEZ34JiZRzUZw0BE5D1L_0fE/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2Jsb29kX2NpcmN1bGF0aW9uLnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .liver .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/U42UAa-cp39jAGzftu9OzLrtJ9Cz-kijMpJGAsHfTfw/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2xpdmVyLnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .intestine .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/xmFVESTN45bxZGMpCMw0pp8UQReukauvhiktsvvJ-0M/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2ludGVzdGluZS5wbmc) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .sleep .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/ldlFd0lIfxK6m0ocgqsmsar75vym5plnu3eP558xNao/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL3NsZWVwLnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .immunity .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/ycxN-UcS2CMAgOoBMpOSlkGtQO-5EQTD57Qgv3d5TjE/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2ltbXVuaXR5LnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .cholesterol .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/kZQfKpEN1aePQh_mmtVq6x6it8_yXf-hLvkpcf-1lSY/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2Nob2xlc3Rlcm9sLnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .bones .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/db4H5Es2BAexMxmVzlACxzC1L9kLQemmsawI9CNPjSY/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2JvbmVzMi5wbmc) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .anti-aging .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/0dtK5dYrsf4vU8VoK5W_qtUxytCyecT_d_DTqOlkcXY/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2FudGktYWdpbmcucG5n) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .women .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/q0M09XsdLPKjk8HI9eEN04NgMMLxzWU0Yc5GnNsuyF4/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL3dvbWVuLnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .stomach .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/bHlVxdaNQd6uc11mkXVq-WeSVX3dmqDmckjeOSZMTX0/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL3N0b21hY2gucG5n) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .men .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/DcuMbV8F2YPJKBBkJCPrGevac7nu-_9ArXqKCoWF6qw/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL21lbi5wbmc) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .blood_pressure .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/76KNDnfgnkUzTgBioLm_N84OyzwiM17oTVyBb7SFdDo/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2Jsb29kX3ByZXNzdXJlLnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .strength .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/atB_jiWzEiNi-iN2OnnrcOUNvtrZn_dWypwPRllgXkk/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL3N0cmVuZ3RoLnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .brain .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/MFuRGlartQIX5LX5vd41oaQLN7NK4FlfRb3ctpEm0js/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2JyYWluLnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .blood_sugar .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/ueQnM7QZ_04uOH7gliNGOwFTqy3yO-Li-I9u9VzQA7M/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2Jsb29kX3N1Z2FyLnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .neutral_fat .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/kZQfKpEN1aePQh_mmtVq6x6it8_yXf-hLvkpcf-1lSY/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2Nob2xlc3Rlcm9sLnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .tooth .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/zSvVwv0pJY-GPW2tuhsf1-IHSH7Jqx_ygo4UPRQKREg/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL3Rvb3RoLnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .pregnant .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/VEQ70eVSCWQ-d-oHhsSNTfAPtA49jX-gbZlThGS9zBo/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL3ByZWduYW50LnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .hair_loss .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/I8HSfgYXVdBb7zHaG9sPl4Zlp4hynkg94Fjsm7e8K7Y/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2hhaXJfbG9zcy5wbmc) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .joint .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/mxvTxbMtPCqn5cISM6AxfrK2XFCQG3gFoqXklu-FH1w/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2pvaW50LnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .menopause .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/Dewk3IlumtR5hUS02edPNi8uSREyPMEU-CL31j8qHNc/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9zaWRlX2VmZmVjdHMvbWVub3BhdXNlLnBuZw) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .respiratory .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/twSYw4y256mq_JdGUIf-rmCUJndn9X95xfkrbZbYMao/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2JyZWF0aC5wbmc) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .thyroid .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/0dXEHLf-lYAgVVmOhGgYKwFFs3PEWjTrin_5AF4Rvbs/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL3RoeXJvaWQucG5n) center no-repeat;
        background-size: 45px 45px;
    }

    .health-wrap .anemia .txt-fix .h-icon {
        background: url(http://imgproxy.pillyze.io/liFTLnRRqcU8ptnEkyT0340I5L_WqLds8TXlo8iBfsU/rs:fill:100:100/czM6Ly9waWxseXplLXByZC1pbWFnZS9pY29ucy9oaWdzL2FuZW1pYS5wbmc) center no-repeat;
        background-size: 45px 45px;
    }

</style>
<meta http-equiv="origin-trial" content="A7CQXglZzTrThjGTBEn1rWTxHOEtkWivwzgea+NjyardrwlieSjVuyG44PkYgIPGs8Q9svD8sF3Yedn0BBBjXAkAAACFeyJvcmlnaW4iOiJodHRwczovL2RvdWJsZWNsaWNrLm5ldDo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjk1MTY3OTk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ=="><meta http-equiv="origin-trial" content="A3vKT9yxRPjmXN3DpIiz58f5JykcWHjUo/W7hvmtjgh9jPpQgem9VbADiNovG8NkO6mRmk70Kex8/KUqAYWVWAEAAACLeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXN5bmRpY2F0aW9uLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjk1MTY3OTk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ=="><meta http-equiv="origin-trial" content="A4A26Ymj79UVY7C7JGUS4BG1s7MdcDokAQf/RP0paks+RoTYbXHxceT/5L4iKcsleFCngi75YfNRGW2+SpVv1ggAAACLeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXRhZ3NlcnZpY2VzLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjk1MTY3OTk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ=="><meta http-equiv="origin-trial" content="As0hBNJ8h++fNYlkq8cTye2qDLyom8NddByiVytXGGD0YVE+2CEuTCpqXMDxdhOMILKoaiaYifwEvCRlJ/9GcQ8AAAB8eyJvcmlnaW4iOiJodHRwczovL2RvdWJsZWNsaWNrLm5ldDo0NDMiLCJmZWF0dXJlIjoiV2ViVmlld1hSZXF1ZXN0ZWRXaXRoRGVwcmVjYXRpb24iLCJleHBpcnkiOjE3MTk1MzI3OTksImlzU3ViZG9tYWluIjp0cnVlfQ=="><meta http-equiv="origin-trial" content="AgRYsXo24ypxC89CJanC+JgEmraCCBebKl8ZmG7Tj5oJNx0cmH0NtNRZs3NB5ubhpbX/bIt7l2zJOSyO64NGmwMAAACCeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXN5bmRpY2F0aW9uLmNvbTo0NDMiLCJmZWF0dXJlIjoiV2ViVmlld1hSZXF1ZXN0ZWRXaXRoRGVwcmVjYXRpb24iLCJleHBpcnkiOjE3MTk1MzI3OTksImlzU3ViZG9tYWluIjp0cnVlfQ==">

<style>
    html, body {
 			main
			position:relative;
			overflow-x:hidden;
		}
</style>

</head>