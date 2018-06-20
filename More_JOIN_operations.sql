/* More Join Operations */
/* https://sqlzoo.net/wiki/More_JOIN_operations/ja */

/* Q1: 1962 年の映画のリストを表示（ id と title を表示） */
SELECT id, title
 FROM movie
 WHERE yr=1962

/* Q2: 'Citizen Kane'の年を示す' */
SELECT yr FROM movie
WHERE title = 'Citizen Kane'

/* Q3: スタートレック（'Star Trek'）というシリーズ映画のリストを表示（ id title yr ）。 年の順に掲載 */
SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'

/* Q4: 女優 'Glenn Close' 　の id ナンバーは何ですか */
SELECT id FROM actor
WHERE name = 'Glenn Close'

/* Q5: 映画 'Casablanca' カサブランカの id は何ですか */
SELECT id FROM movie
WHERE title = 'Casablanca'

/* Q6: 映画カサブランカの出演リスト(name)を出力する。'Casablanca'出演リストとは? movieid=11768を使う */
SELECT a.name FROM casting AS c
LEFT JOIN actor AS a ON c.actorid=a.id
WHERE movieid=11768

/* Q7: 映画「エイリアン」'Alien'の出演者リストを表示 */
SELECT a.name FROM movie AS m
LEFT JOIN casting AS c ON c.movieid=m.id
LEFT JOIN actor AS a ON c.actorid=a.id
WHERE title = 'Alien'

/* Q8: 'Harrison Ford'  ハリソン＝フォードが出演した映画のリストを表示する */
SELECT m.title FROM movie AS m
LEFT JOIN casting AS c ON c.movieid=m.id
LEFT JOIN actor AS a ON c.actorid=a.id
WHERE a.name = 'Harrison Ford'

/* Q9: 'Harrison Ford'ハリソン＝フォードが出演した映画で、彼が主演していない(ord <> 1） のリストを表示 */
SELECT m.title FROM movie AS m
LEFT JOIN casting AS c ON c.movieid=m.id
LEFT JOIN actor AS a ON c.actorid=a.id
WHERE a.name = 'Harrison Ford' AND c.ord <>1

/* Q10: 1962年の全映画を、そのタイトルと主演と併記してリスト表示 */
SELECT m.title, a.name FROM movie AS m
LEFT JOIN casting AS c ON c.movieid=m.id
LEFT JOIN actor AS a ON c.actorid=a.id
WHERE m.yr=1962 AND c.ord = 1

/* Q11: 'John Travolta' ジョン＝トラボルタが最も忙しかった年はいつですか？ その年と出演した映画の本数を表示する。
彼が２本より多く出演した各年について表示する */
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)

/* Q12: 'Julie Andrews' ジュリー＝アンドリューズが出演した映画について、主演した役者の名前を調べ、その全てについて タイトル と 主演 を表示する */
SELECT m.title, a.name FROM movie AS m
LEFT JOIN casting AS c ON c.movieid=m.id
LEFT JOIN actor AS a ON c.actorid=a.id
WHERE c.ord=1
GROUP BY m.id
HAVING m.id IN
(
SELECT m.id FROM movie AS m
LEFT JOIN casting AS c ON c.movieid=m.id
LEFT JOIN actor AS a ON c.actorid=a.id
WHERE a.name = 'Julie Andrews')

/* Q13: 少なくとも３０タイトル以上に主演した役者の名前をアルファベット順に掲載 */
SELECT a.name FROM casting AS c
JOIN actor AS a ON a.id=c.actorid
WHERE c.ord=1
GROUP BY a.id
HAVING Count(c.movieid)>=30

/* Q14: 1978年の映画を、出演者数が多い順に、タイトルを表示 */
SELECT m.title,Count(c.actorid) AS number FROM movie AS m
JOIN casting AS c ON c.movieid=m.id
WHERE m.yr=1978
GROUP BY m.id
ORDER BY number DESC, title

/* Q15: 'Art Garfunkel' アート＝ガーファンクルと一緒に仕事をした人々をすべて表示 */
SELECT a.name FROM casting AS c
JOIN actor AS a ON c.actorid=a.id
WHERE a.name <> 'Art Garfunkel'  AND
c.movieid IN
(
SELECT c.movieid FROM movie AS m
JOIN casting AS c ON c.movieid=m.id
JOIN actor AS a ON c.actorid=a.id
WHERE a.name='Art Garfunkel'
)
