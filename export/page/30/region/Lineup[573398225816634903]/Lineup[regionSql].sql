select al.lineup_id,
       case 
           when  al.player_id is not null then
               '<span class="fa fa-times-circle-o"data-player-id="' || al.player_id || '"></span>'
           else
               null
           end as player_id,
       al.position,
       (select player_fullname
          from ath_nba_dk_players dp
         where player_id = al.player_id
         fetch first 1 rows only) as player_fullname, 
       (select salary
          from ath_nba_dk_players dp
         where player_id = al.player_id
         order by created
         fetch first 1 rows only) salary,
       round(ps.fps,2) as fps
  from ath_nba_lineups al, 
       ath_nba_dk_player_stats ps
 where al.player_id = ps.player_id(+)
   and al.lineup_id = :P30_LINEUP_ID

       