SELECT StreamDate, Title, Name, Country
FROM MOVIE
NATURAL JOIN STREAM
NATURAL JOIN CUSTOMER
WHERE Country <> 'China'
AND MovieId IN (
  SELECT MovieId
	FROM MOVIE_ACTOR
	NATURAL JOIN ACTOR
  WHERE Name = 'Johnny Depp'
)
AND MovieId NOT IN (
	SELECT MovieId
	FROM MOVIE_ACTOR
	NATURAL JOIN ACTOR
  WHERE Name = 'Helena Bonham Carter'
)
ORDER BY StreamDate DESC
LIMIT 15;
