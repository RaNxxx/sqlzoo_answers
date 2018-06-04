/*---------
URL : http://sqlzoo.net/wiki/SUM_and_COUNT/ja
---------*/

/*---------
Q1 : 世界の総人口を表示
---------*/
SELECT SUM(population)
  FROM world


/*---------
Q2 : 大陸名を重複しないように表示
---------*/
SELECT DISTINCT continent FROM world


/*---------
Q3 : アフリカAfrica の各国のgdpの合計を求める
---------*/
SELECT SUM(gdp) FROM world
  WHERE continent = 'Africa'


/*---------
Q4 : 面積が少なくとも 1000000　以上の国の数を求める
---------*/
SELECT Count(name) FROM world
  WHERE area > 1000000


/*---------
Q5 : Estonia', 'Latvia', 'Lithuania' の人口合計を求める
---------*/
SELECT SUM(population) FROM world
  WHERE name IN ('Estonia', 'Latvia', 'Lithuania')


/*---------
Q6 : 各大陸continentごとに大陸名continentとそこの国の数を表示する
---------*/
SELECT continent, Count(name) FROM world
  GROUP BY continent


/*---------
Q7 : 各大陸の人口が10000000人以上の国を数え、大陸名とその数を表示する
---------*/
SELECT continent, Count(name) FROM world
  WHERE population > 10000000
    GROUP BY continent
    HAVING SUM(population)


/*---------
Q8 : その大陸の各国の人口の合計が１00000000人以上の大陸のリストを表示する
---------*/
SELECT continent FROM world as e1
  GROUP BY continent
  HAVING SUM(population) > 100000000
