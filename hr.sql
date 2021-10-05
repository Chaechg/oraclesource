--employees 테이블 전체 내용 조회
SELECT
    *
FROM
    employees;
--employees 테이블의 first_name,last_name,job_id 만 조회
SELECT
    first_name,
    last_name,
    job_id
FROM
    employees;

-- EMPLOYEE_ID가 176인 사람의 LAST-NMAE과 DEPARTMENT_ID 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    employee_id = 176;
--salary가 12000이상 되는 직원들의 last_name, salary 조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 12000;
--salary가 5000~12000의 범위 이외의 사원들의 last_name, salary 조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary < 5000
    OR salary > 12000;

--20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 DEPARTMENT_ID를 오름차순 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 );

-- COMMISSION_PCT를 받는 모든 사원들의 LAST_NAME,SALARY,COMMISION_PCT 조회
--단, SALARY 내림차순, COMMISSION_PCT 내림차순
SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct > 0
ORDER BY
    salary DESC,
    commission_pct ASC;

--SALARY가 2500,3500,7000이 아니며 JOB_ID가 SA_REP,ST_CLERK인 사원 조회
SELECT
    *
FROM
    employees
WHERE
    salary NOT IN ( 2500, 3500, 7000 )
    AND job_id IN ( 'SA_REP', 'ST_CLERK' );
--2008/02/20 ~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME,EMPLYOEE_ID, HIRE_DATE
--조회한다. HIRE_DATE 내림차순으로 조회
SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
        hire_date >= '2008-02-20'
    AND hire_date <= '2008-05-01'
ORDER BY
    hire_date DESC;
--2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회
--HIRE_DATE 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
        hire_date >= '2004-01-01'
    AND hire_date <= '2004-12-31'
ORDER BY
    hire_date;
    
--Between A and B
--salary가 5000~12000의 범위 이외의 사원들의 last_name, salary 조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 5000 AND 12000;

--20번 및 50번 부서에서 근무하며, SALARY가 5000~12000 사이인 사원들의 LAST_NAME 및 
--DEPARTMENT_ID를 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
    AND salary BETWEEN 5000 AND 12000;

--2008/02/20 ~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME,EMPLYOEE_ID, HIRE_DATE
--조회한다. HIRE_DATE 내림차순으로 조회
SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2008-02-20' AND '2008-05-01'
ORDER BY
    hire_date DESC;

--2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회
--HIRE_DATE 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY
    hire_date;



--LIKE 
--2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회
--HIRE_DATE 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date LIKE '04%'
ORDER BY
    hire_date;

--LAST_NAME에 u가 포함되는 사원들의 사번 및 LAST_NAME 조회
SELECT
    last_name,
    employee_id
FROM
    employees
WHERE
    last_name LIKE '%u%';

--LAST_NAME의 4번째 글자가 a인 사원들의 LAST_NAME 조회
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '___a%';

--LAST_NAME에 글자가 a 혹은 e글자가 들어있는 사원들의 LAST_NAME 조회한 후 
--LAST_NAME 오름차순 조회
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    OR last_name LIKE '%e%'
ORDER BY
    last_name;
    
--LAST_NAME에 글자가 a와 e글자가 들어있는 사원들의 LAST_NAME 조회한 후 
--LAST_NAME 오름차순 조회   
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%e%'
    OR last_name LIKE '%e%a%'
ORDER BY
    last_name;
    
    
    
--IS NULL
--manager_id가 없는 사원들의 last_name, job_id 조회
SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    manager_id IS NULL;

--job_id가 ST_CLERK인 사원의 department_id 조회(단, 부서번호가 null인 것 제외)
SELECT DISTINCT
    department_id  --distinct 중복제거
FROM
    employees
WHERE
        job_id = 'ST_CLERK'
    AND department_id IS NOT NULL;

--commission_pct가 null이 아닌 사원들 중에서 commission = salary*commission_pct를 구한 후
--employee_id, first_name, job_id, commission 조회
SELECT
    employee_id,
    first_name,
    job_id,
    salary * commission_pct AS commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL;
    
--first_name이 Curtis인 사람의 first_name,last_name,eamil,phone_number,job_id 조회
--단, job_id 결과는 소문자로 출력한다.
SELECT
    first_name,
    last_name,
    email,
    phone_number,
    lower(job_id)
FROM
    employees
WHERE
    first_name = 'Curtis'; 

--job_id가 AD_PRES,PU_CUERK인 사원들의 EMPLOYEE_ID,FIRST_NAME,LAST_NAME,
--DEPARTMENT_ID,JOB_ID 조회, 단, 사원명은 FIRST_NAME과 LAST_NAME을 연결하여 출력
SELECT
    employee_id,
    concat(first_name, concat(' ', last_name)),
    department_id,
    job_id
FROM
    employees
WHERE
    job_id IN ( 'AD_PRES', 'PU_CUERK' );

SELECT
    employee_id,
    first_name
    || ' '
    || last_name,
    department_id,
    job_id
FROM
    employees
WHERE
    job_id IN ( 'AD_PRES', 'PU_CUERK' );

-- [실습4] 부서 80의 각 사원에 대해 적용 가능한 세율을 표시하시오.
SELECT
    last_name,
    salary,
    decode(trunc(salary / 2000, 0), 0, 0.00, 1, 0.09,
           2, 0.20, 3, 0.30, 4,
           0.40, 5, 0.42, 6, 0.44,
           0.45) AS tax_rate
FROM
    employees
WHERE
    department_id = 80;

SELECT
    last_name,
    salary,
    CASE
        WHEN salary <= 1999  THEN
            '0%'
        WHEN salary >= 2000
             AND salary <= 3999 THEN
            '0.09'
        WHEN salary >= 4000
             AND salary <= 5999 THEN
            '0.2'
        WHEN salary >= 6000
             AND salary <= 7999 THEN
            '0.3'
        WHEN salary >= 8000
             AND salary <= 9999 THEN
            '0.4'
        WHEN salary >= 10000
             AND salary <= 11999 THEN
            '0.42'
        WHEN salary >= 12000
             AND salary <= 13999 THEN
            '0.44'
        WHEN salary >= 14000 THEN
            '0.45'
    END AS tax_rate
FROM
    employees
WHERE
    department_id = 80;

-- 문1] 자신의 담당 매니저의 고용일보다 빠른 입사자 찾기(employees Self join)
SELECT
    *
FROM
    employees e1,
    employees e2
WHERE
        e1.manager_id = e2.employee_id
    AND e1.hire_date < e2.hire_date;
    
-- 문2] 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번,last_name,부서번호 조회
-- employees, department 테이블 연결, locations 테이블 연결
SELECT
    employee_id,
    last_name,
    d.department_id,
    city
FROM
    employees   e,
    departments d,
    locations   l
WHERE
        e.department_id = d.department_id
    AND d.location_id = l.location_id
    AND city LIKE 'T%';

-- 문3] 위치 id가 1700인 사원들의 last_name,부서번호,연봉 조회
-- employees,department 테이블 연결
SELECT
    last_name,
    d.department_id,
    salary,
    d.location_id
FROM
    employees   e,
    departments d
WHERE
        e.department_id = d.department_id
    AND d.location_id = 1700;

-- 문4] Exeutive 부서에 근무하는 모든 사원들의 부서정보, last_name, job-id 조회
-- employees,department 테이블 연결
SELECT
    d.department_id,
    last_name,
    job_id,
    department_name
FROM
    employees   e,
    departments d
WHERE
        e.department_id = d.department_id
    AND d.department_name = 'Executive';
    
-- LAST_NAME에 u가 포함되는 사원들과 동일 부서에 근무하는 사원들의
-- 사번 및 LAST_NAME 조회
select employee_id, last_name
from employees
where department_id 
in(select distinct department_id from employees where last_name like '%u%');

create table indexTBL as select distinct first_name,last_name,hire_date from employees; 

select * from indexTBL;
-- 인덱스 생성 전 검색 방식 : Full
select * from indextbl where first_name = 'Jack';
-- 인텍스 생성
create index idx_indexTBL_firstname on indexTBL(first_name);

-- 인덱스 생성 후 검색 방식 : index 검색 (Range scan)
select * from indextbl where first_name = 'Jack';


