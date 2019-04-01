apex.message.clearErrors();


apex.server.process('REMOVE_PLAYER', {
  x01: $v('P1_PLAYER_ID'),
  x02: $v('P1_LINEUP_ID')  
}, {
  success: function (data) {
    if(data.l_return_status == 'success'){
         apex.message.showPageSuccess(data.l_return_msg);
         apex.region("lineups-classic-report").refresh();
    }else{
        apex.message.showErrors({
        type:       "error",
        location:   "page",
        message:    data.l_return_msg,
        unsafe:     false
    });
    }    
        
    }
  });
