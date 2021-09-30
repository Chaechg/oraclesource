--SQL 은 대소문자 구별은 안함 (쿼리문)
--데이터 문자열(' ')은 대소문자를 구별해야 한다.
--대소문자 구별은 비밀번호만 함
--문자열 표현할 때 홑따옴표 사용함

--scott 계정에 존재하는 모든 테이블 조회
SELECT
    *
FROM
    tab;
--조회(Select) : 행 단위로 조회, 열 단위로 조회

--emp 테이블의 내용을 전체조회(전체조회는 *)
SELECT
    *
FROM
    emp;

--emp 테이블의 empno,ename, job만 조회
SELECT
    empno,
    ename,
    job
FROM
    emp;

--emp 테이블의 empno, deptno 조회
SELECT
    empno,
    deptno
FROM
    emp;

--중복 제거 후 조회 : distinct
SELECT DISTINCT
    deptno
FROM
    emp;

--별칭을 붙여서 조회 : AS(alais), null 처리는 뒤에서..
SELECT
    empno AS 사원번호
FROM
    emp;

SELECT
    *
FROM
    emp;

SELECT
    ename           AS 사원명,
    job             AS "직 책",
    sal             AS 급여,
    comm            AS 추가수당,
    sal * 12 + comm AS 연봉
FROM
    emp;

--정렬 : ORDER BY 컬럼명 기준(오름차순(ASC), 내림차순(DESC) )
--ename, sal 조회할 때, sal 내림차순으로 정렬
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC; 
--오름차순은 생략가능한 기본값이다.
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;

--emp 테이블의 전체 내용을 조회하고, 단 사원번호 내림차순 정렬
SELECT
    *
FROM
    emp
ORDER BY
    empno DESC;

--전체 내용 조회(부서번호 오름차순, 급여 내림차순)
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;

--emp 테이블의 모든 열 출력, 별칭 지정, 부서번호 기준 내림차순, 사원이름 기준 오름차순 정렬
SELECT
    empno  AS employee_no,
    ename  AS employee_name,
    mgr    AS manager,
    sal    AS salary,
    comm   AS commission,
    deptno AS department_no,
    job,
    hiredate
FROM
    emp
ORDER BY
    deptno DESC,
    ename ASC;
    
--특정 조건을 기준으로 원하는 데이터를 조회 :WHERE  
--전체 데이터 조회, 단, 부서번호가 30번인 데이터 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;
--사원번호가 7782번 조회
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;
--부서번호가 30번이고, 사원직책이 slaesman인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'salesman';

--부서번호가 30이거나 사원직책이 clerk인 사원조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';
-- >,<,>=,<= 사용 가능

--산술연사자를 사용한 where
--연봉이3600인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

--월급이 3000보다 큰 사원조회
SELECT
    *
FROM
    emp
WHERE
    sal > 3000;
--혹은 월급이 3000 이산인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;
--이름의 첫 글자가 F 이후인 사원을 조회
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

--급여가 2500이상이고, 직업이 ANALYST인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal > 2500
    AND job = 'ANALYST';
--직무가 SALESMAN 이거나, CLERK이거나, MANAGER인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job = 'SALESMAN'
    OR job = 'CLERK'
    OR job = 'MANAGER';

--등가비교연산자(같음 => =,같지 않음(3개) => !=,<>,^=)
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;
--not을 쓸 수도 있다.
SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;

--IN  =>or을 여러개 쓰는 것보다는 낫다.
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'SALESMAN', 'CLERK', 'MANAGER' );

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'SALESMAN', 'CLERK', 'MANAGER' );

--부서 번호가 10,20번 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );

--BETWEEN A AND B

--급여가 2000~3000 사이인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;

SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;
    
--급여가 2000~3000 사이가 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

--LIKE 연산자와 와일드 카드
--일부 문자열이 포함된 데이터 조회
--와일드카드
--1) % : 길이와 상관없이 모든 문자 데이터를 의미
--2) _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미

--사원명이 S로 시작하는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

--사원명의 두번째 글자가 L인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

--사원명에 AM 문자가 포함되어 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

----사원명에 AM 문자가 포함되어 있지 않은 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';


--IS NULL
--null은 =을 쓸 수 없다.
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;
--null 은 0이 아니고 완전히 비어 있는 상태를 의미한다.
--MGR이 null인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;
--MGR이 null이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;


--집합 연산자 : 합집합 - UNION(중복값 제거), UNION ALL(중복값을 제거하지 않음), 
--                  - 자료형이 같고 갯수도 같으면 함께 출력한다. 
--                  - 단, 열 이름은 첫번째 것을 기준으로 나온다.
--            교집합 - INTERSECT
--            차집합 - MINUS

--EMPNO,ENAME,SAL,DEPNO 조회 (부서번호가 10번이거나 20번인)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    sal,
    job,
    deptno,
    sal
FROM
    emp
WHERE
    deptno = 20;    

--전체에서 deptno가 10인 부서를 제외 
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

--INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;


-- 오라클 함수
-- 내장 함수 - 1) 문자함수
--              I.대소문자 변경
--              UPPER(문자열) : 괄호 안 문자를 모두 대문자로 변환
--              LOWER(문자열) : 괄호 안 문자를 모두 소문자로 변환
--              INITCAP(문자열) : 괄호 안 문자 중 첫글자만 대문자로 변환, 나머지는 소문자

SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;

SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;
--ENAME이 SCOTT 찾기  
SELECT
    *
FROM
    emp
WHERE
    ename = 'scott'; --나오지 않음. 
SELECT
    *
FROM
    emp
WHERE
    lower(ename) = 'scott'; --대문자인 SCOTT를 소문자로 전환 후 찾기
SELECT
    *
FROM
    emp
WHERE
    lower(ename) LIKE lower('%scott%');--사용자의 입력값을 바꿔서 찾기 쉽게

-- 내장 함수 - 1) 문자함수
--              II.문자 길이 구하기
--              LENGTH(문자열) : 해당 문자열의 길이를 돌려줌
--              LENGTHB(문자열) : 해당 문자열의 바이트수 돌려줌
SELECT
    ename,
    length(ename)
FROM
    emp;
--한글 한 자당 3byte 사용
--DUAL : 데이터베이스 관리자가 소유한 테이블 / 임시 연산이나 함수의 결과 값 확인 용도
SELECT
    length('한글'),
    lengthb('한글')
FROM
    dual;

--JOB이 6글자 이상인 사원들 조회
SELECT
    *
FROM
    emp
WHERE
    length(job) >= 6;


-- 내장 함수 - 1) 문자함수
--              III.문자열 일부 추출하기
--              SUBSTR(문자열데이터, 시작위치, 추출길이)
--              SUBSTR(문자열데이터, 시작위치)
SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;
--EMP 테이블의 모든 사원 이름을 세 번째 글자부터 끝까지 출력하기
SELECT
    ename,
    substr(ename, 3)
FROM
    emp;

-- 내장 함수 - 1) 문자함수
--           IV.문자열 데이터 안에서 특정 문자 찾기
--           INSTR(문자열, 찾을 문자열,시작위치(옵션), 몇번째에 있는 걸 찾을 것인지(옵션))
SELECT
    instr('HELLO, ORACLE!', 'L'), --첫번째 있는 L
    instr('HELLO, ORACLE!', 'L', 5), --5번째 이후 첫번째 있는 L
    instr('HELLO, ORACLE!', 'L', 2, 2) --2번째 이후부터 2번째 있는 L의 위치
FROM
    dual;
    
 --원본 문자열 : 이것이 Oracle이다. 이것도 오라클이다.
 --찾을 분자열 : 이것
 
 --제일 처음에 나오는 이것의 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것')
FROM
    dual;
 --시작위치를 3으로 지정한 후 나오는 위치를 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 3)
FROM
    dual;
 --이것이 두번째로 나오는 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 1, 2)
FROM
    dual;
  
 --사원 이름에 문자 S가 있는 사원 구하기
SELECT
    *
FROM
    emp
WHERE
    instr(ename, 'S') > 0;

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S%';
 
-- 내장 함수 - 1) 문자함수
--            V.특정 문자를 다른 문자로 바꾸는 함수
--            REPLACE(문자열 데이터 또는 열이름,찾는 문자, 바꿀 문자)
 
 --010-1234-5678 => 010 1234 5678, 01012345678
SELECT
    '010-1234-5678'                    AS 원본,
    replace('010-1234-5678', '-', ' ') AS replace1,
    replace('010-1234-5678', '-')      AS replace2
FROM
    dual;
    
-- 내장 함수 - 1) 문자함수
--           VI.두 문자열 데이터를 합치는 함수
--           CONCAT(문자열1, 문자열2)

--EMPNO, ENAME 합쳐서 조회
SELECT
    empno,
    ename,
    concat(empno, ename)
FROM
    emp
WHERE
    ename = 'SCOTT';

--7788:SCOTT 
SELECT
    empno,
    ename,
    concat(empno, concat(':', ename)) --CONCAT의 인수는 2개뿐이므로, 하나를 추가하려면 concat을 더 쓴다.
FROM
    emp
WHERE
    ename = 'SCOTT';
    
-- || : 문자열 데이터 연결 연산자  
SELECT
    empno || ename,
    empno
    || ' : '
    || ename
FROM
    emp
WHERE
    ename = 'SCOTT';
    
-- 문자열 함수 : 공백 제거
--             TRIM : 양쪽 공백 제거
--            LTRIM : 왼쪽 공백 제거
--            RTRIM : 오른쪽 공백 제거
SELECT
    '    이것이      ',
    TRIM('    이것이      ')
FROM
    dual;

--TRIM(삭제옵션(선택), 삭제할 문자(선택),from 원본문자열)
SELECT
    '['
    || TRIM('_' FROM '__Oracle__')
    || ']' AS trim,
    '['
    || TRIM(LEADING '_' FROM '__Oracle__')
    || ']' AS trim_reading,
    '['
    || TRIM(TRAILING '_' FROM '__Oracle__')
    || ']' AS trim_trailing,
    '['
    || TRIM(BOTH '_' FROM '__Oracle__')
    || ']' AS trim_both
FROM
    dual;

-- 숫자함수 : ROUND(숫자, 반올림 위치(선택))
--          TRUNC(숫자, 버림 위치(선택))
--          CEIL(숫자) : 입력된 숫자와 가장 가까운 큰 정수
--          FLOOR(숫자) : 입력된 숫자와 가장 가까운 작은 정수
--          MOD(숫자, 나눌숫자) : 나머지 값

SELECT
    round(1234.5678)      AS round,
    round(1234.5678, 0)   AS round0,
    round(1234.5678, 1)   AS round1,
    round(1234.5678, 2)   AS round2,
    round(1234.5678, - 1) AS round_minus1,
    round(1234.5678, - 2) AS round_minus2
FROM
    dual;

SELECT
    trunc(1234.5678)      AS trunc,
    trunc(1234.5678, 0)   AS trunc0,
    trunc(1234.5678, 1)   AS trunc1,
    trunc(1234.5678, 2)   AS trunc2,
    round(1234.5678, - 1) AS trunc_minus1,
    trunc(1234.5678, - 2) AS trunc_minus2
FROM
    dual;

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;

SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;

-- 날짜 함수
-- SYSDATE : 오라클 데이터베이스 서버가 설치된 OS의 현재 날짜와 시간
-- ADD_MONTHS : 몇 개월 이후 날짜를 구하는 함수
-- MONTHS_BETWEEN : 두 날짜 간의 개월 수 차이 구하기
SELECT
    sysdate     AS now,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;

SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;

-- 입사 20주년이 되는 날짜 조회
SELECT
    ename,
    hiredate,
    add_months(hiredate, 240)
FROM
    emp;

--현재 날짜를 기준으로 입사 40년 미만인 사원 조회
SELECT
    ename,
    hiredate
FROM
    emp
WHERE
    add_months(hiredate, 480) > sysdate; 

-- 날짜 함수
-- MONTHS_BETWEEN : 두 날짜 간의 개월 수 차이 구하기

SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    months_between(sysdate, hiredate)        AS month1,
    months_between(hiredate, sysdate)        AS month2,
    trunc(months_between(sysdate, hiredate)) AS month3
FROM
    emp;
    
    
-- 날짜 함수
-- NEXT_DAY(날짜, 요일문자) : 돌아오는 특정 요일
-- LAST_DAY(날짜) : 그 달의 마지막 날

SELECT
    sysdate,
    next_day(sysdate, '월요일'),
    last_day(sysdate)
FROM
    dual;

-- 형변환 함수
-- TO_CHAR() : 숫자 또는 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환

SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD') AS 현재날짜
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'MM') AS 현재월
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'MON') AS 현재월
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH:MI:SS') AS 현재시간
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH12:MI:SS AM') AS 현재시간
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH24:MI:SS') AS 현재시간
FROM
    dual;

SELECT
    sal,
    to_char(sal, '$999,999') AS sal_$,
    to_char(sal, '$000,000') AS sal_$2,
    to_char(sal, 'L999,999') AS sal_l
FROM
    emp;
--L(Locale) : 지역화폐단위를 붙여서 출력
--9는 숫자 한자리를 의미
--0도 숫자 한자리를 의미하나, 빈자리를 채우는 개념

SELECT
    to_number('1300')
FROM
    dual;

SELECT
    to_number('1,300', '999,999')
FROM
    dual;

SELECT
    TO_DATE('2021-09-12', 'yyyy-mm-dd') AS todate1,
    TO_DATE('20210912', 'yyyy-mm-dd')   AS todate2
FROM
    dual;

--날짜 데이터는 연산이 가능함
--1981-06-01 이후 입사자
SELECT
    *
FROM
    emp
WHERE
    hiredate > TO_DATE('1981/06/01', 'YYYY-MM-DD');

-- 널처리 함수 
-- NVL(데이터, null이면 반환할 값)
-- NVL2(데이터, null이 아닐 경우 반환할 값, null이면 반환할 값)
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm
FROM
    emp;

SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm,
    nvl(comm, 0),
    sal + nvl(comm, 0)
FROM
    emp;

SELECT
    empno,
    ename,
    sal,
    comm,
    nvl2(comm, 'O', 'X'),
    nvl2(comm, sal * 12 + comm, sal * 12)
FROM
    emp;

-- DECODE 함수
-- DECODE([검사대상이 될 열 또는 데이터],
--        [조건1],[데이터가 조건 1과 일치할 때 반환할 결과],
--        [조건2],[데이터가 조건 2와 일치할 때 반환할 결과],  
--        ....
--        [위 조건에서 만족하는 경우가 없을 때 반환할 결과]


-- job에 따라 급여의 비율 설정
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05,
           'ANALYST', sal, sal * 1.03) AS upsal
FROM
    emp;

-- CASE : DECOD 문으로 작성할 수 있는 것들은 모두 변환 가능
--        =의 의미로 사용되지만 다른 조건도 가능하다. 

SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER'  THEN
            sal * 1.1
        WHEN 'SALESMAN' THEN
            sal * 1.05
        WHEN 'ANALYST'  THEN
            sal
        ELSE
            sal * 1.03
    END AS upsal
FROM
    emp;

-- COMM이 널이면 '해당사항 없음', 0이면 '수당없음', 0보다 크면 '수당 :2500' 출력
-- 캡쳐 파일 111 확인
SELECT
    empno,
    ename,
    comm,
    CASE
        WHEN comm IS NULL THEN
            '해당사항 없음'
        WHEN comm = 0 THEN
            '수당없음'
        WHEN comm > 0 THEN
            '수당 : ' || comm
    END AS comm_text
FROM
    emp;
    
-- [실습1] EMP 테이블에서 사원들의 월 평균 근무일수는 21.5일이다. 
-- 하루 근무 시간을 8시간으로 보았을 때 사원들의 하루 급여(DAY_PAY)와 
-- 시급(TIME_PAY)를 계산하여 결과를 출력한다. 
-- 단, 하루 급여는 소수점 셋째 자리에서 버리고, 시급은 두 번째 소수점에서 반올림하시오.
-- 하루급여 = 월급 / 21.5
-- 시급 = 하루급여 / 8

SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5, 2)     AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;
    
-- [실습2] EMP 테이블에서 사원들은 입사일(HIREDATE)을 기준으로 
-- 3개월이 지난 후 첫 월요일에 정직원이 된다. 
-- 사원들이 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 아래와 같이 출력하시오. 
-- 단, 추가수당(COMM)이 없는 사원의 추가 수당은 N/A로 출력하시오.
SELECT
    empno,
    ename,
    hiredate,
    next_day(add_months(hiredate, 3), '월요일') AS r_job,
    CASE
        WHEN comm IS NULL THEN
            'N/A'
        WHEN comm > 0 THEN
            '' || comm
    END                                      AS comm
FROM
    emp;

SELECT
    comm,
    nvl(comm, 0)
FROM
    emp;

SELECT
    comm,
    nvl(comm, '0')
FROM
    emp;
-- 아래는 타입이 맞지 않으므로 에러가 난다.
SELECT
    comm,
    nvl(comm, 'N/A')
FROM
    emp;

SELECT
    comm,
    nvl(to_char(comm), 'N/A')
FROM
    emp;

SELECT
    empno,
    ename,
    hiredate,
    next_day(add_months(hiredate, 3), '월요일') AS r_job,
    nvl(to_char(comm), 'N/A')                AS comm
FROM
    emp;
    
-- [실습3] EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(MGR)를 
-- 다음과 같은 조건을 기준으로 변환해서 CHG_MGR 열에 출력하시오.
--직속상관의 사원 번호가 존재하지 않을 경우 : 0000
--직속상관의 사원 번호 앞 두자리가 75일 경우 : 5555
--직속상관의 사원 번호 앞 두자리가 76일 경우 : 6666
--직속상관의 사원 번호 앞 두자리가 77일 경우 : 7777
--직속상관의 사원 번호 앞 두자리가 78일 경우 : 8888
--그 외 직속 상관 사원 번호의 경우 : 본래 직속 상관의 사원번호 그대로 출력
SELECT
    empno,
    ename,
    mgr,
    CASE
        WHEN mgr IS NULL THEN
            '0000'
        WHEN substr(to_char(mgr), 1, 2) = 75 THEN -- when mgr like '75%' then '5555' 도 가능하다.
            '5555'
        WHEN substr(to_char(mgr), 1, 2) = 76 THEN
            '6666'
        WHEN substr(to_char(mgr), 1, 2) = 77 THEN
            '7777'
        WHEN substr(to_char(mgr), 1, 2) = 78 THEN
            '8888'
        ELSE
            to_char(mgr)
    END AS chg_mgr
FROM
    emp;

SELECT
    empno,
    ename,
    mgr,
    decode(substr(to_char(mgr), 1, 2), NULL, '0000', '75', '5555',
           '76', '6666', '77', '7777', '78',
           '8888', to_char(mgr)) AS chg_mgr
FROM
    emp;
    
-- 다중행 함수 : SUM(), COUNT(), MAX(), MIN(), AVG()
SELECT
    SUM(sal)
FROM
    emp; --하나만 나올 수 있는 함수이다.
SELECT
    SUM(sal),
    ename
FROM
    emp;  --단일 그룹의 그룹 함수가 아닙니다

--EMP 테이블의 데이터 개수 조회
SELECT
    COUNT(*)
FROM
    emp;

SELECT
    COUNT(empno)
FROM
    emp;

SELECT
    COUNT(sal)
FROM
    emp;

SELECT
    COUNT(DISTINCT sal)
FROM
    emp; --중복된 급여 제거

-- 부서번호가 10번인 사원의 최대 급여
SELECT
    MAX(sal)
FROM
    emp
WHERE
    deptno = 10;
-- 부서번호가 10번인 사원의 최소 급여
SELECT
    MIN(sal)
FROM
    emp
WHERE
    deptno = 10;
--부서번호가 20번인 사원 중에서 제일 오래된 입사일 조회 
SELECT
    MIN(hiredate)
FROM
    emp
WHERE
    deptno = 20;
--부서번호가 30번인 사원들의 평균 급여
SELECT
    round(AVG(sal), 1)
FROM
    emp
WHERE
    deptno = 30;

SELECT
    round(avg(DISTINCT sal), 1)
FROM
    emp
WHERE
    deptno = 30;

-- GROUP BY 그룹화할 열 지정(여러 개 지정 가능)
-- 부서별 급여의 합 조회
SELECT
    SUM(sal),
    deptno
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;
-- 부서별 급여 평균 조회
SELECT
    round(AVG(sal), 1),
    deptno
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;
-- 부서별, 직무별 급여 평균 조회
SELECT
    AVG(sal),
    deptno,
    job   --group by한 것만 들어올 수 있다.
FROM
    emp
GROUP BY
    deptno,
    job
ORDER BY
    deptno,
    job;

-- group by ~ having 조건식

-- 부서별, 직무별, 급여 평균 조회(단, 급여의 평균이 2000 이상)
--select avg(sal), deptno, job 
--from emp
--where avg(sal) >= 2000 --그룹 함수는 허가되지 않습니다 where절에 그룹함수를 쓸 수 없음
--group by deptno, job
--order by deptno, job;
SELECT
    AVG(sal),
    deptno,
    job
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000
ORDER BY
    deptno,
    job;

SELECT
    AVG(sal),
    deptno,
    job
FROM
    emp
WHERE
    sal <= 3000 --① 출력 대상이 되는 행 제한
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000 --② 그룹화한 행 제한
ORDER BY
    deptno,
    job;

-- [실습1] EMP 테이블을 이용하여 부서번호(DEPTNO), 평균급여(AVG_SAL), 
-- 최고급여(MAX_SAL), 최저급여(MIN_SAL), 사원수(CNT)를 출력한다. 
-- 단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서번호별로 출력하는 SQL 문을 작성하시오.
SELECT
    deptno,
    floor(AVG(sal)) AS avg_sal,
    MAX(sal)        max_sal, -- as는 생략할 수 있다.
    MIN(sal)        min_sal,
    COUNT(*)        cnt
FROM
    emp
GROUP BY
    deptno;

--[실습2]같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력하는 SQL문을 작성하시오.
SELECT
    job,
    COUNT(*)
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(job) >= 3;

-- [실습3]사원들의 입사연도(HIRE_YEAR)를 기준으로 
-- 부서별로 몇 명이 입사했는지 출력하는 SQL문 작성하시오.
SELECT
    to_char(hiredate, 'YYYY') AS hire_year,
    deptno,
    COUNT(deptno)             AS cnt
FROM
    emp
GROUP BY
    to_char(hiredate, 'YYYY'),
    deptno
ORDER BY
    hire_year DESC,
    deptno ASC;

-- 데이터 삽입, 삭제, 수정 : 결과는 실행된 행의 갯수로 넘어옴

-- 실습용 테이블 생성
CREATE TABLE dept_temp
    AS
        SELECT
            *
        FROM
            dept;

SELECT
    *
FROM
    dept_temp; 

-- insert : 테이블 삽입
-- insert into 테이블명(필드명....) values(값1, 값2 ....)
-- insert into 테이블명 values (값1, 값2 ...)

INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

INSERT INTO dept_temp VALUES (
    60,
    'NETWORK',
    'BUSAN'
);

INSERT INTO dept_temp VALUES (
    'NETWORK',
    'BUSAN',
    70
);  --수치가 부적합합니다 
--위의 경우는 반드시 필드명 순서에 따라 값을 넣어주어야 한다.
INSERT INTO dept_temp (
    dname,
    loc,
    deptno
) VALUES (
    'NETWORK',
    'BUSAN',
    70
);
--위는 필드명에 따라 값을 넣어준다. 순서에 상관이 없이

--insert into dept_temp(deptno, dname,loc) values(500,'DATABASE','SEOUL');
--이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다. 
-- deptno는 두 자리까지만 허용

-- NULL 삽입하는 방법(테이블 생성시 null이 가능하도록 열이 설정되어 있는 경우만 사용 가능
INSERT INTO dept_temp (
    deptno,
    dname
) VALUES (
    90,
    'DATABASE'
);
-- loc가 없어도 삽입 가능하다.
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    91,
    'WEB',
    NULL
);

INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    92,
    'MOBILE',
    ''
);

COMMIT;

-- 실습용 테이블 생성
-- 테이블 구조는 복사하되, 데이터는 복사하고 싶지 않을 때
CREATE TABLE emp_temp
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;

SELECT
    *
FROM
    emp_temp;

DESC emp_temp;  --describe : 테이블 형식을 보여줌

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    1111,
    '홍길동',
    'manager',
    NULL,
    '2021-09-27',
    4000,
    NULL,
    10
);

INSERT INTO emp_temp VALUES (
    2222,
    '성춘향',
    'analyst',
    NULL,
    '2021/09/27',
    5000,
    NULL,
    10
);

INSERT INTO emp_temp VALUES (
    3333,
    '박보검',
    'analyst',
    NULL,
    sysdate,
    5000,
    NULL,
    10
);

SELECT
    *
FROM
    emp_temp;

COMMIT;

-- UPDATE : 수정
-- UPDATE 테이블명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값....
-- UPDATE 테이블명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값....WHERE 수정할 조건

SELECT
    *
FROM
    dept_temp;

UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = 90;

UPDATE dept_temp
SET
    loc = 'BUSAN'
WHERE
    deptno = 91;

COMMIT;

SELECT
    *
FROM
    emp_temp;

-- sal이 4000이하인 사원만 추가 수당을 50으로 변경
UPDATE emp_temp
SET
    comm = 50
WHERE
    sal <= 4000;

COMMIT;

UPDATE emp_temp
SET
    sal = 1500
WHERE
    empno = 7369;

UPDATE emp_temp
SET
    comm = 100;   --값이 더해지지는 않는다.

ROLLBACK;

-- DELETE : 삭제
-- DELETE 테이블명 WHERE 삭제할 데이터 조건
-- DELETE FROM 테이블명 WHERE 삭제할 데이터 조건 --FROM은 옵션

CREATE TABLE emp_temp2
    AS
        SELECT
            *
        FROM
            emp;

SELECT
    *
FROM
    emp_temp2;

-- JOB이 MANAGER인 사원 삭제
DELETE emp_temp2
WHERE
    job = 'MANAGER';

-- 전체 사원 삭제
DELETE emp_temp2;

ROLLBACK;

-- 조인+ : 두 개 이상의 테이블을 연결하여 하나의 테이블처럼 출력할 때 사용하는 방식

SELECT
    COUNT(*)
FROM
    emp;

SELECT
    COUNT(*)
FROM
    dept;

-- 카테시안 조인 : 나올 수 있는 모든 조합 (14행 * 4행 = 56행)
SELECT
    *
FROM
    emp,
    dept; 
-- 내부조인(inner 조인)
-- 등가 조인 : 일치하는 데이터를 기준으로 조인
-- 비등가 조인 : 특정 범위에 있는 데이터 추출

SELECT
    *
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno;
-- emp 테이블의 deptno와 dept테이블의 deptno가 일치하는 경우
-- 왼쪽 테이블인 emp 테이블이 기준이 된다.

--  "column ambiguously defined" 열의 정의가 애매합니다
-- 어느 테이블의 deptno를 보여줄 지 알 수 없다.
SELECT
    empno,
    ename,
    deptno,
    dname
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno;
-- 기준을 정해주면 오류 해결
SELECT
    empno,
    ename,
    emp.deptno,
    dname
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno;

SELECT
    empno,
    ename,
    emp.deptno,
    dname
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno
ORDER BY
    dname;

SELECT
    empno,
    ename,
    e.deptno,
    dname
FROM
    emp  e,
    dept d  --테이블에 별칭을 설정할 수 있다.
WHERE
    e.deptno = d.deptno
ORDER BY
    dname;

-- sal이 3000 이상인 사원들의 사번, 이름, 부서번호, 부서명, 급여 조회
SELECT
    empno,
    ename,
    d.deptno,
    dname,
    sal
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal >= 3000;

-- 급여가 2500 이하이고, 사원번호가 9999 이하인 사원의 사번,이름,급여,부서명,부서위치
SELECT
    empno,
    ename,
    sal,
    dname,
    loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal <= 2500
    AND empno <= 9999;

--비등가 조인
SELECT
    *
FROM
    salgrade;

SELECT
    *
FROM
    emp;
-- emp 테이블의 급여가 salgrade 특정 범위에 속하면 grade 값 조회
SELECT
    *
FROM
    emp      e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal;

-- 자체 조인(셀프 조인) : 본인 테이블과 조인
SELECT
    *
FROM
    emp;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno;

-- 외부조인(Outer join)
-- 왼쪽 외부조인 (left outer join) : 일치하지 않아도 왼쪽 테이블을 기준으로 다 보여준다.
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno (+);

-- 오른쪽 외부조인 (right outer join) : 일치하지 않아도 왼쪽 테이블을 기준으로 다 보여준다.
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr (+) = e2.empno;

-- 양쪽 외부 조인(+ 기호는 제공안함)
-- outer-join된 테이블은 1개만 지정할 수 있습니다
--select e1.empno,e1.ename,e1.mgr,e2.empno,e2.ename
--from emp e1, emp e2
--where e1.mgr(+) = e2.empno(+);

-- 모든 데이터베이스에서 사용 가능한 표준 조인 구문
-- join ~ on
SELECT
    empno,
    ename,
    emp.deptno,
    dname
FROM
         emp
    JOIN dept ON emp.deptno = dept.deptno
ORDER BY
    dname;

SELECT
    empno,
    ename,
    d.deptno,
    dname,
    sal
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    sal >= 3000;

SELECT
    empno,
    ename,
    sal,
    dname,
    loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        sal <= 2500
    AND empno <= 9999;

SELECT
    *
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;

-- OUTER 표준 구문
-- 왼쪽 외부조인 (left outer join)
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno;
-- 오른쪽 외부조인
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    RIGHT OUTER JOIN emp e2 ON e1.mgr = e2.empno;
-- full outer join
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    FULL OUTER JOIN emp e2 ON e1.mgr = e2.empno;

-- [실습1] 급여가 2000초과인 사원들의 부서정보, 사원정보를 출력
-- deptno, dname, empno, ename, sal
SELECT
    d.deptno,
    dname,
    empno,
    ename,
    sal
FROM
    emp  e,
    dept d
WHERE
        d.deptno = e.deptno
    AND sal > 2000
ORDER BY
    d.deptno;

SELECT
    d.deptno,
    dname,
    empno,
    ename,
    sal
FROM
         emp e
    JOIN dept d ON d.deptno = e.deptno
WHERE
    sal > 2000
ORDER BY
    d.deptno;


--[실습2] 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수를 출력
SELECT
    d.deptno,
    dname,
    floor(AVG(sal)) AS avg_sal,
    MAX(sal)        AS max_sal,
    MIN(sal)        AS min_sal,
    COUNT(*)        AS cnt
FROM
    emp  e,
    dept d
WHERE
    d.deptno = e.deptno
GROUP BY
    d.deptno,
    dname;

SELECT
    d.deptno,
    dname,
    floor(AVG(sal)) AS avg_sal,
    MAX(sal)        AS max_sal,
    MIN(sal)        AS min_sal,
    COUNT(*)        AS cnt
FROM
         emp e
    JOIN dept d ON d.deptno = e.deptno
GROUP BY
    d.deptno,
    dname;

--[실습3] 모든 부서정보와 사원 정보를 아래와 같이 부서번호, 사원이름 순으로 출력
--deptno,dname,empno,ename,job,sal
SELECT
    d.deptno,
    dname,
    empno,
    ename,
    job,
    sal
FROM
    emp  e,
    dept d
WHERE
    e.deptno (+) = d.deptno  --left outer join
ORDER BY
    d.deptno,
    e.empno;

SELECT
    d.deptno,
    dname,
    empno,
    ename,
    job,
    sal
FROM
    dept e
    LEFT OUTER JOIN emp  d ON d.deptno = e.deptno
ORDER BY
    d.deptno,
    e.empno;

-- 세 개 테이블 조인
SELECT
    *
FROM
    emp e1,
    emp e2,
    emp e3
WHERE
        e1.empno = e2.empno
    AND e2.empno = e3.empno;

SELECT
    *
FROM
         emp e1
    JOIN emp e2 ON e1.empno = e2.empno
    JOIN emp e3 ON e2.empno = e3.empno;

--[실습4] 모든 부서정보와 사원정보, 급여등급 정보, 
-- 각 사원의 직속상관의 정보 부서번호, 사원번호 순으로 정렬하여 출력

-- emp e1 테이블과 dept 테이블 조인 => dept 테이블이 기준 (dept 테이블 내용 모두 출력)
SELECT
    *
FROM
    emp  e1,
    dept d1
WHERE
    e1.deptno (+) = d1.deptno;

-- 첫번째 연결 결과랑 salgrade 조인
-- 40번 부서의 sal은 null이므로 그냥 조인하면 없어지므로, dept를 기준으로 한다.
-- losal, hisal 모두 십자가 표시
SELECT
    *
FROM
    emp      e1,
    dept     d1,
    salgrade s1
WHERE
        e1.deptno (+) = d1.deptno
    AND e1.sal BETWEEN s1.losal (+) AND s1.hisal (+);

-- 두번째 결과의 mgr이랑 emp e2 테이블의 empno랑 조인
SELECT
    d1.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    s1.losal,
    s1.hisal,
    grade,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp      e1,
    dept     d1,
    salgrade s1,
    emp      e2
WHERE
        e1.deptno (+) = d1.deptno
    AND e1.sal BETWEEN s1.losal (+) AND s1.hisal (+)
    AND e1.mgr = e2.empno (+)
ORDER BY
    d1.deptno,
    e1.ename;

SELECT
    d1.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    s1.losal,
    s1.hisal,
    grade,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp      e1
    RIGHT OUTER JOIN dept     d1 ON e1.deptno = d1.deptno
    LEFT OUTER JOIN salgrade s1 ON e1.sal BETWEEN s1.losal AND s1.hisal
    LEFT OUTER JOIN emp      e2 ON e1.mgr = e2.empno
ORDER BY
    d1.deptno,
    e1.ename;
    

-- 서브쿼리 : sql 문을 실행하는데 필요한 데이터를 추가로 조회하기 위해 
--          sql 문 내부에서 사용하는 select 문을 말함
--          연사자와 같은 비교 또는 조회대상의 오른쪽에 놓여서 괄호로 묶어서 사용
--          서브쿼리의 SELECT 절에 명시한 열은 메인쿼리의 비교 대상과 같은 자료형과
--          같은 개수로 지정

-- JONES 사원의 급여보다 높은 급여를 받는 사원 조회
-- 1) JONES 사원의 급여를 조회
SELECT
    sal
FROM
    emp
WHERE
    ename = 'JONES';  
-- 2) 2975보다 큰 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal > 2975;

-- 단일행 서브쿼리 (메인+(서브쿼리))
-- 서브쿼리 결과가 단 하나의 행으로 나온 상황
-- >, >=, =, <=, <, <>, ^=, !=
SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'JONES'
    );

-- ALLEN 사원의 추가 수당보다 많은 추가수당을 받는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    comm > (
        SELECT
            comm
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );

-- WARD 사원의 입사일보다 빨리 입사한 사원 목록 조회
SELECT
    *
FROM
    emp
WHERE
    hiredate < (
        SELECT
            hiredate
        FROM
            emp
        WHERE
            ename = 'WARD'
    );

-- 20번 부서에 속한 사원 중 전체 사원의 평균급여보다 높은 급여를 받은 사원정보
-- (사원번호,사원명,직업,급여)와 소속부서정보(부서번호,부서명,부서위치)를 조회
SELECT
    empno,
    ename,
    job,
    sal,
    d.deptno,
    dname,
    loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND d.deptno = 20
    AND e.sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    );

-- 다중행 서브쿼리
-- 서브쿼리 실행결과가 여러 개로 나오는 걸 의미
-- IN : 메인 쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치하면 true
-- ANY(SOME) : 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true
--           : 연산자가 같이 들어온다.
-- ALL : 메인 쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 true
-- EXISTS : 서브쿼리의 결과가 존재하면(행 1개 이상 존재하면) true

-- 부서별 최고 급여와 같은 사원을 조회
--SELECT *
--FROM emp
--WHERE sal > (SELECT MAX(sal) FROM emp GROUP BY deptno);
SELECT *
FROM emp
WHERE sal IN (SELECT MAX(sal) FROM emp GROUP BY deptno);

-- ANY(SOME)
SELECT *
FROM emp
WHERE sal = any (SELECT MAX(sal) FROM emp GROUP BY deptno);

-- 30번 부서 사원들의 최고 급여보다 적은 사원을 조회
SELECT *
FROM emp
WHERE sal < any (SELECT MAX(sal) FROM emp where deptno=30);

SELECT *
FROM emp
WHERE sal < any (SELECT sal FROM emp where deptno=30);
-- MAX가 빠져도 하나의 조건만 만족하면 되기 때문에 위의 결과와 동일하다.

-- 30번 부서 사원들의 최고 급여보다 많은 사원을 조회
SELECT *
FROM emp
WHERE sal > any (SELECT sal FROM emp where deptno=30);

-- ALL
-- 30번 부서 사원들의 최고 급여보다 적은 사원을 조회
SELECT *
FROM emp
WHERE sal < ALL (SELECT sal FROM emp where deptno=30);
-- 30번 부서 사원들의 최고 급여보다 많은 사원을 조회
SELECT *
FROM emp
WHERE sal > ALL (SELECT sal FROM emp where deptno=30);

-- EXISTS
select * from emp where exists (select dname from dept where deptno = 10);

-- 문제] 전체 사원 중 ALLEN과 같은 직책인 사원들의 사원정보, 부서정보 출력하기
-- ename, empno, job, sal, deptno, dname 출력
select ename, empno, job, sal, d.deptno, dname
from emp e, dept d
where e.deptno = d.deptno and e.job
                            in (select job from emp where ename='ALLEN');
-- 문제] 전체 사원들의 평균 급여보다 높은 급여를 받는 사원들의 사원정보,부서정보,급여등급
-- 출력하기 (급여가 많은 순으로 정렬하되 급여가 같은 경우에는 사원번호를 오름차순으로 정렬)
select ename, empno, job, sal, d.deptno, dname,grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno and e.sal between s.losal and s.hisal
                and e.sal > (select avg(sal) from emp)
                order by e.sal desc, empno asc; 

-- 비교할 열이 여러 개인 다중열 서브쿼리 
-- 여러 개 비교 가능 단, 조건식이 모두 같아야 한다. 
SELECT *
FROM emp
WHERE (deptno,sal) IN (SELECT deptno,MAX(sal) FROM emp GROUP BY deptno);

-- FROM 서브쿼리 (인라인 뷰)
select empno,ename,d.deptno,dname,loc
from (select * from emp where deptno=10) e10, (select*from dept)d
where e10.deptno=d.deptno;

-- INSERT 사용하는 서브쿼리
-- VALUES 절은 사용하지 않음
-- 데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치해야 한다.
-- 데이터가 추가되는 테이블의 자료형과 서브쿼리의 자료형이 일치해야 한다.

-- EMP 테이블에서 SALGRADE 테이블을 참조하여 급여 등급이 1인 사원만을 
-- EMP_TEMP에 추가하기
select *
from emp e, salgrade s
where e.sal between s.losal and s.hisal and s.grade=1;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
select e.empno,e.ename,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno
from emp e, salgrade s
where e.sal between s.losal and s.hisal and s.grade=1;

-- UPDATE 서브쿼리
select * from dept_temp;

-- 40번 부서의 부서 이름과 지역 수정(DEPT 테이블의 DEPTNO = 30인 지역명, 부서명 추출)
select dname,loc
from dept
where deptno=30;

update dept_temp
set (dname,loc) = (select dname,loc from dept where deptno=30)
where deptno=40;
--where절에도 서브쿼리를 넣을 수 있다.
update dept_temp
set loc='SEOUL'
where deptno =(select deptno from dept_temp where dname='ACCOUNTING');

-- DELETE 서브쿼리
select * from emp_temp;

-- 급여 등급이 3등급이고 30번 부서인 사원들만 삭제
delete emp_temp
where empno in (select empno 
                from emp_temp e, salgrade s
                where e.sal between s.losal and s.hisal
                and s.grade = 3 and deptno = 30);
-- ppt oracle_05, 31s
-- [실습1]
-- ① EMP 테이블의 내용을 이용하여 EXAM_EMP 생성
create table exam_emp as select * from emp;
-- ② DEPT 테이블의 내용을 이용하여 EXAM_DEPT 생성
create table exam_dept as select * from dept;
-- ③ SALGRADE 테이블의 내용을 이용하여 EXAM_SALGRADE 생성
create table exam_salgrade as select * from salgrade;

-- [실습2]
select * from exam_emp;

insert into exam_emp
values (7201,'TEST_USER1','MANAGER',7788,'2016-01-02',4500,null,50);  
insert into exam_emp
values (7202,'TEST_USER2','CLERK',7201,'2016-02-21',1800,null,50);
insert into exam_emp
values (7203,'TEST_USER3','ANALYST',7201,'2016-04-11',3400,null,60);
insert into exam_emp
values (7204,'TEST_USER4','SALESMAN',7201,'2016-05-31',2700,300,60);
insert into exam_emp
values (7205,'TEST_USER5','CLERK',7201,'2016-07-20',2600,null,70);
insert into exam_emp
values (7206,'TEST_USER6','CLERK',7201,'2016-09-08',2600,null,70);
insert into exam_emp
values (7207,'TEST_USER7','LECTURER',7201,'2016-10-28',2300,null,80);
insert into exam_emp
values (7208,'TEST_USER8','STUDENT',7201,'2018-03-09',1200,null,80);
-- [실습3] EXAM_EMP에 속한 사원 중 50번 부서에서 근무하는 사원들의 평균 급여보다 
-- 많은 급여를 받고 있는 사원들을 70번 부서로 옮기는 SQL 문 작성하기
update exam_emp 
set deptno = 70
where sal > (select avg(sal) from exam_emp where deptno=50);
-- [실습4] EXAM_EMP에 속한 사원 중 60번 부서의 사원 중에서 입사일이 
-- 가장 빠른 사원보다 늦게 입사한 사원의 급여를 10% 인상하고 80번 부서로 
-- 옮기는 SQL 문 작성하기
update exam_emp
set sal = sal*1.1, deptno = 80
where hiredate >(select min(hiredate) from exam_emp where deptno=60);
-- [실습5] EXAM_EMP에 속한 사원 중, 급여 등급이 5인 사원을 삭제하는 SQL문을 작성하기
delete from exam_emp where empno in 
                    (select empno from exam_emp, salgrade 
                    where sal between losal and hisal and grade=5);
 
 COMMIT;
 
-- 트랜잭션
-- 하나의 단위로 데이터를 처리
create table dept_tcl as select * from dept;

select * from dept_tcl;

-- 트랜잭션과 관련있는 명령어 실행
insert into dept_tcl values (50,'DATABASE','SEOUL');
update dept_tcl set loc = 'BUSAN' where deptno = 40;
delete from dept_tcl where dname='RESEARCH';
---------------------
-- 수행된 명령 취소
rollback;
-- 수행된 명령 최종 반영
commit;
-- 세션 : 어떤 활동을 위한 시간이나 기간
--       데이터베이스 접속을 시작으로 여러 데이터베이스에서 관련 작업을 수행한 후 
--       접속을 종료하기까지 전체 기간
delete from dept_tcl where deptno=50;

select * from dept_tcl;

commit;

update dept_tcl
set loc='SEOUL'
where deptno = 30;

commit;


