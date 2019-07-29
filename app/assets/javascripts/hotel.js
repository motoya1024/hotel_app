$(document).on("ready turbolinks:load", function() {
// jsを記載
 //地図の画像のモーダル表示
 $('.picture').click(function() {
    var picture = $(this).data("id");
    $('.modal-body').children('img').attr('src', picture);
 });
 
 $('.map').click(function() {
    var picture = $(this).data("id");
    console.log(picture);
    $('.modal-body').children('img').attr('src', picture);
 });
 // 入力文字数
 $(document).on("keyup paste", ".letter", function (e) {
    var txt = $(this).val();
    var new_txt = $.trim(txt.replace(/\n/g, ""));
    var count = new_txt.length;
    $(".letter_count").text("入力文字数:"+count);
 });
 
//edit,new
 var widthFlag = "sp";
 var sp_hotel = $('#sp_hotel').data("id");
 var widthnewFlag = "sp"
  
 function windoweditsize (){
    var w = $(window).width();
    var x = 768
    if(w > x && widthFlag != 'pc'){
       widthFlag = "pc"
       var comment = $(".hotel_edit_sp_text").text();
       $(".hotel_edit_sp_text").remove();
       if(!($('.hotel_edit_text').length)){
           $("#text_edit_form").append('<textarea cols="20" rows="5" name="hotel[comment]" class="hotel_edit_text letter">'+comment+'</textarea>');
       }
    }else if(x > w && widthFlag != 'sp'){
       widthFlag = "sp"
       var comment = $(".hotel_edit_text").text();
       $(".hotel_edit_text").remove();
       if(!($('.hotel_edit_sp_text').length)){
           $("#text_edit_sp_form").append('<textarea cols="20" rows="5" name="hotel[comment]" class="hotel_edit_sp_text letter">'+comment+'</textarea>');
       }
    }
 };
 
  function windownewsize (){
    var w = $(window).width();
    var x = 768
    if(w > x && widthnewFlag != 'pc'){
       widthnewFlag = "pc"
       $(".hotel_new_sp_text").remove();
       if(!($('.hotel_new_text').length)){
           if(sp_hotel == false){
              $("#text_form").append('<textarea cols="20" rows="5" class="hotel_new_text letter"></textarea>');
           }else{
              $("#text_form").append('<p class="hotel_new_text">登録済み</p>');  
           }
       }
    }else if(x > w && widthnewFlag != 'sp'){
       widthnewFlag = "sp"
       $(".hotel_new_text").remove();
       if(!($('.hotel_new_sp_text').length)){
           if(sp_hotel == false){
              $("#text_sp_form").append('<textarea cols="20" rows="5" class="hotel_new_sp_text letter"></textarea>');
           }else{
              $("#text_sp_form").append('<p class="hotel_new_sp_text">登録済み</p>');  
           }
       }
    }
  };
  
  $(window).on( 'load resize', function() {
      windownewsize();
      windoweditsize();
     
  });
 
   windoweditsize();
   windownewsize();

});