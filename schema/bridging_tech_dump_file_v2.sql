--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Homebrew)
-- Dumped by pg_dump version 14.9 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: set_parent_consent_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_parent_consent_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
IF NEW.parent_consent_given THEN
NEW.parent_consent_date = CURRENT_TIMESTAMP;
END IF;
RETURN NEW;
END;
$$;


ALTER FUNCTION public.set_parent_consent_date() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    user_email character varying(255),
    parent_name character varying(255),
    parent_cell_no character varying(20),
    parent_consent_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    oauth_provider character varying(255),
    oauth_id character varying(255),
    bt_device_id integer,
    user_first_initial character(1) NOT NULL,
    user_last_initial character(1) NOT NULL,
    avatar_name character varying(255),
    parent_consent_given boolean DEFAULT false,
    parent_email character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_app_usage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_app_usage (
    user_app_usage_id integer NOT NULL,
    user_id integer NOT NULL,
    login_time timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    logout_time timestamp with time zone,
    device_type character varying(255)
);


ALTER TABLE public.users_app_usage OWNER TO postgres;

--
-- Name: users_app_usage_user_app_usage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_app_usage_user_app_usage_id_seq
    AS integer
    START WITH 22
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_app_usage_user_app_usage_id_seq OWNER TO postgres;

--
-- Name: users_app_usage_user_app_usage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_app_usage_user_app_usage_id_seq OWNED BY public.users_app_usage.user_app_usage_id;


--
-- Name: users_course_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_course_ratings (
    user_course_rating_id integer NOT NULL,
    user_id integer NOT NULL,
    user_course_rating integer,
    course_name character varying(255),
    user_app_rating integer
);


ALTER TABLE public.users_course_ratings OWNER TO postgres;

--
-- Name: users_course_ratings_user_course_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_course_ratings_user_course_rating_id_seq
    AS integer
    START WITH 49
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_course_ratings_user_course_rating_id_seq OWNER TO postgres;

--
-- Name: users_course_ratings_user_course_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_course_ratings_user_course_rating_id_seq OWNED BY public.users_course_ratings.user_course_rating_id;


--
-- Name: users_demographics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_demographics (
    user_demographics_id integer NOT NULL,
    user_id integer NOT NULL,
    age_seg character varying(255),
    grade_level character varying(255),
    language character varying(255),
    ethnicity character varying(255),
    gender character varying(255),
    state character varying(255),
    ip_address character varying(255),
    shelter character varying(255),
    age integer
);


ALTER TABLE public.users_demographics OWNER TO postgres;

--
-- Name: users_demographics_user_demographics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_demographics_user_demographics_id_seq
    AS integer
    START WITH 40
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_demographics_user_demographics_id_seq OWNER TO postgres;

--
-- Name: users_demographics_user_demographics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_demographics_user_demographics_id_seq OWNED BY public.users_demographics.user_demographics_id;


--
-- Name: users_education_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_education_profile (
    user_education_profile_id integer NOT NULL,
    user_id integer NOT NULL,
    academic_goals character varying(255),
    career_goals character varying(255),
    education_level character varying(255),
    favorite_subjects character varying(255),
    assistance_requested character varying(255)
);


ALTER TABLE public.users_education_profile OWNER TO postgres;

--
-- Name: users_education_profile_user_education_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_education_profile_user_education_profile_id_seq
    AS integer
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_education_profile_user_education_profile_id_seq OWNER TO postgres;

--
-- Name: users_education_profile_user_education_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_education_profile_user_education_profile_id_seq OWNED BY public.users_education_profile.user_education_profile_id;


--
-- Name: users_grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_grades (
    user_grades_id integer NOT NULL,
    user_id integer NOT NULL,
    subject_name character varying(255),
    subject_grade character varying(5)
);


ALTER TABLE public.users_grades OWNER TO postgres;

--
-- Name: users_grades_user_grades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_grades_user_grades_id_seq
    AS integer
    START WITH 33
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_grades_user_grades_id_seq OWNER TO postgres;

--
-- Name: users_grades_user_grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_grades_user_grades_id_seq OWNED BY public.users_grades.user_grades_id;


--
-- Name: users_points_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_points_history (
    user_id integer NOT NULL,
    points_earned integer,
    points_total integer,
    points_spent integer,
    login_streak integer,
    quest_awards integer,
    revisit_awards integer
);


ALTER TABLE public.users_points_history OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_app_usage user_app_usage_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_app_usage ALTER COLUMN user_app_usage_id SET DEFAULT nextval('public.users_app_usage_user_app_usage_id_seq'::regclass);


--
-- Name: users_course_ratings user_course_rating_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_course_ratings ALTER COLUMN user_course_rating_id SET DEFAULT nextval('public.users_course_ratings_user_course_rating_id_seq'::regclass);


--
-- Name: users_demographics user_demographics_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_demographics ALTER COLUMN user_demographics_id SET DEFAULT nextval('public.users_demographics_user_demographics_id_seq'::regclass);


--
-- Name: users_education_profile user_education_profile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_education_profile ALTER COLUMN user_education_profile_id SET DEFAULT nextval('public.users_education_profile_user_education_profile_id_seq'::regclass);


--
-- Name: users_grades user_grades_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_grades ALTER COLUMN user_grades_id SET DEFAULT nextval('public.users_grades_user_grades_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password, user_email, parent_name, parent_cell_no, parent_consent_date, oauth_provider, oauth_id, bt_device_id, user_first_initial, user_last_initial, avatar_name, parent_consent_given, parent_email) FROM stdin;
6	super_star42	dUATGm	super_star42@gmail.com	Kayden Funk	535.641.3339	2024-03-26 10:29:03.230636-10	\N	XLox31x9	1897865935	S	S	suzie_carmichael	t	kaydenfunk@gmail.com
10	ninja_turtle88	dUATGm	ninja_turtle88@gmail.com	Kayden Funk	535.641.3339	2024-03-26 10:29:03.230636-10	\N	XLox31x9	1877865982	N	T	llamalee	t	kaydenfunk@gmail.com
14	dino_hunter14	IcCRZBj2a	dino_hunter14@gmail.com	\N	\N	\N	\N	\N	1123070362	D	H	\N	f	\N
85	dream_catcher53	NorhfKr	dream_catcher53@gmail.com	\N	\N	\N	Google	x3QSvEY9	\N	D	C	dora_the_explora	f	\N
86	galaxy_traveler76	IcCRZBj2a	galaxy_traveler76@gmail.com	\N	\N	\N	\N	\N	1133098245	G	T	\N	f	\N
87	wizard_world21	NorhfKr	wizard_world21@gmail.com	\N	\N	\N	Google	x3QSvEY9	\N	W	W	nemo_the_clownfish	f	\N
88	dancing_queen89	IcCRZBj2a	dancing_queen89@gmail.com	\N	\N	\N	\N	\N	1148090366	D	Q	\N	f	\N
89	shark_patrol62	NorhfKr	shark_patrol62@gmail.com	\N	\N	\N	Google	x3QSvEY9	\N	S	P	edna_m0de	f	\N
90	robot_friend47	IcCRZBj2a	robot_friend47@gmail.com	\N	\N	\N	\N	\N	1133092365	R	F	\N	f	\N
91	treasure_seeker38	NorhfKr	treasure_seeker38@gmail.com	\N	\N	\N	Google	x3QSvEY9	\N	T	S	imastarfish	f	\N
11	cookie_monster23	NorhfKr	cookie_monster23@gmail.com	\N	\N	\N	Google	x3QSvEY9	\N	C	M	pedro_et	f	\N
12	space_ranger31	IcCRZBj2a	space_ranger31@gmail.com	\N	\N	\N	\N	\N	1133090362	S	R	\N	f	\N
13	ocean_explorer67	NorhfKr	ocean_explorer67@gmail.com	\N	\N	\N	Google	x3QSvEY9	\N	O	E	pedro_et	f	\N
92	pizza_lover95	IcCRZBj2a	pizza_lover95@gmail.com	\N	\N	\N	\N	\N	1503010362	P	L	\N	f	\N
4	lessie_qui	zAFLHsbCX	lessie_qui@gmail.com	Wiley Emmerich	(915) 915-8370	2024-03-26 10:29:03.230636-10	\N	\N	1850993120	L	Q	\N	t	wileyemmerich@gmail.com
1	arnulfo_consectetur	ffnId25Cea	arnulfo_consectetur@gmail.com	Diego Jacobson	(879) 124-9088	2024-03-26 10:29:03.230636-10	Google	x3QSvEY9	\N	A	C	red_power_ranger	t	diegojacobson@gmail.com
2	cruz_quaerat	FLHsbC	cruz_quaerat@gmail.com	Minnie Graham	1-470-835-6413	2024-03-26 10:29:03.230636-10	\N	\N	\N	C	Q	mimi	t	minniegraham@gmail.com
5	rainbow_kitty100	ffnId25Cea	rainbow_kitty100@gmail.com	Diego Jacobson	(879) 124-9088	2024-03-26 10:29:03.230636-10	Google	x3QSvEY9	\N	R	K	spongebob	t	diegojacobson@gmail.com
7	rainbow_brite101	ffnId25Cea	rainbow_brite101@gmail.com	Diego Jacobson	(879) 124-9088	2024-03-26 10:29:03.230636-10	Google	x3QSvEY9	\N	R	B	latte_roo	t	diegojacobson@gmail.com
8	super_junior45	dUATGm	super_junior45@gmail.com	Kayden Funk	535.641.3339	2024-03-26 10:29:03.230636-10	\N	XLox31x9	1897865982	S	J	winniethepoohbear	t	kaydenfunk@gmail.com
9	magic_pony57	ffnId25Cea	magic_pony57@gmail.com	Diego Jacobson	(879) 124-9088	2024-03-26 10:29:03.230636-10	Google	x3QSvEY9	\N	M	P	grassythegrasshopper	t	diegojacobson@gmail.com
29	morton_dolore	ffnId25Cea	morton_dolore@gmail.com	Diego Jacobson	(879) 124-9088	2024-03-26 10:29:03.230636-10	Google	x3QSvEY9	\N	M	D	suzie_q	t	diegojacobson@gmail.com
\.


--
-- Data for Name: users_app_usage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_app_usage (user_app_usage_id, user_id, login_time, logout_time, device_type) FROM stdin;
1	1	2024-09-26 18:14:56.973222-10	2024-04-25 23:04:02.055563-10	Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27
2	2	2024-04-08 16:27:47.446374-10	2024-10-25 13:30:04.183281-10	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.517 Safari/537.36
3	1	2024-04-27 14:26:43.722658-10	2024-04-09 13:53:11.923327-10	Mozilla/5.0 (X11; OpenBSD amd64; rv:28.0) Gecko/20100101 Firefox/28.0
4	2	2024-11-08 14:23:24.495312-10	2024-10-29 08:05:57.824993-10	Mozilla/5.0 (Linux; U; Android 4.0.3; ko-kr; LG-L160L Build/IML74K) AppleWebkit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30
5	1	2024-04-29 08:59:02.326336-10	2024-08-17 07:25:07.571583-10	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.517 Safari/537.36
6	2	2024-12-08 14:46:36.552503-10	2024-11-23 10:44:01.742367-10	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1
7	1	2024-02-10 01:52:32.002136-10	2024-12-06 05:30:56.8892-10	Opera/9.80 (Macintosh; Intel Mac OS X 10.6.8; U; fr) Presto/2.9.168 Version/11.52
8	2	2024-03-28 19:55:58.293995-10	2024-05-18 16:09:13.084314-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
9	1	2024-04-08 14:43:03.090063-10	2024-06-05 19:26:14.37383-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
10	2	2024-02-18 16:11:13.441898-10	2024-12-10 11:34:42.608961-10	Mozilla/5.0 (Linux; U; Android 4.0.3; ko-kr; LG-L160L Build/IML74K) AppleWebkit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30
11	1	2024-02-25 17:07:27.212846-10	2024-11-03 01:37:06.922896-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
12	2	2024-04-01 09:02:31.03032-10	2024-04-10 00:28:21.007457-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
13	1	2024-04-05 15:52:55.836968-10	2024-12-13 23:11:21.494368-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
14	2	2024-11-29 18:22:42.198184-10	2024-12-16 13:36:50.190401-10	Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27
15	1	2024-03-09 23:37:46.339744-10	2024-08-01 09:54:46.872777-10	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246
16	2	2024-03-01 03:33:50.279487-10	2024-10-26 14:41:21.933763-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36
17	1	2024-07-02 03:35:06.184391-10	2024-12-08 13:21:02.650068-10	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36
18	2	2024-05-12 14:02:35.288832-10	2024-06-02 06:51:44.127271-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
19	1	2024-10-05 13:06:37.520545-10	2024-07-26 21:06:33.232939-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
20	2	2024-11-08 06:07:43.34703-10	2024-07-21 18:38:25.643536-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
21	1	2024-03-20 21:05:41.360735-10	2024-05-18 19:48:46.526375-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A
22	5	2024-08-11 20:50:23.787482-10	2024-05-24 07:06:11.73473-10	Mozilla/5.0 (iPad; CPU OS 5_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko ) Version/5.1 Mobile/9B176 Safari/7534.48.3
23	6	2024-01-11 12:11:22.9496-10	2024-12-22 10:25:19.574084-10	Mozilla/5.0 (Windows; U; MSIE 9.0; WIndows NT 9.0; en-US))
24	5	2024-11-05 21:43:31.195714-10	2023-12-31 15:47:09.057708-10	Mozilla/5.0 (Windows; U; MSIE 9.0; WIndows NT 9.0; en-US))
25	6	2024-07-19 19:00:28.494961-10	2024-08-30 15:40:40.090452-10	Mozilla/5.0 (Windows; U; MSIE 9.0; WIndows NT 9.0; en-US))
26	5	2024-12-20 18:34:13.58606-10	2024-09-12 19:48:21.620278-10	Mozilla/5.0 (iPad; CPU OS 5_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko ) Version/5.1 Mobile/9B176 Safari/7534.48.3
27	6	2024-04-17 07:13:20.546655-10	2024-11-12 10:24:54.734934-10	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.517 Safari/537.36
28	5	2024-01-25 04:58:43.273899-10	2024-02-16 11:59:58.699364-10	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko
29	6	2024-11-09 00:49:11.599789-10	2024-06-30 03:39:58.953994-10	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246
30	5	2024-10-19 19:49:39.547012-10	2024-01-27 19:20:07.249884-10	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1
31	6	2024-05-03 11:48:32.152543-10	2024-12-07 18:41:27.930176-10	Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27
32	5	2024-12-18 05:04:13.964437-10	2024-05-22 13:44:14.792679-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
33	6	2024-10-28 13:37:35.765252-10	2024-03-07 14:44:25.026423-10	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko
34	5	2024-06-29 13:59:01.220003-10	2024-05-20 10:35:50.364519-10	Opera/9.80 (Macintosh; Intel Mac OS X 10.6.8; U; fr) Presto/2.9.168 Version/11.52
35	6	2024-06-02 14:56:19.162364-10	2024-03-04 15:30:13.612163-10	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.517 Safari/537.36
36	5	2024-07-02 19:31:19.318045-10	2024-05-16 09:42:14.182624-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
37	6	2024-03-26 13:21:46.197392-10	2024-04-15 15:18:46.42002-10	Mozilla/5.0 (Linux; U; Android 4.0.3; ko-kr; LG-L160L Build/IML74K) AppleWebkit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30
38	5	2024-01-21 02:33:48.091134-10	2024-12-16 23:29:52.723334-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36
39	6	2024-01-08 10:12:38.389713-10	2024-04-15 12:07:13.997052-10	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246
40	5	2024-04-23 21:09:50.287261-10	2024-02-14 10:38:47.310817-10	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.517 Safari/537.36
41	6	2024-04-25 14:56:27.056164-10	2024-06-13 06:33:26.955194-10	Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727)
42	5	2024-03-09 03:51:22.040885-10	2024-10-30 03:54:38.754298-10	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.517 Safari/537.36
43	6	2024-10-18 00:16:55.429376-10	2024-04-19 15:22:58.157818-10	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.517 Safari/537.36
44	5	2024-01-11 00:40:04.523302-10	2024-12-07 09:31:01.937235-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
45	6	2024-09-01 00:30:58.759919-10	2024-11-25 02:22:45.622485-10	Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; nb-no) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8C148a Safari/6533.18.5
46	5	2024-03-21 22:14:25.538393-10	2024-12-04 00:33:37.24469-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
47	6	2024-03-21 01:24:55.852338-10	2024-04-16 17:33:50.346119-10	Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727)
48	5	2024-03-10 14:37:52.456855-10	2024-04-03 11:58:55.051693-10	Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727)
49	6	2024-06-30 11:47:26.796129-10	2024-07-29 02:13:32.922528-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
50	11	2024-12-27 09:24:20.893036-10	2024-02-15 19:10:09.875499-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36
51	12	2024-04-22 08:33:28.069163-10	2024-01-03 08:14:28.860691-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
52	11	2024-07-04 16:26:19.466985-10	2024-09-20 03:30:03.24845-10	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36
53	12	2024-11-28 04:35:34.617312-10	2024-10-03 05:57:18.617562-10	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko
54	11	2024-02-23 00:50:13.801116-10	2024-01-31 12:54:14.271491-10	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.517 Safari/537.36
55	12	2024-12-10 11:34:42.608961-10	2024-04-16 07:38:38.281992-10	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36
56	11	2024-02-25 17:07:27.212846-10	2024-11-03 01:37:06.922896-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
57	12	2024-04-01 09:02:31.03032-10	2024-04-10 00:28:21.007457-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
58	11	2024-04-05 15:52:55.836968-10	2024-12-13 23:11:21.494368-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
59	12	2024-11-29 18:22:42.198184-10	2024-12-16 13:36:50.190401-10	Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27
60	11	2024-03-09 23:37:46.339744-10	2024-08-01 09:54:46.872777-10	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246
61	12	2024-03-01 03:33:50.279487-10	2024-10-26 14:41:21.933763-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36
62	11	2024-07-02 03:35:06.184391-10	2024-12-08 13:21:02.650068-10	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36
63	12	2024-05-12 14:02:35.288832-10	2024-06-02 06:51:44.127271-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
64	11	2024-10-05 13:06:37.520545-10	2024-07-26 21:06:33.232939-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
65	12	2024-11-08 06:07:43.34703-10	2024-07-21 18:38:25.643536-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
66	11	2024-03-20 21:05:41.360735-10	2024-05-18 19:48:46.526375-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A
67	12	2024-05-07 17:24:46.539497-10	2024-08-31 18:29:55.315159-10	Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727)
68	13	2024-12-27 09:24:20.893036-10	2024-02-15 19:10:09.875499-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36
69	14	2024-04-22 08:33:28.069163-10	2024-01-03 08:14:28.860691-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
70	13	2024-07-04 16:26:19.466985-10	2024-09-20 03:30:03.24845-10	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36
71	14	2024-11-28 04:35:34.617312-10	2024-10-03 05:57:18.617562-10	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko
72	13	2024-02-23 00:50:13.801116-10	2024-01-31 12:54:14.271491-10	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.517 Safari/537.36
73	14	2024-12-10 11:34:42.608961-10	2024-04-16 07:38:38.281992-10	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36
74	13	2024-02-25 17:07:27.212846-10	2024-11-03 01:37:06.922896-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
75	14	2024-04-01 09:02:31.03032-10	2024-04-10 00:28:21.007457-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
76	13	2024-04-05 15:52:55.836968-10	2024-12-13 23:11:21.494368-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
77	14	2024-11-29 18:22:42.198184-10	2024-12-16 13:36:50.190401-10	Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27
78	13	2024-03-09 23:37:46.339744-10	2024-08-01 09:54:46.872777-10	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246
79	14	2024-03-01 03:33:50.279487-10	2024-10-26 14:41:21.933763-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36
80	13	2024-07-02 03:35:06.184391-10	2024-12-08 13:21:02.650068-10	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36
81	14	2024-05-12 14:02:35.288832-10	2024-06-02 06:51:44.127271-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
82	13	2024-10-05 13:06:37.520545-10	2024-07-26 21:06:33.232939-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
83	14	2024-11-08 06:07:43.34703-10	2024-07-21 18:38:25.643536-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
84	13	2024-03-20 21:05:41.360735-10	2024-05-18 19:48:46.526375-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A
85	14	2024-05-07 17:24:46.539497-10	2024-08-31 18:29:55.315159-10	Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727)
86	87	2024-12-27 09:24:20.893036-10	2024-02-15 19:10:09.875499-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36
87	88	2024-04-22 08:33:28.069163-10	2024-01-03 08:14:28.860691-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
88	87	2024-07-04 16:26:19.466985-10	2024-09-20 03:30:03.24845-10	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36
89	88	2024-11-28 04:35:34.617312-10	2024-10-03 05:57:18.617562-10	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko
90	87	2024-02-23 00:50:13.801116-10	2024-01-31 12:54:14.271491-10	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.517 Safari/537.36
91	88	2024-12-10 11:34:42.608961-10	2024-04-16 07:38:38.281992-10	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36
92	87	2024-02-25 17:07:27.212846-10	2024-11-03 01:37:06.922896-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
93	88	2024-04-01 09:02:31.03032-10	2024-04-10 00:28:21.007457-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
94	87	2024-04-05 15:52:55.836968-10	2024-12-13 23:11:21.494368-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
95	88	2024-11-29 18:22:42.198184-10	2024-12-16 13:36:50.190401-10	Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27
96	87	2024-03-09 23:37:46.339744-10	2024-08-01 09:54:46.872777-10	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246
97	88	2024-03-01 03:33:50.279487-10	2024-10-26 14:41:21.933763-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36
98	87	2024-07-02 03:35:06.184391-10	2024-12-08 13:21:02.650068-10	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36
99	88	2024-05-12 14:02:35.288832-10	2024-06-02 06:51:44.127271-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
100	87	2024-10-05 13:06:37.520545-10	2024-07-26 21:06:33.232939-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
101	88	2024-11-08 06:07:43.34703-10	2024-07-21 18:38:25.643536-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
102	87	2024-03-20 21:05:41.360735-10	2024-05-18 19:48:46.526375-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A
103	88	2024-05-07 17:24:46.539497-10	2024-08-31 18:29:55.315159-10	Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727)
104	91	2024-06-02 04:23:02.574272-10	2024-01-09 05:01:21.520785-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
105	92	2024-01-08 10:49:27.907625-10	2024-04-08 03:56:09.702483-10	Mozilla/5.0 (Linux; U; Android 2.3; en-us) AppleWebKit/999+ (KHTML, like Gecko) Safari/999.9
106	91	2024-05-16 19:50:47.385877-10	2024-10-10 01:31:54.368474-10	Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14
107	92	2024-05-29 09:25:11.464442-10	2024-06-01 20:56:17.112961-10	Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727)
108	91	2024-08-17 13:06:52.048443-10	2024-04-16 08:00:57.862561-10	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0
109	92	2024-01-28 15:25:03.865581-10	2024-10-09 23:43:53.450434-10	Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko
\.


--
-- Data for Name: users_course_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_course_ratings (user_course_rating_id, user_id, user_course_rating, course_name, user_app_rating) FROM stdin;
1	1	2	Computer Intro	1
5	1	2	How to setup Franklin T10 hotspot	3
6	2	4	Misinformation: Social Network Bias	\N
8	2	4	Online Scams	\N
9	1	1	Using A Windows 10 PC	\N
10	2	4	Google Drive: Cloud Storage	\N
12	2	4	How to setup Franklin T10 hotspot	\N
13	1	1	Computer Science 101	\N
14	2	2	Passwords: Getting Started	3
15	1	3	Bridging Tech 101	2
16	2	3	Tech Skills	\N
18	2	1	How to measure data rate on the PC	\N
19	1	2	How to measure data rate on the PC	4
23	1	2	Misinformation: Social Network Bias	4
24	2	2	Zoom: Getting Started	\N
26	2	3	Using A Windows 10 PC	\N
27	1	4	Online Privacty	\N
31	1	2	Basic Search	2
32	2	1	Online Scams	1
34	2	1	Email: Getting Started	\N
36	2	1	Online Scams	4
39	1	2	Using A Windows 10 PC	\N
42	2	2	Online Scams	\N
45	1	2	Google Drive: Cloud Storage	1
46	2	3	Email: Getting Started	3
48	2	1	Zoom: Getting Started	\N
49	5	3	Pilot Overview	\N
51	5	1	Pilot Overview	2
52	6	4	Misinformation: Social Network Bias	1
54	6	3	Using A Windows 10 PC	1
55	5	1	Navigating A Website	\N
56	6	2	Pilot Overview	1
57	5	1	Pilot Overview	2
59	5	4	How to measure data rate on the PC	\N
65	5	3	Computer Science 101	2
66	6	1	Online Scams	\N
70	6	4	Tech Skills	\N
71	5	1	Online Privacty	\N
72	6	4	Email: Getting Started	2
74	6	1	Using A Windows 10 PC	\N
75	5	2	Using A Windows 10 PC	1
77	5	2	Misinformation: Social Network Bias	\N
80	6	4	How to measure data rate on the PC	3
82	6	1	Disinformation	4
83	5	2	Navigating A Website	\N
85	5	2	Passwords: Getting Started	2
86	6	3	Zoom: Getting Started	\N
87	5	4	How to get help	1
88	6	3	How to get help	\N
11	1	\N	\N	1
20	2	\N	\N	4
25	1	\N	\N	4
94	12	3	Zoom: Getting Started	\N
35	1	\N	\N	3
95	11	3	How to setup Franklin T10 hotspot	2
97	11	1	Disinformation	4
37	1	\N	\N	3
38	2	\N	\N	2
40	2	\N	\N	1
47	1	\N	\N	3
61	5	\N	\N	1
62	6	\N	\N	2
100	12	2	Using A Windows 10 PC	\N
102	12	\N	Disinformation	1
103	11	2	Online Scams	\N
3	1	\N	\N	4
4	2	\N	\N	3
7	1	\N	\N	4
17	1	\N	\N	4
53	5	\N	\N	2
64	6	\N	\N	3
84	6	\N	\N	1
89	5	\N	\N	2
2	2	\N	\N	2
29	1	\N	\N	2
33	1	\N	\N	3
41	1	\N	\N	1
43	1	\N	\N	4
50	6	\N	\N	1
67	5	\N	\N	1
79	5	\N	\N	3
90	6	\N	\N	1
91	5	\N	\N	1
92	6	\N	\N	4
106	12	2	Google Drive: Cloud Storage	1
107	11	3	Email: Getting Started	3
109	11	1	Zoom: Getting Started	\N
110	12	4	How to measure data rate on the PC	2
111	11	2	Google Drive: Cloud Storage	\N
113	11	3	How to setup Franklin T10 hotspot	\N
114	12	4	Basic Search	1
116	14	3	Zoom: Getting Started	\N
117	13	3	How to setup Franklin T10 hotspot	2
119	13	1	Disinformation	4
122	14	2	Using A Windows 10 PC	\N
123	13	1	\N	\N
125	13	2	Online Scams	\N
128	14	2	Google Drive: Cloud Storage	1
129	13	3	Email: Getting Started	3
131	13	1	Zoom: Getting Started	\N
132	14	4	How to measure data rate on the PC	2
133	13	2	Google Drive: Cloud Storage	\N
135	13	3	How to setup Franklin T10 hotspot	\N
136	14	4	Basic Search	1
138	88	3	Zoom: Getting Started	\N
139	87	3	How to setup Franklin T10 hotspot	2
141	87	1	Disinformation	4
147	87	2	Online Scams	\N
150	88	2	Google Drive: Cloud Storage	1
151	87	3	Email: Getting Started	3
153	87	1	Zoom: Getting Started	\N
154	88	4	How to measure data rate on the PC	2
155	87	2	Google Drive: Cloud Storage	\N
157	87	3	How to setup Franklin T10 hotspot	\N
158	88	4	Basic Search	1
159	91	3	Email: Getting Started	3
160	92	2	Using A Windows 10 PC	\N
161	91	3	Basic Search	\N
162	92	3	Zoom: Getting Started	\N
68	6	\N	\N	2
69	5	\N	\N	3
76	6	\N	\N	3
93	11	4	Google Drive: Cloud Storage	\N
96	12	1	Misinformation: Social Network Bias	2
98	12	\N	\N	2
99	11	\N	\N	3
101	11	\N	\N	1
104	12	4	Tech Skills	4
105	11	5	Email: Getting Started	\N
108	12	\N	\N	2
115	13	4	Google Drive: Cloud Storage	\N
118	14	3	Misinformation: Social Network Bias	2
120	14	\N	\N	3
121	13	\N	\N	5
124	14	3	Disinformation	1
126	14	4	Tech Skills	4
127	13	2	Email: Getting Started	\N
130	14	\N	\N	3
137	87	3	Google Drive: Cloud Storage	\N
140	88	4	Misinformation: Social Network Bias	2
142	88	\N	\N	3
143	87	\N	\N	2
144	88	2	Using A Windows 10 PC	2
145	87	\N	\N	1
146	88	2	Disinformation	1
148	88	3	Tech Skills	4
149	87	4	Email: Getting Started	\N
152	88	\N	\N	3
\.


--
-- Data for Name: users_demographics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_demographics (user_demographics_id, user_id, age_seg, grade_level, language, ethnicity, gender, state, ip_address, shelter, age) FROM stdin;
1	1	\N	Elementary School	Other	\N	\N	NY	227.37.55.231	Douglas and Hodkiewicz LLC	\N
2	2	\N	Kindergarten	English	\N	\N	Other	\N	Olson and Deckow and Sons	\N
3	1	\N	Kindergarten	\N	\N	\N	CA	\N	\N	\N
4	2	\N	Kindergarten	Pashto	Hispanic or Latino	Male	CA	70.246.93.135	Barrows and Bode Group	\N
5	1	5-12 years	Elementary School	\N	\N	\N	Other	65.150.193.242	\N	7
6	2	\N	Elementary School	Pashto	\N	\N	NY	211.193.177.226	\N	9
7	1	\N	Elementary School	\N	\N	Female	NY	\N	\N	8
12	2	\N	Elementary School	Spanish	\N	\N	Other	55.109.78.38	Satterfield LLC	\N
13	1	\N	Elementary School	\N	\N	\N	CA	\N	Koelpin and Jakubowski Group	\N
14	2	\N	Elementary School	\N	\N	\N	NY	\N	\N	\N
8	2	\N	Elementary School	\N	Hispanic or Latino	\N	CA	154.181.28.10	\N	10
43	6	\N	Kindergarten	\N	\N	\N	Other	228.238.81.179	Medhurst LLC	6
46	5	\N	Elementary School	English	\N	Male	NY	179.74.130.64	\N	7
47	6	\N	Elementary School	Spanish	\N	Male	Other	142.79.133.44	Kris and Bailey and Sons	7
50	5	\N	Elementary School	Spanish	American Indian or Alaska Native	Male	CA	\N	Rippin and Mosciski and Sons	9
20	2	\N	Elementary School	Spanish	Asian	\N	NY	\N	\N	\N
21	1	\N	Elementary School	\N	\N	\N	NY	\N	Shanahan and Borer Group	\N
51	6	\N	Elementary School	English	\N	\N	Other	138.250.216.48	Hane and Dietrich Inc	11
59	6	\N	Elementary School	\N	\N	\N	CA	\N	\N	\N
24	2	\N	Kindergarten	English	Native Hawaiian or Other Pacific Islander	Female	NY	\N	Flatley and Sons	\N
64	5	\N	Elementary School	Spanish	\N	Female	CA	184.72.248.54	Kuhlman and Padberg and Sons	7
127	87	13-19 years	Middle School	English	\N	\N	NY	97.41.131.31	\N	13
27	1	\N	Elementary School	Spanish	\N	Male	CA	\N	Grimes Group	\N
28	2	\N	Elementary School	\N	American Indian or Alaska Native	\N	CA	249.233.232.236	Flatley Group	\N
128	88	13-19 years	Middle School	English	\N	Male	NY	243.125.141.50	\N	13
30	2	\N	Kindergarten	\N	\N	\N	Other	92.102.232.43	Medhurst LLC	\N
31	1	\N	Kindergarten	Other	Native Hawaiian or Other Pacific Islander	\N	NY	\N	\N	\N
129	87	13-19 years	High School	Spanish	\N	Male	Other	5.80.189.215	Kris and Bailey and Sons	17
33	1	\N	Elementary School	English	\N	Male	NY	19.153.68.44	\N	\N
34	2	\N	Elementary School	Spanish	\N	Male	Other	183.188.4.53	Kris and Bailey and Sons	\N
130	88	13-19 years	Middle School	\N	Hispanic or Latino	\N	CA	\N	Kuvalis and Satterfield Group	13
131	87	13-19 years	Other	English	White	\N	Other	195.177.83.174	\N	19
37	1	\N	Kindergarten	Spanish	American Indian or Alaska Native	Male	CA	\N	Rippin and Mosciski and Sons	\N
38	2	\N	Kindergarten	English	\N	\N	Other	121.138.82.205	Hane and Dietrich Inc	\N
132	88	13-19 years	High School	Spanish	American Indian or Alaska Native	Male	CA	\N	Rippin and Mosciski and Sons	15
133	87	13-19 years	Middle School	English	\N	\N	Other	64.225.90.201	Hane and Dietrich Inc	14
41	6	\N	Elementary School	\N	American Indian or Alaska Native	\N	NY	155.210.122.58	Hoppe Group	\N
134	88	13-19 years	Middle School	English	\N	\N	NY	100.184.99.237	\N	14
44	5	\N	Elementary School	Other	Native Hawaiian or Other Pacific Islander	\N	NY	\N	\N	\N
135	87	13-19 years	High School	\N	Two or More Races	Female	CA	163.122.24.93	Bernhard Inc	15
136	88	13-19 years	High School	English	Hispanic or Latino	\N	NY	47.80.245.9	Bergstrom and Farrell LLC	15
137	87	13-19 years	Other	\N	\N	\N	CA	53.158.45.17	\N	17
139	87	13-19 years	High School	\N	\N	Male	CA	153.182.112.34	Mayert and Koch and Sons	18
53	6	\N	Elementary School	\N	Two or More Races	Female	CA	17.46.225.126	Bernhard Inc	\N
140	88	13-19 years	Other	Other	\N	\N	NY	124.42.188.36	\N	18
141	87	13-19 years	Middle School	\N	\N	\N	CA	\N	\N	14
56	5	\N	Elementary School	\N	\N	\N	CA	\N	\N	\N
142	88	13-19 years	Middle School	\N	White	Male	CA	76.60.162.42	\N	14
143	87	13-19 years	Other	\N	Black or African American	\N	CA	\N	Rice and Thiel Group	17
144	88	13-19 years	High School	Other	\N	Non-binary	CA	\N	Breitenberg Group	17
145	87	13-19 years	Other	\N	\N	\N	CA	10.80.125.224	\N	16
62	5	\N	Kindergarten	Other	\N	Non-binary	CA	\N	Breitenberg Group	\N
146	88	13-19 years	High School	Spanish	\N	Female	CA	145.63.250.45	Kuhlman and Padberg and Sons	16
147	91	13-19 years	High School	\N	\N	\N	CA	\N	\N	15
66	5	\N	Elementary School	\N	\N	\N	Other	211.194.63.31	Upton Inc	\N
148	92	13-19 years	High School	\N	\N	Non-binary	NY	197.245.84.243	\N	14
68	5	\N	Elementary School	English	\N	Non-binary	NY	191.180.111.24	\N	\N
149	91	13-19 years	Other	Spanish	\N	Female	NY	\N	\N	17
70	5	\N	Elementary School	\N	Hispanic or Latino	Female	CA	11.87.79.49	Konopelski and Price LLC	\N
71	6	\N	Kindergarten	English	Two or More Races	\N	NY	\N	\N	\N
72	5	\N	Elementary School	Spanish	Hispanic or Latino	Female	CA	\N	\N	\N
74	5	\N	Elementary School	English	Hispanic or Latino	\N	CA	\N	Harris Group	\N
40	5	5-12 years	Elementary School	\N	Two or More Races	\N	NY	130.141.238.141	\N	\N
9	1	5-12 years	Kindergarten	Spanish	\N	\N	NY	\N	\N	5
10	2	5-12 years	Kindergarten	\N	Hispanic or Latino	Non-binary	NY	\N	\N	5
11	1	5-12 years	Kindergarten	\N	\N	\N	NY	\N	\N	5
15	1	5-12 years	Elementary School	Spanish	White	Non-binary	NY	\N	\N	7
16	2	5-12 years	Kindergarten	Spanish	\N	\N	NY	\N	Beier Inc	6
17	1	5-12 years	Kindergarten	\N	\N	\N	CA	\N	\N	6
18	2	5-12 years	Kindergarten	\N	American Indian or Alaska Native	\N	NY	22.180.17.232	\N	5
19	1	5-12 years	Elementary School	English	White	Male	NY	228.140.21.200	Jerde Inc	10
22	2	5-12 years	Elementary School	\N	\N	\N	CA	154.206.6.234	\N	12
23	1	5-12 years	Kindergarten	English	Two or More Races	\N	CA	\N	\N	11
25	1	5-12 years	Kindergarten	\N	\N	\N	CA	107.196.143.233	Torp and Bergstrom Group	9
26	2	5-12 years	Elementary School	\N	\N	Non-binary	Other	137.84.132.224	\N	11
29	1	5-12 years	Elementary School	English	\N	Female	NY	209.142.40.208	Senger and Corkery Inc	12
32	2	5-12 years	Kindergarten	English	\N	\N	NY	188.29.215.172	\N	5
35	1	5-12 years	Elementary School	\N	Hispanic or Latino	\N	CA	\N	Kuvalis and Satterfield Group	8
36	2	5-12 years	Elementary School	English	White	\N	Other	211.22.2.200	\N	8
39	1	5-12 years	Kindergarten	English	\N	\N	NY	150.217.91.195	\N	5
42	5	5-12 years	Kindergarten	English	\N	Female	NY	10.243.251.122	Senger and Corkery Inc	5
45	6	5-12 years	Kindergarten	English	\N	\N	NY	249.134.183.106	\N	6
48	5	5-12 years	Elementary School	\N	Hispanic or Latino	\N	CA	\N	Kuvalis and Satterfield Group	8
49	6	5-12 years	Kindergarten	English	White	\N	Other	5.111.112.126	\N	5
52	5	5-12 years	Elementary School	English	\N	\N	NY	156.127.215.225	\N	11
54	5	5-12 years	Kindergarten	English	Hispanic or Latino	\N	NY	243.171.252.51	Bergstrom and Farrell LLC	5
55	6	5-12 years	Elementary School	\N	\N	\N	CA	184.75.9.96	\N	8
57	6	5-12 years	Kindergarten	\N	\N	Male	CA	147.22.225.9	Mayert and Koch and Sons	6
58	5	5-12 years	Kindergarten	Other	\N	\N	NY	188.225.154.197	\N	6
60	5	5-12 years	Elementary School	\N	White	Male	CA	215.98.52.128	\N	9
61	6	5-12 years	Kindergarten	\N	Black or African American	\N	CA	\N	Rice and Thiel Group	5
63	6	5-12 years	Kindergarten	\N	\N	\N	CA	121.55.193.15	\N	5
65	6	5-12 years	Elementary School	Other	\N	Female	CA	\N	Kuphal Inc	9
67	6	5-12 years	Kindergarten	Spanish	Native Hawaiian or Other Pacific Islander	\N	CA	\N	\N	6
69	6	5-12 years	Elementary School	Pashto	\N	Female	CA	\N	Satterfield LLC	9
73	6	5-12 years	Elementary School	\N	\N	Male	CA	\N	Frami and Klein and Sons	7
150	92	13-19 years	Middle School	\N	Asian	\N	NY	\N	Bergstrom and Block Inc	13
75	11	13-19 years	High School	Pashto	Asian	Female	CA	\N	\N	15
76	12	13-19 years	Middle School	English	Two or More Races	Female	CA	1.9.74.81	Mitchell Group	13
77	11	13-19 years	Middle School	\N	\N	\N	Other	89.226.155.132	Medhurst LLC	14
78	12	13-19 years	Other	Other	Native Hawaiian or Other Pacific Islander	\N	NY	\N	\N	17
79	11	13-19 years	Middle School	English	\N	\N	NY	237.210.130.237	\N	13
80	12	13-19 years	Middle School	English	\N	Male	NY	201.4.162.11	\N	13
81	11	13-19 years	High School	Spanish	\N	Male	Other	233.182.63.236	Kris and Bailey and Sons	18
82	12	13-19 years	Middle School	\N	Hispanic or Latino	\N	CA	\N	Kuvalis and Satterfield Group	14
83	11	13-19 years	Other	English	White	\N	Other	81.192.5.27	\N	19
84	12	13-19 years	High School	Spanish	American Indian or Alaska Native	Male	CA	\N	Rippin and Mosciski and Sons	16
85	11	13-19 years	Middle School	English	\N	\N	Other	114.95.71.171	Hane and Dietrich Inc	13
86	12	13-19 years	Middle School	English	\N	\N	NY	189.91.115.164	\N	13
87	11	13-19 years	High School	\N	Two or More Races	Female	CA	162.39.170.95	Bernhard Inc	14
88	12	13-19 years	High School	English	Hispanic or Latino	\N	NY	179.118.51.77	Bergstrom and Farrell LLC	15
89	11	13-19 years	Other	\N	\N	\N	CA	156.204.84.252	\N	17
90	12	13-19 years	High School	\N	\N	\N	CA	\N	\N	17
91	11	13-19 years	High School	\N	\N	Male	CA	76.121.99.143	Mayert and Koch and Sons	16
92	12	13-19 years	Other	Other	\N	\N	NY	128.228.194.175	\N	13
93	11	13-19 years	Middle School	\N	\N	\N	CA	\N	\N	13
94	12	13-19 years	Middle School	\N	White	Male	CA	116.188.186.94	\N	13
95	11	13-19 years	Other	\N	Black or African American	\N	CA	\N	Rice and Thiel Group	15
96	12	13-19 years	High School	Other	\N	Non-binary	CA	\N	Breitenberg Group	16
97	11	13-19 years	Other	\N	\N	\N	CA	133.139.63.223	\N	16
98	12	13-19 years	High School	Spanish	\N	Female	CA	182.47.62.130	Kuhlman and Padberg and Sons	17
99	13	13-19 years	High School	Pashto	Asian	Female	CA	\N	\N	14
100	14	13-19 years	Middle School	English	Two or More Races	Female	CA	98.13.61.23	Mitchell Group	13
101	13	13-19 years	Middle School	\N	\N	\N	Other	111.128.169.198	Medhurst LLC	13
102	14	13-19 years	Other	Other	Native Hawaiian or Other Pacific Islander	\N	NY	\N	\N	18
103	13	13-19 years	Middle School	English	\N	\N	NY	25.156.55.165	\N	13
104	14	13-19 years	Middle School	English	\N	Male	NY	230.81.41.104	\N	13
105	13	13-19 years	High School	Spanish	\N	Male	Other	229.92.96.41	Kris and Bailey and Sons	17
106	14	13-19 years	Middle School	\N	Hispanic or Latino	\N	CA	\N	Kuvalis and Satterfield Group	13
151	91	13-19 years	Other	\N	\N	Non-binary	NY	\N	Parker and Kirlin Group	17
107	13	13-19 years	Other	English	White	\N	Other	165.40.202.239	\N	14
108	14	13-19 years	High School	Spanish	American Indian or Alaska Native	Male	CA	\N	Rippin and Mosciski and Sons	14
109	13	13-19 years	Middle School	English	\N	\N	Other	188.66.57.66	Hane and Dietrich Inc	13
110	14	13-19 years	Middle School	English	\N	\N	NY	98.60.110.165	\N	13
111	13	13-19 years	High School	\N	Two or More Races	Female	CA	54.163.122.213	Bernhard Inc	18
112	14	13-19 years	High School	English	Hispanic or Latino	\N	NY	184.89.40.232	Bergstrom and Farrell LLC	16
113	13	13-19 years	Other	\N	\N	\N	CA	211.177.39.96	\N	16
114	14	13-19 years	High School	\N	\N	\N	CA	\N	\N	16
115	13	13-19 years	High School	\N	\N	Male	CA	216.66.236.157	Mayert and Koch and Sons	15
116	14	13-19 years	Other	Other	\N	\N	NY	68.18.62.113	\N	15
117	13	13-19 years	Middle School	\N	\N	\N	CA	\N	\N	13
118	14	13-19 years	Middle School	\N	White	Male	CA	127.223.142.145	\N	14
119	13	13-19 years	Other	\N	Black or African American	\N	CA	\N	Rice and Thiel Group	13
120	14	13-19 years	High School	Other	\N	Non-binary	CA	\N	Breitenberg Group	15
121	13	13-19 years	Other	\N	\N	\N	CA	17.123.117.115	\N	15
122	14	13-19 years	High School	Spanish	\N	Female	CA	34.144.116.12	Kuhlman and Padberg and Sons	17
123	87	13-19 years	High School	Pashto	Asian	Female	CA	\N	\N	16
124	88	13-19 years	Middle School	English	Two or More Races	Female	CA	146.217.46.131	Mitchell Group	14
125	87	13-19 years	Middle School	\N	\N	\N	Other	172.120.235.45	Medhurst LLC	13
126	88	13-19 years	Other	Other	Native Hawaiian or Other Pacific Islander	\N	NY	\N	\N	19
138	88	13-19 years	High School	\N	\N	\N	CA	\N	\N	17
152	92	13-19 years	Other	\N	Native Hawaiian or Other Pacific Islander	\N	CA	248.145.35.72	\N	19
153	91	13-19 years	High School	Spanish	White	\N	NY	\N	\N	15
\.


--
-- Data for Name: users_education_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_education_profile (user_education_profile_id, user_id, academic_goals, career_goals, education_level, favorite_subjects, assistance_requested) FROM stdin;
1	1	I will turn in my homework on time.	\N	Elementary School	Science	I need help with my homework.
2	2	I will use two new vocabulary words every week	\N	Kindergarten	History	I need help with financial aid forms.
3	1	I will improve my grades.	\N	Kindergarten	Math	\N
4	2	I will use two new vocabulary words every week	\N	Kindergarten	English	\N
5	1	I will turn in my homework on time.	\N	Elementary School	\N	\N
6	2	I will join an sport or club after school.	\N	Elementary School	English	I need help with my homework.
7	1	I will turn in my homework on time.	\N	Elementary School	\N	I need help with my homework.
8	5	\N	\N	Elementary School	\N	\N
9	6	I will join an sport or club after school.	\N	Elementary School	Science	I need a math tutor.
10	5	I will improve my grades.	\N	Kindergarten	Math	I need help with my homework.
11	6	I will turn in my homework on time.	\N	Kindergarten	Math	I need help with financial aid forms.
12	5	I will improve my grades.	\N	Elementary School	\N	I need help with my Bridging Tech laptop.
13	6	I will use two new vocabulary words every week	\N	Kindergarten	English	\N
14	5	\N	\N	Elementary School	Science	\N
15	6	I will turn in my homework on time.	\N	Elementary School	Math	I need help with financial aid forms.
16	5	I will practice reading at home.	\N	Elementary School	History	I need help with my Bridging Tech laptop.
17	6	I will turn in my homework on time.	\N	Kindergarten	PE	\N
18	5	I will use two new vocabulary words every week	\N	Elementary School	PE	I need help with my homework.
19	6	I will turn in my homework on time.	\N	Elementary School	Math	\N
20	5	I will use two new vocabulary words every week	\N	Elementary School	\N	\N
21	6	I will improve my grades.	\N	Elementary School	\N	\N
22	5	I will turn in my homework on time.	\N	Kindergarten	Science	I need help with reading and comprehension.
23	6	I will use two new vocabulary words every week	\N	Elementary School	\N	I need a math tutor.
24	5	I will practice reading at home.	\N	Elementary School	\N	\N
25	6	I will turn in my homework on time.	\N	Kindergarten	\N	I need help with financial aid forms.
26	5	I will practice reading at home.	\N	Kindergarten	\N	I need help with my Bridging Tech laptop.
27	6	I will join an sport or club after school.	\N	Elementary School	\N	I need help with reading and comprehension.
28	5	I will turn in my homework on time.	\N	Elementary School	\N	I need help with my Bridging Tech laptop.
29	6	I will improve my grades.	\N	Kindergarten	\N	\N
30	5	I will join an sport or club after school.	\N	Kindergarten	\N	\N
31	6	I will turn in my homework on time.	\N	Kindergarten	\N	I need help with financial aid forms.
32	5	I will use two new vocabulary words every week	\N	Elementary School	\N	I need help with my Bridging Tech laptop.
33	6	I will turn in my homework on time.	\N	Elementary School	\N	I need help with my Bridging Tech laptop.
34	5	\N	\N	Elementary School	Math	\N
35	6	\N	\N	Kindergarten	Science	I need help with reading and comprehension.
36	5	I will turn in my homework on time.	\N	Elementary School	History	I need help with my homework.
37	6	I will turn in my homework on time.	\N	Elementary School	\N	I need help with my Bridging Tech laptop.
38	5	I will turn in my homework on time.	\N	Elementary School	Math	I need help with my homework.
39	6	I will practice reading at home.	\N	Kindergarten	\N	I need help with my Bridging Tech laptop.
40	5	I will improve my grades.	\N	Elementary School	\N	I need help with my homework.
41	6	\N	\N	Elementary School	Math	I need a math tutor.
42	5	I will use two new vocabulary words every week	\N	Elementary School	\N	I need help with my homework.
43	6	\N	\N	Kindergarten	Science	\N
44	5	\N	\N	Kindergarten	Math	I need help with reading and comprehension.
45	6	I will use two new vocabulary words every week	\N	Elementary School	\N	\N
46	5	I will practice reading at home.	\N	Elementary School	\N	I need a math tutor.
47	6	I will practice reading at home.	\N	Elementary School	\N	I need help with my Bridging Tech laptop.
48	5	I will improve my grades.	\N	Elementary School	\N	I need help with my homework.
49	6	\N	\N	Elementary School	History	\N
50	5	I will improve my grades.	\N	Elementary School	PE	\N
51	6	I will turn in my homework on time.	\N	Kindergarten	Science	\N
52	9	\N	\N	Elementary School	\N	\N
53	10	I will join an sport or club after school.	\N	Elementary School	Science	I need a math tutor.
54	9	I will improve my grades.	\N	Kindergarten	Math	I need help with my homework.
55	10	I will turn in my homework on time.	\N	Kindergarten	Math	I need help with financial aid forms.
56	9	I will improve my grades.	\N	Elementary School	\N	I need help with my Bridging Tech laptop.
57	10	I will use two new vocabulary words every week	\N	Kindergarten	English	\N
58	9	\N	\N	Elementary School	Science	\N
59	10	I will turn in my homework on time.	\N	Elementary School	Math	I need help with financial aid forms.
60	9	I will practice reading at home.	\N	Elementary School	History	I need help with my Bridging Tech laptop.
61	10	I will turn in my homework on time.	\N	Kindergarten	PE	\N
62	9	I will use two new vocabulary words every week	\N	Elementary School	PE	I need help with my homework.
63	10	I will turn in my homework on time.	\N	Elementary School	Math	\N
64	9	I will use two new vocabulary words every week	\N	Elementary School	\N	\N
65	10	I will improve my grades.	\N	Elementary School	\N	\N
66	9	I will turn in my homework on time.	\N	Kindergarten	Science	I need help with reading and comprehension.
67	10	I will use two new vocabulary words every week	\N	Elementary School	\N	I need a math tutor.
68	9	I will practice reading at home.	\N	Elementary School	\N	\N
69	10	I will turn in my homework on time.	\N	Kindergarten	\N	I need help with financial aid forms.
70	9	I will practice reading at home.	\N	Kindergarten	\N	I need help with my Bridging Tech laptop.
71	10	I will join an sport or club after school.	\N	Elementary School	\N	I need help with reading and comprehension.
72	9	I will turn in my homework on time.	\N	Elementary School	\N	I need help with my Bridging Tech laptop.
73	10	I will improve my grades.	\N	Kindergarten	\N	\N
74	9	I will join an sport or club after school.	\N	Kindergarten	\N	\N
75	10	I will turn in my homework on time.	\N	Kindergarten	\N	I need help with financial aid forms.
76	9	I will use two new vocabulary words every week	\N	Elementary School	\N	I need help with my Bridging Tech laptop.
77	10	I will turn in my homework on time.	\N	Elementary School	\N	I need help with my Bridging Tech laptop.
78	9	\N	\N	Elementary School	Math	\N
79	10	\N	\N	Kindergarten	Science	I need help with reading and comprehension.
80	9	I will turn in my homework on time.	\N	Elementary School	History	I need help with my homework.
81	10	I will turn in my homework on time.	\N	Elementary School	\N	I need help with my Bridging Tech laptop.
82	9	I will turn in my homework on time.	\N	Elementary School	Math	I need help with my homework.
83	10	I will practice reading at home.	\N	Kindergarten	\N	I need help with my Bridging Tech laptop.
84	9	I will improve my grades.	\N	Elementary School	\N	I need help with my homework.
85	10	\N	\N	Elementary School	Math	I need a math tutor.
86	9	I will use two new vocabulary words every week	\N	Elementary School	\N	I need help with my homework.
87	10	\N	\N	Kindergarten	Science	\N
88	9	\N	\N	Kindergarten	Math	I need help with reading and comprehension.
89	10	I will use two new vocabulary words every week	\N	Elementary School	\N	\N
90	9	I will practice reading at home.	\N	Elementary School	\N	I need a math tutor.
91	10	I will practice reading at home.	\N	Elementary School	\N	I need help with my Bridging Tech laptop.
92	9	I will improve my grades.	\N	Elementary School	\N	I need help with my homework.
93	10	\N	\N	Elementary School	History	\N
94	9	I will improve my grades.	\N	Elementary School	PE	\N
95	10	I will turn in my homework on time.	\N	Kindergarten	Science	\N
96	11	I will use two new vocabulary words every week	I want to attend career fairs at my school.	High School	Math	I need help with reading and comprehension.
97	12	I will turn in my homework on time.	\N	Middle School	History	I need help with my Bridging Tech laptop.
98	11	I will turn in my homework on time.	I want to attend career fairs at my school.	Middle School	\N	I need help with my Bridging Tech laptop.
99	12	I will practice reading at home.	I want to balance my job and school.	Other	Science	I need help with my homework.
100	11	I will join an sport or club after school.	I want to finish my college application.	Middle School	\N	I need help with reading and comprehension.
101	12	I will practice reading at home.	I want to finish my trade school application.	Middle School	History	I need help with reading and comprehension.
102	11	I will turn in my homework on time.	I want to get a mentor in my field.	High School	Math	\N
103	12	I will practice reading at home.	I want to get a summer job.	Middle School	Math	\N
104	11	\N	\N	Other	\N	\N
105	12	I will practice reading at home.	\N	High School	English	\N
106	11	I will improve my grades.	\N	Middle School	English	I need help with reading and comprehension.
107	12	I will turn in my homework on time.	\N	Middle School	\N	I need help with my Bridging Tech laptop.
108	11	I will improve my grades.	I want to get a summer job.	High School	Science	I need help with my homework.
109	12	\N	\N	High School	Science	I need help with my homework.
110	11	I will turn in my homework on time.	I want to earn a certificate in my field.	Other	English	I need help with my homework.
111	12	I will turn in my homework on time.	I want to get a mentor in my field.	High School	\N	I need a math tutor.
112	11	I will improve my grades.	I want to attend career fairs at my school.	High School	\N	\N
113	12	I will use two new vocabulary words every week	I want to attend career fairs at my school.	Other	English	I need help with my homework.
114	11	I will improve my grades.	I want to get a mentor in my field.	Middle School	English	I need help with reading and comprehension.
115	12	I will join an sport or club after school.	\N	Middle School	\N	\N
116	11	\N	I want to earn a certificate in my field.	Other	History	I need help with my homework.
117	12	I will use two new vocabulary words every week	\N	High School	\N	\N
118	11	\N	\N	Other	\N	I need help with my homework.
119	12	I will use two new vocabulary words every week	I want to finish my trade school application.	High School	History	\N
120	11	I will improve my grades.	\N	Middle School	PE	I need help with my Bridging Tech laptop.
121	12	I will turn in my homework on time.	I want to attend career fairs at my school.	Other	\N	I need help with my homework.
122	11	I will turn in my homework on time.	\N	Other	\N	I need help with reading and comprehension.
123	12	I will practice reading at home.	I want to attend career fairs at my school.	Middle School	History	\N
124	11	\N	\N	High School	English	I need help with my Bridging Tech laptop.
125	12	\N	I want to earn a certificate in my field.	Middle School	\N	\N
126	11	I will join an sport or club after school.	\N	High School	\N	\N
127	12	\N	\N	High School	\N	I need help with my homework.
128	11	I will practice reading at home.	I want to get a mentor in my field.	Middle School	\N	\N
129	13	I will use two new vocabulary words every week	I want to attend career fairs at my school.	High School	Math	I need help with reading and comprehension.
130	14	I will turn in my homework on time.	\N	Middle School	History	I need help with my Bridging Tech laptop.
131	13	I will turn in my homework on time.	I want to attend career fairs at my school.	Middle School	\N	I need help with my Bridging Tech laptop.
132	14	I will practice reading at home.	I want to balance my job and school.	Other	Science	I need help with my homework.
133	13	I will join an sport or club after school.	I want to finish my college application.	Middle School	\N	I need help with reading and comprehension.
134	14	I will practice reading at home.	I want to finish my trade school application.	Middle School	History	I need help with reading and comprehension.
135	13	I will turn in my homework on time.	I want to get a mentor in my field.	High School	Math	\N
136	14	I will practice reading at home.	I want to get a summer job.	Middle School	Math	\N
137	13	\N	\N	Other	\N	\N
138	14	I will practice reading at home.	\N	High School	English	\N
139	13	I will improve my grades.	\N	Middle School	English	I need help with reading and comprehension.
140	14	I will turn in my homework on time.	\N	Middle School	\N	I need help with my Bridging Tech laptop.
141	13	I will improve my grades.	I want to get a summer job.	High School	Science	I need help with my homework.
142	14	\N	\N	High School	Science	I need help with my homework.
143	13	I will turn in my homework on time.	I want to earn a certificate in my field.	Other	English	I need help with my homework.
144	14	I will turn in my homework on time.	I want to get a mentor in my field.	High School	\N	I need a math tutor.
145	13	I will improve my grades.	I want to attend career fairs at my school.	High School	\N	\N
146	14	I will use two new vocabulary words every week	I want to attend career fairs at my school.	Other	English	I need help with my homework.
147	13	I will improve my grades.	I want to get a mentor in my field.	Middle School	English	I need help with reading and comprehension.
148	14	I will join an sport or club after school.	\N	Middle School	\N	\N
149	13	\N	I want to earn a certificate in my field.	Other	History	I need help with my homework.
150	14	I will use two new vocabulary words every week	\N	High School	\N	\N
151	13	\N	\N	Other	\N	I need help with my homework.
152	14	I will use two new vocabulary words every week	I want to finish my trade school application.	High School	History	\N
153	13	I will improve my grades.	\N	Middle School	PE	I need help with my Bridging Tech laptop.
154	14	I will turn in my homework on time.	I want to attend career fairs at my school.	Other	\N	I need help with my homework.
155	13	I will turn in my homework on time.	\N	Other	\N	I need help with reading and comprehension.
156	14	I will practice reading at home.	I want to attend career fairs at my school.	Middle School	History	\N
157	13	\N	\N	High School	English	I need help with my Bridging Tech laptop.
158	14	\N	I want to earn a certificate in my field.	Middle School	\N	\N
159	13	I will join an sport or club after school.	\N	High School	\N	\N
160	14	\N	\N	High School	\N	I need help with my homework.
161	13	I will practice reading at home.	I want to get a mentor in my field.	Middle School	\N	\N
162	85	I will use two new vocabulary words every week	I want to attend career fairs at my school.	High School	Math	I need help with reading and comprehension.
163	86	I will turn in my homework on time.	\N	Middle School	History	I need help with my Bridging Tech laptop.
164	85	I will turn in my homework on time.	I want to attend career fairs at my school.	Middle School	\N	I need help with my Bridging Tech laptop.
165	86	I will practice reading at home.	I want to balance my job and school.	Other	Science	I need help with my homework.
166	85	I will join an sport or club after school.	I want to finish my college application.	Middle School	\N	I need help with reading and comprehension.
167	86	I will practice reading at home.	I want to finish my trade school application.	Middle School	History	I need help with reading and comprehension.
168	85	I will turn in my homework on time.	I want to get a mentor in my field.	High School	Math	\N
169	86	I will practice reading at home.	I want to get a summer job.	Middle School	Math	\N
170	85	\N	\N	Other	\N	\N
171	86	I will practice reading at home.	\N	High School	English	\N
172	85	I will improve my grades.	\N	Middle School	English	I need help with reading and comprehension.
173	86	I will turn in my homework on time.	\N	Middle School	\N	I need help with my Bridging Tech laptop.
174	85	I will improve my grades.	I want to get a summer job.	High School	Science	I need help with my homework.
175	86	\N	\N	High School	Science	I need help with my homework.
176	85	I will turn in my homework on time.	I want to earn a certificate in my field.	Other	English	I need help with my homework.
177	86	I will turn in my homework on time.	I want to get a mentor in my field.	High School	\N	I need a math tutor.
178	85	I will improve my grades.	I want to attend career fairs at my school.	High School	\N	\N
179	86	I will use two new vocabulary words every week	I want to attend career fairs at my school.	Other	English	I need help with my homework.
180	85	I will improve my grades.	I want to get a mentor in my field.	Middle School	English	I need help with reading and comprehension.
181	86	I will join an sport or club after school.	\N	Middle School	\N	\N
182	85	\N	I want to earn a certificate in my field.	Other	History	I need help with my homework.
183	86	I will use two new vocabulary words every week	\N	High School	\N	\N
184	85	\N	\N	Other	\N	I need help with my homework.
185	86	I will use two new vocabulary words every week	I want to finish my trade school application.	High School	History	\N
186	85	I will improve my grades.	\N	Middle School	PE	I need help with my Bridging Tech laptop.
187	86	I will turn in my homework on time.	I want to attend career fairs at my school.	Other	\N	I need help with my homework.
188	85	I will turn in my homework on time.	\N	Other	\N	I need help with reading and comprehension.
189	86	I will practice reading at home.	I want to attend career fairs at my school.	Middle School	History	\N
190	85	\N	\N	High School	English	I need help with my Bridging Tech laptop.
191	86	\N	I want to earn a certificate in my field.	Middle School	\N	\N
192	85	I will join an sport or club after school.	\N	High School	\N	\N
193	86	\N	\N	High School	\N	I need help with my homework.
194	85	I will practice reading at home.	I want to get a mentor in my field.	Middle School	\N	\N
195	87	I will use two new vocabulary words every week	I want to attend career fairs at my school.	High School	Math	I need help with reading and comprehension.
196	88	I will turn in my homework on time.	\N	Middle School	History	I need help with my Bridging Tech laptop.
197	87	I will turn in my homework on time.	I want to attend career fairs at my school.	Middle School	\N	I need help with my Bridging Tech laptop.
198	88	I will practice reading at home.	I want to balance my job and school.	Other	Science	I need help with my homework.
199	87	I will join an sport or club after school.	I want to finish my college application.	Middle School	\N	I need help with reading and comprehension.
200	88	I will practice reading at home.	I want to finish my trade school application.	Middle School	History	I need help with reading and comprehension.
201	87	I will turn in my homework on time.	I want to get a mentor in my field.	High School	Math	\N
202	88	I will practice reading at home.	I want to get a summer job.	Middle School	Math	\N
203	87	\N	\N	Other	\N	\N
204	88	I will practice reading at home.	\N	High School	English	\N
205	87	I will improve my grades.	\N	Middle School	English	I need help with reading and comprehension.
206	88	I will turn in my homework on time.	\N	Middle School	\N	I need help with my Bridging Tech laptop.
207	87	I will improve my grades.	I want to get a summer job.	High School	Science	I need help with my homework.
208	88	\N	\N	High School	Science	I need help with my homework.
209	87	I will turn in my homework on time.	I want to earn a certificate in my field.	Other	English	I need help with my homework.
210	88	I will turn in my homework on time.	I want to get a mentor in my field.	High School	\N	I need a math tutor.
211	87	I will improve my grades.	I want to attend career fairs at my school.	High School	\N	\N
212	88	I will use two new vocabulary words every week	I want to attend career fairs at my school.	Other	English	I need help with my homework.
213	87	I will improve my grades.	I want to get a mentor in my field.	Middle School	English	I need help with reading and comprehension.
214	88	I will join an sport or club after school.	\N	Middle School	\N	\N
215	87	\N	I want to earn a certificate in my field.	Other	History	I need help with my homework.
216	88	I will use two new vocabulary words every week	\N	High School	\N	\N
217	87	\N	\N	Other	\N	I need help with my homework.
218	88	I will use two new vocabulary words every week	I want to finish my trade school application.	High School	History	\N
219	87	I will improve my grades.	\N	Middle School	PE	I need help with my Bridging Tech laptop.
220	88	I will turn in my homework on time.	I want to attend career fairs at my school.	Other	\N	I need help with my homework.
221	87	I will turn in my homework on time.	\N	Other	\N	I need help with reading and comprehension.
222	88	I will practice reading at home.	I want to attend career fairs at my school.	Middle School	History	\N
223	87	\N	\N	High School	English	I need help with my Bridging Tech laptop.
224	88	\N	I want to earn a certificate in my field.	Middle School	\N	\N
225	87	I will join an sport or club after school.	\N	High School	\N	\N
226	88	\N	\N	High School	\N	I need help with my homework.
227	87	I will practice reading at home.	I want to get a mentor in my field.	Middle School	\N	\N
228	91	I will improve my grades.	I want to attend career fairs at my school.	High School	\N	\N
229	92	I will use two new vocabulary words every week	\N	High School	Math	I need help with reading and comprehension.
230	91	I will improve my grades.	I want to earn a certificate in my field.	Other	\N	I need help with my homework.
231	92	I will turn in my homework on time.	\N	Middle School	History	\N
232	91	I will turn in my homework on time.	\N	Other	History	I need help with financial aid forms.
233	92	I will turn in my homework on time.	\N	Other	\N	I need help with my homework.
\.


--
-- Data for Name: users_grades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_grades (user_grades_id, user_id, subject_name, subject_grade) FROM stdin;
26	2	Math	A-
28	2	PE	C
29	1	English	B-
31	1	Science	D+
33	5	Math	C-
42	6	English	B
43	5	PE	A
49	5	Science	A+
54	6	Math	D-
56	6	English	B+
3	1	History	B-
11	1	History	A+
12	2	PE	B-
16	2	PE	B
17	1	Math	A
18	2	Science	B+
21	1	English	C-
39	5	Science	B-
47	5	History	B+
14	2	Math	A-
57	11	Math	A-
72	12	English	A+
76	12	Science	A+
78	12	Science	D+
82	12	English	B+
83	13	Math	A-
10	2	English	A
20	2	Science	C
24	2	Math	A-
25	1	English	B-
27	1	English	B+
36	6	Math	A+
44	6	English	B-
45	5	Science	D+
48	6	Math	D-
50	6	History	B
95	13	Math	C
115	87	Math	D
116	88	History	B
117	87	Math	B
119	87	Science	A
122	88	English	B+
126	88	English	B-
127	87	PE	F
131	87	History	B
133	87	Math	B+
138	92	Science	A
58	12	History	D+
59	11	English	C-
63	11	History	A+
64	12	PE	B
65	11	Math	A-
67	11	PE	A
69	11	Math	F
70	12	Science	B+
73	11	English	C+
74	12	Math	B-
75	11	History	F
84	14	History	A
87	13	Science	B+
89	13	History	B-
96	14	Math	B+
98	14	English	A+
102	14	Science	A+
104	14	Science	D+
105	13	\N	B
107	13	\N	B+
108	14	English	B+
109	87	Math	A-
124	88	English	A+
128	88	Science	A+
130	88	Science	D+
134	88	English	B+
139	91	Math	B
61	11	Science	D
79	11	Math	B
81	11	PE	B+
85	13	Science	C-
90	14	PE	B
91	13	Math	F
93	13	English	A
99	13	English	A
100	14	History	B-
101	13	PE	F
110	88	History	A
111	87	Math	C-
113	87	Science	F
121	87	Math	C
125	87	English	B
\.


--
-- Data for Name: users_points_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_points_history (user_id, points_earned, points_total, points_spent, login_streak, quest_awards, revisit_awards) FROM stdin;
91	239264	72476	243118	10	89	99
11	531309	93945	919312	14	559	550
92	55451	89485	163643	14	109	99
87	531309	93945	919312	14	559	550
88	504327	89485	982433	14	554	470
14	504327	89485	982433	14	554	470
13	531309	93945	919312	14	559	550
10	346294	89485	772542	14	414	355
9	351844	93945	667235	14	446	452
1	504958	90615	471991	13	316	237
5	351844	93945	667235	14	446	452
2	220181	95292	687852	14	271	281
6	346294	89485	772542	14	414	355
86	504327	89485	982433	14	554	470
12	504327	89485	982433	14	554	470
85	531309	93945	919312	14	559	550
\.


--
-- Name: users_app_usage_user_app_usage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_app_usage_user_app_usage_id_seq', 22, false);


--
-- Name: users_course_ratings_user_course_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_course_ratings_user_course_rating_id_seq', 49, false);


--
-- Name: users_demographics_user_demographics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_demographics_user_demographics_id_seq', 40, false);


--
-- Name: users_education_profile_user_education_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_education_profile_user_education_profile_id_seq', 8, false);


--
-- Name: users_grades_user_grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_grades_user_grades_id_seq', 33, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 30, false);


--
-- Name: users_points_history new_users_points_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_points_history
    ADD CONSTRAINT new_users_points_history_pkey PRIMARY KEY (user_id);


--
-- Name: users unique_username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_username UNIQUE (username);


--
-- Name: users_app_usage users_app_usage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_app_usage
    ADD CONSTRAINT users_app_usage_pkey PRIMARY KEY (user_app_usage_id);


--
-- Name: users_course_ratings users_course_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_course_ratings
    ADD CONSTRAINT users_course_ratings_pkey PRIMARY KEY (user_course_rating_id);


--
-- Name: users_demographics users_demographics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_demographics
    ADD CONSTRAINT users_demographics_pkey PRIMARY KEY (user_demographics_id);


--
-- Name: users_education_profile users_education_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_education_profile
    ADD CONSTRAINT users_education_profile_pkey PRIMARY KEY (user_education_profile_id);


--
-- Name: users_grades users_grades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_grades
    ADD CONSTRAINT users_grades_pkey PRIMARY KEY (user_grades_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users trigger_set_parent_consent_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_set_parent_consent_date BEFORE INSERT OR UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.set_parent_consent_date();


--
-- Name: users_points_history new_users_points_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_points_history
    ADD CONSTRAINT new_users_points_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: users_app_usage users_app_usage_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_app_usage
    ADD CONSTRAINT users_app_usage_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: users_course_ratings users_course_ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_course_ratings
    ADD CONSTRAINT users_course_ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: users_demographics users_demographics_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_demographics
    ADD CONSTRAINT users_demographics_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: users_education_profile users_education_profile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_education_profile
    ADD CONSTRAINT users_education_profile_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: users_grades users_grades_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_grades
    ADD CONSTRAINT users_grades_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

