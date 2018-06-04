/*---------
URL : http://sqlzoo.net/wiki/The_nobel_table_can_be_used_to_practice_more_SUM_and_COUNT_functions./ja
---------*/

/*---------
Q1 : Show the total number of prizes awarded.
---------*/
SELECT Count(subject) FROM nobel


/*---------
Q2 : List each subject - just once
---------*/
SELECT DISTINCT subject FROM nobel


/*---------
Q3 :　Show the total number of prizes awarded for Physics
---------*/
SELECT Count(subject) FROM nobel
  WHERE subject = 'Physics'


/*---------
Q4 : For each subject show the subject and the number of prizes
---------*/
SELECT subject, Count(subject) FROM nobel
  GROUP BY subject


/*---------
Q5 : For each subject show the first year that the prize was awarded
---------*/
SELECT subject,MIN(yr) FROM nobel
  GROUP BY subject


/*---------
Q6 : For each subject show the number of prizes awarded in the year 2000
---------*/
SELECT subject, Count(subject) FROM nobel
  WHERE yr = 2000
  GROUP BY subject


/*---------
Q7 : Show the number of different winners for each subject
---------*/
SELECT subject, Count(DISTINCT winner) FROM nobel
  GROUP BY subject


/*---------
Q8 : For each subject show how many years have had prizes awarded
---------*/
SELECT subject, Count(DISTINCT yr) FROM nobel
  GROUP BY subject


/*---------
Q9 : Show the years in which three prizes were given for Physics
---------*/
SELECT yr FROM nobel WHERE subject = 'Physics'
  GROUP BY yr
  HAVING Count(yr) = 3


/*---------
Q10 : Show winners who have won more than once
---------*/
SELECT winner FROM nobel
  GROUP BY winner
  HAVING Count(subject) > 1


/*---------
Q11 : Show winners who have won more than one subject
---------*/
SELECT winner FROM nobel
  GROUP BY winner
  HAVING Count(DISTINCT subject) > 1


/*---------
Q12 : Show the year and subject where 3 prizes were given. Show only years 2000 onwards
---------*/
SELECT yr, subject FROM nobel
  WHERE yr >= 2000
  GROUP BY yr, subject
  HAVING Count(yr||subject) = 3
