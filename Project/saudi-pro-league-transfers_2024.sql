use saudi_pro_league_transfers_2024

select * from [saudi_pro_league_transfers_2024];

select  COUNT (distinct club_name) 'Count Of Clubs' from saudi_pro_league_transfers_2024

select  COUNT (player_name) 'Count Of Players' from saudi_pro_league_transfers_2024

select  club_name , sum(Fees) 'sum' from saudi_pro_league_transfers_2024
group by club_name
having  sum(Fees) > 0
order by sum(Fees) desc


select  club_name , count(player_name) 'sum' from saudi_pro_league_transfers_2024
group by club_name , transfer_movement
having transfer_movement = 'in'
order by count(player_name) desc

select sum(Fees) 'Sum Of Fees For Season' from saudi_pro_league_transfers_2024 --£620,077,000
