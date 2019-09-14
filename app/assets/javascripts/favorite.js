$(document).on("turbolinks:load", function() {
  var widthFlag = "sp";
  var widthnewFlag = "sp";
  WindowFavoriteNewSize ();
  WindowFavoriteEditSize ();
  SpMemoShow();
  //スマホとPCのお気に入り登録画面について
  function WindowFavoriteNewSize (){
    var sp_hotel = $('#sp_hotel').data("id");
    var w = $(window).width();
    var x = 768;
    if(w > x && widthnewFlag != 'pc'){
       widthnewFlag = "pc";
       $(".hotel_new_sp_text").remove();
       if(!($('.hotel_new_text').length)){
         if(sp_hotel == false){
           $(".text_form").append('<textarea cols="20" rows="5" name="favorite[memo]" class="hotel_new_text letter"></textarea>');
         }else{
           $(".text_form").append('<p class="hotel_new_text">登録済み</p>');  
         }
       }
    }else if(x > w && widthnewFlag != 'sp'){
       widthnewFlag = "sp";
       $(".hotel_new_text").remove();
       if(!($('.hotel_new_sp_text').length)){
         if(sp_hotel == false){
           $(".text_sp_form").append('<textarea cols="20" rows="5" name="favorite[memo]" class="hotel_new_sp_text letter"></textarea>');
         }else{
           $(".text_sp_form").append('<p class="hotel_new_sp_text">登録済み</p>');  
         }
       }
    }
  };
  
  //スマホとPCのお気に入り編集画面について
  function WindowFavoriteEditSize (){
    var w = $(window).width();
    var x = 768
    if(w > x && widthFlag != 'pc'){
      widthFlag = "pc"
      var memo = $(".hotel_edit_sp_text").text();
      $(".hotel_edit_sp_text").remove();
      if(!($('.hotel_edit_text').length)){
        $(".text_edit_form").append('<textarea cols="20" rows="5" name="favorite[memo]" class="hotel_edit_text letter">'+memo+'</textarea>');
      }
    }else if(x > w && widthFlag != 'sp'){
      widthFlag = "sp"
      var memo = $(".hotel_edit_text").text();
      $(".hotel_edit_text").remove();
      if(!($('.hotel_edit_sp_text').length)){
        $(".text_edit_sp_form").append('<textarea cols="20" rows="5" name="favorite[memo]" class="hotel_edit_sp_text letter">'+memo+'</textarea>');
      }
    }
  };
  
  // スマホとPC表示を切り換えた時
  $(window).on( 'resize', function() {
    WindowFavoriteNewSize ();
    WindowFavoriteEditSize ();
  });
  
  //　お気に入り一覧画面のメモの表示と非表示の切り替え
  function SpMemoShow(){
    $(".sp_memo").hide();
    $(".memo_display").click(function() {
      if($(this).hasClass('hotel_close')){
        $(this).siblings(".sp_memo").show();
        $(this).removeClass("hotel_close");
        $(this).text("<メモを非表示にする>");
      }else{
        $(this).siblings(".sp_memo").hide();
        $(this).addClass("hotel_close");
        $(this).text("<メモを表示する>");
      }
    });
  }
  
});