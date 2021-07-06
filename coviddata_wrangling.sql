SELECT * FROM trip.coviddeath;

--SELECT DATA THAT WE ARE GOING TO USE

SELECT location,date,total_cases,new_cases,total_deaths,population
FROM trip.coviddeath
order by 1,2;

--LOOKING AT TOTAL CASES VS TOTAL DEATHS
--SHOWS THE LIKELIHOOD OF DYING IF YOU CONTACT COVID IN YOUR COUNTRY

SELECT location,date,total_cases,new_cases,total_deaths,population,(total_deaths/total_cases)*100 as deathpercentage
FROM trip.coviddeath
order by 1,2;


SELECT location,date,total_cases,new_cases,total_deaths,population,(total_deaths/total_cases)*100 as deathpercentage
FROM trip.coviddeath
WHERE location like '%africa%'
order by 1,2;

--LOOKING AT THE TOTAL CASES VS POPULATION IN AFRICA
-- SHOWS WHAT PERCENTAGE OF POPULATION GOT COVID IN AFRICA

SELECT location,date,total_cases,population,(total_cases/population)*100 as Deathpopulation
FROM trip.coviddeath
WHERE location like '%africa%'
order by 1,2;

--LOOKING AT COUNTRIES WITH HIGHEST INFECTION RATE COMPARED TO POPULATION IN AFRICA

SELECT location,MAX(total_cases) AS highestinfectioncount,population,(total_cases/population)*100 as Deathpopulation
FROM trip.coviddeath
WHERE location like '%africa%'
order by 1,2;

--showing countries with highest death count por population
SELECT location,MAX(total_deaths) AS totaldeathcount
FROM trip.coviddeath
order by 1,2;

--TOTAL DEATHS 
SELECT date,sum(total_deaths),sum(new_cases) AS totaldeathcount
FROM trip.coviddeath
order by 1,2;

--JOINS
SELECT *
FROM trip.coviddeath 
JOIN trip.covidvac;

--LOOKING FOR DEATH BY LOCATION AND LOCATION
SELECT trip.coviddeath.continent,trip.coviddeath.location,trip.coviddeath.population
FROM trip.coviddeath 
JOIN trip.covidvac;

--GROUPING THE WHOLE DATA BY LOCATION,AGED 70
SELECT trip.coviddeath.continent,trip.coviddeath.location,trip.coviddeath.population,trip.covidvac.aged_70_older,population_density
FROM trip.coviddeath 
JOIN trip.covidvac;

--USING THE 'AS' KEYWORD TO CHANGE THE VARIABLE NAME
SELECT trip.coviddeath.continent as cont,trip.coviddeath.date as dat,trip.coviddeath.population as pop
FROM trip.coviddeath;


SELECT * FROM trip.coviddeath;

SELECT trip.coviddeath.population ,trip.coviddeath.location
FROM trip.coviddeath
where trip.coviddeath.location = 'Afghanistan';
