--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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
-- Name: expenses; Type: TABLE; Schema: public; Owner: joelbarton
--

CREATE TABLE public.expenses (
    id integer NOT NULL,
    amount numeric(6,2) NOT NULL,
    memo text NOT NULL,
    created_on date DEFAULT now() NOT NULL,
    CONSTRAINT expenses_amount_check CHECK ((amount > 0.01))
);


ALTER TABLE public.expenses OWNER TO joelbarton;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: joelbarton
--

CREATE SEQUENCE public.expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenses_id_seq OWNER TO joelbarton;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joelbarton
--

ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: joelbarton
--

COPY public.expenses (id, amount, memo, created_on) FROM stdin;
1	14.56	Pencils	2022-06-30
2	3.29	Coffee	2022-06-30
3	49.99	Text Editor	2022-06-30
5	4.50	Coffee	2022-06-30
7	0.02	OnlyFans	2022-06-30
\.


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joelbarton
--

SELECT pg_catalog.setval('public.expenses_id_seq', 7, true);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

