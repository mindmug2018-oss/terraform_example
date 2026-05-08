--
-- PostgreSQL database cluster dump
--

\restrict XCswY4StpRQWZEssDzhxmobU3XUlyNNFol6NNHCDoXlUlWS9IxFYHQKrq3Ihh2f

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE chihiro;
ALTER ROLE chihiro WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:wPwjFqx6q1Q8Mla4CJ8mQA==$KpsdKGQuIN89bSXQUAro8GVG/7sxKq+T1l7wEvrWnOQ=:cqID/CrRCU9U3p21ETH8hs7mhzIjof9BqRQUt7pFz6M=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:HUV9YKbfes3yGonKNsyl2w==$ut0GZ3gK5IYAh3If6eXBqpBa93C/KOBszCmJquO7Jho=:Hmqa8tj4kBrIIbYBhpu/JDVQAvY6nXD/AJ6kOL+7AwY=';
CREATE ROLE scott;
ALTER ROLE scott WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:opJowv0h3IiN+ChUIkHKUQ==$ahv7RjJ+OwOL7FZgz3BKICVgZDM8jPxl2Cj+m9HtJcw=:imugQcl84REuNxVIMCwP+ApvSZrcnf9BKcv/ffpFryI=';
CREATE ROLE scott2;
ALTER ROLE scott2 WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:D6KCpq6e7s+D8zdtKusP5Q==$I5ncyoeRXNrmz/1nz5kV8bM0Oup6BJtHQFZAsF1WZF4=:2zrY4ifgRCUJpNmz5ElEj7oFDqDnxMXnRVGy1/9sjrc=';

--
-- User Configurations
--








\unrestrict XCswY4StpRQWZEssDzhxmobU3XUlyNNFol6NNHCDoXlUlWS9IxFYHQKrq3Ihh2f

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict LcvWN5Of0KSmte3pMLMqVn20jHuHmJKRKcZjuFMIme039lt0euMAGzdFPoMUBFY

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict LcvWN5Of0KSmte3pMLMqVn20jHuHmJKRKcZjuFMIme039lt0euMAGzdFPoMUBFY

--
-- Database "chihiro_db" dump
--

--
-- PostgreSQL database dump
--

\restrict KnVuKcpAC0sxlcIMoWQOtnD6XiKABeHvK7ZzwMBgd6ZVXjzQ9jA5HnHPs8vR9gY

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: chihiro_db; Type: DATABASE; Schema: -; Owner: chihiro
--

CREATE DATABASE chihiro_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE chihiro_db OWNER TO chihiro;

\unrestrict KnVuKcpAC0sxlcIMoWQOtnD6XiKABeHvK7ZzwMBgd6ZVXjzQ9jA5HnHPs8vR9gY
\connect chihiro_db
\restrict KnVuKcpAC0sxlcIMoWQOtnD6XiKABeHvK7ZzwMBgd6ZVXjzQ9jA5HnHPs8vR9gY

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: member; Type: TABLE; Schema: public; Owner: chihiro
--

CREATE TABLE public.member (
    num integer NOT NULL,
    name text NOT NULL,
    addr text
);


ALTER TABLE public.member OWNER TO chihiro;

--
-- Name: member_seq; Type: SEQUENCE; Schema: public; Owner: chihiro
--

CREATE SEQUENCE public.member_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.member_seq OWNER TO chihiro;

--
-- Name: post; Type: TABLE; Schema: public; Owner: chihiro
--

CREATE TABLE public.post (
    num integer NOT NULL,
    writer text NOT NULL,
    title text NOT NULL,
    content text,
    created_at timestamp without time zone
);


ALTER TABLE public.post OWNER TO chihiro;

--
-- Name: post_seq; Type: SEQUENCE; Schema: public; Owner: chihiro
--

CREATE SEQUENCE public.post_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_seq OWNER TO chihiro;

--
-- Name: test_seq; Type: SEQUENCE; Schema: public; Owner: chihiro
--

CREATE SEQUENCE public.test_seq
    START WITH 10
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.test_seq OWNER TO chihiro;

--
-- Name: todo; Type: TABLE; Schema: public; Owner: chihiro
--

CREATE TABLE public.todo (
    num integer NOT NULL,
    content character varying(20),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.todo OWNER TO chihiro;

--
-- Name: todo_num_seq; Type: SEQUENCE; Schema: public; Owner: chihiro
--

CREATE SEQUENCE public.todo_num_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.todo_num_seq OWNER TO chihiro;

--
-- Name: todo_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chihiro
--

ALTER SEQUENCE public.todo_num_seq OWNED BY public.todo.num;


--
-- Name: todo num; Type: DEFAULT; Schema: public; Owner: chihiro
--

ALTER TABLE ONLY public.todo ALTER COLUMN num SET DEFAULT nextval('public.todo_num_seq'::regclass);


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: chihiro
--

COPY public.member (num, name, addr) FROM stdin;
1	Chihiro	Yuseong
2	junhan	daejeon
3	shinichiro	daejeon2
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: chihiro
--

COPY public.post (num, writer, title, content, created_at) FROM stdin;
1	chihiro	hello	Blah..blah..	2026-04-02 16:08:56.073774
2	junhan	hello2	Blah2..blah2..	2026-04-02 16:10:34.843566
3	shinichiro	hello3	Blah3..blah3..	2026-04-02 16:11:11.038237
\.


--
-- Data for Name: todo; Type: TABLE DATA; Schema: public; Owner: chihiro
--

COPY public.todo (num, content, created_at) FROM stdin;
1	python study	2026-04-02 17:07:07.604492
2	linux study	2026-04-02 17:07:34.525439
3	docker study	2026-04-02 17:07:45.3815
\.


--
-- Name: member_seq; Type: SEQUENCE SET; Schema: public; Owner: chihiro
--

SELECT pg_catalog.setval('public.member_seq', 3, true);


--
-- Name: post_seq; Type: SEQUENCE SET; Schema: public; Owner: chihiro
--

SELECT pg_catalog.setval('public.post_seq', 3, true);


--
-- Name: test_seq; Type: SEQUENCE SET; Schema: public; Owner: chihiro
--

SELECT pg_catalog.setval('public.test_seq', 30, true);


--
-- Name: todo_num_seq; Type: SEQUENCE SET; Schema: public; Owner: chihiro
--

SELECT pg_catalog.setval('public.todo_num_seq', 3, true);


--
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: chihiro
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (num);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: chihiro
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (num);


--
-- Name: todo todo_pkey; Type: CONSTRAINT; Schema: public; Owner: chihiro
--

ALTER TABLE ONLY public.todo
    ADD CONSTRAINT todo_pkey PRIMARY KEY (num);


--
-- PostgreSQL database dump complete
--

\unrestrict KnVuKcpAC0sxlcIMoWQOtnD6XiKABeHvK7ZzwMBgd6ZVXjzQ9jA5HnHPs8vR9gY

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict 9OgWcZ8wnMpBxeJPgNJnhslzznIqWvr7fkZDVeZDiuWC97V6kwtXTxxLB0t88bL

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict 9OgWcZ8wnMpBxeJPgNJnhslzznIqWvr7fkZDVeZDiuWC97V6kwtXTxxLB0t88bL

--
-- Database "scott2_db" dump
--

--
-- PostgreSQL database dump
--

\restrict gFbzBsiQxfjdbebYw76ScV7Y1lbVCPSI8gSavSuj2foDHyU0TZfSmlcAWrOlbU0

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: scott2_db; Type: DATABASE; Schema: -; Owner: scott2
--

CREATE DATABASE scott2_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE scott2_db OWNER TO scott2;

\unrestrict gFbzBsiQxfjdbebYw76ScV7Y1lbVCPSI8gSavSuj2foDHyU0TZfSmlcAWrOlbU0
\connect scott2_db
\restrict gFbzBsiQxfjdbebYw76ScV7Y1lbVCPSI8gSavSuj2foDHyU0TZfSmlcAWrOlbU0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dept; Type: TABLE; Schema: public; Owner: scott2
--

CREATE TABLE public.dept (
    deptno integer NOT NULL,
    dname character varying(14),
    loc character varying(13)
);


ALTER TABLE public.dept OWNER TO scott2;

--
-- Name: emp; Type: TABLE; Schema: public; Owner: scott2
--

CREATE TABLE public.emp (
    empno integer NOT NULL,
    ename character varying(10),
    job character varying(9),
    mgr integer,
    hiredate date,
    sal numeric(7,2),
    comm numeric(7,2),
    deptno integer
);


ALTER TABLE public.emp OWNER TO scott2;

--
-- Data for Name: dept; Type: TABLE DATA; Schema: public; Owner: scott2
--

COPY public.dept (deptno, dname, loc) FROM stdin;
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
\.


--
-- Data for Name: emp; Type: TABLE DATA; Schema: public; Owner: scott2
--

COPY public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) FROM stdin;
7369	SMITH	CLERK	7902	1980-12-17	800.00	\N	20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600.00	300.00	30
7521	WARD	SALESMAN	7698	1981-02-22	1250.00	500.00	30
7566	JONES	MANAGER	7839	1981-04-02	2975.00	\N	20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250.00	1400.00	30
7698	BLAKE	MANAGER	7839	1981-05-01	2850.00	\N	30
7782	CLARK	MANAGER	7839	1981-06-09	2450.00	\N	10
7788	SCOTT	ANALYST	7566	1987-07-13	3000.00	\N	20
7839	KING	PRESIDENT	\N	1981-11-17	5000.00	\N	10
7844	TURNER	SALESMAN	7698	1981-09-08	1500.00	0.00	30
7876	ADAMS	CLERK	7788	1987-07-13	1100.00	\N	20
7900	JAMES	CLERK	7698	1981-12-03	950.00	\N	30
7902	FORD	ANALYST	7566	1981-12-03	3000.00	\N	20
7934	MILLER	CLERK	7782	1982-01-23	1300.00	\N	10
\.


--
-- Name: dept dept_pkey; Type: CONSTRAINT; Schema: public; Owner: scott2
--

ALTER TABLE ONLY public.dept
    ADD CONSTRAINT dept_pkey PRIMARY KEY (deptno);


--
-- Name: emp emp_pkey; Type: CONSTRAINT; Schema: public; Owner: scott2
--

ALTER TABLE ONLY public.emp
    ADD CONSTRAINT emp_pkey PRIMARY KEY (empno);


--
-- Name: emp emp_deptno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scott2
--

ALTER TABLE ONLY public.emp
    ADD CONSTRAINT emp_deptno_fkey FOREIGN KEY (deptno) REFERENCES public.dept(deptno);


--
-- PostgreSQL database dump complete
--

\unrestrict gFbzBsiQxfjdbebYw76ScV7Y1lbVCPSI8gSavSuj2foDHyU0TZfSmlcAWrOlbU0

--
-- Database "scott_db" dump
--

--
-- PostgreSQL database dump
--

\restrict cHqb1Wc3efQy8CgIL5UyzXv99Xm4aC7aOTzFQB4aLxx16XShPdtNaLNUKwzxIeH

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: scott_db; Type: DATABASE; Schema: -; Owner: scott
--

CREATE DATABASE scott_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE scott_db OWNER TO scott;

\unrestrict cHqb1Wc3efQy8CgIL5UyzXv99Xm4aC7aOTzFQB4aLxx16XShPdtNaLNUKwzxIeH
\connect scott_db
\restrict cHqb1Wc3efQy8CgIL5UyzXv99Xm4aC7aOTzFQB4aLxx16XShPdtNaLNUKwzxIeH

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dept; Type: TABLE; Schema: public; Owner: scott
--

CREATE TABLE public.dept (
    deptno integer NOT NULL,
    dname character varying(14),
    loc character varying(13)
);


ALTER TABLE public.dept OWNER TO scott;

--
-- Name: emp; Type: TABLE; Schema: public; Owner: scott
--

CREATE TABLE public.emp (
    empno integer NOT NULL,
    ename character varying(10),
    job character varying(9),
    mgr integer,
    hiredate date,
    sal numeric(7,2),
    comm numeric(7,2),
    deptno integer
);


ALTER TABLE public.emp OWNER TO scott;

--
-- Name: member; Type: TABLE; Schema: public; Owner: scott
--

CREATE TABLE public.member (
    num integer NOT NULL,
    name text NOT NULL,
    add text
);


ALTER TABLE public.member OWNER TO scott;

--
-- Name: member_num_seq; Type: SEQUENCE; Schema: public; Owner: scott
--

CREATE SEQUENCE public.member_num_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.member_num_seq OWNER TO scott;

--
-- Name: member_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scott
--

ALTER SEQUENCE public.member_num_seq OWNED BY public.member.num;


--
-- Name: notice; Type: TABLE; Schema: public; Owner: scott
--

CREATE TABLE public.notice (
    num integer NOT NULL,
    content text
);


ALTER TABLE public.notice OWNER TO scott;

--
-- Name: notice_num_seq; Type: SEQUENCE; Schema: public; Owner: scott
--

CREATE SEQUENCE public.notice_num_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notice_num_seq OWNER TO scott;

--
-- Name: notice_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scott
--

ALTER SEQUENCE public.notice_num_seq OWNED BY public.notice.num;


--
-- Name: post; Type: TABLE; Schema: public; Owner: scott
--

CREATE TABLE public.post (
    num integer NOT NULL,
    writer character varying(50) NOT NULL,
    title character varying(100),
    content text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.post OWNER TO scott;

--
-- Name: post_num_seq; Type: SEQUENCE; Schema: public; Owner: scott
--

CREATE SEQUENCE public.post_num_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_num_seq OWNER TO scott;

--
-- Name: post_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: scott
--

ALTER SEQUENCE public.post_num_seq OWNED BY public.post.num;


--
-- Name: member num; Type: DEFAULT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.member ALTER COLUMN num SET DEFAULT nextval('public.member_num_seq'::regclass);


--
-- Name: notice num; Type: DEFAULT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.notice ALTER COLUMN num SET DEFAULT nextval('public.notice_num_seq'::regclass);


--
-- Name: post num; Type: DEFAULT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.post ALTER COLUMN num SET DEFAULT nextval('public.post_num_seq'::regclass);


--
-- Data for Name: dept; Type: TABLE DATA; Schema: public; Owner: scott
--

COPY public.dept (deptno, dname, loc) FROM stdin;
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
\.


--
-- Data for Name: emp; Type: TABLE DATA; Schema: public; Owner: scott
--

COPY public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) FROM stdin;
7369	SMITH	CLERK	7902	1980-12-17	800.00	\N	20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600.00	300.00	30
7521	WARD	SALESMAN	7698	1981-02-22	1250.00	500.00	30
7566	JONES	MANAGER	7839	1981-04-02	2975.00	\N	20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250.00	1400.00	30
7698	BLAKE	MANAGER	7839	1981-05-01	2850.00	\N	30
7782	CLARK	MANAGER	7839	1981-06-09	2450.00	\N	10
7788	SCOTT	ANALYST	7566	1987-07-13	3000.00	\N	20
7839	KING	PRESIDENT	\N	1981-11-17	5000.00	\N	10
7844	TURNER	SALESMAN	7698	1981-09-08	1500.00	0.00	30
7876	ADAMS	CLERK	7788	1987-07-13	1100.00	\N	20
7900	JAMES	CLERK	7698	1981-12-03	950.00	\N	30
7902	FORD	ANALYST	7566	1981-12-03	3000.00	\N	20
7934	MILLER	CLERK	7782	1982-01-23	1300.00	\N	10
\.


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: scott
--

COPY public.member (num, name, add) FROM stdin;
1	chihiro	yuseong
2	junhan	daejeon
3	shinichiro	methuen
4	junichiro	\N
\.


--
-- Data for Name: notice; Type: TABLE DATA; Schema: public; Owner: scott
--

COPY public.notice (num, content) FROM stdin;
1	Today is lucky
2	have a happy weekend
3	rest up and see you Monday
4	It is Monday. Linux will start
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: scott
--

COPY public.post (num, writer, title, content, created_at) FROM stdin;
1	chihiro	hello	...bye	2026-04-20 10:50:48.362416
2	shim	helloworld	...bye!!	2026-04-20 10:51:17.755856
17	a	a	a	2026-04-21 09:40:11.865946
18	c	c	cb	2026-04-21 10:46:10.160941
\.


--
-- Name: member_num_seq; Type: SEQUENCE SET; Schema: public; Owner: scott
--

SELECT pg_catalog.setval('public.member_num_seq', 4, true);


--
-- Name: notice_num_seq; Type: SEQUENCE SET; Schema: public; Owner: scott
--

SELECT pg_catalog.setval('public.notice_num_seq', 4, true);


--
-- Name: post_num_seq; Type: SEQUENCE SET; Schema: public; Owner: scott
--

SELECT pg_catalog.setval('public.post_num_seq', 18, true);


--
-- Name: dept dept_pkey; Type: CONSTRAINT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.dept
    ADD CONSTRAINT dept_pkey PRIMARY KEY (deptno);


--
-- Name: emp emp_pkey; Type: CONSTRAINT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.emp
    ADD CONSTRAINT emp_pkey PRIMARY KEY (empno);


--
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (num);


--
-- Name: notice notice_pkey; Type: CONSTRAINT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.notice
    ADD CONSTRAINT notice_pkey PRIMARY KEY (num);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (num);


--
-- Name: emp emp_deptno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: scott
--

ALTER TABLE ONLY public.emp
    ADD CONSTRAINT emp_deptno_fkey FOREIGN KEY (deptno) REFERENCES public.dept(deptno);


--
-- PostgreSQL database dump complete
--

\unrestrict cHqb1Wc3efQy8CgIL5UyzXv99Xm4aC7aOTzFQB4aLxx16XShPdtNaLNUKwzxIeH

--
-- PostgreSQL database cluster dump complete
--

