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



/*---------
Q1:
---------*/

/*---------
Q1:
---------*/

/*---------
Q1:
---------*/

/*---------
Q1:
---------*/

/*---------
Q1:
---------*/

/*---------
Q1:
---------*/
