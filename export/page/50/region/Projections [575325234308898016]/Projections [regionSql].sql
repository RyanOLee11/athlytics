select tp.player_id,
       tp.player_fullname as PLAYER_FULLNAME,
       round(tp.proj_fps,2) as PROJ_FPS,
       tp.position as POSITION,
       tt.team_color as TEAM_COLOR
  from ath_dk_todays_players tp,
       ath_teams tt   
 where upper(tp.own_team) = upper(tt.initials)
   and tp.player_id = (select player_id
                         from ath_dk_todays_players
                        where position = tp.position
                        order by proj_fps desc nulls last 
                        fetch first 1 rows only)