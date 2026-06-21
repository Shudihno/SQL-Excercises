-- Creating the user table
CREATE OR REPLACE TABLE users (
    user_id INT,
    user_name STRING,
    country STRING
);

-- Inserting values in the user table
INSERT INTO users VALUES
(1, 'Nomvula', 'Johannesburg'),
(2, 'David', 'Cape Town'),
(3, 'Anele', 'Durban'),
(4, 'Kabelo', 'Pretoria'),
(5, 'Lerato', 'Port Elizabeth');

-- Verifying if the above worked
SELECT * FROM users;

--Creating the plans table
CREATE OR REPLACE TABLE plans (
    plan_id INT,
    plan_name STRING,
    monthly_price INT
);

--Inserting values in the plans table
INSERT INTO plans VALUES
(10, 'Basic', 79),
(11, 'Standard', 129),
(12, 'Premium', 199),
(13, 'Family', 249),
(14, 'Mobile', 59);

--Testing or verifying if returns the correct table and values
SELECT * FROM plans;

-- Creating tyhe subscriptions table
CREATE OR REPLACE TABLE subscriptions (
    subscription_id INT,
    user_id INT,
    plan_id INT,
    start_date DATE
);

--Inserting values in the subscription table
INSERT INTO subscriptions VALUES
(501, 1, 10, '2026-01-15'),
(502, 2, 11, '2026-02-01'),
(503, 1, 12, '2026-03-10'),
(504, 6, 11, '2026-03-20'),
(505, 3, 13, '2026-04-05');

--Testing and verifying the above 
SELECT * FROM subscriptions;

-- Creating the shows table
CREATE OR REPLACE TABLE shows (
    show_id INT,
    show_title STRING,
    genre STRING
);

--Inserting values in the shows table
INSERT INTO shows VALUES
(701, 'Comedy Hour', 'Comedy'),
(702, 'Crime Time', 'Drama'),
(703, 'Tech Tales', 'Documentary'),
(704, 'Cooking Lab', 'Lifestyle'),
(706, 'Wild Earth', 'Documentary');

-- Testing the table shows
SELECT * FROM shows;

-- Creating the viewing_sessions table
CREATE OR REPLACE TABLE viewing_sessions (
    session_id INT,
    user_id INT,
    show_id INT,
    watch_minutes INT
);

--Inserting values in the viewing_sessions
INSERT INTO viewing_sessions VALUES
(901, 1, 701, 45),
(902, 2, 703, 30),
(903, 1, 702, 60),
(904, 7, 701, 20),
(905, 3, 705, 90);

-- Testing the table created above
SELECT * FROM viewing_sessions;

--Using union all and aggreagation count to get the number rows in each table
SELECT 'users' AS table_name, COUNT(*) AS row_count FROM users
UNION ALL
SELECT 'plans', COUNT(*) FROM plans
UNION ALL
SELECT 'subscriptions', COUNT(*) FROM subscriptions
UNION ALL
SELECT 'shows', COUNT(*) FROM shows
UNION ALL
SELECT 'viewing_sessions', COUNT(*) FROM viewing_sessions;

--1
SELECT u.user_id,u.user_name,s.subscription_id,s.start_date
FROM users AS u
INNER JOIN subscriptions AS s
    ON u.user_id = s.user_id;

--2
SELECT s.subscription_id,s.user_id,p.plan_name,p.monthly_price
FROM subscriptions AS s
INNER JOIN plans AS p
    ON s.plan_id = p.plan_id;

--3
SELECT v.session_id,v.user_id,s.show_title,s.genre,v.watch_minutes
FROM viewing_sessions AS v
INNER JOIN shows AS s
  ON v.show_id = s.show_id;

--4
SELECT u.user_name,u.country,v.session_id,v.show_id,v.watch_minutes
FROM users AS u
INNER JOIN viewing_sessions AS v
   ON u.user_id = v.user_id;

--5
SELECT u.user_name,u.country,p.plan_name,p.monthly_price,s.start_date
FROM users AS u
INNER JOIN subscriptions AS s
  ON u.user_id = s.user_id
INNER JOIN plans AS p
 ON s.plan_id = p.plan_id;

--6
SELECT u.user_id,u.user_name,s.subscription_id,s.start_date
FROM users AS u
LEFT JOIN subscriptions AS s
  ON u.user_id = s.user_id;

--7
SELECT p.plan_id,p.plan_name,s.subscription_id,s.user_id
FROM plans AS p
LEFT JOIN subscriptions AS s
  ON p.plan_id = s.plan_id;

--8
SELECT s.show_id,s.show_title,v.session_id,v.watch_minutes
FROM shows AS s
LEFT JOIN viewing_sessions AS v
  ON s.show_id = v.show_id;

--9
SELECT v.session_id,v.show_id,v.watch_minutes,u.user_id,u.user_name
FROM viewing_sessions AS v
LEFT JOIN users AS u
  ON v.user_id = u.user_id;

--10
SELECT u.user_name,u.country,p.plan_name,p.monthly_price
FROM users AS u
LEFT JOIN subscriptions AS s
  ON u.user_id = s.user_id
LEFT JOIN plans AS p
  On s.plan_id = p.plan_id;

--11
SELECT u.user_id,u.user_name,s.subscription_id,s.start_date
FROM users AS u
FULL OUTER JOIN subscriptions AS s
  ON u.user_id = s.user_id;

--12
SELECT p.plan_id,p.plan_name,s.subscription_id,s.user_id
FROM plans AS p
FULL OUTER JOIN subscriptions AS s
  ON p.plan_id = s.plan_id;

--13
SELECT s.show_id,s.show_title,v.session_id,v.watch_minutes
FROM shows AS s
FULL OUTER JOIN viewing_sessions AS v
  ON s.show_id = v.show_id;

--14
SELECT u.user_id, u.user_name, v.session_id, v.show_id, v.watch_minutes
FROM users AS u
FULL OUTER JOIN viewing_sessions AS v
  ON u.user_id = v.user_id;

--15
SELECT u.user_id,u.user_name,s.subscription_id,p.plan_id,p.plan_name
FROM users AS u
FULL OUTER JOIN subscriptions AS s
  ON u.user_id = s.user_id
FULL OUTER JOIN plans AS p
  ON s.plan_id = p.plan_id;

--Bonus1
--User 4 — Kabelo
--User 5 — Lerato

SELECT u.user_id,u.user_name
FROM users u
LEFT JOIN subscriptions s
    ON u.user_id = s.user_id
WHERE s.subscription_id IS NULL;

--Bonus2
--Subscription ID: 504
--User ID: 6

SELECT s.subscription_id,s.user_id
FROM subscriptions AS s
Left JOIN users AS u
 ON s.user_id = u.user_id
WHERE u.user_id IS NULL;

--Bonus3
--show_id	show_title
--704    	Cooking Lab
--706	    Wild Earth

SELECT s.show_id, s.show_title
FROM shows AS s
LEFT JOIN viewing_sessions As v
  ON s.show_id = v.show_id
WHERE v.session_id IS NULL;

--Bonus4
--Session ID:  Show ID: 
--   905         705

SELECT v.session_id,v.show_id
FROM viewing_sessions v
LEFT JOIN shows s
  ON v.show_id = s.show_id
WHERE s.show_id IS NULL;

--Bonus 5
--Mobile Plan

SELECT p.plan_id,p.plan_name
FROM plans p
LEFT JOIN subscriptions s
  ON p.plan_id = s.plan_id
WHERE s.plan_id IS NULL;
