$(document).on("turbolinks:load", function() {
  var widthFlag = "sp";
  var widthnewFlag = "sp";
  WindowPostNewSize ();
  WindowPostEditSize ();
//スマホとPCのコメント登録画面について
  function WindowPostNewSize (){
    var sp_hotel = $('#sp_post_hotel').data("id");
    var w = $(window).width();
    var x = 768;
    if(w > x && widthnewFlag != 'pc'){
      widthnewFlag = "pc";
      $(".hotel_new_post_sp_text").remove();
      if(!($('.hotel_new_post_text').length)){
        if(sp_hotel == false){
          $(".text_new_post_form").append('<textarea cols="20" rows="5" name="post[comment]" class="hotel_new_post_text letter"></textarea>');
        }else{
          $(".text_new_post_form").append('<p class="hotel_new_post_text">登録済み</p>');  
        }
      }
    }else if(x > w && widthnewFlag != 'sp'){
    　widthnewFlag = "sp";
      $(".hotel_new_post_text").remove();
      if(!($('.hotel_new_post_sp_text').length)){
        if(sp_hotel == false){
          $(".text_new_post_sp_form").append('<textarea cols="20" rows="5" name="post[comment]" class="hotel_new_post_sp_text letter"></textarea>');
        }else{
          $(".text_new_post_sp_form").append('<p class="hotel_new_post_sp_text">登録済み</p>');  
        }
      }
    }
  };
  
  //スマホとPCのコメント編集画面について
  function WindowPostEditSize (){
    var w = $(window).width();
    var x = 768;
    if(w > x && widthFlag != 'pc'){
      widthFlag = "pc"
      var comment = $(".hotel_edit_post_sp_text").text();
      $(".hotel_edit_post_sp_text").remove();
      if(!($('.hotel_edit_post_text').length)){
        $(".text_edit_post_form").append('<textarea cols="20" rows="5" name="post[comment]" class="hotel_edit_post_text letter">'+comment+'</textarea>');
      }
    }else if(x > w && widthFlag != 'sp'){
      widthFlag = "sp"
      var comment = $(".hotel_edit_post_text").text();
      $(".hotel_edit_post_text").remove();
      if(!($('.hotel_edit_post_sp_text').length)){
        $(".text_edit_post_sp_form").append('<textarea cols="20" rows="5" name="post[comment]" class="hotel_edit_post_sp_text letter">'+comment+'</textarea>');
      }
    }
  };
  
   // スマホとPC表示を切り換えた時
  $(window).on( 'resize', function() {
    WindowPostNewSize ();
    WindowPostEditSize ();
  });
});