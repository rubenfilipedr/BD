SELECT Title, Name
FROM MOVIE_ACTOR
NATURAL JOIN MOVIE
NATURAL JOIN ACTOR A
WHERE MovieId IN (
  SELECT MovieId
  FROM MOVIE_ACTOR
  NATURAL JOIN ACTOR
  WHERE Name = 'Johnny Depp'
)
AND Name <> 'Johnny Depp'
ORDER BY Title, Name;