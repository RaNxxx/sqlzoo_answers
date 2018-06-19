/*---------
URL : http://sqlzoo.net/wiki/The_JOIN_operation/ja
---------*/

/*---------
Q1 : matchid と player 名をドイツ(Germany)チームの全ゴールについて表示する
---------*/
SELECT  matchid, player FROM goal WHERE teamid = 'GER'


/*---------
Q2 : 試合 1012 の id, stadium, team1, team2 を表示する
---------*/
SELECT id,stadium,team1,team2
  FROM game
  WHERE id = 1012


/*---------
Q3 : ドイツの全ゴールについて player, teamid ,stadium, mdate を表示するように修正する
---------*/
SELECT player, teamid ,stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'GER'


/*---------
Q4 : Marioという名前の選手のゴールについて、team1, team2 , player を表示する。player LIKE 'Mario%'
---------*/
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
  WHERE player LIKE 'Mario%'


/*---------
Q5 : 最初の１０分間でゴールしたという条件で、 player, teamid, coach, gtime を表示。gtime<=10
---------*/
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=eteam.id)
  WHERE gtime<=10


/*---------
Q6 : team1のコーチcoachが 'Fernando Santos' となる試合日mdateとチーム名teamnameを表示
---------*/
SELECT mdate, teamname
FROM game JOIN eteam ON (team1 = eteam.id)
WHERE eteam.coach = 'Fernando Santos'


/*---------
Q7 : 'National Stadium, Warsaw' スタジアムで開催された試合でゴールした選手を表示する
---------*/
SELECT player
FROM goal JOIN game ON (matchid = game.id)
WHERE game.stadium = "National Stadium, Warsaw"


/*---------
Q8 : ドイツと対戦して、ゴールした選手の名前を全て表示する
---------*/
SELECT DISTINCT(goal.player)
FROM game JOIN goal ON matchid = id
WHERE teamid <> 'GER'
AND (team1='GER' OR team2='GER')


/*---------
Q9 : チーム名teamnameとゴール数の合計を表示する
---------*/
SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON (id = goal.teamid)
GROUP BY teamname


/*---------
Q10 : スタジアムstadiumの名前と、そのスタジアムでのゴール数を各スタジアムごとに表示する
---------*/
SELECT stadium, COUNT(*)
FROM game JOIN goal ON (id = matchid)
GROUP BY stadium


/*---------
Q11 : 'ポーランド（POL）が参戦している全試合の matchid と 日程 とその試合のゴール数 を表示する
---------*/
SELECT matchid, mdate, COUNT(*)
FROM game JOIN goal ON (id = goal.matchid)
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY matchid


/*---------
Q12 : ドイツ'GER'が得点した試合の matchid と 日程 と ドイツの得点 を表示する
---------*/
SELECT matchid, mdate, COUNT(*)
FROM game JOIN goal ON (id = goal.matchid)
WHERE teamid = 'GER'
GROUP BY matchid


/*---------
Q13 : 下に示す様に、各試合ごとに各チームの得点を表示する。 この問題は、ここまでまだ未解説のSQL構文「CASE WHEN」を使用する
---------*/
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
  GROUP BY mdate, team1
