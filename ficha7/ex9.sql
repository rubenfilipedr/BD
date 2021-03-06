SELECT A.Name, COUNT(MA.MovieId) AS N
FROM MOVIE_ACTOR MA
JOIN ACTOR A
ON (MA.ActorId = A.ActorId)
GROUP BY A.Name
HAVING N >= 15
ORDER BY N DESC;
