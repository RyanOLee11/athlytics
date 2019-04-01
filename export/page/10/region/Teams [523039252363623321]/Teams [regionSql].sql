select team_id, 
       team_name, 
       dbms_lob.getlength(team_pic) team_pic,
       apex_page.get_url (
                          p_page => 20
                        , p_clear_cache => 20
                        , p_items => 'P20_OWN_TEAM' 
                        , p_values => rtrim(upper(team_name), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')
                         )as card_link  
  from ath_teams
