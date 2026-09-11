# 🏏 IPL Performance Analysis Using SQL

This project analyzes **Indian Premier League match-performance data** using SQL to investigate
team performance, run scoring, wickets, runs conceded, venues, and overall match statistics
through **PostgreSQL and pgAdmin**.

---

## 🎯 Project Focus

The analysis addresses seven key performance questions:

- How many matches did each team win?
- Which teams maintained an average of more than **130 runs** across more than **50 matches**?
- Which matches had fewer than **3 wickets lost**?
- What was the average number of runs conceded?
- Which matches were played at venues beginning with **M**?
- What were the total runs and overall run rate?
- Which three teams recorded the highest wickets taken among teams with more than **200 wickets**?

---

## 🗃️ Dataset

The analysis uses IPL match-performance data stored in a `matches` table.

| Column | Data Type | Description |
|---|---|---|
| `match_id` | INT | Unique identifier for each match |
| `team` | VARCHAR | Name of the team |
| `opponent_team` | VARCHAR | Name of the opponent team |
| `match_date` | DATE | Date when the match was played |
| `venue` | VARCHAR | Stadium where the match was held |
| `Season` | INT | IPL season |
| `runs_scored` | INT | Runs scored by the team |
| `wickets_lost` | INT | Wickets lost by the team |
| `overs_faced` | DECIMAL | Overs faced by the team |
| `runs_conceded` | INT | Runs conceded by the team |
| `wickets_taken` | INT | Wickets taken by the team |
| `match_result` | VARCHAR | Match result |
| `man_of_the_match` | VARCHAR | Man of the Match player |

---

## 🔎 Analysis

### 🏆 1. Matches Won by Team

Match results are grouped to calculate the number of wins associated with each team.

### 📈 2. High-Scoring Teams

Teams are filtered using two conditions:

- Average runs scored greater than **130**
- More than **50 matches played**

### 🛡️ 3. Matches with Fewer Than 3 Wickets Lost

Matches are filtered to identify teams that lost fewer than three wickets, returning
the match ID, team, runs scored, and wickets lost.

### 🎯 4. Average Runs Conceded

The analysis calculates the average number of runs conceded across the available matches,
rounded to two decimal places.

### 🏟️ 5. Venue Analysis

Matches are filtered to identify venues whose names begin with the letter **M**.

### ⚡ 6. Total Runs & Run Rate

Total runs scored and overall run rate are calculated using total runs and overs faced,
with the resulting run rate rounded to two decimal places.

### 🥇 7. Top 3 Teams by Wickets Taken

Teams are ranked by total wickets taken, considering only teams with more than **200 wickets**.

---

## 🧠 SQL Concepts

The analysis demonstrates practical use of:

- Filtering with `WHERE`
- Aggregation with `COUNT()` and `SUM()`
- `AVG()` calculations
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `LIMIT`
- String matching with `LIKE`
- Rounding with `ROUND()`
- Calculated metrics such as run rate

---

## 🛠️ Tools & Technologies

| Tool / Technology | Purpose |
|---|---|
| **PostgreSQL** | Database and SQL analysis |
| **pgAdmin** | Database management and CSV import |
| **SQL** | Querying, filtering, aggregation, and calculations |
| **CSV** | Source dataset |

---

## 🔄 Workflow

**CSV Dataset → PostgreSQL Database → SQL Queries → Aggregation & Filtering → Performance Analysis**

---

## 📝 Results

The available project materials contain the **database schema and SQL queries**, but do not
include the executed query outputs. Therefore, specific numerical findings are not stated in
this README rather than being inferred or fabricated.

The queries provide analysis of **team wins, scoring performance, wicket losses, runs conceded,
venue patterns, run rate, and wicket-taking performance**.

---

## 👤 Author

**Hanne Jenifer**
