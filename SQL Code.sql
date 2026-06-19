use [PortfoliloProjects]

--select *
--from CovidDeaths
--order by 3,4

--select *
--from CovidVaccinations
--order by 3,4

select location, date ,total_cases, new_cases , total_deaths ,population
from CovidDeaths
order by 1,2 


--Looking at Total Cases vs Total Deaths
select location, date ,total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage 
from CovidDeaths
where location = 'india'
order by 1,2 


--Looking At Total Cases vs Population
select location, date ,total_cases, population, (total_cases/population)*100 as PercentPopulationInfected 
from CovidDeaths
where location = 'india'
order by 1,2 


--Looking At Contries with the Hightst Infection Rate 
select location, population,MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected 
from CovidDeaths
Group by location, population
order by PercentPopulationInfected desc 


--Showing Contries with Highest Death Count 
select location,MAX(cast(total_deaths as int)) as TotalDeathCount
from CovidDeaths
Group by location
order by TotalDeathCount desc 


-- For Continents
select location,MAX(cast(total_deaths as int)) as TotalDeathCount
from CovidDeaths
where continent is null
Group by location
order by TotalDeathCount desc 


--Global Numbers
select date ,SUM(new_cases) as Total_Cases, SUM(cast(new_deaths as int)) as Total_Deaths
from CovidDeaths
where continent is not null
group by date
order by 1,2 


--Joining Both Tabels 

--Looking at Total Population vs Total Deaths
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(convert(int, vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as PeopelVaccinated
from CovidDeaths dea
join CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date 
where dea.continent is not null
order by 2,3

--Using CTE

with popvsVac ( continent, location, date, population, new_vaccinations, PeopelVaccinated)
as (
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(convert(int, vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as PeopelVaccinated
from CovidDeaths dea
join CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date 
where dea.continent is not null
)
select *,(PeopelVaccinated/population)*100
from popvsVac


--TEMP TABLE 

drop table if exists #PercentPopulationVaccinated
create table #PercentPopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccination numeric,
PeopelVaccinated numeric
)

insert into #PercentPopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(convert(int, vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as PeopelVaccinated
from CovidDeaths dea
join CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date 
where dea.continent is not null
--order by 2,3

select *,(PeopelVaccinated/population)*100
from #PercentPopulationVaccinated


--Creating View to Store Data 

create view PercentPopulationVaccinated as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(convert(int, vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as PeopelVaccinated
from CovidDeaths dea
join CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date 
where dea.continent is not null
--order by 2,3

select * 
from PercentPopulationVaccinated

	
/*
Queries used for Tableau Project
*/

	
-- 1. 

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From CovidDeaths
where continent is not null 
order by 1,2


-- 2. 

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From CovidDeaths
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc


-- 3.

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc


-- 4.


Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From CovidDeaths
Group by Location, Population, date
order by PercentPopulationInfected desc

