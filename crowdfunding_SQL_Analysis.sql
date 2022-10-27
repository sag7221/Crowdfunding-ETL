-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
--Query 1
SELECT cf_id, backers_count FROM campaign 
WHERE outcome='live'
ORDER BY backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
--Query 2
SELECT cf_id, COUNT(backer_id) FROM backers 
GROUP BY cf_id 
ORDER BY COUNT(backer_id) DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
--Query 3
ALTER TABLE campaign ADD COLUMN remaining_goal_amount int;

UPDATE campaign
SET remaining_goal_amount = goal - pledged

SELECT co.first_name, co.last_name, co.email, ca.remaining_goal_amount
INTO email_contacts_remaining_goal_amount
FROM contacts as co
INNER JOIN campaign as ca
ON (co.contact_id=ca.contact_id)
WHERE ca.outcome='live'
ORDER BY ca.remaining_goal_amount DESC;

ALTER TABLE email_contacts_remaining_goal_amount
ALTER COLUMN remaining_goal_amount TYPE numeric;





-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.email, b.first_name, b.last_name, b.cf_id,ca.company_name, ca.description,ca.end_date, ca.remaining_goal_amount
INTO email_backers_remaining_goal_amount
FROM backers as b
INNER JOIN campaign as ca
ON (b.cf_id=ca.cf_id)
WHERE ca.outcome='live'
ORDER BY b.last_name ASC;

ALTER TABLE email_backers_remaining_goal_amount RENAME COLUMN remaining_goal_amount TO left_of_goal;


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;


