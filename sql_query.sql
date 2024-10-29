```sql
-- Temporary table so as not to affect original file
DROP TABLE IF EXISTS cleaned_club_member_info;
CREATE TABLE cleaned_club_member_info AS (
	SELECT 
		member_id,
		regexp_replace(split_part(trim(lower(full_name)),' ', 1),'\W+','','g') AS first_name, -- Splitting full_name into first name and last_name while removing all special characters
		
		CASE
			WHEN array_length(string_to_array(trim(lower(full_name)), ' '), 1) = 3 THEN split_part(trim(lower(full_name)), ' ', 2) || ' ' || split_part(trim(lower(full_name)), ' ', 3)
			WHEN array_length(string_to_array(trim(lower(full_name)), ' '), 1) = 4 THEN split_part(trim(lower(full_name)), ' ', 2) || ' ' || split_part(trim(lower(full_name)), ' ', 3) || ' ' || split_part(trim(lower(full_name)), ' ', 4)
			ELSE 
				split_part(trim(lower(full_name)),' ', 2)
		END AS last_name,
		-- 
		CASE
			WHEN length(age::text) = 0 THEN null
			WHEN length(age::text) = 3 THEN substr(age::text,1,2)::numeric
			ELSE age
		END AS age,
		
		CASE 
			WHEN marital_status = '' THEN null
			WHEN marital_status = 'divored' THEN 'divorced'
			ELSE trim(lower(marital_status))
		END as marital_status,

		CASE 
			WHEN email = '' THEN NULL
			ELSE trim(lower(email))
		END as member_email,

		CASE 
			WHEN phone = '' THEN NULL
			WHEN length(phone) > 12 THEN NULL
			ELSE trim(phone)
		END AS phone,

		split_part(trim(lower(full_address)),',',1) AS street_address,
		split_part(trim(lower(full_address)),',',2) AS city,
		split_part(trim(lower(full_address)),',',3) AS state,

		CASE
			WHEN trim(job_title) = '' THEN NULL
			WHEN array_length(string_to_array(trim(lower(job_title)),' '),1) > 1 AND split_part(trim(lower(job_title)),' ',array_length(string_to_array(trim(lower(job_title)),' '),1)) = 'i' 
				THEN replace(lower(job_title),' i',' Level 1')
			WHEN array_length(string_to_array(trim(lower(job_title)),' '),1) > 1 AND split_part(trim(lower(job_title)),' ',array_length(string_to_array(trim(lower(job_title)),' '),1)) = 'ii' 
				THEN replace(lower(job_title),' ii',' Level 2')
			WHEN array_length(string_to_array(trim(lower(job_title)),' '),1) > 1 AND split_part(trim(lower(job_title)),' ',array_length(string_to_array(trim(lower(job_title)),' '),1)) = 'iii' 
				THEN replace(lower(job_title),' iii',' Level 3')
			WHEN array_length(string_to_array(trim(lower(job_title)),' '),1) > 1 AND split_part(trim(lower(job_title)),' ',array_length(string_to_array(trim(lower(job_title)),' '),1)) = 'iv' 
				THEN replace(lower(job_title),' iv',' Level 4')
			ELSE trim(lower(job_title))
		END AS job_title,

		membership_date


	FROM club_member_info
		
);
-- CHECKING OUR CLEANED DATA

SELECT COUNT(*)
FROM cleaned_club_member_info

-- CHECKING FOR DUPLICATES
DELETE FROM cleaned_club_member_info AS c1
USING cleaned_club_member_info AS c2
WHERE c1.member_id < c2.member_id AND c1.member_email = c2.member_email


-- Correcting mispellings in the state columns
UPDATE
	cleaned_club_member_info
SET 
	state = 'kansas'
WHERE 
	state = 'kansus';

UPDATE
	cleaned_club_member_info
SET 
	state = 'district of columbia'
WHERE 
	state = 'districts of columbia';

UPDATE
	cleaned_club_member_info
SET 
	state = 'north carolina'
WHERE 
	state = 'northcarolina';

UPDATE
	cleaned_club_member_info
SET 
	state = 'california'
WHERE 
	state = 'kalifornia';

UPDATE
	cleaned_club_member_info
SET 
	state = 'texas'
WHERE 
	state = 'tejas';

UPDATE
	cleaned_club_member_info
SET 
	state = 'texas'
WHERE 
	state = 'tej+f823as';

UPDATE
	cleaned_club_member_info
SET 
	state = 'tennessee'
WHERE 
	state = 'tennesseeee';

UPDATE
	cleaned_club_member_info
SET 
	state = 'new york'
WHERE 
	state = 'newyork';

UPDATE
	cleaned_club_member_info
SET 
	state = 'puerto rico'
WHERE 
	state = ' puerto rico';
```	
