--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12
-- Dumped by pg_dump version 16.4

-- Started on 2024-08-13 14:32:47

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 213 (class 1259 OID 16410)
-- Name: basketball; Type: TABLE; Schema: public; Owner: citizix_user
--

CREATE TABLE public.basketball (
    id integer NOT NULL,
    name character varying(50),
    surname character varying(50),
    volleyball_id integer
);


ALTER TABLE public.basketball OWNER TO citizix_user;

--
-- TOC entry 210 (class 1259 OID 16386)
-- Name: customer; Type: TABLE; Schema: public; Owner: citizix_user
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100)
);


ALTER TABLE public.customer OWNER TO citizix_user;

--
-- TOC entry 209 (class 1259 OID 16385)
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: citizix_user
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_id_seq OWNER TO citizix_user;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 209
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: citizix_user
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- TOC entry 215 (class 1259 OID 16423)
-- Name: dd; Type: TABLE; Schema: public; Owner: citizix_user
--

CREATE TABLE public.dd (
);


ALTER TABLE public.dd OWNER TO citizix_user;

--
-- TOC entry 211 (class 1259 OID 16395)
-- Name: football; Type: TABLE; Schema: public; Owner: citizix_user
--

CREATE TABLE public.football (
    id integer NOT NULL,
    name character varying(50),
    surname character varying(50)
);


ALTER TABLE public.football OWNER TO citizix_user;

--
-- TOC entry 212 (class 1259 OID 16405)
-- Name: volleyball; Type: TABLE; Schema: public; Owner: citizix_user
--

CREATE TABLE public.volleyball (
    id integer NOT NULL,
    name character varying(50),
    surname character varying(50)
);


ALTER TABLE public.volleyball OWNER TO citizix_user;

--
-- TOC entry 3247 (class 2604 OID 16429)
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: citizix_user
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- TOC entry 3402 (class 0 OID 16410)
-- Dependencies: 213
-- Data for Name: basketball; Type: TABLE DATA; Schema: public; Owner: citizix_user
--

INSERT INTO public.basketball VALUES (1, 'Nathan', 'Scott', 1);
INSERT INTO public.basketball VALUES (2, 'Steph', 'Curry', 2);
INSERT INTO public.basketball VALUES (3, 'Lebron', 'James', 3);
INSERT INTO public.basketball VALUES (23, 'Nathan', 'Scott', 1);
INSERT INTO public.basketball VALUES (99, 'Steph', 'Curry', 2);
INSERT INTO public.basketball VALUES (39, 'Lebron', 'James', 3);


--
-- TOC entry 3399 (class 0 OID 16386)
-- Dependencies: 210
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: citizix_user
--

INSERT INTO public.customer VALUES (1, 'John', 'Doe', 'john.doe@example.com');


--
-- TOC entry 3403 (class 0 OID 16423)
-- Dependencies: 215
-- Data for Name: dd; Type: TABLE DATA; Schema: public; Owner: citizix_user
--



--
-- TOC entry 3400 (class 0 OID 16395)
-- Dependencies: 211
-- Data for Name: football; Type: TABLE DATA; Schema: public; Owner: citizix_user
--

INSERT INTO public.football VALUES (1, 'David', 'Beckham');
INSERT INTO public.football VALUES (2, 'Lionel', 'Messi');
INSERT INTO public.football VALUES (3, 'Cristiano', 'Ronaldo');


--
-- TOC entry 3401 (class 0 OID 16405)
-- Dependencies: 212
-- Data for Name: volleyball; Type: TABLE DATA; Schema: public; Owner: citizix_user
--

INSERT INTO public.volleyball VALUES (1, 'Naz', 'Akyol');
INSERT INTO public.volleyball VALUES (2, 'Hande', 'Baladin');
INSERT INTO public.volleyball VALUES (3, 'Jordan', 'Larson');
INSERT INTO public.volleyball VALUES (11, 'Naz', 'Akyol');
INSERT INTO public.volleyball VALUES (7, 'Hande', 'Baladin');
INSERT INTO public.volleyball VALUES (9, 'Jordan', 'Larson');


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 209
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: citizix_user
--

SELECT pg_catalog.setval('public.customer_id_seq', 1, true);


--
-- TOC entry 3257 (class 2606 OID 16414)
-- Name: basketball basketball_pkey; Type: CONSTRAINT; Schema: public; Owner: citizix_user
--

ALTER TABLE ONLY public.basketball
    ADD CONSTRAINT basketball_pkey PRIMARY KEY (id);


--
-- TOC entry 3249 (class 2606 OID 16393)
-- Name: customer customer_email_key; Type: CONSTRAINT; Schema: public; Owner: citizix_user
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_email_key UNIQUE (email);


--
-- TOC entry 3251 (class 2606 OID 16391)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: citizix_user
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 16399)
-- Name: football football_pkey; Type: CONSTRAINT; Schema: public; Owner: citizix_user
--

ALTER TABLE ONLY public.football
    ADD CONSTRAINT football_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 16409)
-- Name: volleyball volleyball_pkey; Type: CONSTRAINT; Schema: public; Owner: citizix_user
--

ALTER TABLE ONLY public.volleyball
    ADD CONSTRAINT volleyball_pkey PRIMARY KEY (id);


--
-- TOC entry 3258 (class 2606 OID 16415)
-- Name: basketball basketball_volleyball_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: citizix_user
--

ALTER TABLE ONLY public.basketball
    ADD CONSTRAINT basketball_volleyball_id_fkey FOREIGN KEY (volleyball_id) REFERENCES public.volleyball(id);


-- Completed on 2024-08-13 14:32:47

--
-- PostgreSQL database dump complete
--

