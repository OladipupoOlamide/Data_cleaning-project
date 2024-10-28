# Data Cleaning Projects

A repository for learning and practicing data cleaning techniques in SQL, primarily using PostgreSQL.

## Introduction

This repository is a collection of small projects that I am working on to build my data cleaning and analysis skills using SQL. Each project addresses common data quality issues and aims to improve data reliability through structured cleaning processes. Inspired by a post from Sushanta Khara on LinkedIn, this journey underscores the importance of clean data for effective analysis.

Data cleaning is essential for meaningful analysis, as unclean data can lead to inaccurate and misleading insights. Through these projects, I’m transforming "messy" datasets into reliable, structured data ready for analysis.

## Data Sources
Club_member_info : The primary dataset used for this analysis is the "club_member_info.csv" file containg information about the members of a particular club

### Tools
- Excel
- PostgreSQL for data cleaning


#### Problem Statement

In data analysis, ensuring data quality is critical for reliable results.
## Data Cleaning
Here are the data cleaning steps I followed to improve the dataset:

1. **Creating a Temporary Table**: A temporary table was created to manipulate and restructure data without altering the original dataset.
``` sql
DROP TABLE IF EXISTS cleaned_club_member_info;
CREATE TABLE cleaned_club_member_info
```
2. **Cleaning Names**:
   - Trimmed extra whitespace, removed special characters, and converted names to lowercase.
   - Used regex to remove any special characters from first names.
   - For last names with multiple words (e.g., 'de palma' or 'de la cruz'), converted the string to an array to calculate its length, then used a `CASE` statement to handle these cases.

3. **Age Standardization**:
   - Detected and removed any extra digit from ages with three-digit values by extracting only the first two digits.
   - Checked for empty values and converted empty strings (`''`) to `NULL`.

4. **Handling Marital Status**:
   - Trimmed whitespace from the `marital_status` column, replaced misspellings using Common Table Expressions (CTEs), and ensured that empty values were set to `NULL`.

5. **Phone Number Validation**:
   - Trimmed whitespace, validated completeness, and set empty or incomplete entries to `NULL`.

6. **Address Formatting**:
   - Ensured each member has a full address for billing, allowing shared addresses for members in the same household.
   - Converted addresses to lowercase, trimmed whitespace, and split full addresses into `street`, `city`, and `state` columns.

7. **Job Title Standardization**:
   - Removed whitespace, standardized titles by converting Roman numerals (I, II, III, IV) to numeric levels, and added level descriptors (e.g., "Level 3").
   - Renamed the column to `occupation` and set empty titles to `NULL`.

8. **Email Uniqueness**:
   - Ensured all members have unique email addresses by identifying duplicate entries.

Following these steps, I created a new, clean SQL table ready for analysis while gaining practical experience in SQL-based data cleaning.

## Datasets Used

This repository contains various datasets, each providing practice opportunities in different SQL concepts essential for data cleaning:

- **Core SQL Queries**: Practicing `SELECT`, `WHERE`, `GROUP BY`, and `HAVING`.
- **Aggregate Functions**: Using `COUNT`, `SUM`, `MIN`, `MAX`, and `AVG`.
- **Join Operations**: Practicing `INNER`, `OUTER`, `LEFT`, and `RIGHT` joins.
- **CTEs, Temporary Tables, and Views**: Structuring complex queries for clarity.
- **String and Date Functions**: Manipulating text and dates to standardize data using functions such as **make_date**.


Each project is designed to develop practical SQL skills, particularly in PostgreSQL, as I continue my learning journey in data cleaning and quality management.

---

Feel free to explore these projects to see how I’m progressing in data cleaning and gaining hands-on SQL experience. Clean data is the foundation of effective insights!
