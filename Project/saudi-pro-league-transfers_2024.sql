USE saudi_pro_league_transfers_2024

-- Retrieve All Data 
SELECT *
FROM [saudi_pro_league_transfers_2024];

-- عدد الاندية
SELECT COUNT(DISTINCT club_name) 'Count Of Clubs'
FROM saudi_pro_league_transfers_2024

-- عدد اللاعبيين اللي تم التعاقد معهم 
SELECT COUNT(player_name) 'Count Of Players'
FROM saudi_pro_league_transfers_2024
WHERE transfer_movement = 'in'

-- مصاريف كل نادي 
SELECT club_name
	,sum(Fees) 'sum'
FROM saudi_pro_league_transfers_2024
GROUP BY club_name
HAVING sum(Fees) > 0
ORDER BY sum(Fees) DESC

-- لكل نادي in عدد اللاعبيين 
SELECT club_name
	,count(player_name) 'sum'
FROM saudi_pro_league_transfers_2024
GROUP BY club_name
	,transfer_movement
HAVING transfer_movement = 'in'
ORDER BY count(player_name) DESC

--  لكل نادي out عدد اللاعبيين 
SELECT club_name
	,count(player_name) 'sum'
FROM saudi_pro_league_transfers_2024
GROUP BY club_name
	,transfer_movement
HAVING transfer_movement = 'out'
ORDER BY count(player_name) DESC

-- out / in عدد اللاعبيين 
SELECT transfer_movement
	,count(transfer_movement) 'sum transfer movement'
FROM saudi_pro_league_transfers_2024
GROUP BY transfer_movement
ORDER BY count(transfer_movement) DESC

-- مجموع المصاريف الانتقالات (Total in / out) 
SELECT sum(Fees) 'Sum Of Fees For Season'
FROM saudi_pro_league_transfers_2024 --£620,077,000

-- مجموع المصاريف الانتقالات (Total in / out) 
SELECT transfer_movement
	,sum(Fees) 'Sum Of Fees For Season'
FROM saudi_pro_league_transfers_2024 -- £606,924,000 / £131,530,000
GROUP BY transfer_movement

-- الفئات العمرية
SELECT age
	,count(age) 'Number Of Players Group By Age'
FROM saudi_pro_league_transfers_2024
GROUP BY age
ORDER BY count(age) DESC


SELECT position ,  COUNT(position) 'Num Of Positions'
FROM saudi_pro_league_transfers_2024
GROUP BY position