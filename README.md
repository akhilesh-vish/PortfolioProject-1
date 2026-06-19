# SQL Portfolio Projects

This repository contains SQL projects that demonstrate data cleaning, transformation, exploration, and analysis using real-world datasets.

The projects showcase practical SQL skills commonly used by Data Analysts, Business Analysts, and BI Professionals.

---

# Project 1: COVID-19 Data Exploration & Tableau Dashboard

## Overview

This project analyzes COVID-19 data from 2020–2021 using SQL and Tableau.

The datasets used include:

* COVID-19 Deaths Dataset
* COVID-19 Vaccinations Dataset

Source: Our World in Data

## Key Objectives

* Analyze global COVID-19 trends.
* Calculate infection and death rates.
* Compare cases against population figures.
* Track vaccination progress.
* Create an interactive Tableau dashboard.

## SQL Skills Demonstrated

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* Aggregate Functions (SUM, MAX)
* CAST & CONVERT
* INNER JOIN
* Window Functions
* Common Table Expressions (CTEs)
* Temporary Tables
* Views

## Key Analyses

### Total Cases vs Total Deaths

Calculated death percentages across countries.

### Total Cases vs Population

Measured infection rates relative to population size.

### Highest Infection Rates

Identified countries with the largest percentage of infected population.

### Highest Death Counts

Compared total deaths across countries and continents.

### Vaccination Progress

Analyzed cumulative vaccinations using window functions.

## Tableau Dashboard

### Dashboard Features

* Global Cases
* Global Deaths
* Death Percentage
* Infection Rates by Country
* Death Counts by Region
* Vaccination Trends
* Time-Series Analysis

### Dashboard Link

🔗 https://public.tableau.com/app/profile/akhilesh.vishwakarma/viz/CovidDashboard_17803238466760/Dashboard1?publish=yes

---

# Project 2: Nashville Housing Data Cleaning

## Overview

This project focuses on cleaning and preparing Nashville housing data using SQL Server.

The objective was to transform raw housing data into a cleaner and more analysis-ready dataset by handling missing values, standardizing formats, splitting columns, and removing duplicate records.

## Dataset

* Nashville Housing Dataset

## Data Cleaning Tasks Performed

### 1. Populate Missing Property Addresses

Used self-joins and the ParcelID field to populate missing PropertyAddress values.

### 2. Split Property Address

Separated PropertyAddress into:

* PropertySplitAddress
* PropertySplitCity

### 3. Split Owner Address

Separated OwnerAddress into:

* OwnerSplitAddress
* OwnerSplitCity
* OwnerSplitState

### 4. Standardize SoldAsVacant Values

Converted:

* Y → Yes
* N → No

### 5. Remove Duplicate Records

Used a CTE and ROW_NUMBER() function to identify duplicate rows based on:

* ParcelID
* PropertyAddress
* SalePrice
* SaleDate
* LegalReference

### 6. Remove Unused Columns

Dropped unnecessary columns after transformation:

* OwnerAddress
* TaxDistrict
* PropertyAddress
* SaleDate

## SQL Skills Demonstrated

* Data Cleaning
* Data Transformation
* Self Joins
* String Functions
* CASE Statements
* Window Functions
* Common Table Expressions (CTEs)
* ALTER TABLE
* UPDATE Statements
* Data Standardization
* Duplicate Removal

---

# Repository Structure

```text
SQL-Portfolio-Projects/
│
├── Covid Portfolio Project.sql
├── SQL Data Cleaning.sql
├── Nashville Housing Data for Data Cleaning.csv
├── README.md
│
└── Tableau Dashboard
```

---

# Technologies Used

| Technology        | Purpose                  |
| ----------------- | ------------------------ |
| SQL Server        | Data Cleaning & Analysis |
| Tableau Public    | Data Visualization       |
| CSV Files         | Data Source              |
| Our World in Data | COVID-19 Dataset         |

---

# Skills Demonstrated

### SQL

* Data Cleaning
* Data Exploration
* Data Transformation
* Joins
* Window Functions
* CTEs
* Temporary Tables
* Views
* Data Aggregation

### Data Analytics

* Exploratory Data Analysis
* Data Quality Improvement
* KPI Development
* Trend Analysis
* Business Intelligence

### Data Visualization

* Tableau Dashboard Design
* Interactive Reporting
* Insight Communication

---

# Author

**Akhilesh Vishwakarma**

### Connect With Me

* GitHub: https://github.com/akhilesh-vish/
* LinkedIn: www.linkedin.com/in/akhilesh-vishwakarma-8a7081233
---

⭐ If you found these projects useful, consider giving the repository a star.
