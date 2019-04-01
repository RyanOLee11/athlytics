select nl.lineup_id,
       listagg('<div class="lineup-cell"> <span class="lineup-position">'|| nl.position || '</span><span class="lineup_player">' || tp.player_fullname || '</span>','</div>') within group(order by nl.position) players
  from ath_nba_lineups nl,
       ath_dk_todays_players tp
 where nl.player_id = tp.player_id
group by nl.lineup_id
order by nl.lineup_id