SELECT TOP 10 title, type, imdb_score, release_year
FROM titles$
WHERE imdb_score >= 8.0
AND type = 'MOVIE'
ORDER BY imdb_score DESC


SELECT TOP 10 title, type, imdb_score, release_year
FROM titles$
WHERE imdb_score >= 8.0
AND type = 'SHOW'
ORDER BY imdb_score DESC


SELECT TOP 10 title, type, imdb_score
FROM titles$
WHERE type = 'MOVIE'
ORDER BY imdb_score ASC

SELECT DISTINCT type, 
ROUND(AVG(imdb_score),2) AS avg_imdb_score,
ROUND(AVG(tmdb_score),2) as avg_tmdb_score
FROM titles$
GROUP BY type


SELECT CONCAT(FLOOR(release_year / 10) * 10, 's') AS decade,
	COUNT(*) AS movies_shows_count
FROM titles$
WHERE release_year >= 1940
GROUP BY CONCAT(FLOOR(release_year / 10) * 10, 's')
ORDER BY decade

SELECT TOP 5 age_certification, 
COUNT(*) AS certification_count
FROM titles$
WHERE type = 'Movie' 
AND age_certification != 'N/A'
GROUP BY age_certification
ORDER BY certification_count DESC


SELECT ROUND(AVG(runtime),2) AS avg_runtime_min
FROM titles$
WHERE type = 'Movie'
UNION ALL
SELECT 
ROUND(AVG(runtime),2) AS avg_runtime_min
FROM titles$
WHERE type = 'Show';

SELECT TOP 10 title, 
SUM(seasons) AS total_seasons
FROM titles$ 
WHERE type = 'Show'
GROUP BY title
ORDER BY total_seasons DESC


SELECT TOP 3 genres,COUNT(*) AS total_count
FROM titles$
WHERE type = 'MOVIE' OR type = 'SHOW'
GROUP BY genres
ORDER BY total_count DESC


SELECT TOP 3 production_countries,COUNT(*) AS total
FROM titles$
GROUP BY production_countries
ORDER BY total DESC
