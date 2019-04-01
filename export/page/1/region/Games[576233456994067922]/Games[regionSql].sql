select distinct t.team_id as t1ID,
       t2.team_id as t2ID,
       upper(t.initials) as home_team,
       upper(t2.initials) as visiting_team
from ath_dk_todays_players tp,
       ath_teams t,
       ath_teams t2
where upper(tp.own_team) = upper(t.initials)
  and upper(tp.opp_team)= upper(t2.team_name)
