Select *
From [Data Analysis Covid]..covid_deaths
where continent is not null
order by 3,4

Select location,date,total_cases,new_cases,total_deaths,population
From [Data Analysis Covid]..covid_deaths
order by 1,2

--looking at Total Cases vs Total Deaths
--shows likelihood of dying

Select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
From [Data Analysis Covid]..covid_deaths
Where location like '%India%'
order by 1,2


--looking at Total Cases vs Population
--shows what percentage of population got covid

Select location,date,total_cases,population,(total_cases/population)*100 as CovidCases
From [Data Analysis Covid]..covid_deaths
Where location like '%India%'
order by 1,2


--Higest Infection rate

Select location,population,MAX(total_cases) as HighestInfection,MAX(total_cases/population)*100 as HighestCases
From [Data Analysis Covid]..covid_deaths
--Where location like '%India%'
Group by location,population
order by HighestCases desc


--showing countries with highest Death Count Per Population

Select location,MAX(cast(total_deaths as int)) as TotalDeaths
From [Data Analysis Covid]..covid_deaths
where continent is not null
--Where location like '%India%'
Group by location
order by TotalDeaths desc


--now by continent

Select location,MAX(cast(total_deaths as int)) as TotalDeaths
From [Data Analysis Covid]..covid_deaths
where continent is null
--Where location like '%India%'
Group by location
order by TotalDeaths desc

--showing continents with the highest death count per population

Select location,MAX(cast(total_deaths as int)) as TotalDeaths
From [Data Analysis Covid]..covid_deaths
where continent is null
--Where location like '%India%'
Group by location
order by TotalDeaths desc

-- GLOBAL NUMBERS

Select date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_Deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as GlobalNumbers
From [Data Analysis Covid]..covid_deaths
--Where location like '%India%'
where continent is not null
group by date
order by 1,2

--total cases

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_Deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as GlobalN
From [Data Analysis Covid]..covid_deaths
--Where location like '%India%'
where continent is not null
--group by date
order by 1,2

--looking at total population vs Vaccinations

Select dea.continent, dea.location,dea.date,dea.population,vac.new_deaths
From [Data Analysis Covid]..vaccinations dea
Join [Data Analysis Covid]..covid_deaths vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 1,2,3
















