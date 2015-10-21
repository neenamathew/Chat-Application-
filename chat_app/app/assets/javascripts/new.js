 $(document).ready(function() {

 //new todo
   $('.group_new').change(function(){
      var new_group = $(this).val();

      alert(new_group);
    
       alert(cookies);
      $.ajax({
        method: 'POST',
        url:'/sessions/'+session_id+'/groups',
        cache: false,
        data: {name: new_group},
        success: function(html){
         }
      });
      $(".group_new").val('');

    });

});