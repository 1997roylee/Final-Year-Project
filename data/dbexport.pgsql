--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: togatherculture
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO togatherculture;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: togatherculture
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO togatherculture;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togatherculture
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: togatherculture
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO togatherculture;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: togatherculture
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO togatherculture;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togatherculture
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: togatherculture
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO togatherculture;

--
-- Name: assignments; Type: TABLE; Schema: public; Owner: togatherculture
--

CREATE TABLE public.assignments (
    id bigint NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    description character varying DEFAULT ''::character varying NOT NULL,
    submit_at timestamp without time zone NOT NULL,
    lecture_id integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.assignments OWNER TO togatherculture;

--
-- Name: assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: togatherculture
--

CREATE SEQUENCE public.assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assignments_id_seq OWNER TO togatherculture;

--
-- Name: assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togatherculture
--

ALTER SEQUENCE public.assignments_id_seq OWNED BY public.assignments.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: togatherculture
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    parent_id integer,
    category_name character varying(50),
    category_tags character varying(256) DEFAULT ''::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO togatherculture;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: togatherculture
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO togatherculture;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togatherculture
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: togatherculture
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    course_id integer NOT NULL,
    rating double precision DEFAULT 0.0 NOT NULL,
    comment character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO togatherculture;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: togatherculture
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO togatherculture;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togatherculture
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: togatherculture
--

CREATE TABLE public.courses (
    id bigint NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    is_public boolean DEFAULT true,
    course_title character varying(256) DEFAULT ''::character varying NOT NULL,
    course_number character varying(256) DEFAULT ''::character varying NOT NULL,
    course_image_url character varying(256) DEFAULT ''::character varying,
    course_level character varying(30) NOT NULL,
    course_language character varying(30) NOT NULL,
    course_price double precision DEFAULT 0.0 NOT NULL,
    category_name character varying(50) DEFAULT ''::character varying,
    category_id integer,
    course_description text DEFAULT ''::text NOT NULL,
    course_gain character varying(256) DEFAULT ''::character varying NOT NULL,
    rating_score integer DEFAULT 0 NOT NULL,
    reviews_count integer DEFAULT 0 NOT NULL,
    enrol_count integer DEFAULT 0 NOT NULL,
    course_duration double precision DEFAULT 0.0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.courses OWNER TO togatherculture;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: togatherculture
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO togatherculture;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togatherculture
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: enrols; Type: TABLE; Schema: public; Owner: togatherculture
--

CREATE TABLE public.enrols (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    course_id integer NOT NULL,
    status character varying DEFAULT 'enroling'::character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.enrols OWNER TO togatherculture;

--
-- Name: enrols_id_seq; Type: SEQUENCE; Schema: public; Owner: togatherculture
--

CREATE SEQUENCE public.enrols_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enrols_id_seq OWNER TO togatherculture;

--
-- Name: enrols_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togatherculture
--

ALTER SEQUENCE public.enrols_id_seq OWNED BY public.enrols.id;


--
-- Name: lectures; Type: TABLE; Schema: public; Owner: togatherculture
--

CREATE TABLE public.lectures (
    id bigint NOT NULL,
    course_id integer NOT NULL,
    lecture integer DEFAULT 0 NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    description character varying DEFAULT ''::character varying NOT NULL,
    duration double precision DEFAULT 0.0 NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.lectures OWNER TO togatherculture;

--
-- Name: lectures_id_seq; Type: SEQUENCE; Schema: public; Owner: togatherculture
--

CREATE SEQUENCE public.lectures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lectures_id_seq OWNER TO togatherculture;

--
-- Name: lectures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togatherculture
--

ALTER SEQUENCE public.lectures_id_seq OWNED BY public.lectures.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: togatherculture
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    target_id integer NOT NULL,
    message character varying DEFAULT ''::character varying NOT NULL,
    is_read boolean DEFAULT false NOT NULL,
    link character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.notifications OWNER TO togatherculture;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: togatherculture
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO togatherculture;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togatherculture
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: togatherculture
--

CREATE TABLE public.ratings (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    course_id integer NOT NULL,
    rating double precision NOT NULL,
    comment character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ratings OWNER TO togatherculture;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: togatherculture
--

CREATE SEQUENCE public.ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_id_seq OWNER TO togatherculture;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togatherculture
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: togatherculture
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO togatherculture;

--
-- Name: users; Type: TABLE; Schema: public; Owner: togatherculture
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(64) NOT NULL,
    password character varying(20),
    password_digest character varying(64),
    auth_token character varying DEFAULT ''::character varying NOT NULL,
    reset_token character varying DEFAULT ''::character varying NOT NULL,
    student_name character varying(50) NOT NULL,
    student_number character varying(50) DEFAULT ''::character varying NOT NULL,
    teacher_number character varying(50) DEFAULT ''::character varying NOT NULL,
    is_mail_verified boolean DEFAULT false NOT NULL,
    is_instructor boolean DEFAULT false NOT NULL,
    is_student boolean DEFAULT false NOT NULL,
    is_professor boolean DEFAULT false NOT NULL,
    last_actived_at timestamp without time zone,
    stars_score integer DEFAULT 0 NOT NULL,
    reviews_count integer DEFAULT 0 NOT NULL,
    customer_count integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO togatherculture;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: togatherculture
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO togatherculture;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: togatherculture
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: assignments id; Type: DEFAULT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.assignments ALTER COLUMN id SET DEFAULT nextval('public.assignments_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: enrols id; Type: DEFAULT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.enrols ALTER COLUMN id SET DEFAULT nextval('public.enrols_id_seq'::regclass);


--
-- Name: lectures id; Type: DEFAULT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.lectures ALTER COLUMN id SET DEFAULT nextval('public.lectures_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: togatherculture
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	attachment	Assignment	1	1	2020-06-01 15:04:05.577843
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: togatherculture
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
1	0nphyxlez6x8phlkhu2ut6s373gh	online_study_recommendation.pdf	application/pdf	{"identified":true,"analyzed":true}	1698240	TwyfQWEklhFP+2RhH0vaSQ==	2020-06-01 15:04:05.572348
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: togatherculture
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-05-24 11:37:02.205281	2020-05-24 11:37:02.205281
\.


--
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: togatherculture
--

COPY public.assignments (id, title, description, submit_at, lecture_id, created_at, updated_at) FROM stdin;
1	assignment	abc	2020-06-01 15:04:05	4	2020-06-01 15:04:05.558869	2020-06-01 15:04:05.586176
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: togatherculture
--

COPY public.categories (id, parent_id, category_name, category_tags, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: togatherculture
--

COPY public.comments (id, user_id, course_id, rating, comment, created_at, updated_at) FROM stdin;
2	1	92	0	5e67	2020-05-25 10:33:43.936383	2020-05-25 10:33:43.936383
3	1	96	0	tyuiopoiuyuias	2020-06-01 15:02:29.7878	2020-06-01 15:02:29.7878
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: togatherculture
--

COPY public.courses (id, is_active, is_public, course_title, course_number, course_image_url, course_level, course_language, course_price, category_name, category_id, course_description, course_gain, rating_score, reviews_count, enrol_count, course_duration, created_at, updated_at) FROM stdin;
57	t	t	Achieving Personal and Professional Success	achievingpersonalandprofessionalsuccess	https://d15cw65ipctsrr.cloudfront.net/a2/4fb4c0e34511e695703bc9de1193a2/AchievingPersonal_ProfessionalSuccess-SQUARE_LOGO.jpg	Beginner	English	0		\N	Based on four of the most popular courses taught at the Wharton School, Achieving Personal and Professional Success is designed		29	14	0	0	2020-05-25 10:04:48.597996	2020-05-25 10:07:55.412664
76	t	t	Stanford Introduction to Food and Health	stanfordintroductiontofoodandhealth	https://s3.amazonaws.com/coursera-course-photos/b0/aae5e0b59611e58ae18543e6165465/fruit-bowl.jpg	Beginner	English	0		\N	Around the world, we find ourselves facing global epidemics of obesity, Type 2 Diabetes and other predominantly diet-related diseases		96	51	0	0	2020-05-25 10:04:48.751668	2020-05-25 10:08:02.679926
36	t	t	Foundations of Positive Psychology	foundationsofpositivepsychology	https://d15cw65ipctsrr.cloudfront.net/dd/7ae3d0bd8411e6834f83bd22b5a2e6/PositivePsychology_MOOC_Icons_Specialization.jpg	Beginner	English	0		\N	The University of Pennsylvania and Dr. Martin E.P. Seligman welcome you to Foundations of Positive Psychology. Our five-course		142	73	1	0	2020-05-25 10:04:48.47981	2020-05-25 10:11:00.525853
17	t	t	Data Science: Foundations using R	datascience:foundationsusingr	https://d15cw65ipctsrr.cloudfront.net/b6/e4931fd75a409c9a6dfae9ad95f903/Data-Science-Fundementals-in-Research.png	Beginner	English	0		\N	Ask the right questions, manipulate data sets, and create visualizations to communicate results.\\n\\nThis Specialization covers foundational data science		67	29	0	0	2020-05-25 10:04:48.364005	2020-05-25 10:07:37.273707
50	t	t	Introduction to Negotiation: A Strategic Playbook for Becoming a Principled and Persuasive Negotiator	introductiontonegotiation:astrategicplaybookforbecomingaprincipledandpersuasivenegotiator	https://s3.amazonaws.com/coursera-course-photos/b1/319d80c6c311e6a4490975aba8dbb3/Logo_Introduction-to-Negotiation.png	Mixed	English	0		\N	This course will help you be a better negotiator. Unlike many negotiation courses, we develop a framework for analyzing and		20	8	0	0	2020-05-25 10:04:48.565887	2020-05-25 10:07:53.687406
55	t	t	Social Media Marketing	socialmediamarketing	https://d2j5ihb19pt1hq.cloudfront.net/sdp_page/s12n_logos/Northwestern_SocialMediaMarketing_Istock54492310.jpg	Beginner	English	0		\N	In a 2018 survey of businesses, Buffer found that only 29% had effective social media marketing programs. A recent survey		118	53	0	0	2020-05-25 10:04:48.59459	2020-05-25 10:07:55.262723
56	t	t	Supply Chain Management	supplychainmanagement	https://d15cw65ipctsrr.cloudfront.net/77/07b0d04dde11e6a933f54c1ddb01d7/thumbnail.jpg	Beginner	English	0		\N	This Specialization is an introduction to the fascinating world of Supply Chain Management. When you complete the program you'll		8	4	0	0	2020-05-25 10:04:48.596365	2020-05-25 10:07:55.295643
95	t	t	Financial Accounting Fundamentals	financialaccountingfundamentals	https://s3.amazonaws.com/coursera-course-photos/d9/b7a0d0ff9c11e6b4394f01375dc7b5/FAFLogo.jpg	Beginner	English	0		\N	This course will teach you the tools you'll need to understand the fundamentals of financial accounting. Concise videos, the		122	63	0	0	2020-05-25 10:04:48.882275	2020-05-25 10:08:14.04651
1	t	t	IBM Data Science	ibmdatascience	https://d15cw65ipctsrr.cloudfront.net/ed/4131809fe511e8937a7926bc59e37f/Professional-Certificate---Data-Science---600x600---Blu-Text.png	Beginner	English	0		\N	Data Science has been ranked as one of the hottest professions and the demand for data practitioners is booming. This		46	16	0	0	2020-05-25 10:04:48.29467	2020-05-25 10:07:30.903155
6	t	t	Deep Learning	deeplearning	https://d15cw65ipctsrr.cloudfront.net/57/4be3fd8d16487ab9cfa7bba909b236/GreyLogoName1000x1000.png	Intermediate	English	0		\N	If you want to break into AI, this Specialization will help you do so. Deep Learning is one of the		181	73	0	0	2020-05-25 10:04:48.322579	2020-05-25 10:07:33.38956
2	t	t	Introduction to Data Science	introductiontodatascience	https://d15cw65ipctsrr.cloudfront.net/10/050240796d11e88ee4d58f19c7d422/Data-Science-Foundations-Logo-Draft-v3.png	Beginner	English	0		\N	In this Specialization learners will develop foundational Data Science skills to prepare them for a career or further learning that		30	13	0	0	2020-05-25 10:04:48.302388	2020-05-25 10:07:31.054196
7	t	t	Machine Learning	machinelearning	https://s3.amazonaws.com/coursera/topics/ml/large-icon.png	Mixed	English	0		\N	Machine learning is the science of getting computers to act without being explicitly programmed. In the past decade, machine learning		30	9	0	0	2020-05-25 10:04:48.324426	2020-05-25 10:07:33.471915
4	t	t	Python for Everybody	pythonforeverybody	https://d2j5ihb19pt1hq.cloudfront.net/sdp_page/s12n_logos/python.jpg	Beginner	English	0		\N	This Specialization builds on the success of the Python for Everybody course and will introduce fundamental programming concepts including data		168	75	0	0	2020-05-25 10:04:48.31538	2020-05-25 10:07:32.164865
3	t	t	The Science of Well-Being	thescienceofwell-being	https://s3.amazonaws.com/coursera-course-photos/7e/aff5b0f54c11e7b5ae579a0e963c38/Logo_TheScienceofWell-Being.png	Mixed	English	0		\N	In this course you will engage in a series of challenges designed to increase your own happiness and build more		65	34	0	0	2020-05-25 10:04:48.30403	2020-05-25 10:07:31.411713
5	t	t	Google IT Support	googleitsupport	https://d15cw65ipctsrr.cloudfront.net/14/b2d530f1ad11e7ab380fc0c6c817a8/Search-Thumbnail.jpg	Beginner	English	0		\N	This 5-course certificate, developed by Google, includes innovative curriculum designed to prepare you for an entry-level role in		108	51	0	0	2020-05-25 10:04:48.318654	2020-05-25 10:07:32.745477
8	t	t	Business Foundations	businessfoundations	https://d396qusza40orc.cloudfront.net/phoenixassets/wharton-business-foundations/wharton-business-foundations-logo.jpg	Beginner	English	0		\N	In this Specialization, you’ll develop basic literacy in the language of business, which you can use to transition to		66	27	0	0	2020-05-25 10:04:48.326121	2020-05-25 10:07:33.71726
11	t	t	Cloud Engineering with Google Cloud	cloudengineeringwithgooglecloud	https://d15cw65ipctsrr.cloudfront.net/64/b30013147f4398b756ee843ce9895c/Option-1_1.png	Intermediate	English	0		\N	This program provides the skills you need to advance your career as a cloud engineer and recommends training to support		57	25	0	0	2020-05-25 10:04:48.330811	2020-05-25 10:07:35.240341
10	t	t	Cloud Architecture with Google Cloud	cloudarchitecturewithgooglecloud	https://d15cw65ipctsrr.cloudfront.net/1d/714104d1c241e8981bb58390da9811/Option-2_1.png	Intermediate	English	0		\N	The Google Cloud Professional Cloud Architect certification was ranked one of the top paying IT certifications of 2019 by Global		249	93	0	0	2020-05-25 10:04:48.329268	2020-05-25 10:07:34.996265
9	t	t	Applied Data Science	applieddatascience	https://d15cw65ipctsrr.cloudfront.net/8b/61b3208e9411e8bd0e199d89262fda/Applied_Data_Science.png	Beginner	English	0		\N	This is an action-packed specialization is for data science enthusiasts who want to acquire practical skills for real world		128	59	0	0	2020-05-25 10:04:48.327744	2020-05-25 10:07:34.165391
12	t	t	Architecting with Google Compute Engine	architectingwithgooglecomputeengine	https://d15cw65ipctsrr.cloudfront.net/6a/75d00056d811e7aae86b0ee90dd46b/hero-2.jpg	Intermediate	English	0		\N	This specialization introduces learners to the comprehensive and flexible infrastructure and platform services provided by Google Cloud Platform, with a		233	100	0	0	2020-05-25 10:04:48.332374	2020-05-25 10:07:36.144455
13	t	t	Excel Skills for Business	excelskillsforbusiness	https://d15cw65ipctsrr.cloudfront.net/ce/4c3bc09e8d11e8bc8875c1656a675d/Excel-Specialisation-Logo-Final-V2.jpg	Beginner	English	0		\N	This specialization is intended for anyone who seeks to develop one of the most critical and fundamental digital skills today		3	6	0	0	2020-05-25 10:04:48.333929	2020-05-25 10:07:36.207706
14	t	t	IBM Applied AI	ibmappliedai	https://d15cw65ipctsrr.cloudfront.net/2d/c35b3f894a40b2bd4af2451b6daa8b/Professional-Certificate---Applied-AI.png	Beginner	English	0		\N	Artificial Intelligence (AI) is transforming our world. Whether you’re a student, developer, or a technology consultant, understanding AI and		15	6	0	0	2020-05-25 10:04:48.346583	2020-05-25 10:07:36.272512
15	t	t	Data Science	datascience	https://d15cw65ipctsrr.cloudfront.net/eb/8e18e0a4f111e59ae9c776a3dd0526/jhu-logo-thumb.png	Beginner	English	0		\N	Ask the right questions, manipulate data sets, and create visualizations to communicate results.\\n\\nThis Specialization covers the concepts and		16	10	0	0	2020-05-25 10:04:48.349305	2020-05-25 10:07:36.389518
16	t	t	Financial Markets	financialmarkets	https://s3.amazonaws.com/coursera-course-photos/51/51d7604aba11e7ae3525d9720463e7/Shiller_FinancialMarkets_New.png	Beginner	English	0		\N	An overview of the ideas, methods, and institutions that permit human society to manage risks and foster enterprise.  Emphasis on		122	53	1	0	2020-05-25 10:04:48.353208	2020-06-04 08:13:59.482912
18	t	t	Finance & Quantitative Modeling for Analysts	finance&quantitativemodelingforanalysts	https://d15cw65ipctsrr.cloudfront.net/28/3d88b3745e4072901d6db7fb8d2f9c/financeModeling_specialization_coursera.png	Beginner	English	0		\N	The role of an Analyst is dynamic, complex, and driven by a variety of skills. These skills range from a		237	97	0	0	2020-05-25 10:04:48.367244	2020-05-25 10:07:38.228434
20	t	t	Architecting with Google Kubernetes Engine	architectingwithgooglekubernetesengine	https://d15cw65ipctsrr.cloudfront.net/4d/563b08f7a044349ab56cfb3219bad6/Container-Engine.jpg	Beginner	English	0		\N	The Architecting with Google Kubernetes Engine specialization will teach you how to implement solutions using Google Kubernetes Engine, or GKE		96	49	0	0	2020-05-25 10:04:48.383447	2020-05-25 10:07:39.383808
19	t	t	Business Analytics	businessanalytics	https://d2j5ihb19pt1hq.cloudfront.net/sdp_page/s12n_logos/Penn_BusinessAnalytics_Istock49060600.jpg	Beginner	English	0		\N	This Specialization provides an introduction to big data analytics for all business professionals, including those with no prior analytics experience		211	90	0	0	2020-05-25 10:04:48.380656	2020-05-25 10:07:38.967809
21	t	t	Developing Applications with Google Cloud Platform	developingapplicationswithgooglecloudplatform	https://d15cw65ipctsrr.cloudfront.net/97/80dde0cf3911e7837e118ae0ddfe24/course-4.jpg	Intermediate	English	0		\N	In this specialization, application developers learn how to design, develop, and deploy applications that seamlessly integrate managed services from the		111	47	0	0	2020-05-25 10:04:48.389006	2020-05-25 10:07:39.767694
22	t	t	Security in Google Cloud Platform	securityingooglecloudplatform	https://d15cw65ipctsrr.cloudfront.net/f4/925a00f9bc11e89f6323eb5125b878/managing-security-gcp-course-logo.jpg	Intermediate	English	0		\N	Through recorded lectures, demonstrations, and hands-on labs, participants explore and deploy the components of a secure Google Cloud solution		65	27	0	0	2020-05-25 10:04:48.409599	2020-05-25 10:07:39.982431
24	t	t	COVID-19 Contact Tracing	covid-19contacttracing	https://s3.amazonaws.com/coursera-course-photos/cd/d93036e1794fa2a0d25777352561d0/Contact_Tracing_icon_new.png	Beginner	English	0		\N	The COVID-19 crisis has created an unprecedented need for contact tracing across the country, requiring thousands of people to		48	23	0	0	2020-05-25 10:04:48.416371	2020-05-25 10:07:40.400129
23	t	t	Networking in Google Cloud	networkingingooglecloud	https://d15cw65ipctsrr.cloudfront.net/81/0716c0b6c811e88cae95cc5edeac63/network-2.png	Intermediate	English	0		\N	This specialization gives participants broad study of core infrastructure and networking options on Google Cloud Platform. Through recorded lectures, demonstrations		38	28	0	0	2020-05-25 10:04:48.413805	2020-05-25 10:07:40.215549
27	t	t	Data Engineering, Big Data, and Machine Learning on GCP	dataengineering,bigdata,andmachinelearningongcp	https://d15cw65ipctsrr.cloudfront.net/95/77558056d811e79f95119f98b3ba96/visite-google-datacenter-14.jpg	Intermediate	English	0		\N	This online specialization provides participants a hands-on introduction to designing and building data pipelines on Google Cloud Platform. Through		192	83	0	0	2020-05-25 10:04:48.43698	2020-05-25 10:07:41.592116
25	t	t	Data Engineering with Google Cloud	dataengineeringwithgooglecloud	https://d15cw65ipctsrr.cloudfront.net/81/4f605ccfea4c3cb55626902b243a4a/Option-3_1.png	Intermediate	English	0		\N	This program provides the skills you need to advance your career in data engineering and recommends training to support your		93	40	0	0	2020-05-25 10:04:48.420993	2020-05-25 10:07:40.738163
26	t	t	Business and Financial Modeling	businessandfinancialmodeling	https://d15cw65ipctsrr.cloudfront.net/d9/396b60b32c11e595760b3f021227e6/B_FModelingSpecializationThumbnail.jpg	Beginner	English	0		\N	Wharton's Business and Financial Modeling Specialization is designed to help you make informed business and financial decisions. These foundational		50	20	0	0	2020-05-25 10:04:48.433214	2020-05-25 10:07:40.904979
28	t	t	Google IT Automation with Python	googleitautomationwithpython	https://d15cw65ipctsrr.cloudfront.net/10/94e64625eb4b41b05e66ed0e5bab30/Xavier-MI-Thompson-119.jpg	Beginner	English	0		\N	This new beginner-level, six-course certificate, developed by Google, is designed to provide IT professionals with in-demand skills		212	97	0	0	2020-05-25 10:04:48.440436	2020-05-25 10:07:42.429629
33	t	t	Introduction to Psychology	introductiontopsychology	https://s3.amazonaws.com/coursera-course-photos/c6/f1ca40d93c11e8ac94f9711b40e58a/IMG_0049.gif	Beginner	English	0		\N	What are people most afraid of? What do our dreams mean? Are we natural-born racists? What makes us happy		192	89	0	0	2020-05-25 10:04:48.452269	2020-05-25 10:07:45.47464
29	t	t	Applied Data Science with Python	applieddatasciencewithpython	https://d15cw65ipctsrr.cloudfront.net/c8/8d6df01eb311e6b5f5f786b289d8ba/pythondatascience_specialization_final.png	Intermediate	English	0		\N	The 5 courses in this University of Michigan specialization introduce learners to data science through the python programming language. This		152	66	0	0	2020-05-25 10:04:48.442431	2020-05-25 10:07:42.949687
30	t	t	Graphic Design	graphicdesign	https://d15cw65ipctsrr.cloudfront.net/1d/5c8ca09f9b11e58b2bcd64bf4ee4c5/00.SPEC_1200-x-1200_logo.jpg	Beginner	English	0		\N	Graphic design is all around us, in a myriad of forms, both on screen and in print, yet it is		153	66	0	0	2020-05-25 10:04:48.444517	2020-05-25 10:07:43.539707
31	t	t	TensorFlow in Practice	tensorflowinpractice	https://d15cw65ipctsrr.cloudfront.net/f9/0b7f2715b04c3fba7f716e95f1a87e/tfm1.png	Intermediate	English	0		\N	Discover the tools software developers use to build scalable AI-powered algorithms in TensorFlow, a popular open-source machine learning		160	70	0	0	2020-05-25 10:04:48.44704	2020-05-25 10:07:44.027378
32	t	t	Digital Marketing	digitalmarketing	https://d15cw65ipctsrr.cloudfront.net/81/52c588499149258377d9f6dbc9db20/Gies-Square-Logo-from-MarCom.jpg	Beginner	English	0		\N	Master strategic marketing concepts and tools to address brand communication in a digital world.\\n\\nThis Specialization explores several aspects		226	98	0	0	2020-05-25 10:04:48.449703	2020-05-25 10:07:44.70549
35	t	t	Project Management & Other Tools for Career Development	projectmanagement&othertoolsforcareerdevelopment	https://d15cw65ipctsrr.cloudfront.net/55/c627235f5f48f282bae2ad68fdb3d2/Thumbnail.jpg	Beginner	English	0		\N	Project management has been proven to be the most effective method of delivering products within cost, schedule, and resource constraints		195	81	0	0	2020-05-25 10:04:48.467103	2020-05-25 10:07:46.861402
34	t	t	Project Management Principles and Practices	projectmanagementprinciplesandpractices	https://d15cw65ipctsrr.cloudfront.net/f6/824b50f34311e4b3e4d9a4acd55c54/1_iStock_000039306742_Large_Coursera.jpg	Beginner	English	0		\N	This specialization is a precursor to the Applied Project Management Certificate. Project management has been proven to be the most		195	84	1	0	2020-05-25 10:04:48.463196	2020-05-31 08:48:16.458106
37	t	t	Entrepreneurship	entrepreneurship	https://d15cw65ipctsrr.cloudfront.net/65/073380ba5711e58596a3d490dd4464/entrepreneurship_banner.jpg	Beginner	English	0		\N	Wharton's Entrepreneurship Specialization covers the conception, design, organization, and management of new enterprises. This five-course series is designed		232	99	0	0	2020-05-25 10:04:48.483212	2020-05-25 10:07:48.332739
39	t	t	AI for Medicine	aiformedicine	https://d15cw65ipctsrr.cloudfront.net/50/decd886991469281bda58d976aa74f/AI4MCourseraSpecializationSquareLogo.png	Intermediate	English	0		\N	AI is transforming the practice of medicine. It’s helping doctors diagnose patients more accurately, make predictions about patients’ future		172	81	0	0	2020-05-25 10:04:48.501139	2020-05-25 10:07:49.386272
38	t	t	IBM AI Engineering	ibmaiengineering	https://d15cw65ipctsrr.cloudfront.net/a2/922bfdcbbe4ac1a413253209b11611/Professional-Certificate---AI-Engineering.png	Intermediate	English	0		\N	The rapid pace of innovation in Artificial Intelligence (AI) is creating enormous opportunity for transforming entire industries and our very		107	44	0	0	2020-05-25 10:04:48.498266	2020-05-25 10:07:48.736854
40	t	t	Python 3 Programming	python3programming	https://d15cw65ipctsrr.cloudfront.net/be/0ce870e9cb11e8b2d233b4be6a9cf3/pythonfluency_1x1_4.png	Beginner	English	0		\N	This specialization teaches the fundamentals of programming in Python 3. We will begin at the beginning, with variables, conditionals, and		133	63	0	0	2020-05-25 10:04:48.506137	2020-05-25 10:07:49.905483
42	t	t	Psychological First Aid	psychologicalfirstaid	https://s3.amazonaws.com/coursera-course-photos/de/e250c02c7f11e4a56e09598f8b6c89/PFA.png	Mixed	English	0		\N	Learn to provide psychological first aid to people in an emergency by employing the RAPID model: Reflective listening, Assessment of		125	51	0	0	2020-05-25 10:04:48.523754	2020-05-25 10:07:50.513508
41	t	t	Improve Your English Communication Skills	improveyourenglishcommunicationskills	https://d15cw65ipctsrr.cloudfront.net/de/036cf0b65511e589fc15915145485b/199356_specialization_icon.jpg	Beginner	English	0		\N	This Specialization helps you improve your professional communication in English for successful business interactions. Each course focuses on a particular		50	26	0	0	2020-05-25 10:04:48.519176	2020-05-25 10:07:50.109407
43	t	t	Excel to MySQL: Analytic Techniques for Business	exceltomysql:analytictechniquesforbusiness	https://d2j5ihb19pt1hq.cloudfront.net/sdp_page/s12n_logos/Duke_ExceltoMySQLGetty529354813.jpg	Beginner	English	0		\N	Formulate data questions, explore and visualize large datasets, and inform strategic decisions.\\n\\nIn this Specialization, you’ll learn to		191	85	0	0	2020-05-25 10:04:48.527314	2020-05-25 10:07:51.189451
45	t	t	Successful Negotiation: Essential Strategies and Skills	successfulnegotiation:essentialstrategiesandskills	https://s3.amazonaws.com/coursera-course-photos/99/7ab7c00f7b11e79b617dbb2116532d/contractnegotiations_Logo_080814d.jpg	Mixed	English	0		\N	We all negotiate on a daily basis. On a personal level, we negotiate with friends, family, landlords, car sellers and		14	7	0	0	2020-05-25 10:04:48.530967	2020-05-25 10:07:51.626121
44	t	t	Data Analysis and Presentation Skills: the PwC Approach	dataanalysisandpresentationskills:thepwcapproach	https://d15cw65ipctsrr.cloudfront.net/2a/50c800335611e6a7800fb6ff2f8eb2/PwC_fl_c.png	Beginner	English	0		\N	If you are a PwC Employee, gain access to the PwC Specialization and Courses for free using the instructions on		69	32	0	0	2020-05-25 10:04:48.529192	2020-05-25 10:07:51.560201
48	t	t	AWS Fundamentals	awsfundamentals	https://d15cw65ipctsrr.cloudfront.net/f4/5219a4886e4feead04a706b73a9cd1/specialization_logo.png	Beginner	English	0		\N	This specialization gives current or aspiring IT professionals an overview of the features, benefits, and capabilities of Amazon Web Services		105	49	0	0	2020-05-25 10:04:48.54955	2020-05-25 10:07:53.253393
46	t	t	Technical Support Fundamentals	technicalsupportfundamentals	https://s3.amazonaws.com/coursera-course-photos/c8/e497f0f1ad11e7acdcffe7a1a68190/Course-Logo-1.jpg	Beginner	English	0		\N	This course is the first of a series that aims to prepare you for a role as an entry-level		72	28	0	0	2020-05-25 10:04:48.532812	2020-05-25 10:07:52.036914
47	t	t	Web Design for Everybody: Basics of Web Development & Coding	webdesignforeverybody:basicsofwebdevelopment&coding	https://d2j5ihb19pt1hq.cloudfront.net/sdp_page/s12n_logos/webdesign.jpg	Beginner	English	0		\N	This Specialization covers how to write syntactically correct HTML5 and CSS3, and how to create interactive web experiences with JavaScript		95	42	0	0	2020-05-25 10:04:48.546298	2020-05-25 10:07:52.854287
52	t	t	UI / UX Design	ui/uxdesign	https://d15cw65ipctsrr.cloudfront.net/41/f404907a3011e8b427dbe925a8251e/specialization_logo_02d.jpg	Beginner	English	0		\N	The UI/UX Design Specialization brings a design-centric approach to user interface and user experience design, and offers practical		199	93	0	0	2020-05-25 10:04:48.584917	2020-05-25 10:07:54.500078
49	t	t	Career Success	careersuccess	https://d396qusza40orc.cloudfront.net/basicprojmanage/Career-Success-3-rings-600x600_v2.jpg	Beginner	English	0		\N	This series of courses will help you build, develop and hone the essential skills needed to improve your employability and		112	44	0	0	2020-05-25 10:04:48.554148	2020-05-25 10:07:53.621005
51	t	t	Java Programming and Software Engineering Fundamentals	javaprogrammingandsoftwareengineeringfundamentals	https://d2j5ihb19pt1hq.cloudfront.net/sdp_page/s12n_logos/Duke_JavaProgrammingIntrotoSoftware_CM195522.jpg	Beginner	English	0		\N	Take your first step towards a career in software development with this introduction to Java—one of the most in		4	2	0	0	2020-05-25 10:04:48.57062	2020-05-25 10:07:53.704613
53	t	t	Programming for Everybody (Getting Started with Python)	programmingforeverybody(gettingstartedwithpython)	https://s3.amazonaws.com/coursera-course-photos/08/33f720502a11e59e72391aa537f5c9/pythonlearn_thumbnail_1x1.png	Mixed	English	0		\N	This course aims to teach everyone the basics of programming computers using Python. We cover the basics of how one		11	5	0	0	2020-05-25 10:04:48.588214	2020-05-25 10:07:54.555325
54	t	t	Construction Management	constructionmanagement	https://d15cw65ipctsrr.cloudfront.net/83/27c0906c9b11e697217132e89362f6/CM_SpecLogo800.png	Beginner	English	0		\N	Construction Management is the planning, coordinating, and building of a project from conception to completion. This specialization is intended for		72	31	0	0	2020-05-25 10:04:48.5926	2020-05-25 10:07:54.81994
58	t	t	Human Resource Management: HR for People Managers	humanresourcemanagement:hrforpeoplemanagers	https://d15cw65ipctsrr.cloudfront.net/de/14dab0b33711e59d33114424704df2/IMG_8691-2036.jpg	Beginner	English	0		\N	Do you have people reporting to you that need managing? Or perhaps you want to consider a career in human		4	3	0	0	2020-05-25 10:04:48.599755	2020-05-25 10:07:55.458425
59	t	t	Digital Product Management	digitalproductmanagement	https://d15cw65ipctsrr.cloudfront.net/2c/346438c5ab4f5b8f9e8049528dffbc/Digital-Product-Management-Logo.png	Beginner	English	0		\N	This Specialization is intended for both current and new product managers working in digital who want to apply a portfolio		14	5	0	0	2020-05-25 10:04:48.601401	2020-05-25 10:07:55.50154
60	t	t	Search Engine Optimization (SEO)	searchengineoptimization(seo)	https://d15cw65ipctsrr.cloudfront.net/6e/2fe210ba5011e5a8a509723fe94c08/seo_thumb.jpg	Beginner	English	0		\N	This Specialization will teach you to optimize website content for the best possible search engine ranking. You'll learn the		197	81	0	0	2020-05-25 10:04:48.614067	2020-05-25 10:07:56.209677
66	t	t	Creative Writing	creativewriting	https://d15cw65ipctsrr.cloudfront.net/ec/6188d0bef811e5a79bdb64213bc357/sketch_cw.png	Beginner	English	0		\N	This Specialization covers elements of three major creative writing genres: short story, narrative essay, and memoir. You will master the		51	21	0	0	2020-05-25 10:04:48.669962	2020-05-25 10:07:58.080967
61	t	t	AI For Everyone	aiforeveryone	https://s3.amazonaws.com/coursera-course-photos/b2/65f2d3143d48b29c346332efac1118/AI4ESquareLogo.png	Beginner	English	0		\N	AI is not only for engineers. If you want your organization to become better at using AI, this is the		17	10	0	0	2020-05-25 10:04:48.617584	2020-05-25 10:07:56.286695
62	t	t	Mathematics for Machine Learning	mathematicsformachinelearning	https://d15cw65ipctsrr.cloudfront.net/3e/3974e00aa311e8840ea7bed5c70ad0/Specialization-logo.jpg	Beginner	English	0		\N	For a lot of higher level courses in Machine Learning and Data Science, you find you need to freshen up		149	60	0	0	2020-05-25 10:04:48.63103	2020-05-25 10:07:56.82131
63	t	t	Arizona State University TESOL	arizonastateuniversitytesol	https://d15cw65ipctsrr.cloudfront.net/d3/e7fcc42fd44767a6d1c6638e9d3eb1/Shane_Teaching-Course_Logo.jpg	Beginner	English	0		\N	This course is designed for anyone who wants to teach English anywhere in the world. If you want to become		104	46	0	0	2020-05-25 10:04:48.650283	2020-05-25 10:07:57.25753
64	t	t	Primeros Auxilios Psicológicos (PAP)	primerosauxiliospsicológicos(pap)	https://s3.amazonaws.com/coursera-course-photos/e9/4248f0683c11e5b259e33eb6e889a0/logo_PAP_ondem_2.jpg	Mixed	Spanish	0		\N	Este curso on-demand (ABIERTO, se puede cursar en cualquier momento), impartido en castellano por la Universidad Autónoma de Barcelona		56	20	0	0	2020-05-25 10:04:48.653487	2020-05-25 10:07:57.413032
65	t	t	AI Foundations for Everyone	aifoundationsforeveryone	https://d15cw65ipctsrr.cloudfront.net/e4/2ad28cd9a946a2ae5c76a2fa680bbe/Specialization-Certificate-Emblem---AI-Foundations.png	Beginner	English	0		\N	Artificial Intelligence (AI) is no longer science fiction. It is rapidly permeating all industries and having a profound impact on		134	64	0	0	2020-05-25 10:04:48.666191	2020-05-25 10:07:57.913788
67	t	t	Epidemiology in Public Health Practice	epidemiologyinpublichealthpractice	https://d15cw65ipctsrr.cloudfront.net/35/894bb2c52548019e18700e4651a537/Epidemiology-in-Public-Health-Practice-Specialization-Logos-5-V2-06-06-1-.png	Beginner	English	0		\N	This specialization is intended for people working or aspiring to work in the field of public health at the local		123	55	0	0	2020-05-25 10:04:48.682224	2020-05-25 10:07:58.554233
68	t	t	Leading People and Teams	leadingpeopleandteams	https://d2j5ihb19pt1hq.cloudfront.net/sdp_page/s12n_logos/UMich_Leading-People-and-Teams_PartnerProvided.jpg	Beginner	English	0		\N	In this specialization, you will learn essential leadership skills, including how to inspire and motivate individuals, manage talent, influence without		91	37	0	0	2020-05-25 10:04:48.684578	2020-05-25 10:07:58.862437
69	t	t	Neural Networks and Deep Learning	neuralnetworksanddeeplearning	https://s3.amazonaws.com/coursera-course-photos/b0/279370104d11e8822ac99a970c5b43/CarouselAds_DL_Neural.png	Intermediate	English	0		\N	If you want to break into cutting-edge AI, this course will help you do so. Deep learning engineers are		96	43	0	0	2020-05-25 10:04:48.699591	2020-05-25 10:07:59.202207
73	t	t	The Business of Health Care	thebusinessofhealthcare	https://d15cw65ipctsrr.cloudfront.net/26/c253603c0611e8b935e76060deb8e1/BOHC_WhartonOnline_Program_Thumb.png	Beginner	English	0		\N	This Specialization was designed to help you keep pace with the rapidly changing world of health and health care. Through		15	5	0	0	2020-05-25 10:04:48.731609	2020-05-25 10:08:00.418921
70	t	t	Digital Transformation	digitaltransformation	https://s3.amazonaws.com/coursera-course-photos/a7/28b070e41411e780b8c7184b4798d6/digtrans_logo-01.png	Beginner	English	0		\N	Digital transformation is a hot topic--but what exactly is it and what does it mean for companies? In this		54	28	0	0	2020-05-25 10:04:48.703578	2020-05-25 10:07:59.455217
71	t	t	Academic English: Writing	academicenglish:writing	https://d396qusza40orc.cloudfront.net/phoenixassets/academic-english-s12n/academic-english%20%281%29.jpg	Beginner	English	0		\N	The skills taught in this Specialization will empower you to succeed in any college-level course or professional field. You		130	58	0	0	2020-05-25 10:04:48.714975	2020-05-25 10:07:59.906001
72	t	t	Software Product Management	softwareproductmanagement	https://d396qusza40orc.cloudfront.net/phoenixassets/product-management-s12n/project_management.jpg	Beginner	English	0		\N	In this Software Product Management Specialization, you will master Agile software management practices to lead a team of developers and		184	62	0	0	2020-05-25 10:04:48.717489	2020-05-25 10:08:00.379435
74	t	t	Fintech: Foundations & Applications of Financial Technology	fintech:foundations&applicationsoffinancialtechnology	https://d15cw65ipctsrr.cloudfront.net/a6/9006bd722940db9c67b379e448b648/digital-chain-blockchain-technology-concept-picture-id911054106.jpg	Beginner	English	0		\N	Wharton's Fintech Specialization is designed to introduce you to the fundamental building blocks of financial technologies and real-world		239	97	0	0	2020-05-25 10:04:48.735137	2020-05-25 10:08:01.411061
75	t	t	TESOL Certificate, Part 1: Teach English Now!	tesolcertificate,part1:teachenglishnow!	https://d396qusza40orc.cloudfront.net/phoenixassets/Spanish-Launch-10-7-images/Thumbnails%20of%20Banner%20%28Logos%29/tesol_ASU_banner.jpg	Beginner	English	0		\N	Demonstrate basic foundational principles, recognize second or foreign language learning theories, and design and plan lessons to teach English as		163	82	0	0	2020-05-25 10:04:48.748526	2020-05-25 10:08:02.274981
80	t	t	Regulatory Compliance	regulatorycompliance	https://d15cw65ipctsrr.cloudfront.net/75/1422973e6a46d0bc7d5430aab3afaa/OVERALL-COMPLIANCE-SPECIALIZATION-3-01.png	Intermediate	English	0		\N	Every organization faces a myriad of risks that can threaten its operations, reputation, and bottom line. A robust, effective compliance		180	77	0	0	2020-05-25 10:04:48.784871	2020-05-25 10:08:05.683219
77	t	t	Writing in the Sciences	writinginthesciences	https://s3.amazonaws.com/coursera-course-photos/15/bfacf07ed011e7923c3da078b81428/images_course_image-stanford.jpg	Beginner	English	0		\N	This course teaches scientists to become more effective writers, using practical examples and exercises. Topics include: principles of good writing		162	56	0	0	2020-05-25 10:04:48.766223	2020-05-25 10:08:03.253666
78	t	t	Data Visualization with Tableau	datavisualizationwithtableau	https://d15cw65ipctsrr.cloudfront.net/41/d326f0af5b11e5ada4195d312ad6aa/davis_data_thumb.jpg	Beginner	English	0		\N	In 2020 the world will generate 50 times the amount of data as in 2011. And 75 times the number		123	50	0	0	2020-05-25 10:04:48.769868	2020-05-25 10:08:03.842029
79	t	t	Viral Marketing and How to Craft Contagious Content	viralmarketingandhowtocraftcontagiouscontent	https://s3.amazonaws.com/coursera-course-photos/c8/b698008a4e11e5a4fe9d45300b6e5a/Contagious-how-things-catch-on-MoocLogo.jpg	Mixed	English	0		\N	Ever wondered why some things become popular, and other don't? Why some products become hits while others flop?  Why		216	96	0	0	2020-05-25 10:04:48.782471	2020-05-25 10:08:04.769239
81	t	t	Brand Management: Aligning Business, Brand and Behaviour	brandmanagement:aligningbusiness,brandandbehaviour	https://s3.amazonaws.com/coursera-course-photos/9a/eaaf20143211e5865e25d5c1659a56/MOOC-logo_wide.jpg	Beginner	English	0		\N	Professor Nader Tavassoli of London Business School contrasts traditional approaches to branding - where brands are a visual identity and a		43	21	0	0	2020-05-25 10:04:48.797992	2020-05-25 10:08:05.917835
84	t	t	Agile Development	agiledevelopment	https://d15cw65ipctsrr.cloudfront.net/49/336b90a5d211e58ea1475cfc62b42e/Cowan_Thumbnail_360_360.png	Beginner	English	0		\N	Beyond practices and beyond principles, you'll learn the applied skills that enable an agile team to succeed. While applying		88	39	0	0	2020-05-25 10:04:48.817373	2020-05-25 10:08:08.060708
82	t	t	Management of Fashion and Luxury Companies	managementoffashionandluxurycompanies	https://s3.amazonaws.com/coursera-course-photos/e8/c700104a3711e4805271abd0a8eb20/Moncler_IMG_4315_Ottavia-Pavesi_Cover-Mafash.jpg	Mixed	English	0		\N	Learn how fashion and luxury companies work and understand their brands, products, retail, and communication strategies. Travel through business models		216	96	0	0	2020-05-25 10:04:48.801398	2020-05-25 10:08:06.978638
83	t	t	Learn SQL Basics for Data Science	learnsqlbasicsfordatascience	https://d15cw65ipctsrr.cloudfront.net/1f/09b6d03b7a11e98afdfdc3ec76e998/Specialization_Nav_Build_IMAGE2_600x600.png	Beginner	English	0		\N	This Specialization is intended for a learner with no previous coding experience seeking to develop SQL query fluency. Through four		197	82	0	0	2020-05-25 10:04:48.814831	2020-05-25 10:08:07.747894
88	t	t	Geographic Information Systems  (GIS)	geographicinformationsystems(gis)	https://d15cw65ipctsrr.cloudfront.net/1f/9e4f30b5a811e589fc15915145485b/davis_gis.jpg	Beginner	English	0		\N	Knowledge of Geographic Information Systems (GIS) is an increasingly sought after skill in industries from agriculture to public health. This		151	69	0	0	2020-05-25 10:04:48.850752	2020-05-25 10:08:09.870486
85	t	t	Genomic Data Science	genomicdatascience	https://d15cw65ipctsrr.cloudfront.net/17/4df3b0a98411e591c0b9c70a6d8700/GBDS.jpg	Intermediate	English	0		\N	With genomics sparks a revolution in medical discoveries, it becomes imperative to be able to better understand the genome, and		115	58	0	0	2020-05-25 10:04:48.831713	2020-05-25 10:08:08.528813
86	t	t	Fundamentals of Project Planning and Management	fundamentalsofprojectplanningandmanagement	https://s3.amazonaws.com/coursera-course-photos/c0/f03b80bb7311e4a5f827cf3ce5bc88/PMMOOCImage.jpg	Beginner	English	0		\N	Projects are all around us. Virtually every organization runs projects, either formally or informally. We are engaged in projects at		143	58	0	0	2020-05-25 10:04:48.835635	2020-05-25 10:08:08.980544
87	t	t	Algorithms	algorithms	https://d15cw65ipctsrr.cloudfront.net/5e/41de00794811e682cb918e3e406e4d/cs161logo.png	Intermediate	English	0		\N	Algorithms are the heart of computer science, and the subject has countless practical applications as well as intellectual depth. This		75	34	0	0	2020-05-25 10:04:48.848201	2020-05-25 10:08:09.245432
90	t	t	Data Structures and Algorithms	datastructuresandalgorithms	https://d15cw65ipctsrr.cloudfront.net/2a/34a150d9ad11e5bd22cb7d7d7686df/logo3.png	Intermediate	English	0		\N	This specialization is a mix of theory and practice: you will learn algorithmic techniques for solving various computational problems and		145	71	0	0	2020-05-25 10:04:48.867387	2020-05-25 10:08:11.114903
89	t	t	Investment Management	investmentmanagement	https://d15cw65ipctsrr.cloudfront.net/67/bd98c0b5a811e59eaffdd1e3640396/geneva_thumb.png	Beginner	English	0		\N	In this Specialization, you will understand how investment strategies are designed to reach financial goals in a global context. You		216	80	0	0	2020-05-25 10:04:48.853914	2020-05-25 10:08:10.531982
91	t	t	The DIY Musician	thediymusician	https://d15cw65ipctsrr.cloudfront.net/d3/c13dfb8548493db241e1e0dbe1ac15/180529AdamCo-72.jpg	Beginner	English	0		\N	With social media platforms and powerful recording technology at your fingertips, it’s easier now than ever before to create		213	95	0	0	2020-05-25 10:04:48.871813	2020-05-25 10:08:11.869814
94	t	t	Statistics with R	statisticswithr	https://d15cw65ipctsrr.cloudfront.net/01/eb2cd0fb6011e58f3fed869dcf948d/unspecified.jpg	Beginner	English	0		\N	In this Specialization, you will learn to analyze and visualize data in R and create reproducible data analysis reports, demonstrate		131	61	0	0	2020-05-25 10:04:48.879727	2020-05-25 10:08:13.546814
93	t	t	Social Psychology	socialpsychology	https://s3.amazonaws.com/coursera-course-photos/dc/99ebd7aa52f3c39d32e97ca6e3a66c/Course-Image3200x1800.png	Beginner	English	0		\N	Ever wonder why people do what they do? This course—which includes more than $1,000 of video and reading		103	44	0	0	2020-05-25 10:04:48.877068	2020-05-25 10:08:13.047624
92	t	t	Reinforcement Learning	reinforcementlearning	https://d15cw65ipctsrr.cloudfront.net/dc/b5498424c848f8bf2b471b23039b3b/RL-green-square-27-_1_.png	Intermediate	English	0		\N	The Reinforcement Learning Specialization consists of 4 courses exploring the power of adaptive learning systems and artificial intelligence (AI).\\n		211	100	1	0	2020-05-25 10:04:48.874927	2020-05-25 10:33:34.874871
100	t	t	Learning How to Learn: Powerful mental tools to help you master tough subjects	learninghowtolearn:powerfulmentaltoolstohelpyoumastertoughsubjects	https://s3.amazonaws.com/coursera-course-photos/6e/c02c90d08611e3bb7b4ba94dd73d39/Learning-How-to-Learn-Logo-with-text.png	Mixed	English	0		\N	This course gives you easy access to the invaluable learning techniques used by experts in art, music, literature, math, science		134	60	0	0	2020-05-25 10:04:48.916741	2020-05-25 10:08:15.777083
99	t	t	Full-Stack Web Development with React	full-stackwebdevelopmentwithreact	https://d15cw65ipctsrr.cloudfront.net/eb/cab7f07dd411e8991ff71ead974a6c/Slide1.png	Intermediate	English	0		\N	Learn front-end and hybrid mobile development, with server-side support, for implementing a multi-platform solution.\\n\\nThe first		15	8	0	0	2020-05-25 10:04:48.913668	2020-05-25 10:08:15.287523
96	t	t	Object Oriented Programming in Java	objectorientedprogramminginjava	https://d15cw65ipctsrr.cloudfront.net/f2/9b76f090b311e7ab563db169a953fb/programming-1896158_1280.jpg	Beginner	English	0		\N	This Specialization is for aspiring software developers with some programming experience in at least one other programming language (e.g		245	100	1	0	2020-05-25 10:04:48.884499	2020-06-01 15:02:15.486132
98	t	t	What is Data Science? 123123	whatisdatascience?	https://s3.amazonaws.com/coursera-course-photos/16/d602b00a6c11e88d594f951694ab88/Data-Science-Orientation.png	Beginner	English	0		\N	The art of 123123ncovering the insights and trends in data has been around since ancient times. The ancient Egyptians used		0	0	0	0	2020-05-25 10:04:48.900675	2020-06-01 15:03:20.164419
97	t	t	Methods and Statistics in Social Sciences	methodsandstatisticsinsocialsciences	https://d15cw65ipctsrr.cloudfront.net/6c/ea5820547d11e49fc9e9f970822685/spn-logo.png	Beginner	English	0		\N	Identify interesting questions, analyze data sets, and correctly interpret results to make solid, evidence-based decisions.\\n\\nThis Specialization covers		126	46	0	0	2020-05-25 10:04:48.897595	2020-05-25 10:08:15.221079
\.


--
-- Data for Name: enrols; Type: TABLE DATA; Schema: public; Owner: togatherculture
--

COPY public.enrols (id, user_id, course_id, status, created_at, updated_at) FROM stdin;
6	1	92	enroling	2020-05-25 10:33:34.869599	2020-05-25 10:33:34.869599
7	1	34	enroling	2020-05-31 08:48:16.45069	2020-05-31 08:48:16.45069
8	1	96	enroling	2020-06-01 15:02:15.479048	2020-06-01 15:02:15.479048
9	1	16	enroling	2020-06-04 08:13:59.451544	2020-06-04 08:13:59.451544
\.


--
-- Data for Name: lectures; Type: TABLE DATA; Schema: public; Owner: togatherculture
--

COPY public.lectures (id, course_id, lecture, title, description, duration, start_at, end_at, created_at, updated_at) FROM stdin;
2	98	1	4rwewr	rsrtert	0	2020-05-25 10:33:47	2020-05-25 10:33:47	2020-05-25 10:33:53.211156	2020-05-25 10:33:53.211156
3	92	1	demo	demo	0	2020-05-25 10:34:05	2020-05-25 10:34:05	2020-05-25 10:34:10.217746	2020-05-25 10:34:10.217746
4	98	2	Lecture 2	abc	0	2020-06-01 15:03:20	2020-06-01 15:03:20	2020-06-01 15:03:34.147245	2020-06-01 15:03:34.147245
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: togatherculture
--

COPY public.notifications (id, user_id, target_id, message, is_read, link, created_at, updated_at) FROM stdin;
1	1	1	Course IBM Data Science: A new lecture is created!	t		2020-05-25 07:39:44.235411	2020-05-25 07:39:44.235411
2	1	1	Course Reinforcement Learning: A new lecture is created!	t		2020-05-25 10:34:10.223873	2020-05-25 10:34:10.223873
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: togatherculture
--

COPY public.ratings (id, user_id, course_id, rating, comment, created_at, updated_at) FROM stdin;
5343	91	1	5		2020-05-25 10:07:30.758863	2020-05-25 10:07:30.758863
5344	60	1	5		2020-05-25 10:07:30.76721	2020-05-25 10:07:30.76721
5345	43	1	4		2020-05-25 10:07:30.775371	2020-05-25 10:07:30.775371
5346	55	1	3		2020-05-25 10:07:30.783956	2020-05-25 10:07:30.783956
5347	88	1	3		2020-05-25 10:07:30.792147	2020-05-25 10:07:30.792147
5348	5	1	5		2020-05-25 10:07:30.801409	2020-05-25 10:07:30.801409
5349	16	1	0		2020-05-25 10:07:30.808621	2020-05-25 10:07:30.808621
5350	83	1	2		2020-05-25 10:07:30.817629	2020-05-25 10:07:30.817629
5351	33	1	1		2020-05-25 10:07:30.827413	2020-05-25 10:07:30.827413
5352	67	1	3		2020-05-25 10:07:30.836383	2020-05-25 10:07:30.836383
5353	85	1	1		2020-05-25 10:07:30.855276	2020-05-25 10:07:30.855276
5354	69	1	0		2020-05-25 10:07:30.865645	2020-05-25 10:07:30.865645
5355	49	1	3		2020-05-25 10:07:30.871075	2020-05-25 10:07:30.871075
5356	27	1	2		2020-05-25 10:07:30.882634	2020-05-25 10:07:30.882634
5357	8	1	4		2020-05-25 10:07:30.89172	2020-05-25 10:07:30.89172
5358	22	1	5		2020-05-25 10:07:30.900869	2020-05-25 10:07:30.900869
5359	35	2	3		2020-05-25 10:07:30.909284	2020-05-25 10:07:30.909284
5360	3	2	1		2020-05-25 10:07:30.918575	2020-05-25 10:07:30.918575
5361	96	2	2		2020-05-25 10:07:30.930421	2020-05-25 10:07:30.930421
5362	98	2	0		2020-05-25 10:07:30.938419	2020-05-25 10:07:30.938419
5363	86	2	0		2020-05-25 10:07:30.951807	2020-05-25 10:07:30.951807
5364	66	2	0		2020-05-25 10:07:30.96595	2020-05-25 10:07:30.96595
5365	0	2	2		2020-05-25 10:07:30.973556	2020-05-25 10:07:30.973556
5366	89	2	2		2020-05-25 10:07:30.987427	2020-05-25 10:07:30.987427
5367	30	2	5		2020-05-25 10:07:31.000227	2020-05-25 10:07:31.000227
5368	16	2	3		2020-05-25 10:07:31.013044	2020-05-25 10:07:31.013044
5369	43	2	4		2020-05-25 10:07:31.025336	2020-05-25 10:07:31.025336
5370	7	2	3		2020-05-25 10:07:31.038172	2020-05-25 10:07:31.038172
5371	36	2	5		2020-05-25 10:07:31.051533	2020-05-25 10:07:31.051533
5372	52	3	5		2020-05-25 10:07:31.062506	2020-05-25 10:07:31.062506
5373	3	3	3		2020-05-25 10:07:31.073619	2020-05-25 10:07:31.073619
5374	83	3	1		2020-05-25 10:07:31.08432	2020-05-25 10:07:31.08432
5375	65	3	3		2020-05-25 10:07:31.091602	2020-05-25 10:07:31.091602
5376	97	3	5		2020-05-25 10:07:31.104743	2020-05-25 10:07:31.104743
5377	82	3	4		2020-05-25 10:07:31.11941	2020-05-25 10:07:31.11941
5378	75	3	2		2020-05-25 10:07:31.129899	2020-05-25 10:07:31.129899
5379	34	3	1		2020-05-25 10:07:31.13864	2020-05-25 10:07:31.13864
5380	47	3	4		2020-05-25 10:07:31.151287	2020-05-25 10:07:31.151287
5381	42	3	0		2020-05-25 10:07:31.162393	2020-05-25 10:07:31.162393
5382	14	3	4		2020-05-25 10:07:31.1739	2020-05-25 10:07:31.1739
5383	56	3	5		2020-05-25 10:07:31.184905	2020-05-25 10:07:31.184905
5384	54	3	1		2020-05-25 10:07:31.193402	2020-05-25 10:07:31.193402
5385	37	3	1		2020-05-25 10:07:31.20449	2020-05-25 10:07:31.20449
5386	89	3	1		2020-05-25 10:07:31.218327	2020-05-25 10:07:31.218327
5387	68	3	3		2020-05-25 10:07:31.229572	2020-05-25 10:07:31.229572
5388	0	3	0		2020-05-25 10:07:31.241166	2020-05-25 10:07:31.241166
5389	62	3	3		2020-05-25 10:07:31.251618	2020-05-25 10:07:31.251618
5390	59	3	0		2020-05-25 10:07:31.26119	2020-05-25 10:07:31.26119
5391	76	3	0		2020-05-25 10:07:31.273133	2020-05-25 10:07:31.273133
5392	84	3	0		2020-05-25 10:07:31.285096	2020-05-25 10:07:31.285096
5393	51	3	1		2020-05-25 10:07:31.29582	2020-05-25 10:07:31.29582
5394	91	3	0		2020-05-25 10:07:31.307745	2020-05-25 10:07:31.307745
5395	6	3	2		2020-05-25 10:07:31.319747	2020-05-25 10:07:31.319747
5396	55	3	2		2020-05-25 10:07:31.329233	2020-05-25 10:07:31.329233
5397	8	3	1		2020-05-25 10:07:31.342692	2020-05-25 10:07:31.342692
5398	19	3	3		2020-05-25 10:07:31.351807	2020-05-25 10:07:31.351807
5399	63	3	3		2020-05-25 10:07:31.361593	2020-05-25 10:07:31.361593
5400	26	3	1		2020-05-25 10:07:31.371242	2020-05-25 10:07:31.371242
5401	70	3	0		2020-05-25 10:07:31.376684	2020-05-25 10:07:31.376684
5402	78	3	3		2020-05-25 10:07:31.381542	2020-05-25 10:07:31.381542
5403	22	3	2		2020-05-25 10:07:31.388091	2020-05-25 10:07:31.388091
5404	31	3	0		2020-05-25 10:07:31.399283	2020-05-25 10:07:31.399283
5405	87	3	1		2020-05-25 10:07:31.407405	2020-05-25 10:07:31.407405
5406	10	4	2		2020-05-25 10:07:31.416596	2020-05-25 10:07:31.416596
5407	88	4	4		2020-05-25 10:07:31.425561	2020-05-25 10:07:31.425561
5408	93	4	3		2020-05-25 10:07:31.434662	2020-05-25 10:07:31.434662
5409	15	4	1		2020-05-25 10:07:31.448458	2020-05-25 10:07:31.448458
5410	95	4	1		2020-05-25 10:07:31.455141	2020-05-25 10:07:31.455141
5411	54	4	2		2020-05-25 10:07:31.467757	2020-05-25 10:07:31.467757
5412	78	4	0		2020-05-25 10:07:31.476256	2020-05-25 10:07:31.476256
5413	13	4	0		2020-05-25 10:07:31.485473	2020-05-25 10:07:31.485473
5414	40	4	4		2020-05-25 10:07:31.498845	2020-05-25 10:07:31.498845
5415	25	4	0		2020-05-25 10:07:31.505965	2020-05-25 10:07:31.505965
5416	0	4	2		2020-05-25 10:07:31.521976	2020-05-25 10:07:31.521976
5417	81	4	3		2020-05-25 10:07:31.53446	2020-05-25 10:07:31.53446
5418	36	4	0		2020-05-25 10:07:31.546301	2020-05-25 10:07:31.546301
5419	67	4	5		2020-05-25 10:07:31.556997	2020-05-25 10:07:31.556997
5420	16	4	1		2020-05-25 10:07:31.567747	2020-05-25 10:07:31.567747
5421	80	4	1		2020-05-25 10:07:31.579014	2020-05-25 10:07:31.579014
5422	9	4	1		2020-05-25 10:07:31.590013	2020-05-25 10:07:31.590013
5423	90	4	3		2020-05-25 10:07:31.600781	2020-05-25 10:07:31.600781
5424	70	4	3		2020-05-25 10:07:31.613111	2020-05-25 10:07:31.613111
5425	76	4	3		2020-05-25 10:07:31.623117	2020-05-25 10:07:31.623117
5426	7	4	1		2020-05-25 10:07:31.636862	2020-05-25 10:07:31.636862
5427	86	4	0		2020-05-25 10:07:31.651859	2020-05-25 10:07:31.651859
5428	42	4	5		2020-05-25 10:07:31.662845	2020-05-25 10:07:31.662845
5429	38	4	4		2020-05-25 10:07:31.676351	2020-05-25 10:07:31.676351
5430	99	4	1		2020-05-25 10:07:31.686665	2020-05-25 10:07:31.686665
5431	52	4	4		2020-05-25 10:07:31.695971	2020-05-25 10:07:31.695971
5432	43	4	1		2020-05-25 10:07:31.700663	2020-05-25 10:07:31.700663
5433	47	4	3		2020-05-25 10:07:31.707236	2020-05-25 10:07:31.707236
5434	66	4	4		2020-05-25 10:07:31.716532	2020-05-25 10:07:31.716532
5435	32	4	3		2020-05-25 10:07:31.724928	2020-05-25 10:07:31.724928
5436	85	4	3		2020-05-25 10:07:31.734161	2020-05-25 10:07:31.734161
5437	39	4	1		2020-05-25 10:07:31.741788	2020-05-25 10:07:31.741788
5438	71	4	5		2020-05-25 10:07:31.75086	2020-05-25 10:07:31.75086
5439	62	4	2		2020-05-25 10:07:31.763191	2020-05-25 10:07:31.763191
5440	17	4	2		2020-05-25 10:07:31.770023	2020-05-25 10:07:31.770023
5441	3	4	3		2020-05-25 10:07:31.78095	2020-05-25 10:07:31.78095
5442	94	4	3		2020-05-25 10:07:31.787683	2020-05-25 10:07:31.787683
5443	6	4	5		2020-05-25 10:07:31.800582	2020-05-25 10:07:31.800582
5444	89	4	1		2020-05-25 10:07:31.810926	2020-05-25 10:07:31.810926
5445	97	4	1		2020-05-25 10:07:31.821061	2020-05-25 10:07:31.821061
5446	26	4	4		2020-05-25 10:07:31.828666	2020-05-25 10:07:31.828666
5447	74	4	0		2020-05-25 10:07:31.836744	2020-05-25 10:07:31.836744
5448	8	4	1		2020-05-25 10:07:31.845944	2020-05-25 10:07:31.845944
5449	2	4	4		2020-05-25 10:07:31.854676	2020-05-25 10:07:31.854676
5450	45	4	1		2020-05-25 10:07:31.863943	2020-05-25 10:07:31.863943
5451	23	4	2		2020-05-25 10:07:31.873197	2020-05-25 10:07:31.873197
5452	55	4	3		2020-05-25 10:07:31.885336	2020-05-25 10:07:31.885336
5453	73	4	3		2020-05-25 10:07:31.896182	2020-05-25 10:07:31.896182
5454	46	4	2		2020-05-25 10:07:31.905774	2020-05-25 10:07:31.905774
5455	27	4	3		2020-05-25 10:07:31.917729	2020-05-25 10:07:31.917729
5456	72	4	0		2020-05-25 10:07:31.928195	2020-05-25 10:07:31.928195
5457	69	4	2		2020-05-25 10:07:31.937945	2020-05-25 10:07:31.937945
5458	53	4	0		2020-05-25 10:07:31.948181	2020-05-25 10:07:31.948181
5459	48	4	3		2020-05-25 10:07:31.957338	2020-05-25 10:07:31.957338
5460	41	4	4		2020-05-25 10:07:31.96965	2020-05-25 10:07:31.96965
5461	60	4	0		2020-05-25 10:07:31.979665	2020-05-25 10:07:31.979665
5462	63	4	3		2020-05-25 10:07:31.989387	2020-05-25 10:07:31.989387
5463	64	4	3		2020-05-25 10:07:31.999313	2020-05-25 10:07:31.999313
5464	58	4	3		2020-05-25 10:07:32.004695	2020-05-25 10:07:32.004695
5465	44	4	1		2020-05-25 10:07:32.021154	2020-05-25 10:07:32.021154
5466	65	4	2		2020-05-25 10:07:32.06515	2020-05-25 10:07:32.06515
5467	33	4	2		2020-05-25 10:07:32.070326	2020-05-25 10:07:32.070326
5468	68	4	5		2020-05-25 10:07:32.07472	2020-05-25 10:07:32.07472
5469	50	4	3		2020-05-25 10:07:32.079068	2020-05-25 10:07:32.079068
5470	83	4	2		2020-05-25 10:07:32.082935	2020-05-25 10:07:32.082935
5471	20	4	1		2020-05-25 10:07:32.09076	2020-05-25 10:07:32.09076
5472	31	4	2		2020-05-25 10:07:32.09954	2020-05-25 10:07:32.09954
5473	59	4	3		2020-05-25 10:07:32.106424	2020-05-25 10:07:32.106424
5474	35	4	5		2020-05-25 10:07:32.113512	2020-05-25 10:07:32.113512
5475	98	4	3		2020-05-25 10:07:32.121911	2020-05-25 10:07:32.121911
5476	12	4	2		2020-05-25 10:07:32.128352	2020-05-25 10:07:32.128352
5477	61	4	2		2020-05-25 10:07:32.136459	2020-05-25 10:07:32.136459
5478	18	4	1		2020-05-25 10:07:32.140931	2020-05-25 10:07:32.140931
5479	87	4	0		2020-05-25 10:07:32.153213	2020-05-25 10:07:32.153213
5480	24	4	2		2020-05-25 10:07:32.158585	2020-05-25 10:07:32.158585
5481	64	5	5		2020-05-25 10:07:32.169657	2020-05-25 10:07:32.169657
5482	94	5	0		2020-05-25 10:07:32.186471	2020-05-25 10:07:32.186471
5483	58	5	4		2020-05-25 10:07:32.213564	2020-05-25 10:07:32.213564
5484	21	5	0		2020-05-25 10:07:32.219604	2020-05-25 10:07:32.219604
5485	51	5	2		2020-05-25 10:07:32.223972	2020-05-25 10:07:32.223972
5486	49	5	0		2020-05-25 10:07:32.241709	2020-05-25 10:07:32.241709
5487	22	5	2		2020-05-25 10:07:32.24849	2020-05-25 10:07:32.24849
5488	62	5	3		2020-05-25 10:07:32.25284	2020-05-25 10:07:32.25284
5489	19	5	2		2020-05-25 10:07:32.256704	2020-05-25 10:07:32.256704
5490	85	5	4		2020-05-25 10:07:32.264553	2020-05-25 10:07:32.264553
5491	65	5	1		2020-05-25 10:07:32.272311	2020-05-25 10:07:32.272311
5492	36	5	3		2020-05-25 10:07:32.281776	2020-05-25 10:07:32.281776
5493	96	5	4		2020-05-25 10:07:32.288	2020-05-25 10:07:32.288
5494	13	5	4		2020-05-25 10:07:32.298117	2020-05-25 10:07:32.298117
5495	80	5	5		2020-05-25 10:07:32.305944	2020-05-25 10:07:32.305944
5496	11	5	4		2020-05-25 10:07:32.314362	2020-05-25 10:07:32.314362
5497	30	5	1		2020-05-25 10:07:32.320758	2020-05-25 10:07:32.320758
5498	73	5	3		2020-05-25 10:07:32.331275	2020-05-25 10:07:32.331275
5499	89	5	0		2020-05-25 10:07:32.339286	2020-05-25 10:07:32.339286
5500	88	5	1		2020-05-25 10:07:32.34753	2020-05-25 10:07:32.34753
5501	32	5	0		2020-05-25 10:07:32.353835	2020-05-25 10:07:32.353835
5502	28	5	3		2020-05-25 10:07:32.361073	2020-05-25 10:07:32.361073
5503	40	5	5		2020-05-25 10:07:32.371934	2020-05-25 10:07:32.371934
5504	60	5	1		2020-05-25 10:07:32.379676	2020-05-25 10:07:32.379676
5505	26	5	2		2020-05-25 10:07:32.385803	2020-05-25 10:07:32.385803
5506	71	5	0		2020-05-25 10:07:32.393564	2020-05-25 10:07:32.393564
5507	38	5	5		2020-05-25 10:07:32.399481	2020-05-25 10:07:32.399481
5508	37	5	4		2020-05-25 10:07:32.406842	2020-05-25 10:07:32.406842
5509	90	5	1		2020-05-25 10:07:32.415856	2020-05-25 10:07:32.415856
5510	86	5	3		2020-05-25 10:07:32.423913	2020-05-25 10:07:32.423913
5511	81	5	0		2020-05-25 10:07:32.43065	2020-05-25 10:07:32.43065
5512	14	5	2		2020-05-25 10:07:32.439266	2020-05-25 10:07:32.439266
5513	4	5	0		2020-05-25 10:07:32.447249	2020-05-25 10:07:32.447249
5514	78	5	2		2020-05-25 10:07:32.453507	2020-05-25 10:07:32.453507
5515	59	5	5		2020-05-25 10:07:32.460722	2020-05-25 10:07:32.460722
5516	69	5	1		2020-05-25 10:07:32.471695	2020-05-25 10:07:32.471695
5517	61	5	0		2020-05-25 10:07:32.480432	2020-05-25 10:07:32.480432
5518	15	5	2		2020-05-25 10:07:32.486313	2020-05-25 10:07:32.486313
5519	46	5	2		2020-05-25 10:07:32.493514	2020-05-25 10:07:32.493514
5520	66	5	2		2020-05-25 10:07:32.505222	2020-05-25 10:07:32.505222
5521	0	5	5		2020-05-25 10:07:32.514022	2020-05-25 10:07:32.514022
5522	18	5	1		2020-05-25 10:07:32.521185	2020-05-25 10:07:32.521185
5523	39	5	0		2020-05-25 10:07:32.528003	2020-05-25 10:07:32.528003
5524	82	5	1		2020-05-25 10:07:32.544414	2020-05-25 10:07:32.544414
5525	83	5	2		2020-05-25 10:07:32.551713	2020-05-25 10:07:32.551713
5526	48	5	1		2020-05-25 10:07:32.556432	2020-05-25 10:07:32.556432
5527	79	5	2		2020-05-25 10:07:32.567418	2020-05-25 10:07:32.567418
5528	7	5	3		2020-05-25 10:07:32.57575	2020-05-25 10:07:32.57575
5529	5	5	1		2020-05-25 10:07:32.583626	2020-05-25 10:07:32.583626
5530	99	5	1		2020-05-25 10:07:32.732433	2020-05-25 10:07:32.732433
5531	84	5	3		2020-05-25 10:07:32.736459	2020-05-25 10:07:32.736459
5532	75	6	5		2020-05-25 10:07:32.750222	2020-05-25 10:07:32.750222
5533	6	6	4		2020-05-25 10:07:32.754143	2020-05-25 10:07:32.754143
5534	0	6	4		2020-05-25 10:07:32.762796	2020-05-25 10:07:32.762796
5535	67	6	5		2020-05-25 10:07:32.771043	2020-05-25 10:07:32.771043
5536	22	6	3		2020-05-25 10:07:32.779896	2020-05-25 10:07:32.779896
5537	96	6	3		2020-05-25 10:07:32.787878	2020-05-25 10:07:32.787878
5538	78	6	2		2020-05-25 10:07:32.797137	2020-05-25 10:07:32.797137
5539	21	6	3		2020-05-25 10:07:32.804534	2020-05-25 10:07:32.804534
5540	83	6	4		2020-05-25 10:07:32.813768	2020-05-25 10:07:32.813768
5541	79	6	3		2020-05-25 10:07:32.82013	2020-05-25 10:07:32.82013
5542	36	6	4		2020-05-25 10:07:32.82755	2020-05-25 10:07:32.82755
5543	27	6	2		2020-05-25 10:07:32.838093	2020-05-25 10:07:32.838093
5544	85	6	4		2020-05-25 10:07:32.847381	2020-05-25 10:07:32.847381
5545	91	6	1		2020-05-25 10:07:32.855403	2020-05-25 10:07:32.855403
5546	15	6	0		2020-05-25 10:07:32.863802	2020-05-25 10:07:32.863802
5547	70	6	4		2020-05-25 10:07:32.871817	2020-05-25 10:07:32.871817
5548	76	6	4		2020-05-25 10:07:32.880354	2020-05-25 10:07:32.880354
5549	89	6	1		2020-05-25 10:07:32.886457	2020-05-25 10:07:32.886457
5550	33	6	2		2020-05-25 10:07:32.893196	2020-05-25 10:07:32.893196
5551	90	6	3		2020-05-25 10:07:32.904227	2020-05-25 10:07:32.904227
5552	31	6	1		2020-05-25 10:07:32.913504	2020-05-25 10:07:32.913504
5553	48	6	1		2020-05-25 10:07:32.919831	2020-05-25 10:07:32.919831
5554	5	6	5		2020-05-25 10:07:32.926597	2020-05-25 10:07:32.926597
5555	38	6	5		2020-05-25 10:07:32.937345	2020-05-25 10:07:32.937345
5556	53	6	3		2020-05-25 10:07:32.9417	2020-05-25 10:07:32.9417
5557	92	6	0		2020-05-25 10:07:32.951128	2020-05-25 10:07:32.951128
5558	50	6	4		2020-05-25 10:07:32.959067	2020-05-25 10:07:32.959067
5559	68	6	2		2020-05-25 10:07:32.967372	2020-05-25 10:07:32.967372
5560	82	6	0		2020-05-25 10:07:32.974154	2020-05-25 10:07:32.974154
5561	97	6	3		2020-05-25 10:07:32.981781	2020-05-25 10:07:32.981781
5562	88	6	2		2020-05-25 10:07:32.988155	2020-05-25 10:07:32.988155
5563	24	6	4		2020-05-25 10:07:32.999955	2020-05-25 10:07:32.999955
5564	37	6	4		2020-05-25 10:07:33.008141	2020-05-25 10:07:33.008141
5565	61	6	1		2020-05-25 10:07:33.01844	2020-05-25 10:07:33.01844
5566	98	6	4		2020-05-25 10:07:33.026819	2020-05-25 10:07:33.026819
5567	62	6	3		2020-05-25 10:07:33.033958	2020-05-25 10:07:33.033958
5568	80	6	1		2020-05-25 10:07:33.043039	2020-05-25 10:07:33.043039
5569	45	6	1		2020-05-25 10:07:33.051944	2020-05-25 10:07:33.051944
5570	94	6	3		2020-05-25 10:07:33.060393	2020-05-25 10:07:33.060393
5571	84	6	1		2020-05-25 10:07:33.069088	2020-05-25 10:07:33.069088
5572	54	6	2		2020-05-25 10:07:33.07763	2020-05-25 10:07:33.07763
5573	52	6	2		2020-05-25 10:07:33.090781	2020-05-25 10:07:33.090781
5574	49	6	4		2020-05-25 10:07:33.100035	2020-05-25 10:07:33.100035
5575	32	6	0		2020-05-25 10:07:33.109216	2020-05-25 10:07:33.109216
5576	20	6	1		2020-05-25 10:07:33.120432	2020-05-25 10:07:33.120432
5577	64	6	4		2020-05-25 10:07:33.128219	2020-05-25 10:07:33.128219
5578	43	6	0		2020-05-25 10:07:33.140242	2020-05-25 10:07:33.140242
5579	13	6	3		2020-05-25 10:07:33.149497	2020-05-25 10:07:33.149497
5580	95	6	4		2020-05-25 10:07:33.158475	2020-05-25 10:07:33.158475
5581	47	6	1		2020-05-25 10:07:33.172192	2020-05-25 10:07:33.172192
5582	10	6	2		2020-05-25 10:07:33.182597	2020-05-25 10:07:33.182597
5583	16	6	1		2020-05-25 10:07:33.192029	2020-05-25 10:07:33.192029
5584	56	6	3		2020-05-25 10:07:33.204701	2020-05-25 10:07:33.204701
5585	55	6	4		2020-05-25 10:07:33.211119	2020-05-25 10:07:33.211119
5586	11	6	5		2020-05-25 10:07:33.222935	2020-05-25 10:07:33.222935
5587	23	6	0		2020-05-25 10:07:33.232205	2020-05-25 10:07:33.232205
5588	63	6	1		2020-05-25 10:07:33.240685	2020-05-25 10:07:33.240685
5589	65	6	0		2020-05-25 10:07:33.252098	2020-05-25 10:07:33.252098
5590	26	6	5		2020-05-25 10:07:33.258681	2020-05-25 10:07:33.258681
5591	59	6	3		2020-05-25 10:07:33.271568	2020-05-25 10:07:33.271568
5592	8	6	2		2020-05-25 10:07:33.282212	2020-05-25 10:07:33.282212
5593	40	6	0		2020-05-25 10:07:33.290458	2020-05-25 10:07:33.290458
5594	86	6	2		2020-05-25 10:07:33.301589	2020-05-25 10:07:33.301589
5595	12	6	0		2020-05-25 10:07:33.305929	2020-05-25 10:07:33.305929
5596	72	6	5		2020-05-25 10:07:33.315097	2020-05-25 10:07:33.315097
5597	58	6	4		2020-05-25 10:07:33.322897	2020-05-25 10:07:33.322897
5598	19	6	2		2020-05-25 10:07:33.333557	2020-05-25 10:07:33.333557
5599	18	6	3		2020-05-25 10:07:33.340716	2020-05-25 10:07:33.340716
5600	57	6	0		2020-05-25 10:07:33.349094	2020-05-25 10:07:33.349094
5601	44	6	2		2020-05-25 10:07:33.357729	2020-05-25 10:07:33.357729
5602	17	6	1		2020-05-25 10:07:33.369056	2020-05-25 10:07:33.369056
5603	41	6	4		2020-05-25 10:07:33.37354	2020-05-25 10:07:33.37354
5604	42	6	2		2020-05-25 10:07:33.387802	2020-05-25 10:07:33.387802
5605	63	7	1		2020-05-25 10:07:33.39213	2020-05-25 10:07:33.39213
5606	32	7	3		2020-05-25 10:07:33.403871	2020-05-25 10:07:33.403871
5607	79	7	5		2020-05-25 10:07:33.413351	2020-05-25 10:07:33.413351
5608	54	7	4		2020-05-25 10:07:33.422245	2020-05-25 10:07:33.422245
5609	71	7	0		2020-05-25 10:07:33.431696	2020-05-25 10:07:33.431696
5610	55	7	5		2020-05-25 10:07:33.440437	2020-05-25 10:07:33.440437
5611	61	7	4		2020-05-25 10:07:33.448955	2020-05-25 10:07:33.448955
5612	41	7	4		2020-05-25 10:07:33.457325	2020-05-25 10:07:33.457325
5613	75	7	4		2020-05-25 10:07:33.467844	2020-05-25 10:07:33.467844
5614	1	8	3		2020-05-25 10:07:33.474816	2020-05-25 10:07:33.474816
5615	0	8	4		2020-05-25 10:07:33.483501	2020-05-25 10:07:33.483501
5616	6	8	1		2020-05-25 10:07:33.491971	2020-05-25 10:07:33.491971
5617	14	8	4		2020-05-25 10:07:33.501859	2020-05-25 10:07:33.501859
5618	38	8	0		2020-05-25 10:07:33.508482	2020-05-25 10:07:33.508482
5619	90	8	5		2020-05-25 10:07:33.51883	2020-05-25 10:07:33.51883
5620	35	8	0		2020-05-25 10:07:33.526678	2020-05-25 10:07:33.526678
5621	75	8	4		2020-05-25 10:07:33.537748	2020-05-25 10:07:33.537748
5622	4	8	0		2020-05-25 10:07:33.568261	2020-05-25 10:07:33.568261
5623	73	8	1		2020-05-25 10:07:33.576615	2020-05-25 10:07:33.576615
5624	80	8	2		2020-05-25 10:07:33.583627	2020-05-25 10:07:33.583627
5625	49	8	4		2020-05-25 10:07:33.590654	2020-05-25 10:07:33.590654
5626	15	8	3		2020-05-25 10:07:33.599979	2020-05-25 10:07:33.599979
5627	28	8	3		2020-05-25 10:07:33.6081	2020-05-25 10:07:33.6081
5628	41	8	2		2020-05-25 10:07:33.616986	2020-05-25 10:07:33.616986
5629	99	8	1		2020-05-25 10:07:33.623726	2020-05-25 10:07:33.623726
5630	21	8	2		2020-05-25 10:07:33.631406	2020-05-25 10:07:33.631406
5631	3	8	3		2020-05-25 10:07:33.640221	2020-05-25 10:07:33.640221
5632	97	8	3		2020-05-25 10:07:33.648032	2020-05-25 10:07:33.648032
5633	29	8	3		2020-05-25 10:07:33.656224	2020-05-25 10:07:33.656224
5634	34	8	2		2020-05-25 10:07:33.665616	2020-05-25 10:07:33.665616
5635	55	8	1		2020-05-25 10:07:33.674491	2020-05-25 10:07:33.674491
5636	7	8	2		2020-05-25 10:07:33.683251	2020-05-25 10:07:33.683251
5637	74	8	5		2020-05-25 10:07:33.689887	2020-05-25 10:07:33.689887
5638	32	8	2		2020-05-25 10:07:33.69775	2020-05-25 10:07:33.69775
5639	83	8	3		2020-05-25 10:07:33.706577	2020-05-25 10:07:33.706577
5640	36	8	3		2020-05-25 10:07:33.71447	2020-05-25 10:07:33.71447
5641	86	9	4		2020-05-25 10:07:33.722702	2020-05-25 10:07:33.722702
5642	41	9	0		2020-05-25 10:07:33.729615	2020-05-25 10:07:33.729615
5643	61	9	5		2020-05-25 10:07:33.735795	2020-05-25 10:07:33.735795
5644	2	9	1		2020-05-25 10:07:33.74358	2020-05-25 10:07:33.74358
5645	83	9	0		2020-05-25 10:07:33.750099	2020-05-25 10:07:33.750099
5646	32	9	3		2020-05-25 10:07:33.756906	2020-05-25 10:07:33.756906
5647	87	9	1		2020-05-25 10:07:33.765816	2020-05-25 10:07:33.765816
5648	67	9	5		2020-05-25 10:07:33.774128	2020-05-25 10:07:33.774128
5649	94	9	1		2020-05-25 10:07:33.782078	2020-05-25 10:07:33.782078
5650	63	9	4		2020-05-25 10:07:33.789793	2020-05-25 10:07:33.789793
5651	30	9	4		2020-05-25 10:07:33.798583	2020-05-25 10:07:33.798583
5652	26	9	4		2020-05-25 10:07:33.805185	2020-05-25 10:07:33.805185
5653	28	9	2		2020-05-25 10:07:33.81465	2020-05-25 10:07:33.81465
5654	43	9	2		2020-05-25 10:07:33.822786	2020-05-25 10:07:33.822786
5655	15	9	3		2020-05-25 10:07:33.829556	2020-05-25 10:07:33.829556
5656	1	9	0		2020-05-25 10:07:33.835563	2020-05-25 10:07:33.835563
5657	48	9	1		2020-05-25 10:07:33.843254	2020-05-25 10:07:33.843254
5658	91	9	2		2020-05-25 10:07:33.850148	2020-05-25 10:07:33.850148
5659	53	9	0		2020-05-25 10:07:33.85682	2020-05-25 10:07:33.85682
5660	4	9	2		2020-05-25 10:07:33.865752	2020-05-25 10:07:33.865752
5661	93	9	1		2020-05-25 10:07:33.874301	2020-05-25 10:07:33.874301
5662	18	9	0		2020-05-25 10:07:33.88092	2020-05-25 10:07:33.88092
5663	80	9	1		2020-05-25 10:07:33.888744	2020-05-25 10:07:33.888744
5664	56	9	0		2020-05-25 10:07:33.895675	2020-05-25 10:07:33.895675
5665	99	9	2		2020-05-25 10:07:33.901716	2020-05-25 10:07:33.901716
5666	25	9	4		2020-05-25 10:07:33.90908	2020-05-25 10:07:33.90908
5667	37	9	2		2020-05-25 10:07:33.916566	2020-05-25 10:07:33.916566
5668	79	9	5		2020-05-25 10:07:33.923439	2020-05-25 10:07:33.923439
5669	97	9	5		2020-05-25 10:07:33.93246	2020-05-25 10:07:33.93246
5670	57	9	4		2020-05-25 10:07:33.939829	2020-05-25 10:07:33.939829
5671	40	9	2		2020-05-25 10:07:33.947496	2020-05-25 10:07:33.947496
5672	45	9	1		2020-05-25 10:07:33.95541	2020-05-25 10:07:33.95541
5673	3	9	4		2020-05-25 10:07:33.963519	2020-05-25 10:07:33.963519
5674	54	9	2		2020-05-25 10:07:33.969856	2020-05-25 10:07:33.969856
5675	96	9	0		2020-05-25 10:07:33.976443	2020-05-25 10:07:33.976443
5676	27	9	2		2020-05-25 10:07:33.986885	2020-05-25 10:07:33.986885
5677	70	9	1		2020-05-25 10:07:33.991354	2020-05-25 10:07:33.991354
5678	76	9	1		2020-05-25 10:07:34.003156	2020-05-25 10:07:34.003156
5679	22	9	3		2020-05-25 10:07:34.009314	2020-05-25 10:07:34.009314
5680	58	9	3		2020-05-25 10:07:34.018765	2020-05-25 10:07:34.018765
5681	77	9	1		2020-05-25 10:07:34.026396	2020-05-25 10:07:34.026396
5682	64	9	2		2020-05-25 10:07:34.033538	2020-05-25 10:07:34.033538
5683	12	9	1		2020-05-25 10:07:34.040608	2020-05-25 10:07:34.040608
5684	19	9	0		2020-05-25 10:07:34.049067	2020-05-25 10:07:34.049067
5685	89	9	1		2020-05-25 10:07:34.056416	2020-05-25 10:07:34.056416
5686	78	9	4		2020-05-25 10:07:34.063626	2020-05-25 10:07:34.063626
5687	84	9	3		2020-05-25 10:07:34.071629	2020-05-25 10:07:34.071629
5688	31	9	2		2020-05-25 10:07:34.079859	2020-05-25 10:07:34.079859
5689	42	9	2		2020-05-25 10:07:34.085787	2020-05-25 10:07:34.085787
5690	20	9	2		2020-05-25 10:07:34.092661	2020-05-25 10:07:34.092661
5691	24	9	3		2020-05-25 10:07:34.103172	2020-05-25 10:07:34.103172
5692	36	9	3		2020-05-25 10:07:34.107739	2020-05-25 10:07:34.107739
5693	85	9	5		2020-05-25 10:07:34.116733	2020-05-25 10:07:34.116733
5694	38	9	3		2020-05-25 10:07:34.124516	2020-05-25 10:07:34.124516
5695	72	9	5		2020-05-25 10:07:34.132732	2020-05-25 10:07:34.132732
5696	34	9	0		2020-05-25 10:07:34.138972	2020-05-25 10:07:34.138972
5697	52	9	0		2020-05-25 10:07:34.146774	2020-05-25 10:07:34.146774
5698	88	9	2		2020-05-25 10:07:34.154834	2020-05-25 10:07:34.154834
5699	47	9	2		2020-05-25 10:07:34.163236	2020-05-25 10:07:34.163236
5700	39	10	2		2020-05-25 10:07:34.16991	2020-05-25 10:07:34.16991
5701	4	10	0		2020-05-25 10:07:34.176573	2020-05-25 10:07:34.176573
5702	79	10	1		2020-05-25 10:07:34.187175	2020-05-25 10:07:34.187175
5703	45	10	3		2020-05-25 10:07:34.196288	2020-05-25 10:07:34.196288
5704	58	10	3		2020-05-25 10:07:34.202278	2020-05-25 10:07:34.202278
5705	41	10	5		2020-05-25 10:07:34.209406	2020-05-25 10:07:34.209406
5706	50	10	3		2020-05-25 10:07:34.220345	2020-05-25 10:07:34.220345
5707	12	10	2		2020-05-25 10:07:34.224729	2020-05-25 10:07:34.224729
5708	54	10	2		2020-05-25 10:07:34.233959	2020-05-25 10:07:34.233959
5709	40	10	5		2020-05-25 10:07:34.241683	2020-05-25 10:07:34.241683
5710	44	10	3		2020-05-25 10:07:34.249858	2020-05-25 10:07:34.249858
5711	53	10	0		2020-05-25 10:07:34.256368	2020-05-25 10:07:34.256368
5712	68	10	1		2020-05-25 10:07:34.265246	2020-05-25 10:07:34.265246
5713	0	10	1		2020-05-25 10:07:34.27334	2020-05-25 10:07:34.27334
5714	66	10	4		2020-05-25 10:07:34.280417	2020-05-25 10:07:34.280417
5715	76	10	4		2020-05-25 10:07:34.286315	2020-05-25 10:07:34.286315
5716	95	10	5		2020-05-25 10:07:34.293887	2020-05-25 10:07:34.293887
5717	74	10	0		2020-05-25 10:07:34.304413	2020-05-25 10:07:34.304413
5718	71	10	3		2020-05-25 10:07:34.31386	2020-05-25 10:07:34.31386
5719	96	10	3		2020-05-25 10:07:34.32324	2020-05-25 10:07:34.32324
5720	6	10	1		2020-05-25 10:07:34.332059	2020-05-25 10:07:34.332059
5721	7	10	2		2020-05-25 10:07:34.340657	2020-05-25 10:07:34.340657
5722	84	10	1		2020-05-25 10:07:34.350593	2020-05-25 10:07:34.350593
5723	72	10	2		2020-05-25 10:07:34.358594	2020-05-25 10:07:34.358594
5724	46	10	4		2020-05-25 10:07:34.36666	2020-05-25 10:07:34.36666
5725	47	10	3		2020-05-25 10:07:34.374024	2020-05-25 10:07:34.374024
5726	83	10	5		2020-05-25 10:07:34.383011	2020-05-25 10:07:34.383011
5727	16	10	1		2020-05-25 10:07:34.393752	2020-05-25 10:07:34.393752
5728	22	10	0		2020-05-25 10:07:34.400885	2020-05-25 10:07:34.400885
5729	42	10	3		2020-05-25 10:07:34.408152	2020-05-25 10:07:34.408152
5730	15	10	4		2020-05-25 10:07:34.416213	2020-05-25 10:07:34.416213
5731	31	10	0		2020-05-25 10:07:34.427264	2020-05-25 10:07:34.427264
5732	82	10	1		2020-05-25 10:07:34.432879	2020-05-25 10:07:34.432879
5733	21	10	0		2020-05-25 10:07:34.441782	2020-05-25 10:07:34.441782
5734	67	10	5		2020-05-25 10:07:34.450555	2020-05-25 10:07:34.450555
5735	36	10	4		2020-05-25 10:07:34.459017	2020-05-25 10:07:34.459017
5736	90	10	2		2020-05-25 10:07:34.468259	2020-05-25 10:07:34.468259
5737	89	10	4		2020-05-25 10:07:34.476679	2020-05-25 10:07:34.476679
5738	20	10	4		2020-05-25 10:07:34.484509	2020-05-25 10:07:34.484509
5739	52	10	2		2020-05-25 10:07:34.493207	2020-05-25 10:07:34.493207
5740	26	10	5		2020-05-25 10:07:34.503498	2020-05-25 10:07:34.503498
5741	25	10	2		2020-05-25 10:07:34.526844	2020-05-25 10:07:34.526844
5742	81	10	1		2020-05-25 10:07:34.532883	2020-05-25 10:07:34.532883
5743	98	10	4		2020-05-25 10:07:34.548315	2020-05-25 10:07:34.548315
5744	85	10	0		2020-05-25 10:07:34.552673	2020-05-25 10:07:34.552673
5745	99	10	2		2020-05-25 10:07:34.556557	2020-05-25 10:07:34.556557
5746	5	10	2		2020-05-25 10:07:34.567468	2020-05-25 10:07:34.567468
5747	61	10	4		2020-05-25 10:07:34.57442	2020-05-25 10:07:34.57442
5748	34	10	2		2020-05-25 10:07:34.582236	2020-05-25 10:07:34.582236
5749	2	10	2		2020-05-25 10:07:34.589077	2020-05-25 10:07:34.589077
5750	94	10	2		2020-05-25 10:07:34.59809	2020-05-25 10:07:34.59809
5751	75	10	4		2020-05-25 10:07:34.613843	2020-05-25 10:07:34.613843
5752	57	10	0		2020-05-25 10:07:34.619526	2020-05-25 10:07:34.619526
5753	56	10	5		2020-05-25 10:07:34.639965	2020-05-25 10:07:34.639965
5754	24	10	3		2020-05-25 10:07:34.646138	2020-05-25 10:07:34.646138
5755	80	10	3		2020-05-25 10:07:34.654015	2020-05-25 10:07:34.654015
5756	19	10	4		2020-05-25 10:07:34.662854	2020-05-25 10:07:34.662854
5757	28	10	3		2020-05-25 10:07:34.669176	2020-05-25 10:07:34.669176
5758	97	10	5		2020-05-25 10:07:34.676506	2020-05-25 10:07:34.676506
5759	1	10	4		2020-05-25 10:07:34.685593	2020-05-25 10:07:34.685593
5760	65	10	3		2020-05-25 10:07:34.693264	2020-05-25 10:07:34.693264
5761	86	10	4		2020-05-25 10:07:34.703813	2020-05-25 10:07:34.703813
5762	8	10	4		2020-05-25 10:07:34.708199	2020-05-25 10:07:34.708199
5763	27	10	0		2020-05-25 10:07:34.717907	2020-05-25 10:07:34.717907
5764	51	10	4		2020-05-25 10:07:34.725852	2020-05-25 10:07:34.725852
5765	62	10	2		2020-05-25 10:07:34.731739	2020-05-25 10:07:34.731739
5766	78	10	2		2020-05-25 10:07:34.739446	2020-05-25 10:07:34.739446
5767	64	10	2		2020-05-25 10:07:34.748551	2020-05-25 10:07:34.748551
5768	18	10	1		2020-05-25 10:07:34.756439	2020-05-25 10:07:34.756439
5769	49	10	2		2020-05-25 10:07:34.764573	2020-05-25 10:07:34.764573
5770	10	10	4		2020-05-25 10:07:34.771018	2020-05-25 10:07:34.771018
5771	30	10	4		2020-05-25 10:07:34.780745	2020-05-25 10:07:34.780745
5772	17	10	4		2020-05-25 10:07:34.789048	2020-05-25 10:07:34.789048
5773	23	10	2		2020-05-25 10:07:34.796444	2020-05-25 10:07:34.796444
5774	59	10	4		2020-05-25 10:07:34.802445	2020-05-25 10:07:34.802445
5775	37	10	1		2020-05-25 10:07:34.809921	2020-05-25 10:07:34.809921
5776	11	10	4		2020-05-25 10:07:34.820771	2020-05-25 10:07:34.820771
5777	63	10	3		2020-05-25 10:07:34.829839	2020-05-25 10:07:34.829839
5778	70	10	1		2020-05-25 10:07:34.858017	2020-05-25 10:07:34.858017
5779	55	10	5		2020-05-25 10:07:34.862697	2020-05-25 10:07:34.862697
5780	13	10	4		2020-05-25 10:07:34.871829	2020-05-25 10:07:34.871829
5781	14	10	2		2020-05-25 10:07:34.88176	2020-05-25 10:07:34.88176
5782	92	10	3		2020-05-25 10:07:34.8905	2020-05-25 10:07:34.8905
5783	9	10	3		2020-05-25 10:07:34.899326	2020-05-25 10:07:34.899326
5784	93	10	3		2020-05-25 10:07:34.907879	2020-05-25 10:07:34.907879
5785	91	10	3		2020-05-25 10:07:34.916796	2020-05-25 10:07:34.916796
5786	38	10	3		2020-05-25 10:07:34.926688	2020-05-25 10:07:34.926688
5787	33	10	3		2020-05-25 10:07:34.939479	2020-05-25 10:07:34.939479
5788	48	10	3		2020-05-25 10:07:34.947514	2020-05-25 10:07:34.947514
5789	88	10	4		2020-05-25 10:07:34.960297	2020-05-25 10:07:34.960297
5790	87	10	3		2020-05-25 10:07:34.972941	2020-05-25 10:07:34.972941
5791	3	10	3		2020-05-25 10:07:34.984093	2020-05-25 10:07:34.984093
5792	60	10	1		2020-05-25 10:07:34.993178	2020-05-25 10:07:34.993178
5793	91	11	4		2020-05-25 10:07:35.006176	2020-05-25 10:07:35.006176
5794	63	11	1		2020-05-25 10:07:35.017826	2020-05-25 10:07:35.017826
5795	37	11	4		2020-05-25 10:07:35.027632	2020-05-25 10:07:35.027632
5796	65	11	4		2020-05-25 10:07:35.039536	2020-05-25 10:07:35.039536
5797	51	11	3		2020-05-25 10:07:35.050477	2020-05-25 10:07:35.050477
5798	3	11	4		2020-05-25 10:07:35.059505	2020-05-25 10:07:35.059505
5799	46	11	2		2020-05-25 10:07:35.069545	2020-05-25 10:07:35.069545
5800	86	11	3		2020-05-25 10:07:35.076743	2020-05-25 10:07:35.076743
5801	71	11	3		2020-05-25 10:07:35.088973	2020-05-25 10:07:35.088973
5802	32	11	2		2020-05-25 10:07:35.102627	2020-05-25 10:07:35.102627
5803	81	11	3		2020-05-25 10:07:35.10738	2020-05-25 10:07:35.10738
5804	93	11	1		2020-05-25 10:07:35.121493	2020-05-25 10:07:35.121493
5805	19	11	1		2020-05-25 10:07:35.129936	2020-05-25 10:07:35.129936
5806	76	11	2		2020-05-25 10:07:35.138144	2020-05-25 10:07:35.138144
5807	61	11	0		2020-05-25 10:07:35.146461	2020-05-25 10:07:35.146461
5808	92	11	2		2020-05-25 10:07:35.154874	2020-05-25 10:07:35.154874
5809	62	11	4		2020-05-25 10:07:35.170417	2020-05-25 10:07:35.170417
5810	35	11	2		2020-05-25 10:07:35.175445	2020-05-25 10:07:35.175445
5811	10	11	0		2020-05-25 10:07:35.187625	2020-05-25 10:07:35.187625
5812	66	11	4		2020-05-25 10:07:35.196233	2020-05-25 10:07:35.196233
5813	45	11	0		2020-05-25 10:07:35.205739	2020-05-25 10:07:35.205739
5814	17	11	0		2020-05-25 10:07:35.212306	2020-05-25 10:07:35.212306
5815	49	11	3		2020-05-25 10:07:35.220827	2020-05-25 10:07:35.220827
5816	47	11	5		2020-05-25 10:07:35.229982	2020-05-25 10:07:35.229982
5817	56	11	0		2020-05-25 10:07:35.238715	2020-05-25 10:07:35.238715
5818	33	12	3		2020-05-25 10:07:35.24937	2020-05-25 10:07:35.24937
5819	25	12	3		2020-05-25 10:07:35.257455	2020-05-25 10:07:35.257455
5820	63	12	0		2020-05-25 10:07:35.268879	2020-05-25 10:07:35.268879
5821	78	12	3		2020-05-25 10:07:35.274223	2020-05-25 10:07:35.274223
5822	45	12	1		2020-05-25 10:07:35.287839	2020-05-25 10:07:35.287839
5823	62	12	4		2020-05-25 10:07:35.296608	2020-05-25 10:07:35.296608
5824	85	12	3		2020-05-25 10:07:35.304859	2020-05-25 10:07:35.304859
5825	36	12	4		2020-05-25 10:07:35.316017	2020-05-25 10:07:35.316017
5826	11	12	5		2020-05-25 10:07:35.324331	2020-05-25 10:07:35.324331
5827	56	12	4		2020-05-25 10:07:35.335034	2020-05-25 10:07:35.335034
5828	77	12	3		2020-05-25 10:07:35.343008	2020-05-25 10:07:35.343008
5829	58	12	2		2020-05-25 10:07:35.355966	2020-05-25 10:07:35.355966
5830	27	12	2		2020-05-25 10:07:35.364091	2020-05-25 10:07:35.364091
5831	22	12	2		2020-05-25 10:07:35.372432	2020-05-25 10:07:35.372432
5832	50	12	2		2020-05-25 10:07:35.381813	2020-05-25 10:07:35.381813
5833	89	12	2		2020-05-25 10:07:35.390431	2020-05-25 10:07:35.390431
5834	20	12	3		2020-05-25 10:07:35.397611	2020-05-25 10:07:35.397611
5835	91	12	0		2020-05-25 10:07:35.405799	2020-05-25 10:07:35.405799
5836	0	12	2		2020-05-25 10:07:35.413253	2020-05-25 10:07:35.413253
5837	4	12	1		2020-05-25 10:07:35.420219	2020-05-25 10:07:35.420219
5838	10	12	0		2020-05-25 10:07:35.430362	2020-05-25 10:07:35.430362
5839	52	12	3		2020-05-25 10:07:35.438467	2020-05-25 10:07:35.438467
5840	41	12	4		2020-05-25 10:07:35.446273	2020-05-25 10:07:35.446273
5841	15	12	1		2020-05-25 10:07:35.45411	2020-05-25 10:07:35.45411
5842	5	12	1		2020-05-25 10:07:35.459813	2020-05-25 10:07:35.459813
5843	47	12	4		2020-05-25 10:07:35.469737	2020-05-25 10:07:35.469737
5844	72	12	3		2020-05-25 10:07:35.47732	2020-05-25 10:07:35.47732
5845	48	12	1		2020-05-25 10:07:35.48835	2020-05-25 10:07:35.48835
5846	18	12	1		2020-05-25 10:07:35.499101	2020-05-25 10:07:35.499101
5847	84	12	5		2020-05-25 10:07:35.507378	2020-05-25 10:07:35.507378
5848	95	12	4		2020-05-25 10:07:35.514111	2020-05-25 10:07:35.514111
5849	76	12	3		2020-05-25 10:07:35.522896	2020-05-25 10:07:35.522896
5850	35	12	1		2020-05-25 10:07:35.532077	2020-05-25 10:07:35.532077
5851	93	12	4		2020-05-25 10:07:35.540634	2020-05-25 10:07:35.540634
5852	40	12	4		2020-05-25 10:07:35.546646	2020-05-25 10:07:35.546646
5853	51	12	0		2020-05-25 10:07:35.555342	2020-05-25 10:07:35.555342
5854	49	12	4		2020-05-25 10:07:35.563124	2020-05-25 10:07:35.563124
5855	87	12	2		2020-05-25 10:07:35.571184	2020-05-25 10:07:35.571184
5856	14	12	2		2020-05-25 10:07:35.580841	2020-05-25 10:07:35.580841
5857	13	12	2		2020-05-25 10:07:35.588092	2020-05-25 10:07:35.588092
5858	61	12	2		2020-05-25 10:07:35.598077	2020-05-25 10:07:35.598077
5859	68	12	3		2020-05-25 10:07:35.606043	2020-05-25 10:07:35.606043
5860	98	12	1		2020-05-25 10:07:35.615454	2020-05-25 10:07:35.615454
5861	26	12	4		2020-05-25 10:07:35.623969	2020-05-25 10:07:35.623969
5862	86	12	4		2020-05-25 10:07:35.63166	2020-05-25 10:07:35.63166
5863	70	12	2		2020-05-25 10:07:35.639716	2020-05-25 10:07:35.639716
5864	37	12	3		2020-05-25 10:07:35.648961	2020-05-25 10:07:35.648961
5865	88	12	1		2020-05-25 10:07:35.657522	2020-05-25 10:07:35.657522
5866	3	12	4		2020-05-25 10:07:35.663743	2020-05-25 10:07:35.663743
5867	79	12	3		2020-05-25 10:07:35.672709	2020-05-25 10:07:35.672709
5868	28	12	0		2020-05-25 10:07:35.683497	2020-05-25 10:07:35.683497
5869	97	12	0		2020-05-25 10:07:35.692351	2020-05-25 10:07:35.692351
5870	80	12	3		2020-05-25 10:07:35.701259	2020-05-25 10:07:35.701259
5871	74	12	4		2020-05-25 10:07:35.708352	2020-05-25 10:07:35.708352
5872	75	12	4		2020-05-25 10:07:35.718769	2020-05-25 10:07:35.718769
5873	64	12	1		2020-05-25 10:07:35.726606	2020-05-25 10:07:35.726606
5874	16	12	1		2020-05-25 10:07:35.737711	2020-05-25 10:07:35.737711
5875	71	12	1		2020-05-25 10:07:35.746693	2020-05-25 10:07:35.746693
5876	32	12	0		2020-05-25 10:07:35.7548	2020-05-25 10:07:35.7548
5877	69	12	2		2020-05-25 10:07:35.764033	2020-05-25 10:07:35.764033
5878	55	12	5		2020-05-25 10:07:35.772249	2020-05-25 10:07:35.772249
5879	66	12	0		2020-05-25 10:07:35.780677	2020-05-25 10:07:35.780677
5880	8	12	0		2020-05-25 10:07:35.788851	2020-05-25 10:07:35.788851
5881	44	12	3		2020-05-25 10:07:35.796	2020-05-25 10:07:35.796
5882	83	12	0		2020-05-25 10:07:35.802774	2020-05-25 10:07:35.802774
5883	60	12	3		2020-05-25 10:07:35.809559	2020-05-25 10:07:35.809559
5884	82	12	1		2020-05-25 10:07:35.821673	2020-05-25 10:07:35.821673
5885	42	12	4		2020-05-25 10:07:35.829892	2020-05-25 10:07:35.829892
5886	39	12	3		2020-05-25 10:07:35.836655	2020-05-25 10:07:35.836655
5887	29	12	5		2020-05-25 10:07:35.846362	2020-05-25 10:07:35.846362
5888	9	12	0		2020-05-25 10:07:35.85462	2020-05-25 10:07:35.85462
5889	54	12	3		2020-05-25 10:07:35.863217	2020-05-25 10:07:35.863217
5890	90	12	5		2020-05-25 10:07:35.871721	2020-05-25 10:07:35.871721
5891	38	12	2		2020-05-25 10:07:35.880834	2020-05-25 10:07:35.880834
5892	43	12	0		2020-05-25 10:07:35.88849	2020-05-25 10:07:35.88849
5893	12	12	0		2020-05-25 10:07:35.897049	2020-05-25 10:07:35.897049
5894	73	12	3		2020-05-25 10:07:35.904962	2020-05-25 10:07:35.904962
5895	19	12	2		2020-05-25 10:07:35.913026	2020-05-25 10:07:35.913026
5896	53	12	4		2020-05-25 10:07:35.922046	2020-05-25 10:07:35.922046
5897	30	12	4		2020-05-25 10:07:35.927397	2020-05-25 10:07:35.927397
5898	24	12	4		2020-05-25 10:07:35.93753	2020-05-25 10:07:35.93753
5899	99	12	0		2020-05-25 10:07:35.947907	2020-05-25 10:07:35.947907
5900	23	12	1		2020-05-25 10:07:35.955907	2020-05-25 10:07:35.955907
5901	1	12	1		2020-05-25 10:07:35.963056	2020-05-25 10:07:35.963056
5902	81	12	5		2020-05-25 10:07:35.970718	2020-05-25 10:07:35.970718
5903	34	12	1		2020-05-25 10:07:35.976677	2020-05-25 10:07:35.976677
5904	2	12	1		2020-05-25 10:07:35.987877	2020-05-25 10:07:35.987877
5905	7	12	3		2020-05-25 10:07:35.998237	2020-05-25 10:07:35.998237
5906	31	12	3		2020-05-25 10:07:36.006971	2020-05-25 10:07:36.006971
5907	21	12	3		2020-05-25 10:07:36.014834	2020-05-25 10:07:36.014834
5908	57	12	0		2020-05-25 10:07:36.031999	2020-05-25 10:07:36.031999
5909	94	12	4		2020-05-25 10:07:36.04855	2020-05-25 10:07:36.04855
5910	46	12	0		2020-05-25 10:07:36.061466	2020-05-25 10:07:36.061466
5911	6	12	2		2020-05-25 10:07:36.075059	2020-05-25 10:07:36.075059
5912	59	12	5		2020-05-25 10:07:36.086194	2020-05-25 10:07:36.086194
5913	92	12	2		2020-05-25 10:07:36.098494	2020-05-25 10:07:36.098494
5914	17	12	4		2020-05-25 10:07:36.110375	2020-05-25 10:07:36.110375
5915	96	12	0		2020-05-25 10:07:36.120662	2020-05-25 10:07:36.120662
5916	67	12	3		2020-05-25 10:07:36.132834	2020-05-25 10:07:36.132834
5917	65	12	3		2020-05-25 10:07:36.141928	2020-05-25 10:07:36.141928
5918	96	13	3		2020-05-25 10:07:36.155164	2020-05-25 10:07:36.155164
5919	83	13	0		2020-05-25 10:07:36.16132	2020-05-25 10:07:36.16132
5920	48	13	0		2020-05-25 10:07:36.175465	2020-05-25 10:07:36.175465
5921	95	13	0		2020-05-25 10:07:36.186189	2020-05-25 10:07:36.186189
5922	29	13	0		2020-05-25 10:07:36.193607	2020-05-25 10:07:36.193607
5923	9	13	0		2020-05-25 10:07:36.20596	2020-05-25 10:07:36.20596
5924	12	14	0		2020-05-25 10:07:36.218876	2020-05-25 10:07:36.218876
5925	27	14	4		2020-05-25 10:07:36.225373	2020-05-25 10:07:36.225373
5926	37	14	3		2020-05-25 10:07:36.238927	2020-05-25 10:07:36.238927
5927	73	14	0		2020-05-25 10:07:36.247662	2020-05-25 10:07:36.247662
5928	62	14	3		2020-05-25 10:07:36.25621	2020-05-25 10:07:36.25621
5929	7	14	5		2020-05-25 10:07:36.269651	2020-05-25 10:07:36.269651
5930	85	15	1		2020-05-25 10:07:36.275589	2020-05-25 10:07:36.275589
5931	21	15	4		2020-05-25 10:07:36.289359	2020-05-25 10:07:36.289359
5932	28	15	1		2020-05-25 10:07:36.297144	2020-05-25 10:07:36.297144
5933	24	15	0		2020-05-25 10:07:36.306247	2020-05-25 10:07:36.306247
5934	98	15	3		2020-05-25 10:07:36.345472	2020-05-25 10:07:36.345472
5935	12	15	1		2020-05-25 10:07:36.353326	2020-05-25 10:07:36.353326
5936	86	15	0		2020-05-25 10:07:36.358053	2020-05-25 10:07:36.358053
5937	88	15	1		2020-05-25 10:07:36.371308	2020-05-25 10:07:36.371308
5938	30	15	5		2020-05-25 10:07:36.378514	2020-05-25 10:07:36.378514
5939	43	15	0		2020-05-25 10:07:36.387672	2020-05-25 10:07:36.387672
5940	42	16	1		2020-05-25 10:07:36.397534	2020-05-25 10:07:36.397534
5941	14	16	0		2020-05-25 10:07:36.406488	2020-05-25 10:07:36.406488
5942	8	16	4		2020-05-25 10:07:36.41742	2020-05-25 10:07:36.41742
5943	55	16	2		2020-05-25 10:07:36.426009	2020-05-25 10:07:36.426009
5944	92	16	0		2020-05-25 10:07:36.435119	2020-05-25 10:07:36.435119
5945	88	16	5		2020-05-25 10:07:36.443612	2020-05-25 10:07:36.443612
5946	27	16	4		2020-05-25 10:07:36.458067	2020-05-25 10:07:36.458067
5947	90	16	0		2020-05-25 10:07:36.472346	2020-05-25 10:07:36.472346
5948	99	16	0		2020-05-25 10:07:36.487979	2020-05-25 10:07:36.487979
5949	43	16	0		2020-05-25 10:07:36.499976	2020-05-25 10:07:36.499976
5950	98	16	1		2020-05-25 10:07:36.505102	2020-05-25 10:07:36.505102
5951	44	16	1		2020-05-25 10:07:36.517501	2020-05-25 10:07:36.517501
5952	40	16	4		2020-05-25 10:07:36.526139	2020-05-25 10:07:36.526139
5953	18	16	4		2020-05-25 10:07:36.538747	2020-05-25 10:07:36.538747
5954	72	16	1		2020-05-25 10:07:36.543348	2020-05-25 10:07:36.543348
5955	48	16	4		2020-05-25 10:07:36.555783	2020-05-25 10:07:36.555783
5956	36	16	1		2020-05-25 10:07:36.567642	2020-05-25 10:07:36.567642
5957	0	16	0		2020-05-25 10:07:36.575041	2020-05-25 10:07:36.575041
5958	77	16	0		2020-05-25 10:07:36.588778	2020-05-25 10:07:36.588778
5959	97	16	4		2020-05-25 10:07:36.598146	2020-05-25 10:07:36.598146
5960	15	16	0		2020-05-25 10:07:36.605233	2020-05-25 10:07:36.605233
5961	12	16	1		2020-05-25 10:07:36.623959	2020-05-25 10:07:36.623959
5962	95	16	3		2020-05-25 10:07:36.632971	2020-05-25 10:07:36.632971
5963	17	16	3		2020-05-25 10:07:36.637797	2020-05-25 10:07:36.637797
5964	83	16	4		2020-05-25 10:07:36.648871	2020-05-25 10:07:36.648871
5965	37	16	2		2020-05-25 10:07:36.658734	2020-05-25 10:07:36.658734
5966	28	16	3		2020-05-25 10:07:36.67484	2020-05-25 10:07:36.67484
5967	25	16	0		2020-05-25 10:07:36.683887	2020-05-25 10:07:36.683887
5968	85	16	3		2020-05-25 10:07:36.692755	2020-05-25 10:07:36.692755
5969	21	16	4		2020-05-25 10:07:36.705176	2020-05-25 10:07:36.705176
5970	91	16	4		2020-05-25 10:07:36.719796	2020-05-25 10:07:36.719796
5971	93	16	5		2020-05-25 10:07:36.730821	2020-05-25 10:07:36.730821
5972	5	16	3		2020-05-25 10:07:36.74463	2020-05-25 10:07:36.74463
5973	23	16	4		2020-05-25 10:07:36.758714	2020-05-25 10:07:36.758714
5974	65	16	2		2020-05-25 10:07:36.769592	2020-05-25 10:07:36.769592
5975	78	16	0		2020-05-25 10:07:36.780614	2020-05-25 10:07:36.780614
5976	1	16	5		2020-05-25 10:07:36.79444	2020-05-25 10:07:36.79444
5977	53	16	3		2020-05-25 10:07:36.808063	2020-05-25 10:07:36.808063
5978	54	16	1		2020-05-25 10:07:36.818972	2020-05-25 10:07:36.818972
5979	79	16	1		2020-05-25 10:07:36.82816	2020-05-25 10:07:36.82816
5980	94	16	5		2020-05-25 10:07:36.842026	2020-05-25 10:07:36.842026
5981	69	16	1		2020-05-25 10:07:36.850742	2020-05-25 10:07:36.850742
5982	13	16	4		2020-05-25 10:07:36.859787	2020-05-25 10:07:36.859787
5983	45	16	2		2020-05-25 10:07:36.87107	2020-05-25 10:07:36.87107
5984	16	16	1		2020-05-25 10:07:36.878517	2020-05-25 10:07:36.878517
5985	49	16	2		2020-05-25 10:07:36.892398	2020-05-25 10:07:36.892398
5986	22	16	5		2020-05-25 10:07:36.90476	2020-05-25 10:07:36.90476
5987	33	16	3		2020-05-25 10:07:36.917213	2020-05-25 10:07:36.917213
5988	71	16	0		2020-05-25 10:07:36.92642	2020-05-25 10:07:36.92642
5989	86	16	4		2020-05-25 10:07:36.935608	2020-05-25 10:07:36.935608
5990	4	16	1		2020-05-25 10:07:36.944429	2020-05-25 10:07:36.944429
5991	87	16	4		2020-05-25 10:07:36.956636	2020-05-25 10:07:36.956636
5992	52	16	3		2020-05-25 10:07:36.968546	2020-05-25 10:07:36.968546
5993	80	17	3		2020-05-25 10:07:36.977376	2020-05-25 10:07:36.977376
5994	9	17	4		2020-05-25 10:07:36.990263	2020-05-25 10:07:36.990263
5995	70	17	1		2020-05-25 10:07:37.001217	2020-05-25 10:07:37.001217
5996	38	17	3		2020-05-25 10:07:37.010616	2020-05-25 10:07:37.010616
5997	90	17	4		2020-05-25 10:07:37.024757	2020-05-25 10:07:37.024757
5998	59	17	4		2020-05-25 10:07:37.036074	2020-05-25 10:07:37.036074
5999	31	17	4		2020-05-25 10:07:37.044985	2020-05-25 10:07:37.044985
6000	47	17	0		2020-05-25 10:07:37.056916	2020-05-25 10:07:37.056916
6001	79	17	5		2020-05-25 10:07:37.068785	2020-05-25 10:07:37.068785
6002	40	17	3		2020-05-25 10:07:37.077921	2020-05-25 10:07:37.077921
6003	52	17	2		2020-05-25 10:07:37.089597	2020-05-25 10:07:37.089597
6004	62	17	4		2020-05-25 10:07:37.09694	2020-05-25 10:07:37.09694
6005	86	17	3		2020-05-25 10:07:37.11128	2020-05-25 10:07:37.11128
6006	77	17	4		2020-05-25 10:07:37.119041	2020-05-25 10:07:37.119041
6007	96	17	4		2020-05-25 10:07:37.123917	2020-05-25 10:07:37.123917
6008	93	17	0		2020-05-25 10:07:37.134426	2020-05-25 10:07:37.134426
6009	84	17	1		2020-05-25 10:07:37.143576	2020-05-25 10:07:37.143576
6010	92	17	2		2020-05-25 10:07:37.154875	2020-05-25 10:07:37.154875
6011	17	17	1		2020-05-25 10:07:37.159975	2020-05-25 10:07:37.159975
6012	74	17	5		2020-05-25 10:07:37.171375	2020-05-25 10:07:37.171375
6013	6	17	3		2020-05-25 10:07:37.183284	2020-05-25 10:07:37.183284
6014	39	17	0		2020-05-25 10:07:37.192245	2020-05-25 10:07:37.192245
6015	21	17	2		2020-05-25 10:07:37.202881	2020-05-25 10:07:37.202881
6016	33	17	0		2020-05-25 10:07:37.211303	2020-05-25 10:07:37.211303
6017	37	17	2		2020-05-25 10:07:37.222558	2020-05-25 10:07:37.222558
6018	63	17	0		2020-05-25 10:07:37.234403	2020-05-25 10:07:37.234403
6019	71	17	2		2020-05-25 10:07:37.246544	2020-05-25 10:07:37.246544
6020	73	17	0		2020-05-25 10:07:37.257794	2020-05-25 10:07:37.257794
6021	88	17	1		2020-05-25 10:07:37.269025	2020-05-25 10:07:37.269025
6022	67	18	3		2020-05-25 10:07:37.277843	2020-05-25 10:07:37.277843
6023	16	18	3		2020-05-25 10:07:37.29173	2020-05-25 10:07:37.29173
6024	7	18	0		2020-05-25 10:07:37.301463	2020-05-25 10:07:37.301463
6025	52	18	5		2020-05-25 10:07:37.310468	2020-05-25 10:07:37.310468
6026	85	18	1		2020-05-25 10:07:37.324408	2020-05-25 10:07:37.324408
6027	32	18	0		2020-05-25 10:07:37.335754	2020-05-25 10:07:37.335754
6028	8	18	5		2020-05-25 10:07:37.34432	2020-05-25 10:07:37.34432
6029	75	18	3		2020-05-25 10:07:37.357828	2020-05-25 10:07:37.357828
6030	81	18	1		2020-05-25 10:07:37.367134	2020-05-25 10:07:37.367134
6031	58	18	3		2020-05-25 10:07:37.376755	2020-05-25 10:07:37.376755
6032	68	18	0		2020-05-25 10:07:37.388984	2020-05-25 10:07:37.388984
6033	39	18	1		2020-05-25 10:07:37.401003	2020-05-25 10:07:37.401003
6034	25	18	4		2020-05-25 10:07:37.410543	2020-05-25 10:07:37.410543
6035	21	18	2		2020-05-25 10:07:37.420077	2020-05-25 10:07:37.420077
6036	99	18	0		2020-05-25 10:07:37.428553	2020-05-25 10:07:37.428553
6037	48	18	3		2020-05-25 10:07:37.442843	2020-05-25 10:07:37.442843
6038	95	18	1		2020-05-25 10:07:37.452251	2020-05-25 10:07:37.452251
6039	74	18	2		2020-05-25 10:07:37.461102	2020-05-25 10:07:37.461102
6040	78	18	3		2020-05-25 10:07:37.475618	2020-05-25 10:07:37.475618
6041	40	18	0		2020-05-25 10:07:37.485652	2020-05-25 10:07:37.485652
6042	45	18	2		2020-05-25 10:07:37.494498	2020-05-25 10:07:37.494498
6043	24	18	4		2020-05-25 10:07:37.510546	2020-05-25 10:07:37.510546
6044	84	18	2		2020-05-25 10:07:37.519729	2020-05-25 10:07:37.519729
6045	72	18	1		2020-05-25 10:07:37.527561	2020-05-25 10:07:37.527561
6046	33	18	1		2020-05-25 10:07:37.54003	2020-05-25 10:07:37.54003
6047	44	18	0		2020-05-25 10:07:37.550144	2020-05-25 10:07:37.550144
6048	96	18	5		2020-05-25 10:07:37.560526	2020-05-25 10:07:37.560526
6049	0	18	5		2020-05-25 10:07:37.573689	2020-05-25 10:07:37.573689
6050	12	18	3		2020-05-25 10:07:37.5837	2020-05-25 10:07:37.5837
6051	59	18	4		2020-05-25 10:07:37.593774	2020-05-25 10:07:37.593774
6052	55	18	5		2020-05-25 10:07:37.60668	2020-05-25 10:07:37.60668
6053	37	18	2		2020-05-25 10:07:37.618059	2020-05-25 10:07:37.618059
6054	11	18	4		2020-05-25 10:07:37.627405	2020-05-25 10:07:37.627405
6055	3	18	3		2020-05-25 10:07:37.639161	2020-05-25 10:07:37.639161
6056	29	18	0		2020-05-25 10:07:37.646584	2020-05-25 10:07:37.646584
6057	5	18	3		2020-05-25 10:07:37.658431	2020-05-25 10:07:37.658431
6058	91	18	1		2020-05-25 10:07:37.666562	2020-05-25 10:07:37.666562
6059	65	18	0		2020-05-25 10:07:37.676003	2020-05-25 10:07:37.676003
6060	57	18	0		2020-05-25 10:07:37.687203	2020-05-25 10:07:37.687203
6061	88	18	4		2020-05-25 10:07:37.694849	2020-05-25 10:07:37.694849
6062	50	18	2		2020-05-25 10:07:37.707796	2020-05-25 10:07:37.707796
6063	86	18	2		2020-05-25 10:07:37.71706	2020-05-25 10:07:37.71706
6064	46	18	1		2020-05-25 10:07:37.726185	2020-05-25 10:07:37.726185
6065	47	18	1		2020-05-25 10:07:37.736346	2020-05-25 10:07:37.736346
6066	77	18	4		2020-05-25 10:07:37.744609	2020-05-25 10:07:37.744609
6067	89	18	2		2020-05-25 10:07:37.757164	2020-05-25 10:07:37.757164
6068	87	18	5		2020-05-25 10:07:37.766132	2020-05-25 10:07:37.766132
6069	14	18	0		2020-05-25 10:07:37.775405	2020-05-25 10:07:37.775405
6070	35	18	4		2020-05-25 10:07:37.785205	2020-05-25 10:07:37.785205
6071	1	18	2		2020-05-25 10:07:37.793895	2020-05-25 10:07:37.793895
6072	62	18	0		2020-05-25 10:07:37.805497	2020-05-25 10:07:37.805497
6073	42	18	5		2020-05-25 10:07:37.812745	2020-05-25 10:07:37.812745
6074	51	18	2		2020-05-25 10:07:37.825918	2020-05-25 10:07:37.825918
6075	54	18	1		2020-05-25 10:07:37.832915	2020-05-25 10:07:37.832915
6076	80	18	1		2020-05-25 10:07:37.838485	2020-05-25 10:07:37.838485
6077	83	18	4		2020-05-25 10:07:37.849522	2020-05-25 10:07:37.849522
6078	90	18	0		2020-05-25 10:07:37.858706	2020-05-25 10:07:37.858706
6079	23	18	2		2020-05-25 10:07:37.868581	2020-05-25 10:07:37.868581
6080	66	18	5		2020-05-25 10:07:37.874545	2020-05-25 10:07:37.874545
6081	28	18	4		2020-05-25 10:07:37.885822	2020-05-25 10:07:37.885822
6082	6	18	2		2020-05-25 10:07:37.893778	2020-05-25 10:07:37.893778
6083	63	18	4		2020-05-25 10:07:37.905077	2020-05-25 10:07:37.905077
6084	93	18	3		2020-05-25 10:07:37.913156	2020-05-25 10:07:37.913156
6085	18	18	4		2020-05-25 10:07:37.923449	2020-05-25 10:07:37.923449
6086	20	18	0		2020-05-25 10:07:37.930915	2020-05-25 10:07:37.930915
6087	92	18	3		2020-05-25 10:07:37.939204	2020-05-25 10:07:37.939204
6088	36	18	3		2020-05-25 10:07:37.949541	2020-05-25 10:07:37.949541
6089	56	18	5		2020-05-25 10:07:37.958301	2020-05-25 10:07:37.958301
6090	41	18	1		2020-05-25 10:07:37.96788	2020-05-25 10:07:37.96788
6091	76	18	0		2020-05-25 10:07:38.000059	2020-05-25 10:07:38.000059
6092	38	18	3		2020-05-25 10:07:38.004369	2020-05-25 10:07:38.004369
6093	34	18	4		2020-05-25 10:07:38.014322	2020-05-25 10:07:38.014322
6094	17	18	1		2020-05-25 10:07:38.024852	2020-05-25 10:07:38.024852
6095	64	18	5		2020-05-25 10:07:38.031968	2020-05-25 10:07:38.031968
6096	43	18	5		2020-05-25 10:07:38.040362	2020-05-25 10:07:38.040362
6097	69	18	3		2020-05-25 10:07:38.049717	2020-05-25 10:07:38.049717
6098	31	18	3		2020-05-25 10:07:38.058653	2020-05-25 10:07:38.058653
6099	22	18	0		2020-05-25 10:07:38.068976	2020-05-25 10:07:38.068976
6100	82	18	1		2020-05-25 10:07:38.075197	2020-05-25 10:07:38.075197
6101	61	18	1		2020-05-25 10:07:38.08328	2020-05-25 10:07:38.08328
6102	2	18	2		2020-05-25 10:07:38.092201	2020-05-25 10:07:38.092201
6103	13	18	2		2020-05-25 10:07:38.102867	2020-05-25 10:07:38.102867
6104	26	18	2		2020-05-25 10:07:38.108296	2020-05-25 10:07:38.108296
6105	94	18	4		2020-05-25 10:07:38.118427	2020-05-25 10:07:38.118427
6106	79	18	5		2020-05-25 10:07:38.126759	2020-05-25 10:07:38.126759
6107	10	18	0		2020-05-25 10:07:38.135525	2020-05-25 10:07:38.135525
6108	15	18	4		2020-05-25 10:07:38.140996	2020-05-25 10:07:38.140996
6109	53	18	3		2020-05-25 10:07:38.151414	2020-05-25 10:07:38.151414
6110	97	18	5		2020-05-25 10:07:38.159884	2020-05-25 10:07:38.159884
6111	71	18	5		2020-05-25 10:07:38.168422	2020-05-25 10:07:38.168422
6112	19	18	5		2020-05-25 10:07:38.174041	2020-05-25 10:07:38.174041
6113	73	18	3		2020-05-25 10:07:38.1844	2020-05-25 10:07:38.1844
6114	9	18	2		2020-05-25 10:07:38.192891	2020-05-25 10:07:38.192891
6115	98	18	3		2020-05-25 10:07:38.202208	2020-05-25 10:07:38.202208
6116	27	18	0		2020-05-25 10:07:38.207536	2020-05-25 10:07:38.207536
6117	4	18	3		2020-05-25 10:07:38.217941	2020-05-25 10:07:38.217941
6118	30	18	2		2020-05-25 10:07:38.226833	2020-05-25 10:07:38.226833
6119	92	19	1		2020-05-25 10:07:38.23596	2020-05-25 10:07:38.23596
6120	28	19	1		2020-05-25 10:07:38.2416	2020-05-25 10:07:38.2416
6121	88	19	3		2020-05-25 10:07:38.253643	2020-05-25 10:07:38.253643
6122	99	19	3		2020-05-25 10:07:38.26135	2020-05-25 10:07:38.26135
6123	86	19	1		2020-05-25 10:07:38.272769	2020-05-25 10:07:38.272769
6124	25	19	2		2020-05-25 10:07:38.280658	2020-05-25 10:07:38.280658
6125	79	19	3		2020-05-25 10:07:38.291584	2020-05-25 10:07:38.291584
6126	7	19	0		2020-05-25 10:07:38.299997	2020-05-25 10:07:38.299997
6127	20	19	5		2020-05-25 10:07:38.30877	2020-05-25 10:07:38.30877
6128	22	19	3		2020-05-25 10:07:38.317416	2020-05-25 10:07:38.317416
6129	9	19	1		2020-05-25 10:07:38.326395	2020-05-25 10:07:38.326395
6130	66	19	4		2020-05-25 10:07:38.33544	2020-05-25 10:07:38.33544
6131	59	19	4		2020-05-25 10:07:38.342768	2020-05-25 10:07:38.342768
6132	8	19	1		2020-05-25 10:07:38.355036	2020-05-25 10:07:38.355036
6133	24	19	3		2020-05-25 10:07:38.363434	2020-05-25 10:07:38.363434
6134	69	19	3		2020-05-25 10:07:38.370289	2020-05-25 10:07:38.370289
6135	75	19	0		2020-05-25 10:07:38.378305	2020-05-25 10:07:38.378305
6136	76	19	0		2020-05-25 10:07:38.388226	2020-05-25 10:07:38.388226
6137	55	19	4		2020-05-25 10:07:38.396946	2020-05-25 10:07:38.396946
6138	78	19	4		2020-05-25 10:07:38.40334	2020-05-25 10:07:38.40334
6139	1	19	0		2020-05-25 10:07:38.411147	2020-05-25 10:07:38.411147
6140	32	19	0		2020-05-25 10:07:38.422908	2020-05-25 10:07:38.422908
6141	5	19	4		2020-05-25 10:07:38.431581	2020-05-25 10:07:38.431581
6142	45	19	4		2020-05-25 10:07:38.438627	2020-05-25 10:07:38.438627
6143	37	19	5		2020-05-25 10:07:38.447726	2020-05-25 10:07:38.447726
6144	0	19	2		2020-05-25 10:07:38.455974	2020-05-25 10:07:38.455974
6145	67	19	1		2020-05-25 10:07:38.462653	2020-05-25 10:07:38.462653
6146	52	19	4		2020-05-25 10:07:38.469728	2020-05-25 10:07:38.469728
6147	49	19	5		2020-05-25 10:07:38.47797	2020-05-25 10:07:38.47797
6148	42	19	4		2020-05-25 10:07:38.488995	2020-05-25 10:07:38.488995
6149	15	19	2		2020-05-25 10:07:38.498217	2020-05-25 10:07:38.498217
6150	21	19	0		2020-05-25 10:07:38.505075	2020-05-25 10:07:38.505075
6151	12	19	5		2020-05-25 10:07:38.513602	2020-05-25 10:07:38.513602
6152	51	19	0		2020-05-25 10:07:38.522997	2020-05-25 10:07:38.522997
6153	53	19	5		2020-05-25 10:07:38.533138	2020-05-25 10:07:38.533138
6154	77	19	1		2020-05-25 10:07:38.541545	2020-05-25 10:07:38.541545
6155	4	19	4		2020-05-25 10:07:38.54957	2020-05-25 10:07:38.54957
6156	73	19	0		2020-05-25 10:07:38.559272	2020-05-25 10:07:38.559272
6157	81	19	5		2020-05-25 10:07:38.567423	2020-05-25 10:07:38.567423
6158	83	19	0		2020-05-25 10:07:38.575997	2020-05-25 10:07:38.575997
6159	85	19	4		2020-05-25 10:07:38.584222	2020-05-25 10:07:38.584222
6160	65	19	5		2020-05-25 10:07:38.591162	2020-05-25 10:07:38.591162
6161	96	19	4		2020-05-25 10:07:38.600079	2020-05-25 10:07:38.600079
6162	61	19	3		2020-05-25 10:07:38.606648	2020-05-25 10:07:38.606648
6163	6	19	1		2020-05-25 10:07:38.616786	2020-05-25 10:07:38.616786
6164	18	19	4		2020-05-25 10:07:38.624057	2020-05-25 10:07:38.624057
6165	54	19	4		2020-05-25 10:07:38.632117	2020-05-25 10:07:38.632117
6166	17	19	3		2020-05-25 10:07:38.637921	2020-05-25 10:07:38.637921
6167	95	19	2		2020-05-25 10:07:38.647809	2020-05-25 10:07:38.647809
6168	30	19	3		2020-05-25 10:07:38.655858	2020-05-25 10:07:38.655858
6169	90	19	2		2020-05-25 10:07:38.662481	2020-05-25 10:07:38.662481
6170	35	19	0		2020-05-25 10:07:38.668913	2020-05-25 10:07:38.668913
6171	19	19	2		2020-05-25 10:07:38.676927	2020-05-25 10:07:38.676927
6172	50	19	0		2020-05-25 10:07:38.682711	2020-05-25 10:07:38.682711
6173	14	19	3		2020-05-25 10:07:38.690085	2020-05-25 10:07:38.690085
6174	47	19	1		2020-05-25 10:07:38.699238	2020-05-25 10:07:38.699238
6175	31	19	2		2020-05-25 10:07:38.705026	2020-05-25 10:07:38.705026
6176	70	19	5		2020-05-25 10:07:38.714325	2020-05-25 10:07:38.714325
6177	60	19	5		2020-05-25 10:07:38.72221	2020-05-25 10:07:38.72221
6178	16	19	1		2020-05-25 10:07:38.730587	2020-05-25 10:07:38.730587
6179	93	19	4		2020-05-25 10:07:38.736553	2020-05-25 10:07:38.736553
6180	62	19	3		2020-05-25 10:07:38.747406	2020-05-25 10:07:38.747406
6181	40	19	3		2020-05-25 10:07:38.755368	2020-05-25 10:07:38.755368
6182	80	19	2		2020-05-25 10:07:38.761989	2020-05-25 10:07:38.761989
6183	71	19	5		2020-05-25 10:07:38.768587	2020-05-25 10:07:38.768587
6184	13	19	2		2020-05-25 10:07:38.776914	2020-05-25 10:07:38.776914
6185	39	19	3		2020-05-25 10:07:38.783407	2020-05-25 10:07:38.783407
6186	33	19	2		2020-05-25 10:07:38.790192	2020-05-25 10:07:38.790192
6187	29	19	0		2020-05-25 10:07:38.798927	2020-05-25 10:07:38.798927
6188	3	19	3		2020-05-25 10:07:38.804689	2020-05-25 10:07:38.804689
6189	94	19	0		2020-05-25 10:07:38.813747	2020-05-25 10:07:38.813747
6190	38	19	1		2020-05-25 10:07:38.821954	2020-05-25 10:07:38.821954
6191	68	19	5		2020-05-25 10:07:38.82849	2020-05-25 10:07:38.82849
6192	23	19	0		2020-05-25 10:07:38.835166	2020-05-25 10:07:38.835166
6193	57	19	0		2020-05-25 10:07:38.84355	2020-05-25 10:07:38.84355
6194	44	19	5		2020-05-25 10:07:38.85432	2020-05-25 10:07:38.85432
6195	97	19	3		2020-05-25 10:07:38.863252	2020-05-25 10:07:38.863252
6196	48	19	4		2020-05-25 10:07:38.869676	2020-05-25 10:07:38.869676
6197	26	19	1		2020-05-25 10:07:38.877456	2020-05-25 10:07:38.877456
6198	34	19	2		2020-05-25 10:07:38.887813	2020-05-25 10:07:38.887813
6199	10	19	1		2020-05-25 10:07:38.895731	2020-05-25 10:07:38.895731
6200	27	19	0		2020-05-25 10:07:38.90248	2020-05-25 10:07:38.90248
6201	63	19	0		2020-05-25 10:07:38.91051	2020-05-25 10:07:38.91051
6202	87	19	0		2020-05-25 10:07:38.920634	2020-05-25 10:07:38.920634
6203	58	19	0		2020-05-25 10:07:38.925076	2020-05-25 10:07:38.925076
6204	46	19	3		2020-05-25 10:07:38.934783	2020-05-25 10:07:38.934783
6205	56	19	0		2020-05-25 10:07:38.942141	2020-05-25 10:07:38.942141
6206	82	19	3		2020-05-25 10:07:38.950644	2020-05-25 10:07:38.950644
6207	98	19	4		2020-05-25 10:07:38.957223	2020-05-25 10:07:38.957223
6208	91	19	1		2020-05-25 10:07:38.965776	2020-05-25 10:07:38.965776
6209	24	20	3		2020-05-25 10:07:38.971572	2020-05-25 10:07:38.971572
6210	47	20	5		2020-05-25 10:07:38.981191	2020-05-25 10:07:38.981191
6211	64	20	2		2020-05-25 10:07:38.989287	2020-05-25 10:07:38.989287
6212	53	20	3		2020-05-25 10:07:38.997433	2020-05-25 10:07:38.997433
6213	18	20	0		2020-05-25 10:07:39.003454	2020-05-25 10:07:39.003454
6214	66	20	0		2020-05-25 10:07:39.01381	2020-05-25 10:07:39.01381
6215	8	20	0		2020-05-25 10:07:39.022476	2020-05-25 10:07:39.022476
6216	65	20	0		2020-05-25 10:07:39.032258	2020-05-25 10:07:39.032258
6217	46	20	2		2020-05-25 10:07:39.038185	2020-05-25 10:07:39.038185
6218	56	20	1		2020-05-25 10:07:39.048224	2020-05-25 10:07:39.048224
6219	45	20	0		2020-05-25 10:07:39.056275	2020-05-25 10:07:39.056275
6220	20	20	2		2020-05-25 10:07:39.066285	2020-05-25 10:07:39.066285
6221	31	20	0		2020-05-25 10:07:39.072261	2020-05-25 10:07:39.072261
6222	78	20	0		2020-05-25 10:07:39.082025	2020-05-25 10:07:39.082025
6223	91	20	1		2020-05-25 10:07:39.089813	2020-05-25 10:07:39.089813
6224	59	20	4		2020-05-25 10:07:39.099925	2020-05-25 10:07:39.099925
6225	12	20	0		2020-05-25 10:07:39.106455	2020-05-25 10:07:39.106455
6226	85	20	2		2020-05-25 10:07:39.11729	2020-05-25 10:07:39.11729
6227	72	20	1		2020-05-25 10:07:39.124065	2020-05-25 10:07:39.124065
6228	36	20	2		2020-05-25 10:07:39.131554	2020-05-25 10:07:39.131554
6229	39	20	0		2020-05-25 10:07:39.137407	2020-05-25 10:07:39.137407
6230	88	20	4		2020-05-25 10:07:39.147393	2020-05-25 10:07:39.147393
6231	28	20	2		2020-05-25 10:07:39.155427	2020-05-25 10:07:39.155427
6232	9	20	0		2020-05-25 10:07:39.163848	2020-05-25 10:07:39.163848
6233	87	20	3		2020-05-25 10:07:39.169978	2020-05-25 10:07:39.169978
6234	97	20	5		2020-05-25 10:07:39.178287	2020-05-25 10:07:39.178287
6235	84	20	2		2020-05-25 10:07:39.188921	2020-05-25 10:07:39.188921
6236	76	20	2		2020-05-25 10:07:39.19664	2020-05-25 10:07:39.19664
6237	3	20	2		2020-05-25 10:07:39.203347	2020-05-25 10:07:39.203347
6238	35	20	3		2020-05-25 10:07:39.211035	2020-05-25 10:07:39.211035
6239	94	20	2		2020-05-25 10:07:39.221306	2020-05-25 10:07:39.221306
6240	14	20	1		2020-05-25 10:07:39.229536	2020-05-25 10:07:39.229536
6241	19	20	4		2020-05-25 10:07:39.235737	2020-05-25 10:07:39.235737
6242	73	20	0		2020-05-25 10:07:39.243743	2020-05-25 10:07:39.243743
6243	21	20	1		2020-05-25 10:07:39.250109	2020-05-25 10:07:39.250109
6244	62	20	2		2020-05-25 10:07:39.257009	2020-05-25 10:07:39.257009
6245	81	20	3		2020-05-25 10:07:39.266566	2020-05-25 10:07:39.266566
6246	96	20	4		2020-05-25 10:07:39.272783	2020-05-25 10:07:39.272783
6247	57	20	4		2020-05-25 10:07:39.299989	2020-05-25 10:07:39.299989
6248	4	20	5		2020-05-25 10:07:39.306252	2020-05-25 10:07:39.306252
6249	16	20	2		2020-05-25 10:07:39.316656	2020-05-25 10:07:39.316656
6250	26	20	0		2020-05-25 10:07:39.323464	2020-05-25 10:07:39.323464
6251	2	20	2		2020-05-25 10:07:39.332113	2020-05-25 10:07:39.332113
6252	99	20	2		2020-05-25 10:07:39.338533	2020-05-25 10:07:39.338533
6253	1	20	4		2020-05-25 10:07:39.347945	2020-05-25 10:07:39.347945
6254	0	20	0		2020-05-25 10:07:39.355982	2020-05-25 10:07:39.355982
6255	22	20	4		2020-05-25 10:07:39.363881	2020-05-25 10:07:39.363881
6256	23	20	3		2020-05-25 10:07:39.370113	2020-05-25 10:07:39.370113
6257	40	20	2		2020-05-25 10:07:39.381292	2020-05-25 10:07:39.381292
6258	77	21	3		2020-05-25 10:07:39.389123	2020-05-25 10:07:39.389123
6259	13	21	3		2020-05-25 10:07:39.396985	2020-05-25 10:07:39.396985
6260	65	21	5		2020-05-25 10:07:39.403208	2020-05-25 10:07:39.403208
6261	69	21	4		2020-05-25 10:07:39.410988	2020-05-25 10:07:39.410988
6262	63	21	0		2020-05-25 10:07:39.420842	2020-05-25 10:07:39.420842
6263	76	21	0		2020-05-25 10:07:39.425092	2020-05-25 10:07:39.425092
6264	98	21	3		2020-05-25 10:07:39.435212	2020-05-25 10:07:39.435212
6265	74	21	2		2020-05-25 10:07:39.443109	2020-05-25 10:07:39.443109
6266	35	21	1		2020-05-25 10:07:39.450558	2020-05-25 10:07:39.450558
6267	11	21	2		2020-05-25 10:07:39.457684	2020-05-25 10:07:39.457684
6268	6	21	3		2020-05-25 10:07:39.465471	2020-05-25 10:07:39.465471
6269	32	21	3		2020-05-25 10:07:39.471604	2020-05-25 10:07:39.471604
6270	22	21	0		2020-05-25 10:07:39.481821	2020-05-25 10:07:39.481821
6271	58	21	2		2020-05-25 10:07:39.4897	2020-05-25 10:07:39.4897
6272	82	21	0		2020-05-25 10:07:39.500414	2020-05-25 10:07:39.500414
6273	26	21	4		2020-05-25 10:07:39.507075	2020-05-25 10:07:39.507075
6274	19	21	1		2020-05-25 10:07:39.518554	2020-05-25 10:07:39.518554
6275	36	21	4		2020-05-25 10:07:39.524844	2020-05-25 10:07:39.524844
6276	31	21	3		2020-05-25 10:07:39.53441	2020-05-25 10:07:39.53441
6277	49	21	0		2020-05-25 10:07:39.54215	2020-05-25 10:07:39.54215
6278	54	21	5		2020-05-25 10:07:39.550084	2020-05-25 10:07:39.550084
6279	27	21	5		2020-05-25 10:07:39.557279	2020-05-25 10:07:39.557279
6280	53	21	0		2020-05-25 10:07:39.566532	2020-05-25 10:07:39.566532
6281	42	21	5		2020-05-25 10:07:39.573075	2020-05-25 10:07:39.573075
6282	33	21	0		2020-05-25 10:07:39.580618	2020-05-25 10:07:39.580618
6283	86	21	3		2020-05-25 10:07:39.588896	2020-05-25 10:07:39.588896
6284	48	21	0		2020-05-25 10:07:39.596895	2020-05-25 10:07:39.596895
6285	57	21	4		2020-05-25 10:07:39.603015	2020-05-25 10:07:39.603015
6286	8	21	0		2020-05-25 10:07:39.611014	2020-05-25 10:07:39.611014
6287	93	21	0		2020-05-25 10:07:39.620814	2020-05-25 10:07:39.620814
6288	89	21	2		2020-05-25 10:07:39.625576	2020-05-25 10:07:39.625576
6289	10	21	0		2020-05-25 10:07:39.635738	2020-05-25 10:07:39.635738
6290	55	21	4		2020-05-25 10:07:39.64393	2020-05-25 10:07:39.64393
6291	59	21	4		2020-05-25 10:07:39.654781	2020-05-25 10:07:39.654781
6292	75	21	2		2020-05-25 10:07:39.663876	2020-05-25 10:07:39.663876
6293	14	21	3		2020-05-25 10:07:39.670586	2020-05-25 10:07:39.670586
6294	50	21	5		2020-05-25 10:07:39.681574	2020-05-25 10:07:39.681574
6295	61	21	2		2020-05-25 10:07:39.687597	2020-05-25 10:07:39.687597
6296	85	21	4		2020-05-25 10:07:39.698885	2020-05-25 10:07:39.698885
6297	91	21	3		2020-05-25 10:07:39.707559	2020-05-25 10:07:39.707559
6298	25	21	2		2020-05-25 10:07:39.71666	2020-05-25 10:07:39.71666
6299	87	21	2		2020-05-25 10:07:39.723334	2020-05-25 10:07:39.723334
6300	20	21	5		2020-05-25 10:07:39.733943	2020-05-25 10:07:39.733943
6301	47	21	4		2020-05-25 10:07:39.740835	2020-05-25 10:07:39.740835
6302	97	21	1		2020-05-25 10:07:39.748291	2020-05-25 10:07:39.748291
6303	24	21	3		2020-05-25 10:07:39.754631	2020-05-25 10:07:39.754631
6304	83	21	0		2020-05-25 10:07:39.76503	2020-05-25 10:07:39.76503
6305	48	22	2		2020-05-25 10:07:39.773162	2020-05-25 10:07:39.773162
6306	94	22	3		2020-05-25 10:07:39.781994	2020-05-25 10:07:39.781994
6307	61	22	2		2020-05-25 10:07:39.788099	2020-05-25 10:07:39.788099
6308	24	22	5		2020-05-25 10:07:39.797867	2020-05-25 10:07:39.797867
6309	85	22	4		2020-05-25 10:07:39.805771	2020-05-25 10:07:39.805771
6310	32	22	5		2020-05-25 10:07:39.812199	2020-05-25 10:07:39.812199
6311	25	22	5		2020-05-25 10:07:39.818538	2020-05-25 10:07:39.818538
6312	23	22	4		2020-05-25 10:07:39.827149	2020-05-25 10:07:39.827149
6313	51	22	0		2020-05-25 10:07:39.837649	2020-05-25 10:07:39.837649
6314	95	22	1		2020-05-25 10:07:39.84591	2020-05-25 10:07:39.84591
6315	93	22	4		2020-05-25 10:07:39.852193	2020-05-25 10:07:39.852193
6316	31	22	3		2020-05-25 10:07:39.860298	2020-05-25 10:07:39.860298
6317	68	22	1		2020-05-25 10:07:39.867039	2020-05-25 10:07:39.867039
6318	82	22	2		2020-05-25 10:07:39.87376	2020-05-25 10:07:39.87376
6319	13	22	0		2020-05-25 10:07:39.88099	2020-05-25 10:07:39.88099
6320	98	22	0		2020-05-25 10:07:39.887029	2020-05-25 10:07:39.887029
6321	6	22	2		2020-05-25 10:07:39.897434	2020-05-25 10:07:39.897434
6322	91	22	4		2020-05-25 10:07:39.905558	2020-05-25 10:07:39.905558
6323	99	22	4		2020-05-25 10:07:39.913721	2020-05-25 10:07:39.913721
6324	54	22	1		2020-05-25 10:07:39.920065	2020-05-25 10:07:39.920065
6325	52	22	2		2020-05-25 10:07:39.928081	2020-05-25 10:07:39.928081
6326	88	22	1		2020-05-25 10:07:39.938261	2020-05-25 10:07:39.938261
6327	64	22	0		2020-05-25 10:07:39.94596	2020-05-25 10:07:39.94596
6328	76	22	2		2020-05-25 10:07:39.952573	2020-05-25 10:07:39.952573
6329	62	22	2		2020-05-25 10:07:39.960463	2020-05-25 10:07:39.960463
6330	1	22	3		2020-05-25 10:07:39.97161	2020-05-25 10:07:39.97161
6331	30	22	3		2020-05-25 10:07:39.979841	2020-05-25 10:07:39.979841
6332	75	23	0		2020-05-25 10:07:39.986251	2020-05-25 10:07:39.986251
6333	39	23	0		2020-05-25 10:07:39.994293	2020-05-25 10:07:39.994293
6334	19	23	3		2020-05-25 10:07:40.004914	2020-05-25 10:07:40.004914
6335	73	23	3		2020-05-25 10:07:40.012955	2020-05-25 10:07:40.012955
6336	85	23	0		2020-05-25 10:07:40.019718	2020-05-25 10:07:40.019718
6337	63	23	1		2020-05-25 10:07:40.027869	2020-05-25 10:07:40.027869
6338	64	23	0		2020-05-25 10:07:40.038254	2020-05-25 10:07:40.038254
6339	1	23	3		2020-05-25 10:07:40.047217	2020-05-25 10:07:40.047217
6340	56	23	1		2020-05-25 10:07:40.053555	2020-05-25 10:07:40.053555
6341	97	23	0		2020-05-25 10:07:40.061366	2020-05-25 10:07:40.061366
6342	36	23	0		2020-05-25 10:07:40.071369	2020-05-25 10:07:40.071369
6343	12	23	1		2020-05-25 10:07:40.080191	2020-05-25 10:07:40.080191
6344	13	23	1		2020-05-25 10:07:40.086585	2020-05-25 10:07:40.086585
6345	46	23	4		2020-05-25 10:07:40.094276	2020-05-25 10:07:40.094276
6346	38	23	0		2020-05-25 10:07:40.105096	2020-05-25 10:07:40.105096
6347	47	23	0		2020-05-25 10:07:40.113588	2020-05-25 10:07:40.113588
6348	28	23	0		2020-05-25 10:07:40.119894	2020-05-25 10:07:40.119894
6349	99	23	1		2020-05-25 10:07:40.127775	2020-05-25 10:07:40.127775
6350	30	23	0		2020-05-25 10:07:40.137694	2020-05-25 10:07:40.137694
6351	89	23	0		2020-05-25 10:07:40.146676	2020-05-25 10:07:40.146676
6352	51	23	3		2020-05-25 10:07:40.152663	2020-05-25 10:07:40.152663
6353	34	23	2		2020-05-25 10:07:40.160537	2020-05-25 10:07:40.160537
6354	7	23	5		2020-05-25 10:07:40.171236	2020-05-25 10:07:40.171236
6355	67	23	5		2020-05-25 10:07:40.179339	2020-05-25 10:07:40.179339
6356	11	23	0		2020-05-25 10:07:40.186108	2020-05-25 10:07:40.186108
6357	37	23	0		2020-05-25 10:07:40.194284	2020-05-25 10:07:40.194284
6358	0	23	0		2020-05-25 10:07:40.202868	2020-05-25 10:07:40.202868
6359	84	23	5		2020-05-25 10:07:40.209703	2020-05-25 10:07:40.209703
6360	27	24	2		2020-05-25 10:07:40.219262	2020-05-25 10:07:40.219262
6361	90	24	1		2020-05-25 10:07:40.227184	2020-05-25 10:07:40.227184
6362	5	24	4		2020-05-25 10:07:40.234266	2020-05-25 10:07:40.234266
6363	26	24	5		2020-05-25 10:07:40.240156	2020-05-25 10:07:40.240156
6364	17	24	1		2020-05-25 10:07:40.250913	2020-05-25 10:07:40.250913
6365	86	24	3		2020-05-25 10:07:40.257983	2020-05-25 10:07:40.257983
6366	22	24	2		2020-05-25 10:07:40.264837	2020-05-25 10:07:40.264837
6367	88	24	5		2020-05-25 10:07:40.271073	2020-05-25 10:07:40.271073
6368	44	24	5		2020-05-25 10:07:40.281551	2020-05-25 10:07:40.281551
6369	94	24	0		2020-05-25 10:07:40.28977	2020-05-25 10:07:40.28977
6370	36	24	5		2020-05-25 10:07:40.296698	2020-05-25 10:07:40.296698
6371	95	24	4		2020-05-25 10:07:40.302775	2020-05-25 10:07:40.302775
6372	50	24	0		2020-05-25 10:07:40.310786	2020-05-25 10:07:40.310786
6373	61	24	1		2020-05-25 10:07:40.320641	2020-05-25 10:07:40.320641
6374	81	24	2		2020-05-25 10:07:40.330134	2020-05-25 10:07:40.330134
6375	33	24	3		2020-05-25 10:07:40.336486	2020-05-25 10:07:40.336486
6376	42	24	0		2020-05-25 10:07:40.344258	2020-05-25 10:07:40.344258
6377	2	24	1		2020-05-25 10:07:40.353982	2020-05-25 10:07:40.353982
6378	48	24	2		2020-05-25 10:07:40.362954	2020-05-25 10:07:40.362954
6379	34	24	0		2020-05-25 10:07:40.369013	2020-05-25 10:07:40.369013
6380	32	24	0		2020-05-25 10:07:40.377137	2020-05-25 10:07:40.377137
6381	66	24	0		2020-05-25 10:07:40.388787	2020-05-25 10:07:40.388787
6382	87	24	2		2020-05-25 10:07:40.397483	2020-05-25 10:07:40.397483
6383	83	25	2		2020-05-25 10:07:40.404107	2020-05-25 10:07:40.404107
6384	23	25	3		2020-05-25 10:07:40.414318	2020-05-25 10:07:40.414318
6385	86	25	4		2020-05-25 10:07:40.423304	2020-05-25 10:07:40.423304
6386	90	25	1		2020-05-25 10:07:40.430941	2020-05-25 10:07:40.430941
6387	17	25	2		2020-05-25 10:07:40.43714	2020-05-25 10:07:40.43714
6388	96	25	0		2020-05-25 10:07:40.447904	2020-05-25 10:07:40.447904
6389	22	25	5		2020-05-25 10:07:40.456004	2020-05-25 10:07:40.456004
6390	81	25	2		2020-05-25 10:07:40.463002	2020-05-25 10:07:40.463002
6391	68	25	5		2020-05-25 10:07:40.46927	2020-05-25 10:07:40.46927
6392	57	25	1		2020-05-25 10:07:40.477253	2020-05-25 10:07:40.477253
6393	54	25	2		2020-05-25 10:07:40.487585	2020-05-25 10:07:40.487585
6394	30	25	3		2020-05-25 10:07:40.497609	2020-05-25 10:07:40.497609
6395	58	25	0		2020-05-25 10:07:40.503568	2020-05-25 10:07:40.503568
6396	71	25	4		2020-05-25 10:07:40.514247	2020-05-25 10:07:40.514247
6397	94	25	3		2020-05-25 10:07:40.523176	2020-05-25 10:07:40.523176
6398	99	25	2		2020-05-25 10:07:40.529273	2020-05-25 10:07:40.529273
6399	65	25	1		2020-05-25 10:07:40.535674	2020-05-25 10:07:40.535674
6400	82	25	0		2020-05-25 10:07:40.544162	2020-05-25 10:07:40.544162
6401	32	25	2		2020-05-25 10:07:40.554008	2020-05-25 10:07:40.554008
6402	11	25	5		2020-05-25 10:07:40.563049	2020-05-25 10:07:40.563049
6403	47	25	3		2020-05-25 10:07:40.590784	2020-05-25 10:07:40.590784
6404	16	25	3		2020-05-25 10:07:40.598882	2020-05-25 10:07:40.598882
6405	64	25	2		2020-05-25 10:07:40.604774	2020-05-25 10:07:40.604774
6406	53	25	4		2020-05-25 10:07:40.614291	2020-05-25 10:07:40.614291
6407	85	25	2		2020-05-25 10:07:40.622273	2020-05-25 10:07:40.622273
6408	19	25	0		2020-05-25 10:07:40.628843	2020-05-25 10:07:40.628843
6409	13	25	2		2020-05-25 10:07:40.635333	2020-05-25 10:07:40.635333
6410	79	25	1		2020-05-25 10:07:40.643384	2020-05-25 10:07:40.643384
6411	39	25	0		2020-05-25 10:07:40.648848	2020-05-25 10:07:40.648848
6412	29	25	3		2020-05-25 10:07:40.656424	2020-05-25 10:07:40.656424
6413	38	25	4		2020-05-25 10:07:40.665024	2020-05-25 10:07:40.665024
6414	1	25	2		2020-05-25 10:07:40.670988	2020-05-25 10:07:40.670988
6415	44	25	0		2020-05-25 10:07:40.680862	2020-05-25 10:07:40.680862
6416	91	25	5		2020-05-25 10:07:40.688851	2020-05-25 10:07:40.688851
6417	6	25	4		2020-05-25 10:07:40.696441	2020-05-25 10:07:40.696441
6418	9	25	1		2020-05-25 10:07:40.703383	2020-05-25 10:07:40.703383
6419	18	25	5		2020-05-25 10:07:40.714271	2020-05-25 10:07:40.714271
6420	4	25	0		2020-05-25 10:07:40.722657	2020-05-25 10:07:40.722657
6421	93	25	5		2020-05-25 10:07:40.729626	2020-05-25 10:07:40.729626
6422	75	25	0		2020-05-25 10:07:40.735938	2020-05-25 10:07:40.735938
6423	39	26	1		2020-05-25 10:07:40.744118	2020-05-25 10:07:40.744118
6424	64	26	4		2020-05-25 10:07:40.754361	2020-05-25 10:07:40.754361
6425	87	26	5		2020-05-25 10:07:40.763632	2020-05-25 10:07:40.763632
6426	59	26	2		2020-05-25 10:07:40.770111	2020-05-25 10:07:40.770111
6427	78	26	2		2020-05-25 10:07:40.780919	2020-05-25 10:07:40.780919
6428	5	26	0		2020-05-25 10:07:40.789026	2020-05-25 10:07:40.789026
6429	93	26	1		2020-05-25 10:07:40.795785	2020-05-25 10:07:40.795785
6430	26	26	1		2020-05-25 10:07:40.802239	2020-05-25 10:07:40.802239
6431	91	26	3		2020-05-25 10:07:40.81021	2020-05-25 10:07:40.81021
6432	67	26	3		2020-05-25 10:07:40.82096	2020-05-25 10:07:40.82096
6433	58	26	4		2020-05-25 10:07:40.829656	2020-05-25 10:07:40.829656
6434	99	26	2		2020-05-25 10:07:40.835882	2020-05-25 10:07:40.835882
6435	13	26	5		2020-05-25 10:07:40.844061	2020-05-25 10:07:40.844061
6436	27	26	4		2020-05-25 10:07:40.854205	2020-05-25 10:07:40.854205
6437	1	26	4		2020-05-25 10:07:40.862314	2020-05-25 10:07:40.862314
6438	70	26	4		2020-05-25 10:07:40.869033	2020-05-25 10:07:40.869033
6439	2	26	1		2020-05-25 10:07:40.87719	2020-05-25 10:07:40.87719
6440	20	26	1		2020-05-25 10:07:40.88746	2020-05-25 10:07:40.88746
6441	77	26	0		2020-05-25 10:07:40.896617	2020-05-25 10:07:40.896617
6442	17	26	3		2020-05-25 10:07:40.902904	2020-05-25 10:07:40.902904
6443	90	27	4		2020-05-25 10:07:40.910858	2020-05-25 10:07:40.910858
6444	56	27	1		2020-05-25 10:07:40.921058	2020-05-25 10:07:40.921058
6445	93	27	4		2020-05-25 10:07:40.929852	2020-05-25 10:07:40.929852
6446	21	27	3		2020-05-25 10:07:40.936176	2020-05-25 10:07:40.936176
6447	96	27	1		2020-05-25 10:07:40.94387	2020-05-25 10:07:40.94387
6448	9	27	1		2020-05-25 10:07:40.954342	2020-05-25 10:07:40.954342
6449	12	27	5		2020-05-25 10:07:40.962576	2020-05-25 10:07:40.962576
6450	44	27	4		2020-05-25 10:07:40.968913	2020-05-25 10:07:40.968913
6451	28	27	2		2020-05-25 10:07:40.977127	2020-05-25 10:07:40.977127
6452	49	27	1		2020-05-25 10:07:40.987522	2020-05-25 10:07:40.987522
6453	14	27	5		2020-05-25 10:07:40.997939	2020-05-25 10:07:40.997939
6454	73	27	1		2020-05-25 10:07:41.003888	2020-05-25 10:07:41.003888
6455	86	27	0		2020-05-25 10:07:41.014088	2020-05-25 10:07:41.014088
6456	65	27	4		2020-05-25 10:07:41.023295	2020-05-25 10:07:41.023295
6457	19	27	3		2020-05-25 10:07:41.032318	2020-05-25 10:07:41.032318
6458	46	27	0		2020-05-25 10:07:41.038388	2020-05-25 10:07:41.038388
6459	11	27	0		2020-05-25 10:07:41.046688	2020-05-25 10:07:41.046688
6460	22	27	2		2020-05-25 10:07:41.054918	2020-05-25 10:07:41.054918
6461	17	27	4		2020-05-25 10:07:41.063549	2020-05-25 10:07:41.063549
6462	37	27	4		2020-05-25 10:07:41.069587	2020-05-25 10:07:41.069587
6463	91	27	3		2020-05-25 10:07:41.077649	2020-05-25 10:07:41.077649
6464	72	27	1		2020-05-25 10:07:41.087528	2020-05-25 10:07:41.087528
6465	70	27	2		2020-05-25 10:07:41.096375	2020-05-25 10:07:41.096375
6466	69	27	0		2020-05-25 10:07:41.102703	2020-05-25 10:07:41.102703
6467	48	27	1		2020-05-25 10:07:41.110426	2020-05-25 10:07:41.110426
6468	57	27	2		2020-05-25 10:07:41.120736	2020-05-25 10:07:41.120736
6469	3	27	5		2020-05-25 10:07:41.129094	2020-05-25 10:07:41.129094
6470	35	27	5		2020-05-25 10:07:41.135341	2020-05-25 10:07:41.135341
6471	8	27	1		2020-05-25 10:07:41.143616	2020-05-25 10:07:41.143616
6472	39	27	3		2020-05-25 10:07:41.150029	2020-05-25 10:07:41.150029
6473	27	27	3		2020-05-25 10:07:41.156794	2020-05-25 10:07:41.156794
6474	7	27	1		2020-05-25 10:07:41.165421	2020-05-25 10:07:41.165421
6475	15	27	0		2020-05-25 10:07:41.171641	2020-05-25 10:07:41.171641
6476	36	27	5		2020-05-25 10:07:41.181993	2020-05-25 10:07:41.181993
6477	60	27	4		2020-05-25 10:07:41.190023	2020-05-25 10:07:41.190023
6478	29	27	0		2020-05-25 10:07:41.198712	2020-05-25 10:07:41.198712
6479	87	27	1		2020-05-25 10:07:41.20463	2020-05-25 10:07:41.20463
6480	42	27	5		2020-05-25 10:07:41.215426	2020-05-25 10:07:41.215426
6481	59	27	4		2020-05-25 10:07:41.223226	2020-05-25 10:07:41.223226
6482	30	27	5		2020-05-25 10:07:41.231975	2020-05-25 10:07:41.231975
6483	38	27	2		2020-05-25 10:07:41.237938	2020-05-25 10:07:41.237938
6484	68	27	0		2020-05-25 10:07:41.248092	2020-05-25 10:07:41.248092
6485	10	27	4		2020-05-25 10:07:41.256081	2020-05-25 10:07:41.256081
6486	85	27	1		2020-05-25 10:07:41.264158	2020-05-25 10:07:41.264158
6487	62	27	4		2020-05-25 10:07:41.270345	2020-05-25 10:07:41.270345
6488	13	27	0		2020-05-25 10:07:41.280951	2020-05-25 10:07:41.280951
6489	83	27	3		2020-05-25 10:07:41.288944	2020-05-25 10:07:41.288944
6490	61	27	2		2020-05-25 10:07:41.296873	2020-05-25 10:07:41.296873
6491	31	27	1		2020-05-25 10:07:41.302923	2020-05-25 10:07:41.302923
6492	66	27	3		2020-05-25 10:07:41.311069	2020-05-25 10:07:41.311069
6493	92	27	0		2020-05-25 10:07:41.321522	2020-05-25 10:07:41.321522
6494	97	27	4		2020-05-25 10:07:41.332715	2020-05-25 10:07:41.332715
6495	95	27	4		2020-05-25 10:07:41.33879	2020-05-25 10:07:41.33879
6496	41	27	1		2020-05-25 10:07:41.3505	2020-05-25 10:07:41.3505
6497	24	27	1		2020-05-25 10:07:41.357257	2020-05-25 10:07:41.357257
6498	94	27	3		2020-05-25 10:07:41.364542	2020-05-25 10:07:41.364542
6499	89	27	2		2020-05-25 10:07:41.370507	2020-05-25 10:07:41.370507
6500	25	27	2		2020-05-25 10:07:41.380736	2020-05-25 10:07:41.380736
6501	58	27	3		2020-05-25 10:07:41.388944	2020-05-25 10:07:41.388944
6502	99	27	1		2020-05-25 10:07:41.395551	2020-05-25 10:07:41.395551
6503	26	27	5		2020-05-25 10:07:41.402163	2020-05-25 10:07:41.402163
6504	82	27	2		2020-05-25 10:07:41.410408	2020-05-25 10:07:41.410408
6505	34	27	2		2020-05-25 10:07:41.420863	2020-05-25 10:07:41.420863
6506	74	27	3		2020-05-25 10:07:41.429437	2020-05-25 10:07:41.429437
6507	78	27	0		2020-05-25 10:07:41.435703	2020-05-25 10:07:41.435703
6508	43	27	0		2020-05-25 10:07:41.444293	2020-05-25 10:07:41.444293
6509	71	27	3		2020-05-25 10:07:41.451677	2020-05-25 10:07:41.451677
6510	77	27	3		2020-05-25 10:07:41.458336	2020-05-25 10:07:41.458336
6511	20	27	1		2020-05-25 10:07:41.46701	2020-05-25 10:07:41.46701
6512	88	27	0		2020-05-25 10:07:41.473427	2020-05-25 10:07:41.473427
6513	5	27	2		2020-05-25 10:07:41.484628	2020-05-25 10:07:41.484628
6514	84	27	3		2020-05-25 10:07:41.491322	2020-05-25 10:07:41.491322
6515	23	27	4		2020-05-25 10:07:41.502174	2020-05-25 10:07:41.502174
6516	63	27	4		2020-05-25 10:07:41.510322	2020-05-25 10:07:41.510322
6517	47	27	2		2020-05-25 10:07:41.521467	2020-05-25 10:07:41.521467
6518	33	27	4		2020-05-25 10:07:41.530316	2020-05-25 10:07:41.530316
6519	75	27	1		2020-05-25 10:07:41.536709	2020-05-25 10:07:41.536709
6520	18	27	1		2020-05-25 10:07:41.544717	2020-05-25 10:07:41.544717
6521	98	27	3		2020-05-25 10:07:41.554901	2020-05-25 10:07:41.554901
6522	51	27	1		2020-05-25 10:07:41.562856	2020-05-25 10:07:41.562856
6523	76	27	2		2020-05-25 10:07:41.569285	2020-05-25 10:07:41.569285
6524	40	27	1		2020-05-25 10:07:41.577428	2020-05-25 10:07:41.577428
6525	80	27	4		2020-05-25 10:07:41.587379	2020-05-25 10:07:41.587379
6526	9	28	5		2020-05-25 10:07:41.595841	2020-05-25 10:07:41.595841
6527	99	28	2		2020-05-25 10:07:41.602302	2020-05-25 10:07:41.602302
6528	55	28	2		2020-05-25 10:07:41.610297	2020-05-25 10:07:41.610297
6529	7	28	3		2020-05-25 10:07:41.621076	2020-05-25 10:07:41.621076
6530	41	28	0		2020-05-25 10:07:41.62937	2020-05-25 10:07:41.62937
6531	73	28	4		2020-05-25 10:07:41.636171	2020-05-25 10:07:41.636171
6532	61	28	0		2020-05-25 10:07:41.647601	2020-05-25 10:07:41.647601
6533	29	28	1		2020-05-25 10:07:41.656374	2020-05-25 10:07:41.656374
6534	37	28	3		2020-05-25 10:07:41.66593	2020-05-25 10:07:41.66593
6535	72	28	3		2020-05-25 10:07:41.671982	2020-05-25 10:07:41.671982
6536	39	28	3		2020-05-25 10:07:41.680398	2020-05-25 10:07:41.680398
6537	8	28	2		2020-05-25 10:07:41.688228	2020-05-25 10:07:41.688228
6538	32	28	3		2020-05-25 10:07:41.695812	2020-05-25 10:07:41.695812
6539	0	28	1		2020-05-25 10:07:41.702282	2020-05-25 10:07:41.702282
6540	81	28	1		2020-05-25 10:07:41.710314	2020-05-25 10:07:41.710314
6541	87	28	5		2020-05-25 10:07:41.720458	2020-05-25 10:07:41.720458
6542	33	28	4		2020-05-25 10:07:41.729503	2020-05-25 10:07:41.729503
6543	12	28	1		2020-05-25 10:07:41.735815	2020-05-25 10:07:41.735815
6544	79	28	1		2020-05-25 10:07:41.743876	2020-05-25 10:07:41.743876
6545	62	28	0		2020-05-25 10:07:41.753572	2020-05-25 10:07:41.753572
6546	69	28	2		2020-05-25 10:07:41.758307	2020-05-25 10:07:41.758307
6547	28	28	2		2020-05-25 10:07:41.767498	2020-05-25 10:07:41.767498
6548	43	28	0		2020-05-25 10:07:41.774148	2020-05-25 10:07:41.774148
6549	58	28	0		2020-05-25 10:07:41.783416	2020-05-25 10:07:41.783416
6550	60	28	5		2020-05-25 10:07:41.790611	2020-05-25 10:07:41.790611
6551	51	28	0		2020-05-25 10:07:41.799418	2020-05-25 10:07:41.799418
6552	97	28	4		2020-05-25 10:07:41.805536	2020-05-25 10:07:41.805536
6553	54	28	0		2020-05-25 10:07:41.814577	2020-05-25 10:07:41.814577
6554	16	28	2		2020-05-25 10:07:41.822487	2020-05-25 10:07:41.822487
6555	24	28	2		2020-05-25 10:07:41.830097	2020-05-25 10:07:41.830097
6556	1	28	3		2020-05-25 10:07:41.83641	2020-05-25 10:07:41.83641
6557	98	28	2		2020-05-25 10:07:41.847324	2020-05-25 10:07:41.847324
6558	50	28	2		2020-05-25 10:07:41.874507	2020-05-25 10:07:41.874507
6559	93	28	1		2020-05-25 10:07:41.879386	2020-05-25 10:07:41.879386
6560	92	28	2		2020-05-25 10:07:41.885546	2020-05-25 10:07:41.885546
6561	91	28	3		2020-05-25 10:07:41.893952	2020-05-25 10:07:41.893952
6562	2	28	2		2020-05-25 10:07:41.900822	2020-05-25 10:07:41.900822
6563	80	28	2		2020-05-25 10:07:41.907757	2020-05-25 10:07:41.907757
6564	75	28	4		2020-05-25 10:07:41.91652	2020-05-25 10:07:41.91652
6565	83	28	1		2020-05-25 10:07:41.923106	2020-05-25 10:07:41.923106
6566	89	28	2		2020-05-25 10:07:41.933143	2020-05-25 10:07:41.933143
6567	95	28	5		2020-05-25 10:07:41.94005	2020-05-25 10:07:41.94005
6568	96	28	0		2020-05-25 10:07:41.948231	2020-05-25 10:07:41.948231
6569	40	28	2		2020-05-25 10:07:41.954512	2020-05-25 10:07:41.954512
6570	42	28	5		2020-05-25 10:07:41.964423	2020-05-25 10:07:41.964423
6571	66	28	1		2020-05-25 10:07:41.972484	2020-05-25 10:07:41.972484
6572	31	28	2		2020-05-25 10:07:41.978978	2020-05-25 10:07:41.978978
6573	47	28	0		2020-05-25 10:07:41.98534	2020-05-25 10:07:41.98534
6574	52	28	2		2020-05-25 10:07:41.99343	2020-05-25 10:07:41.99343
6575	74	28	2		2020-05-25 10:07:42.005293	2020-05-25 10:07:42.005293
6576	59	28	1		2020-05-25 10:07:42.013263	2020-05-25 10:07:42.013263
6577	14	28	0		2020-05-25 10:07:42.027418	2020-05-25 10:07:42.027418
6578	67	28	1		2020-05-25 10:07:42.032416	2020-05-25 10:07:42.032416
6579	4	28	5		2020-05-25 10:07:42.040024	2020-05-25 10:07:42.040024
6580	78	28	3		2020-05-25 10:07:42.049223	2020-05-25 10:07:42.049223
6581	46	28	2		2020-05-25 10:07:42.056719	2020-05-25 10:07:42.056719
6582	11	28	0		2020-05-25 10:07:42.066499	2020-05-25 10:07:42.066499
6583	64	28	2		2020-05-25 10:07:42.074656	2020-05-25 10:07:42.074656
6584	90	28	4		2020-05-25 10:07:42.083495	2020-05-25 10:07:42.083495
6585	21	28	0		2020-05-25 10:07:42.089634	2020-05-25 10:07:42.089634
6586	71	28	4		2020-05-25 10:07:42.10057	2020-05-25 10:07:42.10057
6587	3	28	5		2020-05-25 10:07:42.108961	2020-05-25 10:07:42.108961
6588	17	28	3		2020-05-25 10:07:42.142192	2020-05-25 10:07:42.142192
6589	82	28	2		2020-05-25 10:07:42.159861	2020-05-25 10:07:42.159861
6590	48	28	1		2020-05-25 10:07:42.167945	2020-05-25 10:07:42.167945
6591	44	28	2		2020-05-25 10:07:42.178819	2020-05-25 10:07:42.178819
6592	56	28	2		2020-05-25 10:07:42.188039	2020-05-25 10:07:42.188039
6593	5	28	3		2020-05-25 10:07:42.1945	2020-05-25 10:07:42.1945
6594	6	28	1		2020-05-25 10:07:42.204796	2020-05-25 10:07:42.204796
6595	84	28	0		2020-05-25 10:07:42.21338	2020-05-25 10:07:42.21338
6596	22	28	0		2020-05-25 10:07:42.222758	2020-05-25 10:07:42.222758
6597	76	28	1		2020-05-25 10:07:42.229486	2020-05-25 10:07:42.229486
6598	25	28	3		2020-05-25 10:07:42.240057	2020-05-25 10:07:42.240057
6599	45	28	1		2020-05-25 10:07:42.246976	2020-05-25 10:07:42.246976
6600	19	28	4		2020-05-25 10:07:42.255193	2020-05-25 10:07:42.255193
6601	10	28	0		2020-05-25 10:07:42.262589	2020-05-25 10:07:42.262589
6602	94	28	0		2020-05-25 10:07:42.269684	2020-05-25 10:07:42.269684
6603	70	28	2		2020-05-25 10:07:42.277731	2020-05-25 10:07:42.277731
6604	20	28	5		2020-05-25 10:07:42.28613	2020-05-25 10:07:42.28613
6605	68	28	3		2020-05-25 10:07:42.292791	2020-05-25 10:07:42.292791
6606	65	28	2		2020-05-25 10:07:42.299496	2020-05-25 10:07:42.299496
6607	30	28	3		2020-05-25 10:07:42.309599	2020-05-25 10:07:42.309599
6608	63	28	5		2020-05-25 10:07:42.319016	2020-05-25 10:07:42.319016
6609	85	28	5		2020-05-25 10:07:42.325468	2020-05-25 10:07:42.325468
6610	36	28	0		2020-05-25 10:07:42.331955	2020-05-25 10:07:42.331955
6611	53	28	2		2020-05-25 10:07:42.342978	2020-05-25 10:07:42.342978
6612	77	28	4		2020-05-25 10:07:42.347255	2020-05-25 10:07:42.347255
6613	38	28	0		2020-05-25 10:07:42.356951	2020-05-25 10:07:42.356951
6614	57	28	1		2020-05-25 10:07:42.364319	2020-05-25 10:07:42.364319
6615	15	28	4		2020-05-25 10:07:42.371455	2020-05-25 10:07:42.371455
6616	86	28	3		2020-05-25 10:07:42.378268	2020-05-25 10:07:42.378268
6617	35	28	3		2020-05-25 10:07:42.387896	2020-05-25 10:07:42.387896
6618	26	28	3		2020-05-25 10:07:42.395828	2020-05-25 10:07:42.395828
6619	27	28	2		2020-05-25 10:07:42.404565	2020-05-25 10:07:42.404565
6620	88	28	5		2020-05-25 10:07:42.411263	2020-05-25 10:07:42.411263
6621	34	28	5		2020-05-25 10:07:42.420143	2020-05-25 10:07:42.420143
6622	23	28	1		2020-05-25 10:07:42.428085	2020-05-25 10:07:42.428085
6623	74	29	3		2020-05-25 10:07:42.435937	2020-05-25 10:07:42.435937
6624	83	29	4		2020-05-25 10:07:42.442358	2020-05-25 10:07:42.442358
6625	36	29	2		2020-05-25 10:07:42.449925	2020-05-25 10:07:42.449925
6626	45	29	2		2020-05-25 10:07:42.460025	2020-05-25 10:07:42.460025
6627	23	29	2		2020-05-25 10:07:42.469025	2020-05-25 10:07:42.469025
6628	32	29	2		2020-05-25 10:07:42.474807	2020-05-25 10:07:42.474807
6629	53	29	5		2020-05-25 10:07:42.482033	2020-05-25 10:07:42.482033
6630	58	29	3		2020-05-25 10:07:42.492202	2020-05-25 10:07:42.492202
6631	24	29	4		2020-05-25 10:07:42.497157	2020-05-25 10:07:42.497157
6632	47	29	4		2020-05-25 10:07:42.508357	2020-05-25 10:07:42.508357
6633	94	29	3		2020-05-25 10:07:42.515313	2020-05-25 10:07:42.515313
6634	21	29	0		2020-05-25 10:07:42.525121	2020-05-25 10:07:42.525121
6635	87	29	3		2020-05-25 10:07:42.52982	2020-05-25 10:07:42.52982
6636	41	29	3		2020-05-25 10:07:42.53927	2020-05-25 10:07:42.53927
6637	71	29	1		2020-05-25 10:07:42.546877	2020-05-25 10:07:42.546877
6638	78	29	1		2020-05-25 10:07:42.555626	2020-05-25 10:07:42.555626
6639	67	29	1		2020-05-25 10:07:42.562963	2020-05-25 10:07:42.562963
6640	60	29	1		2020-05-25 10:07:42.571442	2020-05-25 10:07:42.571442
6641	48	29	4		2020-05-25 10:07:42.578725	2020-05-25 10:07:42.578725
6642	56	29	4		2020-05-25 10:07:42.587731	2020-05-25 10:07:42.587731
6643	98	29	5		2020-05-25 10:07:42.595984	2020-05-25 10:07:42.595984
6644	96	29	5		2020-05-25 10:07:42.602607	2020-05-25 10:07:42.602607
6645	12	29	5		2020-05-25 10:07:42.610609	2020-05-25 10:07:42.610609
6646	42	29	3		2020-05-25 10:07:42.619297	2020-05-25 10:07:42.619297
6647	18	29	2		2020-05-25 10:07:42.626787	2020-05-25 10:07:42.626787
6648	51	29	3		2020-05-25 10:07:42.63564	2020-05-25 10:07:42.63564
6649	99	29	0		2020-05-25 10:07:42.64407	2020-05-25 10:07:42.64407
6650	2	29	3		2020-05-25 10:07:42.652324	2020-05-25 10:07:42.652324
6651	54	29	2		2020-05-25 10:07:42.659017	2020-05-25 10:07:42.659017
6652	62	29	1		2020-05-25 10:07:42.665714	2020-05-25 10:07:42.665714
6653	6	29	4		2020-05-25 10:07:42.676604	2020-05-25 10:07:42.676604
6654	61	29	2		2020-05-25 10:07:42.685791	2020-05-25 10:07:42.685791
6655	30	29	0		2020-05-25 10:07:42.691963	2020-05-25 10:07:42.691963
6656	64	29	0		2020-05-25 10:07:42.698649	2020-05-25 10:07:42.698649
6657	59	29	0		2020-05-25 10:07:42.709293	2020-05-25 10:07:42.709293
6658	31	29	0		2020-05-25 10:07:42.713863	2020-05-25 10:07:42.713863
6659	8	29	3		2020-05-25 10:07:42.724086	2020-05-25 10:07:42.724086
6660	92	29	3		2020-05-25 10:07:42.731077	2020-05-25 10:07:42.731077
6661	68	29	3		2020-05-25 10:07:42.741045	2020-05-25 10:07:42.741045
6662	85	29	0		2020-05-25 10:07:42.748874	2020-05-25 10:07:42.748874
6663	37	29	3		2020-05-25 10:07:42.756646	2020-05-25 10:07:42.756646
6664	43	29	4		2020-05-25 10:07:42.763478	2020-05-25 10:07:42.763478
6665	19	29	3		2020-05-25 10:07:42.770833	2020-05-25 10:07:42.770833
6666	57	29	2		2020-05-25 10:07:42.777391	2020-05-25 10:07:42.777391
6667	55	29	0		2020-05-25 10:07:42.786843	2020-05-25 10:07:42.786843
6668	50	29	4		2020-05-25 10:07:42.79469	2020-05-25 10:07:42.79469
6669	7	29	4		2020-05-25 10:07:42.802433	2020-05-25 10:07:42.802433
6670	33	29	4		2020-05-25 10:07:42.808249	2020-05-25 10:07:42.808249
6671	49	29	0		2020-05-25 10:07:42.815327	2020-05-25 10:07:42.815327
6672	84	29	2		2020-05-25 10:07:42.825685	2020-05-25 10:07:42.825685
6673	1	29	1		2020-05-25 10:07:42.83036	2020-05-25 10:07:42.83036
6674	38	29	3		2020-05-25 10:07:42.839809	2020-05-25 10:07:42.839809
6675	22	29	1		2020-05-25 10:07:42.847245	2020-05-25 10:07:42.847245
6676	97	29	3		2020-05-25 10:07:42.854709	2020-05-25 10:07:42.854709
6677	89	29	2		2020-05-25 10:07:42.861024	2020-05-25 10:07:42.861024
6678	79	29	2		2020-05-25 10:07:42.869152	2020-05-25 10:07:42.869152
6679	28	29	1		2020-05-25 10:07:42.877433	2020-05-25 10:07:42.877433
6680	46	29	0		2020-05-25 10:07:42.885836	2020-05-25 10:07:42.885836
6681	86	29	3		2020-05-25 10:07:42.892138	2020-05-25 10:07:42.892138
6682	35	29	0		2020-05-25 10:07:42.898719	2020-05-25 10:07:42.898719
6683	3	29	2		2020-05-25 10:07:42.909408	2020-05-25 10:07:42.909408
6684	34	29	0		2020-05-25 10:07:42.913992	2020-05-25 10:07:42.913992
6685	9	29	4		2020-05-25 10:07:42.923047	2020-05-25 10:07:42.923047
6686	70	29	4		2020-05-25 10:07:42.930941	2020-05-25 10:07:42.930941
6687	27	29	4		2020-05-25 10:07:42.939669	2020-05-25 10:07:42.939669
6688	72	29	0		2020-05-25 10:07:42.947729	2020-05-25 10:07:42.947729
6689	41	30	0		2020-05-25 10:07:42.956223	2020-05-25 10:07:42.956223
6690	14	30	5		2020-05-25 10:07:42.962894	2020-05-25 10:07:42.962894
6691	37	30	2		2020-05-25 10:07:42.972104	2020-05-25 10:07:42.972104
6692	91	30	2		2020-05-25 10:07:42.980367	2020-05-25 10:07:42.980367
6693	57	30	0		2020-05-25 10:07:42.98903	2020-05-25 10:07:42.98903
6694	99	30	3		2020-05-25 10:07:42.995968	2020-05-25 10:07:42.995968
6695	46	30	3		2020-05-25 10:07:43.006621	2020-05-25 10:07:43.006621
6696	64	30	4		2020-05-25 10:07:43.014332	2020-05-25 10:07:43.014332
6697	24	30	4		2020-05-25 10:07:43.021647	2020-05-25 10:07:43.021647
6698	42	30	3		2020-05-25 10:07:43.028562	2020-05-25 10:07:43.028562
6699	25	30	4		2020-05-25 10:07:43.03708	2020-05-25 10:07:43.03708
6700	75	30	1		2020-05-25 10:07:43.045198	2020-05-25 10:07:43.045198
6701	80	30	4		2020-05-25 10:07:43.052979	2020-05-25 10:07:43.052979
6702	20	30	3		2020-05-25 10:07:43.061049	2020-05-25 10:07:43.061049
6703	55	30	4		2020-05-25 10:07:43.067956	2020-05-25 10:07:43.067956
6704	92	30	2		2020-05-25 10:07:43.073913	2020-05-25 10:07:43.073913
6705	15	30	3		2020-05-25 10:07:43.081367	2020-05-25 10:07:43.081367
6706	97	30	2		2020-05-25 10:07:43.088308	2020-05-25 10:07:43.088308
6707	2	30	3		2020-05-25 10:07:43.09504	2020-05-25 10:07:43.09504
6708	3	30	0		2020-05-25 10:07:43.104243	2020-05-25 10:07:43.104243
6709	28	30	4		2020-05-25 10:07:43.112258	2020-05-25 10:07:43.112258
6710	5	30	0		2020-05-25 10:07:43.118751	2020-05-25 10:07:43.118751
6711	87	30	5		2020-05-25 10:07:43.12458	2020-05-25 10:07:43.12458
6712	10	30	1		2020-05-25 10:07:43.132504	2020-05-25 10:07:43.132504
6713	79	30	4		2020-05-25 10:07:43.142549	2020-05-25 10:07:43.142549
6714	1	30	5		2020-05-25 10:07:43.16724	2020-05-25 10:07:43.16724
6715	61	30	3		2020-05-25 10:07:43.17478	2020-05-25 10:07:43.17478
6716	89	30	0		2020-05-25 10:07:43.180038	2020-05-25 10:07:43.180038
6717	32	30	1		2020-05-25 10:07:43.189893	2020-05-25 10:07:43.189893
6718	62	30	0		2020-05-25 10:07:43.197343	2020-05-25 10:07:43.197343
6719	23	30	4		2020-05-25 10:07:43.204452	2020-05-25 10:07:43.204452
6720	66	30	3		2020-05-25 10:07:43.211949	2020-05-25 10:07:43.211949
6721	44	30	2		2020-05-25 10:07:43.221111	2020-05-25 10:07:43.221111
6722	60	30	1		2020-05-25 10:07:43.229161	2020-05-25 10:07:43.229161
6723	9	30	2		2020-05-25 10:07:43.238451	2020-05-25 10:07:43.238451
6724	33	30	4		2020-05-25 10:07:43.246949	2020-05-25 10:07:43.246949
6725	85	30	0		2020-05-25 10:07:43.25561	2020-05-25 10:07:43.25561
6726	29	30	0		2020-05-25 10:07:43.26238	2020-05-25 10:07:43.26238
6727	82	30	2		2020-05-25 10:07:43.270814	2020-05-25 10:07:43.270814
6728	93	30	1		2020-05-25 10:07:43.28006	2020-05-25 10:07:43.28006
6729	34	30	3		2020-05-25 10:07:43.301049	2020-05-25 10:07:43.301049
6730	59	30	5		2020-05-25 10:07:43.343021	2020-05-25 10:07:43.343021
6731	73	30	2		2020-05-25 10:07:43.34807	2020-05-25 10:07:43.34807
6732	13	30	0		2020-05-25 10:07:43.35717	2020-05-25 10:07:43.35717
6733	47	30	2		2020-05-25 10:07:43.365014	2020-05-25 10:07:43.365014
6734	0	30	0		2020-05-25 10:07:43.371325	2020-05-25 10:07:43.371325
6735	39	30	1		2020-05-25 10:07:43.378209	2020-05-25 10:07:43.378209
6736	8	30	0		2020-05-25 10:07:43.388009	2020-05-25 10:07:43.388009
6737	74	30	1		2020-05-25 10:07:43.396715	2020-05-25 10:07:43.396715
6738	96	30	4		2020-05-25 10:07:43.406343	2020-05-25 10:07:43.406343
6739	21	30	3		2020-05-25 10:07:43.414442	2020-05-25 10:07:43.414442
6740	54	30	2		2020-05-25 10:07:43.423692	2020-05-25 10:07:43.423692
6741	50	30	1		2020-05-25 10:07:43.430615	2020-05-25 10:07:43.430615
6742	36	30	1		2020-05-25 10:07:43.440281	2020-05-25 10:07:43.440281
6743	40	30	3		2020-05-25 10:07:43.448313	2020-05-25 10:07:43.448313
6744	71	30	1		2020-05-25 10:07:43.455283	2020-05-25 10:07:43.455283
6745	18	30	4		2020-05-25 10:07:43.462467	2020-05-25 10:07:43.462467
6746	7	30	3		2020-05-25 10:07:43.471591	2020-05-25 10:07:43.471591
6747	88	30	4		2020-05-25 10:07:43.479643	2020-05-25 10:07:43.479643
6748	6	30	2		2020-05-25 10:07:43.490274	2020-05-25 10:07:43.490274
6749	11	30	4		2020-05-25 10:07:43.496426	2020-05-25 10:07:43.496426
6750	12	30	2		2020-05-25 10:07:43.505948	2020-05-25 10:07:43.505948
6751	67	30	1		2020-05-25 10:07:43.51592	2020-05-25 10:07:43.51592
6752	45	30	3		2020-05-25 10:07:43.522411	2020-05-25 10:07:43.522411
6753	48	30	3		2020-05-25 10:07:43.529269	2020-05-25 10:07:43.529269
6754	94	30	4		2020-05-25 10:07:43.537809	2020-05-25 10:07:43.537809
6755	32	31	0		2020-05-25 10:07:43.545575	2020-05-25 10:07:43.545575
6756	54	31	2		2020-05-25 10:07:43.552314	2020-05-25 10:07:43.552314
6757	61	31	1		2020-05-25 10:07:43.560701	2020-05-25 10:07:43.560701
6758	6	31	1		2020-05-25 10:07:43.569138	2020-05-25 10:07:43.569138
6759	94	31	4		2020-05-25 10:07:43.584097	2020-05-25 10:07:43.584097
6760	52	31	4		2020-05-25 10:07:43.595388	2020-05-25 10:07:43.595388
6761	74	31	3		2020-05-25 10:07:43.604819	2020-05-25 10:07:43.604819
6762	51	31	4		2020-05-25 10:07:43.646814	2020-05-25 10:07:43.646814
6763	15	31	0		2020-05-25 10:07:43.657463	2020-05-25 10:07:43.657463
6764	24	31	5		2020-05-25 10:07:43.664841	2020-05-25 10:07:43.664841
6765	46	31	4		2020-05-25 10:07:43.668975	2020-05-25 10:07:43.668975
6766	95	31	1		2020-05-25 10:07:43.685999	2020-05-25 10:07:43.685999
6767	0	31	4		2020-05-25 10:07:43.693196	2020-05-25 10:07:43.693196
6768	63	31	1		2020-05-25 10:07:43.69857	2020-05-25 10:07:43.69857
6769	11	31	0		2020-05-25 10:07:43.706107	2020-05-25 10:07:43.706107
6770	92	31	1		2020-05-25 10:07:43.709205	2020-05-25 10:07:43.709205
6771	19	31	2		2020-05-25 10:07:43.716206	2020-05-25 10:07:43.716206
6772	10	31	4		2020-05-25 10:07:43.72405	2020-05-25 10:07:43.72405
6773	97	31	2		2020-05-25 10:07:43.727615	2020-05-25 10:07:43.727615
6774	7	31	1		2020-05-25 10:07:43.733058	2020-05-25 10:07:43.733058
6775	78	31	0		2020-05-25 10:07:43.739434	2020-05-25 10:07:43.739434
6776	2	31	1		2020-05-25 10:07:43.742404	2020-05-25 10:07:43.742404
6777	41	31	1		2020-05-25 10:07:43.749734	2020-05-25 10:07:43.749734
6778	65	31	3		2020-05-25 10:07:43.754426	2020-05-25 10:07:43.754426
6779	62	31	5		2020-05-25 10:07:43.760929	2020-05-25 10:07:43.760929
6780	44	31	3		2020-05-25 10:07:43.768376	2020-05-25 10:07:43.768376
6781	34	31	1		2020-05-25 10:07:43.774866	2020-05-25 10:07:43.774866
6782	90	31	2		2020-05-25 10:07:43.778099	2020-05-25 10:07:43.778099
6783	20	31	0		2020-05-25 10:07:43.784888	2020-05-25 10:07:43.784888
6784	77	31	1		2020-05-25 10:07:43.792085	2020-05-25 10:07:43.792085
6785	43	31	4		2020-05-25 10:07:43.795568	2020-05-25 10:07:43.795568
6786	22	31	4		2020-05-25 10:07:43.804322	2020-05-25 10:07:43.804322
6787	13	31	4		2020-05-25 10:07:43.808409	2020-05-25 10:07:43.808409
6788	76	31	0		2020-05-25 10:07:43.811452	2020-05-25 10:07:43.811452
6789	91	31	2		2020-05-25 10:07:43.820017	2020-05-25 10:07:43.820017
6790	84	31	0		2020-05-25 10:07:43.826965	2020-05-25 10:07:43.826965
6791	50	31	3		2020-05-25 10:07:43.832405	2020-05-25 10:07:43.832405
6792	73	31	3		2020-05-25 10:07:43.839635	2020-05-25 10:07:43.839635
6793	75	31	4		2020-05-25 10:07:43.842732	2020-05-25 10:07:43.842732
6794	88	31	3		2020-05-25 10:07:43.849904	2020-05-25 10:07:43.849904
6795	64	31	5		2020-05-25 10:07:43.855238	2020-05-25 10:07:43.855238
6796	79	31	4		2020-05-25 10:07:43.861175	2020-05-25 10:07:43.861175
6797	14	31	2		2020-05-25 10:07:43.867985	2020-05-25 10:07:43.867985
6798	5	31	0		2020-05-25 10:07:43.874022	2020-05-25 10:07:43.874022
6799	99	31	4		2020-05-25 10:07:43.877148	2020-05-25 10:07:43.877148
6800	9	31	3		2020-05-25 10:07:43.88492	2020-05-25 10:07:43.88492
6801	58	31	4		2020-05-25 10:07:43.891318	2020-05-25 10:07:43.891318
6802	98	31	2		2020-05-25 10:07:43.895624	2020-05-25 10:07:43.895624
6803	37	31	0		2020-05-25 10:07:43.904629	2020-05-25 10:07:43.904629
6804	47	31	2		2020-05-25 10:07:43.908396	2020-05-25 10:07:43.908396
6805	81	31	3		2020-05-25 10:07:43.911602	2020-05-25 10:07:43.911602
6806	82	31	5		2020-05-25 10:07:43.918188	2020-05-25 10:07:43.918188
6807	85	31	3		2020-05-25 10:07:43.924892	2020-05-25 10:07:43.924892
6808	93	31	0		2020-05-25 10:07:43.928661	2020-05-25 10:07:43.928661
6809	12	31	2		2020-05-25 10:07:43.938409	2020-05-25 10:07:43.938409
6810	55	31	4		2020-05-25 10:07:43.941842	2020-05-25 10:07:43.941842
6811	49	31	4		2020-05-25 10:07:43.944848	2020-05-25 10:07:43.944848
6812	21	31	1		2020-05-25 10:07:43.953053	2020-05-25 10:07:43.953053
6813	25	31	4		2020-05-25 10:07:43.960094	2020-05-25 10:07:43.960094
6814	80	31	2		2020-05-25 10:07:43.965598	2020-05-25 10:07:43.965598
6815	59	31	4		2020-05-25 10:07:43.972862	2020-05-25 10:07:43.972862
6816	17	31	1		2020-05-25 10:07:43.97599	2020-05-25 10:07:43.97599
6817	39	31	1		2020-05-25 10:07:43.979466	2020-05-25 10:07:43.979466
6818	87	31	1		2020-05-25 10:07:43.986884	2020-05-25 10:07:43.986884
6819	67	31	3		2020-05-25 10:07:43.993754	2020-05-25 10:07:43.993754
6820	42	31	0		2020-05-25 10:07:43.999367	2020-05-25 10:07:43.999367
6821	1	31	4		2020-05-25 10:07:44.006657	2020-05-25 10:07:44.006657
6822	40	31	0		2020-05-25 10:07:44.009942	2020-05-25 10:07:44.009942
6823	27	31	1		2020-05-25 10:07:44.01834	2020-05-25 10:07:44.01834
6824	83	31	3		2020-05-25 10:07:44.025197	2020-05-25 10:07:44.025197
6825	20	32	1		2020-05-25 10:07:44.02922	2020-05-25 10:07:44.02922
6826	44	32	2		2020-05-25 10:07:44.037884	2020-05-25 10:07:44.037884
6827	90	32	2		2020-05-25 10:07:44.04207	2020-05-25 10:07:44.04207
6828	82	32	3		2020-05-25 10:07:44.045337	2020-05-25 10:07:44.045337
6829	92	32	0		2020-05-25 10:07:44.053391	2020-05-25 10:07:44.053391
6830	54	32	4		2020-05-25 10:07:44.060452	2020-05-25 10:07:44.060452
6831	68	32	2		2020-05-25 10:07:44.065957	2020-05-25 10:07:44.065957
6832	87	32	3		2020-05-25 10:07:44.073034	2020-05-25 10:07:44.073034
6833	85	32	2		2020-05-25 10:07:44.07614	2020-05-25 10:07:44.07614
6834	74	32	3		2020-05-25 10:07:44.083037	2020-05-25 10:07:44.083037
6835	71	32	5		2020-05-25 10:07:44.08843	2020-05-25 10:07:44.08843
6836	2	32	0		2020-05-25 10:07:44.094423	2020-05-25 10:07:44.094423
6837	31	32	3		2020-05-25 10:07:44.100545	2020-05-25 10:07:44.100545
6838	14	32	4		2020-05-25 10:07:44.106852	2020-05-25 10:07:44.106852
6839	55	32	3		2020-05-25 10:07:44.110001	2020-05-25 10:07:44.110001
6840	76	32	0		2020-05-25 10:07:44.117968	2020-05-25 10:07:44.117968
6841	30	32	4		2020-05-25 10:07:44.124467	2020-05-25 10:07:44.124467
6842	59	32	1		2020-05-25 10:07:44.128758	2020-05-25 10:07:44.128758
6843	50	32	1		2020-05-25 10:07:44.137864	2020-05-25 10:07:44.137864
6844	98	32	3		2020-05-25 10:07:44.141811	2020-05-25 10:07:44.141811
6845	58	32	4		2020-05-25 10:07:44.144864	2020-05-25 10:07:44.144864
6846	34	32	4		2020-05-25 10:07:44.151318	2020-05-25 10:07:44.151318
6847	80	32	0		2020-05-25 10:07:44.157569	2020-05-25 10:07:44.157569
6848	95	32	1		2020-05-25 10:07:44.161913	2020-05-25 10:07:44.161913
6849	3	32	4		2020-05-25 10:07:44.171108	2020-05-25 10:07:44.171108
6850	29	32	3		2020-05-25 10:07:44.17515	2020-05-25 10:07:44.17515
6851	56	32	3		2020-05-25 10:07:44.178228	2020-05-25 10:07:44.178228
6852	49	32	5		2020-05-25 10:07:44.185304	2020-05-25 10:07:44.185304
6853	84	32	5		2020-05-25 10:07:44.192531	2020-05-25 10:07:44.192531
6854	81	32	2		2020-05-25 10:07:44.198784	2020-05-25 10:07:44.198784
6855	64	32	2		2020-05-25 10:07:44.205902	2020-05-25 10:07:44.205902
6856	10	32	2		2020-05-25 10:07:44.208974	2020-05-25 10:07:44.208974
6857	88	32	0		2020-05-25 10:07:44.2163	2020-05-25 10:07:44.2163
6858	46	32	3		2020-05-25 10:07:44.221528	2020-05-25 10:07:44.221528
6859	32	32	4		2020-05-25 10:07:44.227636	2020-05-25 10:07:44.227636
6860	61	32	1		2020-05-25 10:07:44.234245	2020-05-25 10:07:44.234245
6861	77	32	0		2020-05-25 10:07:44.240625	2020-05-25 10:07:44.240625
6862	63	32	2		2020-05-25 10:07:44.243578	2020-05-25 10:07:44.243578
6863	23	32	4		2020-05-25 10:07:44.250073	2020-05-25 10:07:44.250073
6864	89	32	2		2020-05-25 10:07:44.255747	2020-05-25 10:07:44.255747
6865	0	32	3		2020-05-25 10:07:44.26149	2020-05-25 10:07:44.26149
6866	37	32	2		2020-05-25 10:07:44.2683	2020-05-25 10:07:44.2683
6867	93	32	4		2020-05-25 10:07:44.274428	2020-05-25 10:07:44.274428
6868	96	32	4		2020-05-25 10:07:44.277675	2020-05-25 10:07:44.277675
6869	79	32	2		2020-05-25 10:07:44.284248	2020-05-25 10:07:44.284248
6870	69	32	2		2020-05-25 10:07:44.306641	2020-05-25 10:07:44.306641
6871	1	32	4		2020-05-25 10:07:44.30977	2020-05-25 10:07:44.30977
6872	38	32	3		2020-05-25 10:07:44.317748	2020-05-25 10:07:44.317748
6873	28	32	3		2020-05-25 10:07:44.324247	2020-05-25 10:07:44.324247
6874	86	32	2		2020-05-25 10:07:44.32858	2020-05-25 10:07:44.32858
6875	36	32	3		2020-05-25 10:07:44.337354	2020-05-25 10:07:44.337354
6876	99	32	5		2020-05-25 10:07:44.341501	2020-05-25 10:07:44.341501
6877	48	32	0		2020-05-25 10:07:44.344765	2020-05-25 10:07:44.344765
6878	25	32	0		2020-05-25 10:07:44.352956	2020-05-25 10:07:44.352956
6879	22	32	4		2020-05-25 10:07:44.360059	2020-05-25 10:07:44.360059
6880	78	32	2		2020-05-25 10:07:44.365496	2020-05-25 10:07:44.365496
6881	5	32	4		2020-05-25 10:07:44.37275	2020-05-25 10:07:44.37275
6882	8	32	0		2020-05-25 10:07:44.375946	2020-05-25 10:07:44.375946
6883	83	32	0		2020-05-25 10:07:44.379134	2020-05-25 10:07:44.379134
6884	43	32	0		2020-05-25 10:07:44.386959	2020-05-25 10:07:44.386959
6885	51	32	1		2020-05-25 10:07:44.393971	2020-05-25 10:07:44.393971
6886	12	32	0		2020-05-25 10:07:44.400503	2020-05-25 10:07:44.400503
6887	73	32	4		2020-05-25 10:07:44.407051	2020-05-25 10:07:44.407051
6888	45	32	3		2020-05-25 10:07:44.410301	2020-05-25 10:07:44.410301
6889	18	32	3		2020-05-25 10:07:44.418079	2020-05-25 10:07:44.418079
6890	4	32	0		2020-05-25 10:07:44.424711	2020-05-25 10:07:44.424711
6891	72	32	2		2020-05-25 10:07:44.429521	2020-05-25 10:07:44.429521
6892	11	32	5		2020-05-25 10:07:44.438406	2020-05-25 10:07:44.438406
6893	39	32	0		2020-05-25 10:07:44.442167	2020-05-25 10:07:44.442167
6894	9	32	3		2020-05-25 10:07:44.445761	2020-05-25 10:07:44.445761
6895	70	32	0		2020-05-25 10:07:44.454004	2020-05-25 10:07:44.454004
6896	62	32	4		2020-05-25 10:07:44.46639	2020-05-25 10:07:44.46639
6897	42	32	2		2020-05-25 10:07:44.474307	2020-05-25 10:07:44.474307
6898	40	32	3		2020-05-25 10:07:44.478182	2020-05-25 10:07:44.478182
6899	13	32	0		2020-05-25 10:07:44.486055	2020-05-25 10:07:44.486055
6900	52	32	0		2020-05-25 10:07:44.495177	2020-05-25 10:07:44.495177
6901	91	32	4		2020-05-25 10:07:44.505949	2020-05-25 10:07:44.505949
6902	19	32	4		2020-05-25 10:07:44.513054	2020-05-25 10:07:44.513054
6903	15	32	4		2020-05-25 10:07:44.522313	2020-05-25 10:07:44.522313
6904	6	32	5		2020-05-25 10:07:44.531386	2020-05-25 10:07:44.531386
6905	41	32	4		2020-05-25 10:07:44.540907	2020-05-25 10:07:44.540907
6906	97	32	2		2020-05-25 10:07:44.547903	2020-05-25 10:07:44.547903
6907	17	32	4		2020-05-25 10:07:44.558885	2020-05-25 10:07:44.558885
6908	21	32	0		2020-05-25 10:07:44.567314	2020-05-25 10:07:44.567314
6909	47	32	3		2020-05-25 10:07:44.579208	2020-05-25 10:07:44.579208
6910	35	32	1		2020-05-25 10:07:44.588184	2020-05-25 10:07:44.588184
6911	33	32	0		2020-05-25 10:07:44.597212	2020-05-25 10:07:44.597212
6912	53	32	3		2020-05-25 10:07:44.605037	2020-05-25 10:07:44.605037
6913	27	32	2		2020-05-25 10:07:44.613827	2020-05-25 10:07:44.613827
6914	66	32	5		2020-05-25 10:07:44.62167	2020-05-25 10:07:44.62167
6915	16	32	1		2020-05-25 10:07:44.63088	2020-05-25 10:07:44.63088
6916	57	32	0		2020-05-25 10:07:44.64106	2020-05-25 10:07:44.64106
6917	94	32	4		2020-05-25 10:07:44.649522	2020-05-25 10:07:44.649522
6918	75	32	0		2020-05-25 10:07:44.662655	2020-05-25 10:07:44.662655
6919	7	32	4		2020-05-25 10:07:44.672122	2020-05-25 10:07:44.672122
6920	60	32	1		2020-05-25 10:07:44.681662	2020-05-25 10:07:44.681662
6921	26	32	1		2020-05-25 10:07:44.692025	2020-05-25 10:07:44.692025
6922	24	32	0		2020-05-25 10:07:44.699983	2020-05-25 10:07:44.699983
6923	53	33	2		2020-05-25 10:07:44.712426	2020-05-25 10:07:44.712426
6924	24	33	3		2020-05-25 10:07:44.721425	2020-05-25 10:07:44.721425
6925	78	33	4		2020-05-25 10:07:44.730584	2020-05-25 10:07:44.730584
6926	17	33	4		2020-05-25 10:07:44.741143	2020-05-25 10:07:44.741143
6927	93	33	4		2020-05-25 10:07:44.749262	2020-05-25 10:07:44.749262
6928	91	33	0		2020-05-25 10:07:44.761945	2020-05-25 10:07:44.761945
6929	58	33	2		2020-05-25 10:07:44.769808	2020-05-25 10:07:44.769808
6930	99	33	3		2020-05-25 10:07:44.778831	2020-05-25 10:07:44.778831
6931	34	33	2		2020-05-25 10:07:44.791825	2020-05-25 10:07:44.791825
6932	50	33	2		2020-05-25 10:07:44.798059	2020-05-25 10:07:44.798059
6933	38	33	0		2020-05-25 10:07:44.810365	2020-05-25 10:07:44.810365
6934	27	33	0		2020-05-25 10:07:44.81903	2020-05-25 10:07:44.81903
6935	18	33	4		2020-05-25 10:07:44.827987	2020-05-25 10:07:44.827987
6936	62	33	5		2020-05-25 10:07:44.835971	2020-05-25 10:07:44.835971
6937	55	33	0		2020-05-25 10:07:44.844268	2020-05-25 10:07:44.844268
6938	7	33	1		2020-05-25 10:07:44.853883	2020-05-25 10:07:44.853883
6939	71	33	1		2020-05-25 10:07:44.862135	2020-05-25 10:07:44.862135
6940	67	33	1		2020-05-25 10:07:44.871723	2020-05-25 10:07:44.871723
6941	48	33	3		2020-05-25 10:07:44.880285	2020-05-25 10:07:44.880285
6942	20	33	2		2020-05-25 10:07:44.890742	2020-05-25 10:07:44.890742
6943	86	33	1		2020-05-25 10:07:44.896328	2020-05-25 10:07:44.896328
6944	30	33	2		2020-05-25 10:07:44.906908	2020-05-25 10:07:44.906908
6945	89	33	2		2020-05-25 10:07:44.914049	2020-05-25 10:07:44.914049
6946	66	33	1		2020-05-25 10:07:44.923093	2020-05-25 10:07:44.923093
6947	74	33	2		2020-05-25 10:07:44.928586	2020-05-25 10:07:44.928586
6948	97	33	2		2020-05-25 10:07:44.937286	2020-05-25 10:07:44.937286
6949	72	33	3		2020-05-25 10:07:44.945506	2020-05-25 10:07:44.945506
6950	0	33	4		2020-05-25 10:07:44.954543	2020-05-25 10:07:44.954543
6951	92	33	3		2020-05-25 10:07:44.96304	2020-05-25 10:07:44.96304
6952	36	33	3		2020-05-25 10:07:44.973099	2020-05-25 10:07:44.973099
6953	2	33	0		2020-05-25 10:07:44.979259	2020-05-25 10:07:44.979259
6954	47	33	0		2020-05-25 10:07:44.989693	2020-05-25 10:07:44.989693
6955	9	33	2		2020-05-25 10:07:44.996708	2020-05-25 10:07:44.996708
6956	42	33	5		2020-05-25 10:07:45.006787	2020-05-25 10:07:45.006787
6957	79	33	4		2020-05-25 10:07:45.014579	2020-05-25 10:07:45.014579
6958	13	33	1		2020-05-25 10:07:45.02385	2020-05-25 10:07:45.02385
6959	26	33	4		2020-05-25 10:07:45.029428	2020-05-25 10:07:45.029428
6960	87	33	4		2020-05-25 10:07:45.040227	2020-05-25 10:07:45.040227
6961	8	33	1		2020-05-25 10:07:45.047514	2020-05-25 10:07:45.047514
6962	41	33	4		2020-05-25 10:07:45.055973	2020-05-25 10:07:45.055973
6963	40	33	1		2020-05-25 10:07:45.061758	2020-05-25 10:07:45.061758
6964	45	33	2		2020-05-25 10:07:45.070449	2020-05-25 10:07:45.070449
6965	81	33	2		2020-05-25 10:07:45.07869	2020-05-25 10:07:45.07869
6966	98	33	2		2020-05-25 10:07:45.087857	2020-05-25 10:07:45.087857
6967	59	33	2		2020-05-25 10:07:45.096253	2020-05-25 10:07:45.096253
6968	51	33	5		2020-05-25 10:07:45.104841	2020-05-25 10:07:45.104841
6969	64	33	0		2020-05-25 10:07:45.11158	2020-05-25 10:07:45.11158
6970	95	33	4		2020-05-25 10:07:45.120697	2020-05-25 10:07:45.120697
6971	1	33	1		2020-05-25 10:07:45.128857	2020-05-25 10:07:45.128857
6972	82	33	2		2020-05-25 10:07:45.138388	2020-05-25 10:07:45.138388
6973	70	33	5		2020-05-25 10:07:45.146658	2020-05-25 10:07:45.146658
6974	80	33	2		2020-05-25 10:07:45.157459	2020-05-25 10:07:45.157459
6975	60	33	2		2020-05-25 10:07:45.162618	2020-05-25 10:07:45.162618
6976	6	33	0		2020-05-25 10:07:45.17327	2020-05-25 10:07:45.17327
6977	94	33	3		2020-05-25 10:07:45.180357	2020-05-25 10:07:45.180357
6978	85	33	1		2020-05-25 10:07:45.189351	2020-05-25 10:07:45.189351
6979	52	33	0		2020-05-25 10:07:45.195461	2020-05-25 10:07:45.195461
6980	29	33	0		2020-05-25 10:07:45.203642	2020-05-25 10:07:45.203642
6981	68	33	1		2020-05-25 10:07:45.211779	2020-05-25 10:07:45.211779
6982	84	33	2		2020-05-25 10:07:45.221559	2020-05-25 10:07:45.221559
6983	54	33	2		2020-05-25 10:07:45.230136	2020-05-25 10:07:45.230136
6984	61	33	2		2020-05-25 10:07:45.239805	2020-05-25 10:07:45.239805
6985	65	33	1		2020-05-25 10:07:45.24621	2020-05-25 10:07:45.24621
6986	35	33	1		2020-05-25 10:07:45.25698	2020-05-25 10:07:45.25698
6987	44	33	1		2020-05-25 10:07:45.264232	2020-05-25 10:07:45.264232
6988	5	33	1		2020-05-25 10:07:45.275692	2020-05-25 10:07:45.275692
6989	12	33	1		2020-05-25 10:07:45.27994	2020-05-25 10:07:45.27994
6990	90	33	2		2020-05-25 10:07:45.293535	2020-05-25 10:07:45.293535
6991	49	33	4		2020-05-25 10:07:45.302772	2020-05-25 10:07:45.302772
6992	39	33	3		2020-05-25 10:07:45.3118	2020-05-25 10:07:45.3118
6993	3	33	2		2020-05-25 10:07:45.319685	2020-05-25 10:07:45.319685
6994	19	33	0		2020-05-25 10:07:45.327697	2020-05-25 10:07:45.327697
6995	28	33	5		2020-05-25 10:07:45.336843	2020-05-25 10:07:45.336843
6996	22	33	4		2020-05-25 10:07:45.345477	2020-05-25 10:07:45.345477
6997	32	33	4		2020-05-25 10:07:45.35325	2020-05-25 10:07:45.35325
6998	73	33	4		2020-05-25 10:07:45.362114	2020-05-25 10:07:45.362114
6999	96	33	3		2020-05-25 10:07:45.370038	2020-05-25 10:07:45.370038
7000	4	33	2		2020-05-25 10:07:45.378071	2020-05-25 10:07:45.378071
7001	76	33	5		2020-05-25 10:07:45.387679	2020-05-25 10:07:45.387679
7002	88	33	3		2020-05-25 10:07:45.397278	2020-05-25 10:07:45.397278
7003	83	33	5		2020-05-25 10:07:45.404513	2020-05-25 10:07:45.404513
7004	15	33	2		2020-05-25 10:07:45.411699	2020-05-25 10:07:45.411699
7005	77	33	3		2020-05-25 10:07:45.421605	2020-05-25 10:07:45.421605
7006	63	33	0		2020-05-25 10:07:45.429674	2020-05-25 10:07:45.429674
7007	57	33	0		2020-05-25 10:07:45.437872	2020-05-25 10:07:45.437872
7008	25	33	0		2020-05-25 10:07:45.447265	2020-05-25 10:07:45.447265
7009	11	33	0		2020-05-25 10:07:45.454206	2020-05-25 10:07:45.454206
7010	23	33	2		2020-05-25 10:07:45.462144	2020-05-25 10:07:45.462144
7011	10	33	2		2020-05-25 10:07:45.472172	2020-05-25 10:07:45.472172
7012	8	34	2		2020-05-25 10:07:45.480868	2020-05-25 10:07:45.480868
7013	17	34	1		2020-05-25 10:07:45.490335	2020-05-25 10:07:45.490335
7014	82	34	1		2020-05-25 10:07:45.497434	2020-05-25 10:07:45.497434
7015	0	34	4		2020-05-25 10:07:45.508817	2020-05-25 10:07:45.508817
7016	44	34	5		2020-05-25 10:07:45.51641	2020-05-25 10:07:45.51641
7017	42	34	4		2020-05-25 10:07:45.52701	2020-05-25 10:07:45.52701
7018	22	34	1		2020-05-25 10:07:45.536365	2020-05-25 10:07:45.536365
7019	71	34	1		2020-05-25 10:07:45.545945	2020-05-25 10:07:45.545945
7020	75	34	2		2020-05-25 10:07:45.553398	2020-05-25 10:07:45.553398
7021	49	34	4		2020-05-25 10:07:45.561545	2020-05-25 10:07:45.561545
7022	12	34	5		2020-05-25 10:07:45.569463	2020-05-25 10:07:45.569463
7023	93	34	2		2020-05-25 10:07:45.578505	2020-05-25 10:07:45.578505
7024	51	34	1		2020-05-25 10:07:45.586586	2020-05-25 10:07:45.586586
7025	14	34	0		2020-05-25 10:07:45.61577	2020-05-25 10:07:45.61577
7026	2	34	1		2020-05-25 10:07:45.62132	2020-05-25 10:07:45.62132
7027	81	34	3		2020-05-25 10:07:45.628356	2020-05-25 10:07:45.628356
7028	77	34	1		2020-05-25 10:07:45.637086	2020-05-25 10:07:45.637086
7029	99	34	2		2020-05-25 10:07:45.645481	2020-05-25 10:07:45.645481
7030	50	34	3		2020-05-25 10:07:45.654934	2020-05-25 10:07:45.654934
7031	91	34	4		2020-05-25 10:07:45.663225	2020-05-25 10:07:45.663225
7032	60	34	1		2020-05-25 10:07:45.671941	2020-05-25 10:07:45.671941
7033	43	34	5		2020-05-25 10:07:45.678609	2020-05-25 10:07:45.678609
7034	33	34	3		2020-05-25 10:07:45.687608	2020-05-25 10:07:45.687608
7035	15	34	2		2020-05-25 10:07:45.695664	2020-05-25 10:07:45.695664
7036	20	34	4		2020-05-25 10:07:45.70452	2020-05-25 10:07:45.70452
7037	18	34	0		2020-05-25 10:07:45.712863	2020-05-25 10:07:45.712863
7038	79	34	1		2020-05-25 10:07:45.718508	2020-05-25 10:07:45.718508
7039	35	34	0		2020-05-25 10:07:45.726917	2020-05-25 10:07:45.726917
7040	97	34	4		2020-05-25 10:07:45.736006	2020-05-25 10:07:45.736006
7041	56	34	4		2020-05-25 10:07:45.744673	2020-05-25 10:07:45.744673
7042	9	34	3		2020-05-25 10:07:45.753677	2020-05-25 10:07:45.753677
7043	89	34	0		2020-05-25 10:07:45.761625	2020-05-25 10:07:45.761625
7044	16	34	5		2020-05-25 10:07:45.769817	2020-05-25 10:07:45.769817
7045	38	34	1		2020-05-25 10:07:45.778136	2020-05-25 10:07:45.778136
7046	88	34	0		2020-05-25 10:07:45.787744	2020-05-25 10:07:45.787744
7047	34	34	4		2020-05-25 10:07:45.79653	2020-05-25 10:07:45.79653
7048	74	34	2		2020-05-25 10:07:45.803751	2020-05-25 10:07:45.803751
7049	30	34	1		2020-05-25 10:07:45.811665	2020-05-25 10:07:45.811665
7050	90	34	0		2020-05-25 10:07:45.819908	2020-05-25 10:07:45.819908
7051	65	34	3		2020-05-25 10:07:45.828155	2020-05-25 10:07:45.828155
7052	41	34	0		2020-05-25 10:07:45.836279	2020-05-25 10:07:45.836279
7053	28	34	5		2020-05-25 10:07:45.84428	2020-05-25 10:07:45.84428
7054	4	34	3		2020-05-25 10:07:45.852283	2020-05-25 10:07:45.852283
7055	3	34	3		2020-05-25 10:07:45.86085	2020-05-25 10:07:45.86085
7056	84	34	3		2020-05-25 10:07:45.865476	2020-05-25 10:07:45.865476
7057	95	34	3		2020-05-25 10:07:45.875107	2020-05-25 10:07:45.875107
7058	73	34	3		2020-05-25 10:07:45.882712	2020-05-25 10:07:45.882712
7059	40	34	5		2020-05-25 10:07:45.893014	2020-05-25 10:07:45.893014
7060	64	34	4		2020-05-25 10:07:45.901979	2020-05-25 10:07:45.901979
7061	6	34	3		2020-05-25 10:07:45.910114	2020-05-25 10:07:45.910114
7062	80	34	4		2020-05-25 10:07:45.919158	2020-05-25 10:07:45.919158
7063	70	34	2		2020-05-25 10:07:45.926349	2020-05-25 10:07:45.926349
7064	63	34	1		2020-05-25 10:07:45.935853	2020-05-25 10:07:45.935853
7065	7	34	1		2020-05-25 10:07:45.943846	2020-05-25 10:07:45.943846
7066	27	34	0		2020-05-25 10:07:45.9533	2020-05-25 10:07:45.9533
7067	62	34	0		2020-05-25 10:07:45.961858	2020-05-25 10:07:45.961858
7068	83	34	4		2020-05-25 10:07:45.970784	2020-05-25 10:07:45.970784
7069	55	34	1		2020-05-25 10:07:45.97897	2020-05-25 10:07:45.97897
7070	96	34	3		2020-05-25 10:07:45.986899	2020-05-25 10:07:45.986899
7071	36	34	4		2020-05-25 10:07:45.995374	2020-05-25 10:07:45.995374
7072	39	34	4		2020-05-25 10:07:46.006368	2020-05-25 10:07:46.006368
7073	86	34	4		2020-05-25 10:07:46.014308	2020-05-25 10:07:46.014308
7074	78	34	3		2020-05-25 10:07:46.02088	2020-05-25 10:07:46.02088
7075	87	34	1		2020-05-25 10:07:46.028627	2020-05-25 10:07:46.028627
7076	45	34	2		2020-05-25 10:07:46.03761	2020-05-25 10:07:46.03761
7077	11	34	1		2020-05-25 10:07:46.045489	2020-05-25 10:07:46.045489
7078	13	34	2		2020-05-25 10:07:46.052227	2020-05-25 10:07:46.052227
7079	66	34	3		2020-05-25 10:07:46.059924	2020-05-25 10:07:46.059924
7080	92	34	0		2020-05-25 10:07:46.06426	2020-05-25 10:07:46.06426
7081	67	34	0		2020-05-25 10:07:46.073691	2020-05-25 10:07:46.073691
7082	98	34	4		2020-05-25 10:07:46.080631	2020-05-25 10:07:46.080631
7083	21	34	4		2020-05-25 10:07:46.088128	2020-05-25 10:07:46.088128
7084	59	34	1		2020-05-25 10:07:46.094746	2020-05-25 10:07:46.094746
7085	24	34	0		2020-05-25 10:07:46.102967	2020-05-25 10:07:46.102967
7086	48	34	1		2020-05-25 10:07:46.110706	2020-05-25 10:07:46.110706
7087	46	34	2		2020-05-25 10:07:46.119679	2020-05-25 10:07:46.119679
7088	26	34	3		2020-05-25 10:07:46.126145	2020-05-25 10:07:46.126145
7089	61	34	1		2020-05-25 10:07:46.135769	2020-05-25 10:07:46.135769
7090	10	34	5		2020-05-25 10:07:46.143595	2020-05-25 10:07:46.143595
7091	25	34	5		2020-05-25 10:07:46.152479	2020-05-25 10:07:46.152479
7092	72	34	4		2020-05-25 10:07:46.159563	2020-05-25 10:07:46.159563
7093	19	34	2		2020-05-25 10:07:46.165263	2020-05-25 10:07:46.165263
7094	58	34	0		2020-05-25 10:07:46.173894	2020-05-25 10:07:46.173894
7095	47	34	1		2020-05-25 10:07:46.181949	2020-05-25 10:07:46.181949
7096	6	35	0		2020-05-25 10:07:46.188832	2020-05-25 10:07:46.188832
7097	21	35	1		2020-05-25 10:07:46.19607	2020-05-25 10:07:46.19607
7098	4	35	5		2020-05-25 10:07:46.2048	2020-05-25 10:07:46.2048
7099	14	35	1		2020-05-25 10:07:46.211955	2020-05-25 10:07:46.211955
7100	30	35	0		2020-05-25 10:07:46.219587	2020-05-25 10:07:46.219587
7101	72	35	3		2020-05-25 10:07:46.227887	2020-05-25 10:07:46.227887
7102	57	35	4		2020-05-25 10:07:46.236109	2020-05-25 10:07:46.236109
7103	89	35	2		2020-05-25 10:07:46.242456	2020-05-25 10:07:46.242456
7104	61	35	2		2020-05-25 10:07:46.248926	2020-05-25 10:07:46.248926
7105	75	35	0		2020-05-25 10:07:46.25897	2020-05-25 10:07:46.25897
7106	80	35	0		2020-05-25 10:07:46.263895	2020-05-25 10:07:46.263895
7107	9	35	2		2020-05-25 10:07:46.272997	2020-05-25 10:07:46.272997
7108	0	35	4		2020-05-25 10:07:46.280558	2020-05-25 10:07:46.280558
7109	71	35	2		2020-05-25 10:07:46.288035	2020-05-25 10:07:46.288035
7110	73	35	3		2020-05-25 10:07:46.295275	2020-05-25 10:07:46.295275
7111	11	35	1		2020-05-25 10:07:46.304268	2020-05-25 10:07:46.304268
7112	41	35	2		2020-05-25 10:07:46.312233	2020-05-25 10:07:46.312233
7113	40	35	4		2020-05-25 10:07:46.319197	2020-05-25 10:07:46.319197
7114	36	35	5		2020-05-25 10:07:46.327065	2020-05-25 10:07:46.327065
7115	66	35	1		2020-05-25 10:07:46.335444	2020-05-25 10:07:46.335444
7116	27	35	3		2020-05-25 10:07:46.341877	2020-05-25 10:07:46.341877
7117	45	35	3		2020-05-25 10:07:46.34873	2020-05-25 10:07:46.34873
7118	22	35	4		2020-05-25 10:07:46.358978	2020-05-25 10:07:46.358978
7119	99	35	4		2020-05-25 10:07:46.366383	2020-05-25 10:07:46.366383
7120	98	35	5		2020-05-25 10:07:46.377457	2020-05-25 10:07:46.377457
7121	52	35	4		2020-05-25 10:07:46.386117	2020-05-25 10:07:46.386117
7122	19	35	0		2020-05-25 10:07:46.392451	2020-05-25 10:07:46.392451
7123	15	35	0		2020-05-25 10:07:46.399589	2020-05-25 10:07:46.399589
7124	85	35	3		2020-05-25 10:07:46.410064	2020-05-25 10:07:46.410064
7125	53	35	3		2020-05-25 10:07:46.418271	2020-05-25 10:07:46.418271
7126	44	35	2		2020-05-25 10:07:46.424453	2020-05-25 10:07:46.424453
7127	56	35	1		2020-05-25 10:07:46.43196	2020-05-25 10:07:46.43196
7128	92	35	4		2020-05-25 10:07:46.443	2020-05-25 10:07:46.443
7129	2	35	3		2020-05-25 10:07:46.447277	2020-05-25 10:07:46.447277
7130	1	35	3		2020-05-25 10:07:46.457645	2020-05-25 10:07:46.457645
7131	54	35	3		2020-05-25 10:07:46.46621	2020-05-25 10:07:46.46621
7132	29	35	4		2020-05-25 10:07:46.474583	2020-05-25 10:07:46.474583
7133	16	35	4		2020-05-25 10:07:46.481493	2020-05-25 10:07:46.481493
7134	28	35	1		2020-05-25 10:07:46.488719	2020-05-25 10:07:46.488719
7135	8	35	0		2020-05-25 10:07:46.495939	2020-05-25 10:07:46.495939
7136	62	35	4		2020-05-25 10:07:46.505979	2020-05-25 10:07:46.505979
7137	95	35	0		2020-05-25 10:07:46.512652	2020-05-25 10:07:46.512652
7138	34	35	4		2020-05-25 10:07:46.521457	2020-05-25 10:07:46.521457
7139	78	35	4		2020-05-25 10:07:46.529689	2020-05-25 10:07:46.529689
7140	17	35	4		2020-05-25 10:07:46.53643	2020-05-25 10:07:46.53643
7141	88	35	3		2020-05-25 10:07:46.544505	2020-05-25 10:07:46.544505
7142	90	35	2		2020-05-25 10:07:46.552439	2020-05-25 10:07:46.552439
7143	3	35	4		2020-05-25 10:07:46.5583	2020-05-25 10:07:46.5583
7144	70	35	0		2020-05-25 10:07:46.565439	2020-05-25 10:07:46.565439
7145	87	35	0		2020-05-25 10:07:46.575625	2020-05-25 10:07:46.575625
7146	49	35	1		2020-05-25 10:07:46.580446	2020-05-25 10:07:46.580446
7147	47	35	1		2020-05-25 10:07:46.590132	2020-05-25 10:07:46.590132
7148	83	35	5		2020-05-25 10:07:46.597343	2020-05-25 10:07:46.597343
7149	18	35	0		2020-05-25 10:07:46.604993	2020-05-25 10:07:46.604993
7150	20	35	2		2020-05-25 10:07:46.61169	2020-05-25 10:07:46.61169
7151	5	35	5		2020-05-25 10:07:46.620617	2020-05-25 10:07:46.620617
7152	82	35	4		2020-05-25 10:07:46.62919	2020-05-25 10:07:46.62919
7153	67	35	0		2020-05-25 10:07:46.637581	2020-05-25 10:07:46.637581
7154	68	35	2		2020-05-25 10:07:46.645673	2020-05-25 10:07:46.645673
7155	65	35	0		2020-05-25 10:07:46.654291	2020-05-25 10:07:46.654291
7156	63	35	4		2020-05-25 10:07:46.66474	2020-05-25 10:07:46.66474
7157	35	35	1		2020-05-25 10:07:46.673964	2020-05-25 10:07:46.673964
7158	96	35	5		2020-05-25 10:07:46.683113	2020-05-25 10:07:46.683113
7159	12	35	5		2020-05-25 10:07:46.694057	2020-05-25 10:07:46.694057
7160	42	35	3		2020-05-25 10:07:46.704651	2020-05-25 10:07:46.704651
7161	77	35	0		2020-05-25 10:07:46.713732	2020-05-25 10:07:46.713732
7162	91	35	1		2020-05-25 10:07:46.721716	2020-05-25 10:07:46.721716
7163	93	35	3		2020-05-25 10:07:46.730624	2020-05-25 10:07:46.730624
7164	79	35	1		2020-05-25 10:07:46.740347	2020-05-25 10:07:46.740347
7165	38	35	4		2020-05-25 10:07:46.749021	2020-05-25 10:07:46.749021
7166	7	35	4		2020-05-25 10:07:46.757475	2020-05-25 10:07:46.757475
7167	64	35	0		2020-05-25 10:07:46.765474	2020-05-25 10:07:46.765474
7168	48	35	3		2020-05-25 10:07:46.779291	2020-05-25 10:07:46.779291
7169	32	35	4		2020-05-25 10:07:46.788337	2020-05-25 10:07:46.788337
7170	76	35	0		2020-05-25 10:07:46.797316	2020-05-25 10:07:46.797316
7171	58	35	5		2020-05-25 10:07:46.809756	2020-05-25 10:07:46.809756
7172	31	35	1		2020-05-25 10:07:46.817178	2020-05-25 10:07:46.817178
7173	84	35	0		2020-05-25 10:07:46.828983	2020-05-25 10:07:46.828983
7174	86	35	4		2020-05-25 10:07:46.837079	2020-05-25 10:07:46.837079
7175	59	35	1		2020-05-25 10:07:46.846034	2020-05-25 10:07:46.846034
7176	94	35	5		2020-05-25 10:07:46.858357	2020-05-25 10:07:46.858357
7177	3	36	1		2020-05-25 10:07:46.86486	2020-05-25 10:07:46.86486
7178	13	36	4		2020-05-25 10:07:46.877336	2020-05-25 10:07:46.877336
7179	23	36	1		2020-05-25 10:07:46.886027	2020-05-25 10:07:46.886027
7180	14	36	3		2020-05-25 10:07:46.894923	2020-05-25 10:07:46.894923
7181	45	36	4		2020-05-25 10:07:46.922173	2020-05-25 10:07:46.922173
7182	24	36	3		2020-05-25 10:07:46.929384	2020-05-25 10:07:46.929384
7183	42	36	4		2020-05-25 10:07:46.939642	2020-05-25 10:07:46.939642
7184	54	36	1		2020-05-25 10:07:46.946925	2020-05-25 10:07:46.946925
7185	4	36	2		2020-05-25 10:07:46.958421	2020-05-25 10:07:46.958421
7186	27	36	2		2020-05-25 10:07:46.962608	2020-05-25 10:07:46.962608
7187	21	36	5		2020-05-25 10:07:46.975926	2020-05-25 10:07:46.975926
7188	34	36	2		2020-05-25 10:07:46.980248	2020-05-25 10:07:46.980248
7189	16	36	1		2020-05-25 10:07:46.993524	2020-05-25 10:07:46.993524
7190	5	36	0		2020-05-25 10:07:47.003639	2020-05-25 10:07:47.003639
7191	17	36	0		2020-05-25 10:07:47.012512	2020-05-25 10:07:47.012512
7192	94	36	3		2020-05-25 10:07:47.020221	2020-05-25 10:07:47.020221
7193	41	36	0		2020-05-25 10:07:47.028396	2020-05-25 10:07:47.028396
7194	90	36	0		2020-05-25 10:07:47.038337	2020-05-25 10:07:47.038337
7195	25	36	0		2020-05-25 10:07:47.046974	2020-05-25 10:07:47.046974
7196	11	36	1		2020-05-25 10:07:47.057404	2020-05-25 10:07:47.057404
7197	28	36	3		2020-05-25 10:07:47.063612	2020-05-25 10:07:47.063612
7198	93	36	1		2020-05-25 10:07:47.076962	2020-05-25 10:07:47.076962
7199	57	36	1		2020-05-25 10:07:47.085897	2020-05-25 10:07:47.085897
7200	59	36	1		2020-05-25 10:07:47.094494	2020-05-25 10:07:47.094494
7201	67	36	5		2020-05-25 10:07:47.103894	2020-05-25 10:07:47.103894
7202	96	36	0		2020-05-25 10:07:47.111946	2020-05-25 10:07:47.111946
7203	97	36	1		2020-05-25 10:07:47.120028	2020-05-25 10:07:47.120028
7204	91	36	0		2020-05-25 10:07:47.127968	2020-05-25 10:07:47.127968
7205	40	36	1		2020-05-25 10:07:47.137342	2020-05-25 10:07:47.137342
7206	58	36	5		2020-05-25 10:07:47.145895	2020-05-25 10:07:47.145895
7207	53	36	2		2020-05-25 10:07:47.153923	2020-05-25 10:07:47.153923
7208	39	36	4		2020-05-25 10:07:47.161835	2020-05-25 10:07:47.161835
7209	86	36	0		2020-05-25 10:07:47.171353	2020-05-25 10:07:47.171353
7210	68	36	2		2020-05-25 10:07:47.17994	2020-05-25 10:07:47.17994
7211	37	36	1		2020-05-25 10:07:47.187564	2020-05-25 10:07:47.187564
7212	60	36	0		2020-05-25 10:07:47.195575	2020-05-25 10:07:47.195575
7213	1	36	0		2020-05-25 10:07:47.205514	2020-05-25 10:07:47.205514
7214	12	36	1		2020-05-25 10:07:47.214615	2020-05-25 10:07:47.214615
7215	74	36	0		2020-05-25 10:07:47.223385	2020-05-25 10:07:47.223385
7216	88	36	0		2020-05-25 10:07:47.230104	2020-05-25 10:07:47.230104
7217	49	36	0		2020-05-25 10:07:47.240515	2020-05-25 10:07:47.240515
7218	7	36	5		2020-05-25 10:07:47.248273	2020-05-25 10:07:47.248273
7219	19	36	5		2020-05-25 10:07:47.260058	2020-05-25 10:07:47.260058
7220	76	36	1		2020-05-25 10:07:47.269087	2020-05-25 10:07:47.269087
7221	61	36	1		2020-05-25 10:07:47.276963	2020-05-25 10:07:47.276963
7222	81	36	0		2020-05-25 10:07:47.287121	2020-05-25 10:07:47.287121
7223	51	36	3		2020-05-25 10:07:47.294203	2020-05-25 10:07:47.294203
7224	95	36	5		2020-05-25 10:07:47.303487	2020-05-25 10:07:47.303487
7225	72	36	3		2020-05-25 10:07:47.311707	2020-05-25 10:07:47.311707
7226	33	36	4		2020-05-25 10:07:47.320853	2020-05-25 10:07:47.320853
7227	48	36	3		2020-05-25 10:07:47.329428	2020-05-25 10:07:47.329428
7228	78	36	0		2020-05-25 10:07:47.337356	2020-05-25 10:07:47.337356
7229	32	36	0		2020-05-25 10:07:47.345415	2020-05-25 10:07:47.345415
7230	84	36	4		2020-05-25 10:07:47.354639	2020-05-25 10:07:47.354639
7231	43	36	0		2020-05-25 10:07:47.362991	2020-05-25 10:07:47.362991
7232	9	36	2		2020-05-25 10:07:47.369702	2020-05-25 10:07:47.369702
7233	85	36	0		2020-05-25 10:07:47.377941	2020-05-25 10:07:47.377941
7234	47	36	1		2020-05-25 10:07:47.387632	2020-05-25 10:07:47.387632
7235	66	36	1		2020-05-25 10:07:47.396143	2020-05-25 10:07:47.396143
7236	99	36	2		2020-05-25 10:07:47.403413	2020-05-25 10:07:47.403413
7237	22	36	3		2020-05-25 10:07:47.411367	2020-05-25 10:07:47.411367
7238	36	36	2		2020-05-25 10:07:47.42007	2020-05-25 10:07:47.42007
7239	0	36	2		2020-05-25 10:07:47.429583	2020-05-25 10:07:47.429583
7240	64	36	1		2020-05-25 10:07:47.437435	2020-05-25 10:07:47.437435
7241	30	36	1		2020-05-25 10:07:47.446229	2020-05-25 10:07:47.446229
7242	89	36	3		2020-05-25 10:07:47.455002	2020-05-25 10:07:47.455002
7243	77	36	3		2020-05-25 10:07:47.462243	2020-05-25 10:07:47.462243
7244	71	36	1		2020-05-25 10:07:47.47055	2020-05-25 10:07:47.47055
7245	6	36	4		2020-05-25 10:07:47.478576	2020-05-25 10:07:47.478576
7246	20	36	3		2020-05-25 10:07:47.485796	2020-05-25 10:07:47.485796
7247	56	36	4		2020-05-25 10:07:47.492546	2020-05-25 10:07:47.492546
7248	79	36	5		2020-05-25 10:07:47.499334	2020-05-25 10:07:47.499334
7249	55	36	5		2020-05-25 10:07:47.511147	2020-05-25 10:07:47.511147
7250	98	37	2		2020-05-25 10:07:47.520154	2020-05-25 10:07:47.520154
7251	78	37	1		2020-05-25 10:07:47.5268	2020-05-25 10:07:47.5268
7252	44	37	3		2020-05-25 10:07:47.536065	2020-05-25 10:07:47.536065
7253	45	37	2		2020-05-25 10:07:47.544221	2020-05-25 10:07:47.544221
7254	28	37	3		2020-05-25 10:07:47.552821	2020-05-25 10:07:47.552821
7255	56	37	2		2020-05-25 10:07:47.559121	2020-05-25 10:07:47.559121
7256	96	37	2		2020-05-25 10:07:47.566135	2020-05-25 10:07:47.566135
7257	72	37	0		2020-05-25 10:07:47.576737	2020-05-25 10:07:47.576737
7258	31	37	1		2020-05-25 10:07:47.58126	2020-05-25 10:07:47.58126
7259	59	37	3		2020-05-25 10:07:47.590372	2020-05-25 10:07:47.590372
7260	60	37	4		2020-05-25 10:07:47.597826	2020-05-25 10:07:47.597826
7261	42	37	4		2020-05-25 10:07:47.603713	2020-05-25 10:07:47.603713
7262	35	37	1		2020-05-25 10:07:47.611203	2020-05-25 10:07:47.611203
7263	54	37	2		2020-05-25 10:07:47.620143	2020-05-25 10:07:47.620143
7264	1	37	3		2020-05-25 10:07:47.629008	2020-05-25 10:07:47.629008
7265	95	37	4		2020-05-25 10:07:47.637099	2020-05-25 10:07:47.637099
7266	74	37	0		2020-05-25 10:07:47.643159	2020-05-25 10:07:47.643159
7267	38	37	3		2020-05-25 10:07:47.653092	2020-05-25 10:07:47.653092
7268	67	37	3		2020-05-25 10:07:47.660972	2020-05-25 10:07:47.660972
7269	34	37	4		2020-05-25 10:07:47.669629	2020-05-25 10:07:47.669629
7270	10	37	2		2020-05-25 10:07:47.676138	2020-05-25 10:07:47.676138
7271	13	37	2		2020-05-25 10:07:47.685812	2020-05-25 10:07:47.685812
7272	48	37	0		2020-05-25 10:07:47.693744	2020-05-25 10:07:47.693744
7273	20	37	3		2020-05-25 10:07:47.702404	2020-05-25 10:07:47.702404
7274	15	37	1		2020-05-25 10:07:47.70953	2020-05-25 10:07:47.70953
7275	5	37	1		2020-05-25 10:07:47.719114	2020-05-25 10:07:47.719114
7276	99	37	3		2020-05-25 10:07:47.725191	2020-05-25 10:07:47.725191
7277	40	37	2		2020-05-25 10:07:47.732592	2020-05-25 10:07:47.732592
7278	92	37	2		2020-05-25 10:07:47.743342	2020-05-25 10:07:47.743342
7279	71	37	4		2020-05-25 10:07:47.752212	2020-05-25 10:07:47.752212
7280	55	37	3		2020-05-25 10:07:47.758427	2020-05-25 10:07:47.758427
7281	73	37	0		2020-05-25 10:07:47.765062	2020-05-25 10:07:47.765062
7282	52	37	4		2020-05-25 10:07:47.775608	2020-05-25 10:07:47.775608
7283	70	37	2		2020-05-25 10:07:47.780063	2020-05-25 10:07:47.780063
7284	97	37	2		2020-05-25 10:07:47.789325	2020-05-25 10:07:47.789325
7285	18	37	1		2020-05-25 10:07:47.796973	2020-05-25 10:07:47.796973
7286	17	37	2		2020-05-25 10:07:47.80497	2020-05-25 10:07:47.80497
7287	3	37	1		2020-05-25 10:07:47.811437	2020-05-25 10:07:47.811437
7288	23	37	0		2020-05-25 10:07:47.819772	2020-05-25 10:07:47.819772
7289	41	37	2		2020-05-25 10:07:47.827767	2020-05-25 10:07:47.827767
7290	6	37	3		2020-05-25 10:07:47.835456	2020-05-25 10:07:47.835456
7291	93	37	0		2020-05-25 10:07:47.841428	2020-05-25 10:07:47.841428
7292	65	37	3		2020-05-25 10:07:47.848533	2020-05-25 10:07:47.848533
7293	4	37	1		2020-05-25 10:07:47.85897	2020-05-25 10:07:47.85897
7294	53	37	3		2020-05-25 10:07:47.863551	2020-05-25 10:07:47.863551
7295	39	37	4		2020-05-25 10:07:47.872784	2020-05-25 10:07:47.872784
7296	82	37	1		2020-05-25 10:07:47.880183	2020-05-25 10:07:47.880183
7297	62	37	0		2020-05-25 10:07:47.888194	2020-05-25 10:07:47.888194
7298	0	37	5		2020-05-25 10:07:47.894343	2020-05-25 10:07:47.894343
7299	89	37	0		2020-05-25 10:07:47.901979	2020-05-25 10:07:47.901979
7300	2	37	0		2020-05-25 10:07:47.909972	2020-05-25 10:07:47.909972
7301	81	37	1		2020-05-25 10:07:47.918728	2020-05-25 10:07:47.918728
7302	14	37	2		2020-05-25 10:07:47.927419	2020-05-25 10:07:47.927419
7303	16	37	1		2020-05-25 10:07:47.936287	2020-05-25 10:07:47.936287
7304	66	37	4		2020-05-25 10:07:47.944158	2020-05-25 10:07:47.944158
7305	47	37	5		2020-05-25 10:07:47.952545	2020-05-25 10:07:47.952545
7306	46	37	0		2020-05-25 10:07:47.961	2020-05-25 10:07:47.961
7307	9	37	3		2020-05-25 10:07:47.96874	2020-05-25 10:07:47.96874
7308	69	37	3		2020-05-25 10:07:47.976821	2020-05-25 10:07:47.976821
7309	51	37	2		2020-05-25 10:07:47.985833	2020-05-25 10:07:47.985833
7310	49	37	0		2020-05-25 10:07:47.994036	2020-05-25 10:07:47.994036
7311	11	37	5		2020-05-25 10:07:48.004027	2020-05-25 10:07:48.004027
7312	24	37	4		2020-05-25 10:07:48.012138	2020-05-25 10:07:48.012138
7313	87	37	4		2020-05-25 10:07:48.021892	2020-05-25 10:07:48.021892
7314	33	37	3		2020-05-25 10:07:48.030285	2020-05-25 10:07:48.030285
7315	84	37	0		2020-05-25 10:07:48.039551	2020-05-25 10:07:48.039551
7316	58	37	2		2020-05-25 10:07:48.046231	2020-05-25 10:07:48.046231
7317	86	37	5		2020-05-25 10:07:48.053911	2020-05-25 10:07:48.053911
7318	68	37	0		2020-05-25 10:07:48.06236	2020-05-25 10:07:48.06236
7319	50	37	3		2020-05-25 10:07:48.069025	2020-05-25 10:07:48.069025
7320	26	37	1		2020-05-25 10:07:48.077159	2020-05-25 10:07:48.077159
7321	30	37	2		2020-05-25 10:07:48.085668	2020-05-25 10:07:48.085668
7322	25	37	4		2020-05-25 10:07:48.094174	2020-05-25 10:07:48.094174
7323	7	37	3		2020-05-25 10:07:48.102116	2020-05-25 10:07:48.102116
7324	75	37	2		2020-05-25 10:07:48.108745	2020-05-25 10:07:48.108745
7325	57	37	2		2020-05-25 10:07:48.115299	2020-05-25 10:07:48.115299
7326	22	37	1		2020-05-25 10:07:48.126032	2020-05-25 10:07:48.126032
7327	94	37	4		2020-05-25 10:07:48.134899	2020-05-25 10:07:48.134899
7328	8	37	2		2020-05-25 10:07:48.142944	2020-05-25 10:07:48.142944
7329	63	37	5		2020-05-25 10:07:48.148255	2020-05-25 10:07:48.148255
7330	27	37	4		2020-05-25 10:07:48.157753	2020-05-25 10:07:48.157753
7331	77	37	2		2020-05-25 10:07:48.165414	2020-05-25 10:07:48.165414
7332	85	37	1		2020-05-25 10:07:48.176494	2020-05-25 10:07:48.176494
7333	79	37	3		2020-05-25 10:07:48.185482	2020-05-25 10:07:48.185482
7334	88	37	4		2020-05-25 10:07:48.193893	2020-05-25 10:07:48.193893
7335	83	37	4		2020-05-25 10:07:48.198749	2020-05-25 10:07:48.198749
7336	29	37	3		2020-05-25 10:07:48.229083	2020-05-25 10:07:48.229083
7337	90	37	2		2020-05-25 10:07:48.234152	2020-05-25 10:07:48.234152
7338	61	37	4		2020-05-25 10:07:48.245591	2020-05-25 10:07:48.245591
7339	32	37	4		2020-05-25 10:07:48.253089	2020-05-25 10:07:48.253089
7340	43	37	1		2020-05-25 10:07:48.261187	2020-05-25 10:07:48.261187
7341	37	37	1		2020-05-25 10:07:48.269014	2020-05-25 10:07:48.269014
7342	80	37	3		2020-05-25 10:07:48.277629	2020-05-25 10:07:48.277629
7343	76	37	5		2020-05-25 10:07:48.285701	2020-05-25 10:07:48.285701
7344	21	37	4		2020-05-25 10:07:48.29418	2020-05-25 10:07:48.29418
7345	19	37	0		2020-05-25 10:07:48.303794	2020-05-25 10:07:48.303794
7346	36	37	4		2020-05-25 10:07:48.312824	2020-05-25 10:07:48.312824
7347	12	37	4		2020-05-25 10:07:48.322223	2020-05-25 10:07:48.322223
7348	64	37	2		2020-05-25 10:07:48.331159	2020-05-25 10:07:48.331159
7349	68	38	4		2020-05-25 10:07:48.339173	2020-05-25 10:07:48.339173
7350	73	38	3		2020-05-25 10:07:48.345819	2020-05-25 10:07:48.345819
7351	18	38	1		2020-05-25 10:07:48.353787	2020-05-25 10:07:48.353787
7352	87	38	4		2020-05-25 10:07:48.362395	2020-05-25 10:07:48.362395
7353	1	38	2		2020-05-25 10:07:48.369543	2020-05-25 10:07:48.369543
7354	10	38	5		2020-05-25 10:07:48.377796	2020-05-25 10:07:48.377796
7355	35	38	1		2020-05-25 10:07:48.387132	2020-05-25 10:07:48.387132
7356	61	38	3		2020-05-25 10:07:48.395515	2020-05-25 10:07:48.395515
7357	44	38	4		2020-05-25 10:07:48.404475	2020-05-25 10:07:48.404475
7358	75	38	5		2020-05-25 10:07:48.413951	2020-05-25 10:07:48.413951
7359	83	38	0		2020-05-25 10:07:48.421105	2020-05-25 10:07:48.421105
7360	78	38	1		2020-05-25 10:07:48.429284	2020-05-25 10:07:48.429284
7361	51	38	0		2020-05-25 10:07:48.438466	2020-05-25 10:07:48.438466
7362	57	38	2		2020-05-25 10:07:48.448349	2020-05-25 10:07:48.448349
7363	62	38	4		2020-05-25 10:07:48.454909	2020-05-25 10:07:48.454909
7364	17	38	2		2020-05-25 10:07:48.463642	2020-05-25 10:07:48.463642
7365	50	38	3		2020-05-25 10:07:48.473371	2020-05-25 10:07:48.473371
7366	38	38	2		2020-05-25 10:07:48.481871	2020-05-25 10:07:48.481871
7367	76	38	1		2020-05-25 10:07:48.491761	2020-05-25 10:07:48.491761
7368	43	38	0		2020-05-25 10:07:48.499287	2020-05-25 10:07:48.499287
7369	0	38	5		2020-05-25 10:07:48.513046	2020-05-25 10:07:48.513046
7370	21	38	0		2020-05-25 10:07:48.522818	2020-05-25 10:07:48.522818
7371	6	38	1		2020-05-25 10:07:48.531906	2020-05-25 10:07:48.531906
7372	12	38	4		2020-05-25 10:07:48.541173	2020-05-25 10:07:48.541173
7373	34	38	2		2020-05-25 10:07:48.549477	2020-05-25 10:07:48.549477
7374	20	38	1		2020-05-25 10:07:48.562353	2020-05-25 10:07:48.562353
7375	84	38	4		2020-05-25 10:07:48.572219	2020-05-25 10:07:48.572219
7376	49	38	2		2020-05-25 10:07:48.581202	2020-05-25 10:07:48.581202
7377	48	38	1		2020-05-25 10:07:48.59318	2020-05-25 10:07:48.59318
7378	82	38	0		2020-05-25 10:07:48.600249	2020-05-25 10:07:48.600249
7379	13	38	2		2020-05-25 10:07:48.612299	2020-05-25 10:07:48.612299
7380	54	38	4		2020-05-25 10:07:48.625608	2020-05-25 10:07:48.625608
7381	97	38	5		2020-05-25 10:07:48.630295	2020-05-25 10:07:48.630295
7382	89	38	3		2020-05-25 10:07:48.642756	2020-05-25 10:07:48.642756
7383	93	38	2		2020-05-25 10:07:48.648112	2020-05-25 10:07:48.648112
7384	11	38	3		2020-05-25 10:07:48.659687	2020-05-25 10:07:48.659687
7385	65	38	5		2020-05-25 10:07:48.669077	2020-05-25 10:07:48.669077
7386	67	38	0		2020-05-25 10:07:48.677875	2020-05-25 10:07:48.677875
7387	45	38	3		2020-05-25 10:07:48.687618	2020-05-25 10:07:48.687618
7388	31	38	0		2020-05-25 10:07:48.696085	2020-05-25 10:07:48.696085
7389	80	38	3		2020-05-25 10:07:48.706386	2020-05-25 10:07:48.706386
7390	26	38	5		2020-05-25 10:07:48.712062	2020-05-25 10:07:48.712062
7391	29	38	1		2020-05-25 10:07:48.723555	2020-05-25 10:07:48.723555
7392	88	38	4		2020-05-25 10:07:48.730401	2020-05-25 10:07:48.730401
7393	6	39	0		2020-05-25 10:07:48.741666	2020-05-25 10:07:48.741666
7394	51	39	4		2020-05-25 10:07:48.748593	2020-05-25 10:07:48.748593
7395	48	39	4		2020-05-25 10:07:48.759621	2020-05-25 10:07:48.759621
7396	54	39	4		2020-05-25 10:07:48.768977	2020-05-25 10:07:48.768977
7397	70	39	2		2020-05-25 10:07:48.777697	2020-05-25 10:07:48.777697
7398	47	39	2		2020-05-25 10:07:48.787264	2020-05-25 10:07:48.787264
7399	82	39	3		2020-05-25 10:07:48.795129	2020-05-25 10:07:48.795129
7400	85	39	1		2020-05-25 10:07:48.802443	2020-05-25 10:07:48.802443
7401	69	39	3		2020-05-25 10:07:48.810918	2020-05-25 10:07:48.810918
7402	36	39	1		2020-05-25 10:07:48.818729	2020-05-25 10:07:48.818729
7403	28	39	5		2020-05-25 10:07:48.827106	2020-05-25 10:07:48.827106
7404	77	39	2		2020-05-25 10:07:48.836274	2020-05-25 10:07:48.836274
7405	37	39	3		2020-05-25 10:07:48.844092	2020-05-25 10:07:48.844092
7406	92	39	0		2020-05-25 10:07:48.853309	2020-05-25 10:07:48.853309
7407	25	39	4		2020-05-25 10:07:48.861348	2020-05-25 10:07:48.861348
7408	17	39	2		2020-05-25 10:07:48.869489	2020-05-25 10:07:48.869489
7409	40	39	0		2020-05-25 10:07:48.877631	2020-05-25 10:07:48.877631
7410	3	39	0		2020-05-25 10:07:48.882434	2020-05-25 10:07:48.882434
7411	15	39	1		2020-05-25 10:07:48.893499	2020-05-25 10:07:48.893499
7412	26	39	1		2020-05-25 10:07:48.901332	2020-05-25 10:07:48.901332
7413	13	39	3		2020-05-25 10:07:48.907187	2020-05-25 10:07:48.907187
7414	79	39	5		2020-05-25 10:07:48.914691	2020-05-25 10:07:48.914691
7415	91	39	2		2020-05-25 10:07:48.922326	2020-05-25 10:07:48.922326
7416	84	39	0		2020-05-25 10:07:48.929107	2020-05-25 10:07:48.929107
7417	30	39	1		2020-05-25 10:07:48.936433	2020-05-25 10:07:48.936433
7418	58	39	0		2020-05-25 10:07:48.942852	2020-05-25 10:07:48.942852
7419	7	39	4		2020-05-25 10:07:48.948876	2020-05-25 10:07:48.948876
7420	4	39	3		2020-05-25 10:07:48.959862	2020-05-25 10:07:48.959862
7421	16	39	2		2020-05-25 10:07:48.969038	2020-05-25 10:07:48.969038
7422	90	39	5		2020-05-25 10:07:48.975378	2020-05-25 10:07:48.975378
7423	95	39	1		2020-05-25 10:07:48.981895	2020-05-25 10:07:48.981895
7424	65	39	0		2020-05-25 10:07:48.992521	2020-05-25 10:07:48.992521
7425	56	39	1		2020-05-25 10:07:49.003106	2020-05-25 10:07:49.003106
7426	75	39	0		2020-05-25 10:07:49.010531	2020-05-25 10:07:49.010531
7427	8	39	1		2020-05-25 10:07:49.019647	2020-05-25 10:07:49.019647
7428	39	39	1		2020-05-25 10:07:49.025753	2020-05-25 10:07:49.025753
7429	50	39	1		2020-05-25 10:07:49.036025	2020-05-25 10:07:49.036025
7430	98	39	3		2020-05-25 10:07:49.044124	2020-05-25 10:07:49.044124
7431	0	39	4		2020-05-25 10:07:49.05261	2020-05-25 10:07:49.05261
7432	60	39	5		2020-05-25 10:07:49.058691	2020-05-25 10:07:49.058691
7433	10	39	5		2020-05-25 10:07:49.065418	2020-05-25 10:07:49.065418
7434	42	39	2		2020-05-25 10:07:49.075707	2020-05-25 10:07:49.075707
7435	99	39	2		2020-05-25 10:07:49.080212	2020-05-25 10:07:49.080212
7436	72	39	1		2020-05-25 10:07:49.089809	2020-05-25 10:07:49.089809
7437	88	39	0		2020-05-25 10:07:49.097049	2020-05-25 10:07:49.097049
7438	78	39	1		2020-05-25 10:07:49.105097	2020-05-25 10:07:49.105097
7439	61	39	2		2020-05-25 10:07:49.112251	2020-05-25 10:07:49.112251
7440	19	39	2		2020-05-25 10:07:49.120405	2020-05-25 10:07:49.120405
7441	73	39	2		2020-05-25 10:07:49.128134	2020-05-25 10:07:49.128134
7442	22	39	3		2020-05-25 10:07:49.137014	2020-05-25 10:07:49.137014
7443	12	39	3		2020-05-25 10:07:49.143302	2020-05-25 10:07:49.143302
7444	11	39	3		2020-05-25 10:07:49.153008	2020-05-25 10:07:49.153008
7445	1	39	3		2020-05-25 10:07:49.160824	2020-05-25 10:07:49.160824
7446	57	39	1		2020-05-25 10:07:49.168954	2020-05-25 10:07:49.168954
7447	35	39	3		2020-05-25 10:07:49.175037	2020-05-25 10:07:49.175037
7448	21	39	4		2020-05-25 10:07:49.181643	2020-05-25 10:07:49.181643
7449	41	39	0		2020-05-25 10:07:49.191693	2020-05-25 10:07:49.191693
7450	97	39	3		2020-05-25 10:07:49.196159	2020-05-25 10:07:49.196159
7451	64	39	4		2020-05-25 10:07:49.205798	2020-05-25 10:07:49.205798
7452	29	39	5		2020-05-25 10:07:49.213279	2020-05-25 10:07:49.213279
7453	44	39	3		2020-05-25 10:07:49.222069	2020-05-25 10:07:49.222069
7454	66	39	1		2020-05-25 10:07:49.230408	2020-05-25 10:07:49.230408
7455	2	39	1		2020-05-25 10:07:49.237895	2020-05-25 10:07:49.237895
7456	9	39	4		2020-05-25 10:07:49.24527	2020-05-25 10:07:49.24527
7457	31	39	0		2020-05-25 10:07:49.25424	2020-05-25 10:07:49.25424
7458	55	39	1		2020-05-25 10:07:49.261727	2020-05-25 10:07:49.261727
7459	18	39	0		2020-05-25 10:07:49.269042	2020-05-25 10:07:49.269042
7460	53	39	0		2020-05-25 10:07:49.277017	2020-05-25 10:07:49.277017
7461	20	39	0		2020-05-25 10:07:49.285336	2020-05-25 10:07:49.285336
7462	52	39	3		2020-05-25 10:07:49.291685	2020-05-25 10:07:49.291685
7463	45	39	0		2020-05-25 10:07:49.29833	2020-05-25 10:07:49.29833
7464	83	39	5		2020-05-25 10:07:49.307884	2020-05-25 10:07:49.307884
7465	93	39	4		2020-05-25 10:07:49.315711	2020-05-25 10:07:49.315711
7466	96	39	0		2020-05-25 10:07:49.326659	2020-05-25 10:07:49.326659
7467	33	39	2		2020-05-25 10:07:49.335705	2020-05-25 10:07:49.335705
7468	86	39	2		2020-05-25 10:07:49.341728	2020-05-25 10:07:49.341728
7469	5	39	2		2020-05-25 10:07:49.349435	2020-05-25 10:07:49.349435
7470	49	39	3		2020-05-25 10:07:49.36018	2020-05-25 10:07:49.36018
7471	74	39	3		2020-05-25 10:07:49.368996	2020-05-25 10:07:49.368996
7472	89	39	0		2020-05-25 10:07:49.375074	2020-05-25 10:07:49.375074
7473	63	39	5		2020-05-25 10:07:49.382043	2020-05-25 10:07:49.382043
7474	7	40	0		2020-05-25 10:07:49.392126	2020-05-25 10:07:49.392126
7475	22	40	3		2020-05-25 10:07:49.396669	2020-05-25 10:07:49.396669
7476	34	40	5		2020-05-25 10:07:49.407982	2020-05-25 10:07:49.407982
7477	31	40	2		2020-05-25 10:07:49.41471	2020-05-25 10:07:49.41471
7478	98	40	2		2020-05-25 10:07:49.423933	2020-05-25 10:07:49.423933
7479	74	40	2		2020-05-25 10:07:49.431853	2020-05-25 10:07:49.431853
7480	84	40	4		2020-05-25 10:07:49.438151	2020-05-25 10:07:49.438151
7481	42	40	4		2020-05-25 10:07:49.445622	2020-05-25 10:07:49.445622
7482	9	40	4		2020-05-25 10:07:49.453934	2020-05-25 10:07:49.453934
7483	6	40	4		2020-05-25 10:07:49.461357	2020-05-25 10:07:49.461357
7484	68	40	2		2020-05-25 10:07:49.469571	2020-05-25 10:07:49.469571
7485	28	40	2		2020-05-25 10:07:49.477542	2020-05-25 10:07:49.477542
7486	49	40	0		2020-05-25 10:07:49.486031	2020-05-25 10:07:49.486031
7487	90	40	0		2020-05-25 10:07:49.492256	2020-05-25 10:07:49.492256
7488	70	40	4		2020-05-25 10:07:49.498671	2020-05-25 10:07:49.498671
7489	80	40	4		2020-05-25 10:07:49.510094	2020-05-25 10:07:49.510094
7490	40	40	3		2020-05-25 10:07:49.519026	2020-05-25 10:07:49.519026
7491	16	40	0		2020-05-25 10:07:49.546191	2020-05-25 10:07:49.546191
7492	65	40	0		2020-05-25 10:07:49.552228	2020-05-25 10:07:49.552228
7493	2	40	4		2020-05-25 10:07:49.560574	2020-05-25 10:07:49.560574
7494	37	40	2		2020-05-25 10:07:49.569941	2020-05-25 10:07:49.569941
7495	88	40	1		2020-05-25 10:07:49.578081	2020-05-25 10:07:49.578081
7496	27	40	4		2020-05-25 10:07:49.586201	2020-05-25 10:07:49.586201
7497	66	40	1		2020-05-25 10:07:49.592772	2020-05-25 10:07:49.592772
7498	62	40	1		2020-05-25 10:07:49.599295	2020-05-25 10:07:49.599295
7499	32	40	5		2020-05-25 10:07:49.608981	2020-05-25 10:07:49.608981
7500	99	40	0		2020-05-25 10:07:49.618393	2020-05-25 10:07:49.618393
7501	63	40	4		2020-05-25 10:07:49.62461	2020-05-25 10:07:49.62461
7502	53	40	0		2020-05-25 10:07:49.631465	2020-05-25 10:07:49.631465
7503	57	40	2		2020-05-25 10:07:49.640199	2020-05-25 10:07:49.640199
7504	0	40	3		2020-05-25 10:07:49.648047	2020-05-25 10:07:49.648047
7505	41	40	1		2020-05-25 10:07:49.655762	2020-05-25 10:07:49.655762
7506	56	40	0		2020-05-25 10:07:49.662845	2020-05-25 10:07:49.662845
7507	30	40	4		2020-05-25 10:07:49.671604	2020-05-25 10:07:49.671604
7508	72	40	2		2020-05-25 10:07:49.679876	2020-05-25 10:07:49.679876
7509	71	40	2		2020-05-25 10:07:49.686231	2020-05-25 10:07:49.686231
7510	47	40	2		2020-05-25 10:07:49.694031	2020-05-25 10:07:49.694031
7511	15	40	4		2020-05-25 10:07:49.702081	2020-05-25 10:07:49.702081
7512	23	40	0		2020-05-25 10:07:49.708313	2020-05-25 10:07:49.708313
7513	25	40	4		2020-05-25 10:07:49.715024	2020-05-25 10:07:49.715024
7514	78	40	4		2020-05-25 10:07:49.726427	2020-05-25 10:07:49.726427
7515	12	40	2		2020-05-25 10:07:49.731574	2020-05-25 10:07:49.731574
7516	43	40	4		2020-05-25 10:07:49.742273	2020-05-25 10:07:49.742273
7517	61	40	4		2020-05-25 10:07:49.751657	2020-05-25 10:07:49.751657
7518	87	40	3		2020-05-25 10:07:49.759605	2020-05-25 10:07:49.759605
7519	4	40	0		2020-05-25 10:07:49.768296	2020-05-25 10:07:49.768296
7520	96	40	0		2020-05-25 10:07:49.775683	2020-05-25 10:07:49.775683
7521	79	40	3		2020-05-25 10:07:49.781638	2020-05-25 10:07:49.781638
7522	69	40	0		2020-05-25 10:07:49.790619	2020-05-25 10:07:49.790619
7523	64	40	3		2020-05-25 10:07:49.798324	2020-05-25 10:07:49.798324
7524	44	40	4		2020-05-25 10:07:49.805497	2020-05-25 10:07:49.805497
7525	97	40	2		2020-05-25 10:07:49.812252	2020-05-25 10:07:49.812252
7526	95	40	0		2020-05-25 10:07:49.820689	2020-05-25 10:07:49.820689
7527	8	40	0		2020-05-25 10:07:49.828127	2020-05-25 10:07:49.828127
7528	58	40	0		2020-05-25 10:07:49.836211	2020-05-25 10:07:49.836211
7529	67	40	4		2020-05-25 10:07:49.85026	2020-05-25 10:07:49.85026
7530	19	40	3		2020-05-25 10:07:49.85654	2020-05-25 10:07:49.85654
7531	85	40	0		2020-05-25 10:07:49.864012	2020-05-25 10:07:49.864012
7532	46	40	3		2020-05-25 10:07:49.872085	2020-05-25 10:07:49.872085
7533	10	40	1		2020-05-25 10:07:49.878857	2020-05-25 10:07:49.878857
7534	76	40	0		2020-05-25 10:07:49.887707	2020-05-25 10:07:49.887707
7535	77	40	2		2020-05-25 10:07:49.895821	2020-05-25 10:07:49.895821
7536	50	40	0		2020-05-25 10:07:49.903355	2020-05-25 10:07:49.903355
7537	21	41	3		2020-05-25 10:07:49.909277	2020-05-25 10:07:49.909277
7538	7	41	1		2020-05-25 10:07:49.916348	2020-05-25 10:07:49.916348
7539	54	41	1		2020-05-25 10:07:49.925717	2020-05-25 10:07:49.925717
7540	26	41	0		2020-05-25 10:07:49.93069	2020-05-25 10:07:49.93069
7541	45	41	4		2020-05-25 10:07:49.939999	2020-05-25 10:07:49.939999
7542	67	41	4		2020-05-25 10:07:49.947675	2020-05-25 10:07:49.947675
7543	16	41	0		2020-05-25 10:07:49.953726	2020-05-25 10:07:49.953726
7544	20	41	2		2020-05-25 10:07:49.960937	2020-05-25 10:07:49.960937
7545	34	41	2		2020-05-25 10:07:49.970757	2020-05-25 10:07:49.970757
7546	5	41	5		2020-05-25 10:07:49.979082	2020-05-25 10:07:49.979082
7547	66	41	4		2020-05-25 10:07:49.986872	2020-05-25 10:07:49.986872
7548	79	41	3		2020-05-25 10:07:49.99294	2020-05-25 10:07:49.99294
7549	70	41	0		2020-05-25 10:07:50.004243	2020-05-25 10:07:50.004243
7550	62	41	3		2020-05-25 10:07:50.01187	2020-05-25 10:07:50.01187
7551	47	41	0		2020-05-25 10:07:50.020962	2020-05-25 10:07:50.020962
7552	49	41	3		2020-05-25 10:07:50.027471	2020-05-25 10:07:50.027471
7553	38	41	0		2020-05-25 10:07:50.03713	2020-05-25 10:07:50.03713
7554	82	41	0		2020-05-25 10:07:50.045009	2020-05-25 10:07:50.045009
7555	60	41	1		2020-05-25 10:07:50.053263	2020-05-25 10:07:50.053263
7556	48	41	3		2020-05-25 10:07:50.059608	2020-05-25 10:07:50.059608
7557	19	41	0		2020-05-25 10:07:50.069146	2020-05-25 10:07:50.069146
7558	40	41	1		2020-05-25 10:07:50.07705	2020-05-25 10:07:50.07705
7559	39	41	1		2020-05-25 10:07:50.085508	2020-05-25 10:07:50.085508
7560	83	41	4		2020-05-25 10:07:50.091776	2020-05-25 10:07:50.091776
7561	99	41	1		2020-05-25 10:07:50.098329	2020-05-25 10:07:50.098329
7562	65	41	4		2020-05-25 10:07:50.107196	2020-05-25 10:07:50.107196
7563	19	42	0		2020-05-25 10:07:50.11495	2020-05-25 10:07:50.11495
7564	26	42	0		2020-05-25 10:07:50.120914	2020-05-25 10:07:50.120914
7565	18	42	3		2020-05-25 10:07:50.128231	2020-05-25 10:07:50.128231
7566	95	42	5		2020-05-25 10:07:50.137141	2020-05-25 10:07:50.137141
7567	22	42	1		2020-05-25 10:07:50.145177	2020-05-25 10:07:50.145177
7568	9	42	5		2020-05-25 10:07:50.152885	2020-05-25 10:07:50.152885
7569	97	42	5		2020-05-25 10:07:50.158896	2020-05-25 10:07:50.158896
7570	88	42	2		2020-05-25 10:07:50.168887	2020-05-25 10:07:50.168887
7571	90	42	0		2020-05-25 10:07:50.177079	2020-05-25 10:07:50.177079
7572	84	42	2		2020-05-25 10:07:50.18474	2020-05-25 10:07:50.18474
7573	44	42	4		2020-05-25 10:07:50.19104	2020-05-25 10:07:50.19104
7574	54	42	0		2020-05-25 10:07:50.197842	2020-05-25 10:07:50.197842
7575	14	42	4		2020-05-25 10:07:50.208429	2020-05-25 10:07:50.208429
7576	51	42	3		2020-05-25 10:07:50.21299	2020-05-25 10:07:50.21299
7577	32	42	3		2020-05-25 10:07:50.222412	2020-05-25 10:07:50.222412
7578	59	42	3		2020-05-25 10:07:50.2299	2020-05-25 10:07:50.2299
7579	89	42	1		2020-05-25 10:07:50.238704	2020-05-25 10:07:50.238704
7580	76	42	5		2020-05-25 10:07:50.246536	2020-05-25 10:07:50.246536
7581	29	42	0		2020-05-25 10:07:50.254212	2020-05-25 10:07:50.254212
7582	73	42	1		2020-05-25 10:07:50.261798	2020-05-25 10:07:50.261798
7583	99	42	2		2020-05-25 10:07:50.270455	2020-05-25 10:07:50.270455
7584	4	42	5		2020-05-25 10:07:50.278497	2020-05-25 10:07:50.278497
7585	50	42	0		2020-05-25 10:07:50.286256	2020-05-25 10:07:50.286256
7586	10	42	0		2020-05-25 10:07:50.292386	2020-05-25 10:07:50.292386
7587	25	42	5		2020-05-25 10:07:50.299714	2020-05-25 10:07:50.299714
7588	37	42	3		2020-05-25 10:07:50.310137	2020-05-25 10:07:50.310137
7589	60	42	4		2020-05-25 10:07:50.319053	2020-05-25 10:07:50.319053
7590	47	42	4		2020-05-25 10:07:50.326968	2020-05-25 10:07:50.326968
7591	43	42	3		2020-05-25 10:07:50.336649	2020-05-25 10:07:50.336649
7592	66	42	1		2020-05-25 10:07:50.344638	2020-05-25 10:07:50.344638
7593	77	42	3		2020-05-25 10:07:50.353214	2020-05-25 10:07:50.353214
7594	98	42	4		2020-05-25 10:07:50.359649	2020-05-25 10:07:50.359649
7595	61	42	1		2020-05-25 10:07:50.36906	2020-05-25 10:07:50.36906
7596	16	42	3		2020-05-25 10:07:50.37692	2020-05-25 10:07:50.37692
7597	3	42	4		2020-05-25 10:07:50.385369	2020-05-25 10:07:50.385369
7598	56	42	2		2020-05-25 10:07:50.391411	2020-05-25 10:07:50.391411
7599	94	42	5		2020-05-25 10:07:50.398361	2020-05-25 10:07:50.398361
7600	24	42	3		2020-05-25 10:07:50.406704	2020-05-25 10:07:50.406704
7601	17	42	3		2020-05-25 10:07:50.415327	2020-05-25 10:07:50.415327
7602	45	42	0		2020-05-25 10:07:50.422396	2020-05-25 10:07:50.422396
7603	87	42	0		2020-05-25 10:07:50.42962	2020-05-25 10:07:50.42962
7604	1	42	1		2020-05-25 10:07:50.437724	2020-05-25 10:07:50.437724
7605	62	42	4		2020-05-25 10:07:50.445358	2020-05-25 10:07:50.445358
7606	58	42	3		2020-05-25 10:07:50.453151	2020-05-25 10:07:50.453151
7607	38	42	1		2020-05-25 10:07:50.461011	2020-05-25 10:07:50.461011
7608	7	42	1		2020-05-25 10:07:50.470103	2020-05-25 10:07:50.470103
7609	55	42	4		2020-05-25 10:07:50.47666	2020-05-25 10:07:50.47666
7610	5	42	3		2020-05-25 10:07:50.485561	2020-05-25 10:07:50.485561
7611	91	42	3		2020-05-25 10:07:50.493596	2020-05-25 10:07:50.493596
7612	33	42	1		2020-05-25 10:07:50.503328	2020-05-25 10:07:50.503328
7613	74	42	2		2020-05-25 10:07:50.511234	2020-05-25 10:07:50.511234
7614	46	43	1		2020-05-25 10:07:50.518865	2020-05-25 10:07:50.518865
7615	31	43	2		2020-05-25 10:07:50.527036	2020-05-25 10:07:50.527036
7616	65	43	4		2020-05-25 10:07:50.535466	2020-05-25 10:07:50.535466
7617	25	43	0		2020-05-25 10:07:50.541752	2020-05-25 10:07:50.541752
7618	48	43	0		2020-05-25 10:07:50.548525	2020-05-25 10:07:50.548525
7619	38	43	3		2020-05-25 10:07:50.557495	2020-05-25 10:07:50.557495
7620	53	43	0		2020-05-25 10:07:50.565183	2020-05-25 10:07:50.565183
7621	26	43	0		2020-05-25 10:07:50.576174	2020-05-25 10:07:50.576174
7622	92	43	5		2020-05-25 10:07:50.58056	2020-05-25 10:07:50.58056
7623	44	43	3		2020-05-25 10:07:50.589724	2020-05-25 10:07:50.589724
7624	18	43	0		2020-05-25 10:07:50.597796	2020-05-25 10:07:50.597796
7625	69	43	4		2020-05-25 10:07:50.604911	2020-05-25 10:07:50.604911
7626	55	43	0		2020-05-25 10:07:50.612213	2020-05-25 10:07:50.612213
7627	68	43	3		2020-05-25 10:07:50.620868	2020-05-25 10:07:50.620868
7628	36	43	2		2020-05-25 10:07:50.628721	2020-05-25 10:07:50.628721
7629	89	43	0		2020-05-25 10:07:50.635284	2020-05-25 10:07:50.635284
7630	32	43	1		2020-05-25 10:07:50.643916	2020-05-25 10:07:50.643916
7631	10	43	2		2020-05-25 10:07:50.651531	2020-05-25 10:07:50.651531
7632	40	43	1		2020-05-25 10:07:50.657547	2020-05-25 10:07:50.657547
7633	49	43	3		2020-05-25 10:07:50.664555	2020-05-25 10:07:50.664555
7634	50	43	4		2020-05-25 10:07:50.673698	2020-05-25 10:07:50.673698
7635	93	43	3		2020-05-25 10:07:50.681824	2020-05-25 10:07:50.681824
7636	96	43	2		2020-05-25 10:07:50.688039	2020-05-25 10:07:50.688039
7637	90	43	2		2020-05-25 10:07:50.695283	2020-05-25 10:07:50.695283
7638	39	43	5		2020-05-25 10:07:50.704122	2020-05-25 10:07:50.704122
7639	52	43	2		2020-05-25 10:07:50.71206	2020-05-25 10:07:50.71206
7640	2	43	1		2020-05-25 10:07:50.718546	2020-05-25 10:07:50.718546
7641	80	43	3		2020-05-25 10:07:50.726509	2020-05-25 10:07:50.726509
7642	73	43	4		2020-05-25 10:07:50.735013	2020-05-25 10:07:50.735013
7643	35	43	2		2020-05-25 10:07:50.741274	2020-05-25 10:07:50.741274
7644	14	43	0		2020-05-25 10:07:50.748261	2020-05-25 10:07:50.748261
7645	76	43	4		2020-05-25 10:07:50.757152	2020-05-25 10:07:50.757152
7646	81	43	0		2020-05-25 10:07:50.765265	2020-05-25 10:07:50.765265
7647	7	43	5		2020-05-25 10:07:50.791323	2020-05-25 10:07:50.791323
7648	74	43	3		2020-05-25 10:07:50.798104	2020-05-25 10:07:50.798104
7649	3	43	2		2020-05-25 10:07:50.80728	2020-05-25 10:07:50.80728
7650	19	43	3		2020-05-25 10:07:50.815127	2020-05-25 10:07:50.815127
7651	29	43	1		2020-05-25 10:07:50.821705	2020-05-25 10:07:50.821705
7652	57	43	2		2020-05-25 10:07:50.828651	2020-05-25 10:07:50.828651
7653	94	43	2		2020-05-25 10:07:50.837132	2020-05-25 10:07:50.837132
7654	84	43	4		2020-05-25 10:07:50.845399	2020-05-25 10:07:50.845399
7655	22	43	0		2020-05-25 10:07:50.853813	2020-05-25 10:07:50.853813
7656	71	43	4		2020-05-25 10:07:50.859696	2020-05-25 10:07:50.859696
7657	75	43	1		2020-05-25 10:07:50.869716	2020-05-25 10:07:50.869716
7658	8	43	3		2020-05-25 10:07:50.877544	2020-05-25 10:07:50.877544
7659	45	43	4		2020-05-25 10:07:50.885471	2020-05-25 10:07:50.885471
7660	27	43	2		2020-05-25 10:07:50.891447	2020-05-25 10:07:50.891447
7661	61	43	0		2020-05-25 10:07:50.898369	2020-05-25 10:07:50.898369
7662	58	43	2		2020-05-25 10:07:50.907895	2020-05-25 10:07:50.907895
7663	72	43	2		2020-05-25 10:07:50.912606	2020-05-25 10:07:50.912606
7664	30	43	0		2020-05-25 10:07:50.922484	2020-05-25 10:07:50.922484
7665	62	43	3		2020-05-25 10:07:50.929905	2020-05-25 10:07:50.929905
7666	99	43	4		2020-05-25 10:07:50.937951	2020-05-25 10:07:50.937951
7667	88	43	2		2020-05-25 10:07:50.944926	2020-05-25 10:07:50.944926
7668	6	43	4		2020-05-25 10:07:50.953624	2020-05-25 10:07:50.953624
7669	43	43	5		2020-05-25 10:07:50.961587	2020-05-25 10:07:50.961587
7670	34	43	2		2020-05-25 10:07:50.968243	2020-05-25 10:07:50.968243
7671	42	43	1		2020-05-25 10:07:50.974014	2020-05-25 10:07:50.974014
7672	21	43	3		2020-05-25 10:07:50.981866	2020-05-25 10:07:50.981866
7673	82	43	5		2020-05-25 10:07:50.988408	2020-05-25 10:07:50.988408
7674	33	43	5		2020-05-25 10:07:50.995353	2020-05-25 10:07:50.995353
7675	91	43	1		2020-05-25 10:07:51.005139	2020-05-25 10:07:51.005139
7676	47	43	1		2020-05-25 10:07:51.013084	2020-05-25 10:07:51.013084
7677	13	43	4		2020-05-25 10:07:51.021653	2020-05-25 10:07:51.021653
7678	85	43	2		2020-05-25 10:07:51.028711	2020-05-25 10:07:51.028711
7679	56	43	0		2020-05-25 10:07:51.03727	2020-05-25 10:07:51.03727
7680	12	43	2		2020-05-25 10:07:51.045398	2020-05-25 10:07:51.045398
7681	64	43	0		2020-05-25 10:07:51.052723	2020-05-25 10:07:51.052723
7682	4	43	3		2020-05-25 10:07:51.058749	2020-05-25 10:07:51.058749
7683	15	43	3		2020-05-25 10:07:51.066383	2020-05-25 10:07:51.066383
7684	83	43	3		2020-05-25 10:07:51.076716	2020-05-25 10:07:51.076716
7685	97	43	2		2020-05-25 10:07:51.081482	2020-05-25 10:07:51.081482
7686	95	43	0		2020-05-25 10:07:51.090575	2020-05-25 10:07:51.090575
7687	63	43	1		2020-05-25 10:07:51.098216	2020-05-25 10:07:51.098216
7688	20	43	5		2020-05-25 10:07:51.104107	2020-05-25 10:07:51.104107
7689	41	43	0		2020-05-25 10:07:51.111426	2020-05-25 10:07:51.111426
7690	79	43	0		2020-05-25 10:07:51.120482	2020-05-25 10:07:51.120482
7691	51	43	1		2020-05-25 10:07:51.12848	2020-05-25 10:07:51.12848
7692	86	43	1		2020-05-25 10:07:51.136224	2020-05-25 10:07:51.136224
7693	28	43	3		2020-05-25 10:07:51.142321	2020-05-25 10:07:51.142321
7694	67	43	4		2020-05-25 10:07:51.152421	2020-05-25 10:07:51.152421
7695	17	43	4		2020-05-25 10:07:51.160337	2020-05-25 10:07:51.160337
7696	9	43	4		2020-05-25 10:07:51.168621	2020-05-25 10:07:51.168621
7697	78	43	5		2020-05-25 10:07:51.17766	2020-05-25 10:07:51.17766
7698	23	43	2		2020-05-25 10:07:51.186654	2020-05-25 10:07:51.186654
7699	1	44	3		2020-05-25 10:07:51.194598	2020-05-25 10:07:51.194598
7700	4	44	3		2020-05-25 10:07:51.205457	2020-05-25 10:07:51.205457
7701	69	44	0		2020-05-25 10:07:51.215318	2020-05-25 10:07:51.215318
7702	43	44	3		2020-05-25 10:07:51.225565	2020-05-25 10:07:51.225565
7703	91	44	5		2020-05-25 10:07:51.239156	2020-05-25 10:07:51.239156
7704	45	44	0		2020-05-25 10:07:51.249452	2020-05-25 10:07:51.249452
7705	27	44	4		2020-05-25 10:07:51.261817	2020-05-25 10:07:51.261817
7706	35	44	3		2020-05-25 10:07:51.273557	2020-05-25 10:07:51.273557
7707	3	44	2		2020-05-25 10:07:51.283675	2020-05-25 10:07:51.283675
7708	16	44	2		2020-05-25 10:07:51.299025	2020-05-25 10:07:51.299025
7709	56	44	0		2020-05-25 10:07:51.311949	2020-05-25 10:07:51.311949
7710	84	44	2		2020-05-25 10:07:51.32464	2020-05-25 10:07:51.32464
7711	73	44	2		2020-05-25 10:07:51.336109	2020-05-25 10:07:51.336109
7712	80	44	3		2020-05-25 10:07:51.351315	2020-05-25 10:07:51.351315
7713	42	44	0		2020-05-25 10:07:51.365966	2020-05-25 10:07:51.365966
7714	75	44	4		2020-05-25 10:07:51.377275	2020-05-25 10:07:51.377275
7715	57	44	5		2020-05-25 10:07:51.391712	2020-05-25 10:07:51.391712
7716	33	44	5		2020-05-25 10:07:51.402958	2020-05-25 10:07:51.402958
7717	5	44	1		2020-05-25 10:07:51.417152	2020-05-25 10:07:51.417152
7718	51	44	2		2020-05-25 10:07:51.430905	2020-05-25 10:07:51.430905
7719	68	44	3		2020-05-25 10:07:51.442487	2020-05-25 10:07:51.442487
7720	47	44	1		2020-05-25 10:07:51.453338	2020-05-25 10:07:51.453338
7721	39	44	0		2020-05-25 10:07:51.466952	2020-05-25 10:07:51.466952
7722	15	44	1		2020-05-25 10:07:51.477431	2020-05-25 10:07:51.477431
7723	67	44	0		2020-05-25 10:07:51.489488	2020-05-25 10:07:51.489488
7724	71	44	2		2020-05-25 10:07:51.499529	2020-05-25 10:07:51.499529
7725	29	44	3		2020-05-25 10:07:51.514445	2020-05-25 10:07:51.514445
7726	0	44	1		2020-05-25 10:07:51.523174	2020-05-25 10:07:51.523174
7727	44	44	2		2020-05-25 10:07:51.528177	2020-05-25 10:07:51.528177
7728	86	44	5		2020-05-25 10:07:51.541842	2020-05-25 10:07:51.541842
7729	6	44	0		2020-05-25 10:07:51.546775	2020-05-25 10:07:51.546775
7730	12	44	2		2020-05-25 10:07:51.558361	2020-05-25 10:07:51.558361
7731	89	45	3		2020-05-25 10:07:51.568445	2020-05-25 10:07:51.568445
7732	59	45	4		2020-05-25 10:07:51.577095	2020-05-25 10:07:51.577095
7733	91	45	3		2020-05-25 10:07:51.586316	2020-05-25 10:07:51.586316
7734	15	45	0		2020-05-25 10:07:51.594743	2020-05-25 10:07:51.594743
7735	31	45	1		2020-05-25 10:07:51.60385	2020-05-25 10:07:51.60385
7736	82	45	1		2020-05-25 10:07:51.612024	2020-05-25 10:07:51.612024
7737	47	45	2		2020-05-25 10:07:51.623803	2020-05-25 10:07:51.623803
7738	34	46	0		2020-05-25 10:07:51.628845	2020-05-25 10:07:51.628845
7739	3	46	3		2020-05-25 10:07:51.638994	2020-05-25 10:07:51.638994
7740	18	46	0		2020-05-25 10:07:51.646915	2020-05-25 10:07:51.646915
7741	71	46	2		2020-05-25 10:07:51.659562	2020-05-25 10:07:51.659562
7742	28	46	2		2020-05-25 10:07:51.669358	2020-05-25 10:07:51.669358
7743	86	46	2		2020-05-25 10:07:51.677935	2020-05-25 10:07:51.677935
7744	37	46	2		2020-05-25 10:07:51.685795	2020-05-25 10:07:51.685795
7745	2	46	4		2020-05-25 10:07:51.69472	2020-05-25 10:07:51.69472
7746	10	46	4		2020-05-25 10:07:51.702431	2020-05-25 10:07:51.702431
7747	35	46	3		2020-05-25 10:07:51.710718	2020-05-25 10:07:51.710718
7748	36	46	3		2020-05-25 10:07:51.719089	2020-05-25 10:07:51.719089
7749	55	46	4		2020-05-25 10:07:51.727793	2020-05-25 10:07:51.727793
7750	81	46	4		2020-05-25 10:07:51.736536	2020-05-25 10:07:51.736536
7751	96	46	3		2020-05-25 10:07:51.745333	2020-05-25 10:07:51.745333
7752	80	46	3		2020-05-25 10:07:51.788065	2020-05-25 10:07:51.788065
7753	72	46	4		2020-05-25 10:07:51.829035	2020-05-25 10:07:51.829035
7754	99	46	3		2020-05-25 10:07:51.862559	2020-05-25 10:07:51.862559
7755	62	46	0		2020-05-25 10:07:51.884997	2020-05-25 10:07:51.884997
7756	53	46	1		2020-05-25 10:07:51.890018	2020-05-25 10:07:51.890018
7757	59	46	2		2020-05-25 10:07:51.916777	2020-05-25 10:07:51.916777
7758	6	46	1		2020-05-25 10:07:51.930777	2020-05-25 10:07:51.930777
7759	14	46	4		2020-05-25 10:07:51.945331	2020-05-25 10:07:51.945331
7760	8	46	5		2020-05-25 10:07:51.972378	2020-05-25 10:07:51.972378
7761	0	46	2		2020-05-25 10:07:51.97895	2020-05-25 10:07:51.97895
7762	51	46	2		2020-05-25 10:07:51.993644	2020-05-25 10:07:51.993644
7763	13	46	2		2020-05-25 10:07:52.002252	2020-05-25 10:07:52.002252
7764	77	46	5		2020-05-25 10:07:52.027379	2020-05-25 10:07:52.027379
7765	16	46	2		2020-05-25 10:07:52.034865	2020-05-25 10:07:52.034865
7766	79	47	5		2020-05-25 10:07:52.054117	2020-05-25 10:07:52.054117
7767	55	47	2		2020-05-25 10:07:52.063778	2020-05-25 10:07:52.063778
7768	87	47	0		2020-05-25 10:07:52.079864	2020-05-25 10:07:52.079864
7769	31	47	0		2020-05-25 10:07:52.086818	2020-05-25 10:07:52.086818
7770	82	47	0		2020-05-25 10:07:52.102852	2020-05-25 10:07:52.102852
7771	37	47	1		2020-05-25 10:07:52.111113	2020-05-25 10:07:52.111113
7772	95	47	3		2020-05-25 10:07:52.122193	2020-05-25 10:07:52.122193
7773	24	47	2		2020-05-25 10:07:52.134317	2020-05-25 10:07:52.134317
7774	54	47	0		2020-05-25 10:07:52.467349	2020-05-25 10:07:52.467349
7775	33	47	0		2020-05-25 10:07:52.473051	2020-05-25 10:07:52.473051
7776	21	47	1		2020-05-25 10:07:52.47799	2020-05-25 10:07:52.47799
7777	25	47	0		2020-05-25 10:07:52.488207	2020-05-25 10:07:52.488207
7778	71	47	0		2020-05-25 10:07:52.49846	2020-05-25 10:07:52.49846
7779	93	47	0		2020-05-25 10:07:52.510696	2020-05-25 10:07:52.510696
7780	52	47	3		2020-05-25 10:07:52.52284	2020-05-25 10:07:52.52284
7781	26	47	3		2020-05-25 10:07:52.535281	2020-05-25 10:07:52.535281
7782	94	47	0		2020-05-25 10:07:52.545207	2020-05-25 10:07:52.545207
7783	47	47	5		2020-05-25 10:07:52.557419	2020-05-25 10:07:52.557419
7784	3	47	4		2020-05-25 10:07:52.567692	2020-05-25 10:07:52.567692
7785	35	47	0		2020-05-25 10:07:52.581596	2020-05-25 10:07:52.581596
7786	38	47	5		2020-05-25 10:07:52.594938	2020-05-25 10:07:52.594938
7787	51	47	1		2020-05-25 10:07:52.605944	2020-05-25 10:07:52.605944
7788	30	47	5		2020-05-25 10:07:52.615091	2020-05-25 10:07:52.615091
7789	81	47	3		2020-05-25 10:07:52.62898	2020-05-25 10:07:52.62898
7790	57	47	4		2020-05-25 10:07:52.635276	2020-05-25 10:07:52.635276
7791	96	47	1		2020-05-25 10:07:52.648683	2020-05-25 10:07:52.648683
7792	88	47	1		2020-05-25 10:07:52.661789	2020-05-25 10:07:52.661789
7793	34	47	3		2020-05-25 10:07:52.66877	2020-05-25 10:07:52.66877
7794	61	47	4		2020-05-25 10:07:52.680698	2020-05-25 10:07:52.680698
7795	42	47	5		2020-05-25 10:07:52.694337	2020-05-25 10:07:52.694337
7796	1	47	1		2020-05-25 10:07:52.7009	2020-05-25 10:07:52.7009
7797	91	47	5		2020-05-25 10:07:52.712783	2020-05-25 10:07:52.712783
7798	43	47	4		2020-05-25 10:07:52.721442	2020-05-25 10:07:52.721442
7799	84	47	1		2020-05-25 10:07:52.730594	2020-05-25 10:07:52.730594
7800	29	47	0		2020-05-25 10:07:52.742086	2020-05-25 10:07:52.742086
7801	89	47	5		2020-05-25 10:07:52.749934	2020-05-25 10:07:52.749934
7802	65	47	5		2020-05-25 10:07:52.788715	2020-05-25 10:07:52.788715
7803	36	47	4		2020-05-25 10:07:52.796201	2020-05-25 10:07:52.796201
7804	77	47	0		2020-05-25 10:07:52.82786	2020-05-25 10:07:52.82786
7805	63	47	3		2020-05-25 10:07:52.831842	2020-05-25 10:07:52.831842
7806	40	47	4		2020-05-25 10:07:52.843765	2020-05-25 10:07:52.843765
7807	14	47	2		2020-05-25 10:07:52.851233	2020-05-25 10:07:52.851233
7808	7	48	1		2020-05-25 10:07:52.859863	2020-05-25 10:07:52.859863
7809	90	48	3		2020-05-25 10:07:52.864331	2020-05-25 10:07:52.864331
7810	30	48	1		2020-05-25 10:07:52.877335	2020-05-25 10:07:52.877335
7811	75	48	4		2020-05-25 10:07:52.881757	2020-05-25 10:07:52.881757
7812	15	48	1		2020-05-25 10:07:52.894243	2020-05-25 10:07:52.894243
7813	88	48	1		2020-05-25 10:07:52.90292	2020-05-25 10:07:52.90292
7814	18	48	2		2020-05-25 10:07:52.911878	2020-05-25 10:07:52.911878
7815	48	48	0		2020-05-25 10:07:52.91615	2020-05-25 10:07:52.91615
7816	45	48	4		2020-05-25 10:07:52.928138	2020-05-25 10:07:52.928138
7817	72	48	3		2020-05-25 10:07:52.932487	2020-05-25 10:07:52.932487
7818	37	48	0		2020-05-25 10:07:52.946495	2020-05-25 10:07:52.946495
7819	1	48	1		2020-05-25 10:07:52.955029	2020-05-25 10:07:52.955029
7820	95	48	1		2020-05-25 10:07:52.962822	2020-05-25 10:07:52.962822
7821	26	48	3		2020-05-25 10:07:52.972071	2020-05-25 10:07:52.972071
7822	67	48	3		2020-05-25 10:07:52.980782	2020-05-25 10:07:52.980782
7823	27	48	5		2020-05-25 10:07:52.991635	2020-05-25 10:07:52.991635
7824	58	48	2		2020-05-25 10:07:52.997094	2020-05-25 10:07:52.997094
7825	82	48	0		2020-05-25 10:07:53.007944	2020-05-25 10:07:53.007944
7826	87	48	3		2020-05-25 10:07:53.015279	2020-05-25 10:07:53.015279
7827	8	48	4		2020-05-25 10:07:53.025769	2020-05-25 10:07:53.025769
7828	20	48	4		2020-05-25 10:07:53.030376	2020-05-25 10:07:53.030376
7829	16	48	1		2020-05-25 10:07:53.039855	2020-05-25 10:07:53.039855
7830	83	48	1		2020-05-25 10:07:53.04765	2020-05-25 10:07:53.04765
7831	77	48	4		2020-05-25 10:07:53.054845	2020-05-25 10:07:53.054845
7832	11	48	3		2020-05-25 10:07:53.06117	2020-05-25 10:07:53.06117
7833	99	48	0		2020-05-25 10:07:53.068959	2020-05-25 10:07:53.068959
7834	44	48	0		2020-05-25 10:07:53.077024	2020-05-25 10:07:53.077024
7835	31	48	4		2020-05-25 10:07:53.085494	2020-05-25 10:07:53.085494
7836	60	48	1		2020-05-25 10:07:53.092209	2020-05-25 10:07:53.092209
7837	9	48	2		2020-05-25 10:07:53.098494	2020-05-25 10:07:53.098494
7838	42	48	3		2020-05-25 10:07:53.107116	2020-05-25 10:07:53.107116
7839	53	48	4		2020-05-25 10:07:53.115102	2020-05-25 10:07:53.115102
7840	46	48	5		2020-05-25 10:07:53.121061	2020-05-25 10:07:53.121061
7841	84	48	4		2020-05-25 10:07:53.128257	2020-05-25 10:07:53.128257
7842	59	48	4		2020-05-25 10:07:53.13744	2020-05-25 10:07:53.13744
7843	52	48	2		2020-05-25 10:07:53.145547	2020-05-25 10:07:53.145547
7844	70	48	1		2020-05-25 10:07:53.152192	2020-05-25 10:07:53.152192
7845	49	48	0		2020-05-25 10:07:53.158732	2020-05-25 10:07:53.158732
7846	34	48	4		2020-05-25 10:07:53.166461	2020-05-25 10:07:53.166461
7847	36	48	1		2020-05-25 10:07:53.177357	2020-05-25 10:07:53.177357
7848	63	48	3		2020-05-25 10:07:53.185199	2020-05-25 10:07:53.185199
7849	39	48	0		2020-05-25 10:07:53.191831	2020-05-25 10:07:53.191831
7850	96	48	0		2020-05-25 10:07:53.198707	2020-05-25 10:07:53.198707
7851	64	48	3		2020-05-25 10:07:53.209667	2020-05-25 10:07:53.209667
7852	79	48	3		2020-05-25 10:07:53.218537	2020-05-25 10:07:53.218537
7853	86	48	0		2020-05-25 10:07:53.226674	2020-05-25 10:07:53.226674
7854	69	48	1		2020-05-25 10:07:53.231478	2020-05-25 10:07:53.231478
7855	35	48	3		2020-05-25 10:07:53.241647	2020-05-25 10:07:53.241647
7856	76	48	2		2020-05-25 10:07:53.24897	2020-05-25 10:07:53.24897
7857	30	49	5		2020-05-25 10:07:53.259741	2020-05-25 10:07:53.259741
7858	77	49	2		2020-05-25 10:07:53.268675	2020-05-25 10:07:53.268675
7859	21	49	5		2020-05-25 10:07:53.275526	2020-05-25 10:07:53.275526
7860	47	49	1		2020-05-25 10:07:53.281803	2020-05-25 10:07:53.281803
7861	64	49	2		2020-05-25 10:07:53.292376	2020-05-25 10:07:53.292376
7862	37	49	0		2020-05-25 10:07:53.30156	2020-05-25 10:07:53.30156
7863	97	49	4		2020-05-25 10:07:53.309743	2020-05-25 10:07:53.309743
7864	94	49	2		2020-05-25 10:07:53.319194	2020-05-25 10:07:53.319194
7865	83	49	0		2020-05-25 10:07:53.327374	2020-05-25 10:07:53.327374
7866	12	49	2		2020-05-25 10:07:53.332849	2020-05-25 10:07:53.332849
7867	27	49	3		2020-05-25 10:07:53.343952	2020-05-25 10:07:53.343952
7868	10	49	4		2020-05-25 10:07:53.352787	2020-05-25 10:07:53.352787
7869	50	49	4		2020-05-25 10:07:53.360703	2020-05-25 10:07:53.360703
7870	43	49	3		2020-05-25 10:07:53.365898	2020-05-25 10:07:53.365898
7871	39	49	1		2020-05-25 10:07:53.377094	2020-05-25 10:07:53.377094
7872	3	49	4		2020-05-25 10:07:53.385823	2020-05-25 10:07:53.385823
7873	41	49	2		2020-05-25 10:07:53.393996	2020-05-25 10:07:53.393996
7874	26	49	1		2020-05-25 10:07:53.403098	2020-05-25 10:07:53.403098
7875	66	49	0		2020-05-25 10:07:53.410108	2020-05-25 10:07:53.410108
7876	92	49	5		2020-05-25 10:07:53.419779	2020-05-25 10:07:53.419779
7877	5	49	5		2020-05-25 10:07:53.429244	2020-05-25 10:07:53.429244
7878	48	49	2		2020-05-25 10:07:53.436395	2020-05-25 10:07:53.436395
7879	15	49	2		2020-05-25 10:07:53.443736	2020-05-25 10:07:53.443736
7880	7	49	1		2020-05-25 10:07:53.45291	2020-05-25 10:07:53.45291
7881	87	49	1		2020-05-25 10:07:53.461111	2020-05-25 10:07:53.461111
7882	59	49	5		2020-05-25 10:07:53.469439	2020-05-25 10:07:53.469439
7883	88	49	2		2020-05-25 10:07:53.47821	2020-05-25 10:07:53.47821
7884	53	49	0		2020-05-25 10:07:53.487317	2020-05-25 10:07:53.487317
7885	0	49	3		2020-05-25 10:07:53.494546	2020-05-25 10:07:53.494546
7886	8	49	3		2020-05-25 10:07:53.504092	2020-05-25 10:07:53.504092
7887	29	49	2		2020-05-25 10:07:53.512197	2020-05-25 10:07:53.512197
7888	86	49	2		2020-05-25 10:07:53.521702	2020-05-25 10:07:53.521702
7889	55	49	1		2020-05-25 10:07:53.530213	2020-05-25 10:07:53.530213
7890	73	49	5		2020-05-25 10:07:53.536986	2020-05-25 10:07:53.536986
7891	98	49	4		2020-05-25 10:07:53.545307	2020-05-25 10:07:53.545307
7892	9	49	4		2020-05-25 10:07:53.554268	2020-05-25 10:07:53.554268
7893	80	49	2		2020-05-25 10:07:53.562841	2020-05-25 10:07:53.562841
7894	6	49	4		2020-05-25 10:07:53.569563	2020-05-25 10:07:53.569563
7895	31	49	5		2020-05-25 10:07:53.577668	2020-05-25 10:07:53.577668
7896	52	49	2		2020-05-25 10:07:53.584616	2020-05-25 10:07:53.584616
7897	61	49	5		2020-05-25 10:07:53.591401	2020-05-25 10:07:53.591401
7898	69	49	0		2020-05-25 10:07:53.598223	2020-05-25 10:07:53.598223
7899	11	49	2		2020-05-25 10:07:53.609383	2020-05-25 10:07:53.609383
7900	16	49	0		2020-05-25 10:07:53.618877	2020-05-25 10:07:53.618877
7901	8	50	4		2020-05-25 10:07:53.627686	2020-05-25 10:07:53.627686
7902	93	50	2		2020-05-25 10:07:53.636284	2020-05-25 10:07:53.636284
7903	16	50	4		2020-05-25 10:07:53.643949	2020-05-25 10:07:53.643949
7904	43	50	1		2020-05-25 10:07:53.649284	2020-05-25 10:07:53.649284
7905	25	50	0		2020-05-25 10:07:53.660387	2020-05-25 10:07:53.660387
7906	44	50	1		2020-05-25 10:07:53.668531	2020-05-25 10:07:53.668531
7907	33	50	4		2020-05-25 10:07:53.675416	2020-05-25 10:07:53.675416
7908	61	50	4		2020-05-25 10:07:53.682261	2020-05-25 10:07:53.682261
7909	1	51	2		2020-05-25 10:07:53.693596	2020-05-25 10:07:53.693596
7910	11	51	2		2020-05-25 10:07:53.702438	2020-05-25 10:07:53.702438
7911	74	52	5		2020-05-25 10:07:53.711145	2020-05-25 10:07:53.711145
7912	1	52	0		2020-05-25 10:07:53.719247	2020-05-25 10:07:53.719247
7913	54	52	4		2020-05-25 10:07:53.727289	2020-05-25 10:07:53.727289
7914	40	52	2		2020-05-25 10:07:53.73501	2020-05-25 10:07:53.73501
7915	53	52	1		2020-05-25 10:07:53.742607	2020-05-25 10:07:53.742607
7916	19	52	4		2020-05-25 10:07:53.748049	2020-05-25 10:07:53.748049
7917	23	52	2		2020-05-25 10:07:53.758367	2020-05-25 10:07:53.758367
7918	70	52	0		2020-05-25 10:07:53.765381	2020-05-25 10:07:53.765381
7919	87	52	0		2020-05-25 10:07:53.776446	2020-05-25 10:07:53.776446
7920	64	52	0		2020-05-25 10:07:53.785582	2020-05-25 10:07:53.785582
7921	88	52	1		2020-05-25 10:07:53.793776	2020-05-25 10:07:53.793776
7922	60	52	5		2020-05-25 10:07:53.803407	2020-05-25 10:07:53.803407
7923	77	52	1		2020-05-25 10:07:53.810067	2020-05-25 10:07:53.810067
7924	43	52	1		2020-05-25 10:07:53.820642	2020-05-25 10:07:53.820642
7925	14	52	1		2020-05-25 10:07:53.828542	2020-05-25 10:07:53.828542
7926	57	52	3		2020-05-25 10:07:53.837521	2020-05-25 10:07:53.837521
7927	29	52	1		2020-05-25 10:07:53.846156	2020-05-25 10:07:53.846156
7928	28	52	0		2020-05-25 10:07:53.852307	2020-05-25 10:07:53.852307
7929	5	52	4		2020-05-25 10:07:53.860461	2020-05-25 10:07:53.860461
7930	21	52	1		2020-05-25 10:07:53.86765	2020-05-25 10:07:53.86765
7931	67	52	3		2020-05-25 10:07:53.874495	2020-05-25 10:07:53.874495
7932	68	52	1		2020-05-25 10:07:53.881181	2020-05-25 10:07:53.881181
7933	61	52	4		2020-05-25 10:07:53.890913	2020-05-25 10:07:53.890913
7934	31	52	2		2020-05-25 10:07:53.898801	2020-05-25 10:07:53.898801
7935	85	52	1		2020-05-25 10:07:53.905277	2020-05-25 10:07:53.905277
7936	83	52	4		2020-05-25 10:07:53.912274	2020-05-25 10:07:53.912274
7937	39	52	0		2020-05-25 10:07:53.921043	2020-05-25 10:07:53.921043
7938	66	52	1		2020-05-25 10:07:53.929477	2020-05-25 10:07:53.929477
7939	22	52	3		2020-05-25 10:07:53.938187	2020-05-25 10:07:53.938187
7940	34	52	3		2020-05-25 10:07:53.94509	2020-05-25 10:07:53.94509
7941	36	52	4		2020-05-25 10:07:53.954039	2020-05-25 10:07:53.954039
7942	37	52	3		2020-05-25 10:07:53.962125	2020-05-25 10:07:53.962125
7943	51	52	1		2020-05-25 10:07:53.970992	2020-05-25 10:07:53.970992
7944	44	52	2		2020-05-25 10:07:53.979375	2020-05-25 10:07:53.979375
7945	93	52	4		2020-05-25 10:07:53.98686	2020-05-25 10:07:53.98686
7946	48	52	3		2020-05-25 10:07:53.994828	2020-05-25 10:07:53.994828
7947	71	52	4		2020-05-25 10:07:54.006164	2020-05-25 10:07:54.006164
7948	12	52	5		2020-05-25 10:07:54.014421	2020-05-25 10:07:54.014421
7949	82	52	0		2020-05-25 10:07:54.022576	2020-05-25 10:07:54.022576
7950	97	52	3		2020-05-25 10:07:54.033605	2020-05-25 10:07:54.033605
7951	20	52	1		2020-05-25 10:07:54.040935	2020-05-25 10:07:54.040935
7952	35	52	5		2020-05-25 10:07:54.049346	2020-05-25 10:07:54.049346
7953	94	52	5		2020-05-25 10:07:54.061233	2020-05-25 10:07:54.061233
7954	26	52	5		2020-05-25 10:07:54.070179	2020-05-25 10:07:54.070179
7955	90	52	0		2020-05-25 10:07:54.077911	2020-05-25 10:07:54.077911
7956	45	52	1		2020-05-25 10:07:54.0866	2020-05-25 10:07:54.0866
7957	4	52	1		2020-05-25 10:07:54.114762	2020-05-25 10:07:54.114762
7958	84	52	3		2020-05-25 10:07:54.123547	2020-05-25 10:07:54.123547
7959	89	52	3		2020-05-25 10:07:54.13143	2020-05-25 10:07:54.13143
7960	46	52	0		2020-05-25 10:07:54.13875	2020-05-25 10:07:54.13875
7961	49	52	3		2020-05-25 10:07:54.145469	2020-05-25 10:07:54.145469
7962	95	52	0		2020-05-25 10:07:54.153097	2020-05-25 10:07:54.153097
7963	96	52	3		2020-05-25 10:07:54.161813	2020-05-25 10:07:54.161813
7964	79	52	4		2020-05-25 10:07:54.169593	2020-05-25 10:07:54.169593
7965	2	52	2		2020-05-25 10:07:54.177295	2020-05-25 10:07:54.177295
7966	38	52	5		2020-05-25 10:07:54.18672	2020-05-25 10:07:54.18672
7967	47	52	3		2020-05-25 10:07:54.19471	2020-05-25 10:07:54.19471
7968	58	52	0		2020-05-25 10:07:54.204529	2020-05-25 10:07:54.204529
7969	72	52	3		2020-05-25 10:07:54.212928	2020-05-25 10:07:54.212928
7970	59	52	1		2020-05-25 10:07:54.219882	2020-05-25 10:07:54.219882
7971	3	52	1		2020-05-25 10:07:54.227872	2020-05-25 10:07:54.227872
7972	76	52	2		2020-05-25 10:07:54.237681	2020-05-25 10:07:54.237681
7973	78	52	2		2020-05-25 10:07:54.246177	2020-05-25 10:07:54.246177
7974	30	52	2		2020-05-25 10:07:54.25578	2020-05-25 10:07:54.25578
7975	7	52	3		2020-05-25 10:07:54.264116	2020-05-25 10:07:54.264116
7976	42	52	1		2020-05-25 10:07:54.27244	2020-05-25 10:07:54.27244
7977	75	52	4		2020-05-25 10:07:54.279114	2020-05-25 10:07:54.279114
7978	52	52	5		2020-05-25 10:07:54.286815	2020-05-25 10:07:54.286815
7979	27	52	0		2020-05-25 10:07:54.295581	2020-05-25 10:07:54.295581
7980	15	52	2		2020-05-25 10:07:54.302956	2020-05-25 10:07:54.302956
7981	92	52	1		2020-05-25 10:07:54.311079	2020-05-25 10:07:54.311079
7982	56	52	3		2020-05-25 10:07:54.318729	2020-05-25 10:07:54.318729
7983	65	52	0		2020-05-25 10:07:54.327256	2020-05-25 10:07:54.327256
7984	69	52	4		2020-05-25 10:07:54.335857	2020-05-25 10:07:54.335857
7985	25	52	3		2020-05-25 10:07:54.344095	2020-05-25 10:07:54.344095
7986	80	52	0		2020-05-25 10:07:54.35248	2020-05-25 10:07:54.35248
7987	99	52	4		2020-05-25 10:07:54.360807	2020-05-25 10:07:54.360807
7988	86	52	1		2020-05-25 10:07:54.371355	2020-05-25 10:07:54.371355
7989	0	52	1		2020-05-25 10:07:54.379953	2020-05-25 10:07:54.379953
7990	10	52	2		2020-05-25 10:07:54.385842	2020-05-25 10:07:54.385842
7991	63	52	0		2020-05-25 10:07:54.394179	2020-05-25 10:07:54.394179
7992	33	52	2		2020-05-25 10:07:54.40215	2020-05-25 10:07:54.40215
7993	13	52	0		2020-05-25 10:07:54.410336	2020-05-25 10:07:54.410336
7994	55	52	0		2020-05-25 10:07:54.420615	2020-05-25 10:07:54.420615
7995	24	52	1		2020-05-25 10:07:54.429399	2020-05-25 10:07:54.429399
7996	16	52	0		2020-05-25 10:07:54.436642	2020-05-25 10:07:54.436642
7997	18	52	0		2020-05-25 10:07:54.444823	2020-05-25 10:07:54.444823
7998	41	52	2		2020-05-25 10:07:54.452862	2020-05-25 10:07:54.452862
7999	81	52	2		2020-05-25 10:07:54.46088	2020-05-25 10:07:54.46088
8000	73	52	2		2020-05-25 10:07:54.470099	2020-05-25 10:07:54.470099
8001	8	52	4		2020-05-25 10:07:54.478918	2020-05-25 10:07:54.478918
8002	17	52	5		2020-05-25 10:07:54.488893	2020-05-25 10:07:54.488893
8003	91	52	5		2020-05-25 10:07:54.498361	2020-05-25 10:07:54.498361
8004	74	53	3		2020-05-25 10:07:54.508375	2020-05-25 10:07:54.508375
8005	68	53	4		2020-05-25 10:07:54.517812	2020-05-25 10:07:54.517812
8006	64	53	1		2020-05-25 10:07:54.530408	2020-05-25 10:07:54.530408
8007	7	53	3		2020-05-25 10:07:54.541444	2020-05-25 10:07:54.541444
8008	83	53	0		2020-05-25 10:07:54.550303	2020-05-25 10:07:54.550303
8009	72	54	1		2020-05-25 10:07:54.563008	2020-05-25 10:07:54.563008
8010	56	54	0		2020-05-25 10:07:54.572522	2020-05-25 10:07:54.572522
8011	17	54	1		2020-05-25 10:07:54.581099	2020-05-25 10:07:54.581099
8012	16	54	1		2020-05-25 10:07:54.590736	2020-05-25 10:07:54.590736
8013	92	54	5		2020-05-25 10:07:54.59893	2020-05-25 10:07:54.59893
8014	49	54	0		2020-05-25 10:07:54.607604	2020-05-25 10:07:54.607604
8015	96	54	3		2020-05-25 10:07:54.615688	2020-05-25 10:07:54.615688
8016	77	54	2		2020-05-25 10:07:54.624617	2020-05-25 10:07:54.624617
8017	11	54	2		2020-05-25 10:07:54.632654	2020-05-25 10:07:54.632654
8018	90	54	3		2020-05-25 10:07:54.645447	2020-05-25 10:07:54.645447
8019	66	54	3		2020-05-25 10:07:54.653412	2020-05-25 10:07:54.653412
8020	12	54	3		2020-05-25 10:07:54.661835	2020-05-25 10:07:54.661835
8021	86	54	2		2020-05-25 10:07:54.67147	2020-05-25 10:07:54.67147
8022	20	54	4		2020-05-25 10:07:54.679994	2020-05-25 10:07:54.679994
8023	31	54	2		2020-05-25 10:07:54.689151	2020-05-25 10:07:54.689151
8024	70	54	4		2020-05-25 10:07:54.695752	2020-05-25 10:07:54.695752
8025	4	54	0		2020-05-25 10:07:54.703288	2020-05-25 10:07:54.703288
8026	58	54	3		2020-05-25 10:07:54.711788	2020-05-25 10:07:54.711788
8027	61	54	2		2020-05-25 10:07:54.717988	2020-05-25 10:07:54.717988
8028	9	54	4		2020-05-25 10:07:54.72645	2020-05-25 10:07:54.72645
8029	69	54	4		2020-05-25 10:07:54.734801	2020-05-25 10:07:54.734801
8030	27	54	4		2020-05-25 10:07:54.743227	2020-05-25 10:07:54.743227
8031	64	54	1		2020-05-25 10:07:54.751838	2020-05-25 10:07:54.751838
8032	53	54	2		2020-05-25 10:07:54.758814	2020-05-25 10:07:54.758814
8033	54	54	1		2020-05-25 10:07:54.765246	2020-05-25 10:07:54.765246
8034	48	54	3		2020-05-25 10:07:54.776373	2020-05-25 10:07:54.776373
8035	76	54	1		2020-05-25 10:07:54.785735	2020-05-25 10:07:54.785735
8036	41	54	1		2020-05-25 10:07:54.79405	2020-05-25 10:07:54.79405
8037	68	54	3		2020-05-25 10:07:54.802686	2020-05-25 10:07:54.802686
8038	52	54	4		2020-05-25 10:07:54.809583	2020-05-25 10:07:54.809583
8039	67	54	3		2020-05-25 10:07:54.816684	2020-05-25 10:07:54.816684
8040	33	55	0		2020-05-25 10:07:54.826299	2020-05-25 10:07:54.826299
8041	72	55	2		2020-05-25 10:07:54.830528	2020-05-25 10:07:54.830528
8042	65	55	3		2020-05-25 10:07:54.840942	2020-05-25 10:07:54.840942
8043	62	55	0		2020-05-25 10:07:54.847706	2020-05-25 10:07:54.847706
8044	14	55	4		2020-05-25 10:07:54.857668	2020-05-25 10:07:54.857668
8045	40	55	4		2020-05-25 10:07:54.865767	2020-05-25 10:07:54.865767
8046	67	55	1		2020-05-25 10:07:54.876706	2020-05-25 10:07:54.876706
8047	93	55	5		2020-05-25 10:07:54.885538	2020-05-25 10:07:54.885538
8048	55	55	1		2020-05-25 10:07:54.893249	2020-05-25 10:07:54.893249
8049	32	55	4		2020-05-25 10:07:54.898732	2020-05-25 10:07:54.898732
8050	76	55	1		2020-05-25 10:07:54.908388	2020-05-25 10:07:54.908388
8051	11	55	2		2020-05-25 10:07:54.915655	2020-05-25 10:07:54.915655
8052	58	55	5		2020-05-25 10:07:54.926697	2020-05-25 10:07:54.926697
8053	29	55	5		2020-05-25 10:07:54.935207	2020-05-25 10:07:54.935207
8054	13	55	0		2020-05-25 10:07:54.941832	2020-05-25 10:07:54.941832
8055	69	55	0		2020-05-25 10:07:54.948766	2020-05-25 10:07:54.948766
8056	57	55	4		2020-05-25 10:07:54.958084	2020-05-25 10:07:54.958084
8057	26	55	0		2020-05-25 10:07:54.965672	2020-05-25 10:07:54.965672
8058	7	55	1		2020-05-25 10:07:54.977416	2020-05-25 10:07:54.977416
8059	60	55	5		2020-05-25 10:07:54.985863	2020-05-25 10:07:54.985863
8060	8	55	1		2020-05-25 10:07:54.993978	2020-05-25 10:07:54.993978
8061	45	55	1		2020-05-25 10:07:55.004197	2020-05-25 10:07:55.004197
8062	88	55	1		2020-05-25 10:07:55.012331	2020-05-25 10:07:55.012331
8063	74	55	5		2020-05-25 10:07:55.021631	2020-05-25 10:07:55.021631
8064	68	55	2		2020-05-25 10:07:55.030273	2020-05-25 10:07:55.030273
8065	56	55	0		2020-05-25 10:07:55.037587	2020-05-25 10:07:55.037587
8066	98	55	2		2020-05-25 10:07:55.045674	2020-05-25 10:07:55.045674
8067	6	55	0		2020-05-25 10:07:55.054857	2020-05-25 10:07:55.054857
8068	25	55	1		2020-05-25 10:07:55.063221	2020-05-25 10:07:55.063221
8069	50	55	2		2020-05-25 10:07:55.069919	2020-05-25 10:07:55.069919
8070	27	55	3		2020-05-25 10:07:55.077934	2020-05-25 10:07:55.077934
8071	95	55	0		2020-05-25 10:07:55.085309	2020-05-25 10:07:55.085309
8072	31	55	4		2020-05-25 10:07:55.093046	2020-05-25 10:07:55.093046
8073	16	55	3		2020-05-25 10:07:55.102399	2020-05-25 10:07:55.102399
8074	64	55	0		2020-05-25 10:07:55.110237	2020-05-25 10:07:55.110237
8075	66	55	4		2020-05-25 10:07:55.118858	2020-05-25 10:07:55.118858
8076	9	55	2		2020-05-25 10:07:55.127212	2020-05-25 10:07:55.127212
8077	92	55	3		2020-05-25 10:07:55.136299	2020-05-25 10:07:55.136299
8078	10	55	2		2020-05-25 10:07:55.144163	2020-05-25 10:07:55.144163
8079	43	55	2		2020-05-25 10:07:55.152312	2020-05-25 10:07:55.152312
8080	48	55	5		2020-05-25 10:07:55.160368	2020-05-25 10:07:55.160368
8081	63	55	4		2020-05-25 10:07:55.168682	2020-05-25 10:07:55.168682
8082	87	55	1		2020-05-25 10:07:55.17678	2020-05-25 10:07:55.17678
8083	84	55	0		2020-05-25 10:07:55.185269	2020-05-25 10:07:55.185269
8084	30	55	5		2020-05-25 10:07:55.19203	2020-05-25 10:07:55.19203
8085	36	55	2		2020-05-25 10:07:55.198687	2020-05-25 10:07:55.198687
8086	79	55	0		2020-05-25 10:07:55.209885	2020-05-25 10:07:55.209885
8087	54	55	1		2020-05-25 10:07:55.218957	2020-05-25 10:07:55.218957
8088	35	55	0		2020-05-25 10:07:55.227563	2020-05-25 10:07:55.227563
8089	3	55	4		2020-05-25 10:07:55.236562	2020-05-25 10:07:55.236562
8090	19	55	4		2020-05-25 10:07:55.244749	2020-05-25 10:07:55.244749
8091	38	55	2		2020-05-25 10:07:55.253363	2020-05-25 10:07:55.253363
8092	81	55	5		2020-05-25 10:07:55.26123	2020-05-25 10:07:55.26123
8093	10	56	0		2020-05-25 10:07:55.268506	2020-05-25 10:07:55.268506
8094	85	56	3		2020-05-25 10:07:55.276011	2020-05-25 10:07:55.276011
8095	81	56	1		2020-05-25 10:07:55.282077	2020-05-25 10:07:55.282077
8096	35	56	4		2020-05-25 10:07:55.29402	2020-05-25 10:07:55.29402
8097	77	57	0		2020-05-25 10:07:55.303347	2020-05-25 10:07:55.303347
8098	27	57	0		2020-05-25 10:07:55.312229	2020-05-25 10:07:55.312229
8099	10	57	3		2020-05-25 10:07:55.320342	2020-05-25 10:07:55.320342
8100	30	57	4		2020-05-25 10:07:55.328342	2020-05-25 10:07:55.328342
8101	40	57	2		2020-05-25 10:07:55.336432	2020-05-25 10:07:55.336432
8102	65	57	2		2020-05-25 10:07:55.344978	2020-05-25 10:07:55.344978
8103	9	57	4		2020-05-25 10:07:55.352947	2020-05-25 10:07:55.352947
8104	71	57	0		2020-05-25 10:07:55.360952	2020-05-25 10:07:55.360952
8105	43	57	1		2020-05-25 10:07:55.368921	2020-05-25 10:07:55.368921
8106	67	57	4		2020-05-25 10:07:55.377577	2020-05-25 10:07:55.377577
8107	89	57	0		2020-05-25 10:07:55.387027	2020-05-25 10:07:55.387027
8108	96	57	5		2020-05-25 10:07:55.39503	2020-05-25 10:07:55.39503
8109	14	57	2		2020-05-25 10:07:55.403226	2020-05-25 10:07:55.403226
8110	45	57	2		2020-05-25 10:07:55.411107	2020-05-25 10:07:55.411107
8111	66	58	2		2020-05-25 10:07:55.418214	2020-05-25 10:07:55.418214
8112	31	58	0		2020-05-25 10:07:55.44823	2020-05-25 10:07:55.44823
8113	46	58	2		2020-05-25 10:07:55.455586	2020-05-25 10:07:55.455586
8114	62	59	3		2020-05-25 10:07:55.46416	2020-05-25 10:07:55.46416
8115	37	59	5		2020-05-25 10:07:55.47444	2020-05-25 10:07:55.47444
8116	82	59	1		2020-05-25 10:07:55.482403	2020-05-25 10:07:55.482403
8117	25	59	5		2020-05-25 10:07:55.490843	2020-05-25 10:07:55.490843
8118	3	59	0		2020-05-25 10:07:55.498825	2020-05-25 10:07:55.498825
8119	34	60	0		2020-05-25 10:07:55.510107	2020-05-25 10:07:55.510107
8120	43	60	3		2020-05-25 10:07:55.51925	2020-05-25 10:07:55.51925
8121	5	60	0		2020-05-25 10:07:55.530507	2020-05-25 10:07:55.530507
8122	32	60	1		2020-05-25 10:07:55.541544	2020-05-25 10:07:55.541544
8123	68	60	4		2020-05-25 10:07:55.549541	2020-05-25 10:07:55.549541
8124	18	60	4		2020-05-25 10:07:55.562062	2020-05-25 10:07:55.562062
8125	93	60	2		2020-05-25 10:07:55.573702	2020-05-25 10:07:55.573702
8126	22	60	0		2020-05-25 10:07:55.579558	2020-05-25 10:07:55.579558
8127	41	60	2		2020-05-25 10:07:55.594606	2020-05-25 10:07:55.594606
8128	73	60	4		2020-05-25 10:07:55.602129	2020-05-25 10:07:55.602129
8129	55	60	1		2020-05-25 10:07:55.610713	2020-05-25 10:07:55.610713
8130	53	60	4		2020-05-25 10:07:55.619566	2020-05-25 10:07:55.619566
8131	49	60	2		2020-05-25 10:07:55.628078	2020-05-25 10:07:55.628078
8132	10	60	3		2020-05-25 10:07:55.637962	2020-05-25 10:07:55.637962
8133	31	60	5		2020-05-25 10:07:55.646381	2020-05-25 10:07:55.646381
8134	81	60	2		2020-05-25 10:07:55.656918	2020-05-25 10:07:55.656918
8135	85	60	3		2020-05-25 10:07:55.661785	2020-05-25 10:07:55.661785
8136	64	60	4		2020-05-25 10:07:55.670216	2020-05-25 10:07:55.670216
8137	78	60	4		2020-05-25 10:07:55.678557	2020-05-25 10:07:55.678557
8138	80	60	2		2020-05-25 10:07:55.687493	2020-05-25 10:07:55.687493
8139	51	60	2		2020-05-25 10:07:55.696592	2020-05-25 10:07:55.696592
8140	96	60	3		2020-05-25 10:07:55.70522	2020-05-25 10:07:55.70522
8141	88	60	2		2020-05-25 10:07:55.711852	2020-05-25 10:07:55.711852
8142	79	60	4		2020-05-25 10:07:55.71999	2020-05-25 10:07:55.71999
8143	72	60	3		2020-05-25 10:07:55.728467	2020-05-25 10:07:55.728467
8144	76	60	4		2020-05-25 10:07:55.738322	2020-05-25 10:07:55.738322
8145	17	60	2		2020-05-25 10:07:55.746484	2020-05-25 10:07:55.746484
8146	59	60	2		2020-05-25 10:07:55.756718	2020-05-25 10:07:55.756718
8147	58	60	3		2020-05-25 10:07:55.762313	2020-05-25 10:07:55.762313
8148	15	60	4		2020-05-25 10:07:55.770438	2020-05-25 10:07:55.770438
8149	95	60	5		2020-05-25 10:07:55.779015	2020-05-25 10:07:55.779015
8150	38	60	3		2020-05-25 10:07:55.789256	2020-05-25 10:07:55.789256
8151	52	60	3		2020-05-25 10:07:55.79494	2020-05-25 10:07:55.79494
8152	14	60	1		2020-05-25 10:07:55.80327	2020-05-25 10:07:55.80327
8153	28	60	4		2020-05-25 10:07:55.81138	2020-05-25 10:07:55.81138
8154	0	60	2		2020-05-25 10:07:55.821022	2020-05-25 10:07:55.821022
8155	61	60	1		2020-05-25 10:07:55.8295	2020-05-25 10:07:55.8295
8156	56	60	0		2020-05-25 10:07:55.837958	2020-05-25 10:07:55.837958
8157	23	60	2		2020-05-25 10:07:55.844857	2020-05-25 10:07:55.844857
8158	60	60	1		2020-05-25 10:07:55.854519	2020-05-25 10:07:55.854519
8159	44	60	0		2020-05-25 10:07:55.862252	2020-05-25 10:07:55.862252
8160	36	60	0		2020-05-25 10:07:55.871956	2020-05-25 10:07:55.871956
8161	27	60	0		2020-05-25 10:07:55.880014	2020-05-25 10:07:55.880014
8162	74	60	1		2020-05-25 10:07:55.890074	2020-05-25 10:07:55.890074
8163	19	60	0		2020-05-25 10:07:55.89561	2020-05-25 10:07:55.89561
8164	67	60	2		2020-05-25 10:07:55.90475	2020-05-25 10:07:55.90475
8165	66	60	1		2020-05-25 10:07:55.912694	2020-05-25 10:07:55.912694
8166	86	60	2		2020-05-25 10:07:55.921766	2020-05-25 10:07:55.921766
8167	99	60	5		2020-05-25 10:07:55.930164	2020-05-25 10:07:55.930164
8168	25	60	3		2020-05-25 10:07:55.938257	2020-05-25 10:07:55.938257
8169	2	60	3		2020-05-25 10:07:55.945092	2020-05-25 10:07:55.945092
8170	1	60	0		2020-05-25 10:07:55.953969	2020-05-25 10:07:55.953969
8171	54	60	3		2020-05-25 10:07:55.961999	2020-05-25 10:07:55.961999
8172	42	60	4		2020-05-25 10:07:55.971262	2020-05-25 10:07:55.971262
8173	39	60	0		2020-05-25 10:07:55.979523	2020-05-25 10:07:55.979523
8174	7	60	0		2020-05-25 10:07:55.986475	2020-05-25 10:07:55.986475
8175	21	60	4		2020-05-25 10:07:55.994586	2020-05-25 10:07:55.994586
8176	77	60	3		2020-05-25 10:07:56.003719	2020-05-25 10:07:56.003719
8177	57	60	3		2020-05-25 10:07:56.012616	2020-05-25 10:07:56.012616
8178	16	60	4		2020-05-25 10:07:56.020619	2020-05-25 10:07:56.020619
8179	20	60	3		2020-05-25 10:07:56.028949	2020-05-25 10:07:56.028949
8180	46	60	5		2020-05-25 10:07:56.038533	2020-05-25 10:07:56.038533
8181	89	60	0		2020-05-25 10:07:56.047707	2020-05-25 10:07:56.047707
8182	9	60	2		2020-05-25 10:07:56.057867	2020-05-25 10:07:56.057867
8183	37	60	3		2020-05-25 10:07:56.064754	2020-05-25 10:07:56.064754
8184	11	60	1		2020-05-25 10:07:56.074666	2020-05-25 10:07:56.074666
8185	84	60	2		2020-05-25 10:07:56.082361	2020-05-25 10:07:56.082361
8186	98	60	5		2020-05-25 10:07:56.093585	2020-05-25 10:07:56.093585
8187	12	60	2		2020-05-25 10:07:56.102366	2020-05-25 10:07:56.102366
8188	40	60	5		2020-05-25 10:07:56.110005	2020-05-25 10:07:56.110005
8189	13	60	4		2020-05-25 10:07:56.119138	2020-05-25 10:07:56.119138
8190	33	60	3		2020-05-25 10:07:56.127348	2020-05-25 10:07:56.127348
8191	47	60	4		2020-05-25 10:07:56.13602	2020-05-25 10:07:56.13602
8192	87	60	3		2020-05-25 10:07:56.143478	2020-05-25 10:07:56.143478
8193	63	60	0		2020-05-25 10:07:56.152953	2020-05-25 10:07:56.152953
8194	30	60	1		2020-05-25 10:07:56.159062	2020-05-25 10:07:56.159062
8195	90	60	1		2020-05-25 10:07:56.166895	2020-05-25 10:07:56.166895
8196	70	60	5		2020-05-25 10:07:56.178449	2020-05-25 10:07:56.178449
8197	82	60	4		2020-05-25 10:07:56.187191	2020-05-25 10:07:56.187191
8198	75	60	1		2020-05-25 10:07:56.196448	2020-05-25 10:07:56.196448
8199	24	60	4		2020-05-25 10:07:56.206144	2020-05-25 10:07:56.206144
8200	18	61	3		2020-05-25 10:07:56.21503	2020-05-25 10:07:56.21503
8201	97	61	0		2020-05-25 10:07:56.222739	2020-05-25 10:07:56.222739
8202	75	61	0		2020-05-25 10:07:56.229672	2020-05-25 10:07:56.229672
8203	28	61	4		2020-05-25 10:07:56.23717	2020-05-25 10:07:56.23717
8204	6	61	3		2020-05-25 10:07:56.245893	2020-05-25 10:07:56.245893
8205	57	61	0		2020-05-25 10:07:56.253544	2020-05-25 10:07:56.253544
8206	52	61	2		2020-05-25 10:07:56.261627	2020-05-25 10:07:56.261627
8207	63	61	5		2020-05-25 10:07:56.268759	2020-05-25 10:07:56.268759
8208	93	61	0		2020-05-25 10:07:56.276708	2020-05-25 10:07:56.276708
8209	79	61	0		2020-05-25 10:07:56.282304	2020-05-25 10:07:56.282304
8210	71	62	1		2020-05-25 10:07:56.293248	2020-05-25 10:07:56.293248
8211	88	62	5		2020-05-25 10:07:56.302184	2020-05-25 10:07:56.302184
8212	91	62	2		2020-05-25 10:07:56.309971	2020-05-25 10:07:56.309971
8213	97	62	2		2020-05-25 10:07:56.315428	2020-05-25 10:07:56.315428
8214	14	62	4		2020-05-25 10:07:56.326575	2020-05-25 10:07:56.326575
8215	38	62	0		2020-05-25 10:07:56.334977	2020-05-25 10:07:56.334977
8216	67	62	5		2020-05-25 10:07:56.341554	2020-05-25 10:07:56.341554
8217	41	62	2		2020-05-25 10:07:56.348027	2020-05-25 10:07:56.348027
8218	27	62	3		2020-05-25 10:07:56.357737	2020-05-25 10:07:56.357737
8219	52	62	5		2020-05-25 10:07:56.365374	2020-05-25 10:07:56.365374
8220	19	62	4		2020-05-25 10:07:56.372626	2020-05-25 10:07:56.372626
8221	74	62	3		2020-05-25 10:07:56.379374	2020-05-25 10:07:56.379374
8222	70	62	1		2020-05-25 10:07:56.387093	2020-05-25 10:07:56.387093
8223	87	62	2		2020-05-25 10:07:56.395853	2020-05-25 10:07:56.395853
8224	90	62	3		2020-05-25 10:07:56.40376	2020-05-25 10:07:56.40376
8225	33	62	1		2020-05-25 10:07:56.411627	2020-05-25 10:07:56.411627
8226	34	62	3		2020-05-25 10:07:56.421039	2020-05-25 10:07:56.421039
8227	47	62	2		2020-05-25 10:07:56.429453	2020-05-25 10:07:56.429453
8228	48	62	3		2020-05-25 10:07:56.438647	2020-05-25 10:07:56.438647
8229	99	62	0		2020-05-25 10:07:56.445075	2020-05-25 10:07:56.445075
8230	95	62	1		2020-05-25 10:07:56.453501	2020-05-25 10:07:56.453501
8231	43	62	0		2020-05-25 10:07:56.461915	2020-05-25 10:07:56.461915
8232	40	62	0		2020-05-25 10:07:56.471402	2020-05-25 10:07:56.471402
8233	64	62	0		2020-05-25 10:07:56.480081	2020-05-25 10:07:56.480081
8234	81	62	0		2020-05-25 10:07:56.486988	2020-05-25 10:07:56.486988
8235	13	62	4		2020-05-25 10:07:56.494969	2020-05-25 10:07:56.494969
8236	17	62	5		2020-05-25 10:07:56.50541	2020-05-25 10:07:56.50541
8237	21	62	2		2020-05-25 10:07:56.513579	2020-05-25 10:07:56.513579
8238	92	62	4		2020-05-25 10:07:56.522775	2020-05-25 10:07:56.522775
8239	75	62	2		2020-05-25 10:07:56.52968	2020-05-25 10:07:56.52968
8240	25	62	5		2020-05-25 10:07:56.539503	2020-05-25 10:07:56.539503
8241	85	62	3		2020-05-25 10:07:56.54774	2020-05-25 10:07:56.54774
8242	36	62	1		2020-05-25 10:07:56.556025	2020-05-25 10:07:56.556025
8243	55	62	0		2020-05-25 10:07:56.56268	2020-05-25 10:07:56.56268
8244	11	62	0		2020-05-25 10:07:56.570546	2020-05-25 10:07:56.570546
8245	82	62	4		2020-05-25 10:07:56.578985	2020-05-25 10:07:56.578985
8246	93	62	3		2020-05-25 10:07:56.585853	2020-05-25 10:07:56.585853
8247	0	62	4		2020-05-25 10:07:56.594065	2020-05-25 10:07:56.594065
8248	89	62	2		2020-05-25 10:07:56.60208	2020-05-25 10:07:56.60208
8249	5	62	4		2020-05-25 10:07:56.61007	2020-05-25 10:07:56.61007
8250	66	62	3		2020-05-25 10:07:56.615548	2020-05-25 10:07:56.615548
8251	86	62	0		2020-05-25 10:07:56.626934	2020-05-25 10:07:56.626934
8252	12	62	2		2020-05-25 10:07:56.635336	2020-05-25 10:07:56.635336
8253	94	62	4		2020-05-25 10:07:56.64417	2020-05-25 10:07:56.64417
8254	32	62	5		2020-05-25 10:07:56.653506	2020-05-25 10:07:56.653506
8255	2	62	1		2020-05-25 10:07:56.663006	2020-05-25 10:07:56.663006
8256	73	62	5		2020-05-25 10:07:56.672938	2020-05-25 10:07:56.672938
8257	63	62	4		2020-05-25 10:07:56.682547	2020-05-25 10:07:56.682547
8258	78	62	3		2020-05-25 10:07:56.690976	2020-05-25 10:07:56.690976
8259	35	62	1		2020-05-25 10:07:56.699142	2020-05-25 10:07:56.699142
8260	61	62	4		2020-05-25 10:07:56.706917	2020-05-25 10:07:56.706917
8261	23	62	4		2020-05-25 10:07:56.716012	2020-05-25 10:07:56.716012
8262	46	62	5		2020-05-25 10:07:56.724484	2020-05-25 10:07:56.724484
8263	80	62	2		2020-05-25 10:07:56.733532	2020-05-25 10:07:56.733532
8264	65	62	3		2020-05-25 10:07:56.741739	2020-05-25 10:07:56.741739
8265	69	62	0		2020-05-25 10:07:56.751126	2020-05-25 10:07:56.751126
8266	3	62	3		2020-05-25 10:07:56.78715	2020-05-25 10:07:56.78715
8267	53	62	2		2020-05-25 10:07:56.796868	2020-05-25 10:07:56.796868
8268	16	62	2		2020-05-25 10:07:56.808217	2020-05-25 10:07:56.808217
8269	4	62	1		2020-05-25 10:07:56.815418	2020-05-25 10:07:56.815418
8270	73	63	4		2020-05-25 10:07:56.827925	2020-05-25 10:07:56.827925
8271	40	63	2		2020-05-25 10:07:56.836589	2020-05-25 10:07:56.836589
8272	44	63	4		2020-05-25 10:07:56.845665	2020-05-25 10:07:56.845665
8273	21	63	4		2020-05-25 10:07:56.853511	2020-05-25 10:07:56.853511
8274	25	63	4		2020-05-25 10:07:56.861576	2020-05-25 10:07:56.861576
8275	55	63	3		2020-05-25 10:07:56.870881	2020-05-25 10:07:56.870881
8276	57	63	2		2020-05-25 10:07:56.879443	2020-05-25 10:07:56.879443
8277	74	63	3		2020-05-25 10:07:56.889696	2020-05-25 10:07:56.889696
8278	85	63	0		2020-05-25 10:07:56.895698	2020-05-25 10:07:56.895698
8279	34	63	1		2020-05-25 10:07:56.903696	2020-05-25 10:07:56.903696
8280	54	63	2		2020-05-25 10:07:56.912348	2020-05-25 10:07:56.912348
8281	42	63	0		2020-05-25 10:07:56.922229	2020-05-25 10:07:56.922229
8282	72	63	3		2020-05-25 10:07:56.930626	2020-05-25 10:07:56.930626
8283	31	63	5		2020-05-25 10:07:56.941472	2020-05-25 10:07:56.941472
8284	71	63	0		2020-05-25 10:07:56.949076	2020-05-25 10:07:56.949076
8285	65	63	4		2020-05-25 10:07:56.961334	2020-05-25 10:07:56.961334
8286	90	63	5		2020-05-25 10:07:56.971607	2020-05-25 10:07:56.971607
8287	29	63	1		2020-05-25 10:07:56.983409	2020-05-25 10:07:56.983409
8288	3	63	4		2020-05-25 10:07:56.995979	2020-05-25 10:07:56.995979
8289	27	63	4		2020-05-25 10:07:57.00841	2020-05-25 10:07:57.00841
8290	58	63	0		2020-05-25 10:07:57.020781	2020-05-25 10:07:57.020781
8291	0	63	0		2020-05-25 10:07:57.032136	2020-05-25 10:07:57.032136
8292	32	63	2		2020-05-25 10:07:57.045572	2020-05-25 10:07:57.045572
8293	62	63	0		2020-05-25 10:07:57.05575	2020-05-25 10:07:57.05575
8294	38	63	1		2020-05-25 10:07:57.065159	2020-05-25 10:07:57.065159
8295	70	63	0		2020-05-25 10:07:57.077341	2020-05-25 10:07:57.077341
8296	56	63	3		2020-05-25 10:07:57.087537	2020-05-25 10:07:57.087537
8297	75	63	4		2020-05-25 10:07:57.096338	2020-05-25 10:07:57.096338
8298	66	63	0		2020-05-25 10:07:57.108877	2020-05-25 10:07:57.108877
8299	45	63	3		2020-05-25 10:07:57.114345	2020-05-25 10:07:57.114345
8300	78	63	1		2020-05-25 10:07:57.12698	2020-05-25 10:07:57.12698
8301	19	63	4		2020-05-25 10:07:57.134941	2020-05-25 10:07:57.134941
8302	11	63	0		2020-05-25 10:07:57.144108	2020-05-25 10:07:57.144108
8303	67	63	3		2020-05-25 10:07:57.152443	2020-05-25 10:07:57.152443
8304	37	63	2		2020-05-25 10:07:57.160542	2020-05-25 10:07:57.160542
8305	63	63	4		2020-05-25 10:07:57.168782	2020-05-25 10:07:57.168782
8306	23	63	0		2020-05-25 10:07:57.177467	2020-05-25 10:07:57.177467
8307	96	63	1		2020-05-25 10:07:57.184997	2020-05-25 10:07:57.184997
8308	97	63	5		2020-05-25 10:07:57.194205	2020-05-25 10:07:57.194205
8309	69	63	2		2020-05-25 10:07:57.202659	2020-05-25 10:07:57.202659
8310	46	63	0		2020-05-25 10:07:57.211043	2020-05-25 10:07:57.211043
8311	18	63	2		2020-05-25 10:07:57.219165	2020-05-25 10:07:57.219165
8312	95	63	5		2020-05-25 10:07:57.228669	2020-05-25 10:07:57.228669
8313	88	63	4		2020-05-25 10:07:57.236297	2020-05-25 10:07:57.236297
8314	60	63	2		2020-05-25 10:07:57.244666	2020-05-25 10:07:57.244666
8315	43	63	1		2020-05-25 10:07:57.254592	2020-05-25 10:07:57.254592
8316	60	64	0		2020-05-25 10:07:57.263095	2020-05-25 10:07:57.263095
8317	28	64	3		2020-05-25 10:07:57.272247	2020-05-25 10:07:57.272247
8318	67	64	3		2020-05-25 10:07:57.279351	2020-05-25 10:07:57.279351
8319	53	64	4		2020-05-25 10:07:57.287428	2020-05-25 10:07:57.287428
8320	89	64	1		2020-05-25 10:07:57.29603	2020-05-25 10:07:57.29603
8321	16	64	5		2020-05-25 10:07:57.303554	2020-05-25 10:07:57.303554
8322	48	64	1		2020-05-25 10:07:57.311635	2020-05-25 10:07:57.311635
8323	40	64	2		2020-05-25 10:07:57.32019	2020-05-25 10:07:57.32019
8324	52	64	4		2020-05-25 10:07:57.329266	2020-05-25 10:07:57.329266
8325	50	64	3		2020-05-25 10:07:57.33722	2020-05-25 10:07:57.33722
8326	36	64	2		2020-05-25 10:07:57.345106	2020-05-25 10:07:57.345106
8327	55	64	4		2020-05-25 10:07:57.354271	2020-05-25 10:07:57.354271
8328	39	64	3		2020-05-25 10:07:57.360985	2020-05-25 10:07:57.360985
8329	21	64	4		2020-05-25 10:07:57.36972	2020-05-25 10:07:57.36972
8330	41	64	5		2020-05-25 10:07:57.377624	2020-05-25 10:07:57.377624
8331	54	64	0		2020-05-25 10:07:57.385019	2020-05-25 10:07:57.385019
8332	77	64	5		2020-05-25 10:07:57.390825	2020-05-25 10:07:57.390825
8333	4	64	3		2020-05-25 10:07:57.398432	2020-05-25 10:07:57.398432
8334	20	64	2		2020-05-25 10:07:57.404219	2020-05-25 10:07:57.404219
8335	58	64	2		2020-05-25 10:07:57.41155	2020-05-25 10:07:57.41155
8336	33	65	1		2020-05-25 10:07:57.421016	2020-05-25 10:07:57.421016
8337	38	65	2		2020-05-25 10:07:57.42899	2020-05-25 10:07:57.42899
8338	37	65	5		2020-05-25 10:07:57.43566	2020-05-25 10:07:57.43566
8339	75	65	2		2020-05-25 10:07:57.441673	2020-05-25 10:07:57.441673
8340	32	65	3		2020-05-25 10:07:57.449153	2020-05-25 10:07:57.449153
8341	88	65	4		2020-05-25 10:07:57.460114	2020-05-25 10:07:57.460114
8342	26	65	4		2020-05-25 10:07:57.469345	2020-05-25 10:07:57.469345
8343	97	65	3		2020-05-25 10:07:57.475794	2020-05-25 10:07:57.475794
8344	21	65	2		2020-05-25 10:07:57.483742	2020-05-25 10:07:57.483742
8345	31	65	2		2020-05-25 10:07:57.492956	2020-05-25 10:07:57.492956
8346	77	65	3		2020-05-25 10:07:57.503016	2020-05-25 10:07:57.503016
8347	83	65	4		2020-05-25 10:07:57.509603	2020-05-25 10:07:57.509603
8348	52	65	4		2020-05-25 10:07:57.518856	2020-05-25 10:07:57.518856
8349	27	65	1		2020-05-25 10:07:57.526962	2020-05-25 10:07:57.526962
8350	34	65	1		2020-05-25 10:07:57.535788	2020-05-25 10:07:57.535788
8351	64	65	3		2020-05-25 10:07:57.543334	2020-05-25 10:07:57.543334
8352	84	65	3		2020-05-25 10:07:57.552526	2020-05-25 10:07:57.552526
8353	76	65	2		2020-05-25 10:07:57.558529	2020-05-25 10:07:57.558529
8354	58	65	3		2020-05-25 10:07:57.566068	2020-05-25 10:07:57.566068
8355	98	65	1		2020-05-25 10:07:57.57549	2020-05-25 10:07:57.57549
8356	22	65	3		2020-05-25 10:07:57.580272	2020-05-25 10:07:57.580272
8357	65	65	1		2020-05-25 10:07:57.589639	2020-05-25 10:07:57.589639
8358	49	65	0		2020-05-25 10:07:57.597516	2020-05-25 10:07:57.597516
8359	96	65	3		2020-05-25 10:07:57.604849	2020-05-25 10:07:57.604849
8360	46	65	3		2020-05-25 10:07:57.612305	2020-05-25 10:07:57.612305
8361	25	65	2		2020-05-25 10:07:57.621083	2020-05-25 10:07:57.621083
8362	78	65	4		2020-05-25 10:07:57.628714	2020-05-25 10:07:57.628714
8363	71	65	1		2020-05-25 10:07:57.635601	2020-05-25 10:07:57.635601
8364	39	65	1		2020-05-25 10:07:57.643299	2020-05-25 10:07:57.643299
8365	15	65	3		2020-05-25 10:07:57.651618	2020-05-25 10:07:57.651618
8366	7	65	4		2020-05-25 10:07:57.65793	2020-05-25 10:07:57.65793
8367	94	65	1		2020-05-25 10:07:57.664557	2020-05-25 10:07:57.664557
8368	63	65	4		2020-05-25 10:07:57.674727	2020-05-25 10:07:57.674727
8369	50	65	2		2020-05-25 10:07:57.679472	2020-05-25 10:07:57.679472
8370	35	65	2		2020-05-25 10:07:57.688935	2020-05-25 10:07:57.688935
8371	81	65	1		2020-05-25 10:07:57.696663	2020-05-25 10:07:57.696663
8372	90	65	4		2020-05-25 10:07:57.70444	2020-05-25 10:07:57.70444
8373	10	65	2		2020-05-25 10:07:57.710836	2020-05-25 10:07:57.710836
8374	89	65	3		2020-05-25 10:07:57.719777	2020-05-25 10:07:57.719777
8375	0	65	0		2020-05-25 10:07:57.727864	2020-05-25 10:07:57.727864
8376	11	65	0		2020-05-25 10:07:57.73473	2020-05-25 10:07:57.73473
8377	45	65	5		2020-05-25 10:07:57.74076	2020-05-25 10:07:57.74076
8378	44	65	4		2020-05-25 10:07:57.748449	2020-05-25 10:07:57.748449
8379	85	65	2		2020-05-25 10:07:57.755447	2020-05-25 10:07:57.755447
8380	80	65	0		2020-05-25 10:07:57.76223	2020-05-25 10:07:57.76223
8381	5	65	0		2020-05-25 10:07:57.771118	2020-05-25 10:07:57.771118
8382	6	65	5		2020-05-25 10:07:57.779	2020-05-25 10:07:57.779
8383	43	65	2		2020-05-25 10:07:57.785155	2020-05-25 10:07:57.785155
8384	55	65	0		2020-05-25 10:07:57.793086	2020-05-25 10:07:57.793086
8385	47	65	0		2020-05-25 10:07:57.80193	2020-05-25 10:07:57.80193
8386	95	65	2		2020-05-25 10:07:57.808452	2020-05-25 10:07:57.808452
8387	29	65	0		2020-05-25 10:07:57.814549	2020-05-25 10:07:57.814549
8388	42	65	1		2020-05-25 10:07:57.823307	2020-05-25 10:07:57.823307
8389	48	65	2		2020-05-25 10:07:57.831143	2020-05-25 10:07:57.831143
8390	56	65	2		2020-05-25 10:07:57.838464	2020-05-25 10:07:57.838464
8391	2	65	1		2020-05-25 10:07:57.845814	2020-05-25 10:07:57.845814
8392	3	65	1		2020-05-25 10:07:57.854865	2020-05-25 10:07:57.854865
8393	28	65	3		2020-05-25 10:07:57.862892	2020-05-25 10:07:57.862892
8394	73	65	0		2020-05-25 10:07:57.871063	2020-05-25 10:07:57.871063
8395	62	65	0		2020-05-25 10:07:57.878165	2020-05-25 10:07:57.878165
8396	20	65	1		2020-05-25 10:07:57.88707	2020-05-25 10:07:57.88707
8397	67	65	0		2020-05-25 10:07:57.895367	2020-05-25 10:07:57.895367
8398	30	65	2		2020-05-25 10:07:57.903915	2020-05-25 10:07:57.903915
8399	60	65	4		2020-05-25 10:07:57.910107	2020-05-25 10:07:57.910107
8400	80	66	2		2020-05-25 10:07:57.919058	2020-05-25 10:07:57.919058
8401	23	66	0		2020-05-25 10:07:57.926829	2020-05-25 10:07:57.926829
8402	18	66	4		2020-05-25 10:07:57.935416	2020-05-25 10:07:57.935416
8403	13	66	0		2020-05-25 10:07:57.941355	2020-05-25 10:07:57.941355
8404	75	66	3		2020-05-25 10:07:57.9481	2020-05-25 10:07:57.9481
8405	84	66	0		2020-05-25 10:07:57.957326	2020-05-25 10:07:57.957326
8406	30	66	3		2020-05-25 10:07:57.965285	2020-05-25 10:07:57.965285
8407	19	66	1		2020-05-25 10:07:57.971616	2020-05-25 10:07:57.971616
8408	40	66	4		2020-05-25 10:07:57.978624	2020-05-25 10:07:57.978624
8409	31	66	4		2020-05-25 10:07:57.987195	2020-05-25 10:07:57.987195
8410	7	66	1		2020-05-25 10:07:57.99532	2020-05-25 10:07:57.99532
8411	70	66	0		2020-05-25 10:07:58.003848	2020-05-25 10:07:58.003848
8412	10	66	0		2020-05-25 10:07:58.011983	2020-05-25 10:07:58.011983
8413	83	66	3		2020-05-25 10:07:58.020101	2020-05-25 10:07:58.020101
8414	41	66	5		2020-05-25 10:07:58.028114	2020-05-25 10:07:58.028114
8415	53	66	4		2020-05-25 10:07:58.037463	2020-05-25 10:07:58.037463
8416	63	66	5		2020-05-25 10:07:58.046219	2020-05-25 10:07:58.046219
8417	35	66	2		2020-05-25 10:07:58.053831	2020-05-25 10:07:58.053831
8418	0	66	5		2020-05-25 10:07:58.061922	2020-05-25 10:07:58.061922
8419	2	66	2		2020-05-25 10:07:58.070966	2020-05-25 10:07:58.070966
8420	37	66	3		2020-05-25 10:07:58.079377	2020-05-25 10:07:58.079377
8421	76	67	0		2020-05-25 10:07:58.104323	2020-05-25 10:07:58.104323
8422	67	67	3		2020-05-25 10:07:58.112657	2020-05-25 10:07:58.112657
8423	94	67	4		2020-05-25 10:07:58.12137	2020-05-25 10:07:58.12137
8424	30	67	1		2020-05-25 10:07:58.130012	2020-05-25 10:07:58.130012
8425	57	67	0		2020-05-25 10:07:58.138985	2020-05-25 10:07:58.138985
8426	86	67	2		2020-05-25 10:07:58.146044	2020-05-25 10:07:58.146044
8427	42	67	2		2020-05-25 10:07:58.154573	2020-05-25 10:07:58.154573
8428	66	67	4		2020-05-25 10:07:58.162997	2020-05-25 10:07:58.162997
8429	83	67	1		2020-05-25 10:07:58.172176	2020-05-25 10:07:58.172176
8430	79	67	2		2020-05-25 10:07:58.179034	2020-05-25 10:07:58.179034
8431	3	67	1		2020-05-25 10:07:58.186649	2020-05-25 10:07:58.186649
8432	84	67	5		2020-05-25 10:07:58.195387	2020-05-25 10:07:58.195387
8433	97	67	2		2020-05-25 10:07:58.20136	2020-05-25 10:07:58.20136
8434	44	67	2		2020-05-25 10:07:58.209746	2020-05-25 10:07:58.209746
8435	28	67	3		2020-05-25 10:07:58.218414	2020-05-25 10:07:58.218414
8436	39	67	1		2020-05-25 10:07:58.226979	2020-05-25 10:07:58.226979
8437	53	67	0		2020-05-25 10:07:58.235532	2020-05-25 10:07:58.235532
8438	55	67	3		2020-05-25 10:07:58.243095	2020-05-25 10:07:58.243095
8439	15	67	0		2020-05-25 10:07:58.248699	2020-05-25 10:07:58.248699
8440	89	67	4		2020-05-25 10:07:58.257964	2020-05-25 10:07:58.257964
8441	73	67	1		2020-05-25 10:07:58.265774	2020-05-25 10:07:58.265774
8442	24	67	0		2020-05-25 10:07:58.276981	2020-05-25 10:07:58.276981
8443	0	67	2		2020-05-25 10:07:58.285897	2020-05-25 10:07:58.285897
8444	34	67	3		2020-05-25 10:07:58.294067	2020-05-25 10:07:58.294067
8445	10	67	1		2020-05-25 10:07:58.303398	2020-05-25 10:07:58.303398
8446	82	67	3		2020-05-25 10:07:58.31128	2020-05-25 10:07:58.31128
8447	63	67	3		2020-05-25 10:07:58.321747	2020-05-25 10:07:58.321747
8448	59	67	1		2020-05-25 10:07:58.329942	2020-05-25 10:07:58.329942
8449	26	67	0		2020-05-25 10:07:58.338563	2020-05-25 10:07:58.338563
8450	37	67	3		2020-05-25 10:07:58.346253	2020-05-25 10:07:58.346253
8451	72	67	3		2020-05-25 10:07:58.353791	2020-05-25 10:07:58.353791
8452	1	67	2		2020-05-25 10:07:58.361742	2020-05-25 10:07:58.361742
8453	96	67	5		2020-05-25 10:07:58.370149	2020-05-25 10:07:58.370149
8454	47	67	4		2020-05-25 10:07:58.377453	2020-05-25 10:07:58.377453
8455	40	67	5		2020-05-25 10:07:58.386438	2020-05-25 10:07:58.386438
8456	6	67	4		2020-05-25 10:07:58.394392	2020-05-25 10:07:58.394392
8457	36	67	0		2020-05-25 10:07:58.402776	2020-05-25 10:07:58.402776
8458	41	67	5		2020-05-25 10:07:58.409051	2020-05-25 10:07:58.409051
8459	18	67	1		2020-05-25 10:07:58.415439	2020-05-25 10:07:58.415439
8460	32	67	1		2020-05-25 10:07:58.426059	2020-05-25 10:07:58.426059
8461	62	67	4		2020-05-25 10:07:58.430409	2020-05-25 10:07:58.430409
8462	68	67	2		2020-05-25 10:07:58.440104	2020-05-25 10:07:58.440104
8463	90	67	2		2020-05-25 10:07:58.44763	2020-05-25 10:07:58.44763
8464	58	67	2		2020-05-25 10:07:58.454661	2020-05-25 10:07:58.454661
8465	5	67	3		2020-05-25 10:07:58.461117	2020-05-25 10:07:58.461117
8466	29	67	0		2020-05-25 10:07:58.471093	2020-05-25 10:07:58.471093
8467	91	67	4		2020-05-25 10:07:58.47933	2020-05-25 10:07:58.47933
8468	11	67	0		2020-05-25 10:07:58.48911	2020-05-25 10:07:58.48911
8469	45	67	5		2020-05-25 10:07:58.496584	2020-05-25 10:07:58.496584
8470	88	67	0		2020-05-25 10:07:58.507399	2020-05-25 10:07:58.507399
8471	35	67	3		2020-05-25 10:07:58.51567	2020-05-25 10:07:58.51567
8472	75	67	2		2020-05-25 10:07:58.526762	2020-05-25 10:07:58.526762
8473	81	67	5		2020-05-25 10:07:58.53542	2020-05-25 10:07:58.53542
8474	7	67	2		2020-05-25 10:07:58.542744	2020-05-25 10:07:58.542744
8475	87	67	2		2020-05-25 10:07:58.548663	2020-05-25 10:07:58.548663
8476	44	68	0		2020-05-25 10:07:58.560286	2020-05-25 10:07:58.560286
8477	95	68	2		2020-05-25 10:07:58.568853	2020-05-25 10:07:58.568853
8478	15	68	3		2020-05-25 10:07:58.577194	2020-05-25 10:07:58.577194
8479	3	68	2		2020-05-25 10:07:58.585799	2020-05-25 10:07:58.585799
8480	70	68	4		2020-05-25 10:07:58.593971	2020-05-25 10:07:58.593971
8481	83	68	4		2020-05-25 10:07:58.602655	2020-05-25 10:07:58.602655
8482	37	68	4		2020-05-25 10:07:58.610855	2020-05-25 10:07:58.610855
8483	17	68	4		2020-05-25 10:07:58.619299	2020-05-25 10:07:58.619299
8484	89	68	3		2020-05-25 10:07:58.6261	2020-05-25 10:07:58.6261
8485	10	68	3		2020-05-25 10:07:58.632419	2020-05-25 10:07:58.632419
8486	38	68	3		2020-05-25 10:07:58.642673	2020-05-25 10:07:58.642673
8487	93	68	0		2020-05-25 10:07:58.651592	2020-05-25 10:07:58.651592
8488	33	68	5		2020-05-25 10:07:58.659966	2020-05-25 10:07:58.659966
8489	35	68	4		2020-05-25 10:07:58.669448	2020-05-25 10:07:58.669448
8490	22	68	5		2020-05-25 10:07:58.677591	2020-05-25 10:07:58.677591
8491	79	68	1		2020-05-25 10:07:58.686362	2020-05-25 10:07:58.686362
8492	60	68	4		2020-05-25 10:07:58.694537	2020-05-25 10:07:58.694537
8493	56	68	2		2020-05-25 10:07:58.701681	2020-05-25 10:07:58.701681
8494	2	68	0		2020-05-25 10:07:58.708555	2020-05-25 10:07:58.708555
8495	94	68	1		2020-05-25 10:07:58.715312	2020-05-25 10:07:58.715312
8496	64	68	2		2020-05-25 10:07:58.726623	2020-05-25 10:07:58.726623
8497	54	68	3		2020-05-25 10:07:58.735674	2020-05-25 10:07:58.735674
8498	97	68	1		2020-05-25 10:07:58.743798	2020-05-25 10:07:58.743798
8499	46	68	1		2020-05-25 10:07:58.749065	2020-05-25 10:07:58.749065
8500	80	68	4		2020-05-25 10:07:58.759927	2020-05-25 10:07:58.759927
8501	21	68	4		2020-05-25 10:07:58.768972	2020-05-25 10:07:58.768972
8502	92	68	0		2020-05-25 10:07:58.777841	2020-05-25 10:07:58.777841
8503	76	68	1		2020-05-25 10:07:58.786222	2020-05-25 10:07:58.786222
8504	48	68	4		2020-05-25 10:07:58.794537	2020-05-25 10:07:58.794537
8505	73	68	1		2020-05-25 10:07:58.802122	2020-05-25 10:07:58.802122
8506	4	68	5		2020-05-25 10:07:58.810396	2020-05-25 10:07:58.810396
8507	84	68	3		2020-05-25 10:07:58.815668	2020-05-25 10:07:58.815668
8508	20	68	1		2020-05-25 10:07:58.826931	2020-05-25 10:07:58.826931
8509	8	68	3		2020-05-25 10:07:58.835982	2020-05-25 10:07:58.835982
8510	66	68	2		2020-05-25 10:07:58.84401	2020-05-25 10:07:58.84401
8511	18	68	2		2020-05-25 10:07:58.852827	2020-05-25 10:07:58.852827
8512	96	68	0		2020-05-25 10:07:58.860924	2020-05-25 10:07:58.860924
8513	37	69	0		2020-05-25 10:07:58.867778	2020-05-25 10:07:58.867778
8514	98	69	1		2020-05-25 10:07:58.875675	2020-05-25 10:07:58.875675
8515	82	69	5		2020-05-25 10:07:58.881581	2020-05-25 10:07:58.881581
8516	93	69	0		2020-05-25 10:07:58.89295	2020-05-25 10:07:58.89295
8517	20	69	3		2020-05-25 10:07:58.897267	2020-05-25 10:07:58.897267
8518	29	69	1		2020-05-25 10:07:58.90741	2020-05-25 10:07:58.90741
8519	9	69	0		2020-05-25 10:07:58.914237	2020-05-25 10:07:58.914237
8520	83	69	2		2020-05-25 10:07:58.923603	2020-05-25 10:07:58.923603
8521	36	69	1		2020-05-25 10:07:58.932546	2020-05-25 10:07:58.932546
8522	30	69	1		2020-05-25 10:07:58.940417	2020-05-25 10:07:58.940417
8523	16	69	5		2020-05-25 10:07:58.947761	2020-05-25 10:07:58.947761
8524	67	69	3		2020-05-25 10:07:58.957455	2020-05-25 10:07:58.957455
8525	51	69	1		2020-05-25 10:07:58.966287	2020-05-25 10:07:58.966287
8526	58	69	2		2020-05-25 10:07:58.973091	2020-05-25 10:07:58.973091
8527	24	69	1		2020-05-25 10:07:58.980208	2020-05-25 10:07:58.980208
8528	41	69	2		2020-05-25 10:07:58.987558	2020-05-25 10:07:58.987558
8529	39	69	4		2020-05-25 10:07:58.994091	2020-05-25 10:07:58.994091
8530	88	69	2		2020-05-25 10:07:59.004854	2020-05-25 10:07:59.004854
8531	4	69	0		2020-05-25 10:07:59.012631	2020-05-25 10:07:59.012631
8532	62	69	2		2020-05-25 10:07:59.021422	2020-05-25 10:07:59.021422
8533	65	69	3		2020-05-25 10:07:59.02794	2020-05-25 10:07:59.02794
8534	31	69	1		2020-05-25 10:07:59.037001	2020-05-25 10:07:59.037001
8535	96	69	2		2020-05-25 10:07:59.045305	2020-05-25 10:07:59.045305
8536	43	69	4		2020-05-25 10:07:59.053558	2020-05-25 10:07:59.053558
8537	53	69	2		2020-05-25 10:07:59.059651	2020-05-25 10:07:59.059651
8538	76	69	4		2020-05-25 10:07:59.06946	2020-05-25 10:07:59.06946
8539	60	69	3		2020-05-25 10:07:59.077376	2020-05-25 10:07:59.077376
8540	94	69	4		2020-05-25 10:07:59.085806	2020-05-25 10:07:59.085806
8541	95	69	5		2020-05-25 10:07:59.092383	2020-05-25 10:07:59.092383
8542	25	69	4		2020-05-25 10:07:59.098529	2020-05-25 10:07:59.098529
8543	14	69	0		2020-05-25 10:07:59.107478	2020-05-25 10:07:59.107478
8544	92	69	1		2020-05-25 10:07:59.115601	2020-05-25 10:07:59.115601
8545	26	69	0		2020-05-25 10:07:59.12163	2020-05-25 10:07:59.12163
8546	49	69	2		2020-05-25 10:07:59.129189	2020-05-25 10:07:59.129189
8547	18	69	3		2020-05-25 10:07:59.137999	2020-05-25 10:07:59.137999
8548	44	69	0		2020-05-25 10:07:59.146236	2020-05-25 10:07:59.146236
8549	70	69	2		2020-05-25 10:07:59.15228	2020-05-25 10:07:59.15228
8550	87	69	1		2020-05-25 10:07:59.160229	2020-05-25 10:07:59.160229
8551	55	69	5		2020-05-25 10:07:59.168778	2020-05-25 10:07:59.168778
8552	32	69	4		2020-05-25 10:07:59.175243	2020-05-25 10:07:59.175243
8553	8	69	4		2020-05-25 10:07:59.182139	2020-05-25 10:07:59.182139
8554	85	69	4		2020-05-25 10:07:59.191119	2020-05-25 10:07:59.191119
8555	77	69	2		2020-05-25 10:07:59.198897	2020-05-25 10:07:59.198897
8556	40	70	5		2020-05-25 10:07:59.208252	2020-05-25 10:07:59.208252
8557	93	70	0		2020-05-25 10:07:59.212951	2020-05-25 10:07:59.212951
8558	63	70	2		2020-05-25 10:07:59.223864	2020-05-25 10:07:59.223864
8559	79	70	0		2020-05-25 10:07:59.230509	2020-05-25 10:07:59.230509
8560	24	70	0		2020-05-25 10:07:59.240255	2020-05-25 10:07:59.240255
8561	99	70	1		2020-05-25 10:07:59.247945	2020-05-25 10:07:59.247945
8562	84	70	2		2020-05-25 10:07:59.259444	2020-05-25 10:07:59.259444
8563	78	70	1		2020-05-25 10:07:59.269083	2020-05-25 10:07:59.269083
8564	95	70	0		2020-05-25 10:07:59.277909	2020-05-25 10:07:59.277909
8565	19	70	4		2020-05-25 10:07:59.28649	2020-05-25 10:07:59.28649
8566	94	70	3		2020-05-25 10:07:59.294422	2020-05-25 10:07:59.294422
8567	48	70	3		2020-05-25 10:07:59.301814	2020-05-25 10:07:59.301814
8568	80	70	4		2020-05-25 10:07:59.310082	2020-05-25 10:07:59.310082
8569	26	70	2		2020-05-25 10:07:59.318048	2020-05-25 10:07:59.318048
8570	6	70	3		2020-05-25 10:07:59.326578	2020-05-25 10:07:59.326578
8571	90	70	4		2020-05-25 10:07:59.335458	2020-05-25 10:07:59.335458
8572	87	70	3		2020-05-25 10:07:59.345193	2020-05-25 10:07:59.345193
8573	11	70	2		2020-05-25 10:07:59.353265	2020-05-25 10:07:59.353265
8574	69	70	2		2020-05-25 10:07:59.361333	2020-05-25 10:07:59.361333
8575	34	70	3		2020-05-25 10:07:59.389837	2020-05-25 10:07:59.389837
8576	7	70	1		2020-05-25 10:07:59.39553	2020-05-25 10:07:59.39553
8577	22	70	2		2020-05-25 10:07:59.404303	2020-05-25 10:07:59.404303
8578	35	70	2		2020-05-25 10:07:59.412227	2020-05-25 10:07:59.412227
8579	2	70	1		2020-05-25 10:07:59.420625	2020-05-25 10:07:59.420625
8580	72	70	0		2020-05-25 10:07:59.427232	2020-05-25 10:07:59.427232
8581	56	70	1		2020-05-25 10:07:59.436347	2020-05-25 10:07:59.436347
8582	46	70	2		2020-05-25 10:07:59.445001	2020-05-25 10:07:59.445001
8583	86	70	1		2020-05-25 10:07:59.453242	2020-05-25 10:07:59.453242
8584	86	71	3		2020-05-25 10:07:59.459721	2020-05-25 10:07:59.459721
8585	67	71	5		2020-05-25 10:07:59.468912	2020-05-25 10:07:59.468912
8586	10	71	3		2020-05-25 10:07:59.477054	2020-05-25 10:07:59.477054
8587	14	71	0		2020-05-25 10:07:59.485349	2020-05-25 10:07:59.485349
8588	56	71	1		2020-05-25 10:07:59.49178	2020-05-25 10:07:59.49178
8589	71	71	0		2020-05-25 10:07:59.499878	2020-05-25 10:07:59.499878
8590	68	71	2		2020-05-25 10:07:59.51157	2020-05-25 10:07:59.51157
8591	45	71	0		2020-05-25 10:07:59.519676	2020-05-25 10:07:59.519676
8592	1	71	1		2020-05-25 10:07:59.525821	2020-05-25 10:07:59.525821
8593	92	71	0		2020-05-25 10:07:59.536296	2020-05-25 10:07:59.536296
8594	64	71	3		2020-05-25 10:07:59.544427	2020-05-25 10:07:59.544427
8595	34	71	4		2020-05-25 10:07:59.551231	2020-05-25 10:07:59.551231
8596	3	71	2		2020-05-25 10:07:59.557342	2020-05-25 10:07:59.557342
8597	89	71	4		2020-05-25 10:07:59.565102	2020-05-25 10:07:59.565102
8598	23	71	1		2020-05-25 10:07:59.570927	2020-05-25 10:07:59.570927
8599	46	71	5		2020-05-25 10:07:59.57829	2020-05-25 10:07:59.57829
8600	84	71	3		2020-05-25 10:07:59.586823	2020-05-25 10:07:59.586823
8601	52	71	1		2020-05-25 10:07:59.59454	2020-05-25 10:07:59.59454
8602	77	71	3		2020-05-25 10:07:59.602931	2020-05-25 10:07:59.602931
8603	37	71	2		2020-05-25 10:07:59.608936	2020-05-25 10:07:59.608936
8604	22	71	2		2020-05-25 10:07:59.618756	2020-05-25 10:07:59.618756
8605	57	71	3		2020-05-25 10:07:59.626929	2020-05-25 10:07:59.626929
8606	88	71	2		2020-05-25 10:07:59.635234	2020-05-25 10:07:59.635234
8607	15	71	2		2020-05-25 10:07:59.6417	2020-05-25 10:07:59.6417
8608	76	71	1		2020-05-25 10:07:59.648292	2020-05-25 10:07:59.648292
8609	96	71	0		2020-05-25 10:07:59.656763	2020-05-25 10:07:59.656763
8610	53	71	3		2020-05-25 10:07:59.664774	2020-05-25 10:07:59.664774
8611	70	71	2		2020-05-25 10:07:59.670623	2020-05-25 10:07:59.670623
8612	24	71	4		2020-05-25 10:07:59.677971	2020-05-25 10:07:59.677971
8613	48	71	2		2020-05-25 10:07:59.687378	2020-05-25 10:07:59.687378
8614	8	71	4		2020-05-25 10:07:59.695473	2020-05-25 10:07:59.695473
8615	75	71	5		2020-05-25 10:07:59.701983	2020-05-25 10:07:59.701983
8616	19	71	1		2020-05-25 10:07:59.707927	2020-05-25 10:07:59.707927
8617	25	71	0		2020-05-25 10:07:59.71551	2020-05-25 10:07:59.71551
8618	69	71	0		2020-05-25 10:07:59.726276	2020-05-25 10:07:59.726276
8619	80	71	2		2020-05-25 10:07:59.73542	2020-05-25 10:07:59.73542
8620	65	71	2		2020-05-25 10:07:59.741629	2020-05-25 10:07:59.741629
8621	13	71	1		2020-05-25 10:07:59.748534	2020-05-25 10:07:59.748534
8622	94	71	2		2020-05-25 10:07:59.759067	2020-05-25 10:07:59.759067
8623	74	71	2		2020-05-25 10:07:59.763422	2020-05-25 10:07:59.763422
8624	66	71	1		2020-05-25 10:07:59.773469	2020-05-25 10:07:59.773469
8625	95	71	4		2020-05-25 10:07:59.781144	2020-05-25 10:07:59.781144
8626	6	71	5		2020-05-25 10:07:59.787718	2020-05-25 10:07:59.787718
8627	31	71	2		2020-05-25 10:07:59.794347	2020-05-25 10:07:59.794347
8628	98	71	2		2020-05-25 10:07:59.803336	2020-05-25 10:07:59.803336
8629	12	71	2		2020-05-25 10:07:59.811384	2020-05-25 10:07:59.811384
8630	41	71	1		2020-05-25 10:07:59.819188	2020-05-25 10:07:59.819188
8631	82	71	4		2020-05-25 10:07:59.825076	2020-05-25 10:07:59.825076
8632	54	71	3		2020-05-25 10:07:59.832429	2020-05-25 10:07:59.832429
8633	63	71	3		2020-05-25 10:07:59.842106	2020-05-25 10:07:59.842106
8634	79	71	5		2020-05-25 10:07:59.846824	2020-05-25 10:07:59.846824
8635	55	71	1		2020-05-25 10:07:59.856235	2020-05-25 10:07:59.856235
8636	99	71	1		2020-05-25 10:07:59.864016	2020-05-25 10:07:59.864016
8637	90	71	3		2020-05-25 10:07:59.872202	2020-05-25 10:07:59.872202
8638	35	71	2		2020-05-25 10:07:59.879289	2020-05-25 10:07:59.879289
8639	9	71	4		2020-05-25 10:07:59.888336	2020-05-25 10:07:59.888336
8640	4	71	1		2020-05-25 10:07:59.89517	2020-05-25 10:07:59.89517
8641	42	71	3		2020-05-25 10:07:59.904024	2020-05-25 10:07:59.904024
8642	33	72	2		2020-05-25 10:07:59.911288	2020-05-25 10:07:59.911288
8643	95	72	2		2020-05-25 10:07:59.919251	2020-05-25 10:07:59.919251
8644	85	72	3		2020-05-25 10:07:59.927102	2020-05-25 10:07:59.927102
8645	16	72	5		2020-05-25 10:07:59.934252	2020-05-25 10:07:59.934252
8646	22	72	4		2020-05-25 10:07:59.940181	2020-05-25 10:07:59.940181
8647	54	72	5		2020-05-25 10:07:59.947349	2020-05-25 10:07:59.947349
8648	0	72	5		2020-05-25 10:07:59.956426	2020-05-25 10:07:59.956426
8649	57	72	4		2020-05-25 10:07:59.964418	2020-05-25 10:07:59.964418
8650	91	72	3		2020-05-25 10:07:59.971609	2020-05-25 10:07:59.971609
8651	98	72	2		2020-05-25 10:07:59.978746	2020-05-25 10:07:59.978746
8652	92	72	3		2020-05-25 10:07:59.98683	2020-05-25 10:07:59.98683
8653	10	72	2		2020-05-25 10:07:59.994154	2020-05-25 10:07:59.994154
8654	4	72	5		2020-05-25 10:08:00.003781	2020-05-25 10:08:00.003781
8655	2	72	1		2020-05-25 10:08:00.011492	2020-05-25 10:08:00.011492
8656	8	72	5		2020-05-25 10:08:00.018637	2020-05-25 10:08:00.018637
8657	9	72	1		2020-05-25 10:08:00.025319	2020-05-25 10:08:00.025319
8658	21	72	0		2020-05-25 10:08:00.032618	2020-05-25 10:08:00.032618
8659	62	72	3		2020-05-25 10:08:00.041927	2020-05-25 10:08:00.041927
8660	25	72	2		2020-05-25 10:08:00.047335	2020-05-25 10:08:00.047335
8661	17	72	5		2020-05-25 10:08:00.056896	2020-05-25 10:08:00.056896
8662	84	72	1		2020-05-25 10:08:00.064385	2020-05-25 10:08:00.064385
8663	47	72	0		2020-05-25 10:08:00.070617	2020-05-25 10:08:00.070617
8664	27	72	3		2020-05-25 10:08:00.077859	2020-05-25 10:08:00.077859
8665	20	72	4		2020-05-25 10:08:00.086704	2020-05-25 10:08:00.086704
8666	38	72	3		2020-05-25 10:08:00.09498	2020-05-25 10:08:00.09498
8667	67	72	5		2020-05-25 10:08:00.101904	2020-05-25 10:08:00.101904
8668	55	72	4		2020-05-25 10:08:00.107818	2020-05-25 10:08:00.107818
8669	42	72	3		2020-05-25 10:08:00.115542	2020-05-25 10:08:00.115542
8670	74	72	4		2020-05-25 10:08:00.125022	2020-05-25 10:08:00.125022
8671	29	72	2		2020-05-25 10:08:00.130024	2020-05-25 10:08:00.130024
8672	44	72	2		2020-05-25 10:08:00.139451	2020-05-25 10:08:00.139451
8673	99	72	3		2020-05-25 10:08:00.146716	2020-05-25 10:08:00.146716
8674	50	72	2		2020-05-25 10:08:00.154016	2020-05-25 10:08:00.154016
8675	89	72	0		2020-05-25 10:08:00.160282	2020-05-25 10:08:00.160282
8676	68	72	5		2020-05-25 10:08:00.169328	2020-05-25 10:08:00.169328
8677	69	72	5		2020-05-25 10:08:00.177444	2020-05-25 10:08:00.177444
8678	15	72	2		2020-05-25 10:08:00.185046	2020-05-25 10:08:00.185046
8679	56	72	3		2020-05-25 10:08:00.191045	2020-05-25 10:08:00.191045
8680	96	72	0		2020-05-25 10:08:00.198133	2020-05-25 10:08:00.198133
8681	7	72	5		2020-05-25 10:08:00.208513	2020-05-25 10:08:00.208513
8682	66	72	3		2020-05-25 10:08:00.212977	2020-05-25 10:08:00.212977
8683	13	72	0		2020-05-25 10:08:00.222593	2020-05-25 10:08:00.222593
8684	31	72	3		2020-05-25 10:08:00.230039	2020-05-25 10:08:00.230039
8685	46	72	0		2020-05-25 10:08:00.237296	2020-05-25 10:08:00.237296
8686	23	72	5		2020-05-25 10:08:00.243762	2020-05-25 10:08:00.243762
8687	77	72	2		2020-05-25 10:08:00.253095	2020-05-25 10:08:00.253095
8688	88	72	0		2020-05-25 10:08:00.261268	2020-05-25 10:08:00.261268
8689	32	72	2		2020-05-25 10:08:00.267882	2020-05-25 10:08:00.267882
8690	72	72	5		2020-05-25 10:08:00.27398	2020-05-25 10:08:00.27398
8691	41	72	4		2020-05-25 10:08:00.281981	2020-05-25 10:08:00.281981
8692	60	72	4		2020-05-25 10:08:00.292759	2020-05-25 10:08:00.292759
8693	90	72	5		2020-05-25 10:08:00.301997	2020-05-25 10:08:00.301997
8694	82	72	2		2020-05-25 10:08:00.308224	2020-05-25 10:08:00.308224
8695	3	72	3		2020-05-25 10:08:00.314786	2020-05-25 10:08:00.314786
8696	75	72	3		2020-05-25 10:08:00.324863	2020-05-25 10:08:00.324863
8697	52	72	3		2020-05-25 10:08:00.32934	2020-05-25 10:08:00.32934
8698	70	72	4		2020-05-25 10:08:00.338428	2020-05-25 10:08:00.338428
8699	86	72	3		2020-05-25 10:08:00.346332	2020-05-25 10:08:00.346332
8700	45	72	5		2020-05-25 10:08:00.355121	2020-05-25 10:08:00.355121
8701	61	72	5		2020-05-25 10:08:00.362176	2020-05-25 10:08:00.362176
8702	1	72	0		2020-05-25 10:08:00.370258	2020-05-25 10:08:00.370258
8703	64	72	5		2020-05-25 10:08:00.377923	2020-05-25 10:08:00.377923
8704	65	73	4		2020-05-25 10:08:00.385625	2020-05-25 10:08:00.385625
8705	47	73	4		2020-05-25 10:08:00.391455	2020-05-25 10:08:00.391455
8706	95	73	0		2020-05-25 10:08:00.39857	2020-05-25 10:08:00.39857
8707	51	73	2		2020-05-25 10:08:00.408555	2020-05-25 10:08:00.408555
8708	58	73	5		2020-05-25 10:08:00.41299	2020-05-25 10:08:00.41299
8709	21	74	0		2020-05-25 10:08:00.422425	2020-05-25 10:08:00.422425
8710	25	74	0		2020-05-25 10:08:00.430315	2020-05-25 10:08:00.430315
8711	44	74	2		2020-05-25 10:08:00.444944	2020-05-25 10:08:00.444944
8712	17	74	1		2020-05-25 10:08:00.453129	2020-05-25 10:08:00.453129
8713	27	74	4		2020-05-25 10:08:00.461599	2020-05-25 10:08:00.461599
8714	12	74	3		2020-05-25 10:08:00.470201	2020-05-25 10:08:00.470201
8715	69	74	2		2020-05-25 10:08:00.476965	2020-05-25 10:08:00.476965
8716	2	74	2		2020-05-25 10:08:00.486675	2020-05-25 10:08:00.486675
8717	18	74	5		2020-05-25 10:08:00.495356	2020-05-25 10:08:00.495356
8718	24	74	2		2020-05-25 10:08:00.505725	2020-05-25 10:08:00.505725
8719	80	74	3		2020-05-25 10:08:00.514505	2020-05-25 10:08:00.514505
8720	39	74	4		2020-05-25 10:08:00.52395	2020-05-25 10:08:00.52395
8721	41	74	0		2020-05-25 10:08:00.53146	2020-05-25 10:08:00.53146
8722	36	74	4		2020-05-25 10:08:00.538876	2020-05-25 10:08:00.538876
8723	93	74	1		2020-05-25 10:08:00.54548	2020-05-25 10:08:00.54548
8724	55	74	5		2020-05-25 10:08:00.556137	2020-05-25 10:08:00.556137
8725	65	74	5		2020-05-25 10:08:00.563874	2020-05-25 10:08:00.563874
8726	35	74	1		2020-05-25 10:08:00.572591	2020-05-25 10:08:00.572591
8727	60	74	0		2020-05-25 10:08:00.582447	2020-05-25 10:08:00.582447
8728	5	74	4		2020-05-25 10:08:00.590776	2020-05-25 10:08:00.590776
8729	97	74	5		2020-05-25 10:08:00.599096	2020-05-25 10:08:00.599096
8730	90	74	5		2020-05-25 10:08:00.635288	2020-05-25 10:08:00.635288
8731	67	74	5		2020-05-25 10:08:00.644732	2020-05-25 10:08:00.644732
8732	94	74	1		2020-05-25 10:08:00.653951	2020-05-25 10:08:00.653951
8733	46	74	0		2020-05-25 10:08:00.661717	2020-05-25 10:08:00.661717
8734	31	74	0		2020-05-25 10:08:00.674302	2020-05-25 10:08:00.674302
8735	38	74	1		2020-05-25 10:08:00.687089	2020-05-25 10:08:00.687089
8736	1	74	4		2020-05-25 10:08:00.69633	2020-05-25 10:08:00.69633
8737	14	74	0		2020-05-25 10:08:00.707572	2020-05-25 10:08:00.707572
8738	20	74	3		2020-05-25 10:08:00.716302	2020-05-25 10:08:00.716302
8739	77	74	4		2020-05-25 10:08:00.7298	2020-05-25 10:08:00.7298
8740	81	74	2		2020-05-25 10:08:00.739035	2020-05-25 10:08:00.739035
8741	58	74	3		2020-05-25 10:08:00.75206	2020-05-25 10:08:00.75206
8742	59	74	2		2020-05-25 10:08:00.763313	2020-05-25 10:08:00.763313
8743	29	74	4		2020-05-25 10:08:00.774312	2020-05-25 10:08:00.774312
8744	43	74	2		2020-05-25 10:08:00.785813	2020-05-25 10:08:00.785813
8745	62	74	2		2020-05-25 10:08:00.798801	2020-05-25 10:08:00.798801
8746	70	74	3		2020-05-25 10:08:00.813441	2020-05-25 10:08:00.813441
8747	32	74	3		2020-05-25 10:08:00.824709	2020-05-25 10:08:00.824709
8748	23	74	2		2020-05-25 10:08:00.837954	2020-05-25 10:08:00.837954
8749	13	74	3		2020-05-25 10:08:00.850813	2020-05-25 10:08:00.850813
8750	33	74	4		2020-05-25 10:08:00.863911	2020-05-25 10:08:00.863911
8751	79	74	2		2020-05-25 10:08:00.873955	2020-05-25 10:08:00.873955
8752	52	74	1		2020-05-25 10:08:00.88626	2020-05-25 10:08:00.88626
8753	22	74	0		2020-05-25 10:08:00.900998	2020-05-25 10:08:00.900998
8754	83	74	5		2020-05-25 10:08:00.914633	2020-05-25 10:08:00.914633
8755	47	74	2		2020-05-25 10:08:00.923627	2020-05-25 10:08:00.923627
8756	61	74	3		2020-05-25 10:08:00.934809	2020-05-25 10:08:00.934809
8757	78	74	4		2020-05-25 10:08:00.949484	2020-05-25 10:08:00.949484
8758	6	74	0		2020-05-25 10:08:00.963939	2020-05-25 10:08:00.963939
8759	50	74	0		2020-05-25 10:08:00.974587	2020-05-25 10:08:00.974587
8760	73	74	1		2020-05-25 10:08:00.986613	2020-05-25 10:08:00.986613
8761	87	74	5		2020-05-25 10:08:01.000091	2020-05-25 10:08:01.000091
8762	11	74	5		2020-05-25 10:08:01.015954	2020-05-25 10:08:01.015954
8763	74	74	0		2020-05-25 10:08:01.02427	2020-05-25 10:08:01.02427
8764	76	74	4		2020-05-25 10:08:01.030355	2020-05-25 10:08:01.030355
8765	19	74	3		2020-05-25 10:08:01.043135	2020-05-25 10:08:01.043135
8766	8	74	2		2020-05-25 10:08:01.052072	2020-05-25 10:08:01.052072
8767	91	74	4		2020-05-25 10:08:01.061079	2020-05-25 10:08:01.061079
8768	92	74	2		2020-05-25 10:08:01.072649	2020-05-25 10:08:01.072649
8769	68	74	3		2020-05-25 10:08:01.079913	2020-05-25 10:08:01.079913
8770	95	74	4		2020-05-25 10:08:01.092097	2020-05-25 10:08:01.092097
8771	49	74	2		2020-05-25 10:08:01.097626	2020-05-25 10:08:01.097626
8772	75	74	3		2020-05-25 10:08:01.10971	2020-05-25 10:08:01.10971
8773	9	74	3		2020-05-25 10:08:01.11998	2020-05-25 10:08:01.11998
8774	66	74	2		2020-05-25 10:08:01.129098	2020-05-25 10:08:01.129098
8775	71	74	2		2020-05-25 10:08:01.138514	2020-05-25 10:08:01.138514
8776	53	74	4		2020-05-25 10:08:01.147742	2020-05-25 10:08:01.147742
8777	40	74	1		2020-05-25 10:08:01.157909	2020-05-25 10:08:01.157909
8778	86	74	0		2020-05-25 10:08:01.16346	2020-05-25 10:08:01.16346
8779	51	74	4		2020-05-25 10:08:01.174328	2020-05-25 10:08:01.174328
8780	54	74	1		2020-05-25 10:08:01.181399	2020-05-25 10:08:01.181399
8781	84	74	3		2020-05-25 10:08:01.193036	2020-05-25 10:08:01.193036
8782	64	74	3		2020-05-25 10:08:01.200659	2020-05-25 10:08:01.200659
8783	28	74	4		2020-05-25 10:08:01.21071	2020-05-25 10:08:01.21071
8784	3	74	3		2020-05-25 10:08:01.219895	2020-05-25 10:08:01.219895
8785	82	74	3		2020-05-25 10:08:01.229159	2020-05-25 10:08:01.229159
8786	37	74	0		2020-05-25 10:08:01.241529	2020-05-25 10:08:01.241529
8787	34	74	4		2020-05-25 10:08:01.247772	2020-05-25 10:08:01.247772
8788	85	74	3		2020-05-25 10:08:01.260094	2020-05-25 10:08:01.260094
8789	72	74	1		2020-05-25 10:08:01.268312	2020-05-25 10:08:01.268312
8790	0	74	0		2020-05-25 10:08:01.27793	2020-05-25 10:08:01.27793
8791	16	74	4		2020-05-25 10:08:01.285829	2020-05-25 10:08:01.285829
8792	89	74	0		2020-05-25 10:08:01.294013	2020-05-25 10:08:01.294013
8793	56	74	1		2020-05-25 10:08:01.304631	2020-05-25 10:08:01.304631
8794	99	74	5		2020-05-25 10:08:01.313015	2020-05-25 10:08:01.313015
8795	63	74	2		2020-05-25 10:08:01.323885	2020-05-25 10:08:01.323885
8796	88	74	4		2020-05-25 10:08:01.328622	2020-05-25 10:08:01.328622
8797	45	74	4		2020-05-25 10:08:01.337352	2020-05-25 10:08:01.337352
8798	98	74	2		2020-05-25 10:08:01.345614	2020-05-25 10:08:01.345614
8799	42	74	1		2020-05-25 10:08:01.354746	2020-05-25 10:08:01.354746
8800	48	74	1		2020-05-25 10:08:01.363444	2020-05-25 10:08:01.363444
8801	15	74	4		2020-05-25 10:08:01.373414	2020-05-25 10:08:01.373414
8802	57	74	0		2020-05-25 10:08:01.37963	2020-05-25 10:08:01.37963
8803	30	74	5		2020-05-25 10:08:01.390933	2020-05-25 10:08:01.390933
8804	96	74	2		2020-05-25 10:08:01.39769	2020-05-25 10:08:01.39769
8805	4	74	2		2020-05-25 10:08:01.409533	2020-05-25 10:08:01.409533
8806	48	75	0		2020-05-25 10:08:01.418769	2020-05-25 10:08:01.418769
8807	23	75	0		2020-05-25 10:08:01.427601	2020-05-25 10:08:01.427601
8808	77	75	3		2020-05-25 10:08:01.434911	2020-05-25 10:08:01.434911
8809	26	75	0		2020-05-25 10:08:01.443443	2020-05-25 10:08:01.443443
8810	18	75	0		2020-05-25 10:08:01.452392	2020-05-25 10:08:01.452392
8811	2	75	5		2020-05-25 10:08:01.461177	2020-05-25 10:08:01.461177
8812	90	75	2		2020-05-25 10:08:01.470042	2020-05-25 10:08:01.470042
8813	94	75	2		2020-05-25 10:08:01.479792	2020-05-25 10:08:01.479792
8814	93	75	1		2020-05-25 10:08:01.487112	2020-05-25 10:08:01.487112
8815	68	75	1		2020-05-25 10:08:01.495997	2020-05-25 10:08:01.495997
8816	20	75	0		2020-05-25 10:08:01.50619	2020-05-25 10:08:01.50619
8817	27	75	0		2020-05-25 10:08:01.514407	2020-05-25 10:08:01.514407
8818	70	75	0		2020-05-25 10:08:01.524462	2020-05-25 10:08:01.524462
8819	34	75	0		2020-05-25 10:08:01.530304	2020-05-25 10:08:01.530304
8820	88	75	1		2020-05-25 10:08:01.541165	2020-05-25 10:08:01.541165
8821	14	75	5		2020-05-25 10:08:01.548483	2020-05-25 10:08:01.548483
8822	74	75	1		2020-05-25 10:08:01.561136	2020-05-25 10:08:01.561136
8823	65	75	3		2020-05-25 10:08:01.579888	2020-05-25 10:08:01.579888
8824	87	75	2		2020-05-25 10:08:01.587523	2020-05-25 10:08:01.587523
8825	91	75	1		2020-05-25 10:08:01.603678	2020-05-25 10:08:01.603678
8826	52	75	0		2020-05-25 10:08:01.614473	2020-05-25 10:08:01.614473
8827	37	75	0		2020-05-25 10:08:01.623449	2020-05-25 10:08:01.623449
8828	57	75	0		2020-05-25 10:08:01.63813	2020-05-25 10:08:01.63813
8829	22	75	1		2020-05-25 10:08:01.655535	2020-05-25 10:08:01.655535
8830	69	75	3		2020-05-25 10:08:01.672384	2020-05-25 10:08:01.672384
8831	17	75	0		2020-05-25 10:08:01.678602	2020-05-25 10:08:01.678602
8832	51	75	4		2020-05-25 10:08:01.690795	2020-05-25 10:08:01.690795
8833	63	75	5		2020-05-25 10:08:01.695833	2020-05-25 10:08:01.695833
8834	59	75	4		2020-05-25 10:08:01.709722	2020-05-25 10:08:01.709722
8835	9	75	2		2020-05-25 10:08:01.714586	2020-05-25 10:08:01.714586
8836	96	75	0		2020-05-25 10:08:01.729767	2020-05-25 10:08:01.729767
8837	10	75	1		2020-05-25 10:08:01.741964	2020-05-25 10:08:01.741964
8838	44	75	4		2020-05-25 10:08:01.74868	2020-05-25 10:08:01.74868
8839	53	75	3		2020-05-25 10:08:01.760098	2020-05-25 10:08:01.760098
8840	92	75	1		2020-05-25 10:08:01.769423	2020-05-25 10:08:01.769423
8841	76	75	2		2020-05-25 10:08:01.779271	2020-05-25 10:08:01.779271
8842	15	75	2		2020-05-25 10:08:01.787319	2020-05-25 10:08:01.787319
8843	40	75	5		2020-05-25 10:08:01.799254	2020-05-25 10:08:01.799254
8844	12	75	4		2020-05-25 10:08:01.810147	2020-05-25 10:08:01.810147
8845	95	75	3		2020-05-25 10:08:01.820649	2020-05-25 10:08:01.820649
8846	28	75	0		2020-05-25 10:08:01.829437	2020-05-25 10:08:01.829437
8847	45	75	0		2020-05-25 10:08:01.8423	2020-05-25 10:08:01.8423
8848	19	75	3		2020-05-25 10:08:01.84898	2020-05-25 10:08:01.84898
8849	21	75	1		2020-05-25 10:08:01.860918	2020-05-25 10:08:01.860918
8850	73	75	1		2020-05-25 10:08:01.870104	2020-05-25 10:08:01.870104
8851	62	75	3		2020-05-25 10:08:01.879358	2020-05-25 10:08:01.879358
8852	61	75	0		2020-05-25 10:08:01.893984	2020-05-25 10:08:01.893984
8853	72	75	4		2020-05-25 10:08:01.903812	2020-05-25 10:08:01.903812
8854	79	75	0		2020-05-25 10:08:01.913332	2020-05-25 10:08:01.913332
8855	38	75	3		2020-05-25 10:08:01.927144	2020-05-25 10:08:01.927144
8856	0	75	2		2020-05-25 10:08:01.937807	2020-05-25 10:08:01.937807
8857	39	75	0		2020-05-25 10:08:01.949926	2020-05-25 10:08:01.949926
8858	85	75	0		2020-05-25 10:08:01.962853	2020-05-25 10:08:01.962853
8859	8	75	2		2020-05-25 10:08:01.973858	2020-05-25 10:08:01.973858
8860	89	75	3		2020-05-25 10:08:01.985428	2020-05-25 10:08:01.985428
8861	7	75	1		2020-05-25 10:08:01.998356	2020-05-25 10:08:01.998356
8862	35	75	1		2020-05-25 10:08:02.014338	2020-05-25 10:08:02.014338
8863	33	75	3		2020-05-25 10:08:02.025403	2020-05-25 10:08:02.025403
8864	60	75	0		2020-05-25 10:08:02.036241	2020-05-25 10:08:02.036241
8865	1	75	3		2020-05-25 10:08:02.049534	2020-05-25 10:08:02.049534
8866	43	75	3		2020-05-25 10:08:02.063079	2020-05-25 10:08:02.063079
8867	56	75	4		2020-05-25 10:08:02.073717	2020-05-25 10:08:02.073717
8868	78	75	1		2020-05-25 10:08:02.083761	2020-05-25 10:08:02.083761
8869	86	75	0		2020-05-25 10:08:02.095735	2020-05-25 10:08:02.095735
8870	67	75	4		2020-05-25 10:08:02.106354	2020-05-25 10:08:02.106354
8871	16	75	3		2020-05-25 10:08:02.116992	2020-05-25 10:08:02.116992
8872	5	75	5		2020-05-25 10:08:02.12343	2020-05-25 10:08:02.12343
8873	41	75	3		2020-05-25 10:08:02.128135	2020-05-25 10:08:02.128135
8874	64	75	4		2020-05-25 10:08:02.142166	2020-05-25 10:08:02.142166
8875	24	75	4		2020-05-25 10:08:02.146775	2020-05-25 10:08:02.146775
8876	75	75	0		2020-05-25 10:08:02.158597	2020-05-25 10:08:02.158597
8877	36	75	4		2020-05-25 10:08:02.165264	2020-05-25 10:08:02.165264
8878	81	75	5		2020-05-25 10:08:02.177543	2020-05-25 10:08:02.177543
8879	6	75	2		2020-05-25 10:08:02.185342	2020-05-25 10:08:02.185342
8880	49	75	0		2020-05-25 10:08:02.193765	2020-05-25 10:08:02.193765
8881	58	75	2		2020-05-25 10:08:02.202982	2020-05-25 10:08:02.202982
8882	47	75	0		2020-05-25 10:08:02.211759	2020-05-25 10:08:02.211759
8883	80	75	4		2020-05-25 10:08:02.219827	2020-05-25 10:08:02.219827
8884	99	75	2		2020-05-25 10:08:02.249805	2020-05-25 10:08:02.249805
8885	13	75	4		2020-05-25 10:08:02.254489	2020-05-25 10:08:02.254489
8886	31	75	5		2020-05-25 10:08:02.262574	2020-05-25 10:08:02.262574
8887	50	75	3		2020-05-25 10:08:02.271916	2020-05-25 10:08:02.271916
8888	41	76	3		2020-05-25 10:08:02.280241	2020-05-25 10:08:02.280241
8889	96	76	3		2020-05-25 10:08:02.288496	2020-05-25 10:08:02.288496
8890	92	76	3		2020-05-25 10:08:02.295035	2020-05-25 10:08:02.295035
8891	25	76	3		2020-05-25 10:08:02.303166	2020-05-25 10:08:02.303166
8892	79	76	2		2020-05-25 10:08:02.312015	2020-05-25 10:08:02.312015
8893	73	76	0		2020-05-25 10:08:02.318591	2020-05-25 10:08:02.318591
8894	10	76	0		2020-05-25 10:08:02.32688	2020-05-25 10:08:02.32688
8895	9	76	5		2020-05-25 10:08:02.335191	2020-05-25 10:08:02.335191
8896	80	76	1		2020-05-25 10:08:02.342288	2020-05-25 10:08:02.342288
8897	63	76	0		2020-05-25 10:08:02.348899	2020-05-25 10:08:02.348899
8898	94	76	3		2020-05-25 10:08:02.360002	2020-05-25 10:08:02.360002
8899	65	76	0		2020-05-25 10:08:02.369149	2020-05-25 10:08:02.369149
8900	7	76	0		2020-05-25 10:08:02.375647	2020-05-25 10:08:02.375647
8901	47	76	1		2020-05-25 10:08:02.382464	2020-05-25 10:08:02.382464
8902	70	76	1		2020-05-25 10:08:02.39466	2020-05-25 10:08:02.39466
8903	30	76	0		2020-05-25 10:08:02.402531	2020-05-25 10:08:02.402531
8904	88	76	0		2020-05-25 10:08:02.408331	2020-05-25 10:08:02.408331
8905	64	76	0		2020-05-25 10:08:02.416515	2020-05-25 10:08:02.416515
8906	2	76	3		2020-05-25 10:08:02.422423	2020-05-25 10:08:02.422423
8907	87	76	0		2020-05-25 10:08:02.429859	2020-05-25 10:08:02.429859
8908	26	76	2		2020-05-25 10:08:02.43854	2020-05-25 10:08:02.43854
8909	40	76	4		2020-05-25 10:08:02.446181	2020-05-25 10:08:02.446181
8910	50	76	4		2020-05-25 10:08:02.453706	2020-05-25 10:08:02.453706
8911	24	76	0		2020-05-25 10:08:02.462388	2020-05-25 10:08:02.462388
8912	6	76	4		2020-05-25 10:08:02.471988	2020-05-25 10:08:02.471988
8913	76	76	0		2020-05-25 10:08:02.478503	2020-05-25 10:08:02.478503
8914	16	76	3		2020-05-25 10:08:02.488716	2020-05-25 10:08:02.488716
8915	19	76	0		2020-05-25 10:08:02.496128	2020-05-25 10:08:02.496128
8916	23	76	5		2020-05-25 10:08:02.5062	2020-05-25 10:08:02.5062
8917	13	76	1		2020-05-25 10:08:02.514258	2020-05-25 10:08:02.514258
8918	51	76	0		2020-05-25 10:08:02.523618	2020-05-25 10:08:02.523618
8919	20	76	0		2020-05-25 10:08:02.530672	2020-05-25 10:08:02.530672
8920	60	76	3		2020-05-25 10:08:02.538237	2020-05-25 10:08:02.538237
8921	42	76	2		2020-05-25 10:08:02.544525	2020-05-25 10:08:02.544525
8922	3	76	2		2020-05-25 10:08:02.554295	2020-05-25 10:08:02.554295
8923	49	76	4		2020-05-25 10:08:02.562465	2020-05-25 10:08:02.562465
8924	84	76	4		2020-05-25 10:08:02.571842	2020-05-25 10:08:02.571842
8925	81	76	4		2020-05-25 10:08:02.577369	2020-05-25 10:08:02.577369
8926	38	76	0		2020-05-25 10:08:02.586791	2020-05-25 10:08:02.586791
8927	56	76	2		2020-05-25 10:08:02.594803	2020-05-25 10:08:02.594803
8928	85	76	3		2020-05-25 10:08:02.602344	2020-05-25 10:08:02.602344
8929	44	76	2		2020-05-25 10:08:02.607875	2020-05-25 10:08:02.607875
8930	37	76	1		2020-05-25 10:08:02.61578	2020-05-25 10:08:02.61578
8931	48	76	1		2020-05-25 10:08:02.621651	2020-05-25 10:08:02.621651
8932	18	76	4		2020-05-25 10:08:02.629059	2020-05-25 10:08:02.629059
8933	77	76	3		2020-05-25 10:08:02.637395	2020-05-25 10:08:02.637395
8934	62	76	3		2020-05-25 10:08:02.643626	2020-05-25 10:08:02.643626
8935	28	76	2		2020-05-25 10:08:02.650131	2020-05-25 10:08:02.650131
8936	54	76	0		2020-05-25 10:08:02.660615	2020-05-25 10:08:02.660615
8937	83	76	0		2020-05-25 10:08:02.669965	2020-05-25 10:08:02.669965
8938	74	76	5		2020-05-25 10:08:02.676568	2020-05-25 10:08:02.676568
8939	13	77	2		2020-05-25 10:08:02.686166	2020-05-25 10:08:02.686166
8940	73	77	2		2020-05-25 10:08:02.694476	2020-05-25 10:08:02.694476
8941	8	77	0		2020-05-25 10:08:02.702745	2020-05-25 10:08:02.702745
8942	14	77	1		2020-05-25 10:08:02.70838	2020-05-25 10:08:02.70838
8943	60	77	4		2020-05-25 10:08:02.716017	2020-05-25 10:08:02.716017
8944	67	77	3		2020-05-25 10:08:02.72635	2020-05-25 10:08:02.72635
8945	46	77	2		2020-05-25 10:08:02.735664	2020-05-25 10:08:02.735664
8946	53	77	4		2020-05-25 10:08:02.741396	2020-05-25 10:08:02.741396
8947	99	77	3		2020-05-25 10:08:02.749462	2020-05-25 10:08:02.749462
8948	30	77	4		2020-05-25 10:08:02.75988	2020-05-25 10:08:02.75988
8949	11	77	4		2020-05-25 10:08:02.769132	2020-05-25 10:08:02.769132
8950	64	77	5		2020-05-25 10:08:02.775009	2020-05-25 10:08:02.775009
8951	40	77	0		2020-05-25 10:08:02.783132	2020-05-25 10:08:02.783132
8952	6	77	3		2020-05-25 10:08:02.7952	2020-05-25 10:08:02.7952
8953	79	77	4		2020-05-25 10:08:02.803322	2020-05-25 10:08:02.803322
8954	1	77	4		2020-05-25 10:08:02.810189	2020-05-25 10:08:02.810189
8955	12	77	1		2020-05-25 10:08:02.820818	2020-05-25 10:08:02.820818
8956	61	77	4		2020-05-25 10:08:02.828796	2020-05-25 10:08:02.828796
8957	3	77	4		2020-05-25 10:08:02.83589	2020-05-25 10:08:02.83589
8958	94	77	2		2020-05-25 10:08:02.842088	2020-05-25 10:08:02.842088
8959	25	77	3		2020-05-25 10:08:02.84991	2020-05-25 10:08:02.84991
8960	78	77	0		2020-05-25 10:08:02.860067	2020-05-25 10:08:02.860067
8961	32	77	5		2020-05-25 10:08:02.868843	2020-05-25 10:08:02.868843
8962	83	77	0		2020-05-25 10:08:02.877774	2020-05-25 10:08:02.877774
8963	42	77	3		2020-05-25 10:08:02.889211	2020-05-25 10:08:02.889211
8964	76	77	3		2020-05-25 10:08:02.900878	2020-05-25 10:08:02.900878
8965	28	77	4		2020-05-25 10:08:02.910799	2020-05-25 10:08:02.910799
8966	72	77	3		2020-05-25 10:08:02.921156	2020-05-25 10:08:02.921156
8967	24	77	5		2020-05-25 10:08:02.934118	2020-05-25 10:08:02.934118
8968	31	77	5		2020-05-25 10:08:02.950629	2020-05-25 10:08:02.950629
8969	55	77	3		2020-05-25 10:08:02.959726	2020-05-25 10:08:02.959726
8970	7	77	5		2020-05-25 10:08:02.972768	2020-05-25 10:08:02.972768
8971	27	77	0		2020-05-25 10:08:02.981986	2020-05-25 10:08:02.981986
8972	70	77	4		2020-05-25 10:08:02.994939	2020-05-25 10:08:02.994939
8973	88	77	5		2020-05-25 10:08:03.00602	2020-05-25 10:08:03.00602
8974	35	77	2		2020-05-25 10:08:03.015182	2020-05-25 10:08:03.015182
8975	34	77	3		2020-05-25 10:08:03.024323	2020-05-25 10:08:03.024323
8976	58	77	4		2020-05-25 10:08:03.03289	2020-05-25 10:08:03.03289
8977	54	77	4		2020-05-25 10:08:03.047155	2020-05-25 10:08:03.047155
8978	4	77	5		2020-05-25 10:08:03.063619	2020-05-25 10:08:03.063619
8979	33	77	2		2020-05-25 10:08:03.073989	2020-05-25 10:08:03.073989
8980	77	77	1		2020-05-25 10:08:03.08419	2020-05-25 10:08:03.08419
8981	93	77	0		2020-05-25 10:08:03.096642	2020-05-25 10:08:03.096642
8982	47	77	4		2020-05-25 10:08:03.110174	2020-05-25 10:08:03.110174
8983	26	77	1		2020-05-25 10:08:03.120816	2020-05-25 10:08:03.120816
8984	29	77	3		2020-05-25 10:08:03.129638	2020-05-25 10:08:03.129638
8985	10	77	1		2020-05-25 10:08:03.143256	2020-05-25 10:08:03.143256
8986	2	77	1		2020-05-25 10:08:03.153841	2020-05-25 10:08:03.153841
8987	17	77	2		2020-05-25 10:08:03.16316	2020-05-25 10:08:03.16316
8988	86	77	2		2020-05-25 10:08:03.176352	2020-05-25 10:08:03.176352
8989	52	77	5		2020-05-25 10:08:03.187161	2020-05-25 10:08:03.187161
8990	90	77	5		2020-05-25 10:08:03.196494	2020-05-25 10:08:03.196494
8991	44	77	2		2020-05-25 10:08:03.213022	2020-05-25 10:08:03.213022
8992	95	77	4		2020-05-25 10:08:03.224766	2020-05-25 10:08:03.224766
8993	41	77	4		2020-05-25 10:08:03.237536	2020-05-25 10:08:03.237536
8994	48	77	3		2020-05-25 10:08:03.250518	2020-05-25 10:08:03.250518
8995	96	78	2		2020-05-25 10:08:03.264754	2020-05-25 10:08:03.264754
8996	24	78	4		2020-05-25 10:08:03.275858	2020-05-25 10:08:03.275858
8997	61	78	1		2020-05-25 10:08:03.286673	2020-05-25 10:08:03.286673
8998	67	78	3		2020-05-25 10:08:03.299422	2020-05-25 10:08:03.299422
8999	59	78	3		2020-05-25 10:08:03.312663	2020-05-25 10:08:03.312663
9000	6	78	0		2020-05-25 10:08:03.323717	2020-05-25 10:08:03.323717
9001	47	78	0		2020-05-25 10:08:03.334277	2020-05-25 10:08:03.334277
9002	53	78	3		2020-05-25 10:08:03.345768	2020-05-25 10:08:03.345768
9003	13	78	1		2020-05-25 10:08:03.356529	2020-05-25 10:08:03.356529
9004	48	78	2		2020-05-25 10:08:03.366259	2020-05-25 10:08:03.366259
9005	85	78	4		2020-05-25 10:08:03.379795	2020-05-25 10:08:03.379795
9006	91	78	0		2020-05-25 10:08:03.389391	2020-05-25 10:08:03.389391
9007	22	78	5		2020-05-25 10:08:03.399415	2020-05-25 10:08:03.399415
9008	78	78	4		2020-05-25 10:08:03.412393	2020-05-25 10:08:03.412393
9009	28	78	3		2020-05-25 10:08:03.424023	2020-05-25 10:08:03.424023
9010	81	78	0		2020-05-25 10:08:03.434006	2020-05-25 10:08:03.434006
9011	55	78	5		2020-05-25 10:08:03.447579	2020-05-25 10:08:03.447579
9012	54	78	3		2020-05-25 10:08:03.462262	2020-05-25 10:08:03.462262
9013	44	78	0		2020-05-25 10:08:03.473242	2020-05-25 10:08:03.473242
9014	84	78	5		2020-05-25 10:08:03.484974	2020-05-25 10:08:03.484974
9015	83	78	1		2020-05-25 10:08:03.496363	2020-05-25 10:08:03.496363
9016	5	78	0		2020-05-25 10:08:03.509195	2020-05-25 10:08:03.509195
9017	99	78	4		2020-05-25 10:08:03.52157	2020-05-25 10:08:03.52157
9018	93	78	2		2020-05-25 10:08:03.533632	2020-05-25 10:08:03.533632
9019	70	78	4		2020-05-25 10:08:03.547033	2020-05-25 10:08:03.547033
9020	52	78	2		2020-05-25 10:08:03.556292	2020-05-25 10:08:03.556292
9021	88	78	1		2020-05-25 10:08:03.57092	2020-05-25 10:08:03.57092
9022	3	78	1		2020-05-25 10:08:03.580502	2020-05-25 10:08:03.580502
9023	17	78	2		2020-05-25 10:08:03.590263	2020-05-25 10:08:03.590263
9024	35	78	3		2020-05-25 10:08:03.600348	2020-05-25 10:08:03.600348
9025	9	78	1		2020-05-25 10:08:03.613542	2020-05-25 10:08:03.613542
9026	23	78	1		2020-05-25 10:08:03.624799	2020-05-25 10:08:03.624799
9027	72	78	5		2020-05-25 10:08:03.635894	2020-05-25 10:08:03.635894
9028	90	78	0		2020-05-25 10:08:03.648388	2020-05-25 10:08:03.648388
9029	63	78	4		2020-05-25 10:08:03.661439	2020-05-25 10:08:03.661439
9030	80	78	3		2020-05-25 10:08:03.672733	2020-05-25 10:08:03.672733
9031	21	78	0		2020-05-25 10:08:03.68223	2020-05-25 10:08:03.68223
9032	42	78	4		2020-05-25 10:08:03.695403	2020-05-25 10:08:03.695403
9033	1	78	2		2020-05-25 10:08:03.706388	2020-05-25 10:08:03.706388
9034	16	78	4		2020-05-25 10:08:03.716611	2020-05-25 10:08:03.716611
9035	86	78	4		2020-05-25 10:08:03.729454	2020-05-25 10:08:03.729454
9036	68	78	5		2020-05-25 10:08:03.740378	2020-05-25 10:08:03.740378
9037	92	78	4		2020-05-25 10:08:03.750621	2020-05-25 10:08:03.750621
9038	30	78	1		2020-05-25 10:08:03.763651	2020-05-25 10:08:03.763651
9039	14	78	1		2020-05-25 10:08:03.800539	2020-05-25 10:08:03.800539
9040	62	78	4		2020-05-25 10:08:03.806476	2020-05-25 10:08:03.806476
9041	20	78	4		2020-05-25 10:08:03.811142	2020-05-25 10:08:03.811142
9042	71	78	0		2020-05-25 10:08:03.819924	2020-05-25 10:08:03.819924
9043	73	78	4		2020-05-25 10:08:03.828557	2020-05-25 10:08:03.828557
9044	37	78	4		2020-05-25 10:08:03.840145	2020-05-25 10:08:03.840145
9045	34	79	5		2020-05-25 10:08:03.844893	2020-05-25 10:08:03.844893
9046	11	79	5		2020-05-25 10:08:03.855244	2020-05-25 10:08:03.855244
9047	26	79	4		2020-05-25 10:08:03.862312	2020-05-25 10:08:03.862312
9048	75	79	0		2020-05-25 10:08:03.870875	2020-05-25 10:08:03.870875
9049	85	79	0		2020-05-25 10:08:03.879468	2020-05-25 10:08:03.879468
9050	95	79	4		2020-05-25 10:08:03.890652	2020-05-25 10:08:03.890652
9051	50	79	2		2020-05-25 10:08:03.895518	2020-05-25 10:08:03.895518
9052	77	79	0		2020-05-25 10:08:03.906071	2020-05-25 10:08:03.906071
9053	18	79	3		2020-05-25 10:08:03.91291	2020-05-25 10:08:03.91291
9054	40	79	1		2020-05-25 10:08:03.925157	2020-05-25 10:08:03.925157
9055	5	79	5		2020-05-25 10:08:03.929752	2020-05-25 10:08:03.929752
9056	74	79	4		2020-05-25 10:08:03.94361	2020-05-25 10:08:03.94361
9057	59	79	4		2020-05-25 10:08:03.951323	2020-05-25 10:08:03.951323
9058	44	79	4		2020-05-25 10:08:03.960786	2020-05-25 10:08:03.960786
9059	41	79	4		2020-05-25 10:08:03.968113	2020-05-25 10:08:03.968113
9060	9	79	1		2020-05-25 10:08:03.976567	2020-05-25 10:08:03.976567
9061	70	79	1		2020-05-25 10:08:03.984771	2020-05-25 10:08:03.984771
9062	21	79	4		2020-05-25 10:08:03.993838	2020-05-25 10:08:03.993838
9063	8	79	0		2020-05-25 10:08:04.004513	2020-05-25 10:08:04.004513
9064	94	79	1		2020-05-25 10:08:04.013466	2020-05-25 10:08:04.013466
9065	93	79	1		2020-05-25 10:08:04.023776	2020-05-25 10:08:04.023776
9066	61	79	1		2020-05-25 10:08:04.0295	2020-05-25 10:08:04.0295
9067	58	79	5		2020-05-25 10:08:04.041224	2020-05-25 10:08:04.041224
9068	12	79	4		2020-05-25 10:08:04.04805	2020-05-25 10:08:04.04805
9069	49	79	0		2020-05-25 10:08:04.059895	2020-05-25 10:08:04.059895
9070	92	79	3		2020-05-25 10:08:04.068004	2020-05-25 10:08:04.068004
9071	22	79	3		2020-05-25 10:08:04.077518	2020-05-25 10:08:04.077518
9072	62	79	2		2020-05-25 10:08:04.085715	2020-05-25 10:08:04.085715
9073	83	79	2		2020-05-25 10:08:04.09419	2020-05-25 10:08:04.09419
9074	3	79	0		2020-05-25 10:08:04.102592	2020-05-25 10:08:04.102592
9075	7	79	1		2020-05-25 10:08:04.111465	2020-05-25 10:08:04.111465
9076	43	79	0		2020-05-25 10:08:04.118705	2020-05-25 10:08:04.118705
9077	36	79	1		2020-05-25 10:08:04.127337	2020-05-25 10:08:04.127337
9078	2	79	2		2020-05-25 10:08:04.138003	2020-05-25 10:08:04.138003
9079	97	79	1		2020-05-25 10:08:04.146368	2020-05-25 10:08:04.146368
9080	68	79	4		2020-05-25 10:08:04.155145	2020-05-25 10:08:04.155145
9081	15	79	4		2020-05-25 10:08:04.161774	2020-05-25 10:08:04.161774
9082	64	79	0		2020-05-25 10:08:04.170489	2020-05-25 10:08:04.170489
9083	27	79	3		2020-05-25 10:08:04.178919	2020-05-25 10:08:04.178919
9084	73	79	1		2020-05-25 10:08:04.189386	2020-05-25 10:08:04.189386
9085	84	79	0		2020-05-25 10:08:04.194696	2020-05-25 10:08:04.194696
9086	1	79	2		2020-05-25 10:08:04.205903	2020-05-25 10:08:04.205903
9087	53	79	3		2020-05-25 10:08:04.212704	2020-05-25 10:08:04.212704
9088	60	79	0		2020-05-25 10:08:04.224337	2020-05-25 10:08:04.224337
9089	29	79	3		2020-05-25 10:08:04.231163	2020-05-25 10:08:04.231163
9090	69	79	0		2020-05-25 10:08:04.243187	2020-05-25 10:08:04.243187
9091	56	79	0		2020-05-25 10:08:04.252438	2020-05-25 10:08:04.252438
9092	23	79	4		2020-05-25 10:08:04.261381	2020-05-25 10:08:04.261381
9093	55	79	2		2020-05-25 10:08:04.269888	2020-05-25 10:08:04.269888
9094	46	79	1		2020-05-25 10:08:04.280532	2020-05-25 10:08:04.280532
9095	99	79	1		2020-05-25 10:08:04.288408	2020-05-25 10:08:04.288408
9096	76	79	4		2020-05-25 10:08:04.297334	2020-05-25 10:08:04.297334
9097	67	79	2		2020-05-25 10:08:04.310286	2020-05-25 10:08:04.310286
9098	28	79	0		2020-05-25 10:08:04.316741	2020-05-25 10:08:04.316741
9099	96	79	3		2020-05-25 10:08:04.328652	2020-05-25 10:08:04.328652
9100	78	79	3		2020-05-25 10:08:04.337756	2020-05-25 10:08:04.337756
9101	63	79	2		2020-05-25 10:08:04.346472	2020-05-25 10:08:04.346472
9102	35	79	4		2020-05-25 10:08:04.359347	2020-05-25 10:08:04.359347
9103	17	79	2		2020-05-25 10:08:04.366289	2020-05-25 10:08:04.366289
9104	51	79	1		2020-05-25 10:08:04.378311	2020-05-25 10:08:04.378311
9105	37	79	1		2020-05-25 10:08:04.386934	2020-05-25 10:08:04.386934
9106	10	79	1		2020-05-25 10:08:04.395581	2020-05-25 10:08:04.395581
9107	79	79	1		2020-05-25 10:08:04.408999	2020-05-25 10:08:04.408999
9108	52	79	2		2020-05-25 10:08:04.415061	2020-05-25 10:08:04.415061
9109	14	79	3		2020-05-25 10:08:04.427284	2020-05-25 10:08:04.427284
9110	48	79	2		2020-05-25 10:08:04.436603	2020-05-25 10:08:04.436603
9111	66	79	4		2020-05-25 10:08:04.447833	2020-05-25 10:08:04.447833
9112	16	79	4		2020-05-25 10:08:04.455424	2020-05-25 10:08:04.455424
9113	80	79	1		2020-05-25 10:08:04.466476	2020-05-25 10:08:04.466476
9114	88	79	2		2020-05-25 10:08:04.476501	2020-05-25 10:08:04.476501
9115	90	79	3		2020-05-25 10:08:04.483298	2020-05-25 10:08:04.483298
9116	32	79	3		2020-05-25 10:08:04.49548	2020-05-25 10:08:04.49548
9117	91	79	3		2020-05-25 10:08:04.506488	2020-05-25 10:08:04.506488
9118	6	79	1		2020-05-25 10:08:04.517667	2020-05-25 10:08:04.517667
9119	30	79	4		2020-05-25 10:08:04.528507	2020-05-25 10:08:04.528507
9120	57	79	2		2020-05-25 10:08:04.538706	2020-05-25 10:08:04.538706
9121	81	79	4		2020-05-25 10:08:04.548376	2020-05-25 10:08:04.548376
9122	31	79	0		2020-05-25 10:08:04.56136	2020-05-25 10:08:04.56136
9123	47	79	4		2020-05-25 10:08:04.572551	2020-05-25 10:08:04.572551
9124	89	79	5		2020-05-25 10:08:04.582723	2020-05-25 10:08:04.582723
9125	39	79	4		2020-05-25 10:08:04.596466	2020-05-25 10:08:04.596466
9126	82	79	5		2020-05-25 10:08:04.60718	2020-05-25 10:08:04.60718
9127	4	79	0		2020-05-25 10:08:04.621001	2020-05-25 10:08:04.621001
9128	72	79	5		2020-05-25 10:08:04.631485	2020-05-25 10:08:04.631485
9129	98	79	2		2020-05-25 10:08:04.64519	2020-05-25 10:08:04.64519
9130	71	79	4		2020-05-25 10:08:04.655664	2020-05-25 10:08:04.655664
9131	38	79	5		2020-05-25 10:08:04.665223	2020-05-25 10:08:04.665223
9132	33	79	4		2020-05-25 10:08:04.678141	2020-05-25 10:08:04.678141
9133	86	79	2		2020-05-25 10:08:04.688667	2020-05-25 10:08:04.688667
9134	42	79	3		2020-05-25 10:08:04.698509	2020-05-25 10:08:04.698509
9135	19	79	1		2020-05-25 10:08:04.711358	2020-05-25 10:08:04.711358
9136	24	79	0		2020-05-25 10:08:04.721885	2020-05-25 10:08:04.721885
9137	45	79	1		2020-05-25 10:08:04.731359	2020-05-25 10:08:04.731359
9138	20	79	1		2020-05-25 10:08:04.74472	2020-05-25 10:08:04.74472
9139	54	79	1		2020-05-25 10:08:04.755818	2020-05-25 10:08:04.755818
9140	0	79	1		2020-05-25 10:08:04.765768	2020-05-25 10:08:04.765768
9141	64	80	4		2020-05-25 10:08:04.778141	2020-05-25 10:08:04.778141
9142	13	80	2		2020-05-25 10:08:04.788882	2020-05-25 10:08:04.788882
9143	84	80	0		2020-05-25 10:08:04.798524	2020-05-25 10:08:04.798524
9144	29	80	1		2020-05-25 10:08:04.811845	2020-05-25 10:08:04.811845
9145	12	80	4		2020-05-25 10:08:04.822341	2020-05-25 10:08:04.822341
9146	79	80	1		2020-05-25 10:08:04.832486	2020-05-25 10:08:04.832486
9147	82	80	4		2020-05-25 10:08:04.844496	2020-05-25 10:08:04.844496
9148	1	80	3		2020-05-25 10:08:04.855675	2020-05-25 10:08:04.855675
9149	3	80	2		2020-05-25 10:08:04.865338	2020-05-25 10:08:04.865338
9150	34	80	3		2020-05-25 10:08:04.877132	2020-05-25 10:08:04.877132
9151	35	80	4		2020-05-25 10:08:04.887566	2020-05-25 10:08:04.887566
9152	42	80	4		2020-05-25 10:08:04.897246	2020-05-25 10:08:04.897246
9153	15	80	3		2020-05-25 10:08:04.911285	2020-05-25 10:08:04.911285
9154	51	80	4		2020-05-25 10:08:04.922158	2020-05-25 10:08:04.922158
9155	74	80	3		2020-05-25 10:08:04.935326	2020-05-25 10:08:04.935326
9156	96	80	3		2020-05-25 10:08:04.947864	2020-05-25 10:08:04.947864
9157	63	80	4		2020-05-25 10:08:04.959898	2020-05-25 10:08:04.959898
9158	21	80	0		2020-05-25 10:08:04.974114	2020-05-25 10:08:04.974114
9159	47	80	2		2020-05-25 10:08:04.983503	2020-05-25 10:08:04.983503
9160	57	80	2		2020-05-25 10:08:04.995237	2020-05-25 10:08:04.995237
9161	22	80	4		2020-05-25 10:08:05.005688	2020-05-25 10:08:05.005688
9162	14	80	5		2020-05-25 10:08:05.016083	2020-05-25 10:08:05.016083
9163	65	80	2		2020-05-25 10:08:05.029509	2020-05-25 10:08:05.029509
9164	7	80	2		2020-05-25 10:08:05.039897	2020-05-25 10:08:05.039897
9165	88	80	0		2020-05-25 10:08:05.049871	2020-05-25 10:08:05.049871
9166	49	80	1		2020-05-25 10:08:05.061693	2020-05-25 10:08:05.061693
9167	28	80	1		2020-05-25 10:08:05.07273	2020-05-25 10:08:05.07273
9168	43	80	3		2020-05-25 10:08:05.083414	2020-05-25 10:08:05.083414
9169	11	80	2		2020-05-25 10:08:05.094346	2020-05-25 10:08:05.094346
9170	77	80	0		2020-05-25 10:08:05.105167	2020-05-25 10:08:05.105167
9171	40	80	4		2020-05-25 10:08:05.115087	2020-05-25 10:08:05.115087
9172	90	80	2		2020-05-25 10:08:05.128095	2020-05-25 10:08:05.128095
9173	71	80	2		2020-05-25 10:08:05.13879	2020-05-25 10:08:05.13879
9174	39	80	4		2020-05-25 10:08:05.148975	2020-05-25 10:08:05.148975
9175	58	80	5		2020-05-25 10:08:05.163698	2020-05-25 10:08:05.163698
9176	0	80	4		2020-05-25 10:08:05.179157	2020-05-25 10:08:05.179157
9177	93	80	0		2020-05-25 10:08:05.190063	2020-05-25 10:08:05.190063
9178	97	80	2		2020-05-25 10:08:05.200121	2020-05-25 10:08:05.200121
9179	36	80	2		2020-05-25 10:08:05.213367	2020-05-25 10:08:05.213367
9180	75	80	2		2020-05-25 10:08:05.224029	2020-05-25 10:08:05.224029
9181	41	80	4		2020-05-25 10:08:05.236639	2020-05-25 10:08:05.236639
9182	54	80	1		2020-05-25 10:08:05.253857	2020-05-25 10:08:05.253857
9183	72	80	2		2020-05-25 10:08:05.270862	2020-05-25 10:08:05.270862
9184	99	80	0		2020-05-25 10:08:05.284173	2020-05-25 10:08:05.284173
9185	19	80	2		2020-05-25 10:08:05.296006	2020-05-25 10:08:05.296006
9186	83	80	0		2020-05-25 10:08:05.304534	2020-05-25 10:08:05.304534
9187	85	80	2		2020-05-25 10:08:05.31842	2020-05-25 10:08:05.31842
9188	33	80	3		2020-05-25 10:08:05.331173	2020-05-25 10:08:05.331173
9189	25	80	4		2020-05-25 10:08:05.341248	2020-05-25 10:08:05.341248
9190	80	80	2		2020-05-25 10:08:05.353892	2020-05-25 10:08:05.353892
9191	62	80	4		2020-05-25 10:08:05.37034	2020-05-25 10:08:05.37034
9192	76	80	0		2020-05-25 10:08:05.382579	2020-05-25 10:08:05.382579
9193	86	80	1		2020-05-25 10:08:05.420092	2020-05-25 10:08:05.420092
9194	50	80	3		2020-05-25 10:08:05.431578	2020-05-25 10:08:05.431578
9195	32	80	4		2020-05-25 10:08:05.445232	2020-05-25 10:08:05.445232
9196	16	80	2		2020-05-25 10:08:05.456865	2020-05-25 10:08:05.456865
9197	30	80	4		2020-05-25 10:08:05.469951	2020-05-25 10:08:05.469951
9198	89	80	5		2020-05-25 10:08:05.483528	2020-05-25 10:08:05.483528
9199	68	80	1		2020-05-25 10:08:05.497241	2020-05-25 10:08:05.497241
9200	60	80	2		2020-05-25 10:08:05.510452	2020-05-25 10:08:05.510452
9201	98	80	1		2020-05-25 10:08:05.522907	2020-05-25 10:08:05.522907
9202	9	80	4		2020-05-25 10:08:05.536048	2020-05-25 10:08:05.536048
9203	23	80	4		2020-05-25 10:08:05.55006	2020-05-25 10:08:05.55006
9204	6	80	5		2020-05-25 10:08:05.557952	2020-05-25 10:08:05.557952
9205	56	80	2		2020-05-25 10:08:05.563573	2020-05-25 10:08:05.563573
9206	69	80	4		2020-05-25 10:08:05.57782	2020-05-25 10:08:05.57782
9207	66	80	0		2020-05-25 10:08:05.585559	2020-05-25 10:08:05.585559
9208	95	80	0		2020-05-25 10:08:05.594209	2020-05-25 10:08:05.594209
9209	45	80	4		2020-05-25 10:08:05.604543	2020-05-25 10:08:05.604543
9210	73	80	1		2020-05-25 10:08:05.613732	2020-05-25 10:08:05.613732
9211	48	80	1		2020-05-25 10:08:05.625103	2020-05-25 10:08:05.625103
9212	26	80	1		2020-05-25 10:08:05.63083	2020-05-25 10:08:05.63083
9213	10	80	4		2020-05-25 10:08:05.643061	2020-05-25 10:08:05.643061
9214	78	80	0		2020-05-25 10:08:05.652971	2020-05-25 10:08:05.652971
9215	87	80	0		2020-05-25 10:08:05.6618	2020-05-25 10:08:05.6618
9216	67	80	3		2020-05-25 10:08:05.671828	2020-05-25 10:08:05.671828
9217	46	80	0		2020-05-25 10:08:05.68163	2020-05-25 10:08:05.68163
9218	92	81	2		2020-05-25 10:08:05.693179	2020-05-25 10:08:05.693179
9219	51	81	3		2020-05-25 10:08:05.703184	2020-05-25 10:08:05.703184
9220	38	81	4		2020-05-25 10:08:05.712767	2020-05-25 10:08:05.712767
9221	24	81	4		2020-05-25 10:08:05.727093	2020-05-25 10:08:05.727093
9222	28	81	0		2020-05-25 10:08:05.737742	2020-05-25 10:08:05.737742
9223	19	81	1		2020-05-25 10:08:05.746724	2020-05-25 10:08:05.746724
9224	60	81	1		2020-05-25 10:08:05.760505	2020-05-25 10:08:05.760505
9225	70	81	4		2020-05-25 10:08:05.771266	2020-05-25 10:08:05.771266
9226	56	81	0		2020-05-25 10:08:05.780566	2020-05-25 10:08:05.780566
9227	64	81	1		2020-05-25 10:08:05.793921	2020-05-25 10:08:05.793921
9228	13	81	2		2020-05-25 10:08:05.804286	2020-05-25 10:08:05.804286
9229	26	81	1		2020-05-25 10:08:05.813397	2020-05-25 10:08:05.813397
9230	4	81	0		2020-05-25 10:08:05.827832	2020-05-25 10:08:05.827832
9231	45	81	3		2020-05-25 10:08:05.838457	2020-05-25 10:08:05.838457
9232	22	81	1		2020-05-25 10:08:05.848142	2020-05-25 10:08:05.848142
9233	53	81	4		2020-05-25 10:08:05.861643	2020-05-25 10:08:05.861643
9234	82	81	4		2020-05-25 10:08:05.871828	2020-05-25 10:08:05.871828
9235	49	81	2		2020-05-25 10:08:05.881691	2020-05-25 10:08:05.881691
9236	99	81	2		2020-05-25 10:08:05.894666	2020-05-25 10:08:05.894666
9237	42	81	1		2020-05-25 10:08:05.905081	2020-05-25 10:08:05.905081
9238	62	81	3		2020-05-25 10:08:05.914647	2020-05-25 10:08:05.914647
9239	84	82	0		2020-05-25 10:08:05.9275	2020-05-25 10:08:05.9275
9240	1	82	3		2020-05-25 10:08:05.938104	2020-05-25 10:08:05.938104
9241	78	82	4		2020-05-25 10:08:05.947324	2020-05-25 10:08:05.947324
9242	13	82	0		2020-05-25 10:08:05.95964	2020-05-25 10:08:05.95964
9243	33	82	4		2020-05-25 10:08:05.965346	2020-05-25 10:08:05.965346
9244	55	82	2		2020-05-25 10:08:05.978512	2020-05-25 10:08:05.978512
9245	30	82	2		2020-05-25 10:08:05.987008	2020-05-25 10:08:05.987008
9246	54	82	3		2020-05-25 10:08:05.996297	2020-05-25 10:08:05.996297
9247	85	82	2		2020-05-25 10:08:06.010964	2020-05-25 10:08:06.010964
9248	75	82	3		2020-05-25 10:08:06.022384	2020-05-25 10:08:06.022384
9249	8	82	3		2020-05-25 10:08:06.032005	2020-05-25 10:08:06.032005
9250	96	82	2		2020-05-25 10:08:06.045392	2020-05-25 10:08:06.045392
9251	0	82	1		2020-05-25 10:08:06.055961	2020-05-25 10:08:06.055961
9252	62	82	2		2020-05-25 10:08:06.066049	2020-05-25 10:08:06.066049
9253	3	82	1		2020-05-25 10:08:06.078983	2020-05-25 10:08:06.078983
9254	28	82	2		2020-05-25 10:08:06.089455	2020-05-25 10:08:06.089455
9255	69	82	2		2020-05-25 10:08:06.098759	2020-05-25 10:08:06.098759
9256	47	82	3		2020-05-25 10:08:06.110886	2020-05-25 10:08:06.110886
9257	86	82	0		2020-05-25 10:08:06.121552	2020-05-25 10:08:06.121552
9258	81	82	1		2020-05-25 10:08:06.131137	2020-05-25 10:08:06.131137
9259	89	82	1		2020-05-25 10:08:06.144666	2020-05-25 10:08:06.144666
9260	32	82	2		2020-05-25 10:08:06.155722	2020-05-25 10:08:06.155722
9261	83	82	3		2020-05-25 10:08:06.165746	2020-05-25 10:08:06.165746
9262	7	82	1		2020-05-25 10:08:06.178335	2020-05-25 10:08:06.178335
9263	66	82	4		2020-05-25 10:08:06.188863	2020-05-25 10:08:06.188863
9264	80	82	1		2020-05-25 10:08:06.19848	2020-05-25 10:08:06.19848
9265	97	82	1		2020-05-25 10:08:06.211789	2020-05-25 10:08:06.211789
9266	99	82	4		2020-05-25 10:08:06.222425	2020-05-25 10:08:06.222425
9267	11	82	3		2020-05-25 10:08:06.2321	2020-05-25 10:08:06.2321
9268	19	82	4		2020-05-25 10:08:06.245631	2020-05-25 10:08:06.245631
9269	82	82	2		2020-05-25 10:08:06.255691	2020-05-25 10:08:06.255691
9270	49	82	4		2020-05-25 10:08:06.265073	2020-05-25 10:08:06.265073
9271	17	82	4		2020-05-25 10:08:06.278707	2020-05-25 10:08:06.278707
9272	2	82	3		2020-05-25 10:08:06.289592	2020-05-25 10:08:06.289592
9273	56	82	0		2020-05-25 10:08:06.299946	2020-05-25 10:08:06.299946
9274	73	82	4		2020-05-25 10:08:06.312258	2020-05-25 10:08:06.312258
9275	91	82	0		2020-05-25 10:08:06.323448	2020-05-25 10:08:06.323448
9276	26	82	4		2020-05-25 10:08:06.334037	2020-05-25 10:08:06.334037
9277	76	82	2		2020-05-25 10:08:06.346362	2020-05-25 10:08:06.346362
9278	64	82	1		2020-05-25 10:08:06.356462	2020-05-25 10:08:06.356462
9279	57	82	0		2020-05-25 10:08:06.366172	2020-05-25 10:08:06.366172
9280	88	82	3		2020-05-25 10:08:06.379514	2020-05-25 10:08:06.379514
9281	14	82	1		2020-05-25 10:08:06.389948	2020-05-25 10:08:06.389948
9282	46	82	0		2020-05-25 10:08:06.401064	2020-05-25 10:08:06.401064
9283	9	82	2		2020-05-25 10:08:06.411971	2020-05-25 10:08:06.411971
9284	41	82	1		2020-05-25 10:08:06.422955	2020-05-25 10:08:06.422955
9285	59	82	1		2020-05-25 10:08:06.434434	2020-05-25 10:08:06.434434
9286	34	82	4		2020-05-25 10:08:06.446495	2020-05-25 10:08:06.446495
9287	23	82	1		2020-05-25 10:08:06.457071	2020-05-25 10:08:06.457071
9288	42	82	1		2020-05-25 10:08:06.469431	2020-05-25 10:08:06.469431
9289	67	82	3		2020-05-25 10:08:06.484287	2020-05-25 10:08:06.484287
9290	50	82	1		2020-05-25 10:08:06.496489	2020-05-25 10:08:06.496489
9291	95	82	3		2020-05-25 10:08:06.507756	2020-05-25 10:08:06.507756
9292	74	82	2		2020-05-25 10:08:06.519694	2020-05-25 10:08:06.519694
9293	68	82	3		2020-05-25 10:08:06.532334	2020-05-25 10:08:06.532334
9294	77	82	2		2020-05-25 10:08:06.545398	2020-05-25 10:08:06.545398
9295	71	82	5		2020-05-25 10:08:06.556103	2020-05-25 10:08:06.556103
9296	60	82	2		2020-05-25 10:08:06.565864	2020-05-25 10:08:06.565864
9297	4	82	2		2020-05-25 10:08:06.57751	2020-05-25 10:08:06.57751
9298	25	82	0		2020-05-25 10:08:06.588184	2020-05-25 10:08:06.588184
9299	6	82	3		2020-05-25 10:08:06.59788	2020-05-25 10:08:06.59788
9300	45	82	4		2020-05-25 10:08:06.61074	2020-05-25 10:08:06.61074
9301	40	82	0		2020-05-25 10:08:06.621721	2020-05-25 10:08:06.621721
9302	61	82	2		2020-05-25 10:08:06.631537	2020-05-25 10:08:06.631537
9303	27	82	4		2020-05-25 10:08:06.646075	2020-05-25 10:08:06.646075
9304	10	82	3		2020-05-25 10:08:06.656802	2020-05-25 10:08:06.656802
9305	98	82	4		2020-05-25 10:08:06.668442	2020-05-25 10:08:06.668442
9306	5	82	2		2020-05-25 10:08:06.679941	2020-05-25 10:08:06.679941
9307	52	82	3		2020-05-25 10:08:06.690384	2020-05-25 10:08:06.690384
9308	44	82	5		2020-05-25 10:08:06.700088	2020-05-25 10:08:06.700088
9309	12	82	2		2020-05-25 10:08:06.7118	2020-05-25 10:08:06.7118
9310	48	82	5		2020-05-25 10:08:06.722291	2020-05-25 10:08:06.722291
9311	92	82	1		2020-05-25 10:08:06.731672	2020-05-25 10:08:06.731672
9312	93	82	3		2020-05-25 10:08:06.743705	2020-05-25 10:08:06.743705
9313	29	82	0		2020-05-25 10:08:06.754451	2020-05-25 10:08:06.754451
9314	94	82	2		2020-05-25 10:08:06.76365	2020-05-25 10:08:06.76365
9315	72	82	2		2020-05-25 10:08:06.777007	2020-05-25 10:08:06.777007
9316	18	82	4		2020-05-25 10:08:06.78795	2020-05-25 10:08:06.78795
9317	35	82	3		2020-05-25 10:08:06.797243	2020-05-25 10:08:06.797243
9318	90	82	2		2020-05-25 10:08:06.810989	2020-05-25 10:08:06.810989
9319	36	82	1		2020-05-25 10:08:06.821343	2020-05-25 10:08:06.821343
9320	39	82	5		2020-05-25 10:08:06.831063	2020-05-25 10:08:06.831063
9321	70	82	2		2020-05-25 10:08:06.843723	2020-05-25 10:08:06.843723
9322	65	82	1		2020-05-25 10:08:06.854045	2020-05-25 10:08:06.854045
9323	22	82	1		2020-05-25 10:08:06.863088	2020-05-25 10:08:06.863088
9324	51	82	1		2020-05-25 10:08:06.876746	2020-05-25 10:08:06.876746
9325	58	82	2		2020-05-25 10:08:06.887044	2020-05-25 10:08:06.887044
9326	63	82	3		2020-05-25 10:08:06.896407	2020-05-25 10:08:06.896407
9327	21	82	2		2020-05-25 10:08:06.909533	2020-05-25 10:08:06.909533
9328	38	82	1		2020-05-25 10:08:06.919246	2020-05-25 10:08:06.919246
9329	20	82	4		2020-05-25 10:08:06.928049	2020-05-25 10:08:06.928049
9330	53	82	1		2020-05-25 10:08:06.938315	2020-05-25 10:08:06.938315
9331	37	82	4		2020-05-25 10:08:06.947532	2020-05-25 10:08:06.947532
9332	87	82	3		2020-05-25 10:08:06.95832	2020-05-25 10:08:06.95832
9333	43	82	4		2020-05-25 10:08:06.963974	2020-05-25 10:08:06.963974
9334	31	82	2		2020-05-25 10:08:06.977104	2020-05-25 10:08:06.977104
9335	44	83	4		2020-05-25 10:08:06.987665	2020-05-25 10:08:06.987665
9336	62	83	0		2020-05-25 10:08:06.997382	2020-05-25 10:08:06.997382
9337	23	83	5		2020-05-25 10:08:07.009449	2020-05-25 10:08:07.009449
9338	88	83	1		2020-05-25 10:08:07.016423	2020-05-25 10:08:07.016423
9339	93	83	2		2020-05-25 10:08:07.02875	2020-05-25 10:08:07.02875
9340	51	83	1		2020-05-25 10:08:07.043691	2020-05-25 10:08:07.043691
9341	99	83	1		2020-05-25 10:08:07.053537	2020-05-25 10:08:07.053537
9342	76	83	3		2020-05-25 10:08:07.062386	2020-05-25 10:08:07.062386
9343	84	83	1		2020-05-25 10:08:07.074888	2020-05-25 10:08:07.074888
9344	50	83	2		2020-05-25 10:08:07.082352	2020-05-25 10:08:07.082352
9345	77	83	2		2020-05-25 10:08:07.094355	2020-05-25 10:08:07.094355
9346	86	83	3		2020-05-25 10:08:07.102498	2020-05-25 10:08:07.102498
9347	66	83	3		2020-05-25 10:08:07.134615	2020-05-25 10:08:07.134615
9348	26	83	3		2020-05-25 10:08:07.142384	2020-05-25 10:08:07.142384
9349	20	83	3		2020-05-25 10:08:07.153192	2020-05-25 10:08:07.153192
9350	30	83	0		2020-05-25 10:08:07.158793	2020-05-25 10:08:07.158793
9351	40	83	3		2020-05-25 10:08:07.164262	2020-05-25 10:08:07.164262
9352	7	83	3		2020-05-25 10:08:07.175274	2020-05-25 10:08:07.175274
9353	42	83	2		2020-05-25 10:08:07.181142	2020-05-25 10:08:07.181142
9354	73	83	0		2020-05-25 10:08:07.191839	2020-05-25 10:08:07.191839
9355	41	83	2		2020-05-25 10:08:07.19762	2020-05-25 10:08:07.19762
9356	98	83	2		2020-05-25 10:08:07.210429	2020-05-25 10:08:07.210429
9357	94	83	1		2020-05-25 10:08:07.219853	2020-05-25 10:08:07.219853
9358	17	83	4		2020-05-25 10:08:07.229904	2020-05-25 10:08:07.229904
9359	96	83	4		2020-05-25 10:08:07.23779	2020-05-25 10:08:07.23779
9360	48	83	5		2020-05-25 10:08:07.24606	2020-05-25 10:08:07.24606
9361	78	83	1		2020-05-25 10:08:07.25767	2020-05-25 10:08:07.25767
9362	87	83	4		2020-05-25 10:08:07.264412	2020-05-25 10:08:07.264412
9363	68	83	4		2020-05-25 10:08:07.276546	2020-05-25 10:08:07.276546
9364	29	83	3		2020-05-25 10:08:07.285218	2020-05-25 10:08:07.285218
9365	32	83	4		2020-05-25 10:08:07.295446	2020-05-25 10:08:07.295446
9366	60	83	4		2020-05-25 10:08:07.302459	2020-05-25 10:08:07.302459
9367	12	83	4		2020-05-25 10:08:07.310672	2020-05-25 10:08:07.310672
9368	31	83	1		2020-05-25 10:08:07.320169	2020-05-25 10:08:07.320169
9369	9	83	4		2020-05-25 10:08:07.328866	2020-05-25 10:08:07.328866
9370	21	83	4		2020-05-25 10:08:07.339377	2020-05-25 10:08:07.339377
9371	39	83	0		2020-05-25 10:08:07.344813	2020-05-25 10:08:07.344813
9372	35	83	3		2020-05-25 10:08:07.353297	2020-05-25 10:08:07.353297
9373	14	83	3		2020-05-25 10:08:07.361671	2020-05-25 10:08:07.361671
9374	34	83	5		2020-05-25 10:08:07.371498	2020-05-25 10:08:07.371498
9375	18	83	2		2020-05-25 10:08:07.379792	2020-05-25 10:08:07.379792
9376	1	83	1		2020-05-25 10:08:07.389418	2020-05-25 10:08:07.389418
9377	58	83	5		2020-05-25 10:08:07.398584	2020-05-25 10:08:07.398584
9378	47	83	3		2020-05-25 10:08:07.408692	2020-05-25 10:08:07.408692
9379	71	83	1		2020-05-25 10:08:07.415132	2020-05-25 10:08:07.415132
9380	45	83	1		2020-05-25 10:08:07.42698	2020-05-25 10:08:07.42698
9381	54	83	3		2020-05-25 10:08:07.435821	2020-05-25 10:08:07.435821
9382	8	83	0		2020-05-25 10:08:07.445497	2020-05-25 10:08:07.445497
9383	89	83	1		2020-05-25 10:08:07.450516	2020-05-25 10:08:07.450516
9384	80	83	1		2020-05-25 10:08:07.460944	2020-05-25 10:08:07.460944
9385	59	83	1		2020-05-25 10:08:07.469883	2020-05-25 10:08:07.469883
9386	37	83	0		2020-05-25 10:08:07.478941	2020-05-25 10:08:07.478941
9387	6	83	3		2020-05-25 10:08:07.486866	2020-05-25 10:08:07.486866
9388	67	83	2		2020-05-25 10:08:07.49506	2020-05-25 10:08:07.49506
9389	63	83	0		2020-05-25 10:08:07.505482	2020-05-25 10:08:07.505482
9390	28	83	0		2020-05-25 10:08:07.513857	2020-05-25 10:08:07.513857
9391	46	83	4		2020-05-25 10:08:07.523037	2020-05-25 10:08:07.523037
9392	53	83	4		2020-05-25 10:08:07.529935	2020-05-25 10:08:07.529935
9393	0	83	1		2020-05-25 10:08:07.540989	2020-05-25 10:08:07.540989
9394	24	83	1		2020-05-25 10:08:07.547953	2020-05-25 10:08:07.547953
9395	36	83	2		2020-05-25 10:08:07.559506	2020-05-25 10:08:07.559506
9396	83	83	2		2020-05-25 10:08:07.570424	2020-05-25 10:08:07.570424
9397	3	83	2		2020-05-25 10:08:07.5789	2020-05-25 10:08:07.5789
9398	19	83	4		2020-05-25 10:08:07.587888	2020-05-25 10:08:07.587888
9399	85	83	3		2020-05-25 10:08:07.597455	2020-05-25 10:08:07.597455
9400	43	83	1		2020-05-25 10:08:07.607092	2020-05-25 10:08:07.607092
9401	11	83	3		2020-05-25 10:08:07.612976	2020-05-25 10:08:07.612976
9402	90	83	1		2020-05-25 10:08:07.623897	2020-05-25 10:08:07.623897
9403	2	83	3		2020-05-25 10:08:07.632226	2020-05-25 10:08:07.632226
9404	52	83	4		2020-05-25 10:08:07.643693	2020-05-25 10:08:07.643693
9405	5	83	3		2020-05-25 10:08:07.652706	2020-05-25 10:08:07.652706
9406	57	83	4		2020-05-25 10:08:07.661004	2020-05-25 10:08:07.661004
9407	91	83	2		2020-05-25 10:08:07.669842	2020-05-25 10:08:07.669842
9408	97	83	3		2020-05-25 10:08:07.67806	2020-05-25 10:08:07.67806
9409	13	83	1		2020-05-25 10:08:07.686352	2020-05-25 10:08:07.686352
9410	16	83	4		2020-05-25 10:08:07.694622	2020-05-25 10:08:07.694622
9411	15	83	5		2020-05-25 10:08:07.702877	2020-05-25 10:08:07.702877
9412	81	83	2		2020-05-25 10:08:07.711146	2020-05-25 10:08:07.711146
9413	64	83	4		2020-05-25 10:08:07.720951	2020-05-25 10:08:07.720951
9414	69	83	4		2020-05-25 10:08:07.730581	2020-05-25 10:08:07.730581
9415	4	83	0		2020-05-25 10:08:07.739217	2020-05-25 10:08:07.739217
9416	92	83	2		2020-05-25 10:08:07.746192	2020-05-25 10:08:07.746192
9417	10	84	5		2020-05-25 10:08:07.753792	2020-05-25 10:08:07.753792
9418	58	84	3		2020-05-25 10:08:07.762517	2020-05-25 10:08:07.762517
9419	31	84	3		2020-05-25 10:08:07.770679	2020-05-25 10:08:07.770679
9420	86	84	4		2020-05-25 10:08:07.778776	2020-05-25 10:08:07.778776
9421	57	84	4		2020-05-25 10:08:07.788172	2020-05-25 10:08:07.788172
9422	11	84	1		2020-05-25 10:08:07.797446	2020-05-25 10:08:07.797446
9423	90	84	4		2020-05-25 10:08:07.804391	2020-05-25 10:08:07.804391
9424	72	84	3		2020-05-25 10:08:07.812452	2020-05-25 10:08:07.812452
9425	69	84	2		2020-05-25 10:08:07.821199	2020-05-25 10:08:07.821199
9426	98	84	3		2020-05-25 10:08:07.827958	2020-05-25 10:08:07.827958
9427	28	84	3		2020-05-25 10:08:07.837702	2020-05-25 10:08:07.837702
9428	75	84	4		2020-05-25 10:08:07.845864	2020-05-25 10:08:07.845864
9429	81	84	5		2020-05-25 10:08:07.852675	2020-05-25 10:08:07.852675
9430	34	84	1		2020-05-25 10:08:07.858983	2020-05-25 10:08:07.858983
9431	62	84	3		2020-05-25 10:08:07.867461	2020-05-25 10:08:07.867461
9432	9	84	2		2020-05-25 10:08:07.877343	2020-05-25 10:08:07.877343
9433	99	84	0		2020-05-25 10:08:07.8858	2020-05-25 10:08:07.8858
9434	83	84	4		2020-05-25 10:08:07.891928	2020-05-25 10:08:07.891928
9435	95	84	0		2020-05-25 10:08:07.899627	2020-05-25 10:08:07.899627
9436	38	84	4		2020-05-25 10:08:07.909565	2020-05-25 10:08:07.909565
9437	85	84	4		2020-05-25 10:08:07.914555	2020-05-25 10:08:07.914555
9438	56	84	2		2020-05-25 10:08:07.923967	2020-05-25 10:08:07.923967
9439	6	84	0		2020-05-25 10:08:07.931442	2020-05-25 10:08:07.931442
9440	51	84	1		2020-05-25 10:08:07.937643	2020-05-25 10:08:07.937643
9441	70	84	1		2020-05-25 10:08:07.944923	2020-05-25 10:08:07.944923
9442	60	84	0		2020-05-25 10:08:07.953632	2020-05-25 10:08:07.953632
9443	52	84	5		2020-05-25 10:08:07.961897	2020-05-25 10:08:07.961897
9444	25	84	0		2020-05-25 10:08:07.970216	2020-05-25 10:08:07.970216
9445	73	84	2		2020-05-25 10:08:07.976282	2020-05-25 10:08:07.976282
9446	13	84	0		2020-05-25 10:08:07.98342	2020-05-25 10:08:07.98342
9447	92	84	2		2020-05-25 10:08:07.993442	2020-05-25 10:08:07.993442
9448	71	84	1		2020-05-25 10:08:08.003506	2020-05-25 10:08:08.003506
9449	39	84	1		2020-05-25 10:08:08.010306	2020-05-25 10:08:08.010306
9450	74	84	2		2020-05-25 10:08:08.019342	2020-05-25 10:08:08.019342
9451	54	84	2		2020-05-25 10:08:08.027593	2020-05-25 10:08:08.027593
9452	67	84	1		2020-05-25 10:08:08.034531	2020-05-25 10:08:08.034531
9453	91	84	2		2020-05-25 10:08:08.04066	2020-05-25 10:08:08.04066
9454	53	84	3		2020-05-25 10:08:08.048238	2020-05-25 10:08:08.048238
9455	96	84	1		2020-05-25 10:08:08.059095	2020-05-25 10:08:08.059095
9456	54	85	3		2020-05-25 10:08:08.068545	2020-05-25 10:08:08.068545
9457	89	85	5		2020-05-25 10:08:08.07484	2020-05-25 10:08:08.07484
9458	13	85	0		2020-05-25 10:08:08.081469	2020-05-25 10:08:08.081469
9459	14	85	0		2020-05-25 10:08:08.090394	2020-05-25 10:08:08.090394
9460	95	85	0		2020-05-25 10:08:08.098158	2020-05-25 10:08:08.098158
9461	99	85	1		2020-05-25 10:08:08.104202	2020-05-25 10:08:08.104202
9462	6	85	5		2020-05-25 10:08:08.111457	2020-05-25 10:08:08.111457
9463	27	85	3		2020-05-25 10:08:08.120334	2020-05-25 10:08:08.120334
9464	83	85	3		2020-05-25 10:08:08.127986	2020-05-25 10:08:08.127986
9465	72	85	0		2020-05-25 10:08:08.136021	2020-05-25 10:08:08.136021
9466	4	85	5		2020-05-25 10:08:08.141956	2020-05-25 10:08:08.141956
9467	47	85	1		2020-05-25 10:08:08.149338	2020-05-25 10:08:08.149338
9468	7	85	5		2020-05-25 10:08:08.159845	2020-05-25 10:08:08.159845
9469	0	85	2		2020-05-25 10:08:08.168773	2020-05-25 10:08:08.168773
9470	68	85	3		2020-05-25 10:08:08.174936	2020-05-25 10:08:08.174936
9471	70	85	2		2020-05-25 10:08:08.181995	2020-05-25 10:08:08.181995
9472	31	85	3		2020-05-25 10:08:08.192847	2020-05-25 10:08:08.192847
9473	86	85	4		2020-05-25 10:08:08.201992	2020-05-25 10:08:08.201992
9474	55	85	1		2020-05-25 10:08:08.207955	2020-05-25 10:08:08.207955
9475	48	85	1		2020-05-25 10:08:08.214735	2020-05-25 10:08:08.214735
9476	82	85	2		2020-05-25 10:08:08.225659	2020-05-25 10:08:08.225659
9477	17	85	0		2020-05-25 10:08:08.230292	2020-05-25 10:08:08.230292
9478	92	85	1		2020-05-25 10:08:08.240129	2020-05-25 10:08:08.240129
9479	19	85	4		2020-05-25 10:08:08.247101	2020-05-25 10:08:08.247101
9480	90	85	1		2020-05-25 10:08:08.25402	2020-05-25 10:08:08.25402
9481	18	85	0		2020-05-25 10:08:08.26039	2020-05-25 10:08:08.26039
9482	73	85	1		2020-05-25 10:08:08.269271	2020-05-25 10:08:08.269271
9483	76	85	3		2020-05-25 10:08:08.277157	2020-05-25 10:08:08.277157
9484	57	85	0		2020-05-25 10:08:08.285559	2020-05-25 10:08:08.285559
9485	43	85	0		2020-05-25 10:08:08.291876	2020-05-25 10:08:08.291876
9486	75	85	0		2020-05-25 10:08:08.29862	2020-05-25 10:08:08.29862
9487	16	85	1		2020-05-25 10:08:08.308304	2020-05-25 10:08:08.308304
9488	25	85	3		2020-05-25 10:08:08.312839	2020-05-25 10:08:08.312839
9489	61	85	4		2020-05-25 10:08:08.323222	2020-05-25 10:08:08.323222
9490	80	85	0		2020-05-25 10:08:08.330716	2020-05-25 10:08:08.330716
9491	63	85	3		2020-05-25 10:08:08.338026	2020-05-25 10:08:08.338026
9492	79	85	1		2020-05-25 10:08:08.34412	2020-05-25 10:08:08.34412
9493	93	85	0		2020-05-25 10:08:08.35251	2020-05-25 10:08:08.35251
9494	10	85	2		2020-05-25 10:08:08.360342	2020-05-25 10:08:08.360342
9495	49	85	3		2020-05-25 10:08:08.36885	2020-05-25 10:08:08.36885
9496	98	85	1		2020-05-25 10:08:08.375211	2020-05-25 10:08:08.375211
9497	30	85	4		2020-05-25 10:08:08.381749	2020-05-25 10:08:08.381749
9498	22	85	2		2020-05-25 10:08:08.390618	2020-05-25 10:08:08.390618
9499	11	85	4		2020-05-25 10:08:08.398178	2020-05-25 10:08:08.398178
9500	51	85	2		2020-05-25 10:08:08.404412	2020-05-25 10:08:08.404412
9501	56	85	3		2020-05-25 10:08:08.431966	2020-05-25 10:08:08.431966
9502	35	85	4		2020-05-25 10:08:08.440291	2020-05-25 10:08:08.440291
9503	96	85	1		2020-05-25 10:08:08.448657	2020-05-25 10:08:08.448657
9504	69	85	2		2020-05-25 10:08:08.454786	2020-05-25 10:08:08.454786
9505	39	85	2		2020-05-25 10:08:08.46151	2020-05-25 10:08:08.46151
9506	60	85	0		2020-05-25 10:08:08.470247	2020-05-25 10:08:08.470247
9507	42	85	0		2020-05-25 10:08:08.478406	2020-05-25 10:08:08.478406
9508	50	85	3		2020-05-25 10:08:08.4856	2020-05-25 10:08:08.4856
9509	78	85	5		2020-05-25 10:08:08.491682	2020-05-25 10:08:08.491682
9510	29	85	3		2020-05-25 10:08:08.499784	2020-05-25 10:08:08.499784
9511	77	85	0		2020-05-25 10:08:08.511698	2020-05-25 10:08:08.511698
9512	64	85	3		2020-05-25 10:08:08.51993	2020-05-25 10:08:08.51993
9513	36	85	0		2020-05-25 10:08:08.526161	2020-05-25 10:08:08.526161
9514	2	86	0		2020-05-25 10:08:08.536047	2020-05-25 10:08:08.536047
9515	55	86	4		2020-05-25 10:08:08.544123	2020-05-25 10:08:08.544123
9516	89	86	0		2020-05-25 10:08:08.552154	2020-05-25 10:08:08.552154
9517	79	86	1		2020-05-25 10:08:08.558658	2020-05-25 10:08:08.558658
9518	18	86	4		2020-05-25 10:08:08.565097	2020-05-25 10:08:08.565097
9519	83	86	0		2020-05-25 10:08:08.575185	2020-05-25 10:08:08.575185
9520	15	86	5		2020-05-25 10:08:08.580168	2020-05-25 10:08:08.580168
9521	60	86	3		2020-05-25 10:08:08.589398	2020-05-25 10:08:08.589398
9522	3	86	5		2020-05-25 10:08:08.597082	2020-05-25 10:08:08.597082
9523	82	86	3		2020-05-25 10:08:08.605169	2020-05-25 10:08:08.605169
9524	44	86	5		2020-05-25 10:08:08.612208	2020-05-25 10:08:08.612208
9525	73	86	2		2020-05-25 10:08:08.619199	2020-05-25 10:08:08.619199
9526	53	86	0		2020-05-25 10:08:08.627254	2020-05-25 10:08:08.627254
9527	34	86	4		2020-05-25 10:08:08.635907	2020-05-25 10:08:08.635907
9528	98	86	0		2020-05-25 10:08:08.643321	2020-05-25 10:08:08.643321
9529	21	86	3		2020-05-25 10:08:08.648978	2020-05-25 10:08:08.648978
9530	30	86	2		2020-05-25 10:08:08.659955	2020-05-25 10:08:08.659955
9531	23	86	2		2020-05-25 10:08:08.668972	2020-05-25 10:08:08.668972
9532	63	86	4		2020-05-25 10:08:08.675482	2020-05-25 10:08:08.675482
9533	49	86	1		2020-05-25 10:08:08.681882	2020-05-25 10:08:08.681882
9534	56	86	0		2020-05-25 10:08:08.691948	2020-05-25 10:08:08.691948
9535	70	86	3		2020-05-25 10:08:08.696187	2020-05-25 10:08:08.696187
9536	6	86	2		2020-05-25 10:08:08.706252	2020-05-25 10:08:08.706252
9537	85	86	0		2020-05-25 10:08:08.713283	2020-05-25 10:08:08.713283
9538	17	86	3		2020-05-25 10:08:08.721821	2020-05-25 10:08:08.721821
9539	51	86	3		2020-05-25 10:08:08.73011	2020-05-25 10:08:08.73011
9540	90	86	2		2020-05-25 10:08:08.737991	2020-05-25 10:08:08.737991
9541	42	86	4		2020-05-25 10:08:08.745067	2020-05-25 10:08:08.745067
9542	38	86	5		2020-05-25 10:08:08.754132	2020-05-25 10:08:08.754132
9543	35	86	2		2020-05-25 10:08:08.762075	2020-05-25 10:08:08.762075
9544	77	86	0		2020-05-25 10:08:08.768494	2020-05-25 10:08:08.768494
9545	66	86	4		2020-05-25 10:08:08.77643	2020-05-25 10:08:08.77643
9546	76	86	4		2020-05-25 10:08:08.785579	2020-05-25 10:08:08.785579
9547	64	86	0		2020-05-25 10:08:08.792702	2020-05-25 10:08:08.792702
9548	39	86	5		2020-05-25 10:08:08.802241	2020-05-25 10:08:08.802241
9549	81	86	1		2020-05-25 10:08:08.808209	2020-05-25 10:08:08.808209
9550	61	86	5		2020-05-25 10:08:08.815834	2020-05-25 10:08:08.815834
9551	10	86	5		2020-05-25 10:08:08.825817	2020-05-25 10:08:08.825817
9552	4	86	4		2020-05-25 10:08:08.830622	2020-05-25 10:08:08.830622
9553	72	86	5		2020-05-25 10:08:08.839692	2020-05-25 10:08:08.839692
9554	27	86	4		2020-05-25 10:08:08.847249	2020-05-25 10:08:08.847249
9555	54	86	2		2020-05-25 10:08:08.853266	2020-05-25 10:08:08.853266
9556	88	86	5		2020-05-25 10:08:08.860483	2020-05-25 10:08:08.860483
9557	57	86	1		2020-05-25 10:08:08.869609	2020-05-25 10:08:08.869609
9558	95	86	3		2020-05-25 10:08:08.87766	2020-05-25 10:08:08.87766
9559	75	86	0		2020-05-25 10:08:08.885817	2020-05-25 10:08:08.885817
9560	71	86	3		2020-05-25 10:08:08.891555	2020-05-25 10:08:08.891555
9561	47	86	3		2020-05-25 10:08:08.899075	2020-05-25 10:08:08.899075
9562	80	86	3		2020-05-25 10:08:08.909213	2020-05-25 10:08:08.909213
9563	14	86	4		2020-05-25 10:08:08.918456	2020-05-25 10:08:08.918456
9564	69	86	0		2020-05-25 10:08:08.924837	2020-05-25 10:08:08.924837
9565	13	86	1		2020-05-25 10:08:08.931292	2020-05-25 10:08:08.931292
9566	50	86	3		2020-05-25 10:08:08.939995	2020-05-25 10:08:08.939995
9567	99	86	2		2020-05-25 10:08:08.948283	2020-05-25 10:08:08.948283
9568	45	86	0		2020-05-25 10:08:08.95543	2020-05-25 10:08:08.95543
9569	0	86	1		2020-05-25 10:08:08.962744	2020-05-25 10:08:08.962744
9570	68	86	1		2020-05-25 10:08:08.970887	2020-05-25 10:08:08.970887
9571	93	86	2		2020-05-25 10:08:08.978041	2020-05-25 10:08:08.978041
9572	71	87	3		2020-05-25 10:08:08.985772	2020-05-25 10:08:08.985772
9573	79	87	2		2020-05-25 10:08:08.993685	2020-05-25 10:08:08.993685
9574	29	87	1		2020-05-25 10:08:09.003304	2020-05-25 10:08:09.003304
9575	8	87	5		2020-05-25 10:08:09.012053	2020-05-25 10:08:09.012053
9576	1	87	3		2020-05-25 10:08:09.019446	2020-05-25 10:08:09.019446
9577	88	87	2		2020-05-25 10:08:09.027523	2020-05-25 10:08:09.027523
9578	53	87	0		2020-05-25 10:08:09.035406	2020-05-25 10:08:09.035406
9579	30	87	5		2020-05-25 10:08:09.041018	2020-05-25 10:08:09.041018
9580	39	87	3		2020-05-25 10:08:09.048441	2020-05-25 10:08:09.048441
9581	67	87	2		2020-05-25 10:08:09.058637	2020-05-25 10:08:09.058637
9582	91	87	2		2020-05-25 10:08:09.063316	2020-05-25 10:08:09.063316
9583	57	87	3		2020-05-25 10:08:09.072824	2020-05-25 10:08:09.072824
9584	77	87	3		2020-05-25 10:08:09.080194	2020-05-25 10:08:09.080194
9585	80	87	1		2020-05-25 10:08:09.087669	2020-05-25 10:08:09.087669
9586	40	87	0		2020-05-25 10:08:09.094213	2020-05-25 10:08:09.094213
9587	32	87	3		2020-05-25 10:08:09.102925	2020-05-25 10:08:09.102925
9588	11	87	2		2020-05-25 10:08:09.110789	2020-05-25 10:08:09.110789
9589	76	87	1		2020-05-25 10:08:09.118937	2020-05-25 10:08:09.118937
9590	49	87	3		2020-05-25 10:08:09.12549	2020-05-25 10:08:09.12549
9591	66	87	0		2020-05-25 10:08:09.131835	2020-05-25 10:08:09.131835
9592	48	87	0		2020-05-25 10:08:09.142669	2020-05-25 10:08:09.142669
9593	65	87	4		2020-05-25 10:08:09.151775	2020-05-25 10:08:09.151775
9594	92	87	0		2020-05-25 10:08:09.158215	2020-05-25 10:08:09.158215
9595	99	87	5		2020-05-25 10:08:09.1643	2020-05-25 10:08:09.1643
9596	13	87	2		2020-05-25 10:08:09.173148	2020-05-25 10:08:09.173148
9597	20	87	3		2020-05-25 10:08:09.180938	2020-05-25 10:08:09.180938
9598	94	87	5		2020-05-25 10:08:09.18707	2020-05-25 10:08:09.18707
9599	31	87	3		2020-05-25 10:08:09.19441	2020-05-25 10:08:09.19441
9600	58	87	2		2020-05-25 10:08:09.203206	2020-05-25 10:08:09.203206
9601	52	87	2		2020-05-25 10:08:09.21131	2020-05-25 10:08:09.21131
9602	70	87	2		2020-05-25 10:08:09.219471	2020-05-25 10:08:09.219471
9603	17	87	2		2020-05-25 10:08:09.225647	2020-05-25 10:08:09.225647
9604	87	87	0		2020-05-25 10:08:09.235741	2020-05-25 10:08:09.235741
9605	43	87	1		2020-05-25 10:08:09.243951	2020-05-25 10:08:09.243951
9606	34	88	4		2020-05-25 10:08:09.252303	2020-05-25 10:08:09.252303
9607	86	88	0		2020-05-25 10:08:09.25888	2020-05-25 10:08:09.25888
9608	96	88	4		2020-05-25 10:08:09.265412	2020-05-25 10:08:09.265412
9609	4	88	4		2020-05-25 10:08:09.275726	2020-05-25 10:08:09.275726
9610	98	88	5		2020-05-25 10:08:09.2801	2020-05-25 10:08:09.2801
9611	84	88	4		2020-05-25 10:08:09.289452	2020-05-25 10:08:09.289452
9612	48	88	3		2020-05-25 10:08:09.296923	2020-05-25 10:08:09.296923
9613	69	88	0		2020-05-25 10:08:09.304139	2020-05-25 10:08:09.304139
9614	24	88	4		2020-05-25 10:08:09.310404	2020-05-25 10:08:09.310404
9615	8	88	3		2020-05-25 10:08:09.318107	2020-05-25 10:08:09.318107
9616	23	88	1		2020-05-25 10:08:09.326511	2020-05-25 10:08:09.326511
9617	56	88	1		2020-05-25 10:08:09.335479	2020-05-25 10:08:09.335479
9618	83	88	2		2020-05-25 10:08:09.344223	2020-05-25 10:08:09.344223
9619	41	88	0		2020-05-25 10:08:09.353103	2020-05-25 10:08:09.353103
9620	47	88	3		2020-05-25 10:08:09.361473	2020-05-25 10:08:09.361473
9621	20	88	4		2020-05-25 10:08:09.369374	2020-05-25 10:08:09.369374
9622	62	88	0		2020-05-25 10:08:09.377368	2020-05-25 10:08:09.377368
9623	11	88	1		2020-05-25 10:08:09.385216	2020-05-25 10:08:09.385216
9624	29	88	0		2020-05-25 10:08:09.393424	2020-05-25 10:08:09.393424
9625	18	88	0		2020-05-25 10:08:09.402717	2020-05-25 10:08:09.402717
9626	30	88	4		2020-05-25 10:08:09.409734	2020-05-25 10:08:09.409734
9627	49	88	2		2020-05-25 10:08:09.416001	2020-05-25 10:08:09.416001
9628	94	88	2		2020-05-25 10:08:09.426828	2020-05-25 10:08:09.426828
9629	72	88	1		2020-05-25 10:08:09.435732	2020-05-25 10:08:09.435732
9630	79	88	2		2020-05-25 10:08:09.443821	2020-05-25 10:08:09.443821
9631	9	88	3		2020-05-25 10:08:09.452525	2020-05-25 10:08:09.452525
9632	90	88	2		2020-05-25 10:08:09.460654	2020-05-25 10:08:09.460654
9633	42	88	2		2020-05-25 10:08:09.467658	2020-05-25 10:08:09.467658
9634	88	88	3		2020-05-25 10:08:09.475276	2020-05-25 10:08:09.475276
9635	5	88	3		2020-05-25 10:08:09.483674	2020-05-25 10:08:09.483674
9636	99	88	1		2020-05-25 10:08:09.492477	2020-05-25 10:08:09.492477
9637	75	88	4		2020-05-25 10:08:09.505245	2020-05-25 10:08:09.505245
9638	58	88	5		2020-05-25 10:08:09.513799	2020-05-25 10:08:09.513799
9639	40	88	5		2020-05-25 10:08:09.524689	2020-05-25 10:08:09.524689
9640	44	88	0		2020-05-25 10:08:09.532385	2020-05-25 10:08:09.532385
9641	87	88	0		2020-05-25 10:08:09.545086	2020-05-25 10:08:09.545086
9642	21	88	1		2020-05-25 10:08:09.554911	2020-05-25 10:08:09.554911
9643	54	88	1		2020-05-25 10:08:09.563822	2020-05-25 10:08:09.563822
9644	80	88	0		2020-05-25 10:08:09.574615	2020-05-25 10:08:09.574615
9645	89	88	2		2020-05-25 10:08:09.582572	2020-05-25 10:08:09.582572
9646	22	88	4		2020-05-25 10:08:09.595558	2020-05-25 10:08:09.595558
9647	92	88	2		2020-05-25 10:08:09.604715	2020-05-25 10:08:09.604715
9648	43	88	0		2020-05-25 10:08:09.613318	2020-05-25 10:08:09.613318
9649	68	88	4		2020-05-25 10:08:09.626123	2020-05-25 10:08:09.626123
9650	52	88	0		2020-05-25 10:08:09.632723	2020-05-25 10:08:09.632723
9651	17	88	5		2020-05-25 10:08:09.645038	2020-05-25 10:08:09.645038
9652	67	88	2		2020-05-25 10:08:09.653411	2020-05-25 10:08:09.653411
9653	28	88	4		2020-05-25 10:08:09.661955	2020-05-25 10:08:09.661955
9654	32	88	0		2020-05-25 10:08:09.675347	2020-05-25 10:08:09.675347
9655	35	88	1		2020-05-25 10:08:09.705222	2020-05-25 10:08:09.705222
9656	64	88	0		2020-05-25 10:08:09.712632	2020-05-25 10:08:09.712632
9657	78	88	3		2020-05-25 10:08:09.721021	2020-05-25 10:08:09.721021
9658	46	88	3		2020-05-25 10:08:09.729793	2020-05-25 10:08:09.729793
9659	1	88	0		2020-05-25 10:08:09.740794	2020-05-25 10:08:09.740794
9660	7	88	3		2020-05-25 10:08:09.746032	2020-05-25 10:08:09.746032
9661	16	88	5		2020-05-25 10:08:09.759618	2020-05-25 10:08:09.759618
9662	0	88	3		2020-05-25 10:08:09.764136	2020-05-25 10:08:09.764136
9663	59	88	2		2020-05-25 10:08:09.776219	2020-05-25 10:08:09.776219
9664	93	88	1		2020-05-25 10:08:09.785397	2020-05-25 10:08:09.785397
9665	66	88	3		2020-05-25 10:08:09.794055	2020-05-25 10:08:09.794055
9666	53	88	1		2020-05-25 10:08:09.803112	2020-05-25 10:08:09.803112
9667	14	88	1		2020-05-25 10:08:09.811755	2020-05-25 10:08:09.811755
9668	36	88	4		2020-05-25 10:08:09.819011	2020-05-25 10:08:09.819011
9669	61	88	5		2020-05-25 10:08:09.827245	2020-05-25 10:08:09.827245
9670	77	88	2		2020-05-25 10:08:09.835095	2020-05-25 10:08:09.835095
9671	85	88	3		2020-05-25 10:08:09.844117	2020-05-25 10:08:09.844117
9672	3	88	1		2020-05-25 10:08:09.852147	2020-05-25 10:08:09.852147
9673	57	88	1		2020-05-25 10:08:09.860447	2020-05-25 10:08:09.860447
9674	82	88	2		2020-05-25 10:08:09.868371	2020-05-25 10:08:09.868371
9675	20	89	1		2020-05-25 10:08:09.876648	2020-05-25 10:08:09.876648
9676	73	89	1		2020-05-25 10:08:09.885797	2020-05-25 10:08:09.885797
9677	41	89	3		2020-05-25 10:08:09.892781	2020-05-25 10:08:09.892781
9678	50	89	3		2020-05-25 10:08:09.899492	2020-05-25 10:08:09.899492
9679	8	89	4		2020-05-25 10:08:09.909841	2020-05-25 10:08:09.909841
9680	59	89	4		2020-05-25 10:08:09.918374	2020-05-25 10:08:09.918374
9681	75	89	4		2020-05-25 10:08:09.92678	2020-05-25 10:08:09.92678
9682	56	89	4		2020-05-25 10:08:09.936359	2020-05-25 10:08:09.936359
9683	23	89	3		2020-05-25 10:08:09.944618	2020-05-25 10:08:09.944618
9684	63	89	5		2020-05-25 10:08:09.952811	2020-05-25 10:08:09.952811
9685	90	89	4		2020-05-25 10:08:09.960925	2020-05-25 10:08:09.960925
9686	62	89	2		2020-05-25 10:08:09.969274	2020-05-25 10:08:09.969274
9687	58	89	2		2020-05-25 10:08:09.977668	2020-05-25 10:08:09.977668
9688	99	89	1		2020-05-25 10:08:09.982468	2020-05-25 10:08:09.982468
9689	11	89	2		2020-05-25 10:08:09.993303	2020-05-25 10:08:09.993303
9690	22	89	2		2020-05-25 10:08:10.003807	2020-05-25 10:08:10.003807
9691	26	89	5		2020-05-25 10:08:10.012345	2020-05-25 10:08:10.012345
9692	98	89	1		2020-05-25 10:08:10.018912	2020-05-25 10:08:10.018912
9693	67	89	4		2020-05-25 10:08:10.027059	2020-05-25 10:08:10.027059
9694	40	89	4		2020-05-25 10:08:10.034986	2020-05-25 10:08:10.034986
9695	5	89	5		2020-05-25 10:08:10.042761	2020-05-25 10:08:10.042761
9696	72	89	2		2020-05-25 10:08:10.04839	2020-05-25 10:08:10.04839
9697	70	89	3		2020-05-25 10:08:10.058499	2020-05-25 10:08:10.058499
9698	64	89	3		2020-05-25 10:08:10.065907	2020-05-25 10:08:10.065907
9699	34	89	1		2020-05-25 10:08:10.077043	2020-05-25 10:08:10.077043
9700	37	89	5		2020-05-25 10:08:10.085762	2020-05-25 10:08:10.085762
9701	39	89	3		2020-05-25 10:08:10.093937	2020-05-25 10:08:10.093937
9702	74	89	3		2020-05-25 10:08:10.102712	2020-05-25 10:08:10.102712
9703	95	89	3		2020-05-25 10:08:10.110929	2020-05-25 10:08:10.110929
9704	7	89	1		2020-05-25 10:08:10.11798	2020-05-25 10:08:10.11798
9705	35	89	4		2020-05-25 10:08:10.124902	2020-05-25 10:08:10.124902
9706	15	89	0		2020-05-25 10:08:10.131857	2020-05-25 10:08:10.131857
9707	48	89	5		2020-05-25 10:08:10.142995	2020-05-25 10:08:10.142995
9708	81	89	0		2020-05-25 10:08:10.151887	2020-05-25 10:08:10.151887
9709	80	89	4		2020-05-25 10:08:10.159336	2020-05-25 10:08:10.159336
9710	71	89	4		2020-05-25 10:08:10.164872	2020-05-25 10:08:10.164872
9711	91	89	3		2020-05-25 10:08:10.174594	2020-05-25 10:08:10.174594
9712	1	89	5		2020-05-25 10:08:10.182484	2020-05-25 10:08:10.182484
9713	19	89	3		2020-05-25 10:08:10.193382	2020-05-25 10:08:10.193382
9714	38	89	4		2020-05-25 10:08:10.202565	2020-05-25 10:08:10.202565
9715	47	89	0		2020-05-25 10:08:10.21084	2020-05-25 10:08:10.21084
9716	49	89	4		2020-05-25 10:08:10.219366	2020-05-25 10:08:10.219366
9717	76	89	3		2020-05-25 10:08:10.226321	2020-05-25 10:08:10.226321
9718	85	89	3		2020-05-25 10:08:10.232558	2020-05-25 10:08:10.232558
9719	31	89	4		2020-05-25 10:08:10.24381	2020-05-25 10:08:10.24381
9720	69	89	3		2020-05-25 10:08:10.252059	2020-05-25 10:08:10.252059
9721	33	89	1		2020-05-25 10:08:10.258724	2020-05-25 10:08:10.258724
9722	24	89	1		2020-05-25 10:08:10.268175	2020-05-25 10:08:10.268175
9723	6	89	2		2020-05-25 10:08:10.276133	2020-05-25 10:08:10.276133
9724	53	89	1		2020-05-25 10:08:10.285151	2020-05-25 10:08:10.285151
9725	0	89	4		2020-05-25 10:08:10.291596	2020-05-25 10:08:10.291596
9726	57	89	1		2020-05-25 10:08:10.297697	2020-05-25 10:08:10.297697
9727	18	89	1		2020-05-25 10:08:10.306335	2020-05-25 10:08:10.306335
9728	78	89	0		2020-05-25 10:08:10.314572	2020-05-25 10:08:10.314572
9729	12	89	3		2020-05-25 10:08:10.32256	2020-05-25 10:08:10.32256
9730	52	89	5		2020-05-25 10:08:10.329509	2020-05-25 10:08:10.329509
9731	51	89	1		2020-05-25 10:08:10.337145	2020-05-25 10:08:10.337145
9732	14	89	0		2020-05-25 10:08:10.345593	2020-05-25 10:08:10.345593
9733	3	89	0		2020-05-25 10:08:10.352391	2020-05-25 10:08:10.352391
9734	16	89	2		2020-05-25 10:08:10.360421	2020-05-25 10:08:10.360421
9735	21	89	0		2020-05-25 10:08:10.368471	2020-05-25 10:08:10.368471
9736	29	89	0		2020-05-25 10:08:10.377105	2020-05-25 10:08:10.377105
9737	28	89	3		2020-05-25 10:08:10.381885	2020-05-25 10:08:10.381885
9738	87	89	1		2020-05-25 10:08:10.393005	2020-05-25 10:08:10.393005
9739	27	89	4		2020-05-25 10:08:10.399423	2020-05-25 10:08:10.399423
9740	68	89	4		2020-05-25 10:08:10.410544	2020-05-25 10:08:10.410544
9741	66	89	3		2020-05-25 10:08:10.419439	2020-05-25 10:08:10.419439
9742	10	89	5		2020-05-25 10:08:10.42777	2020-05-25 10:08:10.42777
9743	84	89	5		2020-05-25 10:08:10.435836	2020-05-25 10:08:10.435836
9744	97	89	1		2020-05-25 10:08:10.444103	2020-05-25 10:08:10.444103
9745	17	89	1		2020-05-25 10:08:10.451932	2020-05-25 10:08:10.451932
9746	83	89	1		2020-05-25 10:08:10.460252	2020-05-25 10:08:10.460252
9747	30	89	3		2020-05-25 10:08:10.468865	2020-05-25 10:08:10.468865
9748	89	89	4		2020-05-25 10:08:10.477853	2020-05-25 10:08:10.477853
9749	88	89	5		2020-05-25 10:08:10.486406	2020-05-25 10:08:10.486406
9750	43	89	3		2020-05-25 10:08:10.49515	2020-05-25 10:08:10.49515
9751	36	89	2		2020-05-25 10:08:10.504195	2020-05-25 10:08:10.504195
9752	32	89	4		2020-05-25 10:08:10.512316	2020-05-25 10:08:10.512316
9753	65	89	5		2020-05-25 10:08:10.521853	2020-05-25 10:08:10.521853
9754	54	89	3		2020-05-25 10:08:10.530455	2020-05-25 10:08:10.530455
9755	48	90	0		2020-05-25 10:08:10.538956	2020-05-25 10:08:10.538956
9756	33	90	3		2020-05-25 10:08:10.546159	2020-05-25 10:08:10.546159
9757	10	90	1		2020-05-25 10:08:10.555434	2020-05-25 10:08:10.555434
9758	76	90	3		2020-05-25 10:08:10.563673	2020-05-25 10:08:10.563673
9759	70	90	5		2020-05-25 10:08:10.572279	2020-05-25 10:08:10.572279
9760	30	90	0		2020-05-25 10:08:10.579155	2020-05-25 10:08:10.579155
9761	67	90	4		2020-05-25 10:08:10.588293	2020-05-25 10:08:10.588293
9762	98	90	3		2020-05-25 10:08:10.596325	2020-05-25 10:08:10.596325
9763	63	90	2		2020-05-25 10:08:10.604939	2020-05-25 10:08:10.604939
9764	74	90	1		2020-05-25 10:08:10.611785	2020-05-25 10:08:10.611785
9765	44	90	2		2020-05-25 10:08:10.620217	2020-05-25 10:08:10.620217
9766	7	90	0		2020-05-25 10:08:10.628548	2020-05-25 10:08:10.628548
9767	78	90	4		2020-05-25 10:08:10.636505	2020-05-25 10:08:10.636505
9768	41	90	4		2020-05-25 10:08:10.642704	2020-05-25 10:08:10.642704
9769	27	90	2		2020-05-25 10:08:10.653126	2020-05-25 10:08:10.653126
9770	1	90	2		2020-05-25 10:08:10.660813	2020-05-25 10:08:10.660813
9771	82	90	0		2020-05-25 10:08:10.667661	2020-05-25 10:08:10.667661
9772	13	90	1		2020-05-25 10:08:10.673734	2020-05-25 10:08:10.673734
9773	45	90	2		2020-05-25 10:08:10.681179	2020-05-25 10:08:10.681179
9774	87	90	2		2020-05-25 10:08:10.688402	2020-05-25 10:08:10.688402
9775	72	90	3		2020-05-25 10:08:10.695254	2020-05-25 10:08:10.695254
9776	52	90	4		2020-05-25 10:08:10.70421	2020-05-25 10:08:10.70421
9777	0	90	3		2020-05-25 10:08:10.712346	2020-05-25 10:08:10.712346
9778	50	90	4		2020-05-25 10:08:10.720207	2020-05-25 10:08:10.720207
9779	88	90	4		2020-05-25 10:08:10.726106	2020-05-25 10:08:10.726106
9780	9	90	1		2020-05-25 10:08:10.736106	2020-05-25 10:08:10.736106
9781	38	90	2		2020-05-25 10:08:10.743954	2020-05-25 10:08:10.743954
9782	55	90	5		2020-05-25 10:08:10.752539	2020-05-25 10:08:10.752539
9783	96	90	2		2020-05-25 10:08:10.758823	2020-05-25 10:08:10.758823
9784	93	90	0		2020-05-25 10:08:10.765298	2020-05-25 10:08:10.765298
9785	83	90	4		2020-05-25 10:08:10.776594	2020-05-25 10:08:10.776594
9786	64	90	3		2020-05-25 10:08:10.785832	2020-05-25 10:08:10.785832
9787	81	90	1		2020-05-25 10:08:10.793421	2020-05-25 10:08:10.793421
9788	28	90	3		2020-05-25 10:08:10.79947	2020-05-25 10:08:10.79947
9789	36	90	4		2020-05-25 10:08:10.809766	2020-05-25 10:08:10.809766
9790	4	90	0		2020-05-25 10:08:10.818137	2020-05-25 10:08:10.818137
9791	20	90	0		2020-05-25 10:08:10.824057	2020-05-25 10:08:10.824057
9792	71	90	3		2020-05-25 10:08:10.831309	2020-05-25 10:08:10.831309
9793	29	90	3		2020-05-25 10:08:10.837788	2020-05-25 10:08:10.837788
9794	3	90	0		2020-05-25 10:08:10.844922	2020-05-25 10:08:10.844922
9795	62	90	1		2020-05-25 10:08:10.85419	2020-05-25 10:08:10.85419
9796	19	90	0		2020-05-25 10:08:10.862216	2020-05-25 10:08:10.862216
9797	68	90	3		2020-05-25 10:08:10.86877	2020-05-25 10:08:10.86877
9798	14	90	4		2020-05-25 10:08:10.87655	2020-05-25 10:08:10.87655
9799	61	90	2		2020-05-25 10:08:10.885308	2020-05-25 10:08:10.885308
9800	47	90	2		2020-05-25 10:08:10.891777	2020-05-25 10:08:10.891777
9801	66	90	2		2020-05-25 10:08:10.898056	2020-05-25 10:08:10.898056
9802	6	90	5		2020-05-25 10:08:10.906864	2020-05-25 10:08:10.906864
9803	2	90	0		2020-05-25 10:08:10.914559	2020-05-25 10:08:10.914559
9804	65	90	1		2020-05-25 10:08:10.920774	2020-05-25 10:08:10.920774
9805	53	90	2		2020-05-25 10:08:10.927881	2020-05-25 10:08:10.927881
9806	85	90	1		2020-05-25 10:08:10.937379	2020-05-25 10:08:10.937379
9807	26	90	1		2020-05-25 10:08:10.945192	2020-05-25 10:08:10.945192
9808	31	90	2		2020-05-25 10:08:10.975176	2020-05-25 10:08:10.975176
9809	77	90	2		2020-05-25 10:08:10.979678	2020-05-25 10:08:10.979678
9810	12	90	0		2020-05-25 10:08:10.98997	2020-05-25 10:08:10.98997
9811	95	90	1		2020-05-25 10:08:10.996747	2020-05-25 10:08:10.996747
9812	16	90	0		2020-05-25 10:08:11.009554	2020-05-25 10:08:11.009554
9813	37	90	3		2020-05-25 10:08:11.015909	2020-05-25 10:08:11.015909
9814	18	90	1		2020-05-25 10:08:11.027064	2020-05-25 10:08:11.027064
9815	89	90	0		2020-05-25 10:08:11.035888	2020-05-25 10:08:11.035888
9816	25	90	1		2020-05-25 10:08:11.043924	2020-05-25 10:08:11.043924
9817	91	90	2		2020-05-25 10:08:11.053078	2020-05-25 10:08:11.053078
9818	49	90	0		2020-05-25 10:08:11.061169	2020-05-25 10:08:11.061169
9819	60	90	1		2020-05-25 10:08:11.067793	2020-05-25 10:08:11.067793
9820	54	90	5		2020-05-25 10:08:11.074257	2020-05-25 10:08:11.074257
9821	73	90	1		2020-05-25 10:08:11.081649	2020-05-25 10:08:11.081649
9822	34	90	4		2020-05-25 10:08:11.091543	2020-05-25 10:08:11.091543
9823	11	90	0		2020-05-25 10:08:11.096629	2020-05-25 10:08:11.096629
9824	56	90	5		2020-05-25 10:08:11.105424	2020-05-25 10:08:11.105424
9825	15	90	3		2020-05-25 10:08:11.113387	2020-05-25 10:08:11.113387
9826	19	91	2		2020-05-25 10:08:11.121075	2020-05-25 10:08:11.121075
9827	75	91	5		2020-05-25 10:08:11.128285	2020-05-25 10:08:11.128285
9828	17	91	0		2020-05-25 10:08:11.137276	2020-05-25 10:08:11.137276
9829	60	91	3		2020-05-25 10:08:11.145421	2020-05-25 10:08:11.145421
9830	32	91	2		2020-05-25 10:08:11.152433	2020-05-25 10:08:11.152433
9831	97	91	3		2020-05-25 10:08:11.158344	2020-05-25 10:08:11.158344
9832	4	91	0		2020-05-25 10:08:11.165818	2020-05-25 10:08:11.165818
9833	51	91	4		2020-05-25 10:08:11.176801	2020-05-25 10:08:11.176801
9834	86	91	1		2020-05-25 10:08:11.184845	2020-05-25 10:08:11.184845
9835	47	91	3		2020-05-25 10:08:11.1907	2020-05-25 10:08:11.1907
9836	20	91	4		2020-05-25 10:08:11.198264	2020-05-25 10:08:11.198264
9837	70	91	0		2020-05-25 10:08:11.204859	2020-05-25 10:08:11.204859
9838	5	91	4		2020-05-25 10:08:11.211709	2020-05-25 10:08:11.211709
9839	26	91	2		2020-05-25 10:08:11.22056	2020-05-25 10:08:11.22056
9840	0	91	1		2020-05-25 10:08:11.228985	2020-05-25 10:08:11.228985
9841	39	91	3		2020-05-25 10:08:11.237332	2020-05-25 10:08:11.237332
9842	16	91	0		2020-05-25 10:08:11.24363	2020-05-25 10:08:11.24363
9843	58	91	4		2020-05-25 10:08:11.251861	2020-05-25 10:08:11.251861
9844	23	91	0		2020-05-25 10:08:11.259753	2020-05-25 10:08:11.259753
9845	87	91	4		2020-05-25 10:08:11.26905	2020-05-25 10:08:11.26905
9846	25	91	2		2020-05-25 10:08:11.276107	2020-05-25 10:08:11.276107
9847	54	91	1		2020-05-25 10:08:11.285699	2020-05-25 10:08:11.285699
9848	11	91	3		2020-05-25 10:08:11.291835	2020-05-25 10:08:11.291835
9849	49	91	2		2020-05-25 10:08:11.299252	2020-05-25 10:08:11.299252
9850	61	91	2		2020-05-25 10:08:11.309499	2020-05-25 10:08:11.309499
9851	78	91	5		2020-05-25 10:08:11.318667	2020-05-25 10:08:11.318667
9852	88	91	3		2020-05-25 10:08:11.324666	2020-05-25 10:08:11.324666
9853	14	91	0		2020-05-25 10:08:11.331646	2020-05-25 10:08:11.331646
9854	62	91	0		2020-05-25 10:08:11.341962	2020-05-25 10:08:11.341962
9855	41	91	1		2020-05-25 10:08:11.346332	2020-05-25 10:08:11.346332
9856	31	91	2		2020-05-25 10:08:11.35678	2020-05-25 10:08:11.35678
9857	76	91	1		2020-05-25 10:08:11.363391	2020-05-25 10:08:11.363391
9858	21	91	1		2020-05-25 10:08:11.37144	2020-05-25 10:08:11.37144
9859	81	91	3		2020-05-25 10:08:11.378902	2020-05-25 10:08:11.378902
9860	80	91	0		2020-05-25 10:08:11.385801	2020-05-25 10:08:11.385801
9861	83	91	3		2020-05-25 10:08:11.393671	2020-05-25 10:08:11.393671
9862	15	91	4		2020-05-25 10:08:11.402139	2020-05-25 10:08:11.402139
9863	65	91	3		2020-05-25 10:08:11.408328	2020-05-25 10:08:11.408328
9864	22	91	5		2020-05-25 10:08:11.415822	2020-05-25 10:08:11.415822
9865	6	91	0		2020-05-25 10:08:11.42726	2020-05-25 10:08:11.42726
9866	64	91	0		2020-05-25 10:08:11.436001	2020-05-25 10:08:11.436001
9867	35	91	3		2020-05-25 10:08:11.443308	2020-05-25 10:08:11.443308
9868	63	91	0		2020-05-25 10:08:11.453523	2020-05-25 10:08:11.453523
9869	9	91	3		2020-05-25 10:08:11.461478	2020-05-25 10:08:11.461478
9870	37	91	1		2020-05-25 10:08:11.468823	2020-05-25 10:08:11.468823
9871	84	91	2		2020-05-25 10:08:11.474906	2020-05-25 10:08:11.474906
9872	95	91	2		2020-05-25 10:08:11.483751	2020-05-25 10:08:11.483751
9873	10	91	5		2020-05-25 10:08:11.493432	2020-05-25 10:08:11.493432
9874	90	91	2		2020-05-25 10:08:11.504314	2020-05-25 10:08:11.504314
9875	93	91	3		2020-05-25 10:08:11.511446	2020-05-25 10:08:11.511446
9876	48	91	4		2020-05-25 10:08:11.519701	2020-05-25 10:08:11.519701
9877	68	91	2		2020-05-25 10:08:11.527803	2020-05-25 10:08:11.527803
9878	72	91	0		2020-05-25 10:08:11.535598	2020-05-25 10:08:11.535598
9879	55	91	0		2020-05-25 10:08:11.541313	2020-05-25 10:08:11.541313
9880	38	91	1		2020-05-25 10:08:11.548766	2020-05-25 10:08:11.548766
9881	96	91	4		2020-05-25 10:08:11.55947	2020-05-25 10:08:11.55947
9882	89	91	4		2020-05-25 10:08:11.568749	2020-05-25 10:08:11.568749
9883	7	91	1		2020-05-25 10:08:11.574864	2020-05-25 10:08:11.574864
9884	18	91	2		2020-05-25 10:08:11.581508	2020-05-25 10:08:11.581508
9885	85	91	4		2020-05-25 10:08:11.591937	2020-05-25 10:08:11.591937
9886	53	91	2		2020-05-25 10:08:11.596336	2020-05-25 10:08:11.596336
9887	59	91	3		2020-05-25 10:08:11.606073	2020-05-25 10:08:11.606073
9888	71	91	3		2020-05-25 10:08:11.613349	2020-05-25 10:08:11.613349
9889	56	91	4		2020-05-25 10:08:11.620579	2020-05-25 10:08:11.620579
9890	12	91	4		2020-05-25 10:08:11.627416	2020-05-25 10:08:11.627416
9891	36	91	2		2020-05-25 10:08:11.637384	2020-05-25 10:08:11.637384
9892	50	91	2		2020-05-25 10:08:11.646231	2020-05-25 10:08:11.646231
9893	52	91	4		2020-05-25 10:08:11.654925	2020-05-25 10:08:11.654925
9894	92	91	3		2020-05-25 10:08:11.663986	2020-05-25 10:08:11.663986
9895	69	91	1		2020-05-25 10:08:11.672571	2020-05-25 10:08:11.672571
9896	57	91	5		2020-05-25 10:08:11.679404	2020-05-25 10:08:11.679404
9897	79	91	3		2020-05-25 10:08:11.687251	2020-05-25 10:08:11.687251
9898	27	91	3		2020-05-25 10:08:11.69611	2020-05-25 10:08:11.69611
9899	2	91	4		2020-05-25 10:08:11.704205	2020-05-25 10:08:11.704205
9900	1	91	4		2020-05-25 10:08:11.712235	2020-05-25 10:08:11.712235
9901	13	91	3		2020-05-25 10:08:11.721042	2020-05-25 10:08:11.721042
9902	8	91	2		2020-05-25 10:08:11.729461	2020-05-25 10:08:11.729461
9903	29	91	4		2020-05-25 10:08:11.736345	2020-05-25 10:08:11.736345
9904	91	91	0		2020-05-25 10:08:11.744752	2020-05-25 10:08:11.744752
9905	34	91	2		2020-05-25 10:08:11.75407	2020-05-25 10:08:11.75407
9906	3	91	0		2020-05-25 10:08:11.761584	2020-05-25 10:08:11.761584
9907	73	91	2		2020-05-25 10:08:11.769103	2020-05-25 10:08:11.769103
9908	42	91	4		2020-05-25 10:08:11.777235	2020-05-25 10:08:11.777235
9909	98	91	1		2020-05-25 10:08:11.785605	2020-05-25 10:08:11.785605
9910	94	91	0		2020-05-25 10:08:11.79209	2020-05-25 10:08:11.79209
9911	28	91	0		2020-05-25 10:08:11.798619	2020-05-25 10:08:11.798619
9912	77	91	0		2020-05-25 10:08:11.807305	2020-05-25 10:08:11.807305
9913	67	91	2		2020-05-25 10:08:11.815057	2020-05-25 10:08:11.815057
9914	40	91	0		2020-05-25 10:08:11.821525	2020-05-25 10:08:11.821525
9915	24	91	4		2020-05-25 10:08:11.828571	2020-05-25 10:08:11.828571
9916	46	91	0		2020-05-25 10:08:11.837477	2020-05-25 10:08:11.837477
9917	30	91	1		2020-05-25 10:08:11.845812	2020-05-25 10:08:11.845812
9918	99	91	5		2020-05-25 10:08:11.852231	2020-05-25 10:08:11.852231
9919	44	91	4		2020-05-25 10:08:11.860009	2020-05-25 10:08:11.860009
9920	45	91	3		2020-05-25 10:08:11.867624	2020-05-25 10:08:11.867624
9921	84	92	5		2020-05-25 10:08:11.873434	2020-05-25 10:08:11.873434
9922	76	92	3		2020-05-25 10:08:11.881264	2020-05-25 10:08:11.881264
9923	57	92	1		2020-05-25 10:08:11.888286	2020-05-25 10:08:11.888286
9924	97	92	2		2020-05-25 10:08:11.894387	2020-05-25 10:08:11.894387
9925	80	92	4		2020-05-25 10:08:11.904156	2020-05-25 10:08:11.904156
9926	18	92	0		2020-05-25 10:08:11.911365	2020-05-25 10:08:11.911365
9927	29	92	0		2020-05-25 10:08:11.920323	2020-05-25 10:08:11.920323
9928	7	92	1		2020-05-25 10:08:11.928656	2020-05-25 10:08:11.928656
9929	51	92	3		2020-05-25 10:08:11.936816	2020-05-25 10:08:11.936816
9930	14	92	1		2020-05-25 10:08:11.942885	2020-05-25 10:08:11.942885
9931	70	92	1		2020-05-25 10:08:11.953074	2020-05-25 10:08:11.953074
9932	9	92	2		2020-05-25 10:08:11.960746	2020-05-25 10:08:11.960746
9933	26	92	0		2020-05-25 10:08:11.967875	2020-05-25 10:08:11.967875
9934	77	92	5		2020-05-25 10:08:11.973966	2020-05-25 10:08:11.973966
9935	92	92	2		2020-05-25 10:08:11.981216	2020-05-25 10:08:11.981216
9936	48	92	3		2020-05-25 10:08:11.991938	2020-05-25 10:08:11.991938
9937	56	92	1		2020-05-25 10:08:11.996406	2020-05-25 10:08:11.996406
9938	88	92	5		2020-05-25 10:08:12.009007	2020-05-25 10:08:12.009007
9939	1	92	4		2020-05-25 10:08:12.014827	2020-05-25 10:08:12.014827
9940	69	92	0		2020-05-25 10:08:12.023903	2020-05-25 10:08:12.023903
9941	32	92	2		2020-05-25 10:08:12.03187	2020-05-25 10:08:12.03187
9942	58	92	4		2020-05-25 10:08:12.037892	2020-05-25 10:08:12.037892
9943	65	92	4		2020-05-25 10:08:12.045244	2020-05-25 10:08:12.045244
9944	34	92	4		2020-05-25 10:08:12.05443	2020-05-25 10:08:12.05443
9945	93	92	2		2020-05-25 10:08:12.062371	2020-05-25 10:08:12.062371
9946	31	92	2		2020-05-25 10:08:12.068985	2020-05-25 10:08:12.068985
9947	55	92	0		2020-05-25 10:08:12.076864	2020-05-25 10:08:12.076864
9948	86	92	2		2020-05-25 10:08:12.085357	2020-05-25 10:08:12.085357
9949	35	92	1		2020-05-25 10:08:12.091123	2020-05-25 10:08:12.091123
9950	39	92	3		2020-05-25 10:08:12.098124	2020-05-25 10:08:12.098124
9951	61	92	0		2020-05-25 10:08:12.107606	2020-05-25 10:08:12.107606
9952	6	92	4		2020-05-25 10:08:12.112297	2020-05-25 10:08:12.112297
9953	98	92	1		2020-05-25 10:08:12.121968	2020-05-25 10:08:12.121968
9954	13	92	1		2020-05-25 10:08:12.129345	2020-05-25 10:08:12.129345
9955	42	92	1		2020-05-25 10:08:12.138444	2020-05-25 10:08:12.138444
9956	30	92	1		2020-05-25 10:08:12.146467	2020-05-25 10:08:12.146467
9957	46	92	1		2020-05-25 10:08:12.155726	2020-05-25 10:08:12.155726
9958	75	92	5		2020-05-25 10:08:12.162977	2020-05-25 10:08:12.162977
9959	54	92	1		2020-05-25 10:08:12.170478	2020-05-25 10:08:12.170478
9960	0	92	3		2020-05-25 10:08:12.177735	2020-05-25 10:08:12.177735
9961	17	92	4		2020-05-25 10:08:12.186601	2020-05-25 10:08:12.186601
9962	68	92	2		2020-05-25 10:08:12.214281	2020-05-25 10:08:12.214281
9963	67	92	4		2020-05-25 10:08:12.219072	2020-05-25 10:08:12.219072
9964	66	92	1		2020-05-25 10:08:12.226973	2020-05-25 10:08:12.226973
9965	33	92	2		2020-05-25 10:08:12.23571	2020-05-25 10:08:12.23571
9966	22	92	0		2020-05-25 10:08:12.24262	2020-05-25 10:08:12.24262
9967	50	92	4		2020-05-25 10:08:12.252415	2020-05-25 10:08:12.252415
9968	45	92	3		2020-05-25 10:08:12.258741	2020-05-25 10:08:12.258741
9969	44	92	3		2020-05-25 10:08:12.266063	2020-05-25 10:08:12.266063
9970	83	92	2		2020-05-25 10:08:12.276226	2020-05-25 10:08:12.276226
9971	36	92	1		2020-05-25 10:08:12.28063	2020-05-25 10:08:12.28063
9972	47	92	5		2020-05-25 10:08:12.290223	2020-05-25 10:08:12.290223
9973	82	92	2		2020-05-25 10:08:12.29778	2020-05-25 10:08:12.29778
9974	85	92	2		2020-05-25 10:08:12.304018	2020-05-25 10:08:12.304018
9975	72	92	2		2020-05-25 10:08:12.31131	2020-05-25 10:08:12.31131
9976	27	92	4		2020-05-25 10:08:12.320333	2020-05-25 10:08:12.320333
9977	81	92	4		2020-05-25 10:08:12.328446	2020-05-25 10:08:12.328446
9978	99	92	2		2020-05-25 10:08:12.336322	2020-05-25 10:08:12.336322
9979	78	92	0		2020-05-25 10:08:12.343369	2020-05-25 10:08:12.343369
9980	52	92	1		2020-05-25 10:08:12.35334	2020-05-25 10:08:12.35334
9981	24	92	3		2020-05-25 10:08:12.361385	2020-05-25 10:08:12.361385
9982	38	92	2		2020-05-25 10:08:12.368137	2020-05-25 10:08:12.368137
9983	71	92	1		2020-05-25 10:08:12.374327	2020-05-25 10:08:12.374327
9984	94	92	3		2020-05-25 10:08:12.382131	2020-05-25 10:08:12.382131
9985	89	92	4		2020-05-25 10:08:12.392486	2020-05-25 10:08:12.392486
9986	28	92	5		2020-05-25 10:08:12.401085	2020-05-25 10:08:12.401085
9987	95	92	2		2020-05-25 10:08:12.407126	2020-05-25 10:08:12.407126
9988	16	92	2		2020-05-25 10:08:12.414107	2020-05-25 10:08:12.414107
9989	62	92	3		2020-05-25 10:08:12.421169	2020-05-25 10:08:12.421169
9990	74	92	0		2020-05-25 10:08:12.427693	2020-05-25 10:08:12.427693
9991	4	92	0		2020-05-25 10:08:12.435678	2020-05-25 10:08:12.435678
9992	25	92	0		2020-05-25 10:08:12.4439	2020-05-25 10:08:12.4439
9993	37	92	3		2020-05-25 10:08:12.452265	2020-05-25 10:08:12.452265
9994	20	92	3		2020-05-25 10:08:12.458944	2020-05-25 10:08:12.458944
9995	5	92	2		2020-05-25 10:08:12.469738	2020-05-25 10:08:12.469738
9996	3	92	0		2020-05-25 10:08:12.477603	2020-05-25 10:08:12.477603
9997	53	92	4		2020-05-25 10:08:12.486477	2020-05-25 10:08:12.486477
9998	40	92	1		2020-05-25 10:08:12.493124	2020-05-25 10:08:12.493124
9999	90	92	2		2020-05-25 10:08:12.504375	2020-05-25 10:08:12.504375
10000	12	92	0		2020-05-25 10:08:12.51203	2020-05-25 10:08:12.51203
10001	59	92	3		2020-05-25 10:08:12.520896	2020-05-25 10:08:12.520896
10002	60	92	1		2020-05-25 10:08:12.528209	2020-05-25 10:08:12.528209
10003	10	92	0		2020-05-25 10:08:12.536607	2020-05-25 10:08:12.536607
10004	91	92	0		2020-05-25 10:08:12.544661	2020-05-25 10:08:12.544661
10005	8	92	0		2020-05-25 10:08:12.552751	2020-05-25 10:08:12.552751
10006	2	92	3		2020-05-25 10:08:12.559174	2020-05-25 10:08:12.559174
10007	43	92	5		2020-05-25 10:08:12.566162	2020-05-25 10:08:12.566162
10008	15	92	3		2020-05-25 10:08:12.57658	2020-05-25 10:08:12.57658
10009	64	92	1		2020-05-25 10:08:12.586171	2020-05-25 10:08:12.586171
10010	41	92	0		2020-05-25 10:08:12.592832	2020-05-25 10:08:12.592832
10011	79	92	3		2020-05-25 10:08:12.59917	2020-05-25 10:08:12.59917
10012	96	92	0		2020-05-25 10:08:12.608711	2020-05-25 10:08:12.608711
10013	49	92	4		2020-05-25 10:08:12.613926	2020-05-25 10:08:12.613926
10014	21	92	2		2020-05-25 10:08:12.623504	2020-05-25 10:08:12.623504
10015	73	92	0		2020-05-25 10:08:12.63154	2020-05-25 10:08:12.63154
10016	11	92	4		2020-05-25 10:08:12.637827	2020-05-25 10:08:12.637827
10017	63	92	2		2020-05-25 10:08:12.645022	2020-05-25 10:08:12.645022
10018	19	92	1		2020-05-25 10:08:12.654801	2020-05-25 10:08:12.654801
10019	23	92	2		2020-05-25 10:08:12.66277	2020-05-25 10:08:12.66277
10020	87	92	4		2020-05-25 10:08:12.672025	2020-05-25 10:08:12.672025
10021	11	93	4		2020-05-25 10:08:12.681187	2020-05-25 10:08:12.681187
10022	7	93	3		2020-05-25 10:08:12.687519	2020-05-25 10:08:12.687519
10023	99	93	3		2020-05-25 10:08:12.695361	2020-05-25 10:08:12.695361
10024	66	93	1		2020-05-25 10:08:12.701852	2020-05-25 10:08:12.701852
10025	93	93	5		2020-05-25 10:08:12.707659	2020-05-25 10:08:12.707659
10026	69	93	3		2020-05-25 10:08:12.715277	2020-05-25 10:08:12.715277
10027	2	93	2		2020-05-25 10:08:12.724797	2020-05-25 10:08:12.724797
10028	12	93	1		2020-05-25 10:08:12.729813	2020-05-25 10:08:12.729813
10029	67	93	1		2020-05-25 10:08:12.739499	2020-05-25 10:08:12.739499
10030	30	93	3		2020-05-25 10:08:12.746981	2020-05-25 10:08:12.746981
10031	52	93	4		2020-05-25 10:08:12.754011	2020-05-25 10:08:12.754011
10032	81	93	1		2020-05-25 10:08:12.760459	2020-05-25 10:08:12.760459
10033	10	93	5		2020-05-25 10:08:12.769842	2020-05-25 10:08:12.769842
10034	50	93	0		2020-05-25 10:08:12.777943	2020-05-25 10:08:12.777943
10035	17	93	1		2020-05-25 10:08:12.785149	2020-05-25 10:08:12.785149
10036	60	93	1		2020-05-25 10:08:12.791097	2020-05-25 10:08:12.791097
10037	94	93	1		2020-05-25 10:08:12.798591	2020-05-25 10:08:12.798591
10038	24	93	3		2020-05-25 10:08:12.809234	2020-05-25 10:08:12.809234
10039	19	93	3		2020-05-25 10:08:12.813525	2020-05-25 10:08:12.813525
10040	42	93	4		2020-05-25 10:08:12.823048	2020-05-25 10:08:12.823048
10041	0	93	3		2020-05-25 10:08:12.830539	2020-05-25 10:08:12.830539
10042	95	93	2		2020-05-25 10:08:12.838429	2020-05-25 10:08:12.838429
10043	35	93	0		2020-05-25 10:08:12.845441	2020-05-25 10:08:12.845441
10044	88	93	1		2020-05-25 10:08:12.853849	2020-05-25 10:08:12.853849
10045	65	93	4		2020-05-25 10:08:12.86115	2020-05-25 10:08:12.86115
10046	63	93	5		2020-05-25 10:08:12.86932	2020-05-25 10:08:12.86932
10047	25	93	3		2020-05-25 10:08:12.877114	2020-05-25 10:08:12.877114
10048	1	93	0		2020-05-25 10:08:12.885925	2020-05-25 10:08:12.885925
10049	62	93	1		2020-05-25 10:08:12.89242	2020-05-25 10:08:12.89242
10050	9	93	3		2020-05-25 10:08:12.904241	2020-05-25 10:08:12.904241
10051	91	93	4		2020-05-25 10:08:12.911802	2020-05-25 10:08:12.911802
10052	6	93	3		2020-05-25 10:08:12.921032	2020-05-25 10:08:12.921032
10053	46	93	3		2020-05-25 10:08:12.932046	2020-05-25 10:08:12.932046
10054	68	93	0		2020-05-25 10:08:12.955753	2020-05-25 10:08:12.955753
10055	31	93	1		2020-05-25 10:08:12.963113	2020-05-25 10:08:12.963113
10056	13	93	3		2020-05-25 10:08:12.971438	2020-05-25 10:08:12.971438
10057	58	93	5		2020-05-25 10:08:12.984843	2020-05-25 10:08:12.984843
10058	18	93	0		2020-05-25 10:08:13.001543	2020-05-25 10:08:13.001543
10059	71	93	5		2020-05-25 10:08:13.007576	2020-05-25 10:08:13.007576
10060	90	93	1		2020-05-25 10:08:13.01582	2020-05-25 10:08:13.01582
10061	92	93	2		2020-05-25 10:08:13.021491	2020-05-25 10:08:13.021491
10062	53	93	1		2020-05-25 10:08:13.028829	2020-05-25 10:08:13.028829
10063	78	93	1		2020-05-25 10:08:13.037807	2020-05-25 10:08:13.037807
10064	27	93	3		2020-05-25 10:08:13.045913	2020-05-25 10:08:13.045913
10065	81	94	4		2020-05-25 10:08:13.052385	2020-05-25 10:08:13.052385
10066	44	94	2		2020-05-25 10:08:13.060375	2020-05-25 10:08:13.060375
10067	33	94	4		2020-05-25 10:08:13.068769	2020-05-25 10:08:13.068769
10068	3	94	3		2020-05-25 10:08:13.074757	2020-05-25 10:08:13.074757
10069	92	94	3		2020-05-25 10:08:13.081628	2020-05-25 10:08:13.081628
10070	62	94	2		2020-05-25 10:08:13.091451	2020-05-25 10:08:13.091451
10071	24	94	2		2020-05-25 10:08:13.096067	2020-05-25 10:08:13.096067
10072	37	94	3		2020-05-25 10:08:13.103613	2020-05-25 10:08:13.103613
10073	89	94	2		2020-05-25 10:08:13.111361	2020-05-25 10:08:13.111361
10074	4	94	0		2020-05-25 10:08:13.119414	2020-05-25 10:08:13.119414
10075	58	94	4		2020-05-25 10:08:13.125842	2020-05-25 10:08:13.125842
10076	83	94	2		2020-05-25 10:08:13.132369	2020-05-25 10:08:13.132369
10077	14	94	5		2020-05-25 10:08:13.143457	2020-05-25 10:08:13.143457
10078	41	94	3		2020-05-25 10:08:13.152394	2020-05-25 10:08:13.152394
10079	53	94	2		2020-05-25 10:08:13.158142	2020-05-25 10:08:13.158142
10080	57	94	3		2020-05-25 10:08:13.165144	2020-05-25 10:08:13.165144
10081	18	94	0		2020-05-25 10:08:13.176104	2020-05-25 10:08:13.176104
10082	69	94	2		2020-05-25 10:08:13.185409	2020-05-25 10:08:13.185409
10083	85	94	0		2020-05-25 10:08:13.192687	2020-05-25 10:08:13.192687
10084	42	94	0		2020-05-25 10:08:13.19854	2020-05-25 10:08:13.19854
10085	28	94	1		2020-05-25 10:08:13.207466	2020-05-25 10:08:13.207466
10086	48	94	3		2020-05-25 10:08:13.215093	2020-05-25 10:08:13.215093
10087	6	94	0		2020-05-25 10:08:13.221815	2020-05-25 10:08:13.221815
10088	72	94	0		2020-05-25 10:08:13.229129	2020-05-25 10:08:13.229129
10089	67	94	2		2020-05-25 10:08:13.237334	2020-05-25 10:08:13.237334
10090	95	94	2		2020-05-25 10:08:13.244199	2020-05-25 10:08:13.244199
10091	84	94	2		2020-05-25 10:08:13.252767	2020-05-25 10:08:13.252767
10092	77	94	3		2020-05-25 10:08:13.260502	2020-05-25 10:08:13.260502
10093	38	94	1		2020-05-25 10:08:13.26912	2020-05-25 10:08:13.26912
10094	64	94	3		2020-05-25 10:08:13.275605	2020-05-25 10:08:13.275605
10095	94	94	1		2020-05-25 10:08:13.281934	2020-05-25 10:08:13.281934
10096	98	94	3		2020-05-25 10:08:13.291973	2020-05-25 10:08:13.291973
10097	5	94	5		2020-05-25 10:08:13.296743	2020-05-25 10:08:13.296743
10098	31	94	1		2020-05-25 10:08:13.305884	2020-05-25 10:08:13.305884
10099	23	94	2		2020-05-25 10:08:13.313574	2020-05-25 10:08:13.313574
10100	97	94	0		2020-05-25 10:08:13.321784	2020-05-25 10:08:13.321784
10101	1	94	0		2020-05-25 10:08:13.32898	2020-05-25 10:08:13.32898
10102	17	94	3		2020-05-25 10:08:13.337314	2020-05-25 10:08:13.337314
10103	73	94	3		2020-05-25 10:08:13.345008	2020-05-25 10:08:13.345008
10104	75	94	1		2020-05-25 10:08:13.352894	2020-05-25 10:08:13.352894
10105	19	94	4		2020-05-25 10:08:13.359404	2020-05-25 10:08:13.359404
10106	74	94	4		2020-05-25 10:08:13.36597	2020-05-25 10:08:13.36597
10107	50	94	1		2020-05-25 10:08:13.375721	2020-05-25 10:08:13.375721
10108	12	94	4		2020-05-25 10:08:13.384755	2020-05-25 10:08:13.384755
10109	27	94	3		2020-05-25 10:08:13.390683	2020-05-25 10:08:13.390683
10110	91	94	0		2020-05-25 10:08:13.397721	2020-05-25 10:08:13.397721
10111	39	94	0		2020-05-25 10:08:13.404521	2020-05-25 10:08:13.404521
10112	61	94	3		2020-05-25 10:08:13.411208	2020-05-25 10:08:13.411208
10113	66	94	2		2020-05-25 10:08:13.421144	2020-05-25 10:08:13.421144
10114	43	94	3		2020-05-25 10:08:13.429927	2020-05-25 10:08:13.429927
10115	46	94	3		2020-05-25 10:08:13.439315	2020-05-25 10:08:13.439315
10116	96	94	1		2020-05-25 10:08:13.469091	2020-05-25 10:08:13.469091
10117	86	94	4		2020-05-25 10:08:13.475432	2020-05-25 10:08:13.475432
10118	49	94	3		2020-05-25 10:08:13.483084	2020-05-25 10:08:13.483084
10119	11	94	4		2020-05-25 10:08:13.492662	2020-05-25 10:08:13.492662
10120	78	94	2		2020-05-25 10:08:13.497729	2020-05-25 10:08:13.497729
10121	54	94	1		2020-05-25 10:08:13.509334	2020-05-25 10:08:13.509334
10122	22	94	0		2020-05-25 10:08:13.516243	2020-05-25 10:08:13.516243
10123	16	94	1		2020-05-25 10:08:13.526171	2020-05-25 10:08:13.526171
10124	0	94	2		2020-05-25 10:08:13.535611	2020-05-25 10:08:13.535611
10125	68	94	4		2020-05-25 10:08:13.543536	2020-05-25 10:08:13.543536
10126	41	95	4		2020-05-25 10:08:13.552508	2020-05-25 10:08:13.552508
10127	26	95	1		2020-05-25 10:08:13.56406	2020-05-25 10:08:13.56406
10128	68	95	2		2020-05-25 10:08:13.571603	2020-05-25 10:08:13.571603
10129	42	95	4		2020-05-25 10:08:13.581069	2020-05-25 10:08:13.581069
10130	58	95	0		2020-05-25 10:08:13.590887	2020-05-25 10:08:13.590887
10131	14	95	5		2020-05-25 10:08:13.598248	2020-05-25 10:08:13.598248
10132	72	95	2		2020-05-25 10:08:13.607572	2020-05-25 10:08:13.607572
10133	30	95	3		2020-05-25 10:08:13.616115	2020-05-25 10:08:13.616115
10134	45	95	2		2020-05-25 10:08:13.623001	2020-05-25 10:08:13.623001
10135	18	95	3		2020-05-25 10:08:13.63027	2020-05-25 10:08:13.63027
10136	91	95	4		2020-05-25 10:08:13.638975	2020-05-25 10:08:13.638975
10137	48	95	2		2020-05-25 10:08:13.647582	2020-05-25 10:08:13.647582
10138	60	95	0		2020-05-25 10:08:13.655793	2020-05-25 10:08:13.655793
10139	52	95	2		2020-05-25 10:08:13.662655	2020-05-25 10:08:13.662655
10140	86	95	4		2020-05-25 10:08:13.67112	2020-05-25 10:08:13.67112
10141	73	95	0		2020-05-25 10:08:13.679207	2020-05-25 10:08:13.679207
10142	16	95	5		2020-05-25 10:08:13.6865	2020-05-25 10:08:13.6865
10143	46	95	0		2020-05-25 10:08:13.694162	2020-05-25 10:08:13.694162
10144	43	95	3		2020-05-25 10:08:13.702331	2020-05-25 10:08:13.702331
10145	50	95	0		2020-05-25 10:08:13.708259	2020-05-25 10:08:13.708259
10146	53	95	0		2020-05-25 10:08:13.715163	2020-05-25 10:08:13.715163
10147	64	95	2		2020-05-25 10:08:13.725326	2020-05-25 10:08:13.725326
10148	59	95	0		2020-05-25 10:08:13.729703	2020-05-25 10:08:13.729703
10149	88	95	4		2020-05-25 10:08:13.74032	2020-05-25 10:08:13.74032
10150	57	95	3		2020-05-25 10:08:13.747424	2020-05-25 10:08:13.747424
10151	39	95	0		2020-05-25 10:08:13.755012	2020-05-25 10:08:13.755012
10152	80	95	1		2020-05-25 10:08:13.761854	2020-05-25 10:08:13.761854
10153	71	95	5		2020-05-25 10:08:13.770885	2020-05-25 10:08:13.770885
10154	79	95	4		2020-05-25 10:08:13.777883	2020-05-25 10:08:13.777883
10155	34	95	0		2020-05-25 10:08:13.787463	2020-05-25 10:08:13.787463
10156	40	95	1		2020-05-25 10:08:13.795269	2020-05-25 10:08:13.795269
10157	10	95	1		2020-05-25 10:08:13.803455	2020-05-25 10:08:13.803455
10158	9	95	0		2020-05-25 10:08:13.81001	2020-05-25 10:08:13.81001
10159	65	95	2		2020-05-25 10:08:13.816371	2020-05-25 10:08:13.816371
10160	13	95	1		2020-05-25 10:08:13.826839	2020-05-25 10:08:13.826839
10161	44	95	0		2020-05-25 10:08:13.835833	2020-05-25 10:08:13.835833
10162	62	95	5		2020-05-25 10:08:13.842105	2020-05-25 10:08:13.842105
10163	32	95	1		2020-05-25 10:08:13.848669	2020-05-25 10:08:13.848669
10164	12	95	0		2020-05-25 10:08:13.859415	2020-05-25 10:08:13.859415
10165	2	95	0		2020-05-25 10:08:13.868503	2020-05-25 10:08:13.868503
10166	70	95	3		2020-05-25 10:08:13.874851	2020-05-25 10:08:13.874851
10167	47	95	0		2020-05-25 10:08:13.881326	2020-05-25 10:08:13.881326
10168	28	95	3		2020-05-25 10:08:13.890686	2020-05-25 10:08:13.890686
10169	33	95	0		2020-05-25 10:08:13.89873	2020-05-25 10:08:13.89873
10170	83	95	1		2020-05-25 10:08:13.905284	2020-05-25 10:08:13.905284
10171	19	95	3		2020-05-25 10:08:13.912468	2020-05-25 10:08:13.912468
10172	36	95	3		2020-05-25 10:08:13.921222	2020-05-25 10:08:13.921222
10173	27	95	2		2020-05-25 10:08:13.92881	2020-05-25 10:08:13.92881
10174	6	95	1		2020-05-25 10:08:13.936117	2020-05-25 10:08:13.936117
10175	25	95	0		2020-05-25 10:08:13.943973	2020-05-25 10:08:13.943973
10176	98	95	1		2020-05-25 10:08:13.952297	2020-05-25 10:08:13.952297
10177	89	95	0		2020-05-25 10:08:13.9585	2020-05-25 10:08:13.9585
10178	37	95	5		2020-05-25 10:08:13.964813	2020-05-25 10:08:13.964813
10179	61	95	0		2020-05-25 10:08:13.976	2020-05-25 10:08:13.976
10180	5	95	4		2020-05-25 10:08:13.980391	2020-05-25 10:08:13.980391
10181	4	95	1		2020-05-25 10:08:13.989753	2020-05-25 10:08:13.989753
10182	66	95	1		2020-05-25 10:08:13.997263	2020-05-25 10:08:13.997263
10183	23	95	3		2020-05-25 10:08:14.005657	2020-05-25 10:08:14.005657
10184	21	95	5		2020-05-25 10:08:14.012751	2020-05-25 10:08:14.012751
10185	95	95	4		2020-05-25 10:08:14.019374	2020-05-25 10:08:14.019374
10186	96	95	3		2020-05-25 10:08:14.027476	2020-05-25 10:08:14.027476
10187	31	95	2		2020-05-25 10:08:14.03618	2020-05-25 10:08:14.03618
10188	54	95	1		2020-05-25 10:08:14.043228	2020-05-25 10:08:14.043228
10189	84	96	2		2020-05-25 10:08:14.05205	2020-05-25 10:08:14.05205
10190	63	96	1		2020-05-25 10:08:14.05985	2020-05-25 10:08:14.05985
10191	97	96	1		2020-05-25 10:08:14.068663	2020-05-25 10:08:14.068663
10192	96	96	0		2020-05-25 10:08:14.074998	2020-05-25 10:08:14.074998
10193	52	96	2		2020-05-25 10:08:14.081395	2020-05-25 10:08:14.081395
10194	83	96	0		2020-05-25 10:08:14.090236	2020-05-25 10:08:14.090236
10195	15	96	3		2020-05-25 10:08:14.098104	2020-05-25 10:08:14.098104
10196	11	96	2		2020-05-25 10:08:14.103977	2020-05-25 10:08:14.103977
10197	85	96	0		2020-05-25 10:08:14.111267	2020-05-25 10:08:14.111267
10198	73	96	2		2020-05-25 10:08:14.120176	2020-05-25 10:08:14.120176
10199	25	96	3		2020-05-25 10:08:14.128252	2020-05-25 10:08:14.128252
10200	2	96	0		2020-05-25 10:08:14.135981	2020-05-25 10:08:14.135981
10201	8	96	5		2020-05-25 10:08:14.142005	2020-05-25 10:08:14.142005
10202	94	96	2		2020-05-25 10:08:14.149522	2020-05-25 10:08:14.149522
10203	20	96	4		2020-05-25 10:08:14.159765	2020-05-25 10:08:14.159765
10204	64	96	2		2020-05-25 10:08:14.168489	2020-05-25 10:08:14.168489
10205	6	96	4		2020-05-25 10:08:14.175039	2020-05-25 10:08:14.175039
10206	7	96	1		2020-05-25 10:08:14.181769	2020-05-25 10:08:14.181769
10207	26	96	3		2020-05-25 10:08:14.192713	2020-05-25 10:08:14.192713
10208	77	96	4		2020-05-25 10:08:14.201582	2020-05-25 10:08:14.201582
10209	35	96	1		2020-05-25 10:08:14.207783	2020-05-25 10:08:14.207783
10210	50	96	1		2020-05-25 10:08:14.214745	2020-05-25 10:08:14.214745
10211	4	96	4		2020-05-25 10:08:14.223616	2020-05-25 10:08:14.223616
10212	39	96	1		2020-05-25 10:08:14.231526	2020-05-25 10:08:14.231526
10213	58	96	3		2020-05-25 10:08:14.238542	2020-05-25 10:08:14.238542
10214	82	96	3		2020-05-25 10:08:14.245807	2020-05-25 10:08:14.245807
10215	86	96	2		2020-05-25 10:08:14.253835	2020-05-25 10:08:14.253835
10216	54	96	5		2020-05-25 10:08:14.260995	2020-05-25 10:08:14.260995
10217	23	96	5		2020-05-25 10:08:14.269226	2020-05-25 10:08:14.269226
10218	3	96	3		2020-05-25 10:08:14.277532	2020-05-25 10:08:14.277532
10219	53	96	4		2020-05-25 10:08:14.285985	2020-05-25 10:08:14.285985
10220	57	96	5		2020-05-25 10:08:14.292174	2020-05-25 10:08:14.292174
10221	87	96	4		2020-05-25 10:08:14.298897	2020-05-25 10:08:14.298897
10222	33	96	2		2020-05-25 10:08:14.308768	2020-05-25 10:08:14.308768
10223	0	96	4		2020-05-25 10:08:14.313245	2020-05-25 10:08:14.313245
10224	49	96	4		2020-05-25 10:08:14.322673	2020-05-25 10:08:14.322673
10225	80	96	1		2020-05-25 10:08:14.330236	2020-05-25 10:08:14.330236
10226	67	96	5		2020-05-25 10:08:14.338426	2020-05-25 10:08:14.338426
10227	46	96	4		2020-05-25 10:08:14.345008	2020-05-25 10:08:14.345008
10228	47	96	4		2020-05-25 10:08:14.353415	2020-05-25 10:08:14.353415
10229	95	96	4		2020-05-25 10:08:14.361178	2020-05-25 10:08:14.361178
10230	29	96	2		2020-05-25 10:08:14.369221	2020-05-25 10:08:14.369221
10231	38	96	3		2020-05-25 10:08:14.375061	2020-05-25 10:08:14.375061
10232	81	96	2		2020-05-25 10:08:14.382045	2020-05-25 10:08:14.382045
10233	91	96	5		2020-05-25 10:08:14.392164	2020-05-25 10:08:14.392164
10234	78	96	5		2020-05-25 10:08:14.396738	2020-05-25 10:08:14.396738
10235	22	96	1		2020-05-25 10:08:14.406786	2020-05-25 10:08:14.406786
10236	75	96	5		2020-05-25 10:08:14.413961	2020-05-25 10:08:14.413961
10237	51	96	4		2020-05-25 10:08:14.421422	2020-05-25 10:08:14.421422
10238	19	96	0		2020-05-25 10:08:14.42985	2020-05-25 10:08:14.42985
10239	76	96	0		2020-05-25 10:08:14.437094	2020-05-25 10:08:14.437094
10240	14	96	2		2020-05-25 10:08:14.44504	2020-05-25 10:08:14.44504
10241	1	96	1		2020-05-25 10:08:14.452718	2020-05-25 10:08:14.452718
10242	45	96	4		2020-05-25 10:08:14.458661	2020-05-25 10:08:14.458661
10243	24	96	4		2020-05-25 10:08:14.465847	2020-05-25 10:08:14.465847
10244	88	96	2		2020-05-25 10:08:14.47622	2020-05-25 10:08:14.47622
10245	32	96	3		2020-05-25 10:08:14.481163	2020-05-25 10:08:14.481163
10246	62	96	0		2020-05-25 10:08:14.490945	2020-05-25 10:08:14.490945
10247	28	96	4		2020-05-25 10:08:14.498584	2020-05-25 10:08:14.498584
10248	72	96	3		2020-05-25 10:08:14.511269	2020-05-25 10:08:14.511269
10249	71	96	0		2020-05-25 10:08:14.519724	2020-05-25 10:08:14.519724
10250	27	96	1		2020-05-25 10:08:14.526886	2020-05-25 10:08:14.526886
10251	66	96	4		2020-05-25 10:08:14.537078	2020-05-25 10:08:14.537078
10252	13	96	4		2020-05-25 10:08:14.545	2020-05-25 10:08:14.545
10253	36	96	4		2020-05-25 10:08:14.553904	2020-05-25 10:08:14.553904
10254	90	96	1		2020-05-25 10:08:14.559765	2020-05-25 10:08:14.559765
10255	69	96	5		2020-05-25 10:08:14.569452	2020-05-25 10:08:14.569452
10256	74	96	0		2020-05-25 10:08:14.577713	2020-05-25 10:08:14.577713
10257	16	96	2		2020-05-25 10:08:14.586661	2020-05-25 10:08:14.586661
10258	99	96	0		2020-05-25 10:08:14.593428	2020-05-25 10:08:14.593428
10259	34	96	4		2020-05-25 10:08:14.602507	2020-05-25 10:08:14.602507
10260	42	96	2		2020-05-25 10:08:14.610425	2020-05-25 10:08:14.610425
10261	37	96	4		2020-05-25 10:08:14.618826	2020-05-25 10:08:14.618826
10262	65	96	1		2020-05-25 10:08:14.625017	2020-05-25 10:08:14.625017
10263	61	96	3		2020-05-25 10:08:14.631464	2020-05-25 10:08:14.631464
10264	9	96	1		2020-05-25 10:08:14.641553	2020-05-25 10:08:14.641553
10265	59	96	1		2020-05-25 10:08:14.646921	2020-05-25 10:08:14.646921
10266	68	96	3		2020-05-25 10:08:14.657608	2020-05-25 10:08:14.657608
10267	70	96	1		2020-05-25 10:08:14.664873	2020-05-25 10:08:14.664873
10268	10	96	2		2020-05-25 10:08:14.674536	2020-05-25 10:08:14.674536
10269	60	96	3		2020-05-25 10:08:14.703387	2020-05-25 10:08:14.703387
10270	40	96	0		2020-05-25 10:08:14.709836	2020-05-25 10:08:14.709836
10271	21	96	0		2020-05-25 10:08:14.71904	2020-05-25 10:08:14.71904
10272	41	96	4		2020-05-25 10:08:14.727178	2020-05-25 10:08:14.727178
10273	18	96	2		2020-05-25 10:08:14.735178	2020-05-25 10:08:14.735178
10274	89	96	1		2020-05-25 10:08:14.741154	2020-05-25 10:08:14.741154
10275	92	96	1		2020-05-25 10:08:14.748452	2020-05-25 10:08:14.748452
10276	79	96	4		2020-05-25 10:08:14.758799	2020-05-25 10:08:14.758799
10277	48	96	2		2020-05-25 10:08:14.763274	2020-05-25 10:08:14.763274
10278	30	96	5		2020-05-25 10:08:14.773163	2020-05-25 10:08:14.773163
10279	98	96	1		2020-05-25 10:08:14.780273	2020-05-25 10:08:14.780273
10280	93	96	0		2020-05-25 10:08:14.787959	2020-05-25 10:08:14.787959
10281	44	96	3		2020-05-25 10:08:14.795435	2020-05-25 10:08:14.795435
10282	17	96	4		2020-05-25 10:08:14.802716	2020-05-25 10:08:14.802716
10283	43	96	1		2020-05-25 10:08:14.810897	2020-05-25 10:08:14.810897
10284	31	96	0		2020-05-25 10:08:14.819383	2020-05-25 10:08:14.819383
10285	56	96	4		2020-05-25 10:08:14.825851	2020-05-25 10:08:14.825851
10286	5	96	4		2020-05-25 10:08:14.832321	2020-05-25 10:08:14.832321
10287	12	96	0		2020-05-25 10:08:14.842437	2020-05-25 10:08:14.842437
10288	55	96	3		2020-05-25 10:08:14.847195	2020-05-25 10:08:14.847195
10289	81	97	2		2020-05-25 10:08:14.856463	2020-05-25 10:08:14.856463
10290	6	97	2		2020-05-25 10:08:14.86412	2020-05-25 10:08:14.86412
10291	32	97	5		2020-05-25 10:08:14.872134	2020-05-25 10:08:14.872134
10292	95	97	4		2020-05-25 10:08:14.879796	2020-05-25 10:08:14.879796
10293	0	97	4		2020-05-25 10:08:14.888423	2020-05-25 10:08:14.888423
10294	87	97	5		2020-05-25 10:08:14.895725	2020-05-25 10:08:14.895725
10295	65	97	1		2020-05-25 10:08:14.904458	2020-05-25 10:08:14.904458
10296	91	97	2		2020-05-25 10:08:14.912272	2020-05-25 10:08:14.912272
10297	57	97	5		2020-05-25 10:08:14.918475	2020-05-25 10:08:14.918475
10298	71	97	4		2020-05-25 10:08:14.926409	2020-05-25 10:08:14.926409
10299	85	97	2		2020-05-25 10:08:14.935219	2020-05-25 10:08:14.935219
10300	11	97	4		2020-05-25 10:08:14.941503	2020-05-25 10:08:14.941503
10301	24	97	4		2020-05-25 10:08:14.948033	2020-05-25 10:08:14.948033
10302	83	97	2		2020-05-25 10:08:14.956756	2020-05-25 10:08:14.956756
10303	15	97	4		2020-05-25 10:08:14.964444	2020-05-25 10:08:14.964444
10304	45	97	3		2020-05-25 10:08:14.970831	2020-05-25 10:08:14.970831
10305	92	97	2		2020-05-25 10:08:14.978155	2020-05-25 10:08:14.978155
10306	52	97	2		2020-05-25 10:08:14.987055	2020-05-25 10:08:14.987055
10307	9	97	4		2020-05-25 10:08:14.995245	2020-05-25 10:08:14.995245
10308	44	97	1		2020-05-25 10:08:15.004935	2020-05-25 10:08:15.004935
10309	21	97	3		2020-05-25 10:08:15.011258	2020-05-25 10:08:15.011258
10310	36	97	2		2020-05-25 10:08:15.019331	2020-05-25 10:08:15.019331
10311	18	97	3		2020-05-25 10:08:15.02774	2020-05-25 10:08:15.02774
10312	76	97	5		2020-05-25 10:08:15.035477	2020-05-25 10:08:15.035477
10313	69	97	0		2020-05-25 10:08:15.043843	2020-05-25 10:08:15.043843
10314	72	97	1		2020-05-25 10:08:15.052467	2020-05-25 10:08:15.052467
10315	20	97	3		2020-05-25 10:08:15.060586	2020-05-25 10:08:15.060586
10316	75	97	4		2020-05-25 10:08:15.068039	2020-05-25 10:08:15.068039
10317	99	97	0		2020-05-25 10:08:15.075375	2020-05-25 10:08:15.075375
10318	80	97	3		2020-05-25 10:08:15.08155	2020-05-25 10:08:15.08155
10319	2	97	2		2020-05-25 10:08:15.091421	2020-05-25 10:08:15.091421
10320	68	97	4		2020-05-25 10:08:15.099093	2020-05-25 10:08:15.099093
10321	88	97	4		2020-05-25 10:08:15.110165	2020-05-25 10:08:15.110165
10322	93	97	3		2020-05-25 10:08:15.118995	2020-05-25 10:08:15.118995
10323	22	97	0		2020-05-25 10:08:15.127025	2020-05-25 10:08:15.127025
10324	38	97	1		2020-05-25 10:08:15.135674	2020-05-25 10:08:15.135674
10325	51	97	3		2020-05-25 10:08:15.14385	2020-05-25 10:08:15.14385
10326	40	97	1		2020-05-25 10:08:15.151571	2020-05-25 10:08:15.151571
10327	29	97	4		2020-05-25 10:08:15.158881	2020-05-25 10:08:15.158881
10328	74	97	3		2020-05-25 10:08:15.164702	2020-05-25 10:08:15.164702
10329	49	97	0		2020-05-25 10:08:15.174372	2020-05-25 10:08:15.174372
10330	94	97	3		2020-05-25 10:08:15.182051	2020-05-25 10:08:15.182051
10331	43	97	3		2020-05-25 10:08:15.192975	2020-05-25 10:08:15.192975
10332	5	97	0		2020-05-25 10:08:15.202119	2020-05-25 10:08:15.202119
10333	54	97	5		2020-05-25 10:08:15.210271	2020-05-25 10:08:15.210271
10334	46	97	4		2020-05-25 10:08:15.215303	2020-05-25 10:08:15.215303
10335	50	99	1		2020-05-25 10:08:15.224922	2020-05-25 10:08:15.224922
10336	32	99	4		2020-05-25 10:08:15.232455	2020-05-25 10:08:15.232455
10337	57	99	1		2020-05-25 10:08:15.244018	2020-05-25 10:08:15.244018
10338	99	99	2		2020-05-25 10:08:15.252502	2020-05-25 10:08:15.252502
10339	6	99	0		2020-05-25 10:08:15.260862	2020-05-25 10:08:15.260862
10340	72	99	4		2020-05-25 10:08:15.265807	2020-05-25 10:08:15.265807
10341	84	99	0		2020-05-25 10:08:15.276451	2020-05-25 10:08:15.276451
10342	5	99	3		2020-05-25 10:08:15.285481	2020-05-25 10:08:15.285481
10343	90	100	2		2020-05-25 10:08:15.293684	2020-05-25 10:08:15.293684
10344	21	100	5		2020-05-25 10:08:15.302715	2020-05-25 10:08:15.302715
10345	97	100	5		2020-05-25 10:08:15.310507	2020-05-25 10:08:15.310507
10346	96	100	3		2020-05-25 10:08:15.317902	2020-05-25 10:08:15.317902
10347	73	100	4		2020-05-25 10:08:15.326261	2020-05-25 10:08:15.326261
10348	74	100	0		2020-05-25 10:08:15.331876	2020-05-25 10:08:15.331876
10349	11	100	0		2020-05-25 10:08:15.341598	2020-05-25 10:08:15.341598
10350	46	100	5		2020-05-25 10:08:15.349086	2020-05-25 10:08:15.349086
10351	19	100	2		2020-05-25 10:08:15.360218	2020-05-25 10:08:15.360218
10352	72	100	0		2020-05-25 10:08:15.369871	2020-05-25 10:08:15.369871
10353	62	100	2		2020-05-25 10:08:15.378422	2020-05-25 10:08:15.378422
10354	3	100	0		2020-05-25 10:08:15.386497	2020-05-25 10:08:15.386497
10355	20	100	1		2020-05-25 10:08:15.394504	2020-05-25 10:08:15.394504
10356	39	100	2		2020-05-25 10:08:15.403522	2020-05-25 10:08:15.403522
10357	92	100	0		2020-05-25 10:08:15.412407	2020-05-25 10:08:15.412407
10358	93	100	4		2020-05-25 10:08:15.419667	2020-05-25 10:08:15.419667
10359	56	100	0		2020-05-25 10:08:15.428044	2020-05-25 10:08:15.428044
10360	88	100	5		2020-05-25 10:08:15.435568	2020-05-25 10:08:15.435568
10361	51	100	2		2020-05-25 10:08:15.442574	2020-05-25 10:08:15.442574
10362	25	100	1		2020-05-25 10:08:15.453916	2020-05-25 10:08:15.453916
10363	8	100	1		2020-05-25 10:08:15.461961	2020-05-25 10:08:15.461961
10364	14	100	5		2020-05-25 10:08:15.471268	2020-05-25 10:08:15.471268
10365	28	100	0		2020-05-25 10:08:15.479722	2020-05-25 10:08:15.479722
10366	54	100	1		2020-05-25 10:08:15.486628	2020-05-25 10:08:15.486628
10367	30	100	4		2020-05-25 10:08:15.495397	2020-05-25 10:08:15.495397
10368	64	100	3		2020-05-25 10:08:15.506202	2020-05-25 10:08:15.506202
10369	59	100	0		2020-05-25 10:08:15.514309	2020-05-25 10:08:15.514309
10370	0	100	0		2020-05-25 10:08:15.522385	2020-05-25 10:08:15.522385
10371	17	100	1		2020-05-25 10:08:15.529162	2020-05-25 10:08:15.529162
10372	60	100	4		2020-05-25 10:08:15.538332	2020-05-25 10:08:15.538332
10373	44	100	3		2020-05-25 10:08:15.546387	2020-05-25 10:08:15.546387
10374	26	100	4		2020-05-25 10:08:15.554461	2020-05-25 10:08:15.554461
10375	35	100	0		2020-05-25 10:08:15.561668	2020-05-25 10:08:15.561668
10376	6	100	4		2020-05-25 10:08:15.570276	2020-05-25 10:08:15.570276
10377	82	100	2		2020-05-25 10:08:15.5785	2020-05-25 10:08:15.5785
10378	52	100	3		2020-05-25 10:08:15.586153	2020-05-25 10:08:15.586153
10379	40	100	0		2020-05-25 10:08:15.592359	2020-05-25 10:08:15.592359
10380	75	100	3		2020-05-25 10:08:15.60285	2020-05-25 10:08:15.60285
10381	77	100	0		2020-05-25 10:08:15.610665	2020-05-25 10:08:15.610665
10382	78	100	2		2020-05-25 10:08:15.61964	2020-05-25 10:08:15.61964
10383	13	100	2		2020-05-25 10:08:15.626178	2020-05-25 10:08:15.626178
10384	42	100	5		2020-05-25 10:08:15.635484	2020-05-25 10:08:15.635484
10385	32	100	2		2020-05-25 10:08:15.643553	2020-05-25 10:08:15.643553
10386	71	100	0		2020-05-25 10:08:15.65198	2020-05-25 10:08:15.65198
10387	22	100	4		2020-05-25 10:08:15.658662	2020-05-25 10:08:15.658662
10388	4	100	3		2020-05-25 10:08:15.664787	2020-05-25 10:08:15.664787
10389	69	100	2		2020-05-25 10:08:15.67363	2020-05-25 10:08:15.67363
10390	5	100	1		2020-05-25 10:08:15.681929	2020-05-25 10:08:15.681929
10391	86	100	5		2020-05-25 10:08:15.688144	2020-05-25 10:08:15.688144
10392	68	100	0		2020-05-25 10:08:15.695377	2020-05-25 10:08:15.695377
10393	80	100	4		2020-05-25 10:08:15.703977	2020-05-25 10:08:15.703977
10394	41	100	3		2020-05-25 10:08:15.711692	2020-05-25 10:08:15.711692
10395	55	100	3		2020-05-25 10:08:15.719204	2020-05-25 10:08:15.719204
10396	84	100	0		2020-05-25 10:08:15.727244	2020-05-25 10:08:15.727244
10397	61	100	2		2020-05-25 10:08:15.735449	2020-05-25 10:08:15.735449
10398	49	100	4		2020-05-25 10:08:15.741581	2020-05-25 10:08:15.741581
10399	79	100	5		2020-05-25 10:08:15.748657	2020-05-25 10:08:15.748657
10400	33	100	3		2020-05-25 10:08:15.759106	2020-05-25 10:08:15.759106
10401	83	100	3		2020-05-25 10:08:15.763713	2020-05-25 10:08:15.763713
10402	58	100	0		2020-05-25 10:08:15.773353	2020-05-25 10:08:15.773353
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: togatherculture
--

COPY public.schema_migrations (version) FROM stdin;
20200221014326
20200520025944
20200520025948
20200520025953
20200520030731
20200520153226
20200521162849
20200522091720
20200522094210
20200522113426
20200523052309
20200523065930
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: togatherculture
--

COPY public.users (id, email, password, password_digest, auth_token, reset_token, student_name, student_number, teacher_number, is_mail_verified, is_instructor, is_student, is_professor, last_actived_at, stars_score, reviews_count, customer_count, created_at, updated_at) FROM stdin;
101	demo@gmail.com	\N	$2a$12$QdB1YbjupoywH29p2r4gM.OIFuC8dckPNm4/pzE3Q3s9dTA7K.pMW	eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDEsImV4cCI6MTU5MDY0OTQwNn0.PG5juN3gosZO-hRgmfTWT9Mb3-UWyH4MMubwR-Mpw3I		demo			f	f	f	f	\N	0	0	0	2020-05-25 07:03:15.021035	2020-05-25 07:03:26.766529
1	1997roylee@gmail.com	\N	$2a$12$bDqPC9zdz7IXXnaEfaOr9.oGhWfzfkG4FC9zwazmbBXAvTzyT3tY.	eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTEyODI5MTd9.Jt9y0WPfWbPAmzL0HHEAu3TY5oGI68mFGjvi4IDFIqo		Roy Lei 123213			f	f	f	f	\N	0	0	0	2020-05-24 11:42:16.195631	2020-06-01 15:05:44.434888
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togatherculture
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togatherculture
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, true);


--
-- Name: assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togatherculture
--

SELECT pg_catalog.setval('public.assignments_id_seq', 1, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togatherculture
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togatherculture
--

SELECT pg_catalog.setval('public.comments_id_seq', 3, true);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togatherculture
--

SELECT pg_catalog.setval('public.courses_id_seq', 100, true);


--
-- Name: enrols_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togatherculture
--

SELECT pg_catalog.setval('public.enrols_id_seq', 9, true);


--
-- Name: lectures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togatherculture
--

SELECT pg_catalog.setval('public.lectures_id_seq', 4, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togatherculture
--

SELECT pg_catalog.setval('public.notifications_id_seq', 2, true);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togatherculture
--

SELECT pg_catalog.setval('public.ratings_id_seq', 10402, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: togatherculture
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: enrols enrols_pkey; Type: CONSTRAINT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.enrols
    ADD CONSTRAINT enrols_pkey PRIMARY KEY (id);


--
-- Name: lectures lectures_pkey; Type: CONSTRAINT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_assignments_on_lecture_id; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_assignments_on_lecture_id ON public.assignments USING btree (lecture_id);


--
-- Name: index_categories_on_cateogry_name; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE UNIQUE INDEX index_categories_on_cateogry_name ON public.categories USING btree (category_name);


--
-- Name: index_categories_on_parent_id; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_categories_on_parent_id ON public.categories USING btree (parent_id);


--
-- Name: index_courses_on_category_id; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_courses_on_category_id ON public.courses USING btree (category_id);


--
-- Name: index_courses_on_course_number; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE UNIQUE INDEX index_courses_on_course_number ON public.courses USING btree (course_number);


--
-- Name: index_courses_on_is_active; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_courses_on_is_active ON public.courses USING btree (is_active);


--
-- Name: index_courses_on_is_public; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_courses_on_is_public ON public.courses USING btree (is_public);


--
-- Name: index_enrols_on_course_id; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_enrols_on_course_id ON public.enrols USING btree (course_id);


--
-- Name: index_enrols_on_course_id_n_user_id; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE UNIQUE INDEX index_enrols_on_course_id_n_user_id ON public.enrols USING btree (user_id, course_id);


--
-- Name: index_enrols_on_user_id; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_enrols_on_user_id ON public.enrols USING btree (user_id);


--
-- Name: index_lectures_on_course_id; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_lectures_on_course_id ON public.lectures USING btree (course_id);


--
-- Name: index_notifications_on_target_id; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_notifications_on_target_id ON public.notifications USING btree (target_id);


--
-- Name: index_notifications_on_user_id; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_notifications_on_user_id ON public.notifications USING btree (user_id);


--
-- Name: index_ratings_on_course_id; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_ratings_on_course_id ON public.ratings USING btree (course_id);


--
-- Name: index_ratings_on_course_id_n_user_id; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE UNIQUE INDEX index_ratings_on_course_id_n_user_id ON public.ratings USING btree (user_id, course_id);


--
-- Name: index_ratings_on_user_id; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_ratings_on_user_id ON public.ratings USING btree (user_id);


--
-- Name: index_users_on_auth_token; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_users_on_auth_token ON public.users USING btree (auth_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_is_instructor; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_users_on_is_instructor ON public.users USING btree (is_instructor);


--
-- Name: index_users_on_is_mail_verified; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_users_on_is_mail_verified ON public.users USING btree (is_mail_verified);


--
-- Name: index_users_on_is_professor; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_users_on_is_professor ON public.users USING btree (is_professor);


--
-- Name: index_users_on_is_student; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_users_on_is_student ON public.users USING btree (is_student);


--
-- Name: index_users_on_last_actived_at; Type: INDEX; Schema: public; Owner: togatherculture
--

CREATE INDEX index_users_on_last_actived_at ON public.users USING btree (last_actived_at);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: togatherculture
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

