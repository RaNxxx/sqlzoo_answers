/*---------
Q1: ロシア（Russia）よりも人口(population)が多い国の名前を表示する
---------*/

SELECT name FROM world
  WHERE population > ( SELECT population FROM world WHERE name = 'Russia' )

/*---------
Q2: 国民一人当たりの国内総生産がイギリス 'United Kingdom' よりも大きなヨーロッパの国を表示する
---------*/

SELECT name FROM world
  WHERE continent = 'Europe' AND
  gdp/population > ( SELECT gdp/population FROM world WHERE name = 'United Kingdom' )

/*---------
Q3: 'Argentina'または'Australia'を含む大陸にある国の、国名と大陸を表示する。国名順に表示する
---------*/

SELECT name, continent FROM world
  WHERE continent = ( SELECT continent FROM world WHERE name = 'Argentina' )
  OR continent = ( SELECT continent FROM world WHERE name = 'Australia' )
  ORDER BY name

/*---------
Q4: 人口がカナダ Canadaよりも多く、ポーランドPolandよりも少ない国の、国名と人口を表示する
---------*/

SELECT name, population FROM world
  WHERE population > ( SELECT population FROM world WHERE name = 'Canada' )
  AND population < ( SELECT population FROM world WHERE name = 'Poland' )

/*---------
Q5: ヨーロッパの各国について 国名と人口を表示する。ドイツ人口の何％かで表示する
---------*/

SELECT name,
  ROUND(population /(SELECT population FROM world WHERE name = 'Germany' )*100) || '%'
  FROM world
    WHERE continent = 'Europe'

/*---------
Q6: ヨーロッパのどの国のGDPよりも大きなGDPを持つ国の国名だけを表示する。（GDPがNULL の国も有る）
---------*/

SELECT name FROM world
  WHERE gdp > ALL(SELECT gdp FROM world
                    WHERE continent = 'Europe' AND gdp > 0)

/*---------
Q7: 各大陸のもっとも大きな国（面積で）の大陸、国名、面積を表示する
---------*/

SELECT continent, name, (SELECT MAX(area) FROM world as e2 WHERE e1.continent = e2.continent)
  FROM world as e1
    WHERE e1.area >= (SELECT MAX(area) FROM world as e2 WHERE e1.continent = e2.continent)

/*---------
Q8: 各大陸の中でアルファベット順で先頭になる国の大陸と国名を表示
---------*/

SELECT continent, name FROM world as e1
  WHERE e1.name = (SELECT name FROM world as e2
    WHERE e1.continent = e2.continent
      ORDER BY continent, name
        LIMIT 1)

/*---------
Q9: 大陸に属する各国の人口が25000000以下である大陸を見つけ、それらの大陸に属する国の名前と大陸と人口を表示
---------*/

SELECT name, continent, population FROM world as e1
  WHERE 25000000 > ALL(SELECT population FROM world as e2
    WHERE e1.continent = e2.continent)

/*---------
Q10: 同じ大陸にある他の全ての国よりも３倍は大きな人口の国の、国名と大陸を表示
---------*/

SELECT name, continent FROM world as e1
  WHERE e1.population >= ALL(SELECT population*3 FROM world as e2
    WHERE e1.continent = e2.continent AND e1.name != e2.name)
