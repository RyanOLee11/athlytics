select al.lineup_id,
       case 
           when  al.player_id is not null then
               '<span class="fa fa-times-circle-o"data-player-id="' || al.player_id || '"></span>'
           else
               null
           end as player_id,
       al.position as POSITION,
       (select player_fullname
          from ath_nba_dk_players dp
         where player_id = al.player_id
         fetch first 1 rows only) as player_fullname, 
       (select salary
          from ath_nba_dk_players dp
         where player_id = al.player_id
         order by dp.created
         fetch first 1 rows only) salary,
       round(ps.proj_fps,2) as proj_fps,
       tt.team_color
  from ath_nba_lineups al, 
       ath_dk_todays_players ps,
       ath_teams tt
 where al.player_id = ps.player_id(+)
   and upper(ps.own_team) = upper(tt.initials)
   and al.lineup_id = :P1_LINEUP_ID

       