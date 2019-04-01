declare
    l_return_status varchar2(300);
    l_return_msg varchar2(2000);
begin 
    
    ath_logic_pkg.nba_remove_player(
    p_player_id => apex_application.g_x01,
    p_lineup_id => apex_application.g_x02,
    p_return_status => l_return_status, 
    p_return_message => l_return_msg 
    );
    
    apex_json.open_object;
    apex_json.write('l_return_status', l_return_status);
    apex_json.write('l_return_msg', l_return_msg);
    apex_json.close_object;
exception
    when others then
        apex_json.open_object;
        apex_json.write('l_return_status', l_return_status);
        apex_json.write('l_return_msg', l_return_msg);
        apex_json.close_object;
end;