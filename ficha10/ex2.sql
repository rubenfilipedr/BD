SELECT M.Title, S.StreamDate, S.Charge
FROM MOVIE M
NATURAL JOIN STREAM S
NATURAL JOIN MOVIE_GENRE MG
NATURAL JOIN GENRE G
WHERE YEAR(S.StreamDate) = 2017
AND MONTH(S.StreamDate) = 12
AND G.Label = 'Thriller'
ORDER BY M.Title, S.StreamDate DESC;