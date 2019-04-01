with team as(  select team_id,
                      team_name_dk,
       rank() over ( order by over_defense nulls last) as over_defense_rnk
 from ath_nba_dk_team_stats
 where over_defense is not null),
 
positions as (select team_id,
           position, 
           rank() over (partition by position order by position_defense nulls last) as over_defense_rnk
 from ath_nba_dk_team_stats
 where over_defense is null)
 
 
select team.team_id,
       team.team_name_dk,
       team.over_defense_rnk,
        (select over_defense_rnk
         from positions 
         where position = 'C'
           and positions.team_id = team.team_id) as C_Rank,
           
           (select over_defense_rnk
         from positions 
         where position = 'PF'
           and positions.team_id = team.team_id) as PF_Rank,
           
           (select over_defense_rnk
         from positions 
         where position = 'PF/C'
           and positions.team_id = team.team_id) as "PF/C_Rank",
           
           (select over_defense_rnk
         from positions 
         where position = 'PG'
           and positions.team_id = team.team_id) as PG_Rank,
           
           (select over_defense_rnk
         from positions 
         where position = 'PG/SG'
           and positions.team_id = team.team_id) as "PG/SG_Rank",
           
           (select over_defense_rnk
         from positions 
         where position = 'PG/SF'
           and positions.team_id = team.team_id) as "PG/SF_Rank",
           
           (select over_defense_rnk
         from positions 
         where position = 'SG'
           and positions.team_id = team.team_id) as SG_Rank,
           
           (select over_defense_rnk
         from positions 
         where position = 'SG/SF'
           and positions.team_id = team.team_id) as "SG/SF_Rank",
           
           (select over_defense_rnk
         from positions 
         where position = 'SF'
           and positions.team_id = team.team_id) as SF_Rank,
           
           (select over_defense_rnk
         from positions 
         where position = 'SF/PF'
           and positions.team_id = team.team_id) as "SF/PF_Rank"
  from team
  order by team.team_name_dk