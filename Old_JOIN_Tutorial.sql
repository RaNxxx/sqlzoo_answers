/*---------
URL : https://sqlzoo.net/wiki/Old_JOIN_Tutorial
---------*/

/* Q1: Show the athelete (who) and the country name for medal winners in 2000. */
SELECT who, country.name
  FROM ttms JOIN country
         ON (ttms.country=country.id)
 WHERE games = 2000

/* Q2: Show the who and the color of the medal for the medal winners from 'Sweden' */
SELECT who, color
FROM ttms JOIN country ON (ttms.country=country.id)
WHERE country.name = 'Sweden'

/* Q3: Show the years in which 'China' won a 'gold' medal. */
SELECT games
FROM ttms JOIN country ON (ttms.country=country.id)
WHERE country.name = 'China' AND color = 'gold'

/* Q4:  Show who won medals in the 'Barcelona' games. */
SELECT who
  FROM ttws JOIN games
            ON (ttws.games=games.yr)
  WHERE city = 'Barcelona'

/* Q5:  Show which city 'Jing Chen' won medals. Show the city and the medal color */
SELECT city, color
FROM ttws JOIN games ON (ttws.games=games.yr)
WHERE ttws.who = 'Jing Chen'

/* Q6:  Show who won the gold medal and the city */
SELECT who, city
FROM ttws JOIN games ON (ttws.games=games.yr)
WHERE color = 'gold'

/* Q7:
Show the games and color of the medal won by the team that includes 'Yan Sen' */
SELECT games, color
FROM ttmd JOIN team ON (ttmd.team = team.id)
WHERE team.name = 'Yan Sen'

/* Q8:  Show the 'gold' medal winners in 2004 */
SELECT name
FROM ttmd JOIN team ON (ttmd.team = team.id)
WHERE color = 'gold' AND games = 2004

/* Q9:  Show the name of each medal winner country 'FRA'*/
SELECT name
FROM ttmd JOIN team ON (ttmd.team = team.id)
WHERE country = 'FRA'
