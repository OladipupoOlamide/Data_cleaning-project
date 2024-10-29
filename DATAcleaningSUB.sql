CREATE TABLE IF NOT EXISTS club_member_info (
	full_name TEXT,
	age INTEGER,
	marital_status INTEGER,
	email VARCHAR(50),
	phone INTEGER,
	full_address VARCHAR(150),
	job_title TEXT,
	membership_date DATE
);
ALTER TABLE club_member_info
ALTER column phone TYPE VARCHAR(50);

ALTER TABLE club_member_info
ADD column member_id  serial ;

ALTER TABLE club_member_info
ADD constraint c_m_pk PRIMARY KEY(member_id)

SELECT * FROM club_member_info;

