select distinct dk.player_id, 
       dk.player_fullname,
       dk.position, 
       dk.own_team
  from ath_dk_todays_players dk
 where upper(dk.player_fullname) like '%' || upper(nvl(:P50_SEARCH,dk.player_fullname)) || '%' 
    or upper(dk.position) like '%' || upper(nvl(:P50_SEARCH,dk.position)) || '%' 
    or upper(dk.own_team) like '%' || upper(nvl(:P50_SEARCH,dk.own_team)) || '%' 

 