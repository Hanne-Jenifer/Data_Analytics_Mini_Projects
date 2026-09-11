CREATE DATABASE ipl;
USE ipl;

CREATE TABLE matches (
    match_id INT,
    team VARCHAR(100),
    opponent_team VARCHAR(100),
    match_date DATE,
    venue VARCHAR(100),
    Season INT,
    runs_scored INT,
    wickets_lost INT,
    overs_faced DECIMAL(5,1),
    runs_conceded INT,
    wickets_taken INT,
    match_result VARCHAR(100),
    man_of_the_match VARCHAR(100)
);

SELECT 
    COUNT(*) AS total_rows
FROM matches;

-- 1. Total Matches Won by Each Team
SELECT 
    match_result AS team,
    COUNT(*) AS total_matches_won
FROM matches
GROUP BY match_result
ORDER BY total_matches_won DESC;


-- 2. Teams Where Average Runs Scored is Greater Than 130
--    and Total Matches Played is More Than 50
SELECT 
    team,
    AVG(runs_scored) AS average_runs,
    COUNT(*) AS total_matches
FROM matches
GROUP BY team
HAVING AVG(runs_scored) > 130
   AND COUNT(*) > 50;


-- 3. Matches Where the Team Lost Fewer Than 3 Wickets
SELECT 
    match_id,
    team,
    runs_scored,
    wickets_lost
FROM matches
WHERE wickets_lost < 3;


-- 4. Average Runs Conceded Rounded to Two Decimal Places
SELECT 
    ROUND(AVG(runs_conceded), 2) AS average_runs_conceded
FROM matches;


-- 5. Matches Played at Venues Starting With the Letter 'M'
SELECT 
    match_id,
    match_date,
    venue,
    team
FROM matches
WHERE venue LIKE 'M%';


-- 6. Total Runs Scored and Corresponding Run Rate
SELECT 
    SUM(runs_scored) AS total_runs,
    ROUND(SUM(runs_scored) / SUM(overs_faced), 2) AS run_rate
FROM matches;


-- 7. Top 3 Teams Based on Total Wickets Taken
--    Only Teams With More Than 200 Wickets
SELECT 
    team,
    SUM(wickets_taken) AS total_wickets_taken
FROM matches
GROUP BY team
HAVING SUM(wickets_taken) > 200
ORDER BY total_wickets_taken DESC
LIMIT 3;