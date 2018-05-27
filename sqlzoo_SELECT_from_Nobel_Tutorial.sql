/*---------
Q1: 1950年度のノーベル賞受賞者を表示するようにクエリーを修正する
---------*/

SELECT yr,subject,winner FROM nobel
  WHERE yr = 1950

/*---------
Q2: ノーベル文学賞（Literature）を1962年に受賞した人を表示
---------*/

SELECT winner FROM nobel
  WHERE subject = 'Literature' AND yr = 1962

/*---------
Q3: アルバート・アインシュタイン(Albert Einstein)がノーベル賞を受賞した年と分野を表示
---------*/

SELECT yr, subject FROM nobel
  WHERE winner = 'Albert Einstein'

/*---------
Q4: ノーベル平和賞( subject が Peace ）の　２０００年以降（２０００を含む）の受賞者名を表示
---------*/

SELECT winner FROM nobel
  WHERE subject = 'Peace' AND yr >= 2000

/*---------
Q5: 1980から1989年の間のノーベル文学賞について、年度、分野、受賞者の全ての詳細を表示する
---------*/

SELECT yr, subject, winner FROM nobel
  WHERE yr <=1989 AND yr >= 1980 AND subject = 'Literature'

/*---------
Q6: 次の大統領の受賞内容の詳細を表示する。
テオドール＝ルーズベルト　Theodore Roosevelt
ウッドロウ＝ウィルソン　Woodrow Wilson
ジミー＝カーター　Jimmy Carter
バラク＝オバマ　Barack Obama
---------*/

SELECT yr,subject,winner FROM nobel
  WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

/*---------
Q7: ファーストネームが John の受賞者を表示
---------*/
SELECT winner FROM nobel
  WHERE winner LIKE  'John%'

/*---------
Q8: 1980年のノーベル物理賞 physics の受賞者　と　1984年の化学賞 chemistry の受賞者を共に表示する
---------*/
SELECT yr,subject,winner FROM nobel
  WHERE (yr = 1980 AND subject = 'physics') OR (yr = 1984 AND subject = 'chemistry')

/*---------
Q9: 1980年の　化学 Chemistry と医学 Medicine 以外で、賞の年度、分野、名前を表示
---------*/
SELECT yr, subject, winner FROM nobel
  WHERE yr = 1980 AND subject NOT IN ('chemistry', 'medicine')

/*---------
Q10: 1910年以前（1910は含まず）の　初期の医学 Medicine の受賞者　と 2004年以降（2004は含む）の　最近の文学 Literature の受賞者　を共に表示する
---------*/
SELECT yr, subject, winner FROM nobel
  WHERE (yr < 1910 AND subject = 'medicine') OR (yr >= 2004 AND subject = 'literature')

/*---------
Q11: PETER GRÜNBERG　の受賞内容詳細を検索する。 ウムラウトの入力方法（Ü　の入力方法）を調べ検索キーワードで機能させる方法を調べる
---------*/
SELECT yr, subject, winner FROM nobel
  WHERE winner = 'PETER GRÜNBERG'

/*---------
Q12: EUGENE O'NEILL の全ての受賞内容詳細を検索する
---------*/
SELECT yr, subject, winner FROM nobel
  WHERE winner = 'EUGENE O''NEILL'

/*---------
Q13: 騎士の受賞者リストを表示する。 Sir. で始まる受賞者の 受賞者、年、分野　を表示する。 年が新しい順に、同年内では名前順に表示する
---------*/
SELECT winner, yr, subject FROM nobel
  WHERE winner LIKE 'Sir%'

/*---------
Q14: 1984年の賞の　受賞者 winner と分野 subject を分野と受賞者の名前順で表示する。ただし化学 Chemistry と物理学 Physics は最後の方に表示する
---------*/
