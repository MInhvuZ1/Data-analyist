


CREATE  table Jan_job AS
    select *
    from job_postings_fact

    where extract ( month from job_posted_date)=  1;
  


create table Jan_job1 as (
    select *

    from job_postings_fact
    where extract(month from job_posted_date) = 1 

);


create table Feb_job1 as (
    select *

    from job_postings_fact
    where extract(month from job_posted_date) = 2 

)

select * from Feb_job1

select * from Jan_job1


select *

    

 from job_postings_fact 
   where  extract( month from job_posted_date )   = 1 
 
 limit 240





drop table Jan_job;




select * 
from Jan_job
ORDER BY job_posted_date

limit 100

select 
    count (job_id) as number_of_jobs,
    
    CASE
        when location = 'Anywhere' then 'remote'
        when location = 'New York, NY' then 'local'
        else 'outsite'
    END AS location_category1
From job_postings_fact --        


-- where job_title_short = 'Data Analyst'


  group by location_category1

 
limit 250;




select
    job_title_short
    from job_postings_fact
limit 250;

c
/*
    categorize the salaries from each job posting.  to see if it fits in my disire salaray range
    
*/


select 

     *   
    from ( 
            select * 
            from job_postings_fact
            where  extract(month from job_posted_date) = 1
       )    AS  Janruary_job

       limit 100;






select 

 
    extract ( month from  job_posted_date ) =  1 as month ,
       job_title_short

 from job_postings_fact
limit 140;





select 

    company_id,
    job_no_degree_mention

from job_postings_fact
 

where  job_no_degree_mention = false


limit 200;



select *from  job_postings_fact limit 150;






with count_table as (
    select 
    company_id as id ,
    count(job_title_short) as number_job_title,
    count(location) as number_location

    from job_postings_fact

    group by company_id
    limit 240
)

select * from count_table




select * from company_job_count
limit 140;




 with company_job_count as ( 
    select 
    company_id as fuck ,
    count ( *) as total_job_posting
    from job_postings_fact
    group by company_id
   
)

    
select 
* from skills_dim limit 250
company_job_count.total_job_posting

from company_dim

left join company_job_count on company_job_count.company_id = company_dim.company_id

limit 240;



with highest_count as ( 
select 
    
    skill_id,
   
    count(skill_id)  as number
    

 from skills_job_dim

 group by skill_id

 order by number desc


)




select * from skills_dim 
 
left join highest_count on highest_count.skill_id = skills_dim.skill_id limit 10


    /* 
    find the count of the number of remote job postings per skill
        - display the top 5 skills by thier demand in remote jobs
        - include skill_id, name, and count of posting requiring the skill

*/

select*  from skills_dim limit 240

select 
    job_id,
    company_id,
    job_work_from_home
    

 from job_postings_fact 
 
 where job_work_from_home = true 
 

 -- multiple skills asocitate with 1 job


 ORDER BY job_id
 
 limit 240












select FACT.job_id
        , fact.company_id
        , count (skills_job_dim.skill_id) as total_Number_skills
    --   , dim.skills as name
        

from skills_job_dim

inner join job_postings_fact as fact on fact.job_id = skills_job_dim.job_Id
left join skills_dim as dim on dim.skill_id = skills_job_dim.skill_id


where fact.job_work_from_home = true


group by FACT.job_id
order by job_id

 limit 240









select * from skills_dim 
order by  job_id
 limit 240




----------------------------------------------
----------------------------------------------
----------------------------------------------
    /* 
    find the count of the number of remote job postings per skill
        - display the top 5 skills by thier demand in remote jobs
        - include skill_id, name, and count of posting requiring the skill

*/



select







from skills_job_dim

inner join job_postings_fact as fact on fact.job_id = skills_job_dim.job_Id
left join skills_dim as dim on dim.skill_id = skills_job_dim.skill_id


group by skills_job_dim.skill_id


limit 240

 
with remote_job1 as ( select
    skills_job_dim.skill_id
    , count(*) as Total_job
   -- , fact.job_title_short
 from skills_job_dim
inner join job_postings_fact as fact on fact.job_id = skills_job_dim.job_Id




 where fact.job_work_from_home = true -- and fact.job_title_short = 'Data Analyst'
    
 GROUP BY skills_job_dim.skill_id 

)


select 

    dim2.skill_id
   , dim2.skills as name
   , Total_job

 from  skills_dim as dim2
inner join remote_job1  on dim2.skill_id = remote_job1.skill_id
--left join job_postings_fact.job_Id = remote

order by Total_job desc

limit 5



WITH Job_specific AS ( 
    SELECT 
        job_id,
        job_name,
        '' AS Job_nam  -- Creates a new column with empty values
    FROM job_postings_fact 
    WHERE job_title_short = 'Data Analyst'
    ORDER BY job_id
    LIMIT 120
)
SELECT * FROM Job_specific;


select * from company_dim limit 24



select * from job_postings_fact limit 240



create table march as ( 
    select * 

    from job_postings_fact
    where extract ( month from job_posted_date) = 3 

)

select * from march



create table first_quarter as (   

    select * from Jan_job1

    UNION all
     select * from Feb_job1


  UNION all
     select * from march


 )


 select * from first_quarter where salary_year_avg > 70000 and job_title_short = 'Data Analyst'


same data set





    
