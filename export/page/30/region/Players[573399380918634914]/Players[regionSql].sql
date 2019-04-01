select distinct dk.player_id, 
       dk.player_fullname,
       dk.position, 
       dk.own_team,
       dk.salary
  from ath_dk_todays_players dk
order by dk.salary desc

 