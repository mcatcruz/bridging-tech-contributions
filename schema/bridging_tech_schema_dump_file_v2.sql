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

