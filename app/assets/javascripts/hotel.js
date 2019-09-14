$(document).on("turbolinks:load", function() {
  WindowIndexSize ();
  AllCommentShow();
  MemoCommentShow();
  
    // スマホとPC表示を切り換えた時
  $(window).on( 'resize', function() {
    WindowIndexSize ();
  });
  
   // 入力文字数
  $(document).on("keyup paste", ".letter", function (e) {
    var txt = $(this).val();
    var new_txt = $.trim(txt.replace(/\n/g, ""));
    var count = new_txt.length;
    $(".letter_count").text("入力文字数:"+count);
  });
  
  //top画面での画像のモーダル表示(PC)
  $('.hotel_sample').click(function() {
    var picture = $(this).data("id");
    $('.modal-body').children('img').attr('src', picture);
  });
  
  //top画面での画像のモーダル表示(スマホ)
  $('.hotel_sp_sample').click(function() {
    var picture = $(this).data("id");
    $('.modal-body').children('img').attr('src', picture);
  });
  

  //スマホとPCのselectについて
  function WindowIndexSize (){
    var w = $(window).width();
    var x = 768
    if(w > x){
      $(".state").attr("id","maxRows");
      $(".post_state").attr("id","maxpostRows");
    }else{
      $(".state").attr("id","maxspRows");
      $(".post_state").attr("id","maxsppostRows");
    }
	};
  
  //コメント投稿一覧画面についてコメントのスライド表示
  function AllCommentShow(){
    $(".all_comment").hide();
    $('.comment_title').click(function(e) {
      e.preventDefault();
      $(this).siblings(".all_comment").slideToggle();
    });
  }
  
  //お気に入り一覧画面のメモと自身のコメント投稿画面の一部表示と全表示の切り替え
  function MemoCommentShow(){
    $(".all_display").hide();
    $(".partical_display").show();
    $(".continue").click(function() {
      if($(this).hasClass('hotel_close')){
        $(this).siblings(".all_display").show();
        $(this).siblings(".partical_display").hide();
        $(this).removeClass("hotel_close");
        $(this).text("<部分表示にする>");
      }else{
        $(this).siblings(".all_display").hide();
        $(this).siblings(".partical_display").show();
        $(this).addClass("hotel_close");
        $(this).text("<続きを表示する>");
      }
    });
  }
});


 
  
  

