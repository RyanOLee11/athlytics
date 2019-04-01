select PLAYER_ID,
       OWN_TEAM,
       PLAYER_FULLNAME,
       POSITION,
       STARTER,
       INJURED
  from ATH_PLAYERS
 where upper(own_team) = upper(nvl(:P20_OWN_TEAM, own_team))
 order by own_team asc, player_fullname asc