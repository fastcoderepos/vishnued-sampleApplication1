--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14
-- Dumped by pg_dump version 10.14

-- Started on 2021-01-16 10:44:31

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
-- TOC entry 196 (class 1259 OID 18409)
-- Name: actor_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

DROP SCHEMA IF EXISTS public CASCADE;

CREATE SCHEMA public;

CREATE SEQUENCE public.actor_actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actor_actor_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 18411)
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    actor_id integer DEFAULT nextval('public.actor_actor_id_seq'::regclass) NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 18416)
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_address_id_seq OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 18418)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    address_id integer DEFAULT nextval('public.address_address_id_seq'::regclass) NOT NULL,
    address character varying(50) NOT NULL,
    address2 character varying(50),
    district character varying(20) NOT NULL,
    city_id smallint NOT NULL,
    postal_code character varying(10),
    phone character varying(20) NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 18423)
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 18425)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer DEFAULT nextval('public.category_category_id_seq'::regclass) NOT NULL,
    name character varying(25) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 18430)
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_city_id_seq OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 18432)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    city_id integer DEFAULT nextval('public.city_city_id_seq'::regclass) NOT NULL,
    city character varying(50) NOT NULL,
    country_id smallint NOT NULL
);


ALTER TABLE public.city OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 18437)
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_country_id_seq OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 18439)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    country_id integer DEFAULT nextval('public.country_country_id_seq'::regclass) NOT NULL,
    country character varying(50) NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 18444)
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 18446)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer DEFAULT nextval('public.customer_customer_id_seq'::regclass) NOT NULL,
    store_id smallint NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(50),
    address_id smallint NOT NULL,
    activebool boolean DEFAULT true NOT NULL,
    active integer
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 18453)
-- Name: film_film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.film_film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_film_id_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 18455)
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
    film_id integer DEFAULT nextval('public.film_film_id_seq'::regclass) NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    release_year integer,
    language_id smallint NOT NULL,
    rental_duration smallint DEFAULT 3 NOT NULL,
    rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
    length smallint,
    replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
    rating character varying(255)
);


ALTER TABLE public.film OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 18466)
-- Name: film_actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_actor (
    actor_id integer NOT NULL,
    film_id integer NOT NULL
);


ALTER TABLE public.film_actor OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 18470)
-- Name: film_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_category (
    film_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.film_category OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 18474)
-- Name: inventory_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_inventory_id_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 18476)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    inventory_id integer DEFAULT nextval('public.inventory_inventory_id_seq'::regclass) NOT NULL,
    film_id smallint NOT NULL,
    store_id smallint NOT NULL
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 18481)
-- Name: language_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.language_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_language_id_seq OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 18483)
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language (
    language_id integer DEFAULT nextval('public.language_language_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.language OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18488)
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_payment_id_seq OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18490)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id integer DEFAULT nextval('public.payment_payment_id_seq'::regclass) NOT NULL,
    customer_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    rental_id integer NOT NULL,
    amount numeric(5,2) NOT NULL,
    payment_date date NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18494)
-- Name: rental_rental_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_rental_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rental_rental_id_seq OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18496)
-- Name: rental; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental (
    rental_id integer DEFAULT nextval('public.rental_rental_id_seq'::regclass) NOT NULL,
    rental_date date NOT NULL,
    inventory_id integer NOT NULL,
    customer_id smallint NOT NULL,
    return_date date,
    staff_id smallint NOT NULL
);


ALTER TABLE public.rental OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18501)
-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_staff_id_seq OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18503)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staff_id integer DEFAULT nextval('public.staff_staff_id_seq'::regclass) NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    address_id smallint NOT NULL,
    email character varying(50),
    store_id smallint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    username character varying(16) NOT NULL,
    password character varying(40)
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18512)
-- Name: store_store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_store_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_store_id_seq OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18514)
-- Name: store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store (
    store_id integer DEFAULT nextval('public.store_store_id_seq'::regclass) NOT NULL,
    manager_staff_id smallint NOT NULL,
    address_id smallint NOT NULL
);


ALTER TABLE public.store OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 18411)
-- Dependencies: 197
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.actor VALUES (1, 'Penelope', 'Guiness');
INSERT INTO public.actor VALUES (2, 'Nick', 'Wahlberg');
INSERT INTO public.actor VALUES (3, 'Ed', 'Chase');
INSERT INTO public.actor VALUES (4, 'Jennifer', 'Davis');
INSERT INTO public.actor VALUES (5, 'Johnny', 'Lollobrigida');
INSERT INTO public.actor VALUES (6, 'Bette', 'Nicholson');
INSERT INTO public.actor VALUES (7, 'Grace', 'Mostel');
INSERT INTO public.actor VALUES (8, 'Matthew', 'Johansson');
INSERT INTO public.actor VALUES (9, 'Joe', 'Swank');
INSERT INTO public.actor VALUES (10, 'Christian', 'Gable');
INSERT INTO public.actor VALUES (11, 'Zero', 'Cage');
INSERT INTO public.actor VALUES (12, 'Karl', 'Berry');
INSERT INTO public.actor VALUES (13, 'Uma', 'Wood');
INSERT INTO public.actor VALUES (14, 'Vivien', 'Bergen');
INSERT INTO public.actor VALUES (15, 'Cuba', 'Olivier');
INSERT INTO public.actor VALUES (16, 'Fred', 'Costner');
INSERT INTO public.actor VALUES (17, 'Helen', 'Voight');
INSERT INTO public.actor VALUES (18, 'Dan', 'Torn');
INSERT INTO public.actor VALUES (19, 'Bob', 'Fawcett');
INSERT INTO public.actor VALUES (20, 'Lucille', 'Tracy');
INSERT INTO public.actor VALUES (21, 'Kirsten', 'Paltrow');
INSERT INTO public.actor VALUES (22, 'Elvis', 'Marx');
INSERT INTO public.actor VALUES (23, 'Sandra', 'Kilmer');
INSERT INTO public.actor VALUES (24, 'Cameron', 'Streep');
INSERT INTO public.actor VALUES (25, 'Kevin', 'Bloom');
INSERT INTO public.actor VALUES (26, 'Rip', 'Crawford');
INSERT INTO public.actor VALUES (27, 'Julia', 'Mcqueen');
INSERT INTO public.actor VALUES (28, 'Woody', 'Hoffman');
INSERT INTO public.actor VALUES (29, 'Alec', 'Wayne');
INSERT INTO public.actor VALUES (30, 'Sandra', 'Peck');
INSERT INTO public.actor VALUES (31, 'Sissy', 'Sobieski');
INSERT INTO public.actor VALUES (32, 'Tim', 'Hackman');
INSERT INTO public.actor VALUES (33, 'Milla', 'Peck');
INSERT INTO public.actor VALUES (34, 'Audrey', 'Olivier');
INSERT INTO public.actor VALUES (35, 'Judy', 'Dean');
INSERT INTO public.actor VALUES (36, 'Burt', 'Dukakis');
INSERT INTO public.actor VALUES (37, 'Val', 'Bolger');
INSERT INTO public.actor VALUES (38, 'Tom', 'Mckellen');
INSERT INTO public.actor VALUES (39, 'Goldie', 'Brody');
INSERT INTO public.actor VALUES (40, 'Johnny', 'Cage');
INSERT INTO public.actor VALUES (41, 'Jodie', 'Degeneres');
INSERT INTO public.actor VALUES (42, 'Tom', 'Miranda');
INSERT INTO public.actor VALUES (43, 'Kirk', 'Jovovich');
INSERT INTO public.actor VALUES (44, 'Nick', 'Stallone');
INSERT INTO public.actor VALUES (45, 'Reese', 'Kilmer');
INSERT INTO public.actor VALUES (46, 'Parker', 'Goldberg');
INSERT INTO public.actor VALUES (47, 'Julia', 'Barrymore');
INSERT INTO public.actor VALUES (48, 'Frances', 'Day-Lewis');
INSERT INTO public.actor VALUES (49, 'Anne', 'Cronyn');
INSERT INTO public.actor VALUES (50, 'Natalie', 'Hopkins');
INSERT INTO public.actor VALUES (51, 'Gary', 'Phoenix');
INSERT INTO public.actor VALUES (52, 'Carmen', 'Hunt');
INSERT INTO public.actor VALUES (53, 'Mena', 'Temple');
INSERT INTO public.actor VALUES (54, 'Penelope', 'Pinkett');
INSERT INTO public.actor VALUES (55, 'Fay', 'Kilmer');
INSERT INTO public.actor VALUES (56, 'Dan', 'Harris');
INSERT INTO public.actor VALUES (57, 'Jude', 'Cruise');
INSERT INTO public.actor VALUES (58, 'Christian', 'Akroyd');
INSERT INTO public.actor VALUES (59, 'Dustin', 'Tautou');
INSERT INTO public.actor VALUES (60, 'Henry', 'Berry');
INSERT INTO public.actor VALUES (61, 'Christian', 'Neeson');
INSERT INTO public.actor VALUES (62, 'Jayne', 'Neeson');
INSERT INTO public.actor VALUES (63, 'Cameron', 'Wray');
INSERT INTO public.actor VALUES (64, 'Ray', 'Johansson');
INSERT INTO public.actor VALUES (65, 'Angela', 'Hudson');
INSERT INTO public.actor VALUES (66, 'Mary', 'Tandy');
INSERT INTO public.actor VALUES (67, 'Jessica', 'Bailey');
INSERT INTO public.actor VALUES (68, 'Rip', 'Winslet');
INSERT INTO public.actor VALUES (69, 'Kenneth', 'Paltrow');
INSERT INTO public.actor VALUES (70, 'Michelle', 'Mcconaughey');
INSERT INTO public.actor VALUES (71, 'Adam', 'Grant');
INSERT INTO public.actor VALUES (72, 'Sean', 'Williams');
INSERT INTO public.actor VALUES (73, 'Gary', 'Penn');
INSERT INTO public.actor VALUES (74, 'Milla', 'Keitel');
INSERT INTO public.actor VALUES (75, 'Burt', 'Posey');
INSERT INTO public.actor VALUES (76, 'Angelina', 'Astaire');
INSERT INTO public.actor VALUES (77, 'Cary', 'Mcconaughey');
INSERT INTO public.actor VALUES (78, 'Groucho', 'Sinatra');
INSERT INTO public.actor VALUES (79, 'Mae', 'Hoffman');
INSERT INTO public.actor VALUES (80, 'Ralph', 'Cruz');
INSERT INTO public.actor VALUES (81, 'Scarlett', 'Damon');
INSERT INTO public.actor VALUES (82, 'Woody', 'Jolie');
INSERT INTO public.actor VALUES (83, 'Ben', 'Willis');
INSERT INTO public.actor VALUES (84, 'James', 'Pitt');
INSERT INTO public.actor VALUES (85, 'Minnie', 'Zellweger');
INSERT INTO public.actor VALUES (143, 'River', 'Dean');
INSERT INTO public.actor VALUES (86, 'Greg', 'Chaplin');
INSERT INTO public.actor VALUES (87, 'Spencer', 'Peck');
INSERT INTO public.actor VALUES (88, 'Kenneth', 'Pesci');
INSERT INTO public.actor VALUES (89, 'Charlize', 'Dench');
INSERT INTO public.actor VALUES (90, 'Sean', 'Guiness');
INSERT INTO public.actor VALUES (91, 'Christopher', 'Berry');
INSERT INTO public.actor VALUES (92, 'Kirsten', 'Akroyd');
INSERT INTO public.actor VALUES (93, 'Ellen', 'Presley');
INSERT INTO public.actor VALUES (94, 'Kenneth', 'Torn');
INSERT INTO public.actor VALUES (95, 'Daryl', 'Wahlberg');
INSERT INTO public.actor VALUES (96, 'Gene', 'Willis');
INSERT INTO public.actor VALUES (97, 'Meg', 'Hawke');
INSERT INTO public.actor VALUES (98, 'Chris', 'Bridges');
INSERT INTO public.actor VALUES (99, 'Jim', 'Mostel');
INSERT INTO public.actor VALUES (100, 'Spencer', 'Depp');
INSERT INTO public.actor VALUES (101, 'Susan', 'Davis');
INSERT INTO public.actor VALUES (102, 'Walter', 'Torn');
INSERT INTO public.actor VALUES (103, 'Matthew', 'Leigh');
INSERT INTO public.actor VALUES (104, 'Penelope', 'Cronyn');
INSERT INTO public.actor VALUES (105, 'Sidney', 'Crowe');
INSERT INTO public.actor VALUES (106, 'Groucho', 'Dunst');
INSERT INTO public.actor VALUES (107, 'Gina', 'Degeneres');
INSERT INTO public.actor VALUES (108, 'Warren', 'Nolte');
INSERT INTO public.actor VALUES (109, 'Sylvester', 'Dern');
INSERT INTO public.actor VALUES (110, 'Susan', 'Davis');
INSERT INTO public.actor VALUES (111, 'Cameron', 'Zellweger');
INSERT INTO public.actor VALUES (112, 'Russell', 'Bacall');
INSERT INTO public.actor VALUES (113, 'Morgan', 'Hopkins');
INSERT INTO public.actor VALUES (114, 'Morgan', 'Mcdormand');
INSERT INTO public.actor VALUES (115, 'Harrison', 'Bale');
INSERT INTO public.actor VALUES (116, 'Dan', 'Streep');
INSERT INTO public.actor VALUES (117, 'Renee', 'Tracy');
INSERT INTO public.actor VALUES (118, 'Cuba', 'Allen');
INSERT INTO public.actor VALUES (119, 'Warren', 'Jackman');
INSERT INTO public.actor VALUES (120, 'Penelope', 'Monroe');
INSERT INTO public.actor VALUES (121, 'Liza', 'Bergman');
INSERT INTO public.actor VALUES (122, 'Salma', 'Nolte');
INSERT INTO public.actor VALUES (123, 'Julianne', 'Dench');
INSERT INTO public.actor VALUES (124, 'Scarlett', 'Bening');
INSERT INTO public.actor VALUES (125, 'Albert', 'Nolte');
INSERT INTO public.actor VALUES (126, 'Frances', 'Tomei');
INSERT INTO public.actor VALUES (127, 'Kevin', 'Garland');
INSERT INTO public.actor VALUES (128, 'Cate', 'Mcqueen');
INSERT INTO public.actor VALUES (129, 'Daryl', 'Crawford');
INSERT INTO public.actor VALUES (130, 'Greta', 'Keitel');
INSERT INTO public.actor VALUES (131, 'Jane', 'Jackman');
INSERT INTO public.actor VALUES (132, 'Adam', 'Hopper');
INSERT INTO public.actor VALUES (133, 'Richard', 'Penn');
INSERT INTO public.actor VALUES (134, 'Gene', 'Hopkins');
INSERT INTO public.actor VALUES (135, 'Rita', 'Reynolds');
INSERT INTO public.actor VALUES (136, 'Ed', 'Mansfield');
INSERT INTO public.actor VALUES (137, 'Morgan', 'Williams');
INSERT INTO public.actor VALUES (138, 'Lucille', 'Dee');
INSERT INTO public.actor VALUES (139, 'Ewan', 'Gooding');
INSERT INTO public.actor VALUES (140, 'Whoopi', 'Hurt');
INSERT INTO public.actor VALUES (141, 'Cate', 'Harris');
INSERT INTO public.actor VALUES (142, 'Jada', 'Ryder');
INSERT INTO public.actor VALUES (144, 'Angela', 'Witherspoon');
INSERT INTO public.actor VALUES (145, 'Kim', 'Allen');
INSERT INTO public.actor VALUES (146, 'Albert', 'Johansson');
INSERT INTO public.actor VALUES (147, 'Fay', 'Winslet');
INSERT INTO public.actor VALUES (148, 'Emily', 'Dee');
INSERT INTO public.actor VALUES (149, 'Russell', 'Temple');
INSERT INTO public.actor VALUES (150, 'Jayne', 'Nolte');
INSERT INTO public.actor VALUES (151, 'Geoffrey', 'Heston');
INSERT INTO public.actor VALUES (152, 'Ben', 'Harris');
INSERT INTO public.actor VALUES (153, 'Minnie', 'Kilmer');
INSERT INTO public.actor VALUES (154, 'Meryl', 'Gibson');
INSERT INTO public.actor VALUES (155, 'Ian', 'Tandy');
INSERT INTO public.actor VALUES (156, 'Fay', 'Wood');
INSERT INTO public.actor VALUES (157, 'Greta', 'Malden');
INSERT INTO public.actor VALUES (158, 'Vivien', 'Basinger');
INSERT INTO public.actor VALUES (159, 'Laura', 'Brody');
INSERT INTO public.actor VALUES (160, 'Chris', 'Depp');
INSERT INTO public.actor VALUES (161, 'Harvey', 'Hope');
INSERT INTO public.actor VALUES (162, 'Oprah', 'Kilmer');
INSERT INTO public.actor VALUES (163, 'Christopher', 'West');
INSERT INTO public.actor VALUES (164, 'Humphrey', 'Willis');
INSERT INTO public.actor VALUES (165, 'Al', 'Garland');
INSERT INTO public.actor VALUES (166, 'Nick', 'Degeneres');
INSERT INTO public.actor VALUES (167, 'Laurence', 'Bullock');
INSERT INTO public.actor VALUES (168, 'Will', 'Wilson');
INSERT INTO public.actor VALUES (169, 'Kenneth', 'Hoffman');
INSERT INTO public.actor VALUES (170, 'Mena', 'Hopper');
INSERT INTO public.actor VALUES (171, 'Olympia', 'Pfeiffer');
INSERT INTO public.actor VALUES (172, 'Groucho', 'Williams');
INSERT INTO public.actor VALUES (173, 'Alan', 'Dreyfuss');
INSERT INTO public.actor VALUES (174, 'Michael', 'Bening');
INSERT INTO public.actor VALUES (175, 'William', 'Hackman');
INSERT INTO public.actor VALUES (176, 'Jon', 'Chase');
INSERT INTO public.actor VALUES (177, 'Gene', 'Mckellen');
INSERT INTO public.actor VALUES (178, 'Lisa', 'Monroe');
INSERT INTO public.actor VALUES (179, 'Ed', 'Guiness');
INSERT INTO public.actor VALUES (180, 'Jeff', 'Silverstone');
INSERT INTO public.actor VALUES (181, 'Matthew', 'Carrey');
INSERT INTO public.actor VALUES (182, 'Debbie', 'Akroyd');
INSERT INTO public.actor VALUES (183, 'Russell', 'Close');
INSERT INTO public.actor VALUES (184, 'Humphrey', 'Garland');
INSERT INTO public.actor VALUES (185, 'Michael', 'Bolger');
INSERT INTO public.actor VALUES (186, 'Julia', 'Zellweger');
INSERT INTO public.actor VALUES (187, 'Renee', 'Ball');
INSERT INTO public.actor VALUES (188, 'Rock', 'Dukakis');
INSERT INTO public.actor VALUES (189, 'Cuba', 'Birch');
INSERT INTO public.actor VALUES (190, 'Audrey', 'Bailey');
INSERT INTO public.actor VALUES (191, 'Gregory', 'Gooding');
INSERT INTO public.actor VALUES (192, 'John', 'Suvari');
INSERT INTO public.actor VALUES (193, 'Burt', 'Temple');
INSERT INTO public.actor VALUES (194, 'Meryl', 'Allen');
INSERT INTO public.actor VALUES (195, 'Jayne', 'Silverstone');
INSERT INTO public.actor VALUES (196, 'Bela', 'Walken');
INSERT INTO public.actor VALUES (197, 'Reese', 'West');
INSERT INTO public.actor VALUES (198, 'Mary', 'Keitel');
INSERT INTO public.actor VALUES (199, 'Julia', 'Fawcett');
INSERT INTO public.actor VALUES (200, 'Thora', 'Temple');


--
-- TOC entry 2960 (class 0 OID 18418)
-- Dependencies: 199
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.address VALUES (1, '47 MySakila Drive', NULL, 'Alberta', 300, '', '');
INSERT INTO public.address VALUES (2, '28 MySQL Boulevard', NULL, 'QLD', 576, '', '');
INSERT INTO public.address VALUES (3, '23 Workhaven Lane', NULL, 'Alberta', 300, '', '14033335568');
INSERT INTO public.address VALUES (4, '1411 Lillydale Drive', NULL, 'QLD', 576, '', '6172235589');
INSERT INTO public.address VALUES (5, '1913 Hanoi Way', '', 'Nagasaki', 463, '35200', '28303384290');
INSERT INTO public.address VALUES (6, '1121 Loja Avenue', '', 'California', 449, '17886', '838635286649');
INSERT INTO public.address VALUES (7, '692 Joliet Street', '', 'Attika', 38, '83579', '448477190408');
INSERT INTO public.address VALUES (8, '1566 Inegl Manor', '', 'Mandalay', 349, '53561', '705814003527');
INSERT INTO public.address VALUES (9, '53 Idfu Parkway', '', 'Nantou', 361, '42399', '10655648674');
INSERT INTO public.address VALUES (10, '1795 Santiago de Compostela Way', '', 'Texas', 295, '18743', '860452626434');
INSERT INTO public.address VALUES (11, '900 Santiago de Compostela Parkway', '', 'Central Serbia', 280, '93896', '716571220373');
INSERT INTO public.address VALUES (12, '478 Joliet Way', '', 'Hamilton', 200, '77948', '657282285970');
INSERT INTO public.address VALUES (13, '613 Korolev Drive', '', 'Masqat', 329, '45844', '380657522649');
INSERT INTO public.address VALUES (14, '1531 Sal Drive', '', 'Esfahan', 162, '53628', '648856936185');
INSERT INTO public.address VALUES (15, '1542 Tarlac Parkway', '', 'Kanagawa', 440, '1027', '635297277345');
INSERT INTO public.address VALUES (16, '808 Bhopal Manor', '', 'Haryana', 582, '10672', '465887807014');
INSERT INTO public.address VALUES (17, '270 Amroha Parkway', '', 'Osmaniye', 384, '29610', '695479687538');
INSERT INTO public.address VALUES (18, '770 Bydgoszcz Avenue', '', 'California', 120, '16266', '517338314235');
INSERT INTO public.address VALUES (19, '419 Iligan Lane', '', 'Madhya Pradesh', 76, '72878', '990911107354');
INSERT INTO public.address VALUES (20, '360 Toulouse Parkway', '', 'England', 495, '54308', '949312333307');
INSERT INTO public.address VALUES (21, '270 Toulon Boulevard', '', 'Kalmykia', 156, '81766', '407752414682');
INSERT INTO public.address VALUES (22, '320 Brest Avenue', '', 'Kaduna', 252, '43331', '747791594069');
INSERT INTO public.address VALUES (23, '1417 Lancaster Avenue', '', 'Northern Cape', 267, '72192', '272572357893');
INSERT INTO public.address VALUES (24, '1688 Okara Way', '', 'Nothwest Border Prov', 327, '21954', '144453869132');
INSERT INTO public.address VALUES (25, '262 A Corua (La Corua) Parkway', '', 'Dhaka', 525, '34418', '892775750063');
INSERT INTO public.address VALUES (26, '28 Charlotte Amalie Street', '', 'Rabat-Sal-Zammour-Z', 443, '37551', '161968374323');
INSERT INTO public.address VALUES (27, '1780 Hino Boulevard', '', 'Liepaja', 303, '7716', '902731229323');
INSERT INTO public.address VALUES (28, '96 Tafuna Way', '', 'Crdoba', 128, '99865', '934730187245');
INSERT INTO public.address VALUES (29, '934 San Felipe de Puerto Plata Street', '', 'Sind', 472, '99780', '196495945706');
INSERT INTO public.address VALUES (30, '18 Duisburg Boulevard', '', '', 121, '58327', '998009777982');
INSERT INTO public.address VALUES (31, '217 Botshabelo Place', '', 'Southern Mindanao', 138, '49521', '665356572025');
INSERT INTO public.address VALUES (32, '1425 Shikarpur Manor', '', 'Bihar', 346, '65599', '678220867005');
INSERT INTO public.address VALUES (33, '786 Aurora Avenue', '', 'Yamaguchi', 474, '65750', '18461860151');
INSERT INTO public.address VALUES (34, '1668 Anpolis Street', '', 'Taipei', 316, '50199', '525255540978');
INSERT INTO public.address VALUES (35, '33 Gorontalo Way', '', 'West Bengali', 257, '30348', '745994947458');
INSERT INTO public.address VALUES (36, '176 Mandaluyong Place', '', 'Uttar Pradesh', 239, '65213', '627705991774');
INSERT INTO public.address VALUES (37, '127 Purnea (Purnia) Manor', '', 'Piemonte', 17, '79388', '911872220378');
INSERT INTO public.address VALUES (38, '61 Tama Street', '', 'Okayama', 284, '94065', '708403338270');
INSERT INTO public.address VALUES (39, '391 Callao Drive', '', 'Midi-Pyrnes', 544, '34021', '440512153169');
INSERT INTO public.address VALUES (40, '334 Munger (Monghyr) Lane', '', 'Markazi', 31, '38145', '481183273622');
INSERT INTO public.address VALUES (41, '1440 Fukuyama Loop', '', 'Henan', 362, '47929', '912257250465');
INSERT INTO public.address VALUES (42, '269 Cam Ranh Parkway', '', 'Chisinau', 115, '34689', '489783829737');
INSERT INTO public.address VALUES (43, '306 Antofagasta Place', '', 'Esprito Santo', 569, '3989', '378318851631');
INSERT INTO public.address VALUES (44, '671 Graz Street', '', 'Oriental', 353, '94399', '680768868518');
INSERT INTO public.address VALUES (45, '42 Brindisi Place', '', 'Yerevan', 586, '16744', '42384721397');
INSERT INTO public.address VALUES (46, '1632 Bislig Avenue', '', 'Nonthaburi', 394, '61117', '471675840679');
INSERT INTO public.address VALUES (47, '1447 Imus Way', '', 'Tahiti', 167, '48942', '539758313890');
INSERT INTO public.address VALUES (48, '1998 Halifax Drive', '', 'Lipetsk', 308, '76022', '177727722820');
INSERT INTO public.address VALUES (49, '1718 Valencia Street', '', 'Antofagasta', 27, '37359', '675292816413');
INSERT INTO public.address VALUES (50, '46 Pjatigorsk Lane', '', 'Moscow (City)', 343, '23616', '262076994845');
INSERT INTO public.address VALUES (51, '686 Garland Manor', '', 'Cear', 247, '52535', '69493378813');
INSERT INTO public.address VALUES (52, '909 Garland Manor', '', 'Tatarstan', 367, '69367', '705800322606');
INSERT INTO public.address VALUES (53, '725 Isesaki Place', '', 'Mekka', 237, '74428', '876295323994');
INSERT INTO public.address VALUES (54, '115 Hidalgo Parkway', '', 'Khartum', 379, '80168', '307703950263');
INSERT INTO public.address VALUES (55, '1135 Izumisano Parkway', '', 'California', 171, '48150', '171822533480');
INSERT INTO public.address VALUES (56, '939 Probolinggo Loop', '', 'Galicia', 1, '4166', '680428310138');
INSERT INTO public.address VALUES (57, '17 Kabul Boulevard', '', 'Chiba', 355, '38594', '697760867968');
INSERT INTO public.address VALUES (58, '1964 Allappuzha (Alleppey) Street', '', 'Yamaguchi', 227, '48980', '920811325222');
INSERT INTO public.address VALUES (59, '1697 Kowloon and New Kowloon Loop', '', 'Moskova', 49, '57807', '499352017190');
INSERT INTO public.address VALUES (60, '1668 Saint Louis Place', '', 'Tahiti', 397, '39072', '347487831378');
INSERT INTO public.address VALUES (61, '943 Tokat Street', '', 'Vaduz', 560, '45428', '889318963672');
INSERT INTO public.address VALUES (62, '1114 Liepaja Street', '', 'Sarawak', 282, '69226', '212869228936');
INSERT INTO public.address VALUES (63, '1213 Ranchi Parkway', '', 'Karnataka', 350, '94352', '800024380485');
INSERT INTO public.address VALUES (64, '81 Hodeida Way', '', 'Rajasthan', 231, '55561', '250767749542');
INSERT INTO public.address VALUES (65, '915 Ponce Place', '', 'Basel-Stadt', 56, '83980', '1395251317');
INSERT INTO public.address VALUES (66, '1717 Guadalajara Lane', '', 'Missouri', 441, '85505', '914090181665');
INSERT INTO public.address VALUES (67, '1214 Hanoi Way', '', 'Nebraska', 306, '67055', '491001136577');
INSERT INTO public.address VALUES (68, '1966 Amroha Avenue', '', 'Sichuan', 139, '70385', '333489324603');
INSERT INTO public.address VALUES (69, '698 Otsu Street', '', 'Cayenne', 105, '71110', '409983924481');
INSERT INTO public.address VALUES (70, '1150 Kimchon Manor', '', 'Skne ln', 321, '96109', '663449333709');
INSERT INTO public.address VALUES (71, '1586 Guaruj Place', '', 'Hunan', 579, '5135', '947233365992');
INSERT INTO public.address VALUES (72, '57 Arlington Manor', '', 'Madhya Pradesh', 475, '48960', '990214419142');
INSERT INTO public.address VALUES (73, '1031 Daugavpils Parkway', '', 'Bchar', 63, '59025', '107137400143');
INSERT INTO public.address VALUES (74, '1124 Buenaventura Drive', '', 'Mekka', 13, '6856', '407733804223');
INSERT INTO public.address VALUES (75, '492 Cam Ranh Street', '', 'Eastern Visayas', 61, '50805', '565018274456');
INSERT INTO public.address VALUES (76, '89 Allappuzha (Alleppey) Manor', '', 'National Capital Reg', 517, '75444', '255800440636');
INSERT INTO public.address VALUES (77, '1947 Poos de Caldas Boulevard', '', 'Chiayi', 114, '60951', '427454485876');
INSERT INTO public.address VALUES (78, '1206 Dos Quebradas Place', '', 'So Paulo', 431, '20207', '241832790687');
INSERT INTO public.address VALUES (79, '1551 Rampur Lane', '', 'Changhwa', 108, '72394', '251164340471');
INSERT INTO public.address VALUES (80, '602 Paarl Street', '', 'Pavlodar', 402, '98889', '896314772871');
INSERT INTO public.address VALUES (81, '1692 Ede Loop', '', 'So Paulo', 30, '9223', '918711376618');
INSERT INTO public.address VALUES (82, '936 Salzburg Lane', '', 'Uttar Pradesh', 425, '96709', '875756771675');
INSERT INTO public.address VALUES (83, '586 Tete Way', '', 'Kanagawa', 256, '1079', '18581624103');
INSERT INTO public.address VALUES (84, '1888 Kabul Drive', '', 'Oyo & Osun', 217, '20936', '701457319790');
INSERT INTO public.address VALUES (85, '320 Baiyin Parkway', '', 'Mahajanga', 319, '37307', '223664661973');
INSERT INTO public.address VALUES (86, '927 Baha Blanca Parkway', '', 'Krim', 479, '9495', '821972242086');
INSERT INTO public.address VALUES (87, '929 Tallahassee Loop', '', 'Gauteng', 497, '74671', '800716535041');
INSERT INTO public.address VALUES (88, '125 Citt del Vaticano Boulevard', '', 'Puebla', 40, '67912', '48417642933');
INSERT INTO public.address VALUES (89, '1557 Ktahya Boulevard', '', 'England', 88, '88002', '720998247660');
INSERT INTO public.address VALUES (90, '870 Ashqelon Loop', '', 'Songkhla', 489, '84931', '135117278909');
INSERT INTO public.address VALUES (91, '1740 Portoviejo Avenue', '', 'Sucre', 480, '29932', '198123170793');
INSERT INTO public.address VALUES (92, '1942 Ciparay Parkway', '', 'Cheju', 113, '82624', '978987363654');
INSERT INTO public.address VALUES (93, '1926 El Alto Avenue', '', 'Buenos Aires', 289, '75543', '846225459260');
INSERT INTO public.address VALUES (94, '1952 Chatsworth Drive', '', 'Guangdong', 332, '25958', '991562402283');
INSERT INTO public.address VALUES (95, '1370 Le Mans Avenue', '', 'Brunei and Muara', 53, '52163', '345679835036');
INSERT INTO public.address VALUES (96, '984 Effon-Alaiye Avenue', '', 'Gois', 183, '17119', '132986892228');
INSERT INTO public.address VALUES (97, '832 Nakhon Sawan Manor', '', 'Inner Mongolia', 592, '49021', '275595571388');
INSERT INTO public.address VALUES (98, '152 Kitwe Parkway', '', 'Caraga', 82, '53182', '835433605312');
INSERT INTO public.address VALUES (99, '1697 Tanauan Lane', '', 'Punjab', 399, '22870', '4764773857');
INSERT INTO public.address VALUES (100, '1308 Arecibo Way', '', 'Georgia', 41, '30695', '6171054059');
INSERT INTO public.address VALUES (101, '1599 Plock Drive', '', 'Tete', 534, '71986', '817248913162');
INSERT INTO public.address VALUES (102, '669 Firozabad Loop', '', 'Abu Dhabi', 12, '92265', '412903167998');
INSERT INTO public.address VALUES (103, '588 Vila Velha Manor', '', 'Kyongsangbuk', 268, '51540', '333339908719');
INSERT INTO public.address VALUES (104, '1913 Kamakura Place', '', 'Lipetsk', 238, '97287', '942570536750');
INSERT INTO public.address VALUES (105, '733 Mandaluyong Place', '', 'Asir', 2, '77459', '196568435814');
INSERT INTO public.address VALUES (106, '659 Vaduz Drive', '', 'Ha Darom', 34, '49708', '709935135487');
INSERT INTO public.address VALUES (107, '1177 Jelets Way', '', 'Kwara & Kogi', 220, '3305', '484292626944');
INSERT INTO public.address VALUES (108, '1386 Yangor Avenue', '', 'Provence-Alpes-Cte', 543, '80720', '449216226468');
INSERT INTO public.address VALUES (109, '454 Nakhon Sawan Boulevard', '', 'Funafuti', 173, '76383', '963887147572');
INSERT INTO public.address VALUES (110, '1867 San Juan Bautista Tuxtepec Avenue', '', 'Ivanovo', 225, '78311', '547003310357');
INSERT INTO public.address VALUES (111, '1532 Dzerzinsk Way', '', 'Buenos Aires', 334, '9599', '330838016880');
INSERT INTO public.address VALUES (112, '1002 Ahmadnagar Manor', '', 'Mxico', 213, '93026', '371490777743');
INSERT INTO public.address VALUES (113, '682 Junan Way', '', 'North West', 273, '30418', '622255216127');
INSERT INTO public.address VALUES (114, '804 Elista Drive', '', 'Hubei', 159, '61069', '379804592943');
INSERT INTO public.address VALUES (115, '1378 Alvorada Avenue', '', 'Distrito Federal', 102, '75834', '272234298332');
INSERT INTO public.address VALUES (116, '793 Cam Ranh Avenue', '', 'California', 292, '87057', '824370924746');
INSERT INTO public.address VALUES (117, '1079 Tel Aviv-Jaffa Boulevard', '', 'Sucre', 132, '10885', '358178933857');
INSERT INTO public.address VALUES (118, '442 Rae Bareli Place', '', 'Nordrhein-Westfalen', 148, '24321', '886636413768');
INSERT INTO public.address VALUES (119, '1107 Nakhon Sawan Avenue', '', 'Mxico', 365, '75149', '867546627903');
INSERT INTO public.address VALUES (120, '544 Malm Parkway', '', 'Central Java', 403, '63502', '386759646229');
INSERT INTO public.address VALUES (121, '1967 Sincelejo Place', '', 'Gujarat', 176, '73644', '577812616052');
INSERT INTO public.address VALUES (122, '333 Goinia Way', '', 'Texas', 185, '78625', '909029256431');
INSERT INTO public.address VALUES (123, '1987 Coacalco de Berriozbal Loop', '', 'al-Qalyubiya', 476, '96065', '787654415858');
INSERT INTO public.address VALUES (124, '241 Mosul Lane', '', 'Risaralda', 147, '76157', '765345144779');
INSERT INTO public.address VALUES (125, '211 Chiayi Drive', '', 'Uttar Pradesh', 164, '58186', '665993880048');
INSERT INTO public.address VALUES (126, '1175 Tanauan Way', '', 'Lima', 305, '64615', '937222955822');
INSERT INTO public.address VALUES (127, '117 Boa Vista Way', '', 'Uttar Pradesh', 566, '6804', '677976133614');
INSERT INTO public.address VALUES (128, '848 Tafuna Manor', '', 'Ktahya', 281, '45142', '614935229095');
INSERT INTO public.address VALUES (129, '569 Baicheng Lane', '', 'Gauteng', 85, '60304', '490211944645');
INSERT INTO public.address VALUES (130, '1666 Qomsheh Drive', '', 'So Paulo', 410, '66255', '582835362905');
INSERT INTO public.address VALUES (131, '801 Hagonoy Drive', '', 'Smolensk', 484, '8439', '237426099212');
INSERT INTO public.address VALUES (132, '1050 Garden Grove Avenue', '', 'Slaskie', 236, '4999', '973047364353');
INSERT INTO public.address VALUES (133, '1854 Tieli Street', '', 'Shandong', 302, '15819', '509492324775');
INSERT INTO public.address VALUES (134, '758 Junan Lane', '', 'Gois', 190, '82639', '935448624185');
INSERT INTO public.address VALUES (135, '1752 So Leopoldo Parkway', '', 'Taka-Karpatia', 345, '14014', '252265130067');
INSERT INTO public.address VALUES (136, '898 Belm Manor', '', 'Free State', 87, '49757', '707169393853');
INSERT INTO public.address VALUES (137, '261 Saint Louis Way', '', 'Coahuila de Zaragoza', 541, '83401', '321944036800');
INSERT INTO public.address VALUES (138, '765 Southampton Drive', '', 'al-Qalyubiya', 421, '4285', '23712411567');
INSERT INTO public.address VALUES (139, '943 Johannesburg Avenue', '', 'Maharashtra', 417, '5892', '90921003005');
INSERT INTO public.address VALUES (140, '788 Atinsk Street', '', 'Karnataka', 211, '81691', '146497509724');
INSERT INTO public.address VALUES (141, '1749 Daxian Place', '', 'Gelderland', 29, '11044', '963369996279');
INSERT INTO public.address VALUES (142, '1587 Sullana Lane', '', 'Inner Mongolia', 207, '85769', '468060467018');
INSERT INTO public.address VALUES (143, '1029 Dzerzinsk Manor', '', 'Ynlin', 542, '57519', '33173584456');
INSERT INTO public.address VALUES (144, '1666 Beni-Mellal Place', '', 'Tennessee', 123, '13377', '9099941466');
INSERT INTO public.address VALUES (145, '928 Jaffna Loop', '', 'Hiroshima', 172, '93762', '581852137991');
INSERT INTO public.address VALUES (146, '483 Ljubertsy Parkway', '', 'Scotland', 149, '60562', '581174211853');
INSERT INTO public.address VALUES (147, '374 Bat Yam Boulevard', '', 'Kilis', 266, '97700', '923261616249');
INSERT INTO public.address VALUES (148, '1027 Songkhla Manor', '', 'Minsk', 340, '30861', '563660187896');
INSERT INTO public.address VALUES (149, '999 Sanaa Loop', '', 'Gauteng', 491, '3439', '918032330119');
INSERT INTO public.address VALUES (150, '879 Newcastle Way', '', 'Michigan', 499, '90732', '206841104594');
INSERT INTO public.address VALUES (151, '1337 Lincoln Parkway', '', 'Saitama', 555, '99457', '597815221267');
INSERT INTO public.address VALUES (152, '1952 Pune Lane', '', 'Saint-Denis', 442, '92150', '354615066969');
INSERT INTO public.address VALUES (153, '782 Mosul Street', '', 'Massachusetts', 94, '25545', '885899703621');
INSERT INTO public.address VALUES (154, '781 Shimonoseki Drive', '', 'Michoacn de Ocampo', 202, '95444', '632316273199');
INSERT INTO public.address VALUES (155, '1560 Jelets Boulevard', '', 'Shandong', 291, '77777', '189446090264');
INSERT INTO public.address VALUES (156, '1963 Moscow Place', '', 'Assam', 354, '64863', '761379480249');
INSERT INTO public.address VALUES (157, '456 Escobar Way', '', 'Jakarta Raya', 232, '36061', '719202533520');
INSERT INTO public.address VALUES (158, '798 Cianjur Avenue', '', 'Shanxi', 590, '76990', '499408708580');
INSERT INTO public.address VALUES (159, '185 Novi Sad Place', '', 'Bern', 72, '41778', '904253967161');
INSERT INTO public.address VALUES (160, '1367 Yantai Manor', '', 'Ondo & Ekiti', 381, '21294', '889538496300');
INSERT INTO public.address VALUES (161, '1386 Nakhon Sawan Boulevard', '', 'Pyongyang-si', 420, '53502', '368899174225');
INSERT INTO public.address VALUES (162, '369 Papeete Way', '', 'North Carolina', 187, '66639', '170117068815');
INSERT INTO public.address VALUES (163, '1440 Compton Place', '', 'North Austria', 307, '81037', '931059836497');
INSERT INTO public.address VALUES (164, '1623 Baha Blanca Manor', '', 'Moskova', 310, '81511', '149981248346');
INSERT INTO public.address VALUES (165, '97 Shimoga Avenue', '', 'Tel Aviv', 533, '44660', '177167004331');
INSERT INTO public.address VALUES (166, '1740 Le Mans Loop', '', 'Pays de la Loire', 297, '22853', '168476538960');
INSERT INTO public.address VALUES (167, '1287 Xiangfan Boulevard', '', 'Gifu', 253, '57844', '819416131190');
INSERT INTO public.address VALUES (168, '842 Salzburg Lane', '', 'Adana', 529, '3313', '697151428760');
INSERT INTO public.address VALUES (169, '154 Tallahassee Loop', '', 'Xinxiang', 199, '62250', '935508855935');
INSERT INTO public.address VALUES (170, '710 San Felipe del Progreso Avenue', '', 'Lilongwe', 304, '76901', '843801144113');
INSERT INTO public.address VALUES (171, '1540 Wroclaw Drive', '', 'Maharashtra', 107, '62686', '182363341674');
INSERT INTO public.address VALUES (172, '475 Atinsk Way', '', 'Gansu', 240, '59571', '201705577290');
INSERT INTO public.address VALUES (173, '1294 Firozabad Drive', '', 'Jiangxi', 407, '70618', '161801569569');
INSERT INTO public.address VALUES (174, '1877 Ezhou Lane', '', 'Rajasthan', 550, '63337', '264541743403');
INSERT INTO public.address VALUES (175, '316 Uruapan Street', '', 'Perak', 223, '58194', '275788967899');
INSERT INTO public.address VALUES (176, '29 Pyongyang Loop', '', 'Batman', 58, '47753', '734780743462');
INSERT INTO public.address VALUES (177, '1010 Klerksdorp Way', '', 'Steiermark', 186, '6802', '493008546874');
INSERT INTO public.address VALUES (178, '1848 Salala Boulevard', '', 'Miranda', 373, '25220', '48265851133');
INSERT INTO public.address VALUES (179, '431 Xiangtan Avenue', '', 'Kerala', 18, '4854', '230250973122');
INSERT INTO public.address VALUES (180, '757 Rustenburg Avenue', '', 'Skikda', 483, '89668', '506134035434');
INSERT INTO public.address VALUES (181, '146 Johannesburg Way', '', 'Tamaulipas', 330, '54132', '953689007081');
INSERT INTO public.address VALUES (182, '1891 Rizhao Boulevard', '', 'So Paulo', 456, '47288', '391065549876');
INSERT INTO public.address VALUES (183, '1089 Iwatsuki Avenue', '', 'Kirov', 270, '35109', '866092335135');
INSERT INTO public.address VALUES (184, '1410 Benin City Parkway', '', 'Risaralda', 405, '29747', '104150372603');
INSERT INTO public.address VALUES (185, '682 Garden Grove Place', '', 'Tennessee', 333, '67497', '72136330362');
INSERT INTO public.address VALUES (186, '533 al-Ayn Boulevard', '', 'California', 126, '8862', '662227486184');
INSERT INTO public.address VALUES (187, '1839 Szkesfehrvr Parkway', '', 'Gois', 317, '55709', '947468818183');
INSERT INTO public.address VALUES (188, '741 Ambattur Manor', '', 'Noord-Brabant', 438, '43310', '302590383819');
INSERT INTO public.address VALUES (189, '927 Barcelona Street', '', 'Chaharmahal va Bakht', 467, '65121', '951486492670');
INSERT INTO public.address VALUES (190, '435 0 Way', '', 'West Bengali', 195, '74750', '760171523969');
INSERT INTO public.address VALUES (191, '140 Chiayi Parkway', '', 'Sumy', 506, '38982', '855863906434');
INSERT INTO public.address VALUES (192, '1166 Changhwa Street', '', 'Caraga', 62, '58852', '650752094490');
INSERT INTO public.address VALUES (193, '891 Novi Sad Manor', '', 'Ontario', 383, '5379', '247646995453');
INSERT INTO public.address VALUES (194, '605 Rio Claro Parkway', '', 'Tabora', 513, '49348', '352469351088');
INSERT INTO public.address VALUES (195, '1077 San Felipe de Puerto Plata Place', '', 'Rostov-na-Donu', 369, '65387', '812824036424');
INSERT INTO public.address VALUES (196, '9 San Miguel de Tucumn Manor', '', 'Uttar Pradesh', 169, '90845', '956188728558');
INSERT INTO public.address VALUES (197, '447 Surakarta Loop', '', 'Nyanza', 271, '10428', '940830176580');
INSERT INTO public.address VALUES (198, '345 Oshawa Boulevard', '', 'Tokyo-to', 204, '32114', '104491201771');
INSERT INTO public.address VALUES (199, '1792 Valle de la Pascua Place', '', 'Nordrhein-Westfalen', 477, '15540', '419419591240');
INSERT INTO public.address VALUES (200, '1074 Binzhou Manor', '', 'Baden-Wrttemberg', 325, '36490', '331132568928');
INSERT INTO public.address VALUES (201, '817 Bradford Loop', '', 'Jiangsu', 109, '89459', '264286442804');
INSERT INTO public.address VALUES (202, '955 Bamenda Way', '', 'Ondo & Ekiti', 218, '1545', '768481779568');
INSERT INTO public.address VALUES (203, '1149 A Corua (La Corua) Boulevard', '', 'Haiphong', 194, '95824', '470884141195');
INSERT INTO public.address VALUES (204, '387 Mwene-Ditu Drive', '', 'Ahal', 35, '8073', '764477681869');
INSERT INTO public.address VALUES (205, '68 Molodetno Manor', '', 'Nordrhein-Westfalen', 575, '4662', '146640639760');
INSERT INTO public.address VALUES (206, '642 Nador Drive', '', 'Maharashtra', 77, '3924', '369050085652');
INSERT INTO public.address VALUES (207, '1688 Nador Lane', '', 'Sulawesi Utara', 184, '61613', '652218196731');
INSERT INTO public.address VALUES (208, '1215 Pyongyang Parkway', '', 'Usak', 557, '25238', '646237101779');
INSERT INTO public.address VALUES (209, '1679 Antofagasta Street', '', 'Alto Paran', 122, '86599', '905903574913');
INSERT INTO public.address VALUES (210, '1304 s-Hertogenbosch Way', '', 'Santa Catarina', 83, '10925', '90336226227');
INSERT INTO public.address VALUES (211, '850 Salala Loop', '', 'Kitaa', 371, '10800', '403404780639');
INSERT INTO public.address VALUES (212, '624 Oshawa Boulevard', '', 'West Bengali', 51, '89959', '49677664184');
INSERT INTO public.address VALUES (213, '43 Dadu Avenue', '', 'Rajasthan', 74, '4855', '95666951770');
INSERT INTO public.address VALUES (214, '751 Lima Loop', '', 'Aden', 7, '99405', '756460337785');
INSERT INTO public.address VALUES (215, '1333 Haldia Street', '', 'Jilin', 174, '82161', '408304391718');
INSERT INTO public.address VALUES (216, '660 Jedda Boulevard', '', 'Washington', 65, '25053', '168758068397');
INSERT INTO public.address VALUES (217, '1001 Miyakonojo Lane', '', 'Taizz', 518, '67924', '584316724815');
INSERT INTO public.address VALUES (218, '226 Brest Manor', '', 'California', 508, '2299', '785881412500');
INSERT INTO public.address VALUES (219, '1229 Valencia Parkway', '', 'Haskovo', 498, '99124', '352679173732');
INSERT INTO public.address VALUES (220, '1201 Qomsheh Manor', '', 'Gois', 28, '21464', '873492228462');
INSERT INTO public.address VALUES (221, '866 Shivapuri Manor', '', 'Uttar Pradesh', 448, '22474', '778502731092');
INSERT INTO public.address VALUES (222, '1168 Najafabad Parkway', '', 'Kabol', 251, '40301', '886649065861');
INSERT INTO public.address VALUES (223, '1244 Allappuzha (Alleppey) Place', '', 'Buenos Aires', 567, '20657', '991802825778');
INSERT INTO public.address VALUES (224, '1842 Luzinia Boulevard', '', 'Zanzibar West', 593, '94420', '706878974831');
INSERT INTO public.address VALUES (225, '1926 Gingoog Street', '', 'Sisilia', 511, '22824', '469738825391');
INSERT INTO public.address VALUES (226, '810 Palghat (Palakkad) Boulevard', '', 'Jaroslavl', 235, '73431', '516331171356');
INSERT INTO public.address VALUES (227, '1820 Maring Parkway', '', 'Punjab', 324, '88307', '99760893676');
INSERT INTO public.address VALUES (228, '60 Poos de Caldas Street', '', 'Rajasthan', 243, '82338', '963063788669');
INSERT INTO public.address VALUES (229, '1014 Loja Manor', '', 'Tamil Nadu', 22, '66851', '460795526514');
INSERT INTO public.address VALUES (230, '201 Effon-Alaiye Way', '', 'Asuncin', 37, '64344', '684192903087');
INSERT INTO public.address VALUES (231, '430 Alessandria Loop', '', 'Saarland', 439, '47446', '669828224459');
INSERT INTO public.address VALUES (232, '754 Valencia Place', '', 'Phnom Penh', 406, '87911', '594319417514');
INSERT INTO public.address VALUES (233, '356 Olomouc Manor', '', 'Gois', 26, '93323', '22326410776');
INSERT INTO public.address VALUES (234, '1256 Bislig Boulevard', '', 'Botosani', 86, '50598', '479007229460');
INSERT INTO public.address VALUES (235, '954 Kimchon Place', '', 'West Bengali', 559, '42420', '541327526474');
INSERT INTO public.address VALUES (236, '885 Yingkou Manor', '', 'Kaduna', 596, '31390', '588964509072');
INSERT INTO public.address VALUES (237, '1736 Cavite Place', '', 'Qina', 216, '98775', '431770603551');
INSERT INTO public.address VALUES (238, '346 Skikda Parkway', '', 'Hawalli', 233, '90628', '630424482919');
INSERT INTO public.address VALUES (239, '98 Stara Zagora Boulevard', '', 'Valle', 96, '76448', '610173756082');
INSERT INTO public.address VALUES (240, '1479 Rustenburg Boulevard', '', 'Southern Tagalog', 527, '18727', '727785483194');
INSERT INTO public.address VALUES (241, '647 A Corua (La Corua) Street', '', 'Chollanam', 357, '36971', '792557457753');
INSERT INTO public.address VALUES (242, '1964 Gijn Manor', '', 'Karnataka', 473, '14408', '918119601885');
INSERT INTO public.address VALUES (243, '47 Syktyvkar Lane', '', 'West Java', 118, '22236', '63937119031');
INSERT INTO public.address VALUES (244, '1148 Saarbrcken Parkway', '', 'Fukushima', 226, '1921', '137773001988');
INSERT INTO public.address VALUES (245, '1103 Bilbays Parkway', '', 'Hubei', 578, '87660', '279979529227');
INSERT INTO public.address VALUES (246, '1246 Boksburg Parkway', '', 'Hebei', 422, '28349', '890283544295');
INSERT INTO public.address VALUES (247, '1483 Pathankot Street', '', 'Tucumn', 454, '37288', '686015532180');
INSERT INTO public.address VALUES (248, '582 Papeete Loop', '', 'Central Visayas', 294, '27722', '569868543137');
INSERT INTO public.address VALUES (249, '300 Junan Street', '', 'Kyonggi', 553, '81314', '890289150158');
INSERT INTO public.address VALUES (250, '829 Grand Prairie Way', '', 'Paran', 328, '6461', '741070712873');
INSERT INTO public.address VALUES (251, '1473 Changhwa Parkway', '', 'Mxico', 124, '75933', '266798132374');
INSERT INTO public.address VALUES (252, '1309 Weifang Street', '', 'Florida', 520, '57338', '435785045362');
INSERT INTO public.address VALUES (253, '1760 Oshawa Manor', '', 'Tianjin', 535, '38140', '56257502250');
INSERT INTO public.address VALUES (254, '786 Stara Zagora Way', '', 'Oyo & Osun', 390, '98332', '716256596301');
INSERT INTO public.address VALUES (255, '1966 Tonghae Street', '', 'Anhalt Sachsen', 198, '36481', '567359279425');
INSERT INTO public.address VALUES (256, '1497 Yuzhou Drive', '', 'England', 312, '3433', '246810237916');
INSERT INTO public.address VALUES (258, '752 Ondo Loop', '', 'Miyazaki', 338, '32474', '134673576619');
INSERT INTO public.address VALUES (259, '1338 Zalantun Lane', '', 'Minas Gerais', 413, '45403', '840522972766');
INSERT INTO public.address VALUES (260, '127 Iwakuni Boulevard', '', 'Central Luzon', 192, '20777', '987442542471');
INSERT INTO public.address VALUES (261, '51 Laredo Avenue', '', 'Sagaing', 342, '68146', '884536620568');
INSERT INTO public.address VALUES (262, '771 Yaound Manor', '', 'Sofala', 64, '86768', '245477603573');
INSERT INTO public.address VALUES (263, '532 Toulon Street', '', 'Santiago', 460, '69517', '46871694740');
INSERT INTO public.address VALUES (264, '1027 Banjul Place', '', 'West Bengali', 197, '50390', '538241037443');
INSERT INTO public.address VALUES (265, '1158 Mandi Bahauddin Parkway', '', 'Shanxi', 136, '98484', '276555730211');
INSERT INTO public.address VALUES (266, '862 Xintai Lane', '', 'Cagayan Valley', 548, '30065', '265153400632');
INSERT INTO public.address VALUES (267, '816 Cayenne Parkway', '', 'Manab', 414, '93629', '282874611748');
INSERT INTO public.address VALUES (268, '1831 Nam Dinh Loop', '', 'National Capital Reg', 323, '51990', '322888976727');
INSERT INTO public.address VALUES (269, '446 Kirovo-Tepetsk Lane', '', 'Osaka', 203, '19428', '303967439816');
INSERT INTO public.address VALUES (270, '682 Halisahar Place', '', 'Severn Morava', 378, '20536', '475553436330');
INSERT INTO public.address VALUES (271, '1587 Loja Manor', '', 'Salzburg', 447, '5410', '621625204422');
INSERT INTO public.address VALUES (272, '1762 Paarl Parkway', '', 'Hunan', 298, '53928', '192459639410');
INSERT INTO public.address VALUES (273, '1519 Ilorin Place', '', 'Kerala', 395, '49298', '357445645426');
INSERT INTO public.address VALUES (274, '920 Kumbakonam Loop', '', 'California', 446, '75090', '685010736240');
INSERT INTO public.address VALUES (275, '906 Goinia Way', '', 'Wielkopolskie', 255, '83565', '701767622697');
INSERT INTO public.address VALUES (276, '1675 Xiangfan Manor', '', 'Tamil Nadu', 283, '11763', '271149517630');
INSERT INTO public.address VALUES (277, '85 San Felipe de Puerto Plata Drive', '', 'Shandong', 584, '46063', '170739645687');
INSERT INTO public.address VALUES (278, '144 South Hill Loop', '', 'Guanajuato', 445, '2012', '45387294817');
INSERT INTO public.address VALUES (279, '1884 Shikarpur Avenue', '', 'Haryana', 263, '85548', '959949395183');
INSERT INTO public.address VALUES (280, '1980 Kamjanets-Podilskyi Street', '', 'Illinois', 404, '89502', '874337098891');
INSERT INTO public.address VALUES (281, '1944 Bamenda Way', '', 'Michigan', 573, '24645', '75975221996');
INSERT INTO public.address VALUES (282, '556 Baybay Manor', '', 'Oyo & Osun', 374, '55802', '363982224739');
INSERT INTO public.address VALUES (283, '457 Tongliao Loop', '', 'Bursa', 222, '56254', '880756161823');
INSERT INTO public.address VALUES (284, '600 Bradford Street', '', 'East Azerbaidzan', 514, '96204', '117592274996');
INSERT INTO public.address VALUES (285, '1006 Santa Brbara dOeste Manor', '', 'Ondo & Ekiti', 389, '36229', '85059738746');
INSERT INTO public.address VALUES (286, '1308 Sumy Loop', '', 'Fujian', 175, '30657', '583021225407');
INSERT INTO public.address VALUES (287, '1405 Chisinau Place', '', 'Ponce', 411, '8160', '62781725285');
INSERT INTO public.address VALUES (288, '226 Halifax Street', '', 'Xinxiang', 277, '58492', '790651020929');
INSERT INTO public.address VALUES (289, '1279 Udine Parkway', '', 'Edo & Delta', 69, '75860', '195003555232');
INSERT INTO public.address VALUES (290, '1336 Benin City Drive', '', 'Shiga', 386, '46044', '341242939532');
INSERT INTO public.address VALUES (291, '1155 Liaocheng Place', '', 'Oyo & Osun', 152, '22650', '558236142492');
INSERT INTO public.address VALUES (292, '1993 Tabuk Lane', '', 'Tamil Nadu', 522, '64221', '648482415405');
INSERT INTO public.address VALUES (293, '86 Higashiosaka Lane', '', 'Guanajuato', 563, '33768', '957128697225');
INSERT INTO public.address VALUES (294, '1912 Allende Manor', '', 'Kowloon and New Kowl', 279, '58124', '172262454487');
INSERT INTO public.address VALUES (295, '544 Tarsus Boulevard', '', 'Gurico', 562, '53145', '892523334');
INSERT INTO public.address VALUES (296, '1936 Cuman Avenue', '', 'Virginia', 433, '61195', '976798660411');
INSERT INTO public.address VALUES (297, '1192 Tongliao Street', '', 'Sharja', 470, '19065', '350970907017');
INSERT INTO public.address VALUES (298, '44 Najafabad Way', '', 'Baskimaa', 146, '61391', '96604821070');
INSERT INTO public.address VALUES (299, '32 Pudukkottai Lane', '', 'Ohio', 140, '38834', '967274728547');
INSERT INTO public.address VALUES (300, '661 Chisinau Lane', '', 'Pietari', 274, '8856', '816436065431');
INSERT INTO public.address VALUES (301, '951 Stara Zagora Manor', '', 'Punjab', 400, '98573', '429925609431');
INSERT INTO public.address VALUES (302, '922 Vila Velha Loop', '', 'Maharashtra', 9, '4085', '510737228015');
INSERT INTO public.address VALUES (303, '898 Jining Lane', '', 'Pohjois-Pohjanmaa', 387, '40070', '161643343536');
INSERT INTO public.address VALUES (304, '1635 Kuwana Boulevard', '', 'Hiroshima', 205, '52137', '710603868323');
INSERT INTO public.address VALUES (305, '41 El Alto Parkway', '', 'Maharashtra', 398, '56883', '51917807050');
INSERT INTO public.address VALUES (306, '1883 Maikop Lane', '', 'Kaliningrad', 254, '68469', '96110042435');
INSERT INTO public.address VALUES (307, '1908 Gaziantep Place', '', 'Liaoning', 536, '58979', '108053751300');
INSERT INTO public.address VALUES (308, '687 Alessandria Parkway', '', 'Sanaa', 455, '57587', '407218522294');
INSERT INTO public.address VALUES (309, '827 Yuncheng Drive', '', 'Callao', 99, '79047', '504434452842');
INSERT INTO public.address VALUES (310, '913 Coacalco de Berriozbal Loop', '', 'Texas', 33, '42141', '262088367001');
INSERT INTO public.address VALUES (311, '715 So Bernardo do Campo Lane', '', 'Kedah', 507, '84804', '181179321332');
INSERT INTO public.address VALUES (312, '1354 Siegen Street', '', 'Rio de Janeiro', 25, '80184', '573441801529');
INSERT INTO public.address VALUES (313, '1191 Sungai Petani Boulevard', '', 'Missouri', 262, '9668', '983259819766');
INSERT INTO public.address VALUES (314, '1224 Huejutla de Reyes Boulevard', '', 'Lombardia', 91, '70923', '806016930576');
INSERT INTO public.address VALUES (315, '543 Bergamo Avenue', '', 'Minas Gerais', 215, '59686', '103602195112');
INSERT INTO public.address VALUES (316, '746 Joliet Lane', '', 'Kursk', 286, '94878', '688485191923');
INSERT INTO public.address VALUES (317, '780 Kimberley Way', '', 'Tabuk', 515, '17032', '824396883951');
INSERT INTO public.address VALUES (318, '1774 Yaound Place', '', 'Hubei', 166, '91400', '613124286867');
INSERT INTO public.address VALUES (319, '1957 Yantai Lane', '', 'So Paulo', 490, '59255', '704948322302');
INSERT INTO public.address VALUES (320, '1542 Lubumbashi Boulevard', '', 'Tel Aviv', 57, '62472', '508800331065');
INSERT INTO public.address VALUES (321, '651 Pathankot Loop', '', 'Maharashtra', 336, '59811', '139378397418');
INSERT INTO public.address VALUES (322, '1359 Zhoushan Parkway', '', 'Streymoyar', 545, '29763', '46568045367');
INSERT INTO public.address VALUES (323, '1769 Iwaki Lane', '', 'Kujawsko-Pomorskie', 97, '25787', '556100547674');
INSERT INTO public.address VALUES (324, '1145 Vilnius Manor', '', 'Mxico', 451, '73170', '674805712553');
INSERT INTO public.address VALUES (325, '1892 Nabereznyje Telny Lane', '', 'Tutuila', 516, '28396', '478229987054');
INSERT INTO public.address VALUES (326, '470 Boksburg Street', '', 'Central', 81, '97960', '908029859266');
INSERT INTO public.address VALUES (327, '1427 A Corua (La Corua) Place', '', 'Buenos Aires', 45, '85799', '972574862516');
INSERT INTO public.address VALUES (328, '479 San Felipe del Progreso Avenue', '', 'Morelos', 130, '54949', '869051782691');
INSERT INTO public.address VALUES (329, '867 Benin City Avenue', '', 'Henan', 591, '78543', '168884817145');
INSERT INTO public.address VALUES (330, '981 Kumbakonam Place', '', 'Distrito Federal', 89, '87611', '829116184079');
INSERT INTO public.address VALUES (331, '1016 Iwakuni Street', '', 'St George', 269, '49833', '961370847344');
INSERT INTO public.address VALUES (332, '663 Baha Blanca Parkway', '', 'Adana', 5, '33463', '834418779292');
INSERT INTO public.address VALUES (333, '1860 Taguig Loop', '', 'West Java', 119, '59550', '38158430589');
INSERT INTO public.address VALUES (334, '1816 Bydgoszcz Loop', '', 'Dhaka', 234, '64308', '965273813662');
INSERT INTO public.address VALUES (335, '587 Benguela Manor', '', 'Illinois', 42, '91590', '165450987037');
INSERT INTO public.address VALUES (336, '430 Kumbakonam Drive', '', 'Santa F', 457, '28814', '105470691550');
INSERT INTO public.address VALUES (337, '1838 Tabriz Lane', '', 'Dhaka', 143, '1195', '38988715447');
INSERT INTO public.address VALUES (338, '431 Szkesfehrvr Avenue', '', 'Baki', 48, '57828', '119501405123');
INSERT INTO public.address VALUES (339, '503 Sogamoso Loop', '', 'Sumqayit', 505, '49812', '834626715837');
INSERT INTO public.address VALUES (340, '507 Smolensk Loop', '', 'Sousse', 492, '22971', '80303246192');
INSERT INTO public.address VALUES (341, '1920 Weifang Avenue', '', 'Uttar Pradesh', 427, '15643', '869507847714');
INSERT INTO public.address VALUES (342, '124 al-Manama Way', '', 'Hiroshima', 382, '52368', '647899404952');
INSERT INTO public.address VALUES (343, '1443 Mardan Street', '', 'Western Cape', 392, '31483', '231383037471');
INSERT INTO public.address VALUES (344, '1909 Benguela Lane', '', 'Henan', 581, '19913', '624138001031');
INSERT INTO public.address VALUES (345, '68 Ponce Parkway', '', 'Hanoi', 201, '85926', '870635127812');
INSERT INTO public.address VALUES (346, '1217 Konotop Avenue', '', 'Gelderland', 151, '504', '718917251754');
INSERT INTO public.address VALUES (347, '1293 Nam Dinh Way', '', 'Roraima', 84, '71583', '697656479977');
INSERT INTO public.address VALUES (348, '785 Vaduz Street', '', 'Baja California', 335, '36170', '895616862749');
INSERT INTO public.address VALUES (349, '1516 Escobar Drive', '', 'Tongatapu', 370, '46069', '64536069371');
INSERT INTO public.address VALUES (350, '1628 Nagareyama Lane', '', 'Central', 453, '60079', '20064292617');
INSERT INTO public.address VALUES (351, '1157 Nyeri Loop', '', 'Adygea', 320, '56380', '262744791493');
INSERT INTO public.address VALUES (352, '1673 Tangail Drive', '', 'Daugavpils', 137, '26857', '627924259271');
INSERT INTO public.address VALUES (353, '381 Kabul Way', '', 'Taipei', 209, '87272', '55477302294');
INSERT INTO public.address VALUES (354, '953 Hodeida Street', '', 'Southern Tagalog', 221, '18841', '53912826864');
INSERT INTO public.address VALUES (355, '469 Nakhon Sawan Street', '', 'Tuvassia', 531, '58866', '689199636560');
INSERT INTO public.address VALUES (356, '1378 Beira Loop', '', 'Krasnojarsk', 597, '40792', '840957664136');
INSERT INTO public.address VALUES (357, '1641 Changhwa Place', '', 'Nord-Ouest', 52, '37636', '256546485220');
INSERT INTO public.address VALUES (358, '1698 Southport Loop', '', 'Hidalgo', 393, '49009', '754358349853');
INSERT INTO public.address VALUES (359, '519 Nyeri Manor', '', 'So Paulo', 461, '37650', '764680915323');
INSERT INTO public.address VALUES (360, '619 Hunuco Avenue', '', 'Shimane', 331, '81508', '142596392389');
INSERT INTO public.address VALUES (361, '45 Aparecida de Goinia Place', '', 'Madhya Pradesh', 464, '7431', '650496654258');
INSERT INTO public.address VALUES (362, '482 Kowloon and New Kowloon Manor', '', 'Bratislava', 90, '97056', '738968474939');
INSERT INTO public.address VALUES (363, '604 Bern Place', '', 'Jharkhand', 429, '5373', '620719383725');
INSERT INTO public.address VALUES (364, '1623 Kingstown Drive', '', 'Buenos Aires', 20, '91299', '296394569728');
INSERT INTO public.address VALUES (365, '1009 Zanzibar Lane', '', 'Arecibo', 32, '64875', '102396298916');
INSERT INTO public.address VALUES (366, '114 Jalib al-Shuyukh Manor', '', 'Centre', 585, '60440', '845378657301');
INSERT INTO public.address VALUES (367, '1163 London Parkway', '', 'Par', 66, '6066', '675120358494');
INSERT INTO public.address VALUES (368, '1658 Jastrzebie-Zdrj Loop', '', 'Central', 372, '96584', '568367775448');
INSERT INTO public.address VALUES (369, '817 Laredo Avenue', '', 'Jalisco', 188, '77449', '151249681135');
INSERT INTO public.address VALUES (370, '1565 Tangail Manor', '', 'Okinawa', 377, '45750', '634445428822');
INSERT INTO public.address VALUES (371, '1912 Emeishan Drive', '', 'Balikesir', 50, '33050', '99883471275');
INSERT INTO public.address VALUES (372, '230 Urawa Drive', '', 'Andhra Pradesh', 8, '2738', '166898395731');
INSERT INTO public.address VALUES (373, '1922 Miraj Way', '', 'Esfahan', 356, '13203', '320471479776');
INSERT INTO public.address VALUES (374, '433 Florencia Street', '', 'Chihuahua', 250, '91330', '561729882725');
INSERT INTO public.address VALUES (375, '1049 Matamoros Parkway', '', 'Karnataka', 191, '69640', '960505250340');
INSERT INTO public.address VALUES (376, '1061 Ede Avenue', '', 'Southern Tagalog', 98, '57810', '333390595558');
INSERT INTO public.address VALUES (377, '154 Oshawa Manor', '', 'East Java', 415, '72771', '440365973660');
INSERT INTO public.address VALUES (378, '1191 Tandil Drive', '', 'Southern Tagalog', 523, '6362', '45554316010');
INSERT INTO public.address VALUES (379, '1133 Rizhao Avenue', '', 'Pernambuco', 572, '2800', '600264533987');
INSERT INTO public.address VALUES (380, '1519 Santiago de los Caballeros Loop', '', 'East Kasai', 348, '22025', '409315295763');
INSERT INTO public.address VALUES (381, '1618 Olomouc Manor', '', 'Kurgan', 285, '26385', '96846695220');
INSERT INTO public.address VALUES (382, '220 Hidalgo Drive', '', 'Kermanshah', 265, '45298', '342720754566');
INSERT INTO public.address VALUES (383, '686 Donostia-San Sebastin Lane', '', 'Guangdong', 471, '97390', '71857599858');
INSERT INTO public.address VALUES (384, '97 Mogiljov Lane', '', 'Gujarat', 73, '89294', '924815207181');
INSERT INTO public.address VALUES (385, '1642 Charlotte Amalie Drive', '', 'Slaskie', 549, '75442', '821476736117');
INSERT INTO public.address VALUES (386, '1368 Maracabo Boulevard', '', '', 493, '32716', '934352415130');
INSERT INTO public.address VALUES (387, '401 Sucre Boulevard', '', 'New Hampshire', 322, '25007', '486395999608');
INSERT INTO public.address VALUES (388, '368 Hunuco Boulevard', '', 'Namibe', 360, '17165', '106439158941');
INSERT INTO public.address VALUES (389, '500 Lincoln Parkway', '', 'Jiangsu', 210, '95509', '550306965159');
INSERT INTO public.address VALUES (390, '102 Chapra Drive', '', 'Ibaragi', 521, '14073', '776031833752');
INSERT INTO public.address VALUES (391, '1793 Meixian Place', '', 'Hmelnytskyi', 258, '33535', '619966287415');
INSERT INTO public.address VALUES (392, '514 Ife Way', '', 'Shaba', 315, '69973', '900235712074');
INSERT INTO public.address VALUES (393, '717 Changzhou Lane', '', 'Southern Tagalog', 104, '21615', '426255288071');
INSERT INTO public.address VALUES (394, '753 Ilorin Avenue', '', 'Sichuan', 157, '3656', '464511145118');
INSERT INTO public.address VALUES (395, '1337 Mit Ghamr Avenue', '', 'Nakhon Sawan', 358, '29810', '175283210378');
INSERT INTO public.address VALUES (396, '767 Pyongyang Drive', '', 'Osaka', 229, '83536', '667736124769');
INSERT INTO public.address VALUES (397, '614 Pak Kret Street', '', 'Addis Abeba', 6, '27796', '47808359842');
INSERT INTO public.address VALUES (398, '954 Lapu-Lapu Way', '', 'Moskova', 278, '8816', '737229003916');
INSERT INTO public.address VALUES (399, '331 Bydgoszcz Parkway', '', 'Asturia', 181, '966', '537374465982');
INSERT INTO public.address VALUES (400, '1152 Citrus Heights Manor', '', 'al-Qadarif', 15, '5239', '765957414528');
INSERT INTO public.address VALUES (401, '168 Cianjur Manor', '', 'Saitama', 228, '73824', '679095087143');
INSERT INTO public.address VALUES (402, '616 Hagonoy Avenue', '', 'Krasnojarsk', 39, '46043', '604177838256');
INSERT INTO public.address VALUES (403, '1190 0 Place', '', 'Rio Grande do Sul', 44, '10417', '841876514789');
INSERT INTO public.address VALUES (404, '734 Bchar Place', '', 'Punjab', 375, '30586', '280578750435');
INSERT INTO public.address VALUES (405, '530 Lausanne Lane', '', 'Texas', 135, '11067', '775235029633');
INSERT INTO public.address VALUES (406, '454 Patiala Lane', '', 'Fukushima', 276, '13496', '794553031307');
INSERT INTO public.address VALUES (407, '1346 Mysore Drive', '', 'Bretagne', 92, '61507', '516647474029');
INSERT INTO public.address VALUES (408, '990 Etawah Loop', '', 'Tamil Nadu', 564, '79940', '206169448769');
INSERT INTO public.address VALUES (409, '1266 Laredo Parkway', '', 'Saitama', 380, '7664', '1483365694');
INSERT INTO public.address VALUES (410, '88 Nagaon Manor', '', 'Buenos Aires', 524, '86868', '779461480495');
INSERT INTO public.address VALUES (411, '264 Bhimavaram Manor', '', 'St Thomas', 111, '54749', '302526949177');
INSERT INTO public.address VALUES (412, '1639 Saarbrcken Drive', '', 'North West', 437, '9827', '328494873422');
INSERT INTO public.address VALUES (413, '692 Amroha Drive', '', 'Northern', 230, '35575', '359478883004');
INSERT INTO public.address VALUES (414, '1936 Lapu-Lapu Parkway', '', 'Bauchi & Gombe', 141, '7122', '653436985797');
INSERT INTO public.address VALUES (415, '432 Garden Grove Street', '', 'Ontario', 430, '65630', '615964523510');
INSERT INTO public.address VALUES (416, '1445 Carmen Parkway', '', 'West Java', 117, '70809', '598912394463');
INSERT INTO public.address VALUES (417, '791 Salinas Street', '', 'Punjab', 208, '40509', '129953030512');
INSERT INTO public.address VALUES (418, '126 Acua Parkway', '', 'West Bengali', 71, '58888', '480039662421');
INSERT INTO public.address VALUES (419, '397 Sunnyvale Avenue', '', 'Guanajuato', 19, '55566', '680851640676');
INSERT INTO public.address VALUES (420, '992 Klerksdorp Loop', '', 'Utrecht', 23, '33711', '855290087237');
INSERT INTO public.address VALUES (421, '966 Arecibo Loop', '', 'Sind', 134, '94018', '15273765306');
INSERT INTO public.address VALUES (422, '289 Santo Andr Manor', '', 'al-Sharqiya', 16, '72410', '214976066017');
INSERT INTO public.address VALUES (423, '437 Chungho Drive', '', 'Puerto Plata', 450, '59489', '491271355190');
INSERT INTO public.address VALUES (424, '1948 Bayugan Parkway', '', 'Bihar', 264, '60622', '987306329957');
INSERT INTO public.address VALUES (425, '1866 al-Qatif Avenue', '', 'California', 155, '89420', '546793516940');
INSERT INTO public.address VALUES (426, '1661 Abha Drive', '', 'Tamil Nadu', 416, '14400', '270456873752');
INSERT INTO public.address VALUES (427, '1557 Cape Coral Parkway', '', 'Hubei', 293, '46875', '368284120423');
INSERT INTO public.address VALUES (428, '1727 Matamoros Place', '', 'Sawhaj', 465, '78813', '129673677866');
INSERT INTO public.address VALUES (429, '1269 Botosani Manor', '', 'Guangdong', 468, '47394', '736517327853');
INSERT INTO public.address VALUES (430, '355 Vitria de Santo Anto Way', '', 'Oaxaca', 452, '81758', '548003849552');
INSERT INTO public.address VALUES (431, '1596 Acua Parkway', '', 'Jharkhand', 418, '70425', '157133457169');
INSERT INTO public.address VALUES (432, '259 Ipoh Drive', '', 'So Paulo', 189, '64964', '419009857119');
INSERT INTO public.address VALUES (433, '1823 Hoshiarpur Lane', '', 'Komi', 510, '33191', '307133768620');
INSERT INTO public.address VALUES (434, '1404 Taguig Drive', '', 'Okayama', 547, '87212', '572068624538');
INSERT INTO public.address VALUES (435, '740 Udaipur Lane', '', 'Nizni Novgorod', 150, '33505', '497288595103');
INSERT INTO public.address VALUES (436, '287 Cuautla Boulevard', '', 'Chuquisaca', 501, '72736', '82619513349');
INSERT INTO public.address VALUES (437, '1766 Almirante Brown Street', '', 'KwaZulu-Natal', 364, '63104', '617567598243');
INSERT INTO public.address VALUES (438, '596 Huixquilucan Place', '', 'Nampula', 351, '65892', '342709348083');
INSERT INTO public.address VALUES (439, '1351 Aparecida de Goinia Parkway', '', 'Northern Mindanao', 391, '41775', '959834530529');
INSERT INTO public.address VALUES (440, '722 Bradford Lane', '', 'Shandong', 249, '90920', '746251338300');
INSERT INTO public.address VALUES (441, '983 Santa F Way', '', 'British Colombia', 565, '47472', '145720452260');
INSERT INTO public.address VALUES (442, '1245 Ibirit Way', '', 'La Romana', 290, '40926', '331888642162');
INSERT INTO public.address VALUES (443, '1836 Korla Parkway', '', 'Copperbelt', 272, '55405', '689681677428');
INSERT INTO public.address VALUES (444, '231 Kaliningrad Place', '', 'Lombardia', 70, '57833', '575081026569');
INSERT INTO public.address VALUES (445, '495 Bhimavaram Lane', '', 'Maharashtra', 144, '3', '82088937724');
INSERT INTO public.address VALUES (446, '1924 Shimonoseki Drive', '', 'Batna', 59, '52625', '406784385440');
INSERT INTO public.address VALUES (447, '105 Dzerzinsk Manor', '', 'Inner Mongolia', 540, '48570', '240776414296');
INSERT INTO public.address VALUES (448, '614 Denizli Parkway', '', 'Rio Grande do Sul', 486, '29444', '876491807547');
INSERT INTO public.address VALUES (449, '1289 Belm Boulevard', '', 'Tartumaa', 530, '88306', '237368926031');
INSERT INTO public.address VALUES (450, '203 Tambaram Street', '', 'Buenos Aires', 161, '73942', '411549550611');
INSERT INTO public.address VALUES (451, '1704 Tambaram Manor', '', 'West Bengali', 554, '2834', '39463554936');
INSERT INTO public.address VALUES (452, '207 Cuernavaca Loop', '', 'Tatarstan', 352, '52671', '782900030287');
INSERT INTO public.address VALUES (453, '319 Springs Loop', '', 'Baijeri', 160, '99552', '72524459905');
INSERT INTO public.address VALUES (454, '956 Nam Dinh Manor', '', 'Kerman', 481, '21872', '474047727727');
INSERT INTO public.address VALUES (455, '1947 Paarl Way', '', 'Central Java', 509, '23636', '834061016202');
INSERT INTO public.address VALUES (456, '814 Simferopol Loop', '', 'Sinaloa', 154, '48745', '524567129902');
INSERT INTO public.address VALUES (457, '535 Ahmadnagar Manor', '', 'Abu Dhabi', 3, '41136', '985109775584');
INSERT INTO public.address VALUES (458, '138 Caracas Boulevard', '', 'Zulia', 326, '16790', '974433019532');
INSERT INTO public.address VALUES (459, '251 Florencia Drive', '', 'Michoacn de Ocampo', 556, '16119', '118011831565');
INSERT INTO public.address VALUES (460, '659 Gatineau Boulevard', '', 'La Paz', 153, '28587', '205524798287');
INSERT INTO public.address VALUES (461, '1889 Valparai Way', '', 'Ziguinchor', 600, '75559', '670370974122');
INSERT INTO public.address VALUES (462, '1485 Bratislava Place', '', 'Illinois', 435, '83183', '924663855568');
INSERT INTO public.address VALUES (463, '935 Aden Boulevard', '', 'Central Java', 532, '64709', '335052544020');
INSERT INTO public.address VALUES (464, '76 Kermanshah Manor', '', 'Esfahan', 423, '23343', '762361821578');
INSERT INTO public.address VALUES (465, '734 Tanshui Avenue', '', 'Caquet', 170, '70664', '366776723320');
INSERT INTO public.address VALUES (466, '118 Jaffna Loop', '', 'Northern Mindanao', 182, '10447', '325526730021');
INSERT INTO public.address VALUES (467, '1621 Tongliao Avenue', '', 'Irkutsk', 558, '22173', '209342540247');
INSERT INTO public.address VALUES (468, '1844 Usak Avenue', '', 'Nova Scotia', 196, '84461', '164414772677');
INSERT INTO public.address VALUES (469, '1872 Toulon Loop', '', 'OHiggins', 428, '7939', '928809465153');
INSERT INTO public.address VALUES (470, '1088 Ibirit Place', '', 'Jalisco', 595, '88502', '49084281333');
INSERT INTO public.address VALUES (471, '1322 Mosul Parkway', '', 'Shandong', 145, '95400', '268053970382');
INSERT INTO public.address VALUES (472, '1447 Chatsworth Place', '', 'Chihuahua', 129, '41545', '769370126331');
INSERT INTO public.address VALUES (473, '1257 Guadalajara Street', '', 'Karnataka', 78, '33599', '195337700615');
INSERT INTO public.address VALUES (474, '1469 Plock Lane', '', 'Galicia', 388, '95835', '622884741180');
INSERT INTO public.address VALUES (475, '434 Ourense (Orense) Manor', '', 'Hodeida', 206, '14122', '562370137426');
INSERT INTO public.address VALUES (476, '270 Tambaram Parkway', '', 'Gauteng', 244, '9668', '248446668735');
INSERT INTO public.address VALUES (477, '1786 Salinas Place', '', 'Nam Ha', 359, '66546', '206060652238');
INSERT INTO public.address VALUES (478, '1078 Stara Zagora Drive', '', 'Aceh', 301, '69221', '932992626595');
INSERT INTO public.address VALUES (479, '1854 Okara Boulevard', '', 'Drenthe', 158, '42123', '131912793873');
INSERT INTO public.address VALUES (480, '421 Yaound Street', '', 'Sumy', 385, '11363', '726875628268');
INSERT INTO public.address VALUES (481, '1153 Allende Way', '', 'Qubec', 179, '20336', '856872225376');
INSERT INTO public.address VALUES (482, '808 Naala-Porto Parkway', '', 'England', 500, '41060', '553452430707');
INSERT INTO public.address VALUES (483, '632 Usolje-Sibirskoje Parkway', '', 'Ha Darom', 36, '73085', '667648979883');
INSERT INTO public.address VALUES (484, '98 Pyongyang Boulevard', '', 'Ohio', 11, '88749', '191958435142');
INSERT INTO public.address VALUES (485, '984 Novoterkassk Loop', '', 'Gaziantep', 180, '28165', '435118527255');
INSERT INTO public.address VALUES (486, '64 Korla Street', '', 'Mwanza', 347, '25145', '510383179153');
INSERT INTO public.address VALUES (487, '1785 So Bernardo do Campo Street', '', 'Veracruz', 125, '71182', '684529463244');
INSERT INTO public.address VALUES (488, '698 Jelets Boulevard', '', 'Denizli', 142, '2596', '975185523021');
INSERT INTO public.address VALUES (489, '1297 Alvorada Parkway', '', 'Ningxia', 587, '11839', '508348602835');
INSERT INTO public.address VALUES (490, '1909 Dayton Avenue', '', 'Guangdong', 469, '88513', '702955450528');
INSERT INTO public.address VALUES (491, '1789 Saint-Denis Parkway', '', 'Coahuila de Zaragoza', 4, '8268', '936806643983');
INSERT INTO public.address VALUES (492, '185 Mannheim Lane', '', 'Stavropol', 408, '23661', '589377568313');
INSERT INTO public.address VALUES (493, '184 Mandaluyong Street', '', 'Baja California Sur', 288, '94239', '488425406814');
INSERT INTO public.address VALUES (494, '591 Sungai Petani Drive', '', 'Okayama', 376, '46400', '37247325001');
INSERT INTO public.address VALUES (495, '656 Matamoros Drive', '', 'Boyac', 487, '19489', '17305839123');
INSERT INTO public.address VALUES (496, '775 ostka Drive', '', 'al-Daqahliya', 337, '22358', '171973024401');
INSERT INTO public.address VALUES (497, '1013 Tabuk Boulevard', '', 'West Bengali', 261, '96203', '158399646978');
INSERT INTO public.address VALUES (498, '319 Plock Parkway', '', 'Istanbul', 504, '26101', '854259976812');
INSERT INTO public.address VALUES (499, '1954 Kowloon and New Kowloon Way', '', 'Chimborazo', 434, '63667', '898559280434');
INSERT INTO public.address VALUES (500, '362 Rajkot Lane', '', 'Gansu', 47, '98030', '962020153680');
INSERT INTO public.address VALUES (501, '1060 Tandil Lane', '', 'Shandong', 432, '72349', '211256301880');
INSERT INTO public.address VALUES (502, '1515 Korla Way', '', 'England', 589, '57197', '959467760895');
INSERT INTO public.address VALUES (503, '1416 San Juan Bautista Tuxtepec Avenue', '', 'Zufar', 444, '50592', '144206758053');
INSERT INTO public.address VALUES (504, '1 Valle de Santiago Avenue', '', 'Apulia', 93, '86208', '465897838272');
INSERT INTO public.address VALUES (505, '519 Brescia Parkway', '', 'East Java', 318, '69504', '793996678771');
INSERT INTO public.address VALUES (506, '414 Mandaluyong Street', '', 'Lubelskie', 314, '16370', '52709222667');
INSERT INTO public.address VALUES (507, '1197 Sokoto Boulevard', '', 'West Bengali', 478, '87687', '868602816371');
INSERT INTO public.address VALUES (508, '496 Celaya Drive', '', 'Nagano', 552, '90797', '759586584889');
INSERT INTO public.address VALUES (509, '786 Matsue Way', '', 'Illinois', 245, '37469', '111177206479');
INSERT INTO public.address VALUES (510, '48 Maracabo Place', '', 'Central Luzon', 519, '1570', '82671830126');
INSERT INTO public.address VALUES (511, '1152 al-Qatif Lane', '', 'Kalimantan Barat', 412, '44816', '131370665218');
INSERT INTO public.address VALUES (512, '1269 Ipoh Avenue', '', 'Eskisehir', 163, '54674', '402630109080');
INSERT INTO public.address VALUES (513, '758 Korolev Parkway', '', 'Andhra Pradesh', 568, '75474', '441628280920');
INSERT INTO public.address VALUES (514, '1747 Rustenburg Place', '', 'Bihar', 110, '51369', '442673923363');
INSERT INTO public.address VALUES (515, '886 Tonghae Place', '', 'Volgograd', 259, '19450', '711928348157');
INSERT INTO public.address VALUES (516, '1574 Goinia Boulevard', '', 'Heilongjiang', 502, '39529', '59634255214');
INSERT INTO public.address VALUES (517, '548 Uruapan Street', '', 'Ontario', 312, '35653', '879347453467');
INSERT INTO public.address VALUES (519, '962 Tama Loop', '', '', 583, '65952', '282667506728');
INSERT INTO public.address VALUES (520, '1778 Gijn Manor', '', 'Hubei', 594, '35156', '288910576761');
INSERT INTO public.address VALUES (521, '568 Dhule (Dhulia) Loop', '', 'Coquimbo', 127, '92568', '602101369463');
INSERT INTO public.address VALUES (522, '1768 Udine Loop', '', 'Battambang', 60, '32347', '448876499197');
INSERT INTO public.address VALUES (523, '608 Birgunj Parkway', '', 'Taipei', 116, '400', '627425618482');
INSERT INTO public.address VALUES (524, '680 A Corua (La Corua) Manor', '', 'Sivas', 482, '49806', '158326114853');
INSERT INTO public.address VALUES (525, '1949 Sanya Street', '', 'Gumma', 224, '61244', '132100972047');
INSERT INTO public.address VALUES (526, '617 Klerksdorp Place', '', 'Khanh Hoa', 366, '94707', '574973479129');
INSERT INTO public.address VALUES (527, '1993 0 Loop', '', 'Liaoning', 588, '41214', '25865528181');
INSERT INTO public.address VALUES (528, '1176 Southend-on-Sea Manor', '', 'Southern Tagalog', 458, '81651', '236679267178');
INSERT INTO public.address VALUES (529, '600 Purnea (Purnia) Avenue', '', 'Nghe An', 571, '18043', '638409958875');
INSERT INTO public.address VALUES (530, '1003 Qinhuangdao Street', '', 'West Java', 419, '25972', '35533115997');
INSERT INTO public.address VALUES (531, '1986 Sivas Place', '', 'Friuli-Venezia Giuli', 551, '95775', '182059202712');
INSERT INTO public.address VALUES (532, '1427 Tabuk Place', '', 'Florida', 101, '31342', '214756839122');
INSERT INTO public.address VALUES (533, '556 Asuncin Way', '', 'Mogiljov', 339, '35364', '338244023543');
INSERT INTO public.address VALUES (534, '486 Ondo Parkway', '', 'Benguela', 67, '35202', '105882218332');
INSERT INTO public.address VALUES (535, '635 Brest Manor', '', 'Andhra Pradesh', 75, '40899', '80593242951');
INSERT INTO public.address VALUES (536, '166 Jinchang Street', '', 'Buenos Aires', 165, '86760', '717566026669');
INSERT INTO public.address VALUES (537, '958 Sagamihara Lane', '', 'Mie', 287, '88408', '427274926505');
INSERT INTO public.address VALUES (538, '1817 Livorno Way', '', 'Khanh Hoa', 100, '79401', '478380208348');
INSERT INTO public.address VALUES (539, '1332 Gaziantep Lane', '', 'Shandong', 80, '22813', '383353187467');
INSERT INTO public.address VALUES (540, '949 Allende Lane', '', 'Uttar Pradesh', 24, '67521', '122981120653');
INSERT INTO public.address VALUES (541, '195 Ilorin Street', '', 'Chari-Baguirmi', 363, '49250', '8912935608');
INSERT INTO public.address VALUES (542, '193 Bhusawal Place', '', 'Kang-won', 539, '9750', '745267607502');
INSERT INTO public.address VALUES (543, '43 Vilnius Manor', '', 'Colorado', 42, '79814', '484500282381');
INSERT INTO public.address VALUES (544, '183 Haiphong Street', '', 'Jilin', 46, '69953', '488600270038');
INSERT INTO public.address VALUES (545, '163 Augusta-Richmond County Loop', '', 'Carabobo', 561, '33030', '754579047924');
INSERT INTO public.address VALUES (546, '191 Jos Azueta Parkway', '', 'Ruse', 436, '13629', '932156667696');
INSERT INTO public.address VALUES (547, '379 Lublin Parkway', '', 'Toscana', 309, '74568', '921960450089');
INSERT INTO public.address VALUES (548, '1658 Cuman Loop', '', 'Sumatera Selatan', 396, '51309', '784907335610');
INSERT INTO public.address VALUES (549, '454 Qinhuangdao Drive', '', 'Tadla-Azilal', 68, '25866', '786270036240');
INSERT INTO public.address VALUES (550, '1715 Okayama Street', '', 'So Paulo', 485, '55676', '169352919175');
INSERT INTO public.address VALUES (551, '182 Nukualofa Drive', '', 'Sumy', 275, '15414', '426346224043');
INSERT INTO public.address VALUES (552, '390 Wroclaw Way', '', 'Hainan', 462, '5753', '357593328658');
INSERT INTO public.address VALUES (553, '1421 Quilmes Lane', '', 'Ishikawa', 260, '19151', '135407755975');
INSERT INTO public.address VALUES (554, '947 Trshavn Place', '', 'Central Luzon', 528, '841', '50898428626');
INSERT INTO public.address VALUES (555, '1764 Jalib al-Shuyukh Parkway', '', 'Galicia', 459, '77642', '84794532510');
INSERT INTO public.address VALUES (556, '346 Cam Ranh Avenue', '', 'Zhejiang', 599, '39976', '978430786151');
INSERT INTO public.address VALUES (557, '1407 Pachuca de Soto Place', '', 'Rio Grande do Sul', 21, '26284', '380077794770');
INSERT INTO public.address VALUES (558, '904 Clarksville Drive', '', 'Zhejiang', 193, '52234', '955349440539');
INSERT INTO public.address VALUES (559, '1917 Kumbakonam Parkway', '', 'Vojvodina', 368, '11892', '698182547686');
INSERT INTO public.address VALUES (560, '1447 Imus Place', '', 'Gujarat', 426, '12905', '62127829280');
INSERT INTO public.address VALUES (561, '1497 Fengshan Drive', '', 'KwaZulu-Natal', 112, '63022', '368738360376');
INSERT INTO public.address VALUES (562, '869 Shikarpur Way', '', 'England', 496, '57380', '590764256785');
INSERT INTO public.address VALUES (563, '1059 Yuncheng Avenue', '', 'Vilna', 570, '47498', '107092893983');
INSERT INTO public.address VALUES (564, '505 Madiun Boulevard', '', 'Dolnoslaskie', 577, '97271', '970638808606');
INSERT INTO public.address VALUES (565, '1741 Hoshiarpur Boulevard', '', 'al-Sharqiya', 79, '22372', '855066328617');
INSERT INTO public.address VALUES (566, '1229 Varanasi (Benares) Manor', '', 'Buenos Aires', 43, '40195', '817740355461');
INSERT INTO public.address VALUES (567, '1894 Boa Vista Way', '', 'Texas', 178, '77464', '239357986667');
INSERT INTO public.address VALUES (568, '1342 Sharja Way', '', 'Sokoto & Kebbi & Zam', 488, '93655', '946114054231');
INSERT INTO public.address VALUES (569, '1342 Abha Boulevard', '', 'Bukarest', 95, '10714', '997453607116');
INSERT INTO public.address VALUES (570, '415 Pune Avenue', '', 'Shandong', 580, '44274', '203202500108');
INSERT INTO public.address VALUES (571, '1746 Faaa Way', '', 'Huanuco', 214, '32515', '863080561151');
INSERT INTO public.address VALUES (572, '539 Hami Way', '', 'Tokat', 538, '52196', '525518075499');
INSERT INTO public.address VALUES (573, '1407 Surakarta Manor', '', 'Moskova', 466, '33224', '324346485054');
INSERT INTO public.address VALUES (574, '502 Mandi Bahauddin Parkway', '', 'Anzotegui', 55, '15992', '618156722572');
INSERT INTO public.address VALUES (575, '1052 Pathankot Avenue', '', 'Sichuan', 299, '77397', '128499386727');
INSERT INTO public.address VALUES (576, '1351 Sousse Lane', '', 'Coahuila de Zaragoza', 341, '37815', '203804046132');
INSERT INTO public.address VALUES (577, '1501 Pangkal Pinang Avenue', '', 'Mazowieckie', 409, '943', '770864062795');
INSERT INTO public.address VALUES (578, '1405 Hagonoy Avenue', '', 'Slaskie', 133, '86587', '867287719310');
INSERT INTO public.address VALUES (579, '521 San Juan Bautista Tuxtepec Place', '', 'Qaraghandy', 598, '95093', '844018348565');
INSERT INTO public.address VALUES (580, '923 Tangail Boulevard', '', 'Tokyo-to', 10, '33384', '315528269898');
INSERT INTO public.address VALUES (581, '186 Skikda Lane', '', 'Morelos', 131, '89422', '14465669789');
INSERT INTO public.address VALUES (582, '1568 Celaya Parkway', '', 'Kaohsiung', 168, '34750', '278669994384');
INSERT INTO public.address VALUES (583, '1489 Kakamigahara Lane', '', 'Taipei', 526, '98883', '29341849811');
INSERT INTO public.address VALUES (584, '1819 Alessandria Loop', '', 'Campeche', 103, '53829', '377633994405');
INSERT INTO public.address VALUES (585, '1208 Tama Loop', '', 'Ninawa', 344, '73605', '954786054144');
INSERT INTO public.address VALUES (586, '951 Springs Lane', '', 'Central Mindanao', 219, '96115', '165164761435');
INSERT INTO public.address VALUES (587, '760 Miyakonojo Drive', '', 'Guerrero', 246, '64682', '294449058179');
INSERT INTO public.address VALUES (588, '966 Asuncin Way', '', 'Hidalgo', 212, '62703', '995527378381');
INSERT INTO public.address VALUES (589, '1584 Ljubertsy Lane', '', 'England', 494, '22954', '285710089439');
INSERT INTO public.address VALUES (590, '247 Jining Parkway', '', 'Banjul', 54, '53446', '170115379190');
INSERT INTO public.address VALUES (591, '773 Dallas Manor', '', 'Buenos Aires', 424, '12664', '914466027044');
INSERT INTO public.address VALUES (592, '1923 Stara Zagora Lane', '', 'Nantou', 546, '95179', '182178609211');
INSERT INTO public.address VALUES (593, '1402 Zanzibar Boulevard', '', 'Guanajuato', 106, '71102', '387448063440');
INSERT INTO public.address VALUES (594, '1464 Kursk Parkway', '', 'Shandong', 574, '17381', '338758048786');
INSERT INTO public.address VALUES (595, '1074 Sanaa Parkway', '', 'Loja', 311, '22474', '154124128457');
INSERT INTO public.address VALUES (596, '1759 Niznekamsk Avenue', '', 'al-Manama', 14, '39414', '864392582257');
INSERT INTO public.address VALUES (597, '32 Liaocheng Way', '', 'Minas Gerais', 248, '1944', '410877354933');
INSERT INTO public.address VALUES (598, '42 Fontana Avenue', '', 'Fejr', 512, '14684', '437829801725');
INSERT INTO public.address VALUES (599, '1895 Zhezqazghan Drive', '', 'California', 177, '36693', '137809746111');
INSERT INTO public.address VALUES (600, '1837 Kaduna Parkway', '', 'Inner Mongolia', 241, '82580', '640843562301');
INSERT INTO public.address VALUES (601, '844 Bucuresti Place', '', 'Liaoning', 242, '36603', '935952366111');
INSERT INTO public.address VALUES (602, '1101 Bucuresti Boulevard', '', 'West Greece', 401, '97661', '199514580428');
INSERT INTO public.address VALUES (603, '1103 Quilmes Boulevard', '', 'Piura', 503, '52137', '644021380889');
INSERT INTO public.address VALUES (604, '1331 Usak Boulevard', '', 'Vaud', 296, '61960', '145308717464');
INSERT INTO public.address VALUES (605, '1325 Fukuyama Street', '', 'Heilongjiang', 537, '27107', '288241215394');


--
-- TOC entry 2962 (class 0 OID 18425)
-- Dependencies: 201
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category VALUES (1, 'Action');
INSERT INTO public.category VALUES (2, 'Animation');
INSERT INTO public.category VALUES (3, 'Children');
INSERT INTO public.category VALUES (4, 'Classics');
INSERT INTO public.category VALUES (5, 'Comedy');
INSERT INTO public.category VALUES (6, 'Documentary');
INSERT INTO public.category VALUES (7, 'Drama');
INSERT INTO public.category VALUES (8, 'Family');
INSERT INTO public.category VALUES (9, 'Foreign');
INSERT INTO public.category VALUES (10, 'Games');
INSERT INTO public.category VALUES (11, 'Horror');
INSERT INTO public.category VALUES (12, 'Music');
INSERT INTO public.category VALUES (13, 'New');
INSERT INTO public.category VALUES (14, 'Sci-Fi');
INSERT INTO public.category VALUES (15, 'Sports');
INSERT INTO public.category VALUES (16, 'Travel');


--
-- TOC entry 2964 (class 0 OID 18432)
-- Dependencies: 203
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.city VALUES (1, 'A Corua (La Corua)', 87);
INSERT INTO public.city VALUES (2, 'Abha', 82);
INSERT INTO public.city VALUES (3, 'Abu Dhabi', 101);
INSERT INTO public.city VALUES (4, 'Acua', 60);
INSERT INTO public.city VALUES (5, 'Adana', 97);
INSERT INTO public.city VALUES (6, 'Addis Abeba', 31);
INSERT INTO public.city VALUES (7, 'Aden', 107);
INSERT INTO public.city VALUES (8, 'Adoni', 44);
INSERT INTO public.city VALUES (9, 'Ahmadnagar', 44);
INSERT INTO public.city VALUES (10, 'Akishima', 50);
INSERT INTO public.city VALUES (11, 'Akron', 103);
INSERT INTO public.city VALUES (12, 'al-Ayn', 101);
INSERT INTO public.city VALUES (13, 'al-Hawiya', 82);
INSERT INTO public.city VALUES (14, 'al-Manama', 11);
INSERT INTO public.city VALUES (15, 'al-Qadarif', 89);
INSERT INTO public.city VALUES (16, 'al-Qatif', 82);
INSERT INTO public.city VALUES (17, 'Alessandria', 49);
INSERT INTO public.city VALUES (18, 'Allappuzha (Alleppey)', 44);
INSERT INTO public.city VALUES (19, 'Allende', 60);
INSERT INTO public.city VALUES (20, 'Almirante Brown', 6);
INSERT INTO public.city VALUES (21, 'Alvorada', 15);
INSERT INTO public.city VALUES (22, 'Ambattur', 44);
INSERT INTO public.city VALUES (23, 'Amersfoort', 67);
INSERT INTO public.city VALUES (24, 'Amroha', 44);
INSERT INTO public.city VALUES (25, 'Angra dos Reis', 15);
INSERT INTO public.city VALUES (26, 'Anpolis', 15);
INSERT INTO public.city VALUES (27, 'Antofagasta', 22);
INSERT INTO public.city VALUES (28, 'Aparecida de Goinia', 15);
INSERT INTO public.city VALUES (29, 'Apeldoorn', 67);
INSERT INTO public.city VALUES (30, 'Araatuba', 15);
INSERT INTO public.city VALUES (31, 'Arak', 46);
INSERT INTO public.city VALUES (32, 'Arecibo', 77);
INSERT INTO public.city VALUES (33, 'Arlington', 103);
INSERT INTO public.city VALUES (34, 'Ashdod', 48);
INSERT INTO public.city VALUES (35, 'Ashgabat', 98);
INSERT INTO public.city VALUES (36, 'Ashqelon', 48);
INSERT INTO public.city VALUES (37, 'Asuncin', 73);
INSERT INTO public.city VALUES (38, 'Athenai', 39);
INSERT INTO public.city VALUES (39, 'Atinsk', 80);
INSERT INTO public.city VALUES (40, 'Atlixco', 60);
INSERT INTO public.city VALUES (41, 'Augusta-Richmond County', 103);
INSERT INTO public.city VALUES (42, 'Aurora', 103);
INSERT INTO public.city VALUES (43, 'Avellaneda', 6);
INSERT INTO public.city VALUES (44, 'Bag', 15);
INSERT INTO public.city VALUES (45, 'Baha Blanca', 6);
INSERT INTO public.city VALUES (46, 'Baicheng', 23);
INSERT INTO public.city VALUES (47, 'Baiyin', 23);
INSERT INTO public.city VALUES (48, 'Baku', 10);
INSERT INTO public.city VALUES (49, 'Balaiha', 80);
INSERT INTO public.city VALUES (50, 'Balikesir', 97);
INSERT INTO public.city VALUES (51, 'Balurghat', 44);
INSERT INTO public.city VALUES (52, 'Bamenda', 19);
INSERT INTO public.city VALUES (53, 'Bandar Seri Begawan', 16);
INSERT INTO public.city VALUES (54, 'Banjul', 37);
INSERT INTO public.city VALUES (55, 'Barcelona', 104);
INSERT INTO public.city VALUES (56, 'Basel', 91);
INSERT INTO public.city VALUES (57, 'Bat Yam', 48);
INSERT INTO public.city VALUES (58, 'Batman', 97);
INSERT INTO public.city VALUES (59, 'Batna', 2);
INSERT INTO public.city VALUES (60, 'Battambang', 18);
INSERT INTO public.city VALUES (61, 'Baybay', 75);
INSERT INTO public.city VALUES (62, 'Bayugan', 75);
INSERT INTO public.city VALUES (63, 'Bchar', 2);
INSERT INTO public.city VALUES (64, 'Beira', 63);
INSERT INTO public.city VALUES (65, 'Bellevue', 103);
INSERT INTO public.city VALUES (66, 'Belm', 15);
INSERT INTO public.city VALUES (67, 'Benguela', 4);
INSERT INTO public.city VALUES (68, 'Beni-Mellal', 62);
INSERT INTO public.city VALUES (69, 'Benin City', 69);
INSERT INTO public.city VALUES (70, 'Bergamo', 49);
INSERT INTO public.city VALUES (71, 'Berhampore (Baharampur)', 44);
INSERT INTO public.city VALUES (72, 'Bern', 91);
INSERT INTO public.city VALUES (73, 'Bhavnagar', 44);
INSERT INTO public.city VALUES (74, 'Bhilwara', 44);
INSERT INTO public.city VALUES (75, 'Bhimavaram', 44);
INSERT INTO public.city VALUES (76, 'Bhopal', 44);
INSERT INTO public.city VALUES (77, 'Bhusawal', 44);
INSERT INTO public.city VALUES (78, 'Bijapur', 44);
INSERT INTO public.city VALUES (79, 'Bilbays', 29);
INSERT INTO public.city VALUES (80, 'Binzhou', 23);
INSERT INTO public.city VALUES (81, 'Birgunj', 66);
INSERT INTO public.city VALUES (82, 'Bislig', 75);
INSERT INTO public.city VALUES (83, 'Blumenau', 15);
INSERT INTO public.city VALUES (84, 'Boa Vista', 15);
INSERT INTO public.city VALUES (85, 'Boksburg', 85);
INSERT INTO public.city VALUES (86, 'Botosani', 78);
INSERT INTO public.city VALUES (87, 'Botshabelo', 85);
INSERT INTO public.city VALUES (88, 'Bradford', 102);
INSERT INTO public.city VALUES (89, 'Braslia', 15);
INSERT INTO public.city VALUES (90, 'Bratislava', 84);
INSERT INTO public.city VALUES (91, 'Brescia', 49);
INSERT INTO public.city VALUES (92, 'Brest', 34);
INSERT INTO public.city VALUES (93, 'Brindisi', 49);
INSERT INTO public.city VALUES (94, 'Brockton', 103);
INSERT INTO public.city VALUES (95, 'Bucuresti', 78);
INSERT INTO public.city VALUES (96, 'Buenaventura', 24);
INSERT INTO public.city VALUES (97, 'Bydgoszcz', 76);
INSERT INTO public.city VALUES (98, 'Cabuyao', 75);
INSERT INTO public.city VALUES (99, 'Callao', 74);
INSERT INTO public.city VALUES (100, 'Cam Ranh', 105);
INSERT INTO public.city VALUES (101, 'Cape Coral', 103);
INSERT INTO public.city VALUES (102, 'Caracas', 104);
INSERT INTO public.city VALUES (103, 'Carmen', 60);
INSERT INTO public.city VALUES (104, 'Cavite', 75);
INSERT INTO public.city VALUES (105, 'Cayenne', 35);
INSERT INTO public.city VALUES (106, 'Celaya', 60);
INSERT INTO public.city VALUES (107, 'Chandrapur', 44);
INSERT INTO public.city VALUES (108, 'Changhwa', 92);
INSERT INTO public.city VALUES (109, 'Changzhou', 23);
INSERT INTO public.city VALUES (110, 'Chapra', 44);
INSERT INTO public.city VALUES (111, 'Charlotte Amalie', 106);
INSERT INTO public.city VALUES (112, 'Chatsworth', 85);
INSERT INTO public.city VALUES (113, 'Cheju', 86);
INSERT INTO public.city VALUES (114, 'Chiayi', 92);
INSERT INTO public.city VALUES (115, 'Chisinau', 61);
INSERT INTO public.city VALUES (116, 'Chungho', 92);
INSERT INTO public.city VALUES (117, 'Cianjur', 45);
INSERT INTO public.city VALUES (118, 'Ciomas', 45);
INSERT INTO public.city VALUES (119, 'Ciparay', 45);
INSERT INTO public.city VALUES (120, 'Citrus Heights', 103);
INSERT INTO public.city VALUES (121, 'Citt del Vaticano', 41);
INSERT INTO public.city VALUES (122, 'Ciudad del Este', 73);
INSERT INTO public.city VALUES (123, 'Clarksville', 103);
INSERT INTO public.city VALUES (124, 'Coacalco de Berriozbal', 60);
INSERT INTO public.city VALUES (125, 'Coatzacoalcos', 60);
INSERT INTO public.city VALUES (126, 'Compton', 103);
INSERT INTO public.city VALUES (127, 'Coquimbo', 22);
INSERT INTO public.city VALUES (128, 'Crdoba', 6);
INSERT INTO public.city VALUES (129, 'Cuauhtmoc', 60);
INSERT INTO public.city VALUES (130, 'Cuautla', 60);
INSERT INTO public.city VALUES (131, 'Cuernavaca', 60);
INSERT INTO public.city VALUES (132, 'Cuman', 104);
INSERT INTO public.city VALUES (133, 'Czestochowa', 76);
INSERT INTO public.city VALUES (134, 'Dadu', 72);
INSERT INTO public.city VALUES (135, 'Dallas', 103);
INSERT INTO public.city VALUES (136, 'Datong', 23);
INSERT INTO public.city VALUES (137, 'Daugavpils', 54);
INSERT INTO public.city VALUES (138, 'Davao', 75);
INSERT INTO public.city VALUES (139, 'Daxian', 23);
INSERT INTO public.city VALUES (140, 'Dayton', 103);
INSERT INTO public.city VALUES (141, 'Deba Habe', 69);
INSERT INTO public.city VALUES (142, 'Denizli', 97);
INSERT INTO public.city VALUES (143, 'Dhaka', 12);
INSERT INTO public.city VALUES (144, 'Dhule (Dhulia)', 44);
INSERT INTO public.city VALUES (145, 'Dongying', 23);
INSERT INTO public.city VALUES (146, 'Donostia-San Sebastin', 87);
INSERT INTO public.city VALUES (147, 'Dos Quebradas', 24);
INSERT INTO public.city VALUES (148, 'Duisburg', 38);
INSERT INTO public.city VALUES (149, 'Dundee', 102);
INSERT INTO public.city VALUES (150, 'Dzerzinsk', 80);
INSERT INTO public.city VALUES (151, 'Ede', 67);
INSERT INTO public.city VALUES (152, 'Effon-Alaiye', 69);
INSERT INTO public.city VALUES (153, 'El Alto', 14);
INSERT INTO public.city VALUES (154, 'El Fuerte', 60);
INSERT INTO public.city VALUES (155, 'El Monte', 103);
INSERT INTO public.city VALUES (156, 'Elista', 80);
INSERT INTO public.city VALUES (157, 'Emeishan', 23);
INSERT INTO public.city VALUES (158, 'Emmen', 67);
INSERT INTO public.city VALUES (159, 'Enshi', 23);
INSERT INTO public.city VALUES (160, 'Erlangen', 38);
INSERT INTO public.city VALUES (161, 'Escobar', 6);
INSERT INTO public.city VALUES (162, 'Esfahan', 46);
INSERT INTO public.city VALUES (163, 'Eskisehir', 97);
INSERT INTO public.city VALUES (164, 'Etawah', 44);
INSERT INTO public.city VALUES (165, 'Ezeiza', 6);
INSERT INTO public.city VALUES (166, 'Ezhou', 23);
INSERT INTO public.city VALUES (167, 'Faaa', 36);
INSERT INTO public.city VALUES (168, 'Fengshan', 92);
INSERT INTO public.city VALUES (169, 'Firozabad', 44);
INSERT INTO public.city VALUES (170, 'Florencia', 24);
INSERT INTO public.city VALUES (171, 'Fontana', 103);
INSERT INTO public.city VALUES (172, 'Fukuyama', 50);
INSERT INTO public.city VALUES (173, 'Funafuti', 99);
INSERT INTO public.city VALUES (174, 'Fuyu', 23);
INSERT INTO public.city VALUES (175, 'Fuzhou', 23);
INSERT INTO public.city VALUES (176, 'Gandhinagar', 44);
INSERT INTO public.city VALUES (177, 'Garden Grove', 103);
INSERT INTO public.city VALUES (178, 'Garland', 103);
INSERT INTO public.city VALUES (179, 'Gatineau', 20);
INSERT INTO public.city VALUES (180, 'Gaziantep', 97);
INSERT INTO public.city VALUES (181, 'Gijn', 87);
INSERT INTO public.city VALUES (182, 'Gingoog', 75);
INSERT INTO public.city VALUES (183, 'Goinia', 15);
INSERT INTO public.city VALUES (184, 'Gorontalo', 45);
INSERT INTO public.city VALUES (185, 'Grand Prairie', 103);
INSERT INTO public.city VALUES (186, 'Graz', 9);
INSERT INTO public.city VALUES (187, 'Greensboro', 103);
INSERT INTO public.city VALUES (188, 'Guadalajara', 60);
INSERT INTO public.city VALUES (189, 'Guaruj', 15);
INSERT INTO public.city VALUES (190, 'guas Lindas de Gois', 15);
INSERT INTO public.city VALUES (191, 'Gulbarga', 44);
INSERT INTO public.city VALUES (192, 'Hagonoy', 75);
INSERT INTO public.city VALUES (193, 'Haining', 23);
INSERT INTO public.city VALUES (194, 'Haiphong', 105);
INSERT INTO public.city VALUES (195, 'Haldia', 44);
INSERT INTO public.city VALUES (196, 'Halifax', 20);
INSERT INTO public.city VALUES (197, 'Halisahar', 44);
INSERT INTO public.city VALUES (198, 'Halle/Saale', 38);
INSERT INTO public.city VALUES (199, 'Hami', 23);
INSERT INTO public.city VALUES (200, 'Hamilton', 68);
INSERT INTO public.city VALUES (201, 'Hanoi', 105);
INSERT INTO public.city VALUES (202, 'Hidalgo', 60);
INSERT INTO public.city VALUES (203, 'Higashiosaka', 50);
INSERT INTO public.city VALUES (204, 'Hino', 50);
INSERT INTO public.city VALUES (205, 'Hiroshima', 50);
INSERT INTO public.city VALUES (206, 'Hodeida', 107);
INSERT INTO public.city VALUES (207, 'Hohhot', 23);
INSERT INTO public.city VALUES (208, 'Hoshiarpur', 44);
INSERT INTO public.city VALUES (209, 'Hsichuh', 92);
INSERT INTO public.city VALUES (210, 'Huaian', 23);
INSERT INTO public.city VALUES (211, 'Hubli-Dharwad', 44);
INSERT INTO public.city VALUES (212, 'Huejutla de Reyes', 60);
INSERT INTO public.city VALUES (213, 'Huixquilucan', 60);
INSERT INTO public.city VALUES (214, 'Hunuco', 74);
INSERT INTO public.city VALUES (215, 'Ibirit', 15);
INSERT INTO public.city VALUES (216, 'Idfu', 29);
INSERT INTO public.city VALUES (217, 'Ife', 69);
INSERT INTO public.city VALUES (218, 'Ikerre', 69);
INSERT INTO public.city VALUES (219, 'Iligan', 75);
INSERT INTO public.city VALUES (220, 'Ilorin', 69);
INSERT INTO public.city VALUES (221, 'Imus', 75);
INSERT INTO public.city VALUES (222, 'Inegl', 97);
INSERT INTO public.city VALUES (223, 'Ipoh', 59);
INSERT INTO public.city VALUES (224, 'Isesaki', 50);
INSERT INTO public.city VALUES (225, 'Ivanovo', 80);
INSERT INTO public.city VALUES (226, 'Iwaki', 50);
INSERT INTO public.city VALUES (227, 'Iwakuni', 50);
INSERT INTO public.city VALUES (228, 'Iwatsuki', 50);
INSERT INTO public.city VALUES (229, 'Izumisano', 50);
INSERT INTO public.city VALUES (230, 'Jaffna', 88);
INSERT INTO public.city VALUES (231, 'Jaipur', 44);
INSERT INTO public.city VALUES (232, 'Jakarta', 45);
INSERT INTO public.city VALUES (233, 'Jalib al-Shuyukh', 53);
INSERT INTO public.city VALUES (234, 'Jamalpur', 12);
INSERT INTO public.city VALUES (235, 'Jaroslavl', 80);
INSERT INTO public.city VALUES (236, 'Jastrzebie-Zdrj', 76);
INSERT INTO public.city VALUES (237, 'Jedda', 82);
INSERT INTO public.city VALUES (238, 'Jelets', 80);
INSERT INTO public.city VALUES (239, 'Jhansi', 44);
INSERT INTO public.city VALUES (240, 'Jinchang', 23);
INSERT INTO public.city VALUES (241, 'Jining', 23);
INSERT INTO public.city VALUES (242, 'Jinzhou', 23);
INSERT INTO public.city VALUES (243, 'Jodhpur', 44);
INSERT INTO public.city VALUES (244, 'Johannesburg', 85);
INSERT INTO public.city VALUES (245, 'Joliet', 103);
INSERT INTO public.city VALUES (246, 'Jos Azueta', 60);
INSERT INTO public.city VALUES (247, 'Juazeiro do Norte', 15);
INSERT INTO public.city VALUES (248, 'Juiz de Fora', 15);
INSERT INTO public.city VALUES (249, 'Junan', 23);
INSERT INTO public.city VALUES (250, 'Jurez', 60);
INSERT INTO public.city VALUES (251, 'Kabul', 1);
INSERT INTO public.city VALUES (252, 'Kaduna', 69);
INSERT INTO public.city VALUES (253, 'Kakamigahara', 50);
INSERT INTO public.city VALUES (254, 'Kaliningrad', 80);
INSERT INTO public.city VALUES (255, 'Kalisz', 76);
INSERT INTO public.city VALUES (256, 'Kamakura', 50);
INSERT INTO public.city VALUES (257, 'Kamarhati', 44);
INSERT INTO public.city VALUES (258, 'Kamjanets-Podilskyi', 100);
INSERT INTO public.city VALUES (259, 'Kamyin', 80);
INSERT INTO public.city VALUES (260, 'Kanazawa', 50);
INSERT INTO public.city VALUES (261, 'Kanchrapara', 44);
INSERT INTO public.city VALUES (262, 'Kansas City', 103);
INSERT INTO public.city VALUES (263, 'Karnal', 44);
INSERT INTO public.city VALUES (264, 'Katihar', 44);
INSERT INTO public.city VALUES (265, 'Kermanshah', 46);
INSERT INTO public.city VALUES (266, 'Kilis', 97);
INSERT INTO public.city VALUES (267, 'Kimberley', 85);
INSERT INTO public.city VALUES (268, 'Kimchon', 86);
INSERT INTO public.city VALUES (269, 'Kingstown', 81);
INSERT INTO public.city VALUES (270, 'Kirovo-Tepetsk', 80);
INSERT INTO public.city VALUES (271, 'Kisumu', 52);
INSERT INTO public.city VALUES (272, 'Kitwe', 109);
INSERT INTO public.city VALUES (273, 'Klerksdorp', 85);
INSERT INTO public.city VALUES (274, 'Kolpino', 80);
INSERT INTO public.city VALUES (275, 'Konotop', 100);
INSERT INTO public.city VALUES (276, 'Koriyama', 50);
INSERT INTO public.city VALUES (277, 'Korla', 23);
INSERT INTO public.city VALUES (278, 'Korolev', 80);
INSERT INTO public.city VALUES (279, 'Kowloon and New Kowloon', 42);
INSERT INTO public.city VALUES (280, 'Kragujevac', 108);
INSERT INTO public.city VALUES (281, 'Ktahya', 97);
INSERT INTO public.city VALUES (282, 'Kuching', 59);
INSERT INTO public.city VALUES (283, 'Kumbakonam', 44);
INSERT INTO public.city VALUES (284, 'Kurashiki', 50);
INSERT INTO public.city VALUES (285, 'Kurgan', 80);
INSERT INTO public.city VALUES (286, 'Kursk', 80);
INSERT INTO public.city VALUES (287, 'Kuwana', 50);
INSERT INTO public.city VALUES (288, 'La Paz', 60);
INSERT INTO public.city VALUES (289, 'La Plata', 6);
INSERT INTO public.city VALUES (290, 'La Romana', 27);
INSERT INTO public.city VALUES (291, 'Laiwu', 23);
INSERT INTO public.city VALUES (292, 'Lancaster', 103);
INSERT INTO public.city VALUES (293, 'Laohekou', 23);
INSERT INTO public.city VALUES (294, 'Lapu-Lapu', 75);
INSERT INTO public.city VALUES (295, 'Laredo', 103);
INSERT INTO public.city VALUES (296, 'Lausanne', 91);
INSERT INTO public.city VALUES (297, 'Le Mans', 34);
INSERT INTO public.city VALUES (298, 'Lengshuijiang', 23);
INSERT INTO public.city VALUES (299, 'Leshan', 23);
INSERT INTO public.city VALUES (300, 'Lethbridge', 20);
INSERT INTO public.city VALUES (301, 'Lhokseumawe', 45);
INSERT INTO public.city VALUES (302, 'Liaocheng', 23);
INSERT INTO public.city VALUES (303, 'Liepaja', 54);
INSERT INTO public.city VALUES (304, 'Lilongwe', 58);
INSERT INTO public.city VALUES (305, 'Lima', 74);
INSERT INTO public.city VALUES (306, 'Lincoln', 103);
INSERT INTO public.city VALUES (307, 'Linz', 9);
INSERT INTO public.city VALUES (308, 'Lipetsk', 80);
INSERT INTO public.city VALUES (309, 'Livorno', 49);
INSERT INTO public.city VALUES (310, 'Ljubertsy', 80);
INSERT INTO public.city VALUES (311, 'Loja', 28);
INSERT INTO public.city VALUES (312, 'London', 102);
INSERT INTO public.city VALUES (313, 'London', 20);
INSERT INTO public.city VALUES (314, 'Lublin', 76);
INSERT INTO public.city VALUES (315, 'Lubumbashi', 25);
INSERT INTO public.city VALUES (316, 'Lungtan', 92);
INSERT INTO public.city VALUES (317, 'Luzinia', 15);
INSERT INTO public.city VALUES (318, 'Madiun', 45);
INSERT INTO public.city VALUES (319, 'Mahajanga', 57);
INSERT INTO public.city VALUES (320, 'Maikop', 80);
INSERT INTO public.city VALUES (321, 'Malm', 90);
INSERT INTO public.city VALUES (322, 'Manchester', 103);
INSERT INTO public.city VALUES (323, 'Mandaluyong', 75);
INSERT INTO public.city VALUES (324, 'Mandi Bahauddin', 72);
INSERT INTO public.city VALUES (325, 'Mannheim', 38);
INSERT INTO public.city VALUES (326, 'Maracabo', 104);
INSERT INTO public.city VALUES (327, 'Mardan', 72);
INSERT INTO public.city VALUES (328, 'Maring', 15);
INSERT INTO public.city VALUES (329, 'Masqat', 71);
INSERT INTO public.city VALUES (330, 'Matamoros', 60);
INSERT INTO public.city VALUES (331, 'Matsue', 50);
INSERT INTO public.city VALUES (332, 'Meixian', 23);
INSERT INTO public.city VALUES (333, 'Memphis', 103);
INSERT INTO public.city VALUES (334, 'Merlo', 6);
INSERT INTO public.city VALUES (335, 'Mexicali', 60);
INSERT INTO public.city VALUES (336, 'Miraj', 44);
INSERT INTO public.city VALUES (337, 'Mit Ghamr', 29);
INSERT INTO public.city VALUES (338, 'Miyakonojo', 50);
INSERT INTO public.city VALUES (339, 'Mogiljov', 13);
INSERT INTO public.city VALUES (340, 'Molodetno', 13);
INSERT INTO public.city VALUES (341, 'Monclova', 60);
INSERT INTO public.city VALUES (342, 'Monywa', 64);
INSERT INTO public.city VALUES (343, 'Moscow', 80);
INSERT INTO public.city VALUES (344, 'Mosul', 47);
INSERT INTO public.city VALUES (345, 'Mukateve', 100);
INSERT INTO public.city VALUES (346, 'Munger (Monghyr)', 44);
INSERT INTO public.city VALUES (347, 'Mwanza', 93);
INSERT INTO public.city VALUES (348, 'Mwene-Ditu', 25);
INSERT INTO public.city VALUES (349, 'Myingyan', 64);
INSERT INTO public.city VALUES (350, 'Mysore', 44);
INSERT INTO public.city VALUES (351, 'Naala-Porto', 63);
INSERT INTO public.city VALUES (352, 'Nabereznyje Telny', 80);
INSERT INTO public.city VALUES (353, 'Nador', 62);
INSERT INTO public.city VALUES (354, 'Nagaon', 44);
INSERT INTO public.city VALUES (355, 'Nagareyama', 50);
INSERT INTO public.city VALUES (356, 'Najafabad', 46);
INSERT INTO public.city VALUES (357, 'Naju', 86);
INSERT INTO public.city VALUES (358, 'Nakhon Sawan', 94);
INSERT INTO public.city VALUES (359, 'Nam Dinh', 105);
INSERT INTO public.city VALUES (360, 'Namibe', 4);
INSERT INTO public.city VALUES (361, 'Nantou', 92);
INSERT INTO public.city VALUES (362, 'Nanyang', 23);
INSERT INTO public.city VALUES (363, 'NDjamna', 21);
INSERT INTO public.city VALUES (364, 'Newcastle', 85);
INSERT INTO public.city VALUES (365, 'Nezahualcyotl', 60);
INSERT INTO public.city VALUES (366, 'Nha Trang', 105);
INSERT INTO public.city VALUES (367, 'Niznekamsk', 80);
INSERT INTO public.city VALUES (368, 'Novi Sad', 108);
INSERT INTO public.city VALUES (369, 'Novoterkassk', 80);
INSERT INTO public.city VALUES (370, 'Nukualofa', 95);
INSERT INTO public.city VALUES (371, 'Nuuk', 40);
INSERT INTO public.city VALUES (372, 'Nyeri', 52);
INSERT INTO public.city VALUES (373, 'Ocumare del Tuy', 104);
INSERT INTO public.city VALUES (374, 'Ogbomosho', 69);
INSERT INTO public.city VALUES (375, 'Okara', 72);
INSERT INTO public.city VALUES (376, 'Okayama', 50);
INSERT INTO public.city VALUES (377, 'Okinawa', 50);
INSERT INTO public.city VALUES (378, 'Olomouc', 26);
INSERT INTO public.city VALUES (379, 'Omdurman', 89);
INSERT INTO public.city VALUES (380, 'Omiya', 50);
INSERT INTO public.city VALUES (381, 'Ondo', 69);
INSERT INTO public.city VALUES (382, 'Onomichi', 50);
INSERT INTO public.city VALUES (383, 'Oshawa', 20);
INSERT INTO public.city VALUES (384, 'Osmaniye', 97);
INSERT INTO public.city VALUES (385, 'ostka', 100);
INSERT INTO public.city VALUES (386, 'Otsu', 50);
INSERT INTO public.city VALUES (387, 'Oulu', 33);
INSERT INTO public.city VALUES (388, 'Ourense (Orense)', 87);
INSERT INTO public.city VALUES (389, 'Owo', 69);
INSERT INTO public.city VALUES (390, 'Oyo', 69);
INSERT INTO public.city VALUES (391, 'Ozamis', 75);
INSERT INTO public.city VALUES (392, 'Paarl', 85);
INSERT INTO public.city VALUES (393, 'Pachuca de Soto', 60);
INSERT INTO public.city VALUES (394, 'Pak Kret', 94);
INSERT INTO public.city VALUES (395, 'Palghat (Palakkad)', 44);
INSERT INTO public.city VALUES (396, 'Pangkal Pinang', 45);
INSERT INTO public.city VALUES (397, 'Papeete', 36);
INSERT INTO public.city VALUES (398, 'Parbhani', 44);
INSERT INTO public.city VALUES (399, 'Pathankot', 44);
INSERT INTO public.city VALUES (400, 'Patiala', 44);
INSERT INTO public.city VALUES (401, 'Patras', 39);
INSERT INTO public.city VALUES (402, 'Pavlodar', 51);
INSERT INTO public.city VALUES (403, 'Pemalang', 45);
INSERT INTO public.city VALUES (404, 'Peoria', 103);
INSERT INTO public.city VALUES (405, 'Pereira', 24);
INSERT INTO public.city VALUES (406, 'Phnom Penh', 18);
INSERT INTO public.city VALUES (407, 'Pingxiang', 23);
INSERT INTO public.city VALUES (408, 'Pjatigorsk', 80);
INSERT INTO public.city VALUES (409, 'Plock', 76);
INSERT INTO public.city VALUES (410, 'Po', 15);
INSERT INTO public.city VALUES (411, 'Ponce', 77);
INSERT INTO public.city VALUES (412, 'Pontianak', 45);
INSERT INTO public.city VALUES (413, 'Poos de Caldas', 15);
INSERT INTO public.city VALUES (414, 'Portoviejo', 28);
INSERT INTO public.city VALUES (415, 'Probolinggo', 45);
INSERT INTO public.city VALUES (416, 'Pudukkottai', 44);
INSERT INTO public.city VALUES (417, 'Pune', 44);
INSERT INTO public.city VALUES (418, 'Purnea (Purnia)', 44);
INSERT INTO public.city VALUES (419, 'Purwakarta', 45);
INSERT INTO public.city VALUES (420, 'Pyongyang', 70);
INSERT INTO public.city VALUES (421, 'Qalyub', 29);
INSERT INTO public.city VALUES (422, 'Qinhuangdao', 23);
INSERT INTO public.city VALUES (423, 'Qomsheh', 46);
INSERT INTO public.city VALUES (424, 'Quilmes', 6);
INSERT INTO public.city VALUES (425, 'Rae Bareli', 44);
INSERT INTO public.city VALUES (426, 'Rajkot', 44);
INSERT INTO public.city VALUES (427, 'Rampur', 44);
INSERT INTO public.city VALUES (428, 'Rancagua', 22);
INSERT INTO public.city VALUES (429, 'Ranchi', 44);
INSERT INTO public.city VALUES (430, 'Richmond Hill', 20);
INSERT INTO public.city VALUES (431, 'Rio Claro', 15);
INSERT INTO public.city VALUES (432, 'Rizhao', 23);
INSERT INTO public.city VALUES (433, 'Roanoke', 103);
INSERT INTO public.city VALUES (434, 'Robamba', 28);
INSERT INTO public.city VALUES (435, 'Rockford', 103);
INSERT INTO public.city VALUES (436, 'Ruse', 17);
INSERT INTO public.city VALUES (437, 'Rustenburg', 85);
INSERT INTO public.city VALUES (438, 's-Hertogenbosch', 67);
INSERT INTO public.city VALUES (439, 'Saarbrcken', 38);
INSERT INTO public.city VALUES (440, 'Sagamihara', 50);
INSERT INTO public.city VALUES (441, 'Saint Louis', 103);
INSERT INTO public.city VALUES (442, 'Saint-Denis', 79);
INSERT INTO public.city VALUES (443, 'Sal', 62);
INSERT INTO public.city VALUES (444, 'Salala', 71);
INSERT INTO public.city VALUES (445, 'Salamanca', 60);
INSERT INTO public.city VALUES (446, 'Salinas', 103);
INSERT INTO public.city VALUES (447, 'Salzburg', 9);
INSERT INTO public.city VALUES (448, 'Sambhal', 44);
INSERT INTO public.city VALUES (449, 'San Bernardino', 103);
INSERT INTO public.city VALUES (450, 'San Felipe de Puerto Plata', 27);
INSERT INTO public.city VALUES (451, 'San Felipe del Progreso', 60);
INSERT INTO public.city VALUES (452, 'San Juan Bautista Tuxtepec', 60);
INSERT INTO public.city VALUES (453, 'San Lorenzo', 73);
INSERT INTO public.city VALUES (454, 'San Miguel de Tucumn', 6);
INSERT INTO public.city VALUES (455, 'Sanaa', 107);
INSERT INTO public.city VALUES (456, 'Santa Brbara dOeste', 15);
INSERT INTO public.city VALUES (457, 'Santa F', 6);
INSERT INTO public.city VALUES (458, 'Santa Rosa', 75);
INSERT INTO public.city VALUES (459, 'Santiago de Compostela', 87);
INSERT INTO public.city VALUES (460, 'Santiago de los Caballeros', 27);
INSERT INTO public.city VALUES (461, 'Santo Andr', 15);
INSERT INTO public.city VALUES (462, 'Sanya', 23);
INSERT INTO public.city VALUES (463, 'Sasebo', 50);
INSERT INTO public.city VALUES (464, 'Satna', 44);
INSERT INTO public.city VALUES (465, 'Sawhaj', 29);
INSERT INTO public.city VALUES (466, 'Serpuhov', 80);
INSERT INTO public.city VALUES (467, 'Shahr-e Kord', 46);
INSERT INTO public.city VALUES (468, 'Shanwei', 23);
INSERT INTO public.city VALUES (469, 'Shaoguan', 23);
INSERT INTO public.city VALUES (470, 'Sharja', 101);
INSERT INTO public.city VALUES (471, 'Shenzhen', 23);
INSERT INTO public.city VALUES (472, 'Shikarpur', 72);
INSERT INTO public.city VALUES (473, 'Shimoga', 44);
INSERT INTO public.city VALUES (474, 'Shimonoseki', 50);
INSERT INTO public.city VALUES (475, 'Shivapuri', 44);
INSERT INTO public.city VALUES (476, 'Shubra al-Khayma', 29);
INSERT INTO public.city VALUES (477, 'Siegen', 38);
INSERT INTO public.city VALUES (478, 'Siliguri (Shiliguri)', 44);
INSERT INTO public.city VALUES (479, 'Simferopol', 100);
INSERT INTO public.city VALUES (480, 'Sincelejo', 24);
INSERT INTO public.city VALUES (481, 'Sirjan', 46);
INSERT INTO public.city VALUES (482, 'Sivas', 97);
INSERT INTO public.city VALUES (483, 'Skikda', 2);
INSERT INTO public.city VALUES (484, 'Smolensk', 80);
INSERT INTO public.city VALUES (485, 'So Bernardo do Campo', 15);
INSERT INTO public.city VALUES (486, 'So Leopoldo', 15);
INSERT INTO public.city VALUES (487, 'Sogamoso', 24);
INSERT INTO public.city VALUES (488, 'Sokoto', 69);
INSERT INTO public.city VALUES (489, 'Songkhla', 94);
INSERT INTO public.city VALUES (490, 'Sorocaba', 15);
INSERT INTO public.city VALUES (491, 'Soshanguve', 85);
INSERT INTO public.city VALUES (492, 'Sousse', 96);
INSERT INTO public.city VALUES (493, 'South Hill', 5);
INSERT INTO public.city VALUES (494, 'Southampton', 102);
INSERT INTO public.city VALUES (495, 'Southend-on-Sea', 102);
INSERT INTO public.city VALUES (496, 'Southport', 102);
INSERT INTO public.city VALUES (497, 'Springs', 85);
INSERT INTO public.city VALUES (498, 'Stara Zagora', 17);
INSERT INTO public.city VALUES (499, 'Sterling Heights', 103);
INSERT INTO public.city VALUES (500, 'Stockport', 102);
INSERT INTO public.city VALUES (501, 'Sucre', 14);
INSERT INTO public.city VALUES (502, 'Suihua', 23);
INSERT INTO public.city VALUES (503, 'Sullana', 74);
INSERT INTO public.city VALUES (504, 'Sultanbeyli', 97);
INSERT INTO public.city VALUES (505, 'Sumqayit', 10);
INSERT INTO public.city VALUES (506, 'Sumy', 100);
INSERT INTO public.city VALUES (507, 'Sungai Petani', 59);
INSERT INTO public.city VALUES (508, 'Sunnyvale', 103);
INSERT INTO public.city VALUES (509, 'Surakarta', 45);
INSERT INTO public.city VALUES (510, 'Syktyvkar', 80);
INSERT INTO public.city VALUES (511, 'Syrakusa', 49);
INSERT INTO public.city VALUES (512, 'Szkesfehrvr', 43);
INSERT INTO public.city VALUES (513, 'Tabora', 93);
INSERT INTO public.city VALUES (514, 'Tabriz', 46);
INSERT INTO public.city VALUES (515, 'Tabuk', 82);
INSERT INTO public.city VALUES (516, 'Tafuna', 3);
INSERT INTO public.city VALUES (517, 'Taguig', 75);
INSERT INTO public.city VALUES (518, 'Taizz', 107);
INSERT INTO public.city VALUES (519, 'Talavera', 75);
INSERT INTO public.city VALUES (520, 'Tallahassee', 103);
INSERT INTO public.city VALUES (521, 'Tama', 50);
INSERT INTO public.city VALUES (522, 'Tambaram', 44);
INSERT INTO public.city VALUES (523, 'Tanauan', 75);
INSERT INTO public.city VALUES (524, 'Tandil', 6);
INSERT INTO public.city VALUES (525, 'Tangail', 12);
INSERT INTO public.city VALUES (526, 'Tanshui', 92);
INSERT INTO public.city VALUES (527, 'Tanza', 75);
INSERT INTO public.city VALUES (528, 'Tarlac', 75);
INSERT INTO public.city VALUES (529, 'Tarsus', 97);
INSERT INTO public.city VALUES (530, 'Tartu', 30);
INSERT INTO public.city VALUES (531, 'Teboksary', 80);
INSERT INTO public.city VALUES (532, 'Tegal', 45);
INSERT INTO public.city VALUES (533, 'Tel Aviv-Jaffa', 48);
INSERT INTO public.city VALUES (534, 'Tete', 63);
INSERT INTO public.city VALUES (535, 'Tianjin', 23);
INSERT INTO public.city VALUES (536, 'Tiefa', 23);
INSERT INTO public.city VALUES (537, 'Tieli', 23);
INSERT INTO public.city VALUES (538, 'Tokat', 97);
INSERT INTO public.city VALUES (539, 'Tonghae', 86);
INSERT INTO public.city VALUES (540, 'Tongliao', 23);
INSERT INTO public.city VALUES (541, 'Torren', 60);
INSERT INTO public.city VALUES (542, 'Touliu', 92);
INSERT INTO public.city VALUES (543, 'Toulon', 34);
INSERT INTO public.city VALUES (544, 'Toulouse', 34);
INSERT INTO public.city VALUES (545, 'Trshavn', 32);
INSERT INTO public.city VALUES (546, 'Tsaotun', 92);
INSERT INTO public.city VALUES (547, 'Tsuyama', 50);
INSERT INTO public.city VALUES (548, 'Tuguegarao', 75);
INSERT INTO public.city VALUES (549, 'Tychy', 76);
INSERT INTO public.city VALUES (550, 'Udaipur', 44);
INSERT INTO public.city VALUES (551, 'Udine', 49);
INSERT INTO public.city VALUES (552, 'Ueda', 50);
INSERT INTO public.city VALUES (553, 'Uijongbu', 86);
INSERT INTO public.city VALUES (554, 'Uluberia', 44);
INSERT INTO public.city VALUES (555, 'Urawa', 50);
INSERT INTO public.city VALUES (556, 'Uruapan', 60);
INSERT INTO public.city VALUES (557, 'Usak', 97);
INSERT INTO public.city VALUES (558, 'Usolje-Sibirskoje', 80);
INSERT INTO public.city VALUES (559, 'Uttarpara-Kotrung', 44);
INSERT INTO public.city VALUES (560, 'Vaduz', 55);
INSERT INTO public.city VALUES (561, 'Valencia', 104);
INSERT INTO public.city VALUES (562, 'Valle de la Pascua', 104);
INSERT INTO public.city VALUES (563, 'Valle de Santiago', 60);
INSERT INTO public.city VALUES (564, 'Valparai', 44);
INSERT INTO public.city VALUES (565, 'Vancouver', 20);
INSERT INTO public.city VALUES (566, 'Varanasi (Benares)', 44);
INSERT INTO public.city VALUES (567, 'Vicente Lpez', 6);
INSERT INTO public.city VALUES (568, 'Vijayawada', 44);
INSERT INTO public.city VALUES (569, 'Vila Velha', 15);
INSERT INTO public.city VALUES (570, 'Vilnius', 56);
INSERT INTO public.city VALUES (571, 'Vinh', 105);
INSERT INTO public.city VALUES (572, 'Vitria de Santo Anto', 15);
INSERT INTO public.city VALUES (573, 'Warren', 103);
INSERT INTO public.city VALUES (574, 'Weifang', 23);
INSERT INTO public.city VALUES (575, 'Witten', 38);
INSERT INTO public.city VALUES (576, 'Woodridge', 8);
INSERT INTO public.city VALUES (577, 'Wroclaw', 76);
INSERT INTO public.city VALUES (578, 'Xiangfan', 23);
INSERT INTO public.city VALUES (579, 'Xiangtan', 23);
INSERT INTO public.city VALUES (580, 'Xintai', 23);
INSERT INTO public.city VALUES (581, 'Xinxiang', 23);
INSERT INTO public.city VALUES (582, 'Yamuna Nagar', 44);
INSERT INTO public.city VALUES (583, 'Yangor', 65);
INSERT INTO public.city VALUES (584, 'Yantai', 23);
INSERT INTO public.city VALUES (585, 'Yaound', 19);
INSERT INTO public.city VALUES (586, 'Yerevan', 7);
INSERT INTO public.city VALUES (587, 'Yinchuan', 23);
INSERT INTO public.city VALUES (588, 'Yingkou', 23);
INSERT INTO public.city VALUES (589, 'York', 102);
INSERT INTO public.city VALUES (590, 'Yuncheng', 23);
INSERT INTO public.city VALUES (591, 'Yuzhou', 23);
INSERT INTO public.city VALUES (592, 'Zalantun', 23);
INSERT INTO public.city VALUES (593, 'Zanzibar', 93);
INSERT INTO public.city VALUES (594, 'Zaoyang', 23);
INSERT INTO public.city VALUES (595, 'Zapopan', 60);
INSERT INTO public.city VALUES (596, 'Zaria', 69);
INSERT INTO public.city VALUES (597, 'Zeleznogorsk', 80);
INSERT INTO public.city VALUES (598, 'Zhezqazghan', 51);
INSERT INTO public.city VALUES (599, 'Zhoushan', 23);
INSERT INTO public.city VALUES (600, 'Ziguinchor', 83);


--
-- TOC entry 2966 (class 0 OID 18439)
-- Dependencies: 205
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.country VALUES (1, 'Afghanistan');
INSERT INTO public.country VALUES (2, 'Algeria');
INSERT INTO public.country VALUES (3, 'American Samoa');
INSERT INTO public.country VALUES (4, 'Angola');
INSERT INTO public.country VALUES (5, 'Anguilla');
INSERT INTO public.country VALUES (6, 'Argentina');
INSERT INTO public.country VALUES (7, 'Armenia');
INSERT INTO public.country VALUES (8, 'Australia');
INSERT INTO public.country VALUES (9, 'Austria');
INSERT INTO public.country VALUES (10, 'Azerbaijan');
INSERT INTO public.country VALUES (11, 'Bahrain');
INSERT INTO public.country VALUES (12, 'Bangladesh');
INSERT INTO public.country VALUES (13, 'Belarus');
INSERT INTO public.country VALUES (14, 'Bolivia');
INSERT INTO public.country VALUES (15, 'Brazil');
INSERT INTO public.country VALUES (16, 'Brunei');
INSERT INTO public.country VALUES (17, 'Bulgaria');
INSERT INTO public.country VALUES (18, 'Cambodia');
INSERT INTO public.country VALUES (19, 'Cameroon');
INSERT INTO public.country VALUES (20, 'Canada');
INSERT INTO public.country VALUES (21, 'Chad');
INSERT INTO public.country VALUES (22, 'Chile');
INSERT INTO public.country VALUES (23, 'China');
INSERT INTO public.country VALUES (24, 'Colombia');
INSERT INTO public.country VALUES (25, 'Congo, The Democratic Republic of the');
INSERT INTO public.country VALUES (26, 'Czech Republic');
INSERT INTO public.country VALUES (27, 'Dominican Republic');
INSERT INTO public.country VALUES (28, 'Ecuador');
INSERT INTO public.country VALUES (29, 'Egypt');
INSERT INTO public.country VALUES (30, 'Estonia');
INSERT INTO public.country VALUES (31, 'Ethiopia');
INSERT INTO public.country VALUES (32, 'Faroe Islands');
INSERT INTO public.country VALUES (33, 'Finland');
INSERT INTO public.country VALUES (34, 'France');
INSERT INTO public.country VALUES (35, 'French Guiana');
INSERT INTO public.country VALUES (36, 'French Polynesia');
INSERT INTO public.country VALUES (37, 'Gambia');
INSERT INTO public.country VALUES (38, 'Germany');
INSERT INTO public.country VALUES (39, 'Greece');
INSERT INTO public.country VALUES (40, 'Greenland');
INSERT INTO public.country VALUES (41, 'Holy See (Vatican City State)');
INSERT INTO public.country VALUES (42, 'Hong Kong');
INSERT INTO public.country VALUES (43, 'Hungary');
INSERT INTO public.country VALUES (44, 'India');
INSERT INTO public.country VALUES (45, 'Indonesia');
INSERT INTO public.country VALUES (46, 'Iran');
INSERT INTO public.country VALUES (47, 'Iraq');
INSERT INTO public.country VALUES (48, 'Israel');
INSERT INTO public.country VALUES (49, 'Italy');
INSERT INTO public.country VALUES (50, 'Japan');
INSERT INTO public.country VALUES (51, 'Kazakstan');
INSERT INTO public.country VALUES (52, 'Kenya');
INSERT INTO public.country VALUES (53, 'Kuwait');
INSERT INTO public.country VALUES (54, 'Latvia');
INSERT INTO public.country VALUES (55, 'Liechtenstein');
INSERT INTO public.country VALUES (56, 'Lithuania');
INSERT INTO public.country VALUES (57, 'Madagascar');
INSERT INTO public.country VALUES (58, 'Malawi');
INSERT INTO public.country VALUES (59, 'Malaysia');
INSERT INTO public.country VALUES (60, 'Mexico');
INSERT INTO public.country VALUES (61, 'Moldova');
INSERT INTO public.country VALUES (62, 'Morocco');
INSERT INTO public.country VALUES (63, 'Mozambique');
INSERT INTO public.country VALUES (64, 'Myanmar');
INSERT INTO public.country VALUES (65, 'Nauru');
INSERT INTO public.country VALUES (66, 'Nepal');
INSERT INTO public.country VALUES (67, 'Netherlands');
INSERT INTO public.country VALUES (68, 'New Zealand');
INSERT INTO public.country VALUES (69, 'Nigeria');
INSERT INTO public.country VALUES (70, 'North Korea');
INSERT INTO public.country VALUES (71, 'Oman');
INSERT INTO public.country VALUES (72, 'Pakistan');
INSERT INTO public.country VALUES (73, 'Paraguay');
INSERT INTO public.country VALUES (74, 'Peru');
INSERT INTO public.country VALUES (75, 'Philippines');
INSERT INTO public.country VALUES (76, 'Poland');
INSERT INTO public.country VALUES (77, 'Puerto Rico');
INSERT INTO public.country VALUES (78, 'Romania');
INSERT INTO public.country VALUES (79, 'Runion');
INSERT INTO public.country VALUES (80, 'Russian Federation');
INSERT INTO public.country VALUES (81, 'Saint Vincent and the Grenadines');
INSERT INTO public.country VALUES (82, 'Saudi Arabia');
INSERT INTO public.country VALUES (83, 'Senegal');
INSERT INTO public.country VALUES (84, 'Slovakia');
INSERT INTO public.country VALUES (85, 'South Africa');
INSERT INTO public.country VALUES (86, 'South Korea');
INSERT INTO public.country VALUES (87, 'Spain');
INSERT INTO public.country VALUES (88, 'Sri Lanka');
INSERT INTO public.country VALUES (89, 'Sudan');
INSERT INTO public.country VALUES (90, 'Sweden');
INSERT INTO public.country VALUES (91, 'Switzerland');
INSERT INTO public.country VALUES (92, 'Taiwan');
INSERT INTO public.country VALUES (93, 'Tanzania');
INSERT INTO public.country VALUES (94, 'Thailand');
INSERT INTO public.country VALUES (95, 'Tonga');
INSERT INTO public.country VALUES (96, 'Tunisia');
INSERT INTO public.country VALUES (97, 'Turkey');
INSERT INTO public.country VALUES (98, 'Turkmenistan');
INSERT INTO public.country VALUES (99, 'Tuvalu');
INSERT INTO public.country VALUES (100, 'Ukraine');
INSERT INTO public.country VALUES (101, 'United Arab Emirates');
INSERT INTO public.country VALUES (102, 'United Kingdom');
INSERT INTO public.country VALUES (103, 'United States');
INSERT INTO public.country VALUES (104, 'Venezuela');
INSERT INTO public.country VALUES (105, 'Vietnam');
INSERT INTO public.country VALUES (106, 'Virgin Islands, U.S.');
INSERT INTO public.country VALUES (107, 'Yemen');
INSERT INTO public.country VALUES (108, 'Yugoslavia');
INSERT INTO public.country VALUES (109, 'Zambia');


--
-- TOC entry 2968 (class 0 OID 18446)
-- Dependencies: 207
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer VALUES (524, 1, 'Jared', 'Ely', 'jared.ely@sakilacustomer.org', 530, true, 1);
INSERT INTO public.customer VALUES (1, 1, 'Mary', 'Smith', 'mary.smith@sakilacustomer.org', 5, true, 1);
INSERT INTO public.customer VALUES (2, 1, 'Patricia', 'Johnson', 'patricia.johnson@sakilacustomer.org', 6, true, 1);
INSERT INTO public.customer VALUES (3, 1, 'Linda', 'Williams', 'linda.williams@sakilacustomer.org', 7, true, 1);
INSERT INTO public.customer VALUES (4, 2, 'Barbara', 'Jones', 'barbara.jones@sakilacustomer.org', 8, true, 1);
INSERT INTO public.customer VALUES (5, 1, 'Elizabeth', 'Brown', 'elizabeth.brown@sakilacustomer.org', 9, true, 1);
INSERT INTO public.customer VALUES (6, 2, 'Jennifer', 'Davis', 'jennifer.davis@sakilacustomer.org', 10, true, 1);
INSERT INTO public.customer VALUES (7, 1, 'Maria', 'Miller', 'maria.miller@sakilacustomer.org', 11, true, 1);
INSERT INTO public.customer VALUES (8, 2, 'Susan', 'Wilson', 'susan.wilson@sakilacustomer.org', 12, true, 1);
INSERT INTO public.customer VALUES (9, 2, 'Margaret', 'Moore', 'margaret.moore@sakilacustomer.org', 13, true, 1);
INSERT INTO public.customer VALUES (10, 1, 'Dorothy', 'Taylor', 'dorothy.taylor@sakilacustomer.org', 14, true, 1);
INSERT INTO public.customer VALUES (11, 2, 'Lisa', 'Anderson', 'lisa.anderson@sakilacustomer.org', 15, true, 1);
INSERT INTO public.customer VALUES (12, 1, 'Nancy', 'Thomas', 'nancy.thomas@sakilacustomer.org', 16, true, 1);
INSERT INTO public.customer VALUES (13, 2, 'Karen', 'Jackson', 'karen.jackson@sakilacustomer.org', 17, true, 1);
INSERT INTO public.customer VALUES (14, 2, 'Betty', 'White', 'betty.white@sakilacustomer.org', 18, true, 1);
INSERT INTO public.customer VALUES (15, 1, 'Helen', 'Harris', 'helen.harris@sakilacustomer.org', 19, true, 1);
INSERT INTO public.customer VALUES (16, 2, 'Sandra', 'Martin', 'sandra.martin@sakilacustomer.org', 20, true, 0);
INSERT INTO public.customer VALUES (17, 1, 'Donna', 'Thompson', 'donna.thompson@sakilacustomer.org', 21, true, 1);
INSERT INTO public.customer VALUES (18, 2, 'Carol', 'Garcia', 'carol.garcia@sakilacustomer.org', 22, true, 1);
INSERT INTO public.customer VALUES (19, 1, 'Ruth', 'Martinez', 'ruth.martinez@sakilacustomer.org', 23, true, 1);
INSERT INTO public.customer VALUES (20, 2, 'Sharon', 'Robinson', 'sharon.robinson@sakilacustomer.org', 24, true, 1);
INSERT INTO public.customer VALUES (21, 1, 'Michelle', 'Clark', 'michelle.clark@sakilacustomer.org', 25, true, 1);
INSERT INTO public.customer VALUES (22, 1, 'Laura', 'Rodriguez', 'laura.rodriguez@sakilacustomer.org', 26, true, 1);
INSERT INTO public.customer VALUES (23, 2, 'Sarah', 'Lewis', 'sarah.lewis@sakilacustomer.org', 27, true, 1);
INSERT INTO public.customer VALUES (24, 2, 'Kimberly', 'Lee', 'kimberly.lee@sakilacustomer.org', 28, true, 1);
INSERT INTO public.customer VALUES (25, 1, 'Deborah', 'Walker', 'deborah.walker@sakilacustomer.org', 29, true, 1);
INSERT INTO public.customer VALUES (26, 2, 'Jessica', 'Hall', 'jessica.hall@sakilacustomer.org', 30, true, 1);
INSERT INTO public.customer VALUES (27, 2, 'Shirley', 'Allen', 'shirley.allen@sakilacustomer.org', 31, true, 1);
INSERT INTO public.customer VALUES (28, 1, 'Cynthia', 'Young', 'cynthia.young@sakilacustomer.org', 32, true, 1);
INSERT INTO public.customer VALUES (29, 2, 'Angela', 'Hernandez', 'angela.hernandez@sakilacustomer.org', 33, true, 1);
INSERT INTO public.customer VALUES (30, 1, 'Melissa', 'King', 'melissa.king@sakilacustomer.org', 34, true, 1);
INSERT INTO public.customer VALUES (31, 2, 'Brenda', 'Wright', 'brenda.wright@sakilacustomer.org', 35, true, 1);
INSERT INTO public.customer VALUES (32, 1, 'Amy', 'Lopez', 'amy.lopez@sakilacustomer.org', 36, true, 1);
INSERT INTO public.customer VALUES (33, 2, 'Anna', 'Hill', 'anna.hill@sakilacustomer.org', 37, true, 1);
INSERT INTO public.customer VALUES (34, 2, 'Rebecca', 'Scott', 'rebecca.scott@sakilacustomer.org', 38, true, 1);
INSERT INTO public.customer VALUES (35, 2, 'Virginia', 'Green', 'virginia.green@sakilacustomer.org', 39, true, 1);
INSERT INTO public.customer VALUES (36, 2, 'Kathleen', 'Adams', 'kathleen.adams@sakilacustomer.org', 40, true, 1);
INSERT INTO public.customer VALUES (37, 1, 'Pamela', 'Baker', 'pamela.baker@sakilacustomer.org', 41, true, 1);
INSERT INTO public.customer VALUES (38, 1, 'Martha', 'Gonzalez', 'martha.gonzalez@sakilacustomer.org', 42, true, 1);
INSERT INTO public.customer VALUES (39, 1, 'Debra', 'Nelson', 'debra.nelson@sakilacustomer.org', 43, true, 1);
INSERT INTO public.customer VALUES (40, 2, 'Amanda', 'Carter', 'amanda.carter@sakilacustomer.org', 44, true, 1);
INSERT INTO public.customer VALUES (41, 1, 'Stephanie', 'Mitchell', 'stephanie.mitchell@sakilacustomer.org', 45, true, 1);
INSERT INTO public.customer VALUES (42, 2, 'Carolyn', 'Perez', 'carolyn.perez@sakilacustomer.org', 46, true, 1);
INSERT INTO public.customer VALUES (43, 2, 'Christine', 'Roberts', 'christine.roberts@sakilacustomer.org', 47, true, 1);
INSERT INTO public.customer VALUES (44, 1, 'Marie', 'Turner', 'marie.turner@sakilacustomer.org', 48, true, 1);
INSERT INTO public.customer VALUES (45, 1, 'Janet', 'Phillips', 'janet.phillips@sakilacustomer.org', 49, true, 1);
INSERT INTO public.customer VALUES (46, 2, 'Catherine', 'Campbell', 'catherine.campbell@sakilacustomer.org', 50, true, 1);
INSERT INTO public.customer VALUES (47, 1, 'Frances', 'Parker', 'frances.parker@sakilacustomer.org', 51, true, 1);
INSERT INTO public.customer VALUES (48, 1, 'Ann', 'Evans', 'ann.evans@sakilacustomer.org', 52, true, 1);
INSERT INTO public.customer VALUES (49, 2, 'Joyce', 'Edwards', 'joyce.edwards@sakilacustomer.org', 53, true, 1);
INSERT INTO public.customer VALUES (50, 1, 'Diane', 'Collins', 'diane.collins@sakilacustomer.org', 54, true, 1);
INSERT INTO public.customer VALUES (51, 1, 'Alice', 'Stewart', 'alice.stewart@sakilacustomer.org', 55, true, 1);
INSERT INTO public.customer VALUES (52, 1, 'Julie', 'Sanchez', 'julie.sanchez@sakilacustomer.org', 56, true, 1);
INSERT INTO public.customer VALUES (53, 1, 'Heather', 'Morris', 'heather.morris@sakilacustomer.org', 57, true, 1);
INSERT INTO public.customer VALUES (54, 1, 'Teresa', 'Rogers', 'teresa.rogers@sakilacustomer.org', 58, true, 1);
INSERT INTO public.customer VALUES (55, 2, 'Doris', 'Reed', 'doris.reed@sakilacustomer.org', 59, true, 1);
INSERT INTO public.customer VALUES (56, 1, 'Gloria', 'Cook', 'gloria.cook@sakilacustomer.org', 60, true, 1);
INSERT INTO public.customer VALUES (57, 2, 'Evelyn', 'Morgan', 'evelyn.morgan@sakilacustomer.org', 61, true, 1);
INSERT INTO public.customer VALUES (58, 1, 'Jean', 'Bell', 'jean.bell@sakilacustomer.org', 62, true, 1);
INSERT INTO public.customer VALUES (59, 1, 'Cheryl', 'Murphy', 'cheryl.murphy@sakilacustomer.org', 63, true, 1);
INSERT INTO public.customer VALUES (60, 1, 'Mildred', 'Bailey', 'mildred.bailey@sakilacustomer.org', 64, true, 1);
INSERT INTO public.customer VALUES (61, 2, 'Katherine', 'Rivera', 'katherine.rivera@sakilacustomer.org', 65, true, 1);
INSERT INTO public.customer VALUES (62, 1, 'Joan', 'Cooper', 'joan.cooper@sakilacustomer.org', 66, true, 1);
INSERT INTO public.customer VALUES (63, 1, 'Ashley', 'Richardson', 'ashley.richardson@sakilacustomer.org', 67, true, 1);
INSERT INTO public.customer VALUES (64, 2, 'Judith', 'Cox', 'judith.cox@sakilacustomer.org', 68, true, 0);
INSERT INTO public.customer VALUES (65, 2, 'Rose', 'Howard', 'rose.howard@sakilacustomer.org', 69, true, 1);
INSERT INTO public.customer VALUES (66, 2, 'Janice', 'Ward', 'janice.ward@sakilacustomer.org', 70, true, 1);
INSERT INTO public.customer VALUES (67, 1, 'Kelly', 'Torres', 'kelly.torres@sakilacustomer.org', 71, true, 1);
INSERT INTO public.customer VALUES (68, 1, 'Nicole', 'Peterson', 'nicole.peterson@sakilacustomer.org', 72, true, 1);
INSERT INTO public.customer VALUES (69, 2, 'Judy', 'Gray', 'judy.gray@sakilacustomer.org', 73, true, 1);
INSERT INTO public.customer VALUES (70, 2, 'Christina', 'Ramirez', 'christina.ramirez@sakilacustomer.org', 74, true, 1);
INSERT INTO public.customer VALUES (71, 1, 'Kathy', 'James', 'kathy.james@sakilacustomer.org', 75, true, 1);
INSERT INTO public.customer VALUES (72, 2, 'Theresa', 'Watson', 'theresa.watson@sakilacustomer.org', 76, true, 1);
INSERT INTO public.customer VALUES (73, 2, 'Beverly', 'Brooks', 'beverly.brooks@sakilacustomer.org', 77, true, 1);
INSERT INTO public.customer VALUES (74, 1, 'Denise', 'Kelly', 'denise.kelly@sakilacustomer.org', 78, true, 1);
INSERT INTO public.customer VALUES (75, 2, 'Tammy', 'Sanders', 'tammy.sanders@sakilacustomer.org', 79, true, 1);
INSERT INTO public.customer VALUES (76, 2, 'Irene', 'Price', 'irene.price@sakilacustomer.org', 80, true, 1);
INSERT INTO public.customer VALUES (77, 2, 'Jane', 'Bennett', 'jane.bennett@sakilacustomer.org', 81, true, 1);
INSERT INTO public.customer VALUES (78, 1, 'Lori', 'Wood', 'lori.wood@sakilacustomer.org', 82, true, 1);
INSERT INTO public.customer VALUES (79, 1, 'Rachel', 'Barnes', 'rachel.barnes@sakilacustomer.org', 83, true, 1);
INSERT INTO public.customer VALUES (80, 1, 'Marilyn', 'Ross', 'marilyn.ross@sakilacustomer.org', 84, true, 1);
INSERT INTO public.customer VALUES (81, 1, 'Andrea', 'Henderson', 'andrea.henderson@sakilacustomer.org', 85, true, 1);
INSERT INTO public.customer VALUES (82, 1, 'Kathryn', 'Coleman', 'kathryn.coleman@sakilacustomer.org', 86, true, 1);
INSERT INTO public.customer VALUES (83, 1, 'Louise', 'Jenkins', 'louise.jenkins@sakilacustomer.org', 87, true, 1);
INSERT INTO public.customer VALUES (84, 2, 'Sara', 'Perry', 'sara.perry@sakilacustomer.org', 88, true, 1);
INSERT INTO public.customer VALUES (85, 2, 'Anne', 'Powell', 'anne.powell@sakilacustomer.org', 89, true, 1);
INSERT INTO public.customer VALUES (86, 2, 'Jacqueline', 'Long', 'jacqueline.long@sakilacustomer.org', 90, true, 1);
INSERT INTO public.customer VALUES (87, 1, 'Wanda', 'Patterson', 'wanda.patterson@sakilacustomer.org', 91, true, 1);
INSERT INTO public.customer VALUES (88, 2, 'Bonnie', 'Hughes', 'bonnie.hughes@sakilacustomer.org', 92, true, 1);
INSERT INTO public.customer VALUES (89, 1, 'Julia', 'Flores', 'julia.flores@sakilacustomer.org', 93, true, 1);
INSERT INTO public.customer VALUES (90, 2, 'Ruby', 'Washington', 'ruby.washington@sakilacustomer.org', 94, true, 1);
INSERT INTO public.customer VALUES (91, 2, 'Lois', 'Butler', 'lois.butler@sakilacustomer.org', 95, true, 1);
INSERT INTO public.customer VALUES (92, 2, 'Tina', 'Simmons', 'tina.simmons@sakilacustomer.org', 96, true, 1);
INSERT INTO public.customer VALUES (93, 1, 'Phyllis', 'Foster', 'phyllis.foster@sakilacustomer.org', 97, true, 1);
INSERT INTO public.customer VALUES (94, 1, 'Norma', 'Gonzales', 'norma.gonzales@sakilacustomer.org', 98, true, 1);
INSERT INTO public.customer VALUES (95, 2, 'Paula', 'Bryant', 'paula.bryant@sakilacustomer.org', 99, true, 1);
INSERT INTO public.customer VALUES (96, 1, 'Diana', 'Alexander', 'diana.alexander@sakilacustomer.org', 100, true, 1);
INSERT INTO public.customer VALUES (97, 2, 'Annie', 'Russell', 'annie.russell@sakilacustomer.org', 101, true, 1);
INSERT INTO public.customer VALUES (98, 1, 'Lillian', 'Griffin', 'lillian.griffin@sakilacustomer.org', 102, true, 1);
INSERT INTO public.customer VALUES (99, 2, 'Emily', 'Diaz', 'emily.diaz@sakilacustomer.org', 103, true, 1);
INSERT INTO public.customer VALUES (100, 1, 'Robin', 'Hayes', 'robin.hayes@sakilacustomer.org', 104, true, 1);
INSERT INTO public.customer VALUES (101, 1, 'Peggy', 'Myers', 'peggy.myers@sakilacustomer.org', 105, true, 1);
INSERT INTO public.customer VALUES (102, 1, 'Crystal', 'Ford', 'crystal.ford@sakilacustomer.org', 106, true, 1);
INSERT INTO public.customer VALUES (103, 1, 'Gladys', 'Hamilton', 'gladys.hamilton@sakilacustomer.org', 107, true, 1);
INSERT INTO public.customer VALUES (104, 1, 'Rita', 'Graham', 'rita.graham@sakilacustomer.org', 108, true, 1);
INSERT INTO public.customer VALUES (105, 1, 'Dawn', 'Sullivan', 'dawn.sullivan@sakilacustomer.org', 109, true, 1);
INSERT INTO public.customer VALUES (106, 1, 'Connie', 'Wallace', 'connie.wallace@sakilacustomer.org', 110, true, 1);
INSERT INTO public.customer VALUES (107, 1, 'Florence', 'Woods', 'florence.woods@sakilacustomer.org', 111, true, 1);
INSERT INTO public.customer VALUES (108, 1, 'Tracy', 'Cole', 'tracy.cole@sakilacustomer.org', 112, true, 1);
INSERT INTO public.customer VALUES (109, 2, 'Edna', 'West', 'edna.west@sakilacustomer.org', 113, true, 1);
INSERT INTO public.customer VALUES (110, 2, 'Tiffany', 'Jordan', 'tiffany.jordan@sakilacustomer.org', 114, true, 1);
INSERT INTO public.customer VALUES (111, 1, 'Carmen', 'Owens', 'carmen.owens@sakilacustomer.org', 115, true, 1);
INSERT INTO public.customer VALUES (112, 2, 'Rosa', 'Reynolds', 'rosa.reynolds@sakilacustomer.org', 116, true, 1);
INSERT INTO public.customer VALUES (113, 2, 'Cindy', 'Fisher', 'cindy.fisher@sakilacustomer.org', 117, true, 1);
INSERT INTO public.customer VALUES (114, 2, 'Grace', 'Ellis', 'grace.ellis@sakilacustomer.org', 118, true, 1);
INSERT INTO public.customer VALUES (115, 1, 'Wendy', 'Harrison', 'wendy.harrison@sakilacustomer.org', 119, true, 1);
INSERT INTO public.customer VALUES (116, 1, 'Victoria', 'Gibson', 'victoria.gibson@sakilacustomer.org', 120, true, 1);
INSERT INTO public.customer VALUES (117, 1, 'Edith', 'Mcdonald', 'edith.mcdonald@sakilacustomer.org', 121, true, 1);
INSERT INTO public.customer VALUES (118, 1, 'Kim', 'Cruz', 'kim.cruz@sakilacustomer.org', 122, true, 1);
INSERT INTO public.customer VALUES (119, 1, 'Sherry', 'Marshall', 'sherry.marshall@sakilacustomer.org', 123, true, 1);
INSERT INTO public.customer VALUES (120, 2, 'Sylvia', 'Ortiz', 'sylvia.ortiz@sakilacustomer.org', 124, true, 1);
INSERT INTO public.customer VALUES (121, 1, 'Josephine', 'Gomez', 'josephine.gomez@sakilacustomer.org', 125, true, 1);
INSERT INTO public.customer VALUES (122, 1, 'Thelma', 'Murray', 'thelma.murray@sakilacustomer.org', 126, true, 1);
INSERT INTO public.customer VALUES (123, 2, 'Shannon', 'Freeman', 'shannon.freeman@sakilacustomer.org', 127, true, 1);
INSERT INTO public.customer VALUES (124, 1, 'Sheila', 'Wells', 'sheila.wells@sakilacustomer.org', 128, true, 0);
INSERT INTO public.customer VALUES (125, 1, 'Ethel', 'Webb', 'ethel.webb@sakilacustomer.org', 129, true, 1);
INSERT INTO public.customer VALUES (126, 1, 'Ellen', 'Simpson', 'ellen.simpson@sakilacustomer.org', 130, true, 1);
INSERT INTO public.customer VALUES (127, 2, 'Elaine', 'Stevens', 'elaine.stevens@sakilacustomer.org', 131, true, 1);
INSERT INTO public.customer VALUES (128, 1, 'Marjorie', 'Tucker', 'marjorie.tucker@sakilacustomer.org', 132, true, 1);
INSERT INTO public.customer VALUES (129, 1, 'Carrie', 'Porter', 'carrie.porter@sakilacustomer.org', 133, true, 1);
INSERT INTO public.customer VALUES (130, 1, 'Charlotte', 'Hunter', 'charlotte.hunter@sakilacustomer.org', 134, true, 1);
INSERT INTO public.customer VALUES (131, 2, 'Monica', 'Hicks', 'monica.hicks@sakilacustomer.org', 135, true, 1);
INSERT INTO public.customer VALUES (132, 2, 'Esther', 'Crawford', 'esther.crawford@sakilacustomer.org', 136, true, 1);
INSERT INTO public.customer VALUES (133, 1, 'Pauline', 'Henry', 'pauline.henry@sakilacustomer.org', 137, true, 1);
INSERT INTO public.customer VALUES (134, 1, 'Emma', 'Boyd', 'emma.boyd@sakilacustomer.org', 138, true, 1);
INSERT INTO public.customer VALUES (135, 2, 'Juanita', 'Mason', 'juanita.mason@sakilacustomer.org', 139, true, 1);
INSERT INTO public.customer VALUES (136, 2, 'Anita', 'Morales', 'anita.morales@sakilacustomer.org', 140, true, 1);
INSERT INTO public.customer VALUES (137, 2, 'Rhonda', 'Kennedy', 'rhonda.kennedy@sakilacustomer.org', 141, true, 1);
INSERT INTO public.customer VALUES (138, 1, 'Hazel', 'Warren', 'hazel.warren@sakilacustomer.org', 142, true, 1);
INSERT INTO public.customer VALUES (139, 1, 'Amber', 'Dixon', 'amber.dixon@sakilacustomer.org', 143, true, 1);
INSERT INTO public.customer VALUES (140, 1, 'Eva', 'Ramos', 'eva.ramos@sakilacustomer.org', 144, true, 1);
INSERT INTO public.customer VALUES (141, 1, 'Debbie', 'Reyes', 'debbie.reyes@sakilacustomer.org', 145, true, 1);
INSERT INTO public.customer VALUES (142, 1, 'April', 'Burns', 'april.burns@sakilacustomer.org', 146, true, 1);
INSERT INTO public.customer VALUES (143, 1, 'Leslie', 'Gordon', 'leslie.gordon@sakilacustomer.org', 147, true, 1);
INSERT INTO public.customer VALUES (144, 1, 'Clara', 'Shaw', 'clara.shaw@sakilacustomer.org', 148, true, 1);
INSERT INTO public.customer VALUES (145, 1, 'Lucille', 'Holmes', 'lucille.holmes@sakilacustomer.org', 149, true, 1);
INSERT INTO public.customer VALUES (146, 1, 'Jamie', 'Rice', 'jamie.rice@sakilacustomer.org', 150, true, 1);
INSERT INTO public.customer VALUES (147, 2, 'Joanne', 'Robertson', 'joanne.robertson@sakilacustomer.org', 151, true, 1);
INSERT INTO public.customer VALUES (148, 1, 'Eleanor', 'Hunt', 'eleanor.hunt@sakilacustomer.org', 152, true, 1);
INSERT INTO public.customer VALUES (149, 1, 'Valerie', 'Black', 'valerie.black@sakilacustomer.org', 153, true, 1);
INSERT INTO public.customer VALUES (150, 2, 'Danielle', 'Daniels', 'danielle.daniels@sakilacustomer.org', 154, true, 1);
INSERT INTO public.customer VALUES (151, 2, 'Megan', 'Palmer', 'megan.palmer@sakilacustomer.org', 155, true, 1);
INSERT INTO public.customer VALUES (152, 1, 'Alicia', 'Mills', 'alicia.mills@sakilacustomer.org', 156, true, 1);
INSERT INTO public.customer VALUES (153, 2, 'Suzanne', 'Nichols', 'suzanne.nichols@sakilacustomer.org', 157, true, 1);
INSERT INTO public.customer VALUES (154, 2, 'Michele', 'Grant', 'michele.grant@sakilacustomer.org', 158, true, 1);
INSERT INTO public.customer VALUES (155, 1, 'Gail', 'Knight', 'gail.knight@sakilacustomer.org', 159, true, 1);
INSERT INTO public.customer VALUES (156, 1, 'Bertha', 'Ferguson', 'bertha.ferguson@sakilacustomer.org', 160, true, 1);
INSERT INTO public.customer VALUES (157, 2, 'Darlene', 'Rose', 'darlene.rose@sakilacustomer.org', 161, true, 1);
INSERT INTO public.customer VALUES (158, 1, 'Veronica', 'Stone', 'veronica.stone@sakilacustomer.org', 162, true, 1);
INSERT INTO public.customer VALUES (159, 1, 'Jill', 'Hawkins', 'jill.hawkins@sakilacustomer.org', 163, true, 1);
INSERT INTO public.customer VALUES (160, 2, 'Erin', 'Dunn', 'erin.dunn@sakilacustomer.org', 164, true, 1);
INSERT INTO public.customer VALUES (161, 1, 'Geraldine', 'Perkins', 'geraldine.perkins@sakilacustomer.org', 165, true, 1);
INSERT INTO public.customer VALUES (162, 2, 'Lauren', 'Hudson', 'lauren.hudson@sakilacustomer.org', 166, true, 1);
INSERT INTO public.customer VALUES (163, 1, 'Cathy', 'Spencer', 'cathy.spencer@sakilacustomer.org', 167, true, 1);
INSERT INTO public.customer VALUES (164, 2, 'Joann', 'Gardner', 'joann.gardner@sakilacustomer.org', 168, true, 1);
INSERT INTO public.customer VALUES (165, 2, 'Lorraine', 'Stephens', 'lorraine.stephens@sakilacustomer.org', 169, true, 1);
INSERT INTO public.customer VALUES (166, 1, 'Lynn', 'Payne', 'lynn.payne@sakilacustomer.org', 170, true, 1);
INSERT INTO public.customer VALUES (167, 2, 'Sally', 'Pierce', 'sally.pierce@sakilacustomer.org', 171, true, 1);
INSERT INTO public.customer VALUES (168, 1, 'Regina', 'Berry', 'regina.berry@sakilacustomer.org', 172, true, 1);
INSERT INTO public.customer VALUES (169, 2, 'Erica', 'Matthews', 'erica.matthews@sakilacustomer.org', 173, true, 0);
INSERT INTO public.customer VALUES (170, 1, 'Beatrice', 'Arnold', 'beatrice.arnold@sakilacustomer.org', 174, true, 1);
INSERT INTO public.customer VALUES (171, 2, 'Dolores', 'Wagner', 'dolores.wagner@sakilacustomer.org', 175, true, 1);
INSERT INTO public.customer VALUES (172, 1, 'Bernice', 'Willis', 'bernice.willis@sakilacustomer.org', 176, true, 1);
INSERT INTO public.customer VALUES (173, 1, 'Audrey', 'Ray', 'audrey.ray@sakilacustomer.org', 177, true, 1);
INSERT INTO public.customer VALUES (174, 2, 'Yvonne', 'Watkins', 'yvonne.watkins@sakilacustomer.org', 178, true, 1);
INSERT INTO public.customer VALUES (175, 1, 'Annette', 'Olson', 'annette.olson@sakilacustomer.org', 179, true, 1);
INSERT INTO public.customer VALUES (176, 1, 'June', 'Carroll', 'june.carroll@sakilacustomer.org', 180, true, 1);
INSERT INTO public.customer VALUES (177, 2, 'Samantha', 'Duncan', 'samantha.duncan@sakilacustomer.org', 181, true, 1);
INSERT INTO public.customer VALUES (178, 2, 'Marion', 'Snyder', 'marion.snyder@sakilacustomer.org', 182, true, 1);
INSERT INTO public.customer VALUES (179, 1, 'Dana', 'Hart', 'dana.hart@sakilacustomer.org', 183, true, 1);
INSERT INTO public.customer VALUES (180, 2, 'Stacy', 'Cunningham', 'stacy.cunningham@sakilacustomer.org', 184, true, 1);
INSERT INTO public.customer VALUES (181, 2, 'Ana', 'Bradley', 'ana.bradley@sakilacustomer.org', 185, true, 1);
INSERT INTO public.customer VALUES (182, 1, 'Renee', 'Lane', 'renee.lane@sakilacustomer.org', 186, true, 1);
INSERT INTO public.customer VALUES (183, 2, 'Ida', 'Andrews', 'ida.andrews@sakilacustomer.org', 187, true, 1);
INSERT INTO public.customer VALUES (184, 1, 'Vivian', 'Ruiz', 'vivian.ruiz@sakilacustomer.org', 188, true, 1);
INSERT INTO public.customer VALUES (185, 1, 'Roberta', 'Harper', 'roberta.harper@sakilacustomer.org', 189, true, 1);
INSERT INTO public.customer VALUES (186, 2, 'Holly', 'Fox', 'holly.fox@sakilacustomer.org', 190, true, 1);
INSERT INTO public.customer VALUES (187, 2, 'Brittany', 'Riley', 'brittany.riley@sakilacustomer.org', 191, true, 1);
INSERT INTO public.customer VALUES (188, 1, 'Melanie', 'Armstrong', 'melanie.armstrong@sakilacustomer.org', 192, true, 1);
INSERT INTO public.customer VALUES (189, 1, 'Loretta', 'Carpenter', 'loretta.carpenter@sakilacustomer.org', 193, true, 1);
INSERT INTO public.customer VALUES (190, 2, 'Yolanda', 'Weaver', 'yolanda.weaver@sakilacustomer.org', 194, true, 1);
INSERT INTO public.customer VALUES (191, 1, 'Jeanette', 'Greene', 'jeanette.greene@sakilacustomer.org', 195, true, 1);
INSERT INTO public.customer VALUES (192, 1, 'Laurie', 'Lawrence', 'laurie.lawrence@sakilacustomer.org', 196, true, 1);
INSERT INTO public.customer VALUES (193, 2, 'Katie', 'Elliott', 'katie.elliott@sakilacustomer.org', 197, true, 1);
INSERT INTO public.customer VALUES (194, 2, 'Kristen', 'Chavez', 'kristen.chavez@sakilacustomer.org', 198, true, 1);
INSERT INTO public.customer VALUES (195, 1, 'Vanessa', 'Sims', 'vanessa.sims@sakilacustomer.org', 199, true, 1);
INSERT INTO public.customer VALUES (196, 1, 'Alma', 'Austin', 'alma.austin@sakilacustomer.org', 200, true, 1);
INSERT INTO public.customer VALUES (197, 2, 'Sue', 'Peters', 'sue.peters@sakilacustomer.org', 201, true, 1);
INSERT INTO public.customer VALUES (198, 2, 'Elsie', 'Kelley', 'elsie.kelley@sakilacustomer.org', 202, true, 1);
INSERT INTO public.customer VALUES (199, 2, 'Beth', 'Franklin', 'beth.franklin@sakilacustomer.org', 203, true, 1);
INSERT INTO public.customer VALUES (200, 2, 'Jeanne', 'Lawson', 'jeanne.lawson@sakilacustomer.org', 204, true, 1);
INSERT INTO public.customer VALUES (201, 1, 'Vicki', 'Fields', 'vicki.fields@sakilacustomer.org', 205, true, 1);
INSERT INTO public.customer VALUES (202, 2, 'Carla', 'Gutierrez', 'carla.gutierrez@sakilacustomer.org', 206, true, 1);
INSERT INTO public.customer VALUES (203, 1, 'Tara', 'Ryan', 'tara.ryan@sakilacustomer.org', 207, true, 1);
INSERT INTO public.customer VALUES (204, 1, 'Rosemary', 'Schmidt', 'rosemary.schmidt@sakilacustomer.org', 208, true, 1);
INSERT INTO public.customer VALUES (205, 2, 'Eileen', 'Carr', 'eileen.carr@sakilacustomer.org', 209, true, 1);
INSERT INTO public.customer VALUES (206, 1, 'Terri', 'Vasquez', 'terri.vasquez@sakilacustomer.org', 210, true, 1);
INSERT INTO public.customer VALUES (207, 1, 'Gertrude', 'Castillo', 'gertrude.castillo@sakilacustomer.org', 211, true, 1);
INSERT INTO public.customer VALUES (208, 1, 'Lucy', 'Wheeler', 'lucy.wheeler@sakilacustomer.org', 212, true, 1);
INSERT INTO public.customer VALUES (209, 2, 'Tonya', 'Chapman', 'tonya.chapman@sakilacustomer.org', 213, true, 1);
INSERT INTO public.customer VALUES (210, 2, 'Ella', 'Oliver', 'ella.oliver@sakilacustomer.org', 214, true, 1);
INSERT INTO public.customer VALUES (211, 1, 'Stacey', 'Montgomery', 'stacey.montgomery@sakilacustomer.org', 215, true, 1);
INSERT INTO public.customer VALUES (212, 2, 'Wilma', 'Richards', 'wilma.richards@sakilacustomer.org', 216, true, 1);
INSERT INTO public.customer VALUES (213, 1, 'Gina', 'Williamson', 'gina.williamson@sakilacustomer.org', 217, true, 1);
INSERT INTO public.customer VALUES (214, 1, 'Kristin', 'Johnston', 'kristin.johnston@sakilacustomer.org', 218, true, 1);
INSERT INTO public.customer VALUES (215, 2, 'Jessie', 'Banks', 'jessie.banks@sakilacustomer.org', 219, true, 1);
INSERT INTO public.customer VALUES (216, 1, 'Natalie', 'Meyer', 'natalie.meyer@sakilacustomer.org', 220, true, 1);
INSERT INTO public.customer VALUES (217, 2, 'Agnes', 'Bishop', 'agnes.bishop@sakilacustomer.org', 221, true, 1);
INSERT INTO public.customer VALUES (218, 1, 'Vera', 'Mccoy', 'vera.mccoy@sakilacustomer.org', 222, true, 1);
INSERT INTO public.customer VALUES (219, 2, 'Willie', 'Howell', 'willie.howell@sakilacustomer.org', 223, true, 1);
INSERT INTO public.customer VALUES (220, 2, 'Charlene', 'Alvarez', 'charlene.alvarez@sakilacustomer.org', 224, true, 1);
INSERT INTO public.customer VALUES (221, 1, 'Bessie', 'Morrison', 'bessie.morrison@sakilacustomer.org', 225, true, 1);
INSERT INTO public.customer VALUES (222, 2, 'Delores', 'Hansen', 'delores.hansen@sakilacustomer.org', 226, true, 1);
INSERT INTO public.customer VALUES (223, 1, 'Melinda', 'Fernandez', 'melinda.fernandez@sakilacustomer.org', 227, true, 1);
INSERT INTO public.customer VALUES (224, 2, 'Pearl', 'Garza', 'pearl.garza@sakilacustomer.org', 228, true, 1);
INSERT INTO public.customer VALUES (225, 1, 'Arlene', 'Harvey', 'arlene.harvey@sakilacustomer.org', 229, true, 1);
INSERT INTO public.customer VALUES (226, 2, 'Maureen', 'Little', 'maureen.little@sakilacustomer.org', 230, true, 1);
INSERT INTO public.customer VALUES (227, 1, 'Colleen', 'Burton', 'colleen.burton@sakilacustomer.org', 231, true, 1);
INSERT INTO public.customer VALUES (228, 2, 'Allison', 'Stanley', 'allison.stanley@sakilacustomer.org', 232, true, 1);
INSERT INTO public.customer VALUES (229, 1, 'Tamara', 'Nguyen', 'tamara.nguyen@sakilacustomer.org', 233, true, 1);
INSERT INTO public.customer VALUES (230, 2, 'Joy', 'George', 'joy.george@sakilacustomer.org', 234, true, 1);
INSERT INTO public.customer VALUES (231, 1, 'Georgia', 'Jacobs', 'georgia.jacobs@sakilacustomer.org', 235, true, 1);
INSERT INTO public.customer VALUES (232, 2, 'Constance', 'Reid', 'constance.reid@sakilacustomer.org', 236, true, 1);
INSERT INTO public.customer VALUES (233, 2, 'Lillie', 'Kim', 'lillie.kim@sakilacustomer.org', 237, true, 1);
INSERT INTO public.customer VALUES (234, 1, 'Claudia', 'Fuller', 'claudia.fuller@sakilacustomer.org', 238, true, 1);
INSERT INTO public.customer VALUES (235, 1, 'Jackie', 'Lynch', 'jackie.lynch@sakilacustomer.org', 239, true, 1);
INSERT INTO public.customer VALUES (236, 1, 'Marcia', 'Dean', 'marcia.dean@sakilacustomer.org', 240, true, 1);
INSERT INTO public.customer VALUES (237, 1, 'Tanya', 'Gilbert', 'tanya.gilbert@sakilacustomer.org', 241, true, 1);
INSERT INTO public.customer VALUES (238, 1, 'Nellie', 'Garrett', 'nellie.garrett@sakilacustomer.org', 242, true, 1);
INSERT INTO public.customer VALUES (239, 2, 'Minnie', 'Romero', 'minnie.romero@sakilacustomer.org', 243, true, 1);
INSERT INTO public.customer VALUES (240, 1, 'Marlene', 'Welch', 'marlene.welch@sakilacustomer.org', 244, true, 1);
INSERT INTO public.customer VALUES (241, 2, 'Heidi', 'Larson', 'heidi.larson@sakilacustomer.org', 245, true, 0);
INSERT INTO public.customer VALUES (242, 1, 'Glenda', 'Frazier', 'glenda.frazier@sakilacustomer.org', 246, true, 1);
INSERT INTO public.customer VALUES (243, 1, 'Lydia', 'Burke', 'lydia.burke@sakilacustomer.org', 247, true, 1);
INSERT INTO public.customer VALUES (244, 2, 'Viola', 'Hanson', 'viola.hanson@sakilacustomer.org', 248, true, 1);
INSERT INTO public.customer VALUES (245, 1, 'Courtney', 'Day', 'courtney.day@sakilacustomer.org', 249, true, 1);
INSERT INTO public.customer VALUES (246, 1, 'Marian', 'Mendoza', 'marian.mendoza@sakilacustomer.org', 250, true, 1);
INSERT INTO public.customer VALUES (247, 1, 'Stella', 'Moreno', 'stella.moreno@sakilacustomer.org', 251, true, 1);
INSERT INTO public.customer VALUES (248, 1, 'Caroline', 'Bowman', 'caroline.bowman@sakilacustomer.org', 252, true, 1);
INSERT INTO public.customer VALUES (249, 2, 'Dora', 'Medina', 'dora.medina@sakilacustomer.org', 253, true, 1);
INSERT INTO public.customer VALUES (250, 2, 'Jo', 'Fowler', 'jo.fowler@sakilacustomer.org', 254, true, 1);
INSERT INTO public.customer VALUES (251, 2, 'Vickie', 'Brewer', 'vickie.brewer@sakilacustomer.org', 255, true, 1);
INSERT INTO public.customer VALUES (252, 2, 'Mattie', 'Hoffman', 'mattie.hoffman@sakilacustomer.org', 256, true, 1);
INSERT INTO public.customer VALUES (253, 1, 'Terry', 'Carlson', 'terry.carlson@sakilacustomer.org', 258, true, 1);
INSERT INTO public.customer VALUES (254, 2, 'Maxine', 'Silva', 'maxine.silva@sakilacustomer.org', 259, true, 1);
INSERT INTO public.customer VALUES (255, 2, 'Irma', 'Pearson', 'irma.pearson@sakilacustomer.org', 260, true, 1);
INSERT INTO public.customer VALUES (256, 2, 'Mabel', 'Holland', 'mabel.holland@sakilacustomer.org', 261, true, 1);
INSERT INTO public.customer VALUES (257, 2, 'Marsha', 'Douglas', 'marsha.douglas@sakilacustomer.org', 262, true, 1);
INSERT INTO public.customer VALUES (258, 1, 'Myrtle', 'Fleming', 'myrtle.fleming@sakilacustomer.org', 263, true, 1);
INSERT INTO public.customer VALUES (259, 2, 'Lena', 'Jensen', 'lena.jensen@sakilacustomer.org', 264, true, 1);
INSERT INTO public.customer VALUES (260, 1, 'Christy', 'Vargas', 'christy.vargas@sakilacustomer.org', 265, true, 1);
INSERT INTO public.customer VALUES (261, 1, 'Deanna', 'Byrd', 'deanna.byrd@sakilacustomer.org', 266, true, 1);
INSERT INTO public.customer VALUES (262, 2, 'Patsy', 'Davidson', 'patsy.davidson@sakilacustomer.org', 267, true, 1);
INSERT INTO public.customer VALUES (263, 1, 'Hilda', 'Hopkins', 'hilda.hopkins@sakilacustomer.org', 268, true, 1);
INSERT INTO public.customer VALUES (264, 1, 'Gwendolyn', 'May', 'gwendolyn.may@sakilacustomer.org', 269, true, 1);
INSERT INTO public.customer VALUES (265, 2, 'Jennie', 'Terry', 'jennie.terry@sakilacustomer.org', 270, true, 1);
INSERT INTO public.customer VALUES (266, 2, 'Nora', 'Herrera', 'nora.herrera@sakilacustomer.org', 271, true, 1);
INSERT INTO public.customer VALUES (267, 1, 'Margie', 'Wade', 'margie.wade@sakilacustomer.org', 272, true, 1);
INSERT INTO public.customer VALUES (268, 1, 'Nina', 'Soto', 'nina.soto@sakilacustomer.org', 273, true, 1);
INSERT INTO public.customer VALUES (269, 1, 'Cassandra', 'Walters', 'cassandra.walters@sakilacustomer.org', 274, true, 1);
INSERT INTO public.customer VALUES (270, 1, 'Leah', 'Curtis', 'leah.curtis@sakilacustomer.org', 275, true, 1);
INSERT INTO public.customer VALUES (271, 1, 'Penny', 'Neal', 'penny.neal@sakilacustomer.org', 276, true, 0);
INSERT INTO public.customer VALUES (272, 1, 'Kay', 'Caldwell', 'kay.caldwell@sakilacustomer.org', 277, true, 1);
INSERT INTO public.customer VALUES (273, 2, 'Priscilla', 'Lowe', 'priscilla.lowe@sakilacustomer.org', 278, true, 1);
INSERT INTO public.customer VALUES (274, 1, 'Naomi', 'Jennings', 'naomi.jennings@sakilacustomer.org', 279, true, 1);
INSERT INTO public.customer VALUES (275, 2, 'Carole', 'Barnett', 'carole.barnett@sakilacustomer.org', 280, true, 1);
INSERT INTO public.customer VALUES (276, 1, 'Brandy', 'Graves', 'brandy.graves@sakilacustomer.org', 281, true, 1);
INSERT INTO public.customer VALUES (277, 2, 'Olga', 'Jimenez', 'olga.jimenez@sakilacustomer.org', 282, true, 1);
INSERT INTO public.customer VALUES (278, 2, 'Billie', 'Horton', 'billie.horton@sakilacustomer.org', 283, true, 1);
INSERT INTO public.customer VALUES (279, 2, 'Dianne', 'Shelton', 'dianne.shelton@sakilacustomer.org', 284, true, 1);
INSERT INTO public.customer VALUES (280, 2, 'Tracey', 'Barrett', 'tracey.barrett@sakilacustomer.org', 285, true, 1);
INSERT INTO public.customer VALUES (281, 2, 'Leona', 'Obrien', 'leona.obrien@sakilacustomer.org', 286, true, 1);
INSERT INTO public.customer VALUES (282, 2, 'Jenny', 'Castro', 'jenny.castro@sakilacustomer.org', 287, true, 1);
INSERT INTO public.customer VALUES (283, 1, 'Felicia', 'Sutton', 'felicia.sutton@sakilacustomer.org', 288, true, 1);
INSERT INTO public.customer VALUES (284, 1, 'Sonia', 'Gregory', 'sonia.gregory@sakilacustomer.org', 289, true, 1);
INSERT INTO public.customer VALUES (285, 1, 'Miriam', 'Mckinney', 'miriam.mckinney@sakilacustomer.org', 290, true, 1);
INSERT INTO public.customer VALUES (286, 1, 'Velma', 'Lucas', 'velma.lucas@sakilacustomer.org', 291, true, 1);
INSERT INTO public.customer VALUES (287, 2, 'Becky', 'Miles', 'becky.miles@sakilacustomer.org', 292, true, 1);
INSERT INTO public.customer VALUES (288, 1, 'Bobbie', 'Craig', 'bobbie.craig@sakilacustomer.org', 293, true, 1);
INSERT INTO public.customer VALUES (289, 1, 'Violet', 'Rodriquez', 'violet.rodriquez@sakilacustomer.org', 294, true, 1);
INSERT INTO public.customer VALUES (290, 1, 'Kristina', 'Chambers', 'kristina.chambers@sakilacustomer.org', 295, true, 1);
INSERT INTO public.customer VALUES (291, 1, 'Toni', 'Holt', 'toni.holt@sakilacustomer.org', 296, true, 1);
INSERT INTO public.customer VALUES (292, 2, 'Misty', 'Lambert', 'misty.lambert@sakilacustomer.org', 297, true, 1);
INSERT INTO public.customer VALUES (293, 2, 'Mae', 'Fletcher', 'mae.fletcher@sakilacustomer.org', 298, true, 1);
INSERT INTO public.customer VALUES (294, 2, 'Shelly', 'Watts', 'shelly.watts@sakilacustomer.org', 299, true, 1);
INSERT INTO public.customer VALUES (295, 1, 'Daisy', 'Bates', 'daisy.bates@sakilacustomer.org', 300, true, 1);
INSERT INTO public.customer VALUES (296, 2, 'Ramona', 'Hale', 'ramona.hale@sakilacustomer.org', 301, true, 1);
INSERT INTO public.customer VALUES (297, 1, 'Sherri', 'Rhodes', 'sherri.rhodes@sakilacustomer.org', 302, true, 1);
INSERT INTO public.customer VALUES (298, 1, 'Erika', 'Pena', 'erika.pena@sakilacustomer.org', 303, true, 1);
INSERT INTO public.customer VALUES (299, 2, 'James', 'Gannon', 'james.gannon@sakilacustomer.org', 304, true, 1);
INSERT INTO public.customer VALUES (300, 1, 'John', 'Farnsworth', 'john.farnsworth@sakilacustomer.org', 305, true, 1);
INSERT INTO public.customer VALUES (301, 2, 'Robert', 'Baughman', 'robert.baughman@sakilacustomer.org', 306, true, 1);
INSERT INTO public.customer VALUES (302, 1, 'Michael', 'Silverman', 'michael.silverman@sakilacustomer.org', 307, true, 1);
INSERT INTO public.customer VALUES (303, 2, 'William', 'Satterfield', 'william.satterfield@sakilacustomer.org', 308, true, 1);
INSERT INTO public.customer VALUES (304, 2, 'David', 'Royal', 'david.royal@sakilacustomer.org', 309, true, 1);
INSERT INTO public.customer VALUES (305, 1, 'Richard', 'Mccrary', 'richard.mccrary@sakilacustomer.org', 310, true, 1);
INSERT INTO public.customer VALUES (306, 1, 'Charles', 'Kowalski', 'charles.kowalski@sakilacustomer.org', 311, true, 1);
INSERT INTO public.customer VALUES (307, 2, 'Joseph', 'Joy', 'joseph.joy@sakilacustomer.org', 312, true, 1);
INSERT INTO public.customer VALUES (308, 1, 'Thomas', 'Grigsby', 'thomas.grigsby@sakilacustomer.org', 313, true, 1);
INSERT INTO public.customer VALUES (309, 1, 'Christopher', 'Greco', 'christopher.greco@sakilacustomer.org', 314, true, 1);
INSERT INTO public.customer VALUES (310, 2, 'Daniel', 'Cabral', 'daniel.cabral@sakilacustomer.org', 315, true, 1);
INSERT INTO public.customer VALUES (311, 2, 'Paul', 'Trout', 'paul.trout@sakilacustomer.org', 316, true, 1);
INSERT INTO public.customer VALUES (312, 2, 'Mark', 'Rinehart', 'mark.rinehart@sakilacustomer.org', 317, true, 1);
INSERT INTO public.customer VALUES (313, 2, 'Donald', 'Mahon', 'donald.mahon@sakilacustomer.org', 318, true, 1);
INSERT INTO public.customer VALUES (314, 1, 'George', 'Linton', 'george.linton@sakilacustomer.org', 319, true, 1);
INSERT INTO public.customer VALUES (315, 2, 'Kenneth', 'Gooden', 'kenneth.gooden@sakilacustomer.org', 320, true, 0);
INSERT INTO public.customer VALUES (316, 1, 'Steven', 'Curley', 'steven.curley@sakilacustomer.org', 321, true, 1);
INSERT INTO public.customer VALUES (317, 2, 'Edward', 'Baugh', 'edward.baugh@sakilacustomer.org', 322, true, 1);
INSERT INTO public.customer VALUES (318, 1, 'Brian', 'Wyman', 'brian.wyman@sakilacustomer.org', 323, true, 1);
INSERT INTO public.customer VALUES (319, 2, 'Ronald', 'Weiner', 'ronald.weiner@sakilacustomer.org', 324, true, 1);
INSERT INTO public.customer VALUES (320, 2, 'Anthony', 'Schwab', 'anthony.schwab@sakilacustomer.org', 325, true, 1);
INSERT INTO public.customer VALUES (321, 1, 'Kevin', 'Schuler', 'kevin.schuler@sakilacustomer.org', 326, true, 1);
INSERT INTO public.customer VALUES (322, 1, 'Jason', 'Morrissey', 'jason.morrissey@sakilacustomer.org', 327, true, 1);
INSERT INTO public.customer VALUES (323, 2, 'Matthew', 'Mahan', 'matthew.mahan@sakilacustomer.org', 328, true, 1);
INSERT INTO public.customer VALUES (324, 2, 'Gary', 'Coy', 'gary.coy@sakilacustomer.org', 329, true, 1);
INSERT INTO public.customer VALUES (325, 1, 'Timothy', 'Bunn', 'timothy.bunn@sakilacustomer.org', 330, true, 1);
INSERT INTO public.customer VALUES (326, 1, 'Jose', 'Andrew', 'jose.andrew@sakilacustomer.org', 331, true, 1);
INSERT INTO public.customer VALUES (327, 2, 'Larry', 'Thrasher', 'larry.thrasher@sakilacustomer.org', 332, true, 1);
INSERT INTO public.customer VALUES (328, 2, 'Jeffrey', 'Spear', 'jeffrey.spear@sakilacustomer.org', 333, true, 1);
INSERT INTO public.customer VALUES (329, 2, 'Frank', 'Waggoner', 'frank.waggoner@sakilacustomer.org', 334, true, 1);
INSERT INTO public.customer VALUES (330, 1, 'Scott', 'Shelley', 'scott.shelley@sakilacustomer.org', 335, true, 1);
INSERT INTO public.customer VALUES (331, 1, 'Eric', 'Robert', 'eric.robert@sakilacustomer.org', 336, true, 1);
INSERT INTO public.customer VALUES (332, 1, 'Stephen', 'Qualls', 'stephen.qualls@sakilacustomer.org', 337, true, 1);
INSERT INTO public.customer VALUES (333, 2, 'Andrew', 'Purdy', 'andrew.purdy@sakilacustomer.org', 338, true, 1);
INSERT INTO public.customer VALUES (334, 2, 'Raymond', 'Mcwhorter', 'raymond.mcwhorter@sakilacustomer.org', 339, true, 1);
INSERT INTO public.customer VALUES (335, 1, 'Gregory', 'Mauldin', 'gregory.mauldin@sakilacustomer.org', 340, true, 1);
INSERT INTO public.customer VALUES (336, 1, 'Joshua', 'Mark', 'joshua.mark@sakilacustomer.org', 341, true, 1);
INSERT INTO public.customer VALUES (337, 1, 'Jerry', 'Jordon', 'jerry.jordon@sakilacustomer.org', 342, true, 1);
INSERT INTO public.customer VALUES (338, 1, 'Dennis', 'Gilman', 'dennis.gilman@sakilacustomer.org', 343, true, 1);
INSERT INTO public.customer VALUES (339, 2, 'Walter', 'Perryman', 'walter.perryman@sakilacustomer.org', 344, true, 1);
INSERT INTO public.customer VALUES (340, 1, 'Patrick', 'Newsom', 'patrick.newsom@sakilacustomer.org', 345, true, 1);
INSERT INTO public.customer VALUES (341, 1, 'Peter', 'Menard', 'peter.menard@sakilacustomer.org', 346, true, 1);
INSERT INTO public.customer VALUES (342, 1, 'Harold', 'Martino', 'harold.martino@sakilacustomer.org', 347, true, 1);
INSERT INTO public.customer VALUES (343, 1, 'Douglas', 'Graf', 'douglas.graf@sakilacustomer.org', 348, true, 1);
INSERT INTO public.customer VALUES (344, 1, 'Henry', 'Billingsley', 'henry.billingsley@sakilacustomer.org', 349, true, 1);
INSERT INTO public.customer VALUES (345, 1, 'Carl', 'Artis', 'carl.artis@sakilacustomer.org', 350, true, 1);
INSERT INTO public.customer VALUES (346, 1, 'Arthur', 'Simpkins', 'arthur.simpkins@sakilacustomer.org', 351, true, 1);
INSERT INTO public.customer VALUES (347, 2, 'Ryan', 'Salisbury', 'ryan.salisbury@sakilacustomer.org', 352, true, 1);
INSERT INTO public.customer VALUES (348, 2, 'Roger', 'Quintanilla', 'roger.quintanilla@sakilacustomer.org', 353, true, 1);
INSERT INTO public.customer VALUES (349, 2, 'Joe', 'Gilliland', 'joe.gilliland@sakilacustomer.org', 354, true, 1);
INSERT INTO public.customer VALUES (350, 1, 'Juan', 'Fraley', 'juan.fraley@sakilacustomer.org', 355, true, 1);
INSERT INTO public.customer VALUES (351, 1, 'Jack', 'Foust', 'jack.foust@sakilacustomer.org', 356, true, 1);
INSERT INTO public.customer VALUES (352, 1, 'Albert', 'Crouse', 'albert.crouse@sakilacustomer.org', 357, true, 1);
INSERT INTO public.customer VALUES (353, 1, 'Jonathan', 'Scarborough', 'jonathan.scarborough@sakilacustomer.org', 358, true, 1);
INSERT INTO public.customer VALUES (354, 2, 'Justin', 'Ngo', 'justin.ngo@sakilacustomer.org', 359, true, 1);
INSERT INTO public.customer VALUES (355, 2, 'Terry', 'Grissom', 'terry.grissom@sakilacustomer.org', 360, true, 1);
INSERT INTO public.customer VALUES (356, 2, 'Gerald', 'Fultz', 'gerald.fultz@sakilacustomer.org', 361, true, 1);
INSERT INTO public.customer VALUES (357, 1, 'Keith', 'Rico', 'keith.rico@sakilacustomer.org', 362, true, 1);
INSERT INTO public.customer VALUES (358, 2, 'Samuel', 'Marlow', 'samuel.marlow@sakilacustomer.org', 363, true, 1);
INSERT INTO public.customer VALUES (359, 2, 'Willie', 'Markham', 'willie.markham@sakilacustomer.org', 364, true, 1);
INSERT INTO public.customer VALUES (360, 2, 'Ralph', 'Madrigal', 'ralph.madrigal@sakilacustomer.org', 365, true, 1);
INSERT INTO public.customer VALUES (361, 2, 'Lawrence', 'Lawton', 'lawrence.lawton@sakilacustomer.org', 366, true, 1);
INSERT INTO public.customer VALUES (362, 1, 'Nicholas', 'Barfield', 'nicholas.barfield@sakilacustomer.org', 367, true, 1);
INSERT INTO public.customer VALUES (363, 2, 'Roy', 'Whiting', 'roy.whiting@sakilacustomer.org', 368, true, 1);
INSERT INTO public.customer VALUES (364, 1, 'Benjamin', 'Varney', 'benjamin.varney@sakilacustomer.org', 369, true, 1);
INSERT INTO public.customer VALUES (365, 2, 'Bruce', 'Schwarz', 'bruce.schwarz@sakilacustomer.org', 370, true, 1);
INSERT INTO public.customer VALUES (366, 1, 'Brandon', 'Huey', 'brandon.huey@sakilacustomer.org', 371, true, 1);
INSERT INTO public.customer VALUES (367, 1, 'Adam', 'Gooch', 'adam.gooch@sakilacustomer.org', 372, true, 1);
INSERT INTO public.customer VALUES (368, 1, 'Harry', 'Arce', 'harry.arce@sakilacustomer.org', 373, true, 0);
INSERT INTO public.customer VALUES (369, 2, 'Fred', 'Wheat', 'fred.wheat@sakilacustomer.org', 374, true, 1);
INSERT INTO public.customer VALUES (370, 2, 'Wayne', 'Truong', 'wayne.truong@sakilacustomer.org', 375, true, 1);
INSERT INTO public.customer VALUES (371, 1, 'Billy', 'Poulin', 'billy.poulin@sakilacustomer.org', 376, true, 1);
INSERT INTO public.customer VALUES (372, 2, 'Steve', 'Mackenzie', 'steve.mackenzie@sakilacustomer.org', 377, true, 1);
INSERT INTO public.customer VALUES (373, 1, 'Louis', 'Leone', 'louis.leone@sakilacustomer.org', 378, true, 1);
INSERT INTO public.customer VALUES (374, 2, 'Jeremy', 'Hurtado', 'jeremy.hurtado@sakilacustomer.org', 379, true, 1);
INSERT INTO public.customer VALUES (375, 2, 'Aaron', 'Selby', 'aaron.selby@sakilacustomer.org', 380, true, 1);
INSERT INTO public.customer VALUES (376, 1, 'Randy', 'Gaither', 'randy.gaither@sakilacustomer.org', 381, true, 1);
INSERT INTO public.customer VALUES (377, 1, 'Howard', 'Fortner', 'howard.fortner@sakilacustomer.org', 382, true, 1);
INSERT INTO public.customer VALUES (378, 1, 'Eugene', 'Culpepper', 'eugene.culpepper@sakilacustomer.org', 383, true, 1);
INSERT INTO public.customer VALUES (379, 1, 'Carlos', 'Coughlin', 'carlos.coughlin@sakilacustomer.org', 384, true, 1);
INSERT INTO public.customer VALUES (380, 1, 'Russell', 'Brinson', 'russell.brinson@sakilacustomer.org', 385, true, 1);
INSERT INTO public.customer VALUES (381, 2, 'Bobby', 'Boudreau', 'bobby.boudreau@sakilacustomer.org', 386, true, 1);
INSERT INTO public.customer VALUES (382, 2, 'Victor', 'Barkley', 'victor.barkley@sakilacustomer.org', 387, true, 1);
INSERT INTO public.customer VALUES (383, 1, 'Martin', 'Bales', 'martin.bales@sakilacustomer.org', 388, true, 1);
INSERT INTO public.customer VALUES (384, 2, 'Ernest', 'Stepp', 'ernest.stepp@sakilacustomer.org', 389, true, 1);
INSERT INTO public.customer VALUES (385, 1, 'Phillip', 'Holm', 'phillip.holm@sakilacustomer.org', 390, true, 1);
INSERT INTO public.customer VALUES (386, 1, 'Todd', 'Tan', 'todd.tan@sakilacustomer.org', 391, true, 1);
INSERT INTO public.customer VALUES (387, 2, 'Jesse', 'Schilling', 'jesse.schilling@sakilacustomer.org', 392, true, 1);
INSERT INTO public.customer VALUES (388, 2, 'Craig', 'Morrell', 'craig.morrell@sakilacustomer.org', 393, true, 1);
INSERT INTO public.customer VALUES (389, 1, 'Alan', 'Kahn', 'alan.kahn@sakilacustomer.org', 394, true, 1);
INSERT INTO public.customer VALUES (390, 1, 'Shawn', 'Heaton', 'shawn.heaton@sakilacustomer.org', 395, true, 1);
INSERT INTO public.customer VALUES (391, 1, 'Clarence', 'Gamez', 'clarence.gamez@sakilacustomer.org', 396, true, 1);
INSERT INTO public.customer VALUES (392, 2, 'Sean', 'Douglass', 'sean.douglass@sakilacustomer.org', 397, true, 1);
INSERT INTO public.customer VALUES (393, 1, 'Philip', 'Causey', 'philip.causey@sakilacustomer.org', 398, true, 1);
INSERT INTO public.customer VALUES (394, 2, 'Chris', 'Brothers', 'chris.brothers@sakilacustomer.org', 399, true, 1);
INSERT INTO public.customer VALUES (395, 2, 'Johnny', 'Turpin', 'johnny.turpin@sakilacustomer.org', 400, true, 1);
INSERT INTO public.customer VALUES (396, 1, 'Earl', 'Shanks', 'earl.shanks@sakilacustomer.org', 401, true, 1);
INSERT INTO public.customer VALUES (397, 1, 'Jimmy', 'Schrader', 'jimmy.schrader@sakilacustomer.org', 402, true, 1);
INSERT INTO public.customer VALUES (398, 1, 'Antonio', 'Meek', 'antonio.meek@sakilacustomer.org', 403, true, 1);
INSERT INTO public.customer VALUES (399, 1, 'Danny', 'Isom', 'danny.isom@sakilacustomer.org', 404, true, 1);
INSERT INTO public.customer VALUES (400, 2, 'Bryan', 'Hardison', 'bryan.hardison@sakilacustomer.org', 405, true, 1);
INSERT INTO public.customer VALUES (401, 2, 'Tony', 'Carranza', 'tony.carranza@sakilacustomer.org', 406, true, 1);
INSERT INTO public.customer VALUES (402, 1, 'Luis', 'Yanez', 'luis.yanez@sakilacustomer.org', 407, true, 1);
INSERT INTO public.customer VALUES (403, 1, 'Mike', 'Way', 'mike.way@sakilacustomer.org', 408, true, 1);
INSERT INTO public.customer VALUES (404, 2, 'Stanley', 'Scroggins', 'stanley.scroggins@sakilacustomer.org', 409, true, 1);
INSERT INTO public.customer VALUES (405, 1, 'Leonard', 'Schofield', 'leonard.schofield@sakilacustomer.org', 410, true, 1);
INSERT INTO public.customer VALUES (406, 1, 'Nathan', 'Runyon', 'nathan.runyon@sakilacustomer.org', 411, true, 0);
INSERT INTO public.customer VALUES (407, 1, 'Dale', 'Ratcliff', 'dale.ratcliff@sakilacustomer.org', 412, true, 1);
INSERT INTO public.customer VALUES (408, 1, 'Manuel', 'Murrell', 'manuel.murrell@sakilacustomer.org', 413, true, 1);
INSERT INTO public.customer VALUES (409, 2, 'Rodney', 'Moeller', 'rodney.moeller@sakilacustomer.org', 414, true, 1);
INSERT INTO public.customer VALUES (410, 2, 'Curtis', 'Irby', 'curtis.irby@sakilacustomer.org', 415, true, 1);
INSERT INTO public.customer VALUES (411, 1, 'Norman', 'Currier', 'norman.currier@sakilacustomer.org', 416, true, 1);
INSERT INTO public.customer VALUES (412, 2, 'Allen', 'Butterfield', 'allen.butterfield@sakilacustomer.org', 417, true, 1);
INSERT INTO public.customer VALUES (413, 2, 'Marvin', 'Yee', 'marvin.yee@sakilacustomer.org', 418, true, 1);
INSERT INTO public.customer VALUES (414, 1, 'Vincent', 'Ralston', 'vincent.ralston@sakilacustomer.org', 419, true, 1);
INSERT INTO public.customer VALUES (415, 1, 'Glenn', 'Pullen', 'glenn.pullen@sakilacustomer.org', 420, true, 1);
INSERT INTO public.customer VALUES (416, 2, 'Jeffery', 'Pinson', 'jeffery.pinson@sakilacustomer.org', 421, true, 1);
INSERT INTO public.customer VALUES (417, 1, 'Travis', 'Estep', 'travis.estep@sakilacustomer.org', 422, true, 1);
INSERT INTO public.customer VALUES (418, 2, 'Jeff', 'East', 'jeff.east@sakilacustomer.org', 423, true, 1);
INSERT INTO public.customer VALUES (419, 1, 'Chad', 'Carbone', 'chad.carbone@sakilacustomer.org', 424, true, 1);
INSERT INTO public.customer VALUES (420, 1, 'Jacob', 'Lance', 'jacob.lance@sakilacustomer.org', 425, true, 1);
INSERT INTO public.customer VALUES (421, 1, 'Lee', 'Hawks', 'lee.hawks@sakilacustomer.org', 426, true, 1);
INSERT INTO public.customer VALUES (422, 1, 'Melvin', 'Ellington', 'melvin.ellington@sakilacustomer.org', 427, true, 1);
INSERT INTO public.customer VALUES (423, 2, 'Alfred', 'Casillas', 'alfred.casillas@sakilacustomer.org', 428, true, 1);
INSERT INTO public.customer VALUES (424, 2, 'Kyle', 'Spurlock', 'kyle.spurlock@sakilacustomer.org', 429, true, 1);
INSERT INTO public.customer VALUES (425, 2, 'Francis', 'Sikes', 'francis.sikes@sakilacustomer.org', 430, true, 1);
INSERT INTO public.customer VALUES (426, 1, 'Bradley', 'Motley', 'bradley.motley@sakilacustomer.org', 431, true, 1);
INSERT INTO public.customer VALUES (427, 2, 'Jesus', 'Mccartney', 'jesus.mccartney@sakilacustomer.org', 432, true, 1);
INSERT INTO public.customer VALUES (428, 2, 'Herbert', 'Kruger', 'herbert.kruger@sakilacustomer.org', 433, true, 1);
INSERT INTO public.customer VALUES (429, 2, 'Frederick', 'Isbell', 'frederick.isbell@sakilacustomer.org', 434, true, 1);
INSERT INTO public.customer VALUES (430, 1, 'Ray', 'Houle', 'ray.houle@sakilacustomer.org', 435, true, 1);
INSERT INTO public.customer VALUES (431, 2, 'Joel', 'Francisco', 'joel.francisco@sakilacustomer.org', 436, true, 1);
INSERT INTO public.customer VALUES (432, 1, 'Edwin', 'Burk', 'edwin.burk@sakilacustomer.org', 437, true, 1);
INSERT INTO public.customer VALUES (433, 1, 'Don', 'Bone', 'don.bone@sakilacustomer.org', 438, true, 1);
INSERT INTO public.customer VALUES (434, 1, 'Eddie', 'Tomlin', 'eddie.tomlin@sakilacustomer.org', 439, true, 1);
INSERT INTO public.customer VALUES (435, 2, 'Ricky', 'Shelby', 'ricky.shelby@sakilacustomer.org', 440, true, 1);
INSERT INTO public.customer VALUES (436, 1, 'Troy', 'Quigley', 'troy.quigley@sakilacustomer.org', 441, true, 1);
INSERT INTO public.customer VALUES (437, 2, 'Randall', 'Neumann', 'randall.neumann@sakilacustomer.org', 442, true, 1);
INSERT INTO public.customer VALUES (438, 1, 'Barry', 'Lovelace', 'barry.lovelace@sakilacustomer.org', 443, true, 1);
INSERT INTO public.customer VALUES (439, 2, 'Alexander', 'Fennell', 'alexander.fennell@sakilacustomer.org', 444, true, 1);
INSERT INTO public.customer VALUES (440, 1, 'Bernard', 'Colby', 'bernard.colby@sakilacustomer.org', 445, true, 1);
INSERT INTO public.customer VALUES (441, 1, 'Mario', 'Cheatham', 'mario.cheatham@sakilacustomer.org', 446, true, 1);
INSERT INTO public.customer VALUES (442, 1, 'Leroy', 'Bustamante', 'leroy.bustamante@sakilacustomer.org', 447, true, 1);
INSERT INTO public.customer VALUES (443, 2, 'Francisco', 'Skidmore', 'francisco.skidmore@sakilacustomer.org', 448, true, 1);
INSERT INTO public.customer VALUES (444, 2, 'Marcus', 'Hidalgo', 'marcus.hidalgo@sakilacustomer.org', 449, true, 1);
INSERT INTO public.customer VALUES (445, 1, 'Micheal', 'Forman', 'micheal.forman@sakilacustomer.org', 450, true, 1);
INSERT INTO public.customer VALUES (446, 2, 'Theodore', 'Culp', 'theodore.culp@sakilacustomer.org', 451, true, 0);
INSERT INTO public.customer VALUES (447, 1, 'Clifford', 'Bowens', 'clifford.bowens@sakilacustomer.org', 452, true, 1);
INSERT INTO public.customer VALUES (448, 1, 'Miguel', 'Betancourt', 'miguel.betancourt@sakilacustomer.org', 453, true, 1);
INSERT INTO public.customer VALUES (449, 2, 'Oscar', 'Aquino', 'oscar.aquino@sakilacustomer.org', 454, true, 1);
INSERT INTO public.customer VALUES (450, 1, 'Jay', 'Robb', 'jay.robb@sakilacustomer.org', 455, true, 1);
INSERT INTO public.customer VALUES (451, 1, 'Jim', 'Rea', 'jim.rea@sakilacustomer.org', 456, true, 1);
INSERT INTO public.customer VALUES (452, 1, 'Tom', 'Milner', 'tom.milner@sakilacustomer.org', 457, true, 1);
INSERT INTO public.customer VALUES (453, 1, 'Calvin', 'Martel', 'calvin.martel@sakilacustomer.org', 458, true, 1);
INSERT INTO public.customer VALUES (454, 2, 'Alex', 'Gresham', 'alex.gresham@sakilacustomer.org', 459, true, 1);
INSERT INTO public.customer VALUES (455, 2, 'Jon', 'Wiles', 'jon.wiles@sakilacustomer.org', 460, true, 1);
INSERT INTO public.customer VALUES (456, 2, 'Ronnie', 'Ricketts', 'ronnie.ricketts@sakilacustomer.org', 461, true, 1);
INSERT INTO public.customer VALUES (457, 2, 'Bill', 'Gavin', 'bill.gavin@sakilacustomer.org', 462, true, 1);
INSERT INTO public.customer VALUES (458, 1, 'Lloyd', 'Dowd', 'lloyd.dowd@sakilacustomer.org', 463, true, 1);
INSERT INTO public.customer VALUES (459, 1, 'Tommy', 'Collazo', 'tommy.collazo@sakilacustomer.org', 464, true, 1);
INSERT INTO public.customer VALUES (460, 1, 'Leon', 'Bostic', 'leon.bostic@sakilacustomer.org', 465, true, 1);
INSERT INTO public.customer VALUES (461, 1, 'Derek', 'Blakely', 'derek.blakely@sakilacustomer.org', 466, true, 1);
INSERT INTO public.customer VALUES (462, 2, 'Warren', 'Sherrod', 'warren.sherrod@sakilacustomer.org', 467, true, 1);
INSERT INTO public.customer VALUES (463, 2, 'Darrell', 'Power', 'darrell.power@sakilacustomer.org', 468, true, 1);
INSERT INTO public.customer VALUES (464, 1, 'Jerome', 'Kenyon', 'jerome.kenyon@sakilacustomer.org', 469, true, 1);
INSERT INTO public.customer VALUES (465, 1, 'Floyd', 'Gandy', 'floyd.gandy@sakilacustomer.org', 470, true, 1);
INSERT INTO public.customer VALUES (466, 1, 'Leo', 'Ebert', 'leo.ebert@sakilacustomer.org', 471, true, 1);
INSERT INTO public.customer VALUES (467, 2, 'Alvin', 'Deloach', 'alvin.deloach@sakilacustomer.org', 472, true, 1);
INSERT INTO public.customer VALUES (468, 1, 'Tim', 'Cary', 'tim.cary@sakilacustomer.org', 473, true, 1);
INSERT INTO public.customer VALUES (469, 2, 'Wesley', 'Bull', 'wesley.bull@sakilacustomer.org', 474, true, 1);
INSERT INTO public.customer VALUES (470, 1, 'Gordon', 'Allard', 'gordon.allard@sakilacustomer.org', 475, true, 1);
INSERT INTO public.customer VALUES (471, 1, 'Dean', 'Sauer', 'dean.sauer@sakilacustomer.org', 476, true, 1);
INSERT INTO public.customer VALUES (472, 1, 'Greg', 'Robins', 'greg.robins@sakilacustomer.org', 477, true, 1);
INSERT INTO public.customer VALUES (473, 2, 'Jorge', 'Olivares', 'jorge.olivares@sakilacustomer.org', 478, true, 1);
INSERT INTO public.customer VALUES (474, 2, 'Dustin', 'Gillette', 'dustin.gillette@sakilacustomer.org', 479, true, 1);
INSERT INTO public.customer VALUES (475, 2, 'Pedro', 'Chestnut', 'pedro.chestnut@sakilacustomer.org', 480, true, 1);
INSERT INTO public.customer VALUES (476, 1, 'Derrick', 'Bourque', 'derrick.bourque@sakilacustomer.org', 481, true, 1);
INSERT INTO public.customer VALUES (477, 1, 'Dan', 'Paine', 'dan.paine@sakilacustomer.org', 482, true, 1);
INSERT INTO public.customer VALUES (478, 1, 'Lewis', 'Lyman', 'lewis.lyman@sakilacustomer.org', 483, true, 1);
INSERT INTO public.customer VALUES (479, 1, 'Zachary', 'Hite', 'zachary.hite@sakilacustomer.org', 484, true, 1);
INSERT INTO public.customer VALUES (480, 1, 'Corey', 'Hauser', 'corey.hauser@sakilacustomer.org', 485, true, 1);
INSERT INTO public.customer VALUES (481, 1, 'Herman', 'Devore', 'herman.devore@sakilacustomer.org', 486, true, 1);
INSERT INTO public.customer VALUES (482, 1, 'Maurice', 'Crawley', 'maurice.crawley@sakilacustomer.org', 487, true, 0);
INSERT INTO public.customer VALUES (483, 2, 'Vernon', 'Chapa', 'vernon.chapa@sakilacustomer.org', 488, true, 1);
INSERT INTO public.customer VALUES (484, 1, 'Roberto', 'Vu', 'roberto.vu@sakilacustomer.org', 489, true, 1);
INSERT INTO public.customer VALUES (485, 1, 'Clyde', 'Tobias', 'clyde.tobias@sakilacustomer.org', 490, true, 1);
INSERT INTO public.customer VALUES (486, 1, 'Glen', 'Talbert', 'glen.talbert@sakilacustomer.org', 491, true, 1);
INSERT INTO public.customer VALUES (487, 2, 'Hector', 'Poindexter', 'hector.poindexter@sakilacustomer.org', 492, true, 1);
INSERT INTO public.customer VALUES (488, 2, 'Shane', 'Millard', 'shane.millard@sakilacustomer.org', 493, true, 1);
INSERT INTO public.customer VALUES (489, 1, 'Ricardo', 'Meador', 'ricardo.meador@sakilacustomer.org', 494, true, 1);
INSERT INTO public.customer VALUES (490, 1, 'Sam', 'Mcduffie', 'sam.mcduffie@sakilacustomer.org', 495, true, 1);
INSERT INTO public.customer VALUES (491, 2, 'Rick', 'Mattox', 'rick.mattox@sakilacustomer.org', 496, true, 1);
INSERT INTO public.customer VALUES (492, 2, 'Lester', 'Kraus', 'lester.kraus@sakilacustomer.org', 497, true, 1);
INSERT INTO public.customer VALUES (493, 1, 'Brent', 'Harkins', 'brent.harkins@sakilacustomer.org', 498, true, 1);
INSERT INTO public.customer VALUES (494, 2, 'Ramon', 'Choate', 'ramon.choate@sakilacustomer.org', 499, true, 1);
INSERT INTO public.customer VALUES (495, 2, 'Charlie', 'Bess', 'charlie.bess@sakilacustomer.org', 500, true, 1);
INSERT INTO public.customer VALUES (496, 2, 'Tyler', 'Wren', 'tyler.wren@sakilacustomer.org', 501, true, 1);
INSERT INTO public.customer VALUES (497, 2, 'Gilbert', 'Sledge', 'gilbert.sledge@sakilacustomer.org', 502, true, 1);
INSERT INTO public.customer VALUES (498, 1, 'Gene', 'Sanborn', 'gene.sanborn@sakilacustomer.org', 503, true, 1);
INSERT INTO public.customer VALUES (499, 2, 'Marc', 'Outlaw', 'marc.outlaw@sakilacustomer.org', 504, true, 1);
INSERT INTO public.customer VALUES (500, 1, 'Reginald', 'Kinder', 'reginald.kinder@sakilacustomer.org', 505, true, 1);
INSERT INTO public.customer VALUES (501, 1, 'Ruben', 'Geary', 'ruben.geary@sakilacustomer.org', 506, true, 1);
INSERT INTO public.customer VALUES (502, 1, 'Brett', 'Cornwell', 'brett.cornwell@sakilacustomer.org', 507, true, 1);
INSERT INTO public.customer VALUES (503, 1, 'Angel', 'Barclay', 'angel.barclay@sakilacustomer.org', 508, true, 1);
INSERT INTO public.customer VALUES (504, 1, 'Nathaniel', 'Adam', 'nathaniel.adam@sakilacustomer.org', 509, true, 1);
INSERT INTO public.customer VALUES (505, 1, 'Rafael', 'Abney', 'rafael.abney@sakilacustomer.org', 510, true, 1);
INSERT INTO public.customer VALUES (506, 2, 'Leslie', 'Seward', 'leslie.seward@sakilacustomer.org', 511, true, 1);
INSERT INTO public.customer VALUES (507, 2, 'Edgar', 'Rhoads', 'edgar.rhoads@sakilacustomer.org', 512, true, 1);
INSERT INTO public.customer VALUES (508, 2, 'Milton', 'Howland', 'milton.howland@sakilacustomer.org', 513, true, 1);
INSERT INTO public.customer VALUES (509, 1, 'Raul', 'Fortier', 'raul.fortier@sakilacustomer.org', 514, true, 1);
INSERT INTO public.customer VALUES (510, 2, 'Ben', 'Easter', 'ben.easter@sakilacustomer.org', 515, true, 0);
INSERT INTO public.customer VALUES (511, 1, 'Chester', 'Benner', 'chester.benner@sakilacustomer.org', 516, true, 1);
INSERT INTO public.customer VALUES (512, 1, 'Cecil', 'Vines', 'cecil.vines@sakilacustomer.org', 517, true, 1);
INSERT INTO public.customer VALUES (513, 2, 'Duane', 'Tubbs', 'duane.tubbs@sakilacustomer.org', 519, true, 1);
INSERT INTO public.customer VALUES (514, 2, 'Franklin', 'Troutman', 'franklin.troutman@sakilacustomer.org', 520, true, 1);
INSERT INTO public.customer VALUES (515, 1, 'Andre', 'Rapp', 'andre.rapp@sakilacustomer.org', 521, true, 1);
INSERT INTO public.customer VALUES (516, 2, 'Elmer', 'Noe', 'elmer.noe@sakilacustomer.org', 522, true, 1);
INSERT INTO public.customer VALUES (517, 2, 'Brad', 'Mccurdy', 'brad.mccurdy@sakilacustomer.org', 523, true, 1);
INSERT INTO public.customer VALUES (518, 1, 'Gabriel', 'Harder', 'gabriel.harder@sakilacustomer.org', 524, true, 1);
INSERT INTO public.customer VALUES (519, 2, 'Ron', 'Deluca', 'ron.deluca@sakilacustomer.org', 525, true, 1);
INSERT INTO public.customer VALUES (520, 2, 'Mitchell', 'Westmoreland', 'mitchell.westmoreland@sakilacustomer.org', 526, true, 1);
INSERT INTO public.customer VALUES (521, 2, 'Roland', 'South', 'roland.south@sakilacustomer.org', 527, true, 1);
INSERT INTO public.customer VALUES (522, 2, 'Arnold', 'Havens', 'arnold.havens@sakilacustomer.org', 528, true, 1);
INSERT INTO public.customer VALUES (523, 1, 'Harvey', 'Guajardo', 'harvey.guajardo@sakilacustomer.org', 529, true, 1);
INSERT INTO public.customer VALUES (525, 2, 'Adrian', 'Clary', 'adrian.clary@sakilacustomer.org', 531, true, 1);
INSERT INTO public.customer VALUES (526, 2, 'Karl', 'Seal', 'karl.seal@sakilacustomer.org', 532, true, 1);
INSERT INTO public.customer VALUES (527, 1, 'Cory', 'Meehan', 'cory.meehan@sakilacustomer.org', 533, true, 1);
INSERT INTO public.customer VALUES (528, 1, 'Claude', 'Herzog', 'claude.herzog@sakilacustomer.org', 534, true, 1);
INSERT INTO public.customer VALUES (529, 2, 'Erik', 'Guillen', 'erik.guillen@sakilacustomer.org', 535, true, 1);
INSERT INTO public.customer VALUES (530, 2, 'Darryl', 'Ashcraft', 'darryl.ashcraft@sakilacustomer.org', 536, true, 1);
INSERT INTO public.customer VALUES (531, 2, 'Jamie', 'Waugh', 'jamie.waugh@sakilacustomer.org', 537, true, 1);
INSERT INTO public.customer VALUES (532, 2, 'Neil', 'Renner', 'neil.renner@sakilacustomer.org', 538, true, 1);
INSERT INTO public.customer VALUES (533, 1, 'Jessie', 'Milam', 'jessie.milam@sakilacustomer.org', 539, true, 1);
INSERT INTO public.customer VALUES (534, 1, 'Christian', 'Jung', 'christian.jung@sakilacustomer.org', 540, true, 0);
INSERT INTO public.customer VALUES (535, 1, 'Javier', 'Elrod', 'javier.elrod@sakilacustomer.org', 541, true, 1);
INSERT INTO public.customer VALUES (536, 2, 'Fernando', 'Churchill', 'fernando.churchill@sakilacustomer.org', 542, true, 1);
INSERT INTO public.customer VALUES (537, 2, 'Clinton', 'Buford', 'clinton.buford@sakilacustomer.org', 543, true, 1);
INSERT INTO public.customer VALUES (538, 2, 'Ted', 'Breaux', 'ted.breaux@sakilacustomer.org', 544, true, 1);
INSERT INTO public.customer VALUES (539, 1, 'Mathew', 'Bolin', 'mathew.bolin@sakilacustomer.org', 545, true, 1);
INSERT INTO public.customer VALUES (540, 1, 'Tyrone', 'Asher', 'tyrone.asher@sakilacustomer.org', 546, true, 1);
INSERT INTO public.customer VALUES (541, 2, 'Darren', 'Windham', 'darren.windham@sakilacustomer.org', 547, true, 1);
INSERT INTO public.customer VALUES (542, 2, 'Lonnie', 'Tirado', 'lonnie.tirado@sakilacustomer.org', 548, true, 1);
INSERT INTO public.customer VALUES (543, 1, 'Lance', 'Pemberton', 'lance.pemberton@sakilacustomer.org', 549, true, 1);
INSERT INTO public.customer VALUES (544, 2, 'Cody', 'Nolen', 'cody.nolen@sakilacustomer.org', 550, true, 1);
INSERT INTO public.customer VALUES (545, 2, 'Julio', 'Noland', 'julio.noland@sakilacustomer.org', 551, true, 1);
INSERT INTO public.customer VALUES (546, 1, 'Kelly', 'Knott', 'kelly.knott@sakilacustomer.org', 552, true, 1);
INSERT INTO public.customer VALUES (547, 1, 'Kurt', 'Emmons', 'kurt.emmons@sakilacustomer.org', 553, true, 1);
INSERT INTO public.customer VALUES (548, 1, 'Allan', 'Cornish', 'allan.cornish@sakilacustomer.org', 554, true, 1);
INSERT INTO public.customer VALUES (549, 1, 'Nelson', 'Christenson', 'nelson.christenson@sakilacustomer.org', 555, true, 1);
INSERT INTO public.customer VALUES (550, 2, 'Guy', 'Brownlee', 'guy.brownlee@sakilacustomer.org', 556, true, 1);
INSERT INTO public.customer VALUES (551, 2, 'Clayton', 'Barbee', 'clayton.barbee@sakilacustomer.org', 557, true, 1);
INSERT INTO public.customer VALUES (552, 2, 'Hugh', 'Waldrop', 'hugh.waldrop@sakilacustomer.org', 558, true, 1);
INSERT INTO public.customer VALUES (553, 1, 'Max', 'Pitt', 'max.pitt@sakilacustomer.org', 559, true, 1);
INSERT INTO public.customer VALUES (554, 1, 'Dwayne', 'Olvera', 'dwayne.olvera@sakilacustomer.org', 560, true, 1);
INSERT INTO public.customer VALUES (555, 1, 'Dwight', 'Lombardi', 'dwight.lombardi@sakilacustomer.org', 561, true, 1);
INSERT INTO public.customer VALUES (556, 2, 'Armando', 'Gruber', 'armando.gruber@sakilacustomer.org', 562, true, 1);
INSERT INTO public.customer VALUES (557, 1, 'Felix', 'Gaffney', 'felix.gaffney@sakilacustomer.org', 563, true, 1);
INSERT INTO public.customer VALUES (558, 1, 'Jimmie', 'Eggleston', 'jimmie.eggleston@sakilacustomer.org', 564, true, 0);
INSERT INTO public.customer VALUES (559, 2, 'Everett', 'Banda', 'everett.banda@sakilacustomer.org', 565, true, 1);
INSERT INTO public.customer VALUES (560, 1, 'Jordan', 'Archuleta', 'jordan.archuleta@sakilacustomer.org', 566, true, 1);
INSERT INTO public.customer VALUES (561, 2, 'Ian', 'Still', 'ian.still@sakilacustomer.org', 567, true, 1);
INSERT INTO public.customer VALUES (562, 1, 'Wallace', 'Slone', 'wallace.slone@sakilacustomer.org', 568, true, 1);
INSERT INTO public.customer VALUES (563, 2, 'Ken', 'Prewitt', 'ken.prewitt@sakilacustomer.org', 569, true, 1);
INSERT INTO public.customer VALUES (564, 2, 'Bob', 'Pfeiffer', 'bob.pfeiffer@sakilacustomer.org', 570, true, 1);
INSERT INTO public.customer VALUES (565, 2, 'Jaime', 'Nettles', 'jaime.nettles@sakilacustomer.org', 571, true, 1);
INSERT INTO public.customer VALUES (566, 1, 'Casey', 'Mena', 'casey.mena@sakilacustomer.org', 572, true, 1);
INSERT INTO public.customer VALUES (567, 2, 'Alfredo', 'Mcadams', 'alfredo.mcadams@sakilacustomer.org', 573, true, 1);
INSERT INTO public.customer VALUES (568, 2, 'Alberto', 'Henning', 'alberto.henning@sakilacustomer.org', 574, true, 1);
INSERT INTO public.customer VALUES (569, 2, 'Dave', 'Gardiner', 'dave.gardiner@sakilacustomer.org', 575, true, 1);
INSERT INTO public.customer VALUES (570, 2, 'Ivan', 'Cromwell', 'ivan.cromwell@sakilacustomer.org', 576, true, 1);
INSERT INTO public.customer VALUES (571, 2, 'Johnnie', 'Chisholm', 'johnnie.chisholm@sakilacustomer.org', 577, true, 1);
INSERT INTO public.customer VALUES (572, 1, 'Sidney', 'Burleson', 'sidney.burleson@sakilacustomer.org', 578, true, 1);
INSERT INTO public.customer VALUES (573, 1, 'Byron', 'Box', 'byron.box@sakilacustomer.org', 579, true, 1);
INSERT INTO public.customer VALUES (574, 2, 'Julian', 'Vest', 'julian.vest@sakilacustomer.org', 580, true, 1);
INSERT INTO public.customer VALUES (575, 2, 'Isaac', 'Oglesby', 'isaac.oglesby@sakilacustomer.org', 581, true, 1);
INSERT INTO public.customer VALUES (576, 2, 'Morris', 'Mccarter', 'morris.mccarter@sakilacustomer.org', 582, true, 1);
INSERT INTO public.customer VALUES (577, 2, 'Clifton', 'Malcolm', 'clifton.malcolm@sakilacustomer.org', 583, true, 1);
INSERT INTO public.customer VALUES (578, 2, 'Willard', 'Lumpkin', 'willard.lumpkin@sakilacustomer.org', 584, true, 1);
INSERT INTO public.customer VALUES (579, 2, 'Daryl', 'Larue', 'daryl.larue@sakilacustomer.org', 585, true, 1);
INSERT INTO public.customer VALUES (580, 1, 'Ross', 'Grey', 'ross.grey@sakilacustomer.org', 586, true, 1);
INSERT INTO public.customer VALUES (581, 1, 'Virgil', 'Wofford', 'virgil.wofford@sakilacustomer.org', 587, true, 1);
INSERT INTO public.customer VALUES (582, 2, 'Andy', 'Vanhorn', 'andy.vanhorn@sakilacustomer.org', 588, true, 1);
INSERT INTO public.customer VALUES (583, 1, 'Marshall', 'Thorn', 'marshall.thorn@sakilacustomer.org', 589, true, 1);
INSERT INTO public.customer VALUES (584, 2, 'Salvador', 'Teel', 'salvador.teel@sakilacustomer.org', 590, true, 1);
INSERT INTO public.customer VALUES (585, 1, 'Perry', 'Swafford', 'perry.swafford@sakilacustomer.org', 591, true, 1);
INSERT INTO public.customer VALUES (586, 1, 'Kirk', 'Stclair', 'kirk.stclair@sakilacustomer.org', 592, true, 1);
INSERT INTO public.customer VALUES (587, 1, 'Sergio', 'Stanfield', 'sergio.stanfield@sakilacustomer.org', 593, true, 1);
INSERT INTO public.customer VALUES (588, 1, 'Marion', 'Ocampo', 'marion.ocampo@sakilacustomer.org', 594, true, 1);
INSERT INTO public.customer VALUES (589, 1, 'Tracy', 'Herrmann', 'tracy.herrmann@sakilacustomer.org', 595, true, 1);
INSERT INTO public.customer VALUES (590, 2, 'Seth', 'Hannon', 'seth.hannon@sakilacustomer.org', 596, true, 1);
INSERT INTO public.customer VALUES (591, 1, 'Kent', 'Arsenault', 'kent.arsenault@sakilacustomer.org', 597, true, 1);
INSERT INTO public.customer VALUES (592, 1, 'Terrance', 'Roush', 'terrance.roush@sakilacustomer.org', 598, true, 0);
INSERT INTO public.customer VALUES (593, 2, 'Rene', 'Mcalister', 'rene.mcalister@sakilacustomer.org', 599, true, 1);
INSERT INTO public.customer VALUES (594, 1, 'Eduardo', 'Hiatt', 'eduardo.hiatt@sakilacustomer.org', 600, true, 1);
INSERT INTO public.customer VALUES (595, 1, 'Terrence', 'Gunderson', 'terrence.gunderson@sakilacustomer.org', 601, true, 1);
INSERT INTO public.customer VALUES (596, 1, 'Enrique', 'Forsythe', 'enrique.forsythe@sakilacustomer.org', 602, true, 1);
INSERT INTO public.customer VALUES (597, 1, 'Freddie', 'Duggan', 'freddie.duggan@sakilacustomer.org', 603, true, 1);
INSERT INTO public.customer VALUES (598, 1, 'Wade', 'Delvalle', 'wade.delvalle@sakilacustomer.org', 604, true, 1);
INSERT INTO public.customer VALUES (599, 2, 'Austin', 'Cintron', 'austin.cintron@sakilacustomer.org', 605, true, 1);


--
-- TOC entry 2970 (class 0 OID 18455)
-- Dependencies: 209
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.film VALUES (133, 'Chamber Italian', 'A Fateful Reflection of a Moose And a Husband who must Overcome a Monkey in Nigeria', 2006, 1, 7, 4.99, 117, 14.99, 'NC-17');
INSERT INTO public.film VALUES (384, 'Grosse Wonderful', 'A Epic Drama of a Cat And a Explorer who must Redeem a Moose in Australia', 2006, 1, 5, 4.99, 49, 19.99, 'R');
INSERT INTO public.film VALUES (8, 'Airport Pollock', 'A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India', 2006, 1, 6, 4.99, 54, 15.99, 'R');
INSERT INTO public.film VALUES (1, 'Academy Dinosaur', 'A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies', 2006, 1, 6, 0.99, 86, 20.99, 'PG');
INSERT INTO public.film VALUES (2, 'Ace Goldfinger', 'A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China', 2006, 1, 3, 4.99, 48, 12.99, 'G');
INSERT INTO public.film VALUES (3, 'Adaptation Holes', 'A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory', 2006, 1, 7, 2.99, 50, 18.99, 'NC-17');
INSERT INTO public.film VALUES (4, 'Affair Prejudice', 'A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank', 2006, 1, 5, 2.99, 117, 26.99, 'G');
INSERT INTO public.film VALUES (5, 'African Egg', 'A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico', 2006, 1, 6, 2.99, 130, 22.99, 'G');
INSERT INTO public.film VALUES (6, 'Agent Truman', 'A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China', 2006, 1, 3, 2.99, 169, 17.99, 'PG');
INSERT INTO public.film VALUES (7, 'Airplane Sierra', 'A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat', 2006, 1, 6, 4.99, 62, 28.99, 'PG-13');
INSERT INTO public.film VALUES (9, 'Alabama Devil', 'A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat', 2006, 1, 3, 2.99, 114, 21.99, 'PG-13');
INSERT INTO public.film VALUES (10, 'Aladdin Calendar', 'A Action-Packed Tale of a Man And a Lumberjack who must Reach a Feminist in Ancient China', 2006, 1, 6, 4.99, 63, 24.99, 'NC-17');
INSERT INTO public.film VALUES (11, 'Alamo Videotape', 'A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention', 2006, 1, 6, 0.99, 126, 16.99, 'G');
INSERT INTO public.film VALUES (12, 'Alaska Phantom', 'A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia', 2006, 1, 6, 0.99, 136, 22.99, 'PG');
INSERT INTO public.film VALUES (213, 'Date Speed', 'A Touching Saga of a Composer And a Moose who must Discover a Dentist in A MySQL Convention', 2006, 1, 4, 0.99, 104, 19.99, 'R');
INSERT INTO public.film VALUES (13, 'Ali Forever', 'A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies', 2006, 1, 4, 4.99, 150, 21.99, 'PG');
INSERT INTO public.film VALUES (14, 'Alice Fantasia', 'A Emotional Drama of a A Shark And a Database Administrator who must Vanquish a Pioneer in Soviet Georgia', 2006, 1, 6, 0.99, 94, 23.99, 'NC-17');
INSERT INTO public.film VALUES (15, 'Alien Center', 'A Brilliant Drama of a Cat And a Mad Scientist who must Battle a Feminist in A MySQL Convention', 2006, 1, 5, 2.99, 46, 10.99, 'NC-17');
INSERT INTO public.film VALUES (31, 'Apache Divine', 'A Awe-Inspiring Reflection of a Pastry Chef And a Teacher who must Overcome a Sumo Wrestler in A U-Boat', 2006, 3, 5, 4.99, 92, 16.99, 'NC-17');
INSERT INTO public.film VALUES (32, 'Apocalypse Flamingos', 'A Astounding Story of a Dog And a Squirrel who must Defeat a Woman in An Abandoned Amusement Park', 2006, 3, 6, 4.99, 119, 11.99, 'R');
INSERT INTO public.film VALUES (33, 'Apollo Teen', 'A Action-Packed Reflection of a Crocodile And a Explorer who must Find a Sumo Wrestler in An Abandoned Mine Shaft', 2006, 3, 5, 2.99, 153, 15.99, 'PG-13');
INSERT INTO public.film VALUES (265, 'Dying Maker', 'A Intrepid Tale of a Boat And a Monkey who must Kill a Cat in California', 2006, 1, 5, 4.99, 168, 28.99, 'PG');
INSERT INTO public.film VALUES (46, 'Autumn Crow', 'A Beautiful Tale of a Dentist And a Mad Cow who must Battle a Moose in The Sahara Desert', 2006, 1, 3, 4.99, 108, 13.99, 'G');
INSERT INTO public.film VALUES (47, 'Baby Hall', 'A Boring Character Study of a A Shark And a Girl who must Outrace a Feminist in An Abandoned Mine Shaft', 2006, 4, 5, 4.99, 153, 23.99, 'NC-17');
INSERT INTO public.film VALUES (48, 'Backlash Undefeated', 'A Stunning Character Study of a Mad Scientist And a Mad Cow who must Kill a Car in A Monastery', 2006, 4, 3, 4.99, 118, 24.99, 'PG-13');
INSERT INTO public.film VALUES (49, 'Badman Dawn', 'A Emotional Panorama of a Pioneer And a Composer who must Escape a Mad Scientist in A Jet Boat', 2006, 4, 6, 2.99, 162, 22.99, 'R');
INSERT INTO public.film VALUES (50, 'Baked Cleopatra', 'A Stunning Drama of a Forensic Psychologist And a Husband who must Overcome a Waitress in A Monastery', 2006, 4, 3, 2.99, 182, 20.99, 'G');
INSERT INTO public.film VALUES (126, 'Casualties Encino', 'A Insightful Yarn of a A Shark And a Pastry Chef who must Face a Boy in A Monastery', 2006, 1, 3, 4.99, 179, 16.99, 'G');
INSERT INTO public.film VALUES (61, 'Beauty Grease', 'A Fast-Paced Display of a Composer And a Moose who must Sink a Robot in An Abandoned Mine Shaft', 2006, 5, 5, 4.99, 175, 28.99, 'G');
INSERT INTO public.film VALUES (62, 'Bed Highball', 'A Astounding Panorama of a Lumberjack And a Dog who must Redeem a Woman in An Abandoned Fun House', 2006, 5, 5, 2.99, 106, 23.99, 'NC-17');
INSERT INTO public.film VALUES (63, 'Bedazzled Married', 'A Astounding Character Study of a Madman And a Robot who must Meet a Mad Scientist in An Abandoned Fun House', 2006, 5, 6, 0.99, 73, 21.99, 'PG');
INSERT INTO public.film VALUES (64, 'Beethoven Exorcist', 'A Epic Display of a Pioneer And a Student who must Challenge a Butler in The Gulf of Mexico', 2006, 5, 6, 0.99, 151, 26.99, 'PG-13');
INSERT INTO public.film VALUES (65, 'Behavior Runaway', 'A Unbelieveable Drama of a Student And a Husband who must Outrace a Sumo Wrestler in Berlin', 2006, 5, 3, 4.99, 100, 20.99, 'PG');
INSERT INTO public.film VALUES (66, 'Beneath Rush', 'A Astounding Panorama of a Man And a Monkey who must Discover a Man in The First Manned Space Station', 2006, 5, 6, 0.99, 53, 27.99, 'NC-17');
INSERT INTO public.film VALUES (67, 'Berets Agent', 'A Taut Saga of a Crocodile And a Boy who must Overcome a Technical Writer in Ancient China', 2006, 5, 5, 2.99, 77, 24.99, 'PG-13');
INSERT INTO public.film VALUES (76, 'Birdcage Casper', 'A Fast-Paced Saga of a Frisbee And a Astronaut who must Overcome a Feminist in Ancient India', 2006, 6, 4, 0.99, 103, 23.99, 'NC-17');
INSERT INTO public.film VALUES (77, 'Birds Perdition', 'A Boring Story of a Womanizer And a Pioneer who must Face a Dog in California', 2006, 6, 5, 4.99, 61, 15.99, 'G');
INSERT INTO public.film VALUES (78, 'Blackout Private', 'A Intrepid Yarn of a Pastry Chef And a Mad Scientist who must Challenge a Secret Agent in Ancient Japan', 2006, 6, 7, 2.99, 85, 12.99, 'PG');
INSERT INTO public.film VALUES (79, 'Blade Polish', 'A Thoughtful Character Study of a Frisbee And a Pastry Chef who must Fight a Dentist in The First Manned Space Station', 2006, 6, 5, 0.99, 114, 10.99, 'PG-13');
INSERT INTO public.film VALUES (80, 'Blanket Beverly', 'A Emotional Documentary of a Student And a Girl who must Build a Boat in Nigeria', 2006, 6, 7, 2.99, 148, 21.99, 'G');
INSERT INTO public.film VALUES (81, 'Blindness Gun', 'A Touching Drama of a Robot And a Dentist who must Meet a Hunter in A Jet Boat', 2006, 6, 6, 4.99, 103, 29.99, 'PG-13');
INSERT INTO public.film VALUES (82, 'Blood Argonauts', 'A Boring Drama of a Explorer And a Man who must Kill a Lumberjack in A Manhattan Penthouse', 2006, 6, 3, 0.99, 71, 13.99, 'G');
INSERT INTO public.film VALUES (83, 'Blues Instinct', 'A Insightful Documentary of a Boat And a Composer who must Meet a Forensic Psychologist in An Abandoned Fun House', 2006, 6, 5, 2.99, 50, 18.99, 'G');
INSERT INTO public.film VALUES (101, 'Brotherhood Blanket', 'A Fateful Character Study of a Butler And a Technical Writer who must Sink a Astronaut in Ancient Japan', 2006, 1, 3, 0.99, 73, 26.99, 'R');
INSERT INTO public.film VALUES (102, 'Bubble Grosse', 'A Awe-Inspiring Panorama of a Crocodile And a Moose who must Confront a Girl in A Baloon', 2006, 1, 4, 4.99, 60, 20.99, 'R');
INSERT INTO public.film VALUES (103, 'Bucket Brotherhood', 'A Amazing Display of a Girl And a Womanizer who must Succumb a Lumberjack in A Baloon Factory', 2006, 1, 7, 4.99, 133, 27.99, 'PG');
INSERT INTO public.film VALUES (104, 'Bugsy Song', 'A Awe-Inspiring Character Study of a Secret Agent And a Boat who must Find a Squirrel in The First Manned Space Station', 2006, 1, 4, 2.99, 119, 17.99, 'G');
INSERT INTO public.film VALUES (105, 'Bull Shawshank', 'A Fanciful Drama of a Moose And a Squirrel who must Conquer a Pioneer in The Canadian Rockies', 2006, 1, 6, 0.99, 125, 21.99, 'NC-17');
INSERT INTO public.film VALUES (91, 'Bound Cheaper', 'A Thrilling Panorama of a Database Administrator And a Astronaut who must Challenge a Lumberjack in A Baloon', 2006, 6, 5, 0.99, 98, 17.99, 'PG');
INSERT INTO public.film VALUES (92, 'Bowfinger Gables', 'A Fast-Paced Yarn of a Waitress And a Composer who must Outgun a Dentist in California', 2006, 6, 7, 4.99, 72, 19.99, 'NC-17');
INSERT INTO public.film VALUES (93, 'Brannigan Sunrise', 'A Amazing Epistle of a Moose And a Crocodile who must Outrace a Dog in Berlin', 2006, 6, 4, 4.99, 121, 27.99, 'PG');
INSERT INTO public.film VALUES (94, 'Braveheart Human', 'A Insightful Story of a Dog And a Pastry Chef who must Battle a Girl in Berlin', 2006, 6, 7, 2.99, 176, 14.99, 'PG-13');
INSERT INTO public.film VALUES (95, 'Breakfast Goldfinger', 'A Beautiful Reflection of a Student And a Student who must Fight a Moose in Berlin', 2006, 6, 5, 4.99, 123, 18.99, 'G');
INSERT INTO public.film VALUES (106, 'Bulworth Commandments', 'A Amazing Display of a Mad Cow And a Pioneer who must Redeem a Sumo Wrestler in The Outback', 2006, 1, 4, 2.99, 61, 14.99, 'G');
INSERT INTO public.film VALUES (107, 'Bunch Minds', 'A Emotional Story of a Feminist And a Feminist who must Escape a Pastry Chef in A MySQL Convention', 2006, 1, 4, 2.99, 63, 13.99, 'G');
INSERT INTO public.film VALUES (108, 'Butch Panther', 'A Lacklusture Yarn of a Feminist And a Database Administrator who must Face a Hunter in New Orleans', 2006, 1, 6, 0.99, 67, 19.99, 'PG-13');
INSERT INTO public.film VALUES (109, 'Butterfly Chocolat', 'A Fateful Story of a Girl And a Composer who must Conquer a Husband in A Shark Tank', 2006, 1, 3, 0.99, 89, 17.99, 'G');
INSERT INTO public.film VALUES (110, 'Cabin Flash', 'A Stunning Epistle of a Boat And a Man who must Challenge a A Shark in A Baloon Factory', 2006, 1, 4, 0.99, 53, 25.99, 'NC-17');
INSERT INTO public.film VALUES (111, 'Caddyshack Jedi', 'A Awe-Inspiring Epistle of a Woman And a Madman who must Fight a Robot in Soviet Georgia', 2006, 1, 3, 0.99, 52, 17.99, 'NC-17');
INSERT INTO public.film VALUES (112, 'Calendar Gunfight', 'A Thrilling Drama of a Frisbee And a Lumberjack who must Sink a Man in Nigeria', 2006, 1, 4, 4.99, 120, 22.99, 'NC-17');
INSERT INTO public.film VALUES (113, 'California Birds', 'A Thrilling Yarn of a Database Administrator And a Robot who must Battle a Database Administrator in Ancient India', 2006, 1, 4, 4.99, 75, 19.99, 'NC-17');
INSERT INTO public.film VALUES (114, 'Camelot Vacation', 'A Touching Character Study of a Woman And a Waitress who must Battle a Pastry Chef in A MySQL Convention', 2006, 1, 3, 0.99, 61, 26.99, 'NC-17');
INSERT INTO public.film VALUES (115, 'Campus Remember', 'A Astounding Drama of a Crocodile And a Mad Cow who must Build a Robot in A Jet Boat', 2006, 1, 5, 2.99, 167, 27.99, 'R');
INSERT INTO public.film VALUES (116, 'Candidate Perdition', 'A Brilliant Epistle of a Composer And a Database Administrator who must Vanquish a Mad Scientist in The First Manned Space Station', 2006, 1, 4, 2.99, 70, 10.99, 'R');
INSERT INTO public.film VALUES (117, 'Candles Grapes', 'A Fanciful Character Study of a Monkey And a Explorer who must Build a Astronaut in An Abandoned Fun House', 2006, 1, 6, 4.99, 135, 15.99, 'NC-17');
INSERT INTO public.film VALUES (118, 'Canyon Stock', 'A Thoughtful Reflection of a Waitress And a Feminist who must Escape a Squirrel in A Manhattan Penthouse', 2006, 1, 7, 0.99, 85, 26.99, 'R');
INSERT INTO public.film VALUES (119, 'Caper Motions', 'A Fateful Saga of a Moose And a Car who must Pursue a Woman in A MySQL Convention', 2006, 1, 6, 0.99, 176, 22.99, 'G');
INSERT INTO public.film VALUES (120, 'Caribbean Liberty', 'A Fanciful Tale of a Pioneer And a Technical Writer who must Outgun a Pioneer in A Shark Tank', 2006, 1, 3, 4.99, 92, 16.99, 'NC-17');
INSERT INTO public.film VALUES (121, 'Carol Texas', 'A Astounding Character Study of a Composer And a Student who must Overcome a Composer in A Monastery', 2006, 1, 4, 2.99, 151, 15.99, 'PG');
INSERT INTO public.film VALUES (122, 'Carrie Bunch', 'A Amazing Epistle of a Student And a Astronaut who must Discover a Frisbee in The Canadian Rockies', 2006, 1, 7, 0.99, 114, 11.99, 'PG');
INSERT INTO public.film VALUES (123, 'Casablanca Super', 'A Amazing Panorama of a Crocodile And a Forensic Psychologist who must Pursue a Secret Agent in The First Manned Space Station', 2006, 1, 6, 4.99, 85, 22.99, 'G');
INSERT INTO public.film VALUES (124, 'Casper Dragonfly', 'A Intrepid Documentary of a Boat And a Crocodile who must Chase a Robot in The Sahara Desert', 2006, 1, 3, 4.99, 163, 16.99, 'PG-13');
INSERT INTO public.film VALUES (125, 'Cassidy Wyoming', 'A Intrepid Drama of a Frisbee And a Hunter who must Kill a Secret Agent in New Orleans', 2006, 1, 5, 2.99, 61, 19.99, 'NC-17');
INSERT INTO public.film VALUES (127, 'Cat Coneheads', 'A Fast-Paced Panorama of a Girl And a A Shark who must Confront a Boy in Ancient India', 2006, 1, 5, 4.99, 112, 14.99, 'G');
INSERT INTO public.film VALUES (128, 'Catch Amistad', 'A Boring Reflection of a Lumberjack And a Feminist who must Discover a Woman in Nigeria', 2006, 1, 7, 0.99, 183, 10.99, 'G');
INSERT INTO public.film VALUES (567, 'Meet Chocolate', 'A Boring Documentary of a Dentist And a Butler who must Confront a Monkey in A MySQL Convention', 2006, 1, 3, 2.99, 80, 26.99, 'G');
INSERT INTO public.film VALUES (129, 'Cause Date', 'A Taut Tale of a Explorer And a Pastry Chef who must Conquer a Hunter in A MySQL Convention', 2006, 1, 3, 2.99, 179, 16.99, 'R');
INSERT INTO public.film VALUES (130, 'Celebrity Horn', 'A Amazing Documentary of a Secret Agent And a Astronaut who must Vanquish a Hunter in A Shark Tank', 2006, 1, 7, 0.99, 110, 24.99, 'PG-13');
INSERT INTO public.film VALUES (131, 'Center Dinosaur', 'A Beautiful Character Study of a Sumo Wrestler And a Dentist who must Find a Dog in California', 2006, 1, 5, 4.99, 152, 12.99, 'PG');
INSERT INTO public.film VALUES (132, 'Chainsaw Uptown', 'A Beautiful Documentary of a Boy And a Robot who must Discover a Squirrel in Australia', 2006, 1, 6, 0.99, 114, 25.99, 'PG');
INSERT INTO public.film VALUES (134, 'Champion Flatliners', 'A Amazing Story of a Mad Cow And a Dog who must Kill a Husband in A Monastery', 2006, 1, 4, 4.99, 51, 21.99, 'PG');
INSERT INTO public.film VALUES (135, 'Chance Resurrection', 'A Astounding Story of a Forensic Psychologist And a Forensic Psychologist who must Overcome a Moose in Ancient China', 2006, 1, 3, 2.99, 70, 22.99, 'R');
INSERT INTO public.film VALUES (154, 'Clash Freddy', 'A Amazing Yarn of a Composer And a Squirrel who must Escape a Astronaut in Australia', 2006, 1, 6, 2.99, 81, 12.99, 'G');
INSERT INTO public.film VALUES (136, 'Chaplin License', 'A Boring Drama of a Dog And a Forensic Psychologist who must Outrace a Explorer in Ancient India', 2006, 1, 7, 2.99, 146, 26.99, 'NC-17');
INSERT INTO public.film VALUES (137, 'Charade Duffel', 'A Action-Packed Display of a Man And a Waitress who must Build a Dog in A MySQL Convention', 2006, 1, 3, 2.99, 66, 21.99, 'PG');
INSERT INTO public.film VALUES (138, 'Chariots Conspiracy', 'A Unbelieveable Epistle of a Robot And a Husband who must Chase a Robot in The First Manned Space Station', 2006, 1, 5, 2.99, 71, 29.99, 'R');
INSERT INTO public.film VALUES (139, 'Chasing Fight', 'A Astounding Saga of a Technical Writer And a Butler who must Battle a Butler in A Shark Tank', 2006, 1, 7, 4.99, 114, 21.99, 'PG');
INSERT INTO public.film VALUES (140, 'Cheaper Clyde', 'A Emotional Character Study of a Pioneer And a Girl who must Discover a Dog in Ancient Japan', 2006, 1, 6, 0.99, 87, 23.99, 'G');
INSERT INTO public.film VALUES (141, 'Chicago North', 'A Fateful Yarn of a Mad Cow And a Waitress who must Battle a Student in California', 2006, 1, 6, 4.99, 185, 11.99, 'PG-13');
INSERT INTO public.film VALUES (142, 'Chicken Hellfighters', 'A Emotional Drama of a Dog And a Explorer who must Outrace a Technical Writer in Australia', 2006, 1, 3, 0.99, 122, 24.99, 'PG');
INSERT INTO public.film VALUES (143, 'Chill Luck', 'A Lacklusture Epistle of a Boat And a Technical Writer who must Fight a A Shark in The Canadian Rockies', 2006, 1, 6, 0.99, 142, 17.99, 'PG');
INSERT INTO public.film VALUES (144, 'Chinatown Gladiator', 'A Brilliant Panorama of a Technical Writer And a Lumberjack who must Escape a Butler in Ancient India', 2006, 1, 7, 4.99, 61, 24.99, 'PG');
INSERT INTO public.film VALUES (145, 'Chisum Behavior', 'A Epic Documentary of a Sumo Wrestler And a Butler who must Kill a Car in Ancient India', 2006, 1, 5, 4.99, 124, 25.99, 'G');
INSERT INTO public.film VALUES (146, 'Chitty Lock', 'A Boring Epistle of a Boat And a Database Administrator who must Kill a Sumo Wrestler in The First Manned Space Station', 2006, 1, 6, 2.99, 107, 24.99, 'G');
INSERT INTO public.film VALUES (166, 'Color Philadelphia', 'A Thoughtful Panorama of a Car And a Crocodile who must Sink a Monkey in The Sahara Desert', 2006, 1, 6, 2.99, 149, 19.99, 'G');
INSERT INTO public.film VALUES (147, 'Chocolat Harry', 'A Action-Packed Epistle of a Dentist And a Moose who must Meet a Mad Cow in Ancient Japan', 2006, 1, 5, 0.99, 101, 16.99, 'NC-17');
INSERT INTO public.film VALUES (148, 'Chocolate Duck', 'A Unbelieveable Story of a Mad Scientist And a Technical Writer who must Discover a Composer in Ancient China', 2006, 1, 3, 2.99, 132, 13.99, 'R');
INSERT INTO public.film VALUES (149, 'Christmas Moonshine', 'A Action-Packed Epistle of a Feminist And a Astronaut who must Conquer a Boat in A Manhattan Penthouse', 2006, 1, 7, 0.99, 150, 21.99, 'NC-17');
INSERT INTO public.film VALUES (150, 'Cider Desire', 'A Stunning Character Study of a Composer And a Mad Cow who must Succumb a Cat in Soviet Georgia', 2006, 1, 7, 2.99, 101, 9.99, 'PG');
INSERT INTO public.film VALUES (151, 'Cincinatti Whisperer', 'A Brilliant Saga of a Pastry Chef And a Hunter who must Confront a Butler in Berlin', 2006, 1, 5, 4.99, 143, 26.99, 'NC-17');
INSERT INTO public.film VALUES (152, 'Circus Youth', 'A Thoughtful Drama of a Pastry Chef And a Dentist who must Pursue a Girl in A Baloon', 2006, 1, 5, 2.99, 90, 13.99, 'PG-13');
INSERT INTO public.film VALUES (153, 'Citizen Shrek', 'A Fanciful Character Study of a Technical Writer And a Husband who must Redeem a Robot in The Outback', 2006, 1, 7, 0.99, 165, 18.99, 'G');
INSERT INTO public.film VALUES (155, 'Cleopatra Devil', 'A Fanciful Documentary of a Crocodile And a Technical Writer who must Fight a A Shark in A Baloon', 2006, 1, 6, 0.99, 150, 26.99, 'PG-13');
INSERT INTO public.film VALUES (156, 'Clerks Angels', 'A Thrilling Display of a Sumo Wrestler And a Girl who must Confront a Man in A Baloon', 2006, 1, 3, 4.99, 164, 15.99, 'G');
INSERT INTO public.film VALUES (157, 'Clockwork Paradise', 'A Insightful Documentary of a Technical Writer And a Feminist who must Challenge a Cat in A Baloon', 2006, 1, 7, 0.99, 143, 29.99, 'PG-13');
INSERT INTO public.film VALUES (158, 'Clones Pinocchio', 'A Amazing Drama of a Car And a Robot who must Pursue a Dentist in New Orleans', 2006, 1, 6, 2.99, 124, 16.99, 'R');
INSERT INTO public.film VALUES (159, 'Closer Bang', 'A Unbelieveable Panorama of a Frisbee And a Hunter who must Vanquish a Monkey in Ancient India', 2006, 1, 5, 4.99, 58, 12.99, 'R');
INSERT INTO public.film VALUES (160, 'Club Graffiti', 'A Epic Tale of a Pioneer And a Hunter who must Escape a Girl in A U-Boat', 2006, 1, 4, 0.99, 65, 12.99, 'PG-13');
INSERT INTO public.film VALUES (161, 'Clue Grail', 'A Taut Tale of a Butler And a Mad Scientist who must Build a Crocodile in Ancient China', 2006, 1, 6, 4.99, 70, 27.99, 'NC-17');
INSERT INTO public.film VALUES (162, 'Clueless Bucket', 'A Taut Tale of a Car And a Pioneer who must Conquer a Sumo Wrestler in An Abandoned Fun House', 2006, 1, 4, 2.99, 95, 13.99, 'R');
INSERT INTO public.film VALUES (163, 'Clyde Theory', 'A Beautiful Yarn of a Astronaut And a Frisbee who must Overcome a Explorer in A Jet Boat', 2006, 1, 4, 0.99, 139, 29.99, 'PG-13');
INSERT INTO public.film VALUES (164, 'Coast Rainbow', 'A Astounding Documentary of a Mad Cow And a Pioneer who must Challenge a Butler in The Sahara Desert', 2006, 1, 4, 0.99, 55, 20.99, 'PG');
INSERT INTO public.film VALUES (184, 'Core Suit', 'A Unbelieveable Tale of a Car And a Explorer who must Confront a Boat in A Manhattan Penthouse', 2006, 1, 3, 2.99, 92, 24.99, 'PG-13');
INSERT INTO public.film VALUES (165, 'Coldblooded Darling', 'A Brilliant Panorama of a Dentist And a Moose who must Find a Student in The Gulf of Mexico', 2006, 1, 7, 4.99, 70, 27.99, 'G');
INSERT INTO public.film VALUES (167, 'Coma Head', 'A Awe-Inspiring Drama of a Boy And a Frisbee who must Escape a Pastry Chef in California', 2006, 1, 6, 4.99, 109, 10.99, 'NC-17');
INSERT INTO public.film VALUES (168, 'Comancheros Enemy', 'A Boring Saga of a Lumberjack And a Monkey who must Find a Monkey in The Gulf of Mexico', 2006, 1, 5, 0.99, 67, 23.99, 'R');
INSERT INTO public.film VALUES (169, 'Comforts Rush', 'A Unbelieveable Panorama of a Pioneer And a Husband who must Meet a Mad Cow in An Abandoned Mine Shaft', 2006, 1, 3, 2.99, 76, 19.99, 'NC-17');
INSERT INTO public.film VALUES (170, 'Command Darling', 'A Awe-Inspiring Tale of a Forensic Psychologist And a Woman who must Challenge a Database Administrator in Ancient Japan', 2006, 1, 5, 4.99, 120, 28.99, 'PG-13');
INSERT INTO public.film VALUES (171, 'Commandments Express', 'A Fanciful Saga of a Student And a Mad Scientist who must Battle a Hunter in An Abandoned Mine Shaft', 2006, 1, 6, 4.99, 59, 13.99, 'R');
INSERT INTO public.film VALUES (172, 'Coneheads Smoochy', 'A Touching Story of a Womanizer And a Composer who must Pursue a Husband in Nigeria', 2006, 1, 7, 4.99, 112, 12.99, 'NC-17');
INSERT INTO public.film VALUES (173, 'Confessions Maguire', 'A Insightful Story of a Car And a Boy who must Battle a Technical Writer in A Baloon', 2006, 1, 7, 4.99, 65, 25.99, 'PG-13');
INSERT INTO public.film VALUES (174, 'Confidential Interview', 'A Stunning Reflection of a Cat And a Woman who must Find a Astronaut in Ancient Japan', 2006, 1, 6, 4.99, 180, 13.99, 'NC-17');
INSERT INTO public.film VALUES (175, 'Confused Candles', 'A Stunning Epistle of a Cat And a Forensic Psychologist who must Confront a Pioneer in A Baloon', 2006, 1, 3, 2.99, 122, 27.99, 'PG-13');
INSERT INTO public.film VALUES (176, 'Congeniality Quest', 'A Touching Documentary of a Cat And a Pastry Chef who must Find a Lumberjack in A Baloon', 2006, 1, 6, 0.99, 87, 21.99, 'PG-13');
INSERT INTO public.film VALUES (177, 'Connecticut Tramp', 'A Unbelieveable Drama of a Crocodile And a Mad Cow who must Reach a Dentist in A Shark Tank', 2006, 1, 4, 4.99, 172, 20.99, 'R');
INSERT INTO public.film VALUES (178, 'Connection Microcosmos', 'A Fateful Documentary of a Crocodile And a Husband who must Face a Husband in The First Manned Space Station', 2006, 1, 6, 0.99, 115, 25.99, 'G');
INSERT INTO public.film VALUES (179, 'Conquerer Nuts', 'A Taut Drama of a Mad Scientist And a Man who must Escape a Pioneer in An Abandoned Mine Shaft', 2006, 1, 4, 4.99, 173, 14.99, 'G');
INSERT INTO public.film VALUES (180, 'Conspiracy Spirit', 'A Awe-Inspiring Story of a Student And a Frisbee who must Conquer a Crocodile in An Abandoned Mine Shaft', 2006, 1, 4, 2.99, 184, 27.99, 'PG-13');
INSERT INTO public.film VALUES (181, 'Contact Anonymous', 'A Insightful Display of a A Shark And a Monkey who must Face a Database Administrator in Ancient India', 2006, 1, 7, 2.99, 166, 10.99, 'PG-13');
INSERT INTO public.film VALUES (182, 'Control Anthem', 'A Fateful Documentary of a Robot And a Student who must Battle a Cat in A Monastery', 2006, 1, 7, 4.99, 185, 9.99, 'G');
INSERT INTO public.film VALUES (183, 'Conversation Downhill', 'A Taut Character Study of a Husband And a Waitress who must Sink a Squirrel in A MySQL Convention', 2006, 1, 4, 4.99, 112, 14.99, 'R');
INSERT INTO public.film VALUES (185, 'Cowboy Doom', 'A Astounding Drama of a Boy And a Lumberjack who must Fight a Butler in A Baloon', 2006, 1, 3, 2.99, 146, 10.99, 'PG');
INSERT INTO public.film VALUES (186, 'Craft Outfield', 'A Lacklusture Display of a Explorer And a Hunter who must Succumb a Database Administrator in A Baloon Factory', 2006, 1, 6, 0.99, 64, 17.99, 'NC-17');
INSERT INTO public.film VALUES (187, 'Cranes Reservoir', 'A Fanciful Documentary of a Teacher And a Dog who must Outgun a Forensic Psychologist in A Baloon Factory', 2006, 1, 5, 2.99, 57, 12.99, 'NC-17');
INSERT INTO public.film VALUES (188, 'Crazy Home', 'A Fanciful Panorama of a Boy And a Woman who must Vanquish a Database Administrator in The Outback', 2006, 1, 7, 2.99, 136, 24.99, 'PG');
INSERT INTO public.film VALUES (189, 'Creatures Shakespeare', 'A Emotional Drama of a Womanizer And a Squirrel who must Vanquish a Crocodile in Ancient India', 2006, 1, 3, 0.99, 139, 23.99, 'NC-17');
INSERT INTO public.film VALUES (190, 'Creepers Kane', 'A Awe-Inspiring Reflection of a Squirrel And a Boat who must Outrace a Car in A Jet Boat', 2006, 1, 5, 4.99, 172, 23.99, 'NC-17');
INSERT INTO public.film VALUES (191, 'Crooked Frogmen', 'A Unbelieveable Drama of a Hunter And a Database Administrator who must Battle a Crocodile in An Abandoned Amusement Park', 2006, 1, 6, 0.99, 143, 27.99, 'PG-13');
INSERT INTO public.film VALUES (192, 'Crossing Divorce', 'A Beautiful Documentary of a Dog And a Robot who must Redeem a Womanizer in Berlin', 2006, 1, 4, 4.99, 50, 19.99, 'R');
INSERT INTO public.film VALUES (193, 'Crossroads Casualties', 'A Intrepid Documentary of a Sumo Wrestler And a Astronaut who must Battle a Composer in The Outback', 2006, 1, 5, 2.99, 153, 20.99, 'G');
INSERT INTO public.film VALUES (194, 'Crow Grease', 'A Awe-Inspiring Documentary of a Woman And a Husband who must Sink a Database Administrator in The First Manned Space Station', 2006, 1, 6, 0.99, 104, 22.99, 'PG');
INSERT INTO public.film VALUES (195, 'Crowds Telemark', 'A Intrepid Documentary of a Astronaut And a Forensic Psychologist who must Find a Frisbee in An Abandoned Fun House', 2006, 1, 3, 4.99, 112, 16.99, 'R');
INSERT INTO public.film VALUES (196, 'Cruelty Unforgiven', 'A Brilliant Tale of a Car And a Moose who must Battle a Dentist in Nigeria', 2006, 1, 7, 0.99, 69, 29.99, 'G');
INSERT INTO public.film VALUES (197, 'Crusade Honey', 'A Fast-Paced Reflection of a Explorer And a Butler who must Battle a Madman in An Abandoned Amusement Park', 2006, 1, 4, 2.99, 112, 27.99, 'R');
INSERT INTO public.film VALUES (198, 'Crystal Breaking', 'A Fast-Paced Character Study of a Feminist And a Explorer who must Face a Pastry Chef in Ancient Japan', 2006, 1, 6, 2.99, 184, 22.99, 'NC-17');
INSERT INTO public.film VALUES (199, 'Cupboard Sinners', 'A Emotional Reflection of a Frisbee And a Boat who must Reach a Pastry Chef in An Abandoned Amusement Park', 2006, 1, 4, 2.99, 56, 29.99, 'R');
INSERT INTO public.film VALUES (200, 'Curtain Videotape', 'A Boring Reflection of a Dentist And a Mad Cow who must Chase a Secret Agent in A Shark Tank', 2006, 1, 7, 0.99, 133, 27.99, 'PG-13');
INSERT INTO public.film VALUES (201, 'Cyclone Family', 'A Lacklusture Drama of a Student And a Monkey who must Sink a Womanizer in A MySQL Convention', 2006, 1, 7, 2.99, 176, 18.99, 'PG');
INSERT INTO public.film VALUES (202, 'Daddy Pittsburgh', 'A Epic Story of a A Shark And a Student who must Confront a Explorer in The Gulf of Mexico', 2006, 1, 5, 4.99, 161, 26.99, 'G');
INSERT INTO public.film VALUES (203, 'Daisy Menagerie', 'A Fast-Paced Saga of a Pastry Chef And a Monkey who must Sink a Composer in Ancient India', 2006, 1, 5, 4.99, 84, 9.99, 'G');
INSERT INTO public.film VALUES (204, 'Dalmations Sweden', 'A Emotional Epistle of a Moose And a Hunter who must Overcome a Robot in A Manhattan Penthouse', 2006, 1, 4, 0.99, 106, 25.99, 'PG');
INSERT INTO public.film VALUES (205, 'Dances None', 'A Insightful Reflection of a A Shark And a Dog who must Kill a Butler in An Abandoned Amusement Park', 2006, 1, 3, 0.99, 58, 22.99, 'NC-17');
INSERT INTO public.film VALUES (206, 'Dancing Fever', 'A Stunning Story of a Explorer And a Forensic Psychologist who must Face a Crocodile in A Shark Tank', 2006, 1, 6, 0.99, 144, 25.99, 'G');
INSERT INTO public.film VALUES (207, 'Dangerous Uptown', 'A Unbelieveable Story of a Mad Scientist And a Woman who must Overcome a Dog in California', 2006, 1, 7, 4.99, 121, 26.99, 'PG');
INSERT INTO public.film VALUES (208, 'Dares Pluto', 'A Fateful Story of a Robot And a Dentist who must Defeat a Astronaut in New Orleans', 2006, 1, 7, 2.99, 89, 16.99, 'PG-13');
INSERT INTO public.film VALUES (209, 'Darkness War', 'A Touching Documentary of a Husband And a Hunter who must Escape a Boy in The Sahara Desert', 2006, 1, 6, 2.99, 99, 24.99, 'NC-17');
INSERT INTO public.film VALUES (210, 'Darko Dorado', 'A Stunning Reflection of a Frisbee And a Husband who must Redeem a Dog in New Orleans', 2006, 1, 3, 4.99, 130, 13.99, 'NC-17');
INSERT INTO public.film VALUES (211, 'Darling Breaking', 'A Brilliant Documentary of a Astronaut And a Squirrel who must Succumb a Student in The Gulf of Mexico', 2006, 1, 7, 4.99, 165, 20.99, 'PG-13');
INSERT INTO public.film VALUES (212, 'Darn Forrester', 'A Fateful Story of a A Shark And a Explorer who must Succumb a Technical Writer in A Jet Boat', 2006, 1, 7, 4.99, 185, 14.99, 'G');
INSERT INTO public.film VALUES (214, 'Daughter Madigan', 'A Beautiful Tale of a Hunter And a Mad Scientist who must Confront a Squirrel in The First Manned Space Station', 2006, 1, 3, 4.99, 59, 13.99, 'PG-13');
INSERT INTO public.film VALUES (215, 'Dawn Pond', 'A Thoughtful Documentary of a Dentist And a Forensic Psychologist who must Defeat a Waitress in Berlin', 2006, 1, 4, 4.99, 57, 27.99, 'PG');
INSERT INTO public.film VALUES (216, 'Day Unfaithful', 'A Stunning Documentary of a Composer And a Mad Scientist who must Find a Technical Writer in A U-Boat', 2006, 1, 3, 4.99, 113, 16.99, 'G');
INSERT INTO public.film VALUES (217, 'Dazed Punk', 'A Action-Packed Story of a Pioneer And a Technical Writer who must Discover a Forensic Psychologist in An Abandoned Amusement Park', 2006, 1, 6, 4.99, 120, 20.99, 'G');
INSERT INTO public.film VALUES (218, 'Deceiver Betrayed', 'A Taut Story of a Moose And a Squirrel who must Build a Husband in Ancient India', 2006, 1, 7, 0.99, 122, 22.99, 'NC-17');
INSERT INTO public.film VALUES (219, 'Deep Crusade', 'A Amazing Tale of a Crocodile And a Squirrel who must Discover a Composer in Australia', 2006, 1, 6, 4.99, 51, 20.99, 'PG-13');
INSERT INTO public.film VALUES (220, 'Deer Virginian', 'A Thoughtful Story of a Mad Cow And a Womanizer who must Overcome a Mad Scientist in Soviet Georgia', 2006, 1, 7, 2.99, 106, 13.99, 'NC-17');
INSERT INTO public.film VALUES (221, 'Deliverance Mulholland', 'A Astounding Saga of a Monkey And a Moose who must Conquer a Butler in A Shark Tank', 2006, 1, 4, 0.99, 100, 9.99, 'R');
INSERT INTO public.film VALUES (240, 'Dolls Rage', 'A Thrilling Display of a Pioneer And a Frisbee who must Escape a Teacher in The Outback', 2006, 1, 7, 2.99, 120, 10.99, 'PG-13');
INSERT INTO public.film VALUES (222, 'Desert Poseidon', 'A Brilliant Documentary of a Butler And a Frisbee who must Build a Astronaut in New Orleans', 2006, 1, 4, 4.99, 64, 27.99, 'R');
INSERT INTO public.film VALUES (242, 'Doom Dancing', 'A Astounding Panorama of a Car And a Mad Scientist who must Battle a Lumberjack in A MySQL Convention', 2006, 1, 4, 0.99, 68, 13.99, 'R');
INSERT INTO public.film VALUES (223, 'Desire Alien', 'A Fast-Paced Tale of a Dog And a Forensic Psychologist who must Meet a Astronaut in The First Manned Space Station', 2006, 1, 7, 2.99, 76, 24.99, 'NC-17');
INSERT INTO public.film VALUES (224, 'Desperate Trainspotting', 'A Epic Yarn of a Forensic Psychologist And a Teacher who must Face a Lumberjack in California', 2006, 1, 7, 4.99, 81, 29.99, 'G');
INSERT INTO public.film VALUES (225, 'Destination Jerk', 'A Beautiful Yarn of a Teacher And a Cat who must Build a Car in A U-Boat', 2006, 1, 3, 0.99, 76, 19.99, 'PG-13');
INSERT INTO public.film VALUES (226, 'Destiny Saturday', 'A Touching Drama of a Crocodile And a Crocodile who must Conquer a Explorer in Soviet Georgia', 2006, 1, 4, 4.99, 56, 20.99, 'G');
INSERT INTO public.film VALUES (227, 'Details Packer', 'A Epic Saga of a Waitress And a Composer who must Face a Boat in A U-Boat', 2006, 1, 4, 4.99, 88, 17.99, 'R');
INSERT INTO public.film VALUES (228, 'Detective Vision', 'A Fanciful Documentary of a Pioneer And a Woman who must Redeem a Hunter in Ancient Japan', 2006, 1, 4, 0.99, 143, 16.99, 'PG-13');
INSERT INTO public.film VALUES (229, 'Devil Desire', 'A Beautiful Reflection of a Monkey And a Dentist who must Face a Database Administrator in Ancient Japan', 2006, 1, 6, 4.99, 87, 12.99, 'R');
INSERT INTO public.film VALUES (230, 'Diary Panic', 'A Thoughtful Character Study of a Frisbee And a Mad Cow who must Outgun a Man in Ancient India', 2006, 1, 7, 2.99, 107, 20.99, 'G');
INSERT INTO public.film VALUES (231, 'Dinosaur Secretary', 'A Action-Packed Drama of a Feminist And a Girl who must Reach a Robot in The Canadian Rockies', 2006, 1, 7, 2.99, 63, 27.99, 'R');
INSERT INTO public.film VALUES (232, 'Dirty Ace', 'A Action-Packed Character Study of a Forensic Psychologist And a Girl who must Build a Dentist in The Outback', 2006, 1, 7, 2.99, 147, 29.99, 'NC-17');
INSERT INTO public.film VALUES (233, 'Disciple Mother', 'A Touching Reflection of a Mad Scientist And a Boat who must Face a Moose in A Shark Tank', 2006, 1, 3, 0.99, 141, 17.99, 'PG');
INSERT INTO public.film VALUES (234, 'Disturbing Scarface', 'A Lacklusture Display of a Crocodile And a Butler who must Overcome a Monkey in A U-Boat', 2006, 1, 6, 2.99, 94, 27.99, 'R');
INSERT INTO public.film VALUES (235, 'Divide Monster', 'A Intrepid Saga of a Man And a Forensic Psychologist who must Reach a Squirrel in A Monastery', 2006, 1, 6, 2.99, 68, 13.99, 'PG-13');
INSERT INTO public.film VALUES (236, 'Divine Resurrection', 'A Boring Character Study of a Man And a Womanizer who must Succumb a Teacher in An Abandoned Amusement Park', 2006, 1, 4, 2.99, 100, 19.99, 'R');
INSERT INTO public.film VALUES (237, 'Divorce Shining', 'A Unbelieveable Saga of a Crocodile And a Student who must Discover a Cat in Ancient India', 2006, 1, 3, 2.99, 47, 21.99, 'G');
INSERT INTO public.film VALUES (238, 'Doctor Grail', 'A Insightful Drama of a Womanizer And a Waitress who must Reach a Forensic Psychologist in The Outback', 2006, 1, 4, 2.99, 57, 29.99, 'G');
INSERT INTO public.film VALUES (239, 'Dogma Family', 'A Brilliant Character Study of a Database Administrator And a Monkey who must Succumb a Astronaut in New Orleans', 2006, 1, 5, 4.99, 122, 16.99, 'G');
INSERT INTO public.film VALUES (241, 'Donnie Alley', 'A Awe-Inspiring Tale of a Butler And a Frisbee who must Vanquish a Teacher in Ancient Japan', 2006, 1, 4, 0.99, 125, 20.99, 'NC-17');
INSERT INTO public.film VALUES (243, 'Doors President', 'A Awe-Inspiring Display of a Squirrel And a Woman who must Overcome a Boy in The Gulf of Mexico', 2006, 1, 3, 4.99, 49, 22.99, 'NC-17');
INSERT INTO public.film VALUES (244, 'Dorado Notting', 'A Action-Packed Tale of a Sumo Wrestler And a A Shark who must Meet a Frisbee in California', 2006, 1, 5, 4.99, 139, 26.99, 'NC-17');
INSERT INTO public.film VALUES (245, 'Double Wrath', 'A Thoughtful Yarn of a Womanizer And a Dog who must Challenge a Madman in The Gulf of Mexico', 2006, 1, 4, 0.99, 177, 28.99, 'R');
INSERT INTO public.film VALUES (246, 'Doubtfire Labyrinth', 'A Intrepid Panorama of a Butler And a Composer who must Meet a Mad Cow in The Sahara Desert', 2006, 1, 5, 4.99, 154, 16.99, 'R');
INSERT INTO public.film VALUES (247, 'Downhill Enough', 'A Emotional Tale of a Pastry Chef And a Forensic Psychologist who must Succumb a Monkey in The Sahara Desert', 2006, 1, 3, 0.99, 47, 19.99, 'G');
INSERT INTO public.film VALUES (248, 'Dozen Lion', 'A Taut Drama of a Cat And a Girl who must Defeat a Frisbee in The Canadian Rockies', 2006, 1, 6, 4.99, 177, 20.99, 'NC-17');
INSERT INTO public.film VALUES (249, 'Dracula Crystal', 'A Thrilling Reflection of a Feminist And a Cat who must Find a Frisbee in An Abandoned Fun House', 2006, 1, 7, 0.99, 176, 26.99, 'G');
INSERT INTO public.film VALUES (250, 'Dragon Squad', 'A Taut Reflection of a Boy And a Waitress who must Outgun a Teacher in Ancient China', 2006, 1, 4, 0.99, 170, 26.99, 'NC-17');
INSERT INTO public.film VALUES (251, 'Dragonfly Strangers', 'A Boring Documentary of a Pioneer And a Man who must Vanquish a Man in Nigeria', 2006, 1, 6, 4.99, 133, 19.99, 'NC-17');
INSERT INTO public.film VALUES (252, 'Dream Pickup', 'A Epic Display of a Car And a Composer who must Overcome a Forensic Psychologist in The Gulf of Mexico', 2006, 1, 6, 2.99, 135, 18.99, 'PG');
INSERT INTO public.film VALUES (253, 'Drifter Commandments', 'A Epic Reflection of a Womanizer And a Squirrel who must Discover a Husband in A Jet Boat', 2006, 1, 5, 4.99, 61, 18.99, 'PG-13');
INSERT INTO public.film VALUES (254, 'Driver Annie', 'A Lacklusture Character Study of a Butler And a Car who must Redeem a Boat in An Abandoned Fun House', 2006, 1, 4, 2.99, 159, 11.99, 'PG-13');
INSERT INTO public.film VALUES (255, 'Driving Polish', 'A Action-Packed Yarn of a Feminist And a Technical Writer who must Sink a Boat in An Abandoned Mine Shaft', 2006, 1, 6, 4.99, 175, 21.99, 'NC-17');
INSERT INTO public.film VALUES (256, 'Drop Waterfront', 'A Fanciful Documentary of a Husband And a Explorer who must Reach a Madman in Ancient China', 2006, 1, 6, 4.99, 178, 20.99, 'R');
INSERT INTO public.film VALUES (257, 'Drumline Cyclone', 'A Insightful Panorama of a Monkey And a Sumo Wrestler who must Outrace a Mad Scientist in The Canadian Rockies', 2006, 1, 3, 0.99, 110, 14.99, 'G');
INSERT INTO public.film VALUES (258, 'Drums Dynamite', 'A Epic Display of a Crocodile And a Crocodile who must Confront a Dog in An Abandoned Amusement Park', 2006, 1, 6, 0.99, 96, 11.99, 'PG');
INSERT INTO public.film VALUES (259, 'Duck Racer', 'A Lacklusture Yarn of a Teacher And a Squirrel who must Overcome a Dog in A Shark Tank', 2006, 1, 4, 2.99, 116, 15.99, 'NC-17');
INSERT INTO public.film VALUES (260, 'Dude Blindness', 'A Stunning Reflection of a Husband And a Lumberjack who must Face a Frisbee in An Abandoned Fun House', 2006, 1, 3, 4.99, 132, 9.99, 'G');
INSERT INTO public.film VALUES (261, 'Duffel Apocalypse', 'A Emotional Display of a Boat And a Explorer who must Challenge a Madman in A MySQL Convention', 2006, 1, 5, 0.99, 171, 13.99, 'G');
INSERT INTO public.film VALUES (262, 'Dumbo Lust', 'A Touching Display of a Feminist And a Dentist who must Conquer a Husband in The Gulf of Mexico', 2006, 1, 5, 0.99, 119, 17.99, 'NC-17');
INSERT INTO public.film VALUES (263, 'Durham Panky', 'A Brilliant Panorama of a Girl And a Boy who must Face a Mad Scientist in An Abandoned Mine Shaft', 2006, 1, 6, 4.99, 154, 14.99, 'R');
INSERT INTO public.film VALUES (264, 'Dwarfs Alter', 'A Emotional Yarn of a Girl And a Dog who must Challenge a Composer in Ancient Japan', 2006, 1, 6, 2.99, 101, 13.99, 'G');
INSERT INTO public.film VALUES (266, 'Dynamite Tarzan', 'A Intrepid Documentary of a Forensic Psychologist And a Mad Scientist who must Face a Explorer in A U-Boat', 2006, 1, 4, 0.99, 141, 27.99, 'PG-13');
INSERT INTO public.film VALUES (267, 'Eagles Panky', 'A Thoughtful Story of a Car And a Boy who must Find a A Shark in The Sahara Desert', 2006, 1, 4, 4.99, 140, 14.99, 'NC-17');
INSERT INTO public.film VALUES (268, 'Early Home', 'A Amazing Panorama of a Mad Scientist And a Husband who must Meet a Woman in The Outback', 2006, 1, 6, 4.99, 96, 27.99, 'NC-17');
INSERT INTO public.film VALUES (269, 'Earring Instinct', 'A Stunning Character Study of a Dentist And a Mad Cow who must Find a Teacher in Nigeria', 2006, 1, 3, 0.99, 98, 22.99, 'R');
INSERT INTO public.film VALUES (270, 'Earth Vision', 'A Stunning Drama of a Butler And a Madman who must Outrace a Womanizer in Ancient India', 2006, 1, 7, 0.99, 85, 29.99, 'NC-17');
INSERT INTO public.film VALUES (271, 'Easy Gladiator', 'A Fateful Story of a Monkey And a Girl who must Overcome a Pastry Chef in Ancient India', 2006, 1, 5, 4.99, 148, 12.99, 'G');
INSERT INTO public.film VALUES (272, 'Edge Kissing', 'A Beautiful Yarn of a Composer And a Mad Cow who must Redeem a Mad Scientist in A Jet Boat', 2006, 1, 5, 4.99, 153, 9.99, 'NC-17');
INSERT INTO public.film VALUES (273, 'Effect Gladiator', 'A Beautiful Display of a Pastry Chef And a Pastry Chef who must Outgun a Forensic Psychologist in A Manhattan Penthouse', 2006, 1, 6, 0.99, 107, 14.99, 'PG');
INSERT INTO public.film VALUES (274, 'Egg Igby', 'A Beautiful Documentary of a Boat And a Sumo Wrestler who must Succumb a Database Administrator in The First Manned Space Station', 2006, 1, 4, 2.99, 67, 20.99, 'PG');
INSERT INTO public.film VALUES (275, 'Egypt Tenenbaums', 'A Intrepid Story of a Madman And a Secret Agent who must Outrace a Astronaut in An Abandoned Amusement Park', 2006, 1, 3, 0.99, 85, 11.99, 'PG');
INSERT INTO public.film VALUES (276, 'Element Freddy', 'A Awe-Inspiring Reflection of a Waitress And a Squirrel who must Kill a Mad Cow in A Jet Boat', 2006, 1, 6, 4.99, 115, 28.99, 'NC-17');
INSERT INTO public.film VALUES (277, 'Elephant Trojan', 'A Beautiful Panorama of a Lumberjack And a Forensic Psychologist who must Overcome a Frisbee in A Baloon', 2006, 1, 4, 4.99, 126, 24.99, 'PG-13');
INSERT INTO public.film VALUES (278, 'Elf Murder', 'A Action-Packed Story of a Frisbee And a Woman who must Reach a Girl in An Abandoned Mine Shaft', 2006, 1, 4, 4.99, 155, 19.99, 'NC-17');
INSERT INTO public.film VALUES (279, 'Elizabeth Shane', 'A Lacklusture Display of a Womanizer And a Dog who must Face a Sumo Wrestler in Ancient Japan', 2006, 1, 7, 4.99, 152, 11.99, 'NC-17');
INSERT INTO public.film VALUES (280, 'Empire Malkovich', 'A Amazing Story of a Feminist And a Cat who must Face a Car in An Abandoned Fun House', 2006, 1, 7, 0.99, 177, 26.99, 'G');
INSERT INTO public.film VALUES (281, 'Encino Elf', 'A Astounding Drama of a Feminist And a Teacher who must Confront a Husband in A Baloon', 2006, 1, 6, 0.99, 143, 9.99, 'G');
INSERT INTO public.film VALUES (282, 'Encounters Curtain', 'A Insightful Epistle of a Pastry Chef And a Womanizer who must Build a Boat in New Orleans', 2006, 1, 5, 0.99, 92, 20.99, 'NC-17');
INSERT INTO public.film VALUES (283, 'Ending Crowds', 'A Unbelieveable Display of a Dentist And a Madman who must Vanquish a Squirrel in Berlin', 2006, 1, 6, 0.99, 85, 10.99, 'NC-17');
INSERT INTO public.film VALUES (284, 'Enemy Odds', 'A Fanciful Panorama of a Mad Scientist And a Woman who must Pursue a Astronaut in Ancient India', 2006, 1, 5, 4.99, 77, 23.99, 'NC-17');
INSERT INTO public.film VALUES (285, 'English Bulworth', 'A Intrepid Epistle of a Pastry Chef And a Pastry Chef who must Pursue a Crocodile in Ancient China', 2006, 1, 3, 0.99, 51, 18.99, 'PG-13');
INSERT INTO public.film VALUES (286, 'Enough Raging', 'A Astounding Character Study of a Boat And a Secret Agent who must Find a Mad Cow in The Sahara Desert', 2006, 1, 7, 2.99, 158, 16.99, 'NC-17');
INSERT INTO public.film VALUES (287, 'Entrapment Satisfaction', 'A Thoughtful Panorama of a Hunter And a Teacher who must Reach a Mad Cow in A U-Boat', 2006, 1, 5, 0.99, 176, 19.99, 'R');
INSERT INTO public.film VALUES (288, 'Escape Metropolis', 'A Taut Yarn of a Astronaut And a Technical Writer who must Outgun a Boat in New Orleans', 2006, 1, 7, 2.99, 167, 20.99, 'R');
INSERT INTO public.film VALUES (289, 'Eve Resurrection', 'A Awe-Inspiring Yarn of a Pastry Chef And a Database Administrator who must Challenge a Teacher in A Baloon', 2006, 1, 5, 4.99, 66, 25.99, 'G');
INSERT INTO public.film VALUES (290, 'Everyone Craft', 'A Fateful Display of a Waitress And a Dentist who must Reach a Butler in Nigeria', 2006, 1, 4, 0.99, 163, 29.99, 'PG');
INSERT INTO public.film VALUES (291, 'Evolution Alter', 'A Fanciful Character Study of a Feminist And a Madman who must Find a Explorer in A Baloon Factory', 2006, 1, 5, 0.99, 174, 10.99, 'PG-13');
INSERT INTO public.film VALUES (292, 'Excitement Eve', 'A Brilliant Documentary of a Monkey And a Car who must Conquer a Crocodile in A Shark Tank', 2006, 1, 3, 0.99, 51, 20.99, 'G');
INSERT INTO public.film VALUES (293, 'Exorcist Sting', 'A Touching Drama of a Dog And a Sumo Wrestler who must Conquer a Mad Scientist in Berlin', 2006, 1, 6, 2.99, 167, 17.99, 'G');
INSERT INTO public.film VALUES (294, 'Expecations Natural', 'A Amazing Drama of a Butler And a Husband who must Reach a A Shark in A U-Boat', 2006, 1, 5, 4.99, 138, 26.99, 'PG-13');
INSERT INTO public.film VALUES (295, 'Expendable Stallion', 'A Amazing Character Study of a Mad Cow And a Squirrel who must Discover a Hunter in A U-Boat', 2006, 1, 3, 0.99, 97, 14.99, 'PG');
INSERT INTO public.film VALUES (296, 'Express Lonely', 'A Boring Drama of a Astronaut And a Boat who must Face a Boat in California', 2006, 1, 5, 2.99, 178, 23.99, 'R');
INSERT INTO public.film VALUES (297, 'Extraordinary Conquerer', 'A Stunning Story of a Dog And a Feminist who must Face a Forensic Psychologist in Berlin', 2006, 1, 6, 2.99, 122, 29.99, 'G');
INSERT INTO public.film VALUES (298, 'Eyes Driving', 'A Thrilling Story of a Cat And a Waitress who must Fight a Explorer in The Outback', 2006, 1, 4, 2.99, 172, 13.99, 'PG-13');
INSERT INTO public.film VALUES (356, 'Giant Troopers', 'A Fateful Display of a Feminist And a Monkey who must Vanquish a Monkey in The Canadian Rockies', 2006, 1, 5, 2.99, 102, 10.99, 'R');
INSERT INTO public.film VALUES (299, 'Factory Dragon', 'A Action-Packed Saga of a Teacher And a Frisbee who must Escape a Lumberjack in The Sahara Desert', 2006, 1, 4, 0.99, 144, 9.99, 'PG-13');
INSERT INTO public.film VALUES (300, 'Falcon Volume', 'A Fateful Saga of a Sumo Wrestler And a Hunter who must Redeem a A Shark in New Orleans', 2006, 1, 5, 4.99, 102, 21.99, 'PG-13');
INSERT INTO public.film VALUES (301, 'Family Sweet', 'A Epic Documentary of a Teacher And a Boy who must Escape a Woman in Berlin', 2006, 1, 4, 0.99, 155, 24.99, 'R');
INSERT INTO public.film VALUES (302, 'Fantasia Park', 'A Thoughtful Documentary of a Mad Scientist And a A Shark who must Outrace a Feminist in Australia', 2006, 1, 5, 2.99, 131, 29.99, 'G');
INSERT INTO public.film VALUES (303, 'Fantasy Troopers', 'A Touching Saga of a Teacher And a Monkey who must Overcome a Secret Agent in A MySQL Convention', 2006, 1, 6, 0.99, 58, 27.99, 'PG-13');
INSERT INTO public.film VALUES (304, 'Fargo Gandhi', 'A Thrilling Reflection of a Pastry Chef And a Crocodile who must Reach a Teacher in The Outback', 2006, 1, 3, 2.99, 130, 28.99, 'G');
INSERT INTO public.film VALUES (305, 'Fatal Haunted', 'A Beautiful Drama of a Student And a Secret Agent who must Confront a Dentist in Ancient Japan', 2006, 1, 6, 2.99, 91, 24.99, 'PG');
INSERT INTO public.film VALUES (306, 'Feathers Metal', 'A Thoughtful Yarn of a Monkey And a Teacher who must Find a Dog in Australia', 2006, 1, 3, 0.99, 104, 12.99, 'PG-13');
INSERT INTO public.film VALUES (307, 'Fellowship Autumn', 'A Lacklusture Reflection of a Dentist And a Hunter who must Meet a Teacher in A Baloon', 2006, 1, 6, 4.99, 77, 9.99, 'NC-17');
INSERT INTO public.film VALUES (308, 'Ferris Mother', 'A Touching Display of a Frisbee And a Frisbee who must Kill a Girl in The Gulf of Mexico', 2006, 1, 3, 2.99, 142, 13.99, 'PG');
INSERT INTO public.film VALUES (309, 'Feud Frogmen', 'A Brilliant Reflection of a Database Administrator And a Mad Cow who must Chase a Woman in The Canadian Rockies', 2006, 1, 6, 0.99, 98, 29.99, 'R');
INSERT INTO public.film VALUES (310, 'Fever Empire', 'A Insightful Panorama of a Cat And a Boat who must Defeat a Boat in The Gulf of Mexico', 2006, 1, 5, 4.99, 158, 20.99, 'R');
INSERT INTO public.film VALUES (311, 'Fiction Christmas', 'A Emotional Yarn of a A Shark And a Student who must Battle a Robot in An Abandoned Mine Shaft', 2006, 1, 4, 0.99, 72, 14.99, 'PG');
INSERT INTO public.film VALUES (312, 'Fiddler Lost', 'A Boring Tale of a Squirrel And a Dog who must Challenge a Madman in The Gulf of Mexico', 2006, 1, 4, 4.99, 75, 20.99, 'R');
INSERT INTO public.film VALUES (313, 'Fidelity Devil', 'A Awe-Inspiring Drama of a Technical Writer And a Composer who must Reach a Pastry Chef in A U-Boat', 2006, 1, 5, 4.99, 118, 11.99, 'G');
INSERT INTO public.film VALUES (314, 'Fight Jawbreaker', 'A Intrepid Panorama of a Womanizer And a Girl who must Escape a Girl in A Manhattan Penthouse', 2006, 1, 3, 0.99, 91, 13.99, 'R');
INSERT INTO public.film VALUES (315, 'Finding Anaconda', 'A Fateful Tale of a Database Administrator And a Girl who must Battle a Squirrel in New Orleans', 2006, 1, 4, 0.99, 156, 10.99, 'R');
INSERT INTO public.film VALUES (316, 'Fire Wolves', 'A Intrepid Documentary of a Frisbee And a Dog who must Outrace a Lumberjack in Nigeria', 2006, 1, 5, 4.99, 173, 18.99, 'R');
INSERT INTO public.film VALUES (317, 'Fireball Philadelphia', 'A Amazing Yarn of a Dentist And a A Shark who must Vanquish a Madman in An Abandoned Mine Shaft', 2006, 1, 4, 0.99, 148, 25.99, 'PG');
INSERT INTO public.film VALUES (318, 'Firehouse Vietnam', 'A Awe-Inspiring Character Study of a Boat And a Boy who must Kill a Pastry Chef in The Sahara Desert', 2006, 1, 7, 0.99, 103, 14.99, 'G');
INSERT INTO public.film VALUES (319, 'Fish Opus', 'A Touching Display of a Feminist And a Girl who must Confront a Astronaut in Australia', 2006, 1, 4, 2.99, 125, 22.99, 'R');
INSERT INTO public.film VALUES (320, 'Flamingos Connecticut', 'A Fast-Paced Reflection of a Composer And a Composer who must Meet a Cat in The Sahara Desert', 2006, 1, 4, 4.99, 80, 28.99, 'PG-13');
INSERT INTO public.film VALUES (321, 'Flash Wars', 'A Astounding Saga of a Moose And a Pastry Chef who must Chase a Student in The Gulf of Mexico', 2006, 1, 3, 4.99, 123, 21.99, 'NC-17');
INSERT INTO public.film VALUES (322, 'Flatliners Killer', 'A Taut Display of a Secret Agent And a Waitress who must Sink a Robot in An Abandoned Mine Shaft', 2006, 1, 5, 2.99, 100, 29.99, 'G');
INSERT INTO public.film VALUES (323, 'Flight Lies', 'A Stunning Character Study of a Crocodile And a Pioneer who must Pursue a Teacher in New Orleans', 2006, 1, 7, 4.99, 179, 22.99, 'R');
INSERT INTO public.film VALUES (324, 'Flintstones Happiness', 'A Fateful Story of a Husband And a Moose who must Vanquish a Boy in California', 2006, 1, 3, 4.99, 148, 11.99, 'PG-13');
INSERT INTO public.film VALUES (325, 'Floats Garden', 'A Action-Packed Epistle of a Robot And a Car who must Chase a Boat in Ancient Japan', 2006, 1, 6, 2.99, 145, 29.99, 'PG-13');
INSERT INTO public.film VALUES (326, 'Flying Hook', 'A Thrilling Display of a Mad Cow And a Dog who must Challenge a Frisbee in Nigeria', 2006, 1, 6, 2.99, 69, 18.99, 'NC-17');
INSERT INTO public.film VALUES (327, 'Fool Mockingbird', 'A Lacklusture Tale of a Crocodile And a Composer who must Defeat a Madman in A U-Boat', 2006, 1, 3, 4.99, 158, 24.99, 'PG');
INSERT INTO public.film VALUES (328, 'Forever Candidate', 'A Unbelieveable Panorama of a Technical Writer And a Man who must Pursue a Frisbee in A U-Boat', 2006, 1, 7, 2.99, 131, 28.99, 'NC-17');
INSERT INTO public.film VALUES (329, 'Forrest Sons', 'A Thrilling Documentary of a Forensic Psychologist And a Butler who must Defeat a Explorer in A Jet Boat', 2006, 1, 4, 2.99, 63, 15.99, 'R');
INSERT INTO public.film VALUES (330, 'Forrester Comancheros', 'A Fateful Tale of a Squirrel And a Forensic Psychologist who must Redeem a Man in Nigeria', 2006, 1, 7, 4.99, 112, 22.99, 'NC-17');
INSERT INTO public.film VALUES (331, 'Forward Temple', 'A Astounding Display of a Forensic Psychologist And a Mad Scientist who must Challenge a Girl in New Orleans', 2006, 1, 6, 2.99, 90, 25.99, 'NC-17');
INSERT INTO public.film VALUES (332, 'Frankenstein Stranger', 'A Insightful Character Study of a Feminist And a Pioneer who must Pursue a Pastry Chef in Nigeria', 2006, 1, 7, 0.99, 159, 16.99, 'NC-17');
INSERT INTO public.film VALUES (333, 'Freaky Pocus', 'A Fast-Paced Documentary of a Pastry Chef And a Crocodile who must Chase a Squirrel in The Gulf of Mexico', 2006, 1, 7, 2.99, 126, 16.99, 'R');
INSERT INTO public.film VALUES (334, 'Freddy Storm', 'A Intrepid Saga of a Man And a Lumberjack who must Vanquish a Husband in The Outback', 2006, 1, 6, 4.99, 65, 21.99, 'NC-17');
INSERT INTO public.film VALUES (335, 'Freedom Cleopatra', 'A Emotional Reflection of a Dentist And a Mad Cow who must Face a Squirrel in A Baloon', 2006, 1, 5, 0.99, 133, 23.99, 'PG-13');
INSERT INTO public.film VALUES (336, 'French Holiday', 'A Thrilling Epistle of a Dog And a Feminist who must Kill a Madman in Berlin', 2006, 1, 5, 4.99, 99, 22.99, 'PG');
INSERT INTO public.film VALUES (337, 'Frida Slipper', 'A Fateful Story of a Lumberjack And a Car who must Escape a Boat in An Abandoned Mine Shaft', 2006, 1, 6, 2.99, 73, 11.99, 'R');
INSERT INTO public.film VALUES (338, 'Frisco Forrest', 'A Beautiful Documentary of a Woman And a Pioneer who must Pursue a Mad Scientist in A Shark Tank', 2006, 1, 6, 4.99, 51, 23.99, 'PG');
INSERT INTO public.film VALUES (339, 'Frogmen Breaking', 'A Unbelieveable Yarn of a Mad Scientist And a Cat who must Chase a Lumberjack in Australia', 2006, 1, 5, 0.99, 111, 17.99, 'R');
INSERT INTO public.film VALUES (340, 'Frontier Cabin', 'A Emotional Story of a Madman And a Waitress who must Battle a Teacher in An Abandoned Fun House', 2006, 1, 6, 4.99, 183, 14.99, 'PG-13');
INSERT INTO public.film VALUES (341, 'Frost Head', 'A Amazing Reflection of a Lumberjack And a Cat who must Discover a Husband in A MySQL Convention', 2006, 1, 5, 0.99, 82, 13.99, 'PG');
INSERT INTO public.film VALUES (342, 'Fugitive Maguire', 'A Taut Epistle of a Feminist And a Sumo Wrestler who must Battle a Crocodile in Australia', 2006, 1, 7, 4.99, 83, 28.99, 'R');
INSERT INTO public.film VALUES (343, 'Full Flatliners', 'A Beautiful Documentary of a Astronaut And a Moose who must Pursue a Monkey in A Shark Tank', 2006, 1, 6, 2.99, 94, 14.99, 'PG');
INSERT INTO public.film VALUES (344, 'Fury Murder', 'A Lacklusture Reflection of a Boat And a Forensic Psychologist who must Fight a Waitress in A Monastery', 2006, 1, 3, 0.99, 178, 28.99, 'PG-13');
INSERT INTO public.film VALUES (345, 'Gables Metropolis', 'A Fateful Display of a Cat And a Pioneer who must Challenge a Pastry Chef in A Baloon Factory', 2006, 1, 3, 0.99, 161, 17.99, 'PG');
INSERT INTO public.film VALUES (346, 'Galaxy Sweethearts', 'A Emotional Reflection of a Womanizer And a Pioneer who must Face a Squirrel in Berlin', 2006, 1, 4, 4.99, 128, 13.99, 'R');
INSERT INTO public.film VALUES (347, 'Games Bowfinger', 'A Astounding Documentary of a Butler And a Explorer who must Challenge a Butler in A Monastery', 2006, 1, 7, 4.99, 119, 17.99, 'PG-13');
INSERT INTO public.film VALUES (348, 'Gandhi Kwai', 'A Thoughtful Display of a Mad Scientist And a Secret Agent who must Chase a Boat in Berlin', 2006, 1, 7, 0.99, 86, 9.99, 'PG-13');
INSERT INTO public.film VALUES (349, 'Gangs Pride', 'A Taut Character Study of a Woman And a A Shark who must Confront a Frisbee in Berlin', 2006, 1, 4, 2.99, 185, 27.99, 'PG-13');
INSERT INTO public.film VALUES (350, 'Garden Island', 'A Unbelieveable Character Study of a Womanizer And a Madman who must Reach a Man in The Outback', 2006, 1, 3, 4.99, 80, 21.99, 'G');
INSERT INTO public.film VALUES (351, 'Gaslight Crusade', 'A Amazing Epistle of a Boy And a Astronaut who must Redeem a Man in The Gulf of Mexico', 2006, 1, 4, 2.99, 106, 10.99, 'PG');
INSERT INTO public.film VALUES (352, 'Gathering Calendar', 'A Intrepid Tale of a Pioneer And a Moose who must Conquer a Frisbee in A MySQL Convention', 2006, 1, 4, 0.99, 176, 22.99, 'PG-13');
INSERT INTO public.film VALUES (353, 'Gentlemen Stage', 'A Awe-Inspiring Reflection of a Monkey And a Student who must Overcome a Dentist in The First Manned Space Station', 2006, 1, 6, 2.99, 125, 22.99, 'NC-17');
INSERT INTO public.film VALUES (354, 'Ghost Groundhog', 'A Brilliant Panorama of a Madman And a Composer who must Succumb a Car in Ancient India', 2006, 1, 6, 4.99, 85, 18.99, 'G');
INSERT INTO public.film VALUES (355, 'Ghostbusters Elf', 'A Thoughtful Epistle of a Dog And a Feminist who must Chase a Composer in Berlin', 2006, 1, 7, 0.99, 101, 18.99, 'R');
INSERT INTO public.film VALUES (357, 'Gilbert Pelican', 'A Fateful Tale of a Man And a Feminist who must Conquer a Crocodile in A Manhattan Penthouse', 2006, 1, 7, 0.99, 114, 13.99, 'G');
INSERT INTO public.film VALUES (358, 'Gilmore Boiled', 'A Unbelieveable Documentary of a Boat And a Husband who must Succumb a Student in A U-Boat', 2006, 1, 5, 0.99, 163, 29.99, 'R');
INSERT INTO public.film VALUES (359, 'Gladiator Westward', 'A Astounding Reflection of a Squirrel And a Sumo Wrestler who must Sink a Dentist in Ancient Japan', 2006, 1, 6, 4.99, 173, 20.99, 'PG');
INSERT INTO public.film VALUES (360, 'Glass Dying', 'A Astounding Drama of a Frisbee And a Astronaut who must Fight a Dog in Ancient Japan', 2006, 1, 4, 0.99, 103, 24.99, 'G');
INSERT INTO public.film VALUES (361, 'Gleaming Jawbreaker', 'A Amazing Display of a Composer And a Forensic Psychologist who must Discover a Car in The Canadian Rockies', 2006, 1, 5, 2.99, 89, 25.99, 'NC-17');
INSERT INTO public.film VALUES (362, 'Glory Tracy', 'A Amazing Saga of a Woman And a Womanizer who must Discover a Cat in The First Manned Space Station', 2006, 1, 7, 2.99, 115, 13.99, 'PG-13');
INSERT INTO public.film VALUES (363, 'Go Purple', 'A Fast-Paced Display of a Car And a Database Administrator who must Battle a Woman in A Baloon', 2006, 1, 3, 0.99, 54, 12.99, 'R');
INSERT INTO public.film VALUES (364, 'Godfather Diary', 'A Stunning Saga of a Lumberjack And a Squirrel who must Chase a Car in The Outback', 2006, 1, 3, 2.99, 73, 14.99, 'NC-17');
INSERT INTO public.film VALUES (365, 'Gold River', 'A Taut Documentary of a Database Administrator And a Waitress who must Reach a Mad Scientist in A Baloon Factory', 2006, 1, 4, 4.99, 154, 21.99, 'R');
INSERT INTO public.film VALUES (366, 'Goldfinger Sensibility', 'A Insightful Drama of a Mad Scientist And a Hunter who must Defeat a Pastry Chef in New Orleans', 2006, 1, 3, 0.99, 93, 29.99, 'G');
INSERT INTO public.film VALUES (367, 'Goldmine Tycoon', 'A Brilliant Epistle of a Composer And a Frisbee who must Conquer a Husband in The Outback', 2006, 1, 6, 0.99, 153, 20.99, 'R');
INSERT INTO public.film VALUES (368, 'Gone Trouble', 'A Insightful Character Study of a Mad Cow And a Forensic Psychologist who must Conquer a A Shark in A Manhattan Penthouse', 2006, 1, 7, 2.99, 84, 20.99, 'R');
INSERT INTO public.film VALUES (369, 'Goodfellas Salute', 'A Unbelieveable Tale of a Dog And a Explorer who must Sink a Mad Cow in A Baloon Factory', 2006, 1, 4, 4.99, 56, 22.99, 'PG');
INSERT INTO public.film VALUES (370, 'Gorgeous Bingo', 'A Action-Packed Display of a Sumo Wrestler And a Car who must Overcome a Waitress in A Baloon Factory', 2006, 1, 4, 2.99, 108, 26.99, 'R');
INSERT INTO public.film VALUES (371, 'Gosford Donnie', 'A Epic Panorama of a Mad Scientist And a Monkey who must Redeem a Secret Agent in Berlin', 2006, 1, 5, 4.99, 129, 17.99, 'G');
INSERT INTO public.film VALUES (372, 'Graceland Dynamite', 'A Taut Display of a Cat And a Girl who must Overcome a Database Administrator in New Orleans', 2006, 1, 5, 4.99, 140, 26.99, 'R');
INSERT INTO public.film VALUES (373, 'Graduate Lord', 'A Lacklusture Epistle of a Girl And a A Shark who must Meet a Mad Scientist in Ancient China', 2006, 1, 7, 2.99, 156, 14.99, 'G');
INSERT INTO public.film VALUES (374, 'Graffiti Love', 'A Unbelieveable Epistle of a Sumo Wrestler And a Hunter who must Build a Composer in Berlin', 2006, 1, 3, 0.99, 117, 29.99, 'PG');
INSERT INTO public.film VALUES (375, 'Grail Frankenstein', 'A Unbelieveable Saga of a Teacher And a Monkey who must Fight a Girl in An Abandoned Mine Shaft', 2006, 1, 4, 2.99, 85, 17.99, 'NC-17');
INSERT INTO public.film VALUES (376, 'Grapes Fury', 'A Boring Yarn of a Mad Cow And a Sumo Wrestler who must Meet a Robot in Australia', 2006, 1, 4, 0.99, 155, 20.99, 'G');
INSERT INTO public.film VALUES (377, 'Grease Youth', 'A Emotional Panorama of a Secret Agent And a Waitress who must Escape a Composer in Soviet Georgia', 2006, 1, 7, 0.99, 135, 20.99, 'G');
INSERT INTO public.film VALUES (378, 'Greatest North', 'A Astounding Character Study of a Secret Agent And a Robot who must Build a A Shark in Berlin', 2006, 1, 5, 2.99, 93, 24.99, 'NC-17');
INSERT INTO public.film VALUES (379, 'Greedy Roots', 'A Amazing Reflection of a A Shark And a Butler who must Chase a Hunter in The Canadian Rockies', 2006, 1, 7, 0.99, 166, 14.99, 'R');
INSERT INTO public.film VALUES (380, 'Greek Everyone', 'A Stunning Display of a Butler And a Teacher who must Confront a A Shark in The First Manned Space Station', 2006, 1, 7, 2.99, 176, 11.99, 'PG');
INSERT INTO public.film VALUES (381, 'Grinch Massage', 'A Intrepid Display of a Madman And a Feminist who must Pursue a Pioneer in The First Manned Space Station', 2006, 1, 7, 4.99, 150, 25.99, 'R');
INSERT INTO public.film VALUES (382, 'Grit Clockwork', 'A Thoughtful Display of a Dentist And a Squirrel who must Confront a Lumberjack in A Shark Tank', 2006, 1, 3, 0.99, 137, 21.99, 'PG');
INSERT INTO public.film VALUES (383, 'Groove Fiction', 'A Unbelieveable Reflection of a Moose And a A Shark who must Defeat a Lumberjack in An Abandoned Mine Shaft', 2006, 1, 6, 0.99, 111, 13.99, 'NC-17');
INSERT INTO public.film VALUES (385, 'Groundhog Uncut', 'A Brilliant Panorama of a Astronaut And a Technical Writer who must Discover a Butler in A Manhattan Penthouse', 2006, 1, 6, 4.99, 139, 26.99, 'PG-13');
INSERT INTO public.film VALUES (386, 'Gump Date', 'A Intrepid Yarn of a Explorer And a Student who must Kill a Husband in An Abandoned Mine Shaft', 2006, 1, 3, 4.99, 53, 12.99, 'NC-17');
INSERT INTO public.film VALUES (387, 'Gun Bonnie', 'A Boring Display of a Sumo Wrestler And a Husband who must Build a Waitress in The Gulf of Mexico', 2006, 1, 7, 0.99, 100, 27.99, 'G');
INSERT INTO public.film VALUES (388, 'Gunfight Moon', 'A Epic Reflection of a Pastry Chef And a Explorer who must Reach a Dentist in The Sahara Desert', 2006, 1, 5, 0.99, 70, 16.99, 'NC-17');
INSERT INTO public.film VALUES (389, 'Gunfighter Mussolini', 'A Touching Saga of a Robot And a Boy who must Kill a Man in Ancient Japan', 2006, 1, 3, 2.99, 127, 9.99, 'PG-13');
INSERT INTO public.film VALUES (390, 'Guys Falcon', 'A Boring Story of a Woman And a Feminist who must Redeem a Squirrel in A U-Boat', 2006, 1, 4, 4.99, 84, 20.99, 'R');
INSERT INTO public.film VALUES (391, 'Half Outfield', 'A Epic Epistle of a Database Administrator And a Crocodile who must Face a Madman in A Jet Boat', 2006, 1, 6, 2.99, 146, 25.99, 'PG-13');
INSERT INTO public.film VALUES (392, 'Hall Cassidy', 'A Beautiful Panorama of a Pastry Chef And a A Shark who must Battle a Pioneer in Soviet Georgia', 2006, 1, 5, 4.99, 51, 13.99, 'NC-17');
INSERT INTO public.film VALUES (393, 'Halloween Nuts', 'A Amazing Panorama of a Forensic Psychologist And a Technical Writer who must Fight a Dentist in A U-Boat', 2006, 1, 6, 2.99, 47, 19.99, 'PG-13');
INSERT INTO public.film VALUES (394, 'Hamlet Wisdom', 'A Touching Reflection of a Man And a Man who must Sink a Robot in The Outback', 2006, 1, 7, 2.99, 146, 21.99, 'R');
INSERT INTO public.film VALUES (449, 'Identity Lover', 'A Boring Tale of a Composer And a Mad Cow who must Defeat a Car in The Outback', 2006, 1, 4, 2.99, 119, 12.99, 'PG-13');
INSERT INTO public.film VALUES (395, 'Handicap Boondock', 'A Beautiful Display of a Pioneer And a Squirrel who must Vanquish a Sumo Wrestler in Soviet Georgia', 2006, 1, 4, 0.99, 108, 28.99, 'R');
INSERT INTO public.film VALUES (396, 'Hanging Deep', 'A Action-Packed Yarn of a Boat And a Crocodile who must Build a Monkey in Berlin', 2006, 1, 5, 4.99, 62, 18.99, 'G');
INSERT INTO public.film VALUES (397, 'Hanky October', 'A Boring Epistle of a Database Administrator And a Explorer who must Pursue a Madman in Soviet Georgia', 2006, 1, 5, 2.99, 107, 26.99, 'NC-17');
INSERT INTO public.film VALUES (398, 'Hanover Galaxy', 'A Stunning Reflection of a Girl And a Secret Agent who must Succumb a Boy in A MySQL Convention', 2006, 1, 5, 4.99, 47, 21.99, 'NC-17');
INSERT INTO public.film VALUES (399, 'Happiness United', 'A Action-Packed Panorama of a Husband And a Feminist who must Meet a Forensic Psychologist in Ancient Japan', 2006, 1, 6, 2.99, 100, 23.99, 'G');
INSERT INTO public.film VALUES (400, 'Hardly Robbers', 'A Emotional Character Study of a Hunter And a Car who must Kill a Woman in Berlin', 2006, 1, 7, 2.99, 72, 15.99, 'R');
INSERT INTO public.film VALUES (401, 'Harold French', 'A Stunning Saga of a Sumo Wrestler And a Student who must Outrace a Moose in The Sahara Desert', 2006, 1, 6, 0.99, 168, 10.99, 'NC-17');
INSERT INTO public.film VALUES (402, 'Harper Dying', 'A Awe-Inspiring Reflection of a Woman And a Cat who must Confront a Feminist in The Sahara Desert', 2006, 1, 3, 0.99, 52, 15.99, 'G');
INSERT INTO public.film VALUES (403, 'Harry Idaho', 'A Taut Yarn of a Technical Writer And a Feminist who must Outrace a Dog in California', 2006, 1, 5, 4.99, 121, 18.99, 'PG-13');
INSERT INTO public.film VALUES (404, 'Hate Handicap', 'A Intrepid Reflection of a Mad Scientist And a Pioneer who must Overcome a Hunter in The First Manned Space Station', 2006, 1, 4, 0.99, 107, 26.99, 'PG');
INSERT INTO public.film VALUES (405, 'Haunted Antitrust', 'A Amazing Saga of a Man And a Dentist who must Reach a Technical Writer in Ancient India', 2006, 1, 6, 4.99, 76, 13.99, 'NC-17');
INSERT INTO public.film VALUES (406, 'Haunting Pianist', 'A Fast-Paced Story of a Database Administrator And a Composer who must Defeat a Squirrel in An Abandoned Amusement Park', 2006, 1, 5, 0.99, 181, 22.99, 'R');
INSERT INTO public.film VALUES (407, 'Hawk Chill', 'A Action-Packed Drama of a Mad Scientist And a Composer who must Outgun a Car in Australia', 2006, 1, 5, 0.99, 47, 12.99, 'PG-13');
INSERT INTO public.film VALUES (408, 'Head Stranger', 'A Thoughtful Saga of a Hunter And a Crocodile who must Confront a Dog in The Gulf of Mexico', 2006, 1, 4, 4.99, 69, 28.99, 'R');
INSERT INTO public.film VALUES (409, 'Heartbreakers Bright', 'A Awe-Inspiring Documentary of a A Shark And a Dentist who must Outrace a Pastry Chef in The Canadian Rockies', 2006, 1, 3, 4.99, 59, 9.99, 'G');
INSERT INTO public.film VALUES (410, 'Heaven Freedom', 'A Intrepid Story of a Butler And a Car who must Vanquish a Man in New Orleans', 2006, 1, 7, 2.99, 48, 19.99, 'PG');
INSERT INTO public.film VALUES (411, 'Heavenly Gun', 'A Beautiful Yarn of a Forensic Psychologist And a Frisbee who must Battle a Moose in A Jet Boat', 2006, 1, 5, 4.99, 49, 13.99, 'NC-17');
INSERT INTO public.film VALUES (412, 'Heavyweights Beast', 'A Unbelieveable Story of a Composer And a Dog who must Overcome a Womanizer in An Abandoned Amusement Park', 2006, 1, 6, 4.99, 102, 25.99, 'G');
INSERT INTO public.film VALUES (451, 'Igby Maker', 'A Epic Documentary of a Hunter And a Dog who must Outgun a Dog in A Baloon Factory', 2006, 1, 7, 4.99, 160, 12.99, 'NC-17');
INSERT INTO public.film VALUES (413, 'Hedwig Alter', 'A Action-Packed Yarn of a Womanizer And a Lumberjack who must Chase a Sumo Wrestler in A Monastery', 2006, 1, 7, 2.99, 169, 16.99, 'NC-17');
INSERT INTO public.film VALUES (414, 'Hellfighters Sierra', 'A Taut Reflection of a A Shark And a Dentist who must Battle a Boat in Soviet Georgia', 2006, 1, 3, 2.99, 75, 23.99, 'PG');
INSERT INTO public.film VALUES (415, 'High Encino', 'A Fateful Saga of a Waitress And a Hunter who must Outrace a Sumo Wrestler in Australia', 2006, 1, 3, 2.99, 84, 23.99, 'R');
INSERT INTO public.film VALUES (416, 'Highball Potter', 'A Action-Packed Saga of a Husband And a Dog who must Redeem a Database Administrator in The Sahara Desert', 2006, 1, 6, 0.99, 110, 10.99, 'R');
INSERT INTO public.film VALUES (417, 'Hills Neighbors', 'A Epic Display of a Hunter And a Feminist who must Sink a Car in A U-Boat', 2006, 1, 5, 0.99, 93, 29.99, 'G');
INSERT INTO public.film VALUES (418, 'Hobbit Alien', 'A Emotional Drama of a Husband And a Girl who must Outgun a Composer in The First Manned Space Station', 2006, 1, 5, 0.99, 157, 27.99, 'PG-13');
INSERT INTO public.film VALUES (419, 'Hocus Frida', 'A Awe-Inspiring Tale of a Girl And a Madman who must Outgun a Student in A Shark Tank', 2006, 1, 4, 2.99, 141, 19.99, 'G');
INSERT INTO public.film VALUES (420, 'Holes Brannigan', 'A Fast-Paced Reflection of a Technical Writer And a Student who must Fight a Boy in The Canadian Rockies', 2006, 1, 7, 4.99, 128, 27.99, 'PG');
INSERT INTO public.film VALUES (421, 'Holiday Games', 'A Insightful Reflection of a Waitress And a Madman who must Pursue a Boy in Ancient Japan', 2006, 1, 7, 4.99, 78, 10.99, 'PG-13');
INSERT INTO public.film VALUES (422, 'Hollow Jeopardy', 'A Beautiful Character Study of a Robot And a Astronaut who must Overcome a Boat in A Monastery', 2006, 1, 7, 4.99, 136, 25.99, 'NC-17');
INSERT INTO public.film VALUES (423, 'Hollywood Anonymous', 'A Fast-Paced Epistle of a Boy And a Explorer who must Escape a Dog in A U-Boat', 2006, 1, 7, 0.99, 69, 29.99, 'PG');
INSERT INTO public.film VALUES (424, 'Holocaust Highball', 'A Awe-Inspiring Yarn of a Composer And a Man who must Find a Robot in Soviet Georgia', 2006, 1, 6, 0.99, 149, 12.99, 'R');
INSERT INTO public.film VALUES (425, 'Holy Tadpole', 'A Action-Packed Display of a Feminist And a Pioneer who must Pursue a Dog in A Baloon Factory', 2006, 1, 6, 0.99, 88, 20.99, 'R');
INSERT INTO public.film VALUES (426, 'Home Pity', 'A Touching Panorama of a Man And a Secret Agent who must Challenge a Teacher in A MySQL Convention', 2006, 1, 7, 4.99, 185, 15.99, 'R');
INSERT INTO public.film VALUES (427, 'Homeward Cider', 'A Taut Reflection of a Astronaut And a Squirrel who must Fight a Squirrel in A Manhattan Penthouse', 2006, 1, 5, 0.99, 103, 19.99, 'R');
INSERT INTO public.film VALUES (428, 'Homicide Peach', 'A Astounding Documentary of a Hunter And a Boy who must Confront a Boy in A MySQL Convention', 2006, 1, 6, 2.99, 141, 21.99, 'PG-13');
INSERT INTO public.film VALUES (429, 'Honey Ties', 'A Taut Story of a Waitress And a Crocodile who must Outrace a Lumberjack in A Shark Tank', 2006, 1, 3, 0.99, 84, 29.99, 'R');
INSERT INTO public.film VALUES (430, 'Hook Chariots', 'A Insightful Story of a Boy And a Dog who must Redeem a Boy in Australia', 2006, 1, 7, 0.99, 49, 23.99, 'G');
INSERT INTO public.film VALUES (450, 'Idols Snatchers', 'A Insightful Drama of a Car And a Composer who must Fight a Man in A Monastery', 2006, 1, 5, 2.99, 84, 29.99, 'NC-17');
INSERT INTO public.film VALUES (431, 'Hoosiers Birdcage', 'A Astounding Display of a Explorer And a Boat who must Vanquish a Car in The First Manned Space Station', 2006, 1, 3, 2.99, 176, 12.99, 'G');
INSERT INTO public.film VALUES (432, 'Hope Tootsie', 'A Amazing Documentary of a Student And a Sumo Wrestler who must Outgun a A Shark in A Shark Tank', 2006, 1, 4, 2.99, 139, 22.99, 'NC-17');
INSERT INTO public.film VALUES (433, 'Horn Working', 'A Stunning Display of a Mad Scientist And a Technical Writer who must Succumb a Monkey in A Shark Tank', 2006, 1, 4, 2.99, 95, 23.99, 'PG');
INSERT INTO public.film VALUES (434, 'Horror Reign', 'A Touching Documentary of a A Shark And a Car who must Build a Husband in Nigeria', 2006, 1, 3, 0.99, 139, 25.99, 'R');
INSERT INTO public.film VALUES (435, 'Hotel Happiness', 'A Thrilling Yarn of a Pastry Chef And a A Shark who must Challenge a Mad Scientist in The Outback', 2006, 1, 6, 4.99, 181, 28.99, 'PG-13');
INSERT INTO public.film VALUES (436, 'Hours Rage', 'A Fateful Story of a Explorer And a Feminist who must Meet a Technical Writer in Soviet Georgia', 2006, 1, 4, 0.99, 122, 14.99, 'NC-17');
INSERT INTO public.film VALUES (437, 'House Dynamite', 'A Taut Story of a Pioneer And a Squirrel who must Battle a Student in Soviet Georgia', 2006, 1, 7, 2.99, 109, 13.99, 'R');
INSERT INTO public.film VALUES (438, 'Human Graffiti', 'A Beautiful Reflection of a Womanizer And a Sumo Wrestler who must Chase a Database Administrator in The Gulf of Mexico', 2006, 1, 3, 2.99, 68, 22.99, 'NC-17');
INSERT INTO public.film VALUES (439, 'Hunchback Impossible', 'A Touching Yarn of a Frisbee And a Dentist who must Fight a Composer in Ancient Japan', 2006, 1, 4, 4.99, 151, 28.99, 'PG-13');
INSERT INTO public.film VALUES (440, 'Hunger Roof', 'A Unbelieveable Yarn of a Student And a Database Administrator who must Outgun a Husband in An Abandoned Mine Shaft', 2006, 1, 6, 0.99, 105, 21.99, 'G');
INSERT INTO public.film VALUES (441, 'Hunter Alter', 'A Emotional Drama of a Mad Cow And a Boat who must Redeem a Secret Agent in A Shark Tank', 2006, 1, 5, 2.99, 125, 21.99, 'PG-13');
INSERT INTO public.film VALUES (442, 'Hunting Musketeers', 'A Thrilling Reflection of a Pioneer And a Dentist who must Outrace a Womanizer in An Abandoned Mine Shaft', 2006, 1, 6, 2.99, 65, 24.99, 'NC-17');
INSERT INTO public.film VALUES (443, 'Hurricane Affair', 'A Lacklusture Epistle of a Database Administrator And a Woman who must Meet a Hunter in An Abandoned Mine Shaft', 2006, 1, 6, 2.99, 49, 11.99, 'PG');
INSERT INTO public.film VALUES (444, 'Hustler Party', 'A Emotional Reflection of a Sumo Wrestler And a Monkey who must Conquer a Robot in The Sahara Desert', 2006, 1, 3, 4.99, 83, 22.99, 'NC-17');
INSERT INTO public.film VALUES (445, 'Hyde Doctor', 'A Fanciful Documentary of a Boy And a Woman who must Redeem a Womanizer in A Jet Boat', 2006, 1, 5, 2.99, 100, 11.99, 'G');
INSERT INTO public.film VALUES (446, 'Hysterical Grail', 'A Amazing Saga of a Madman And a Dentist who must Build a Car in A Manhattan Penthouse', 2006, 1, 5, 4.99, 150, 19.99, 'PG');
INSERT INTO public.film VALUES (447, 'Ice Crossing', 'A Fast-Paced Tale of a Butler And a Moose who must Overcome a Pioneer in A Manhattan Penthouse', 2006, 1, 5, 2.99, 131, 28.99, 'R');
INSERT INTO public.film VALUES (448, 'Idaho Love', 'A Fast-Paced Drama of a Student And a Crocodile who must Meet a Database Administrator in The Outback', 2006, 1, 3, 2.99, 172, 25.99, 'PG-13');
INSERT INTO public.film VALUES (452, 'Illusion Amelie', 'A Emotional Epistle of a Boat And a Mad Scientist who must Outrace a Robot in An Abandoned Mine Shaft', 2006, 1, 4, 0.99, 122, 15.99, 'R');
INSERT INTO public.film VALUES (545, 'Madness Attacks', 'A Fanciful Tale of a Squirrel And a Boat who must Defeat a Crocodile in The Gulf of Mexico', 2006, 1, 4, 0.99, 178, 14.99, 'PG-13');
INSERT INTO public.film VALUES (453, 'Image Princess', 'A Lacklusture Panorama of a Secret Agent And a Crocodile who must Discover a Madman in The Canadian Rockies', 2006, 1, 3, 2.99, 178, 17.99, 'PG-13');
INSERT INTO public.film VALUES (454, 'Impact Aladdin', 'A Epic Character Study of a Frisbee And a Moose who must Outgun a Technical Writer in A Shark Tank', 2006, 1, 6, 0.99, 180, 20.99, 'PG-13');
INSERT INTO public.film VALUES (455, 'Impossible Prejudice', 'A Awe-Inspiring Yarn of a Monkey And a Hunter who must Chase a Teacher in Ancient China', 2006, 1, 7, 4.99, 103, 11.99, 'NC-17');
INSERT INTO public.film VALUES (456, 'Inch Jet', 'A Fateful Saga of a Womanizer And a Student who must Defeat a Butler in A Monastery', 2006, 1, 6, 4.99, 167, 18.99, 'NC-17');
INSERT INTO public.film VALUES (457, 'Independence Hotel', 'A Thrilling Tale of a Technical Writer And a Boy who must Face a Pioneer in A Monastery', 2006, 1, 5, 0.99, 157, 21.99, 'NC-17');
INSERT INTO public.film VALUES (458, 'Indian Love', 'A Insightful Saga of a Mad Scientist And a Mad Scientist who must Kill a Astronaut in An Abandoned Fun House', 2006, 1, 4, 0.99, 135, 26.99, 'NC-17');
INSERT INTO public.film VALUES (459, 'Informer Double', 'A Action-Packed Display of a Woman And a Dentist who must Redeem a Forensic Psychologist in The Canadian Rockies', 2006, 1, 4, 4.99, 74, 23.99, 'NC-17');
INSERT INTO public.film VALUES (460, 'Innocent Usual', 'A Beautiful Drama of a Pioneer And a Crocodile who must Challenge a Student in The Outback', 2006, 1, 3, 4.99, 178, 26.99, 'PG-13');
INSERT INTO public.film VALUES (461, 'Insects Stone', 'A Epic Display of a Butler And a Dog who must Vanquish a Crocodile in A Manhattan Penthouse', 2006, 1, 3, 0.99, 123, 14.99, 'NC-17');
INSERT INTO public.film VALUES (462, 'Insider Arizona', 'A Astounding Saga of a Mad Scientist And a Hunter who must Pursue a Robot in A Baloon Factory', 2006, 1, 5, 2.99, 78, 17.99, 'NC-17');
INSERT INTO public.film VALUES (463, 'Instinct Airport', 'A Touching Documentary of a Mad Cow And a Explorer who must Confront a Butler in A Manhattan Penthouse', 2006, 1, 4, 2.99, 116, 21.99, 'PG');
INSERT INTO public.film VALUES (464, 'Intentions Empire', 'A Astounding Epistle of a Cat And a Cat who must Conquer a Mad Cow in A U-Boat', 2006, 1, 3, 2.99, 107, 13.99, 'PG-13');
INSERT INTO public.film VALUES (465, 'Interview Liaisons', 'A Action-Packed Reflection of a Student And a Butler who must Discover a Database Administrator in A Manhattan Penthouse', 2006, 1, 4, 4.99, 59, 17.99, 'R');
INSERT INTO public.film VALUES (466, 'Intolerable Intentions', 'A Awe-Inspiring Story of a Monkey And a Pastry Chef who must Succumb a Womanizer in A MySQL Convention', 2006, 1, 6, 4.99, 63, 20.99, 'PG-13');
INSERT INTO public.film VALUES (467, 'Intrigue Worst', 'A Fanciful Character Study of a Explorer And a Mad Scientist who must Vanquish a Squirrel in A Jet Boat', 2006, 1, 6, 0.99, 181, 10.99, 'G');
INSERT INTO public.film VALUES (468, 'Invasion Cyclone', 'A Lacklusture Character Study of a Mad Scientist And a Womanizer who must Outrace a Explorer in A Monastery', 2006, 1, 5, 2.99, 97, 12.99, 'PG');
INSERT INTO public.film VALUES (469, 'Iron Moon', 'A Fast-Paced Documentary of a Mad Cow And a Boy who must Pursue a Dentist in A Baloon', 2006, 1, 7, 4.99, 46, 27.99, 'PG');
INSERT INTO public.film VALUES (470, 'Ishtar Rocketeer', 'A Astounding Saga of a Dog And a Squirrel who must Conquer a Dog in An Abandoned Fun House', 2006, 1, 4, 4.99, 79, 24.99, 'R');
INSERT INTO public.film VALUES (471, 'Island Exorcist', 'A Fanciful Panorama of a Technical Writer And a Boy who must Find a Dentist in An Abandoned Fun House', 2006, 1, 7, 2.99, 84, 23.99, 'NC-17');
INSERT INTO public.film VALUES (472, 'Italian African', 'A Astounding Character Study of a Monkey And a Moose who must Outgun a Cat in A U-Boat', 2006, 1, 3, 4.99, 174, 24.99, 'G');
INSERT INTO public.film VALUES (473, 'Jacket Frisco', 'A Insightful Reflection of a Womanizer And a Husband who must Conquer a Pastry Chef in A Baloon', 2006, 1, 5, 2.99, 181, 16.99, 'PG-13');
INSERT INTO public.film VALUES (474, 'Jade Bunch', 'A Insightful Panorama of a Squirrel And a Mad Cow who must Confront a Student in The First Manned Space Station', 2006, 1, 6, 2.99, 174, 21.99, 'NC-17');
INSERT INTO public.film VALUES (475, 'Japanese Run', 'A Awe-Inspiring Epistle of a Feminist And a Girl who must Sink a Girl in The Outback', 2006, 1, 6, 0.99, 135, 29.99, 'G');
INSERT INTO public.film VALUES (476, 'Jason Trap', 'A Thoughtful Tale of a Woman And a A Shark who must Conquer a Dog in A Monastery', 2006, 1, 5, 2.99, 130, 9.99, 'NC-17');
INSERT INTO public.film VALUES (477, 'Jawbreaker Brooklyn', 'A Stunning Reflection of a Boat And a Pastry Chef who must Succumb a A Shark in A Jet Boat', 2006, 1, 5, 0.99, 118, 15.99, 'PG');
INSERT INTO public.film VALUES (478, 'Jaws Harry', 'A Thrilling Display of a Database Administrator And a Monkey who must Overcome a Dog in An Abandoned Fun House', 2006, 1, 4, 2.99, 112, 10.99, 'G');
INSERT INTO public.film VALUES (479, 'Jedi Beneath', 'A Astounding Reflection of a Explorer And a Dentist who must Pursue a Student in Nigeria', 2006, 1, 7, 0.99, 128, 12.99, 'PG');
INSERT INTO public.film VALUES (480, 'Jeepers Wedding', 'A Astounding Display of a Composer And a Dog who must Kill a Pastry Chef in Soviet Georgia', 2006, 1, 3, 2.99, 84, 29.99, 'R');
INSERT INTO public.film VALUES (481, 'Jekyll Frogmen', 'A Fanciful Epistle of a Student And a Astronaut who must Kill a Waitress in A Shark Tank', 2006, 1, 4, 2.99, 58, 22.99, 'PG');
INSERT INTO public.film VALUES (482, 'Jeopardy Encino', 'A Boring Panorama of a Man And a Mad Cow who must Face a Explorer in Ancient India', 2006, 1, 3, 0.99, 102, 12.99, 'R');
INSERT INTO public.film VALUES (483, 'Jericho Mulan', 'A Amazing Yarn of a Hunter And a Butler who must Defeat a Boy in A Jet Boat', 2006, 1, 3, 2.99, 171, 29.99, 'NC-17');
INSERT INTO public.film VALUES (484, 'Jerk Paycheck', 'A Touching Character Study of a Pastry Chef And a Database Administrator who must Reach a A Shark in Ancient Japan', 2006, 1, 3, 2.99, 172, 13.99, 'NC-17');
INSERT INTO public.film VALUES (485, 'Jersey Sassy', 'A Lacklusture Documentary of a Madman And a Mad Cow who must Find a Feminist in Ancient Japan', 2006, 1, 6, 4.99, 60, 16.99, 'PG');
INSERT INTO public.film VALUES (486, 'Jet Neighbors', 'A Amazing Display of a Lumberjack And a Teacher who must Outrace a Woman in A U-Boat', 2006, 1, 7, 4.99, 59, 14.99, 'R');
INSERT INTO public.film VALUES (487, 'Jingle Sagebrush', 'A Epic Character Study of a Feminist And a Student who must Meet a Woman in A Baloon', 2006, 1, 6, 4.99, 124, 29.99, 'PG-13');
INSERT INTO public.film VALUES (488, 'Joon Northwest', 'A Thrilling Panorama of a Technical Writer And a Car who must Discover a Forensic Psychologist in A Shark Tank', 2006, 1, 3, 0.99, 105, 23.99, 'NC-17');
INSERT INTO public.film VALUES (489, 'Juggler Hardly', 'A Epic Story of a Mad Cow And a Astronaut who must Challenge a Car in California', 2006, 1, 4, 0.99, 54, 14.99, 'PG-13');
INSERT INTO public.film VALUES (490, 'Jumanji Blade', 'A Intrepid Yarn of a Husband And a Womanizer who must Pursue a Mad Scientist in New Orleans', 2006, 1, 4, 2.99, 121, 13.99, 'G');
INSERT INTO public.film VALUES (491, 'Jumping Wrath', 'A Touching Epistle of a Monkey And a Feminist who must Discover a Boat in Berlin', 2006, 1, 4, 0.99, 74, 18.99, 'NC-17');
INSERT INTO public.film VALUES (492, 'Jungle Closer', 'A Boring Character Study of a Boy And a Woman who must Battle a Astronaut in Australia', 2006, 1, 6, 0.99, 134, 11.99, 'NC-17');
INSERT INTO public.film VALUES (493, 'Kane Exorcist', 'A Epic Documentary of a Composer And a Robot who must Overcome a Car in Berlin', 2006, 1, 5, 0.99, 92, 18.99, 'R');
INSERT INTO public.film VALUES (494, 'Karate Moon', 'A Astounding Yarn of a Womanizer And a Dog who must Reach a Waitress in A MySQL Convention', 2006, 1, 4, 0.99, 120, 21.99, 'PG-13');
INSERT INTO public.film VALUES (495, 'Kentuckian Giant', 'A Stunning Yarn of a Woman And a Frisbee who must Escape a Waitress in A U-Boat', 2006, 1, 5, 2.99, 169, 10.99, 'PG');
INSERT INTO public.film VALUES (496, 'Kick Savannah', 'A Emotional Drama of a Monkey And a Robot who must Defeat a Monkey in New Orleans', 2006, 1, 3, 0.99, 179, 10.99, 'PG-13');
INSERT INTO public.film VALUES (497, 'Kill Brotherhood', 'A Touching Display of a Hunter And a Secret Agent who must Redeem a Husband in The Outback', 2006, 1, 4, 0.99, 54, 15.99, 'G');
INSERT INTO public.film VALUES (498, 'Killer Innocent', 'A Fanciful Character Study of a Student And a Explorer who must Succumb a Composer in An Abandoned Mine Shaft', 2006, 1, 7, 2.99, 161, 11.99, 'R');
INSERT INTO public.film VALUES (499, 'King Evolution', 'A Action-Packed Tale of a Boy And a Lumberjack who must Chase a Madman in A Baloon', 2006, 1, 3, 4.99, 184, 24.99, 'NC-17');
INSERT INTO public.film VALUES (500, 'Kiss Glory', 'A Lacklusture Reflection of a Girl And a Husband who must Find a Robot in The Canadian Rockies', 2006, 1, 5, 4.99, 163, 11.99, 'PG-13');
INSERT INTO public.film VALUES (501, 'Kissing Dolls', 'A Insightful Reflection of a Pioneer And a Teacher who must Build a Composer in The First Manned Space Station', 2006, 1, 3, 4.99, 141, 9.99, 'R');
INSERT INTO public.film VALUES (502, 'Knock Warlock', 'A Unbelieveable Story of a Teacher And a Boat who must Confront a Moose in A Baloon', 2006, 1, 4, 2.99, 71, 21.99, 'PG-13');
INSERT INTO public.film VALUES (503, 'Kramer Chocolate', 'A Amazing Yarn of a Robot And a Pastry Chef who must Redeem a Mad Scientist in The Outback', 2006, 1, 3, 2.99, 171, 24.99, 'R');
INSERT INTO public.film VALUES (504, 'Kwai Homeward', 'A Amazing Drama of a Car And a Squirrel who must Pursue a Car in Soviet Georgia', 2006, 1, 5, 0.99, 46, 25.99, 'PG-13');
INSERT INTO public.film VALUES (505, 'Labyrinth League', 'A Awe-Inspiring Saga of a Composer And a Frisbee who must Succumb a Pioneer in The Sahara Desert', 2006, 1, 6, 2.99, 46, 24.99, 'PG-13');
INSERT INTO public.film VALUES (753, 'Rush Goodfellas', 'A Emotional Display of a Man And a Dentist who must Challenge a Squirrel in Australia', 2006, 1, 3, 0.99, 48, 20.99, 'PG');
INSERT INTO public.film VALUES (506, 'Lady Stage', 'A Beautiful Character Study of a Woman And a Man who must Pursue a Explorer in A U-Boat', 2006, 1, 4, 4.99, 67, 14.99, 'PG');
INSERT INTO public.film VALUES (507, 'Ladybugs Armageddon', 'A Fateful Reflection of a Dog And a Mad Scientist who must Meet a Mad Scientist in New Orleans', 2006, 1, 4, 0.99, 113, 13.99, 'NC-17');
INSERT INTO public.film VALUES (508, 'Lambs Cincinatti', 'A Insightful Story of a Man And a Feminist who must Fight a Composer in Australia', 2006, 1, 6, 4.99, 144, 18.99, 'PG-13');
INSERT INTO public.film VALUES (509, 'Language Cowboy', 'A Epic Yarn of a Cat And a Madman who must Vanquish a Dentist in An Abandoned Amusement Park', 2006, 1, 5, 0.99, 78, 26.99, 'NC-17');
INSERT INTO public.film VALUES (510, 'Lawless Vision', 'A Insightful Yarn of a Boy And a Sumo Wrestler who must Outgun a Car in The Outback', 2006, 1, 6, 4.99, 181, 29.99, 'G');
INSERT INTO public.film VALUES (511, 'Lawrence Love', 'A Fanciful Yarn of a Database Administrator And a Mad Cow who must Pursue a Womanizer in Berlin', 2006, 1, 7, 0.99, 175, 23.99, 'NC-17');
INSERT INTO public.film VALUES (512, 'League Hellfighters', 'A Thoughtful Saga of a A Shark And a Monkey who must Outgun a Student in Ancient China', 2006, 1, 5, 4.99, 110, 25.99, 'PG-13');
INSERT INTO public.film VALUES (513, 'Leathernecks Dwarfs', 'A Fateful Reflection of a Dog And a Mad Cow who must Outrace a Teacher in An Abandoned Mine Shaft', 2006, 1, 6, 2.99, 153, 21.99, 'PG-13');
INSERT INTO public.film VALUES (514, 'Lebowski Soldiers', 'A Beautiful Epistle of a Secret Agent And a Pioneer who must Chase a Astronaut in Ancient China', 2006, 1, 6, 2.99, 69, 17.99, 'PG-13');
INSERT INTO public.film VALUES (515, 'Legally Secretary', 'A Astounding Tale of a A Shark And a Moose who must Meet a Womanizer in The Sahara Desert', 2006, 1, 7, 4.99, 113, 14.99, 'PG');
INSERT INTO public.film VALUES (516, 'Legend Jedi', 'A Awe-Inspiring Epistle of a Pioneer And a Student who must Outgun a Crocodile in The Outback', 2006, 1, 7, 0.99, 59, 18.99, 'PG');
INSERT INTO public.film VALUES (517, 'Lesson Cleopatra', 'A Emotional Display of a Man And a Explorer who must Build a Boy in A Manhattan Penthouse', 2006, 1, 3, 0.99, 167, 28.99, 'NC-17');
INSERT INTO public.film VALUES (518, 'Liaisons Sweet', 'A Boring Drama of a A Shark And a Explorer who must Redeem a Waitress in The Canadian Rockies', 2006, 1, 5, 4.99, 140, 15.99, 'PG');
INSERT INTO public.film VALUES (519, 'Liberty Magnificent', 'A Boring Drama of a Student And a Cat who must Sink a Technical Writer in A Baloon', 2006, 1, 3, 2.99, 138, 27.99, 'G');
INSERT INTO public.film VALUES (520, 'License Weekend', 'A Insightful Story of a Man And a Husband who must Overcome a Madman in A Monastery', 2006, 1, 7, 2.99, 91, 28.99, 'NC-17');
INSERT INTO public.film VALUES (521, 'Lies Treatment', 'A Fast-Paced Character Study of a Dentist And a Moose who must Defeat a Composer in The First Manned Space Station', 2006, 1, 7, 4.99, 147, 28.99, 'NC-17');
INSERT INTO public.film VALUES (522, 'Life Twisted', 'A Thrilling Reflection of a Teacher And a Composer who must Find a Man in The First Manned Space Station', 2006, 1, 4, 2.99, 137, 9.99, 'NC-17');
INSERT INTO public.film VALUES (523, 'Lights Deer', 'A Unbelieveable Epistle of a Dog And a Woman who must Confront a Moose in The Gulf of Mexico', 2006, 1, 7, 0.99, 174, 21.99, 'R');
INSERT INTO public.film VALUES (560, 'Mars Roman', 'A Boring Drama of a Car And a Dog who must Succumb a Madman in Soviet Georgia', 2006, 1, 6, 0.99, 62, 21.99, 'NC-17');
INSERT INTO public.film VALUES (524, 'Lion Uncut', 'A Intrepid Display of a Pastry Chef And a Cat who must Kill a A Shark in Ancient China', 2006, 1, 6, 0.99, 50, 13.99, 'PG');
INSERT INTO public.film VALUES (525, 'Loathing Legally', 'A Boring Epistle of a Pioneer And a Mad Scientist who must Escape a Frisbee in The Gulf of Mexico', 2006, 1, 4, 0.99, 140, 29.99, 'R');
INSERT INTO public.film VALUES (526, 'Lock Rear', 'A Thoughtful Character Study of a Squirrel And a Technical Writer who must Outrace a Student in Ancient Japan', 2006, 1, 7, 2.99, 120, 10.99, 'R');
INSERT INTO public.film VALUES (527, 'Lola Agent', 'A Astounding Tale of a Mad Scientist And a Husband who must Redeem a Database Administrator in Ancient Japan', 2006, 1, 4, 4.99, 85, 24.99, 'PG');
INSERT INTO public.film VALUES (528, 'Lolita World', 'A Thrilling Drama of a Girl And a Robot who must Redeem a Waitress in An Abandoned Mine Shaft', 2006, 1, 4, 2.99, 155, 25.99, 'NC-17');
INSERT INTO public.film VALUES (529, 'Lonely Elephant', 'A Intrepid Story of a Student And a Dog who must Challenge a Explorer in Soviet Georgia', 2006, 1, 3, 2.99, 67, 12.99, 'G');
INSERT INTO public.film VALUES (530, 'Lord Arizona', 'A Action-Packed Display of a Frisbee And a Pastry Chef who must Pursue a Crocodile in A Jet Boat', 2006, 1, 5, 2.99, 108, 27.99, 'PG-13');
INSERT INTO public.film VALUES (531, 'Lose Inch', 'A Stunning Reflection of a Student And a Technical Writer who must Battle a Butler in The First Manned Space Station', 2006, 1, 3, 0.99, 137, 18.99, 'R');
INSERT INTO public.film VALUES (532, 'Loser Hustler', 'A Stunning Drama of a Robot And a Feminist who must Outgun a Butler in Nigeria', 2006, 1, 5, 4.99, 80, 28.99, 'PG');
INSERT INTO public.film VALUES (533, 'Lost Bird', 'A Emotional Character Study of a Robot And a A Shark who must Defeat a Technical Writer in A Manhattan Penthouse', 2006, 1, 4, 2.99, 98, 21.99, 'PG-13');
INSERT INTO public.film VALUES (534, 'Louisiana Harry', 'A Lacklusture Drama of a Girl And a Technical Writer who must Redeem a Monkey in A Shark Tank', 2006, 1, 5, 0.99, 70, 18.99, 'PG-13');
INSERT INTO public.film VALUES (535, 'Love Suicides', 'A Brilliant Panorama of a Hunter And a Explorer who must Pursue a Dentist in An Abandoned Fun House', 2006, 1, 6, 0.99, 181, 21.99, 'R');
INSERT INTO public.film VALUES (536, 'Lovely Jingle', 'A Fanciful Yarn of a Crocodile And a Forensic Psychologist who must Discover a Crocodile in The Outback', 2006, 1, 3, 2.99, 65, 18.99, 'PG');
INSERT INTO public.film VALUES (537, 'Lover Truman', 'A Emotional Yarn of a Robot And a Boy who must Outgun a Technical Writer in A U-Boat', 2006, 1, 3, 2.99, 75, 29.99, 'G');
INSERT INTO public.film VALUES (538, 'Loverboy Attacks', 'A Boring Story of a Car And a Butler who must Build a Girl in Soviet Georgia', 2006, 1, 7, 0.99, 162, 19.99, 'PG-13');
INSERT INTO public.film VALUES (539, 'Luck Opus', 'A Boring Display of a Moose And a Squirrel who must Outrace a Teacher in A Shark Tank', 2006, 1, 7, 2.99, 152, 21.99, 'NC-17');
INSERT INTO public.film VALUES (540, 'Lucky Flying', 'A Lacklusture Character Study of a A Shark And a Man who must Find a Forensic Psychologist in A U-Boat', 2006, 1, 7, 2.99, 97, 10.99, 'PG-13');
INSERT INTO public.film VALUES (541, 'Luke Mummy', 'A Taut Character Study of a Boy And a Robot who must Redeem a Mad Scientist in Ancient India', 2006, 1, 5, 2.99, 74, 21.99, 'NC-17');
INSERT INTO public.film VALUES (561, 'Mask Peach', 'A Boring Character Study of a Student And a Robot who must Meet a Woman in California', 2006, 1, 6, 2.99, 123, 26.99, 'NC-17');
INSERT INTO public.film VALUES (542, 'Lust Lock', 'A Fanciful Panorama of a Hunter And a Dentist who must Meet a Secret Agent in The Sahara Desert', 2006, 1, 3, 2.99, 52, 28.99, 'G');
INSERT INTO public.film VALUES (543, 'Madigan Dorado', 'A Astounding Character Study of a A Shark And a A Shark who must Discover a Crocodile in The Outback', 2006, 1, 5, 4.99, 116, 20.99, 'R');
INSERT INTO public.film VALUES (544, 'Madison Trap', 'A Awe-Inspiring Reflection of a Monkey And a Dentist who must Overcome a Pioneer in A U-Boat', 2006, 1, 4, 2.99, 147, 11.99, 'R');
INSERT INTO public.film VALUES (546, 'Madre Gables', 'A Intrepid Panorama of a Sumo Wrestler And a Forensic Psychologist who must Discover a Moose in The First Manned Space Station', 2006, 1, 7, 2.99, 98, 27.99, 'PG-13');
INSERT INTO public.film VALUES (547, 'Magic Mallrats', 'A Touching Documentary of a Pastry Chef And a Pastry Chef who must Build a Mad Scientist in California', 2006, 1, 3, 0.99, 117, 19.99, 'PG');
INSERT INTO public.film VALUES (548, 'Magnificent Chitty', 'A Insightful Story of a Teacher And a Hunter who must Face a Mad Cow in California', 2006, 1, 3, 2.99, 53, 27.99, 'R');
INSERT INTO public.film VALUES (549, 'Magnolia Forrester', 'A Thoughtful Documentary of a Composer And a Explorer who must Conquer a Dentist in New Orleans', 2006, 1, 4, 0.99, 171, 28.99, 'PG-13');
INSERT INTO public.film VALUES (550, 'Maguire Apache', 'A Fast-Paced Reflection of a Waitress And a Hunter who must Defeat a Forensic Psychologist in A Baloon', 2006, 1, 6, 2.99, 74, 22.99, 'NC-17');
INSERT INTO public.film VALUES (551, 'Maiden Home', 'A Lacklusture Saga of a Moose And a Teacher who must Kill a Forensic Psychologist in A MySQL Convention', 2006, 1, 3, 4.99, 138, 9.99, 'PG');
INSERT INTO public.film VALUES (552, 'Majestic Floats', 'A Thrilling Character Study of a Moose And a Student who must Escape a Butler in The First Manned Space Station', 2006, 1, 5, 0.99, 130, 15.99, 'PG');
INSERT INTO public.film VALUES (553, 'Maker Gables', 'A Stunning Display of a Moose And a Database Administrator who must Pursue a Composer in A Jet Boat', 2006, 1, 4, 0.99, 136, 12.99, 'PG-13');
INSERT INTO public.film VALUES (554, 'Malkovich Pet', 'A Intrepid Reflection of a Waitress And a A Shark who must Kill a Squirrel in The Outback', 2006, 1, 6, 2.99, 159, 22.99, 'G');
INSERT INTO public.film VALUES (555, 'Mallrats United', 'A Thrilling Yarn of a Waitress And a Dentist who must Find a Hunter in A Monastery', 2006, 1, 4, 0.99, 133, 25.99, 'PG');
INSERT INTO public.film VALUES (556, 'Maltese Hope', 'A Fast-Paced Documentary of a Crocodile And a Sumo Wrestler who must Conquer a Explorer in California', 2006, 1, 6, 4.99, 127, 26.99, 'PG-13');
INSERT INTO public.film VALUES (557, 'Manchurian Curtain', 'A Stunning Tale of a Mad Cow And a Boy who must Battle a Boy in Berlin', 2006, 1, 5, 2.99, 177, 27.99, 'PG');
INSERT INTO public.film VALUES (558, 'Mannequin Worst', 'A Astounding Saga of a Mad Cow And a Pastry Chef who must Discover a Husband in Ancient India', 2006, 1, 3, 2.99, 71, 18.99, 'PG-13');
INSERT INTO public.film VALUES (559, 'Married Go', 'A Fanciful Story of a Womanizer And a Dog who must Face a Forensic Psychologist in The Sahara Desert', 2006, 1, 7, 2.99, 114, 22.99, 'G');
INSERT INTO public.film VALUES (562, 'Masked Bubble', 'A Fanciful Documentary of a Pioneer And a Boat who must Pursue a Pioneer in An Abandoned Mine Shaft', 2006, 1, 6, 0.99, 151, 12.99, 'PG-13');
INSERT INTO public.film VALUES (563, 'Massacre Usual', 'A Fateful Reflection of a Waitress And a Crocodile who must Challenge a Forensic Psychologist in California', 2006, 1, 6, 4.99, 165, 16.99, 'R');
INSERT INTO public.film VALUES (564, 'Massage Image', 'A Fateful Drama of a Frisbee And a Crocodile who must Vanquish a Dog in The First Manned Space Station', 2006, 1, 4, 2.99, 161, 11.99, 'PG');
INSERT INTO public.film VALUES (565, 'Matrix Snowman', 'A Action-Packed Saga of a Womanizer And a Woman who must Overcome a Student in California', 2006, 1, 6, 4.99, 56, 9.99, 'PG-13');
INSERT INTO public.film VALUES (566, 'Maude Mod', 'A Beautiful Documentary of a Forensic Psychologist And a Cat who must Reach a Astronaut in Nigeria', 2006, 1, 6, 0.99, 72, 20.99, 'R');
INSERT INTO public.film VALUES (568, 'Memento Zoolander', 'A Touching Epistle of a Squirrel And a Explorer who must Redeem a Pastry Chef in The Sahara Desert', 2006, 1, 4, 4.99, 77, 11.99, 'NC-17');
INSERT INTO public.film VALUES (569, 'Menagerie Rushmore', 'A Unbelieveable Panorama of a Composer And a Butler who must Overcome a Database Administrator in The First Manned Space Station', 2006, 1, 7, 2.99, 147, 18.99, 'G');
INSERT INTO public.film VALUES (570, 'Mermaid Insects', 'A Lacklusture Drama of a Waitress And a Husband who must Fight a Husband in California', 2006, 1, 5, 4.99, 104, 20.99, 'NC-17');
INSERT INTO public.film VALUES (571, 'Metal Armageddon', 'A Thrilling Display of a Lumberjack And a Crocodile who must Meet a Monkey in A Baloon Factory', 2006, 1, 6, 2.99, 161, 26.99, 'PG-13');
INSERT INTO public.film VALUES (572, 'Metropolis Coma', 'A Emotional Saga of a Database Administrator And a Pastry Chef who must Confront a Teacher in A Baloon Factory', 2006, 1, 4, 2.99, 64, 9.99, 'PG-13');
INSERT INTO public.film VALUES (573, 'Microcosmos Paradise', 'A Touching Character Study of a Boat And a Student who must Sink a A Shark in Nigeria', 2006, 1, 6, 2.99, 105, 22.99, 'PG-13');
INSERT INTO public.film VALUES (574, 'Midnight Westward', 'A Taut Reflection of a Husband And a A Shark who must Redeem a Pastry Chef in A Monastery', 2006, 1, 3, 0.99, 86, 19.99, 'G');
INSERT INTO public.film VALUES (575, 'Midsummer Groundhog', 'A Fateful Panorama of a Moose And a Dog who must Chase a Crocodile in Ancient Japan', 2006, 1, 3, 4.99, 48, 27.99, 'G');
INSERT INTO public.film VALUES (576, 'Mighty Luck', 'A Astounding Epistle of a Mad Scientist And a Pioneer who must Escape a Database Administrator in A MySQL Convention', 2006, 1, 7, 2.99, 122, 13.99, 'PG');
INSERT INTO public.film VALUES (577, 'Mile Mulan', 'A Lacklusture Epistle of a Cat And a Husband who must Confront a Boy in A MySQL Convention', 2006, 1, 4, 0.99, 64, 10.99, 'PG');
INSERT INTO public.film VALUES (578, 'Million Ace', 'A Brilliant Documentary of a Womanizer And a Squirrel who must Find a Technical Writer in The Sahara Desert', 2006, 1, 4, 4.99, 142, 16.99, 'PG-13');
INSERT INTO public.film VALUES (579, 'Minds Truman', 'A Taut Yarn of a Mad Scientist And a Crocodile who must Outgun a Database Administrator in A Monastery', 2006, 1, 3, 4.99, 149, 22.99, 'PG-13');
INSERT INTO public.film VALUES (580, 'Mine Titans', 'A Amazing Yarn of a Robot And a Womanizer who must Discover a Forensic Psychologist in Berlin', 2006, 1, 3, 4.99, 166, 12.99, 'PG-13');
INSERT INTO public.film VALUES (581, 'Minority Kiss', 'A Insightful Display of a Lumberjack And a Sumo Wrestler who must Meet a Man in The Outback', 2006, 1, 4, 0.99, 59, 16.99, 'G');
INSERT INTO public.film VALUES (582, 'Miracle Virtual', 'A Touching Epistle of a Butler And a Boy who must Find a Mad Scientist in The Sahara Desert', 2006, 1, 3, 2.99, 162, 19.99, 'PG-13');
INSERT INTO public.film VALUES (583, 'Mission Zoolander', 'A Intrepid Story of a Sumo Wrestler And a Teacher who must Meet a A Shark in An Abandoned Fun House', 2006, 1, 3, 4.99, 164, 26.99, 'PG-13');
INSERT INTO public.film VALUES (584, 'Mixed Doors', 'A Taut Drama of a Womanizer And a Lumberjack who must Succumb a Pioneer in Ancient India', 2006, 1, 6, 2.99, 180, 26.99, 'PG-13');
INSERT INTO public.film VALUES (585, 'Mob Duffel', 'A Unbelieveable Documentary of a Frisbee And a Boat who must Meet a Boy in The Canadian Rockies', 2006, 1, 4, 0.99, 105, 25.99, 'G');
INSERT INTO public.film VALUES (586, 'Mockingbird Hollywood', 'A Thoughtful Panorama of a Man And a Car who must Sink a Composer in Berlin', 2006, 1, 4, 0.99, 60, 27.99, 'PG');
INSERT INTO public.film VALUES (587, 'Mod Secretary', 'A Boring Documentary of a Mad Cow And a Cat who must Build a Lumberjack in New Orleans', 2006, 1, 6, 4.99, 77, 20.99, 'NC-17');
INSERT INTO public.film VALUES (588, 'Model Fish', 'A Beautiful Panorama of a Boat And a Crocodile who must Outrace a Dog in Australia', 2006, 1, 4, 4.99, 175, 11.99, 'NC-17');
INSERT INTO public.film VALUES (589, 'Modern Dorado', 'A Awe-Inspiring Story of a Butler And a Sumo Wrestler who must Redeem a Boy in New Orleans', 2006, 1, 3, 0.99, 74, 20.99, 'PG');
INSERT INTO public.film VALUES (590, 'Money Harold', 'A Touching Tale of a Explorer And a Boat who must Defeat a Robot in Australia', 2006, 1, 3, 2.99, 135, 17.99, 'PG');
INSERT INTO public.film VALUES (591, 'Monsoon Cause', 'A Astounding Tale of a Crocodile And a Car who must Outrace a Squirrel in A U-Boat', 2006, 1, 6, 4.99, 182, 20.99, 'PG');
INSERT INTO public.film VALUES (592, 'Monster Spartacus', 'A Fast-Paced Story of a Waitress And a Cat who must Fight a Girl in Australia', 2006, 1, 6, 2.99, 107, 28.99, 'PG');
INSERT INTO public.film VALUES (593, 'Monterey Labyrinth', 'A Awe-Inspiring Drama of a Monkey And a Composer who must Escape a Feminist in A U-Boat', 2006, 1, 6, 0.99, 158, 13.99, 'G');
INSERT INTO public.film VALUES (594, 'Montezuma Command', 'A Thrilling Reflection of a Waitress And a Butler who must Battle a Butler in A Jet Boat', 2006, 1, 6, 0.99, 126, 22.99, 'NC-17');
INSERT INTO public.film VALUES (595, 'Moon Bunch', 'A Beautiful Tale of a Astronaut And a Mad Cow who must Challenge a Cat in A Baloon Factory', 2006, 1, 7, 0.99, 83, 20.99, 'PG');
INSERT INTO public.film VALUES (596, 'Moonshine Cabin', 'A Thoughtful Display of a Astronaut And a Feminist who must Chase a Frisbee in A Jet Boat', 2006, 1, 4, 4.99, 171, 25.99, 'PG-13');
INSERT INTO public.film VALUES (597, 'Moonwalker Fool', 'A Epic Drama of a Feminist And a Pioneer who must Sink a Composer in New Orleans', 2006, 1, 5, 4.99, 184, 12.99, 'G');
INSERT INTO public.film VALUES (598, 'Mosquito Armageddon', 'A Thoughtful Character Study of a Waitress And a Feminist who must Build a Teacher in Ancient Japan', 2006, 1, 6, 0.99, 57, 22.99, 'G');
INSERT INTO public.film VALUES (599, 'Mother Oleander', 'A Boring Tale of a Husband And a Boy who must Fight a Squirrel in Ancient China', 2006, 1, 3, 0.99, 103, 20.99, 'R');
INSERT INTO public.film VALUES (600, 'Motions Details', 'A Awe-Inspiring Reflection of a Dog And a Student who must Kill a Car in An Abandoned Fun House', 2006, 1, 5, 0.99, 166, 16.99, 'PG');
INSERT INTO public.film VALUES (601, 'Moulin Wake', 'A Astounding Story of a Forensic Psychologist And a Cat who must Battle a Teacher in An Abandoned Mine Shaft', 2006, 1, 4, 0.99, 79, 20.99, 'PG-13');
INSERT INTO public.film VALUES (602, 'Mourning Purple', 'A Lacklusture Display of a Waitress And a Lumberjack who must Chase a Pioneer in New Orleans', 2006, 1, 5, 0.99, 146, 14.99, 'PG');
INSERT INTO public.film VALUES (736, 'Robbery Bright', 'A Taut Reflection of a Robot And a Squirrel who must Fight a Boat in Ancient Japan', 2006, 1, 4, 0.99, 134, 21.99, 'R');
INSERT INTO public.film VALUES (603, 'Movie Shakespeare', 'A Insightful Display of a Database Administrator And a Student who must Build a Hunter in Berlin', 2006, 1, 6, 4.99, 53, 27.99, 'PG');
INSERT INTO public.film VALUES (604, 'Mulan Moon', 'A Emotional Saga of a Womanizer And a Pioneer who must Overcome a Dentist in A Baloon', 2006, 1, 4, 0.99, 160, 10.99, 'G');
INSERT INTO public.film VALUES (605, 'Mulholland Beast', 'A Awe-Inspiring Display of a Husband And a Squirrel who must Battle a Sumo Wrestler in A Jet Boat', 2006, 1, 7, 2.99, 157, 13.99, 'PG');
INSERT INTO public.film VALUES (606, 'Mummy Creatures', 'A Fateful Character Study of a Crocodile And a Monkey who must Meet a Dentist in Australia', 2006, 1, 3, 0.99, 160, 15.99, 'NC-17');
INSERT INTO public.film VALUES (607, 'Muppet Mile', 'A Lacklusture Story of a Madman And a Teacher who must Kill a Frisbee in The Gulf of Mexico', 2006, 1, 5, 4.99, 50, 18.99, 'PG');
INSERT INTO public.film VALUES (608, 'Murder Antitrust', 'A Brilliant Yarn of a Car And a Database Administrator who must Escape a Boy in A MySQL Convention', 2006, 1, 6, 2.99, 166, 11.99, 'PG');
INSERT INTO public.film VALUES (609, 'Muscle Bright', 'A Stunning Panorama of a Sumo Wrestler And a Husband who must Redeem a Madman in Ancient India', 2006, 1, 7, 2.99, 185, 23.99, 'G');
INSERT INTO public.film VALUES (610, 'Music Boondock', 'A Thrilling Tale of a Butler And a Astronaut who must Battle a Explorer in The First Manned Space Station', 2006, 1, 7, 0.99, 129, 17.99, 'R');
INSERT INTO public.film VALUES (611, 'Musketeers Wait', 'A Touching Yarn of a Student And a Moose who must Fight a Mad Cow in Australia', 2006, 1, 7, 4.99, 73, 17.99, 'PG');
INSERT INTO public.film VALUES (612, 'Mussolini Spoilers', 'A Thrilling Display of a Boat And a Monkey who must Meet a Composer in Ancient China', 2006, 1, 6, 2.99, 180, 10.99, 'G');
INSERT INTO public.film VALUES (613, 'Mystic Truman', 'A Epic Yarn of a Teacher And a Hunter who must Outgun a Explorer in Soviet Georgia', 2006, 1, 5, 0.99, 92, 19.99, 'NC-17');
INSERT INTO public.film VALUES (614, 'Name Detective', 'A Touching Saga of a Sumo Wrestler And a Cat who must Pursue a Mad Scientist in Nigeria', 2006, 1, 5, 4.99, 178, 11.99, 'PG-13');
INSERT INTO public.film VALUES (615, 'Nash Chocolat', 'A Epic Reflection of a Monkey And a Mad Cow who must Kill a Forensic Psychologist in An Abandoned Mine Shaft', 2006, 1, 6, 2.99, 180, 21.99, 'PG-13');
INSERT INTO public.film VALUES (616, 'National Story', 'A Taut Epistle of a Mad Scientist And a Girl who must Escape a Monkey in California', 2006, 1, 4, 2.99, 92, 19.99, 'NC-17');
INSERT INTO public.film VALUES (617, 'Natural Stock', 'A Fast-Paced Story of a Sumo Wrestler And a Girl who must Defeat a Car in A Baloon Factory', 2006, 1, 4, 0.99, 50, 24.99, 'PG-13');
INSERT INTO public.film VALUES (618, 'Necklace Outbreak', 'A Astounding Epistle of a Database Administrator And a Mad Scientist who must Pursue a Cat in California', 2006, 1, 3, 0.99, 132, 21.99, 'PG');
INSERT INTO public.film VALUES (619, 'Neighbors Charade', 'A Fanciful Reflection of a Crocodile And a Astronaut who must Outrace a Feminist in An Abandoned Amusement Park', 2006, 1, 3, 0.99, 161, 20.99, 'R');
INSERT INTO public.film VALUES (620, 'Nemo Campus', 'A Lacklusture Reflection of a Monkey And a Squirrel who must Outrace a Womanizer in A Manhattan Penthouse', 2006, 1, 5, 2.99, 131, 23.99, 'NC-17');
INSERT INTO public.film VALUES (621, 'Network Peak', 'A Unbelieveable Reflection of a Butler And a Boat who must Outgun a Mad Scientist in California', 2006, 1, 5, 2.99, 75, 23.99, 'PG-13');
INSERT INTO public.film VALUES (622, 'Newsies Story', 'A Action-Packed Character Study of a Dog And a Lumberjack who must Outrace a Moose in The Gulf of Mexico', 2006, 1, 4, 0.99, 159, 25.99, 'G');
INSERT INTO public.film VALUES (642, 'Order Betrayed', 'A Amazing Saga of a Dog And a A Shark who must Challenge a Cat in The Sahara Desert', 2006, 1, 7, 2.99, 120, 13.99, 'PG-13');
INSERT INTO public.film VALUES (623, 'Newton Labyrinth', 'A Intrepid Character Study of a Moose And a Waitress who must Find a A Shark in Ancient India', 2006, 1, 4, 0.99, 75, 9.99, 'PG');
INSERT INTO public.film VALUES (624, 'Nightmare Chill', 'A Brilliant Display of a Robot And a Butler who must Fight a Waitress in An Abandoned Mine Shaft', 2006, 1, 3, 4.99, 149, 25.99, 'PG');
INSERT INTO public.film VALUES (625, 'None Spiking', 'A Boring Reflection of a Secret Agent And a Astronaut who must Face a Composer in A Manhattan Penthouse', 2006, 1, 3, 0.99, 83, 18.99, 'NC-17');
INSERT INTO public.film VALUES (626, 'Noon Papi', 'A Unbelieveable Character Study of a Mad Scientist And a Astronaut who must Find a Pioneer in A Manhattan Penthouse', 2006, 1, 5, 2.99, 57, 12.99, 'G');
INSERT INTO public.film VALUES (627, 'North Tequila', 'A Beautiful Character Study of a Mad Cow And a Robot who must Reach a Womanizer in New Orleans', 2006, 1, 4, 4.99, 67, 9.99, 'NC-17');
INSERT INTO public.film VALUES (628, 'Northwest Polish', 'A Boring Character Study of a Boy And a A Shark who must Outrace a Womanizer in The Outback', 2006, 1, 5, 2.99, 172, 24.99, 'PG');
INSERT INTO public.film VALUES (629, 'Notorious Reunion', 'A Amazing Epistle of a Woman And a Squirrel who must Fight a Hunter in A Baloon', 2006, 1, 7, 0.99, 128, 9.99, 'NC-17');
INSERT INTO public.film VALUES (630, 'Notting Speakeasy', 'A Thoughtful Display of a Butler And a Womanizer who must Find a Waitress in The Canadian Rockies', 2006, 1, 7, 0.99, 48, 19.99, 'PG-13');
INSERT INTO public.film VALUES (631, 'Novocaine Flight', 'A Fanciful Display of a Student And a Teacher who must Outgun a Crocodile in Nigeria', 2006, 1, 4, 0.99, 64, 11.99, 'G');
INSERT INTO public.film VALUES (632, 'Nuts Ties', 'A Thoughtful Drama of a Explorer And a Womanizer who must Meet a Teacher in California', 2006, 1, 5, 4.99, 145, 10.99, 'NC-17');
INSERT INTO public.film VALUES (633, 'October Submarine', 'A Taut Epistle of a Monkey And a Boy who must Confront a Husband in A Jet Boat', 2006, 1, 6, 4.99, 54, 10.99, 'PG-13');
INSERT INTO public.film VALUES (634, 'Odds Boogie', 'A Thrilling Yarn of a Feminist And a Madman who must Battle a Hunter in Berlin', 2006, 1, 6, 0.99, 48, 14.99, 'NC-17');
INSERT INTO public.film VALUES (635, 'Oklahoma Jumanji', 'A Thoughtful Drama of a Dentist And a Womanizer who must Meet a Husband in The Sahara Desert', 2006, 1, 7, 0.99, 58, 15.99, 'PG');
INSERT INTO public.film VALUES (636, 'Oleander Clue', 'A Boring Story of a Teacher And a Monkey who must Succumb a Forensic Psychologist in A Jet Boat', 2006, 1, 5, 0.99, 161, 12.99, 'PG');
INSERT INTO public.film VALUES (637, 'Open African', 'A Lacklusture Drama of a Secret Agent And a Explorer who must Discover a Car in A U-Boat', 2006, 1, 7, 4.99, 131, 16.99, 'PG');
INSERT INTO public.film VALUES (638, 'Operation Operation', 'A Intrepid Character Study of a Man And a Frisbee who must Overcome a Madman in Ancient China', 2006, 1, 7, 2.99, 156, 23.99, 'G');
INSERT INTO public.film VALUES (639, 'Opposite Necklace', 'A Fateful Epistle of a Crocodile And a Moose who must Kill a Explorer in Nigeria', 2006, 1, 7, 4.99, 92, 9.99, 'PG');
INSERT INTO public.film VALUES (640, 'Opus Ice', 'A Fast-Paced Drama of a Hunter And a Boy who must Discover a Feminist in The Sahara Desert', 2006, 1, 5, 4.99, 102, 21.99, 'R');
INSERT INTO public.film VALUES (641, 'Orange Grapes', 'A Astounding Documentary of a Butler And a Womanizer who must Face a Dog in A U-Boat', 2006, 1, 4, 0.99, 76, 21.99, 'PG-13');
INSERT INTO public.film VALUES (643, 'Orient Closer', 'A Astounding Epistle of a Technical Writer And a Teacher who must Fight a Squirrel in The Sahara Desert', 2006, 1, 3, 2.99, 118, 22.99, 'R');
INSERT INTO public.film VALUES (644, 'Oscar Gold', 'A Insightful Tale of a Database Administrator And a Dog who must Face a Madman in Soviet Georgia', 2006, 1, 7, 2.99, 115, 29.99, 'PG');
INSERT INTO public.film VALUES (645, 'Others Soup', 'A Lacklusture Documentary of a Mad Cow And a Madman who must Sink a Moose in The Gulf of Mexico', 2006, 1, 7, 2.99, 118, 18.99, 'PG');
INSERT INTO public.film VALUES (646, 'Outbreak Divine', 'A Unbelieveable Yarn of a Database Administrator And a Woman who must Succumb a A Shark in A U-Boat', 2006, 1, 6, 0.99, 169, 12.99, 'NC-17');
INSERT INTO public.film VALUES (647, 'Outfield Massacre', 'A Thoughtful Drama of a Husband And a Secret Agent who must Pursue a Database Administrator in Ancient India', 2006, 1, 4, 0.99, 129, 18.99, 'NC-17');
INSERT INTO public.film VALUES (648, 'Outlaw Hanky', 'A Thoughtful Story of a Astronaut And a Composer who must Conquer a Dog in The Sahara Desert', 2006, 1, 7, 4.99, 148, 17.99, 'PG-13');
INSERT INTO public.film VALUES (649, 'Oz Liaisons', 'A Epic Yarn of a Mad Scientist And a Cat who must Confront a Womanizer in A Baloon Factory', 2006, 1, 4, 2.99, 85, 14.99, 'R');
INSERT INTO public.film VALUES (650, 'Pacific Amistad', 'A Thrilling Yarn of a Dog And a Moose who must Kill a Pastry Chef in A Manhattan Penthouse', 2006, 1, 3, 0.99, 144, 27.99, 'G');
INSERT INTO public.film VALUES (651, 'Packer Madigan', 'A Epic Display of a Sumo Wrestler And a Forensic Psychologist who must Build a Woman in An Abandoned Amusement Park', 2006, 1, 3, 0.99, 84, 20.99, 'PG-13');
INSERT INTO public.film VALUES (652, 'Pajama Jawbreaker', 'A Emotional Drama of a Boy And a Technical Writer who must Redeem a Sumo Wrestler in California', 2006, 1, 3, 0.99, 126, 14.99, 'R');
INSERT INTO public.film VALUES (653, 'Panic Club', 'A Fanciful Display of a Teacher And a Crocodile who must Succumb a Girl in A Baloon', 2006, 1, 3, 4.99, 102, 15.99, 'G');
INSERT INTO public.film VALUES (654, 'Panky Submarine', 'A Touching Documentary of a Dentist And a Sumo Wrestler who must Overcome a Boy in The Gulf of Mexico', 2006, 1, 4, 4.99, 93, 19.99, 'G');
INSERT INTO public.film VALUES (655, 'Panther Reds', 'A Brilliant Panorama of a Moose And a Man who must Reach a Teacher in The Gulf of Mexico', 2006, 1, 5, 4.99, 109, 22.99, 'NC-17');
INSERT INTO public.film VALUES (656, 'Papi Necklace', 'A Fanciful Display of a Car And a Monkey who must Escape a Squirrel in Ancient Japan', 2006, 1, 3, 0.99, 128, 9.99, 'PG');
INSERT INTO public.film VALUES (657, 'Paradise Sabrina', 'A Intrepid Yarn of a Car And a Moose who must Outrace a Crocodile in A Manhattan Penthouse', 2006, 1, 5, 2.99, 48, 12.99, 'PG-13');
INSERT INTO public.film VALUES (658, 'Paris Weekend', 'A Intrepid Story of a Squirrel And a Crocodile who must Defeat a Monkey in The Outback', 2006, 1, 7, 2.99, 121, 19.99, 'PG-13');
INSERT INTO public.film VALUES (659, 'Park Citizen', 'A Taut Epistle of a Sumo Wrestler And a Girl who must Face a Husband in Ancient Japan', 2006, 1, 3, 4.99, 109, 14.99, 'PG-13');
INSERT INTO public.film VALUES (660, 'Party Knock', 'A Fateful Display of a Technical Writer And a Butler who must Battle a Sumo Wrestler in An Abandoned Mine Shaft', 2006, 1, 7, 2.99, 107, 11.99, 'PG');
INSERT INTO public.film VALUES (661, 'Past Suicides', 'A Intrepid Tale of a Madman And a Astronaut who must Challenge a Hunter in A Monastery', 2006, 1, 5, 4.99, 157, 17.99, 'PG-13');
INSERT INTO public.film VALUES (662, 'Paths Control', 'A Astounding Documentary of a Butler And a Cat who must Find a Frisbee in Ancient China', 2006, 1, 3, 4.99, 118, 9.99, 'PG');
INSERT INTO public.film VALUES (663, 'Patient Sister', 'A Emotional Epistle of a Squirrel And a Robot who must Confront a Lumberjack in Soviet Georgia', 2006, 1, 7, 0.99, 99, 29.99, 'NC-17');
INSERT INTO public.film VALUES (664, 'Patriot Roman', 'A Taut Saga of a Robot And a Database Administrator who must Challenge a Astronaut in California', 2006, 1, 6, 2.99, 65, 12.99, 'PG');
INSERT INTO public.film VALUES (665, 'Patton Interview', 'A Thrilling Documentary of a Composer And a Secret Agent who must Succumb a Cat in Berlin', 2006, 1, 4, 2.99, 175, 22.99, 'PG');
INSERT INTO public.film VALUES (666, 'Paycheck Wait', 'A Awe-Inspiring Reflection of a Boy And a Man who must Discover a Moose in The Sahara Desert', 2006, 1, 4, 4.99, 145, 27.99, 'PG-13');
INSERT INTO public.film VALUES (667, 'Peach Innocent', 'A Action-Packed Drama of a Monkey And a Dentist who must Chase a Butler in Berlin', 2006, 1, 3, 2.99, 160, 20.99, 'PG-13');
INSERT INTO public.film VALUES (668, 'Peak Forever', 'A Insightful Reflection of a Boat And a Secret Agent who must Vanquish a Astronaut in An Abandoned Mine Shaft', 2006, 1, 7, 4.99, 80, 25.99, 'PG');
INSERT INTO public.film VALUES (669, 'Pearl Destiny', 'A Lacklusture Yarn of a Astronaut And a Pastry Chef who must Sink a Dog in A U-Boat', 2006, 1, 3, 2.99, 74, 10.99, 'NC-17');
INSERT INTO public.film VALUES (670, 'Pelican Comforts', 'A Epic Documentary of a Boy And a Monkey who must Pursue a Astronaut in Berlin', 2006, 1, 4, 4.99, 48, 17.99, 'PG');
INSERT INTO public.film VALUES (671, 'Perdition Fargo', 'A Fast-Paced Story of a Car And a Cat who must Outgun a Hunter in Berlin', 2006, 1, 7, 4.99, 99, 27.99, 'NC-17');
INSERT INTO public.film VALUES (672, 'Perfect Groove', 'A Thrilling Yarn of a Dog And a Dog who must Build a Husband in A Baloon', 2006, 1, 7, 2.99, 82, 17.99, 'PG-13');
INSERT INTO public.film VALUES (673, 'Personal Ladybugs', 'A Epic Saga of a Hunter And a Technical Writer who must Conquer a Cat in Ancient Japan', 2006, 1, 3, 0.99, 118, 19.99, 'PG-13');
INSERT INTO public.film VALUES (674, 'Pet Haunting', 'A Unbelieveable Reflection of a Explorer And a Boat who must Conquer a Woman in California', 2006, 1, 3, 0.99, 99, 11.99, 'PG');
INSERT INTO public.film VALUES (675, 'Phantom Glory', 'A Beautiful Documentary of a Astronaut And a Crocodile who must Discover a Madman in A Monastery', 2006, 1, 6, 2.99, 60, 17.99, 'NC-17');
INSERT INTO public.film VALUES (676, 'Philadelphia Wife', 'A Taut Yarn of a Hunter And a Astronaut who must Conquer a Database Administrator in The Sahara Desert', 2006, 1, 7, 4.99, 137, 16.99, 'PG-13');
INSERT INTO public.film VALUES (677, 'Pianist Outfield', 'A Intrepid Story of a Boy And a Technical Writer who must Pursue a Lumberjack in A Monastery', 2006, 1, 6, 0.99, 136, 25.99, 'NC-17');
INSERT INTO public.film VALUES (678, 'Pickup Driving', 'A Touching Documentary of a Husband And a Boat who must Meet a Pastry Chef in A Baloon Factory', 2006, 1, 3, 2.99, 77, 23.99, 'G');
INSERT INTO public.film VALUES (679, 'Pilot Hoosiers', 'A Awe-Inspiring Reflection of a Crocodile And a Sumo Wrestler who must Meet a Forensic Psychologist in An Abandoned Mine Shaft', 2006, 1, 6, 2.99, 50, 17.99, 'PG');
INSERT INTO public.film VALUES (680, 'Pinocchio Simon', 'A Action-Packed Reflection of a Mad Scientist And a A Shark who must Find a Feminist in California', 2006, 1, 4, 4.99, 103, 21.99, 'PG');
INSERT INTO public.film VALUES (681, 'Pirates Roxanne', 'A Stunning Drama of a Woman And a Lumberjack who must Overcome a A Shark in The Canadian Rockies', 2006, 1, 4, 0.99, 100, 20.99, 'PG');
INSERT INTO public.film VALUES (682, 'Pittsburgh Hunchback', 'A Thrilling Epistle of a Boy And a Boat who must Find a Student in Soviet Georgia', 2006, 1, 4, 4.99, 134, 17.99, 'PG-13');
INSERT INTO public.film VALUES (683, 'Pity Bound', 'A Boring Panorama of a Feminist And a Moose who must Defeat a Database Administrator in Nigeria', 2006, 1, 5, 4.99, 60, 19.99, 'NC-17');
INSERT INTO public.film VALUES (684, 'Pizza Jumanji', 'A Epic Saga of a Cat And a Squirrel who must Outgun a Robot in A U-Boat', 2006, 1, 4, 2.99, 173, 11.99, 'NC-17');
INSERT INTO public.film VALUES (685, 'Platoon Instinct', 'A Thrilling Panorama of a Man And a Woman who must Reach a Woman in Australia', 2006, 1, 6, 4.99, 132, 10.99, 'PG-13');
INSERT INTO public.film VALUES (686, 'Pluto Oleander', 'A Action-Packed Reflection of a Car And a Moose who must Outgun a Car in A Shark Tank', 2006, 1, 5, 4.99, 84, 9.99, 'R');
INSERT INTO public.film VALUES (687, 'Pocus Pulp', 'A Intrepid Yarn of a Frisbee And a Dog who must Build a Astronaut in A Baloon Factory', 2006, 1, 6, 0.99, 138, 15.99, 'NC-17');
INSERT INTO public.film VALUES (688, 'Polish Brooklyn', 'A Boring Character Study of a Database Administrator And a Lumberjack who must Reach a Madman in The Outback', 2006, 1, 6, 0.99, 61, 12.99, 'PG');
INSERT INTO public.film VALUES (689, 'Pollock Deliverance', 'A Intrepid Story of a Madman And a Frisbee who must Outgun a Boat in The Sahara Desert', 2006, 1, 5, 2.99, 137, 14.99, 'PG');
INSERT INTO public.film VALUES (690, 'Pond Seattle', 'A Stunning Drama of a Teacher And a Boat who must Battle a Feminist in Ancient China', 2006, 1, 7, 2.99, 185, 25.99, 'PG-13');
INSERT INTO public.film VALUES (691, 'Poseidon Forever', 'A Thoughtful Epistle of a Womanizer And a Monkey who must Vanquish a Dentist in A Monastery', 2006, 1, 6, 4.99, 159, 29.99, 'PG-13');
INSERT INTO public.film VALUES (692, 'Potluck Mixed', 'A Beautiful Story of a Dog And a Technical Writer who must Outgun a Student in A Baloon', 2006, 1, 3, 2.99, 179, 10.99, 'G');
INSERT INTO public.film VALUES (693, 'Potter Connecticut', 'A Thrilling Epistle of a Frisbee And a Cat who must Fight a Technical Writer in Berlin', 2006, 1, 5, 2.99, 115, 16.99, 'PG');
INSERT INTO public.film VALUES (694, 'Prejudice Oleander', 'A Epic Saga of a Boy And a Dentist who must Outrace a Madman in A U-Boat', 2006, 1, 6, 4.99, 98, 15.99, 'PG-13');
INSERT INTO public.film VALUES (695, 'President Bang', 'A Fateful Panorama of a Technical Writer And a Moose who must Battle a Robot in Soviet Georgia', 2006, 1, 6, 4.99, 144, 12.99, 'PG');
INSERT INTO public.film VALUES (696, 'Pride Alamo', 'A Thoughtful Drama of a A Shark And a Forensic Psychologist who must Vanquish a Student in Ancient India', 2006, 1, 6, 0.99, 114, 20.99, 'NC-17');
INSERT INTO public.film VALUES (697, 'Primary Glass', 'A Fateful Documentary of a Pastry Chef And a Butler who must Build a Dog in The Canadian Rockies', 2006, 1, 7, 0.99, 53, 16.99, 'G');
INSERT INTO public.film VALUES (698, 'Princess Giant', 'A Thrilling Yarn of a Pastry Chef And a Monkey who must Battle a Monkey in A Shark Tank', 2006, 1, 3, 2.99, 71, 29.99, 'NC-17');
INSERT INTO public.film VALUES (699, 'Private Drop', 'A Stunning Story of a Technical Writer And a Hunter who must Succumb a Secret Agent in A Baloon', 2006, 1, 7, 4.99, 106, 26.99, 'PG');
INSERT INTO public.film VALUES (700, 'Prix Undefeated', 'A Stunning Saga of a Mad Scientist And a Boat who must Overcome a Dentist in Ancient China', 2006, 1, 4, 2.99, 115, 13.99, 'R');
INSERT INTO public.film VALUES (701, 'Psycho Shrunk', 'A Amazing Panorama of a Crocodile And a Explorer who must Fight a Husband in Nigeria', 2006, 1, 5, 2.99, 155, 11.99, 'PG-13');
INSERT INTO public.film VALUES (702, 'Pulp Beverly', 'A Unbelieveable Display of a Dog And a Crocodile who must Outrace a Man in Nigeria', 2006, 1, 4, 2.99, 89, 12.99, 'G');
INSERT INTO public.film VALUES (703, 'Punk Divorce', 'A Fast-Paced Tale of a Pastry Chef And a Boat who must Face a Frisbee in The Canadian Rockies', 2006, 1, 6, 4.99, 100, 18.99, 'PG');
INSERT INTO public.film VALUES (704, 'Pure Runner', 'A Thoughtful Documentary of a Student And a Madman who must Challenge a Squirrel in A Manhattan Penthouse', 2006, 1, 3, 2.99, 121, 25.99, 'NC-17');
INSERT INTO public.film VALUES (705, 'Purple Movie', 'A Boring Display of a Pastry Chef And a Sumo Wrestler who must Discover a Frisbee in An Abandoned Amusement Park', 2006, 1, 4, 2.99, 88, 9.99, 'R');
INSERT INTO public.film VALUES (706, 'Queen Luke', 'A Astounding Story of a Girl And a Boy who must Challenge a Composer in New Orleans', 2006, 1, 5, 4.99, 163, 22.99, 'PG');
INSERT INTO public.film VALUES (707, 'Quest Mussolini', 'A Fateful Drama of a Husband And a Sumo Wrestler who must Battle a Pastry Chef in A Baloon Factory', 2006, 1, 5, 2.99, 177, 29.99, 'R');
INSERT INTO public.film VALUES (708, 'Quills Bull', 'A Thoughtful Story of a Pioneer And a Woman who must Reach a Moose in Australia', 2006, 1, 4, 4.99, 112, 19.99, 'R');
INSERT INTO public.film VALUES (709, 'Racer Egg', 'A Emotional Display of a Monkey And a Waitress who must Reach a Secret Agent in California', 2006, 1, 7, 2.99, 147, 19.99, 'NC-17');
INSERT INTO public.film VALUES (710, 'Rage Games', 'A Fast-Paced Saga of a Astronaut And a Secret Agent who must Escape a Hunter in An Abandoned Amusement Park', 2006, 1, 4, 4.99, 120, 18.99, 'R');
INSERT INTO public.film VALUES (711, 'Raging Airplane', 'A Astounding Display of a Secret Agent And a Technical Writer who must Escape a Mad Scientist in A Jet Boat', 2006, 1, 4, 4.99, 154, 18.99, 'R');
INSERT INTO public.film VALUES (712, 'Raiders Antitrust', 'A Amazing Drama of a Teacher And a Feminist who must Meet a Woman in The First Manned Space Station', 2006, 1, 4, 0.99, 82, 11.99, 'PG-13');
INSERT INTO public.film VALUES (713, 'Rainbow Shock', 'A Action-Packed Story of a Hunter And a Boy who must Discover a Lumberjack in Ancient India', 2006, 1, 3, 4.99, 74, 14.99, 'PG');
INSERT INTO public.film VALUES (714, 'Random Go', 'A Fateful Drama of a Frisbee And a Student who must Confront a Cat in A Shark Tank', 2006, 1, 6, 2.99, 73, 29.99, 'NC-17');
INSERT INTO public.film VALUES (715, 'Range Moonwalker', 'A Insightful Documentary of a Hunter And a Dentist who must Confront a Crocodile in A Baloon', 2006, 1, 3, 4.99, 147, 25.99, 'PG');
INSERT INTO public.film VALUES (716, 'Reap Unfaithful', 'A Thrilling Epistle of a Composer And a Sumo Wrestler who must Challenge a Mad Cow in A MySQL Convention', 2006, 1, 6, 2.99, 136, 26.99, 'PG-13');
INSERT INTO public.film VALUES (717, 'Rear Trading', 'A Awe-Inspiring Reflection of a Forensic Psychologist And a Secret Agent who must Succumb a Pastry Chef in Soviet Georgia', 2006, 1, 6, 0.99, 97, 23.99, 'NC-17');
INSERT INTO public.film VALUES (718, 'Rebel Airport', 'A Intrepid Yarn of a Database Administrator And a Boat who must Outrace a Husband in Ancient India', 2006, 1, 7, 0.99, 73, 24.99, 'G');
INSERT INTO public.film VALUES (719, 'Records Zorro', 'A Amazing Drama of a Mad Scientist And a Composer who must Build a Husband in The Outback', 2006, 1, 7, 4.99, 182, 11.99, 'PG');
INSERT INTO public.film VALUES (720, 'Redemption Comforts', 'A Emotional Documentary of a Dentist And a Woman who must Battle a Mad Scientist in Ancient China', 2006, 1, 3, 2.99, 179, 20.99, 'NC-17');
INSERT INTO public.film VALUES (721, 'Reds Pocus', 'A Lacklusture Yarn of a Sumo Wrestler And a Squirrel who must Redeem a Monkey in Soviet Georgia', 2006, 1, 7, 4.99, 182, 23.99, 'PG-13');
INSERT INTO public.film VALUES (722, 'Reef Salute', 'A Action-Packed Saga of a Teacher And a Lumberjack who must Battle a Dentist in A Baloon', 2006, 1, 5, 0.99, 123, 26.99, 'NC-17');
INSERT INTO public.film VALUES (723, 'Reign Gentlemen', 'A Emotional Yarn of a Composer And a Man who must Escape a Butler in The Gulf of Mexico', 2006, 1, 3, 2.99, 82, 29.99, 'PG-13');
INSERT INTO public.film VALUES (724, 'Remember Diary', 'A Insightful Tale of a Technical Writer And a Waitress who must Conquer a Monkey in Ancient India', 2006, 1, 5, 2.99, 110, 15.99, 'R');
INSERT INTO public.film VALUES (725, 'Requiem Tycoon', 'A Unbelieveable Character Study of a Cat And a Database Administrator who must Pursue a Teacher in A Monastery', 2006, 1, 6, 4.99, 167, 25.99, 'R');
INSERT INTO public.film VALUES (726, 'Reservoir Adaptation', 'A Intrepid Drama of a Teacher And a Moose who must Kill a Car in California', 2006, 1, 7, 2.99, 61, 29.99, 'PG-13');
INSERT INTO public.film VALUES (727, 'Resurrection Silverado', 'A Epic Yarn of a Robot And a Explorer who must Challenge a Girl in A MySQL Convention', 2006, 1, 6, 0.99, 117, 12.99, 'PG');
INSERT INTO public.film VALUES (728, 'Reunion Witches', 'A Unbelieveable Documentary of a Database Administrator And a Frisbee who must Redeem a Mad Scientist in A Baloon Factory', 2006, 1, 3, 0.99, 63, 26.99, 'R');
INSERT INTO public.film VALUES (729, 'Rider Caddyshack', 'A Taut Reflection of a Monkey And a Womanizer who must Chase a Moose in Nigeria', 2006, 1, 5, 2.99, 177, 28.99, 'PG');
INSERT INTO public.film VALUES (730, 'Ridgemont Submarine', 'A Unbelieveable Drama of a Waitress And a Composer who must Sink a Mad Cow in Ancient Japan', 2006, 1, 3, 0.99, 46, 28.99, 'PG-13');
INSERT INTO public.film VALUES (731, 'Right Cranes', 'A Fateful Character Study of a Boat And a Cat who must Find a Database Administrator in A Jet Boat', 2006, 1, 7, 4.99, 153, 29.99, 'PG-13');
INSERT INTO public.film VALUES (732, 'Rings Heartbreakers', 'A Amazing Yarn of a Sumo Wrestler And a Boat who must Conquer a Waitress in New Orleans', 2006, 1, 5, 0.99, 58, 17.99, 'G');
INSERT INTO public.film VALUES (733, 'River Outlaw', 'A Thrilling Character Study of a Squirrel And a Lumberjack who must Face a Hunter in A MySQL Convention', 2006, 1, 4, 0.99, 149, 29.99, 'PG-13');
INSERT INTO public.film VALUES (734, 'Road Roxanne', 'A Boring Character Study of a Waitress And a Astronaut who must Fight a Crocodile in Ancient Japan', 2006, 1, 4, 4.99, 158, 12.99, 'R');
INSERT INTO public.film VALUES (735, 'Robbers Joon', 'A Thoughtful Story of a Mad Scientist And a Waitress who must Confront a Forensic Psychologist in Soviet Georgia', 2006, 1, 7, 2.99, 102, 26.99, 'PG-13');
INSERT INTO public.film VALUES (737, 'Rock Instinct', 'A Astounding Character Study of a Robot And a Moose who must Overcome a Astronaut in Ancient India', 2006, 1, 4, 0.99, 102, 28.99, 'G');
INSERT INTO public.film VALUES (738, 'Rocketeer Mother', 'A Awe-Inspiring Character Study of a Robot And a Sumo Wrestler who must Discover a Womanizer in A Shark Tank', 2006, 1, 3, 0.99, 178, 27.99, 'PG-13');
INSERT INTO public.film VALUES (927, 'Uprising Uptown', 'A Fanciful Reflection of a Boy And a Butler who must Pursue a Woman in Berlin', 2006, 1, 6, 2.99, 174, 16.99, 'NC-17');
INSERT INTO public.film VALUES (739, 'Rocky War', 'A Fast-Paced Display of a Squirrel And a Explorer who must Outgun a Mad Scientist in Nigeria', 2006, 1, 4, 4.99, 145, 17.99, 'PG-13');
INSERT INTO public.film VALUES (740, 'Rollercoaster Bringing', 'A Beautiful Drama of a Robot And a Lumberjack who must Discover a Technical Writer in A Shark Tank', 2006, 1, 5, 2.99, 153, 13.99, 'PG-13');
INSERT INTO public.film VALUES (741, 'Roman Punk', 'A Thoughtful Panorama of a Mad Cow And a Student who must Battle a Forensic Psychologist in Berlin', 2006, 1, 7, 0.99, 81, 28.99, 'NC-17');
INSERT INTO public.film VALUES (742, 'Roof Champion', 'A Lacklusture Reflection of a Car And a Explorer who must Find a Monkey in A Baloon', 2006, 1, 7, 0.99, 101, 25.99, 'R');
INSERT INTO public.film VALUES (743, 'Room Roman', 'A Awe-Inspiring Panorama of a Composer And a Secret Agent who must Sink a Composer in A Shark Tank', 2006, 1, 7, 0.99, 60, 27.99, 'PG');
INSERT INTO public.film VALUES (744, 'Roots Remember', 'A Brilliant Drama of a Mad Cow And a Hunter who must Escape a Hunter in Berlin', 2006, 1, 4, 0.99, 89, 23.99, 'PG-13');
INSERT INTO public.film VALUES (745, 'Roses Treasure', 'A Astounding Panorama of a Monkey And a Secret Agent who must Defeat a Woman in The First Manned Space Station', 2006, 1, 5, 4.99, 162, 23.99, 'PG-13');
INSERT INTO public.film VALUES (746, 'Rouge Squad', 'A Awe-Inspiring Drama of a Astronaut And a Frisbee who must Conquer a Mad Scientist in Australia', 2006, 1, 3, 0.99, 118, 10.99, 'NC-17');
INSERT INTO public.film VALUES (747, 'Roxanne Rebel', 'A Astounding Story of a Pastry Chef And a Database Administrator who must Fight a Man in The Outback', 2006, 1, 5, 0.99, 171, 9.99, 'R');
INSERT INTO public.film VALUES (748, 'Rugrats Shakespeare', 'A Touching Saga of a Crocodile And a Crocodile who must Discover a Technical Writer in Nigeria', 2006, 1, 4, 0.99, 109, 16.99, 'PG-13');
INSERT INTO public.film VALUES (749, 'Rules Human', 'A Beautiful Epistle of a Astronaut And a Student who must Confront a Monkey in An Abandoned Fun House', 2006, 1, 6, 4.99, 153, 19.99, 'R');
INSERT INTO public.film VALUES (750, 'Run Pacific', 'A Touching Tale of a Cat And a Pastry Chef who must Conquer a Pastry Chef in A MySQL Convention', 2006, 1, 3, 0.99, 145, 25.99, 'R');
INSERT INTO public.film VALUES (751, 'Runaway Tenenbaums', 'A Thoughtful Documentary of a Boat And a Man who must Meet a Boat in An Abandoned Fun House', 2006, 1, 6, 0.99, 181, 17.99, 'NC-17');
INSERT INTO public.film VALUES (752, 'Runner Madigan', 'A Thoughtful Documentary of a Crocodile And a Robot who must Outrace a Womanizer in The Outback', 2006, 1, 6, 0.99, 101, 27.99, 'NC-17');
INSERT INTO public.film VALUES (754, 'Rushmore Mermaid', 'A Boring Story of a Woman And a Moose who must Reach a Husband in A Shark Tank', 2006, 1, 6, 2.99, 150, 17.99, 'PG-13');
INSERT INTO public.film VALUES (755, 'Sabrina Midnight', 'A Emotional Story of a Squirrel And a Crocodile who must Succumb a Husband in The Sahara Desert', 2006, 1, 5, 4.99, 99, 11.99, 'PG');
INSERT INTO public.film VALUES (756, 'Saddle Antitrust', 'A Stunning Epistle of a Feminist And a A Shark who must Battle a Woman in An Abandoned Fun House', 2006, 1, 7, 2.99, 80, 10.99, 'PG-13');
INSERT INTO public.film VALUES (757, 'Sagebrush Clueless', 'A Insightful Story of a Lumberjack And a Hunter who must Kill a Boy in Ancient Japan', 2006, 1, 4, 2.99, 106, 28.99, 'G');
INSERT INTO public.film VALUES (758, 'Saints Bride', 'A Fateful Tale of a Technical Writer And a Composer who must Pursue a Explorer in The Gulf of Mexico', 2006, 1, 5, 2.99, 125, 11.99, 'G');
INSERT INTO public.film VALUES (759, 'Salute Apollo', 'A Awe-Inspiring Character Study of a Boy And a Feminist who must Sink a Crocodile in Ancient China', 2006, 1, 4, 2.99, 73, 29.99, 'R');
INSERT INTO public.film VALUES (760, 'Samurai Lion', 'A Fast-Paced Story of a Pioneer And a Astronaut who must Reach a Boat in A Baloon', 2006, 1, 5, 2.99, 110, 21.99, 'G');
INSERT INTO public.film VALUES (761, 'Santa Paris', 'A Emotional Documentary of a Moose And a Car who must Redeem a Mad Cow in A Baloon Factory', 2006, 1, 7, 2.99, 154, 23.99, 'PG');
INSERT INTO public.film VALUES (762, 'Sassy Packer', 'A Fast-Paced Documentary of a Dog And a Teacher who must Find a Moose in A Manhattan Penthouse', 2006, 1, 6, 0.99, 154, 29.99, 'G');
INSERT INTO public.film VALUES (763, 'Satisfaction Confidential', 'A Lacklusture Yarn of a Dentist And a Butler who must Meet a Secret Agent in Ancient China', 2006, 1, 3, 4.99, 75, 26.99, 'G');
INSERT INTO public.film VALUES (764, 'Saturday Lambs', 'A Thoughtful Reflection of a Mad Scientist And a Moose who must Kill a Husband in A Baloon', 2006, 1, 3, 4.99, 150, 28.99, 'G');
INSERT INTO public.film VALUES (765, 'Saturn Name', 'A Fateful Epistle of a Butler And a Boy who must Redeem a Teacher in Berlin', 2006, 1, 7, 4.99, 182, 18.99, 'R');
INSERT INTO public.film VALUES (766, 'Savannah Town', 'A Awe-Inspiring Tale of a Astronaut And a Database Administrator who must Chase a Secret Agent in The Gulf of Mexico', 2006, 1, 5, 0.99, 84, 25.99, 'PG-13');
INSERT INTO public.film VALUES (767, 'Scalawag Duck', 'A Fateful Reflection of a Car And a Teacher who must Confront a Waitress in A Monastery', 2006, 1, 6, 4.99, 183, 13.99, 'NC-17');
INSERT INTO public.film VALUES (768, 'Scarface Bang', 'A Emotional Yarn of a Teacher And a Girl who must Find a Teacher in A Baloon Factory', 2006, 1, 3, 4.99, 102, 11.99, 'PG-13');
INSERT INTO public.film VALUES (769, 'School Jacket', 'A Intrepid Yarn of a Monkey And a Boy who must Fight a Composer in A Manhattan Penthouse', 2006, 1, 5, 4.99, 151, 21.99, 'PG-13');
INSERT INTO public.film VALUES (770, 'Scissorhands Slums', 'A Awe-Inspiring Drama of a Girl And a Technical Writer who must Meet a Feminist in The Canadian Rockies', 2006, 1, 5, 2.99, 147, 13.99, 'G');
INSERT INTO public.film VALUES (788, 'Ship Wonderland', 'A Thrilling Saga of a Monkey And a Frisbee who must Escape a Explorer in The Outback', 2006, 1, 5, 2.99, 104, 15.99, 'R');
INSERT INTO public.film VALUES (771, 'Scorpion Apollo', 'A Awe-Inspiring Documentary of a Technical Writer And a Husband who must Meet a Monkey in An Abandoned Fun House', 2006, 1, 3, 4.99, 137, 23.99, 'NC-17');
INSERT INTO public.film VALUES (772, 'Sea Virgin', 'A Fast-Paced Documentary of a Technical Writer And a Pastry Chef who must Escape a Moose in A U-Boat', 2006, 1, 4, 2.99, 80, 24.99, 'PG');
INSERT INTO public.film VALUES (773, 'Seabiscuit Punk', 'A Insightful Saga of a Man And a Forensic Psychologist who must Discover a Mad Cow in A MySQL Convention', 2006, 1, 6, 2.99, 112, 28.99, 'NC-17');
INSERT INTO public.film VALUES (774, 'Searchers Wait', 'A Fast-Paced Tale of a Car And a Mad Scientist who must Kill a Womanizer in Ancient Japan', 2006, 1, 3, 2.99, 182, 22.99, 'NC-17');
INSERT INTO public.film VALUES (775, 'Seattle Expecations', 'A Insightful Reflection of a Crocodile And a Sumo Wrestler who must Meet a Technical Writer in The Sahara Desert', 2006, 1, 4, 4.99, 110, 18.99, 'PG-13');
INSERT INTO public.film VALUES (776, 'Secret Groundhog', 'A Astounding Story of a Cat And a Database Administrator who must Build a Technical Writer in New Orleans', 2006, 1, 6, 4.99, 90, 11.99, 'PG');
INSERT INTO public.film VALUES (777, 'Secretary Rouge', 'A Action-Packed Panorama of a Mad Cow And a Composer who must Discover a Robot in A Baloon Factory', 2006, 1, 5, 4.99, 158, 10.99, 'PG');
INSERT INTO public.film VALUES (778, 'Secrets Paradise', 'A Fateful Saga of a Cat And a Frisbee who must Kill a Girl in A Manhattan Penthouse', 2006, 1, 3, 4.99, 109, 24.99, 'G');
INSERT INTO public.film VALUES (779, 'Sense Greek', 'A Taut Saga of a Lumberjack And a Pastry Chef who must Escape a Sumo Wrestler in An Abandoned Fun House', 2006, 1, 4, 4.99, 54, 23.99, 'R');
INSERT INTO public.film VALUES (780, 'Sensibility Rear', 'A Emotional Tale of a Robot And a Sumo Wrestler who must Redeem a Pastry Chef in A Baloon Factory', 2006, 1, 7, 4.99, 98, 15.99, 'PG');
INSERT INTO public.film VALUES (781, 'Seven Swarm', 'A Unbelieveable Character Study of a Dog And a Mad Cow who must Kill a Monkey in Berlin', 2006, 1, 4, 4.99, 127, 15.99, 'R');
INSERT INTO public.film VALUES (782, 'Shakespeare Saddle', 'A Fast-Paced Panorama of a Lumberjack And a Database Administrator who must Defeat a Madman in A MySQL Convention', 2006, 1, 6, 2.99, 60, 26.99, 'PG-13');
INSERT INTO public.film VALUES (783, 'Shane Darkness', 'A Action-Packed Saga of a Moose And a Lumberjack who must Find a Woman in Berlin', 2006, 1, 5, 2.99, 93, 22.99, 'PG');
INSERT INTO public.film VALUES (784, 'Shanghai Tycoon', 'A Fast-Paced Character Study of a Crocodile And a Lumberjack who must Build a Husband in An Abandoned Fun House', 2006, 1, 7, 2.99, 47, 20.99, 'PG');
INSERT INTO public.film VALUES (785, 'Shawshank Bubble', 'A Lacklusture Story of a Moose And a Monkey who must Confront a Butler in An Abandoned Amusement Park', 2006, 1, 6, 4.99, 80, 20.99, 'PG');
INSERT INTO public.film VALUES (786, 'Shepherd Midsummer', 'A Thoughtful Drama of a Robot And a Womanizer who must Kill a Lumberjack in A Baloon', 2006, 1, 7, 0.99, 113, 14.99, 'R');
INSERT INTO public.film VALUES (787, 'Shining Roses', 'A Awe-Inspiring Character Study of a Astronaut And a Forensic Psychologist who must Challenge a Madman in Ancient India', 2006, 1, 4, 0.99, 125, 12.99, 'G');
INSERT INTO public.film VALUES (789, 'Shock Cabin', 'A Fateful Tale of a Mad Cow And a Crocodile who must Meet a Husband in New Orleans', 2006, 1, 7, 2.99, 79, 15.99, 'PG-13');
INSERT INTO public.film VALUES (790, 'Shootist Superfly', 'A Fast-Paced Story of a Crocodile And a A Shark who must Sink a Pioneer in Berlin', 2006, 1, 6, 0.99, 67, 22.99, 'PG-13');
INSERT INTO public.film VALUES (791, 'Show Lord', 'A Fanciful Saga of a Student And a Girl who must Find a Butler in Ancient Japan', 2006, 1, 3, 4.99, 167, 24.99, 'PG-13');
INSERT INTO public.film VALUES (792, 'Shrek License', 'A Fateful Yarn of a Secret Agent And a Feminist who must Find a Feminist in A Jet Boat', 2006, 1, 7, 2.99, 154, 15.99, 'PG-13');
INSERT INTO public.film VALUES (793, 'Shrunk Divine', 'A Fateful Character Study of a Waitress And a Technical Writer who must Battle a Hunter in A Baloon', 2006, 1, 6, 2.99, 139, 14.99, 'R');
INSERT INTO public.film VALUES (794, 'Side Ark', 'A Stunning Panorama of a Crocodile And a Womanizer who must Meet a Feminist in The Canadian Rockies', 2006, 1, 5, 0.99, 52, 28.99, 'G');
INSERT INTO public.film VALUES (795, 'Siege Madre', 'A Boring Tale of a Frisbee And a Crocodile who must Vanquish a Moose in An Abandoned Mine Shaft', 2006, 1, 7, 0.99, 111, 23.99, 'R');
INSERT INTO public.film VALUES (796, 'Sierra Divide', 'A Emotional Character Study of a Frisbee And a Mad Scientist who must Build a Madman in California', 2006, 1, 3, 0.99, 135, 12.99, 'NC-17');
INSERT INTO public.film VALUES (797, 'Silence Kane', 'A Emotional Drama of a Sumo Wrestler And a Dentist who must Confront a Sumo Wrestler in A Baloon', 2006, 1, 7, 0.99, 67, 23.99, 'R');
INSERT INTO public.film VALUES (798, 'Silverado Goldfinger', 'A Stunning Epistle of a Sumo Wrestler And a Man who must Challenge a Waitress in Ancient India', 2006, 1, 4, 4.99, 74, 11.99, 'PG');
INSERT INTO public.film VALUES (799, 'Simon North', 'A Thrilling Documentary of a Technical Writer And a A Shark who must Face a Pioneer in A Shark Tank', 2006, 1, 3, 0.99, 51, 26.99, 'NC-17');
INSERT INTO public.film VALUES (800, 'Sinners Atlantis', 'A Epic Display of a Dog And a Boat who must Succumb a Mad Scientist in An Abandoned Mine Shaft', 2006, 1, 7, 2.99, 126, 19.99, 'PG-13');
INSERT INTO public.film VALUES (801, 'Sister Freddy', 'A Stunning Saga of a Butler And a Woman who must Pursue a Explorer in Australia', 2006, 1, 5, 4.99, 152, 19.99, 'PG-13');
INSERT INTO public.film VALUES (802, 'Sky Miracle', 'A Epic Drama of a Mad Scientist And a Explorer who must Succumb a Waitress in An Abandoned Fun House', 2006, 1, 7, 2.99, 132, 15.99, 'PG');
INSERT INTO public.film VALUES (803, 'Slacker Liaisons', 'A Fast-Paced Tale of a A Shark And a Student who must Meet a Crocodile in Ancient China', 2006, 1, 7, 4.99, 179, 29.99, 'R');
INSERT INTO public.film VALUES (804, 'Sleeping Suspects', 'A Stunning Reflection of a Sumo Wrestler And a Explorer who must Sink a Frisbee in A MySQL Convention', 2006, 1, 7, 4.99, 129, 13.99, 'PG-13');
INSERT INTO public.film VALUES (805, 'Sleepless Monsoon', 'A Amazing Saga of a Moose And a Pastry Chef who must Escape a Butler in Australia', 2006, 1, 5, 4.99, 64, 12.99, 'G');
INSERT INTO public.film VALUES (806, 'Sleepy Japanese', 'A Emotional Epistle of a Moose And a Composer who must Fight a Technical Writer in The Outback', 2006, 1, 4, 2.99, 137, 25.99, 'PG');
INSERT INTO public.film VALUES (807, 'Sleuth Orient', 'A Fateful Character Study of a Husband And a Dog who must Find a Feminist in Ancient India', 2006, 1, 4, 0.99, 87, 25.99, 'NC-17');
INSERT INTO public.film VALUES (808, 'Sling Luke', 'A Intrepid Character Study of a Robot And a Monkey who must Reach a Secret Agent in An Abandoned Amusement Park', 2006, 1, 5, 0.99, 84, 10.99, 'R');
INSERT INTO public.film VALUES (809, 'Slipper Fidelity', 'A Taut Reflection of a Secret Agent And a Man who must Redeem a Explorer in A MySQL Convention', 2006, 1, 5, 0.99, 156, 14.99, 'PG-13');
INSERT INTO public.film VALUES (810, 'Slums Duck', 'A Amazing Character Study of a Teacher And a Database Administrator who must Defeat a Waitress in A Jet Boat', 2006, 1, 5, 0.99, 147, 21.99, 'PG');
INSERT INTO public.film VALUES (811, 'Smile Earring', 'A Intrepid Drama of a Teacher And a Butler who must Build a Pastry Chef in Berlin', 2006, 1, 4, 2.99, 60, 29.99, 'G');
INSERT INTO public.film VALUES (812, 'Smoking Barbarella', 'A Lacklusture Saga of a Mad Cow And a Mad Scientist who must Sink a Cat in A MySQL Convention', 2006, 1, 7, 0.99, 50, 13.99, 'PG-13');
INSERT INTO public.film VALUES (813, 'Smoochy Control', 'A Thrilling Documentary of a Husband And a Feminist who must Face a Mad Scientist in Ancient China', 2006, 1, 7, 0.99, 184, 18.99, 'R');
INSERT INTO public.film VALUES (814, 'Snatch Slipper', 'A Insightful Panorama of a Woman And a Feminist who must Defeat a Forensic Psychologist in Berlin', 2006, 1, 6, 4.99, 110, 15.99, 'PG');
INSERT INTO public.film VALUES (815, 'Snatchers Montezuma', 'A Boring Epistle of a Sumo Wrestler And a Woman who must Escape a Man in The Canadian Rockies', 2006, 1, 4, 2.99, 74, 14.99, 'PG-13');
INSERT INTO public.film VALUES (816, 'Snowman Rollercoaster', 'A Fateful Display of a Lumberjack And a Girl who must Succumb a Mad Cow in A Manhattan Penthouse', 2006, 1, 3, 0.99, 62, 27.99, 'G');
INSERT INTO public.film VALUES (817, 'Soldiers Evolution', 'A Lacklusture Panorama of a A Shark And a Pioneer who must Confront a Student in The First Manned Space Station', 2006, 1, 7, 4.99, 185, 27.99, 'R');
INSERT INTO public.film VALUES (818, 'Something Duck', 'A Boring Character Study of a Car And a Husband who must Outgun a Frisbee in The First Manned Space Station', 2006, 1, 4, 4.99, 180, 17.99, 'NC-17');
INSERT INTO public.film VALUES (819, 'Song Hedwig', 'A Amazing Documentary of a Man And a Husband who must Confront a Squirrel in A MySQL Convention', 2006, 1, 3, 0.99, 165, 29.99, 'PG-13');
INSERT INTO public.film VALUES (820, 'Sons Interview', 'A Taut Character Study of a Explorer And a Mad Cow who must Battle a Hunter in Ancient China', 2006, 1, 3, 2.99, 184, 11.99, 'NC-17');
INSERT INTO public.film VALUES (821, 'Sorority Queen', 'A Fast-Paced Display of a Squirrel And a Composer who must Fight a Forensic Psychologist in A Jet Boat', 2006, 1, 6, 0.99, 184, 17.99, 'NC-17');
INSERT INTO public.film VALUES (822, 'Soup Wisdom', 'A Fast-Paced Display of a Robot And a Butler who must Defeat a Butler in A MySQL Convention', 2006, 1, 6, 0.99, 169, 12.99, 'R');
INSERT INTO public.film VALUES (823, 'South Wait', 'A Amazing Documentary of a Car And a Robot who must Escape a Lumberjack in An Abandoned Amusement Park', 2006, 1, 4, 2.99, 143, 21.99, 'R');
INSERT INTO public.film VALUES (824, 'Spartacus Cheaper', 'A Thrilling Panorama of a Pastry Chef And a Secret Agent who must Overcome a Student in A Manhattan Penthouse', 2006, 1, 4, 4.99, 52, 19.99, 'NC-17');
INSERT INTO public.film VALUES (825, 'Speakeasy Date', 'A Lacklusture Drama of a Forensic Psychologist And a Car who must Redeem a Man in A Manhattan Penthouse', 2006, 1, 6, 2.99, 165, 22.99, 'PG-13');
INSERT INTO public.film VALUES (826, 'Speed Suit', 'A Brilliant Display of a Frisbee And a Mad Scientist who must Succumb a Robot in Ancient China', 2006, 1, 7, 4.99, 124, 19.99, 'PG-13');
INSERT INTO public.film VALUES (827, 'Spice Sorority', 'A Fateful Display of a Pioneer And a Hunter who must Defeat a Husband in An Abandoned Mine Shaft', 2006, 1, 5, 4.99, 141, 22.99, 'NC-17');
INSERT INTO public.film VALUES (828, 'Spiking Element', 'A Lacklusture Epistle of a Dentist And a Technical Writer who must Find a Dog in A Monastery', 2006, 1, 7, 2.99, 79, 12.99, 'G');
INSERT INTO public.film VALUES (829, 'Spinal Rocky', 'A Lacklusture Epistle of a Sumo Wrestler And a Squirrel who must Defeat a Explorer in California', 2006, 1, 7, 2.99, 138, 12.99, 'PG-13');
INSERT INTO public.film VALUES (830, 'Spirit Flintstones', 'A Brilliant Yarn of a Cat And a Car who must Confront a Explorer in Ancient Japan', 2006, 1, 7, 0.99, 149, 23.99, 'R');
INSERT INTO public.film VALUES (831, 'Spirited Casualties', 'A Taut Story of a Waitress And a Man who must Face a Car in A Baloon Factory', 2006, 1, 5, 0.99, 138, 20.99, 'PG-13');
INSERT INTO public.film VALUES (832, 'Splash Gump', 'A Taut Saga of a Crocodile And a Boat who must Conquer a Hunter in A Shark Tank', 2006, 1, 5, 0.99, 175, 16.99, 'PG');
INSERT INTO public.film VALUES (833, 'Splendor Patton', 'A Taut Story of a Dog And a Explorer who must Find a Astronaut in Berlin', 2006, 1, 5, 0.99, 134, 20.99, 'R');
INSERT INTO public.film VALUES (834, 'Spoilers Hellfighters', 'A Fanciful Story of a Technical Writer And a Squirrel who must Defeat a Dog in The Gulf of Mexico', 2006, 1, 4, 0.99, 151, 26.99, 'G');
INSERT INTO public.film VALUES (835, 'Spy Mile', 'A Thrilling Documentary of a Feminist And a Feminist who must Confront a Feminist in A Baloon', 2006, 1, 6, 2.99, 112, 13.99, 'PG-13');
INSERT INTO public.film VALUES (836, 'Squad Fish', 'A Fast-Paced Display of a Pastry Chef And a Dog who must Kill a Teacher in Berlin', 2006, 1, 3, 2.99, 136, 14.99, 'PG');
INSERT INTO public.film VALUES (837, 'Stage World', 'A Lacklusture Panorama of a Woman And a Frisbee who must Chase a Crocodile in A Jet Boat', 2006, 1, 4, 2.99, 85, 19.99, 'PG');
INSERT INTO public.film VALUES (838, 'Stagecoach Armageddon', 'A Touching Display of a Pioneer And a Butler who must Chase a Car in California', 2006, 1, 5, 4.99, 112, 25.99, 'R');
INSERT INTO public.film VALUES (839, 'Stallion Sundance', 'A Fast-Paced Tale of a Car And a Dog who must Outgun a A Shark in Australia', 2006, 1, 5, 0.99, 130, 23.99, 'PG-13');
INSERT INTO public.film VALUES (840, 'Stampede Disturbing', 'A Unbelieveable Tale of a Woman And a Lumberjack who must Fight a Frisbee in A U-Boat', 2006, 1, 5, 0.99, 75, 26.99, 'R');
INSERT INTO public.film VALUES (841, 'Star Operation', 'A Insightful Character Study of a Girl And a Car who must Pursue a Mad Cow in A Shark Tank', 2006, 1, 5, 2.99, 181, 9.99, 'PG');
INSERT INTO public.film VALUES (842, 'State Wasteland', 'A Beautiful Display of a Cat And a Pastry Chef who must Outrace a Mad Cow in A Jet Boat', 2006, 1, 4, 2.99, 113, 13.99, 'NC-17');
INSERT INTO public.film VALUES (843, 'Steel Santa', 'A Fast-Paced Yarn of a Composer And a Frisbee who must Face a Moose in Nigeria', 2006, 1, 4, 4.99, 143, 15.99, 'NC-17');
INSERT INTO public.film VALUES (844, 'Steers Armageddon', 'A Stunning Character Study of a Car And a Girl who must Succumb a Car in A MySQL Convention', 2006, 1, 6, 4.99, 140, 16.99, 'PG');
INSERT INTO public.film VALUES (845, 'Stepmom Dream', 'A Touching Epistle of a Crocodile And a Teacher who must Build a Forensic Psychologist in A MySQL Convention', 2006, 1, 7, 4.99, 48, 9.99, 'NC-17');
INSERT INTO public.film VALUES (846, 'Sting Personal', 'A Fanciful Drama of a Frisbee And a Dog who must Fight a Madman in A Jet Boat', 2006, 1, 3, 4.99, 93, 9.99, 'NC-17');
INSERT INTO public.film VALUES (847, 'Stock Glass', 'A Boring Epistle of a Crocodile And a Lumberjack who must Outgun a Moose in Ancient China', 2006, 1, 7, 2.99, 160, 10.99, 'PG');
INSERT INTO public.film VALUES (848, 'Stone Fire', 'A Intrepid Drama of a Astronaut And a Crocodile who must Find a Boat in Soviet Georgia', 2006, 1, 3, 0.99, 94, 19.99, 'G');
INSERT INTO public.film VALUES (849, 'Storm Happiness', 'A Insightful Drama of a Feminist And a A Shark who must Vanquish a Boat in A Shark Tank', 2006, 1, 6, 0.99, 57, 28.99, 'NC-17');
INSERT INTO public.film VALUES (850, 'Story Side', 'A Lacklusture Saga of a Boy And a Cat who must Sink a Dentist in An Abandoned Mine Shaft', 2006, 1, 7, 0.99, 163, 27.99, 'R');
INSERT INTO public.film VALUES (851, 'Straight Hours', 'A Boring Panorama of a Secret Agent And a Girl who must Sink a Waitress in The Outback', 2006, 1, 3, 0.99, 151, 19.99, 'R');
INSERT INTO public.film VALUES (852, 'Strangelove Desire', 'A Awe-Inspiring Panorama of a Lumberjack And a Waitress who must Defeat a Crocodile in An Abandoned Amusement Park', 2006, 1, 4, 0.99, 103, 27.99, 'NC-17');
INSERT INTO public.film VALUES (853, 'Stranger Strangers', 'A Awe-Inspiring Yarn of a Womanizer And a Explorer who must Fight a Woman in The First Manned Space Station', 2006, 1, 3, 4.99, 139, 12.99, 'G');
INSERT INTO public.film VALUES (890, 'Tights Dawn', 'A Thrilling Epistle of a Boat And a Secret Agent who must Face a Boy in A Baloon', 2006, 1, 5, 0.99, 172, 14.99, 'R');
INSERT INTO public.film VALUES (854, 'Strangers Graffiti', 'A Brilliant Character Study of a Secret Agent And a Man who must Find a Cat in The Gulf of Mexico', 2006, 1, 4, 4.99, 119, 22.99, 'R');
INSERT INTO public.film VALUES (855, 'Streak Ridgemont', 'A Astounding Character Study of a Hunter And a Waitress who must Sink a Man in New Orleans', 2006, 1, 7, 0.99, 132, 28.99, 'PG-13');
INSERT INTO public.film VALUES (856, 'Streetcar Intentions', 'A Insightful Character Study of a Waitress And a Crocodile who must Sink a Waitress in The Gulf of Mexico', 2006, 1, 5, 4.99, 73, 11.99, 'R');
INSERT INTO public.film VALUES (857, 'Strictly Scarface', 'A Touching Reflection of a Crocodile And a Dog who must Chase a Hunter in An Abandoned Fun House', 2006, 1, 3, 2.99, 144, 24.99, 'PG-13');
INSERT INTO public.film VALUES (858, 'Submarine Bed', 'A Amazing Display of a Car And a Monkey who must Fight a Teacher in Soviet Georgia', 2006, 1, 5, 4.99, 127, 21.99, 'R');
INSERT INTO public.film VALUES (859, 'Sugar Wonka', 'A Touching Story of a Dentist And a Database Administrator who must Conquer a Astronaut in An Abandoned Amusement Park', 2006, 1, 3, 4.99, 114, 20.99, 'PG');
INSERT INTO public.film VALUES (860, 'Suicides Silence', 'A Emotional Character Study of a Car And a Girl who must Face a Composer in A U-Boat', 2006, 1, 4, 4.99, 93, 13.99, 'G');
INSERT INTO public.film VALUES (861, 'Suit Walls', 'A Touching Panorama of a Lumberjack And a Frisbee who must Build a Dog in Australia', 2006, 1, 3, 4.99, 111, 12.99, 'R');
INSERT INTO public.film VALUES (862, 'Summer Scarface', 'A Emotional Panorama of a Lumberjack And a Hunter who must Meet a Girl in A Shark Tank', 2006, 1, 5, 0.99, 53, 25.99, 'G');
INSERT INTO public.film VALUES (863, 'Sun Confessions', 'A Beautiful Display of a Mad Cow And a Dog who must Redeem a Waitress in An Abandoned Amusement Park', 2006, 1, 5, 0.99, 141, 9.99, 'R');
INSERT INTO public.film VALUES (864, 'Sundance Invasion', 'A Epic Drama of a Lumberjack And a Explorer who must Confront a Hunter in A Baloon Factory', 2006, 1, 5, 0.99, 92, 21.99, 'NC-17');
INSERT INTO public.film VALUES (865, 'Sunrise League', 'A Beautiful Epistle of a Madman And a Butler who must Face a Crocodile in A Manhattan Penthouse', 2006, 1, 3, 4.99, 135, 19.99, 'PG-13');
INSERT INTO public.film VALUES (866, 'Sunset Racer', 'A Awe-Inspiring Reflection of a Astronaut And a A Shark who must Defeat a Forensic Psychologist in California', 2006, 1, 6, 0.99, 48, 28.99, 'NC-17');
INSERT INTO public.film VALUES (867, 'Super Wyoming', 'A Action-Packed Saga of a Pastry Chef And a Explorer who must Discover a A Shark in The Outback', 2006, 1, 5, 4.99, 58, 10.99, 'PG');
INSERT INTO public.film VALUES (868, 'Superfly Trip', 'A Beautiful Saga of a Lumberjack And a Teacher who must Build a Technical Writer in An Abandoned Fun House', 2006, 1, 5, 0.99, 114, 27.99, 'PG');
INSERT INTO public.film VALUES (869, 'Suspects Quills', 'A Emotional Epistle of a Pioneer And a Crocodile who must Battle a Man in A Manhattan Penthouse', 2006, 1, 4, 2.99, 47, 22.99, 'PG');
INSERT INTO public.film VALUES (870, 'Swarm Gold', 'A Insightful Panorama of a Crocodile And a Boat who must Conquer a Sumo Wrestler in A MySQL Convention', 2006, 1, 4, 0.99, 123, 12.99, 'PG-13');
INSERT INTO public.film VALUES (871, 'Sweden Shining', 'A Taut Documentary of a Car And a Robot who must Conquer a Boy in The Canadian Rockies', 2006, 1, 6, 4.99, 176, 19.99, 'PG');
INSERT INTO public.film VALUES (891, 'Timberland Sky', 'A Boring Display of a Man And a Dog who must Redeem a Girl in A U-Boat', 2006, 1, 3, 0.99, 69, 13.99, 'G');
INSERT INTO public.film VALUES (872, 'Sweet Brotherhood', 'A Unbelieveable Epistle of a Sumo Wrestler And a Hunter who must Chase a Forensic Psychologist in A Baloon', 2006, 1, 3, 2.99, 185, 27.99, 'R');
INSERT INTO public.film VALUES (873, 'Sweethearts Suspects', 'A Brilliant Character Study of a Frisbee And a Sumo Wrestler who must Confront a Woman in The Gulf of Mexico', 2006, 1, 3, 0.99, 108, 13.99, 'G');
INSERT INTO public.film VALUES (874, 'Tadpole Park', 'A Beautiful Tale of a Frisbee And a Moose who must Vanquish a Dog in An Abandoned Amusement Park', 2006, 1, 6, 2.99, 155, 13.99, 'PG');
INSERT INTO public.film VALUES (875, 'Talented Homicide', 'A Lacklusture Panorama of a Dentist And a Forensic Psychologist who must Outrace a Pioneer in A U-Boat', 2006, 1, 6, 0.99, 173, 9.99, 'PG');
INSERT INTO public.film VALUES (876, 'Tarzan Videotape', 'A Fast-Paced Display of a Lumberjack And a Mad Scientist who must Succumb a Sumo Wrestler in The Sahara Desert', 2006, 1, 3, 2.99, 91, 11.99, 'PG-13');
INSERT INTO public.film VALUES (877, 'Taxi Kick', 'A Amazing Epistle of a Girl And a Woman who must Outrace a Waitress in Soviet Georgia', 2006, 1, 4, 0.99, 64, 23.99, 'PG-13');
INSERT INTO public.film VALUES (878, 'Teen Apollo', 'A Awe-Inspiring Drama of a Dog And a Man who must Escape a Robot in A Shark Tank', 2006, 1, 3, 4.99, 74, 25.99, 'G');
INSERT INTO public.film VALUES (879, 'Telegraph Voyage', 'A Fateful Yarn of a Husband And a Dog who must Battle a Waitress in A Jet Boat', 2006, 1, 3, 4.99, 148, 20.99, 'PG');
INSERT INTO public.film VALUES (880, 'Telemark Heartbreakers', 'A Action-Packed Panorama of a Technical Writer And a Man who must Build a Forensic Psychologist in A Manhattan Penthouse', 2006, 1, 6, 2.99, 152, 9.99, 'PG-13');
INSERT INTO public.film VALUES (881, 'Temple Attraction', 'A Action-Packed Saga of a Forensic Psychologist And a Woman who must Battle a Womanizer in Soviet Georgia', 2006, 1, 5, 4.99, 71, 13.99, 'PG');
INSERT INTO public.film VALUES (882, 'Tenenbaums Command', 'A Taut Display of a Pioneer And a Man who must Reach a Girl in The Gulf of Mexico', 2006, 1, 4, 0.99, 99, 24.99, 'PG-13');
INSERT INTO public.film VALUES (883, 'Tequila Past', 'A Action-Packed Panorama of a Mad Scientist And a Robot who must Challenge a Student in Nigeria', 2006, 1, 6, 4.99, 53, 17.99, 'PG');
INSERT INTO public.film VALUES (884, 'Terminator Club', 'A Touching Story of a Crocodile And a Girl who must Sink a Man in The Gulf of Mexico', 2006, 1, 5, 4.99, 88, 11.99, 'R');
INSERT INTO public.film VALUES (885, 'Texas Watch', 'A Awe-Inspiring Yarn of a Student And a Teacher who must Fight a Teacher in An Abandoned Amusement Park', 2006, 1, 7, 0.99, 179, 22.99, 'NC-17');
INSERT INTO public.film VALUES (886, 'Theory Mermaid', 'A Fateful Yarn of a Composer And a Monkey who must Vanquish a Womanizer in The First Manned Space Station', 2006, 1, 5, 0.99, 184, 9.99, 'PG-13');
INSERT INTO public.film VALUES (965, 'Watership Frontier', 'A Emotional Yarn of a Boat And a Crocodile who must Meet a Moose in Soviet Georgia', 2006, 1, 6, 0.99, 112, 28.99, 'G');
INSERT INTO public.film VALUES (887, 'Thief Pelican', 'A Touching Documentary of a Madman And a Mad Scientist who must Outrace a Feminist in An Abandoned Mine Shaft', 2006, 1, 5, 4.99, 135, 28.99, 'PG-13');
INSERT INTO public.film VALUES (888, 'Thin Sagebrush', 'A Emotional Drama of a Husband And a Lumberjack who must Build a Cat in Ancient India', 2006, 1, 5, 4.99, 53, 9.99, 'PG-13');
INSERT INTO public.film VALUES (889, 'Ties Hunger', 'A Insightful Saga of a Astronaut And a Explorer who must Pursue a Mad Scientist in A U-Boat', 2006, 1, 3, 4.99, 111, 28.99, 'R');
INSERT INTO public.film VALUES (892, 'Titanic Boondock', 'A Brilliant Reflection of a Feminist And a Dog who must Fight a Boy in A Baloon Factory', 2006, 1, 3, 4.99, 104, 18.99, 'R');
INSERT INTO public.film VALUES (893, 'Titans Jerk', 'A Unbelieveable Panorama of a Feminist And a Sumo Wrestler who must Challenge a Technical Writer in Ancient China', 2006, 1, 4, 4.99, 91, 11.99, 'PG');
INSERT INTO public.film VALUES (894, 'Tomatoes Hellfighters', 'A Thoughtful Epistle of a Madman And a Astronaut who must Overcome a Monkey in A Shark Tank', 2006, 1, 6, 0.99, 68, 23.99, 'PG');
INSERT INTO public.film VALUES (895, 'Tomorrow Hustler', 'A Thoughtful Story of a Moose And a Husband who must Face a Secret Agent in The Sahara Desert', 2006, 1, 3, 2.99, 142, 21.99, 'R');
INSERT INTO public.film VALUES (896, 'Tootsie Pilot', 'A Awe-Inspiring Documentary of a Womanizer And a Pastry Chef who must Kill a Lumberjack in Berlin', 2006, 1, 3, 0.99, 157, 10.99, 'PG');
INSERT INTO public.film VALUES (897, 'Torque Bound', 'A Emotional Display of a Crocodile And a Husband who must Reach a Man in Ancient Japan', 2006, 1, 3, 4.99, 179, 27.99, 'G');
INSERT INTO public.film VALUES (898, 'Tourist Pelican', 'A Boring Story of a Butler And a Astronaut who must Outrace a Pioneer in Australia', 2006, 1, 4, 4.99, 152, 18.99, 'PG-13');
INSERT INTO public.film VALUES (899, 'Towers Hurricane', 'A Fateful Display of a Monkey And a Car who must Sink a Husband in A MySQL Convention', 2006, 1, 7, 0.99, 144, 14.99, 'NC-17');
INSERT INTO public.film VALUES (900, 'Town Ark', 'A Awe-Inspiring Documentary of a Moose And a Madman who must Meet a Dog in An Abandoned Mine Shaft', 2006, 1, 6, 2.99, 136, 17.99, 'R');
INSERT INTO public.film VALUES (901, 'Tracy Cider', 'A Touching Reflection of a Database Administrator And a Madman who must Build a Lumberjack in Nigeria', 2006, 1, 3, 0.99, 142, 29.99, 'G');
INSERT INTO public.film VALUES (902, 'Trading Pinocchio', 'A Emotional Character Study of a Student And a Explorer who must Discover a Frisbee in The First Manned Space Station', 2006, 1, 6, 4.99, 170, 22.99, 'PG');
INSERT INTO public.film VALUES (903, 'Traffic Hobbit', 'A Amazing Epistle of a Squirrel And a Lumberjack who must Succumb a Database Administrator in A U-Boat', 2006, 1, 5, 4.99, 139, 13.99, 'G');
INSERT INTO public.film VALUES (904, 'Train Bunch', 'A Thrilling Character Study of a Robot And a Squirrel who must Face a Dog in Ancient India', 2006, 1, 3, 4.99, 71, 26.99, 'R');
INSERT INTO public.film VALUES (905, 'Trainspotting Strangers', 'A Fast-Paced Drama of a Pioneer And a Mad Cow who must Challenge a Madman in Ancient Japan', 2006, 1, 7, 4.99, 132, 10.99, 'PG-13');
INSERT INTO public.film VALUES (906, 'Tramp Others', 'A Brilliant Display of a Composer And a Cat who must Succumb a A Shark in Ancient India', 2006, 1, 4, 0.99, 171, 27.99, 'PG');
INSERT INTO public.film VALUES (907, 'Translation Summer', 'A Touching Reflection of a Man And a Monkey who must Pursue a Womanizer in A MySQL Convention', 2006, 1, 4, 0.99, 168, 10.99, 'PG-13');
INSERT INTO public.film VALUES (908, 'Trap Guys', 'A Unbelieveable Story of a Boy And a Mad Cow who must Challenge a Database Administrator in The Sahara Desert', 2006, 1, 3, 4.99, 110, 11.99, 'G');
INSERT INTO public.film VALUES (909, 'Treasure Command', 'A Emotional Saga of a Car And a Madman who must Discover a Pioneer in California', 2006, 1, 3, 0.99, 102, 28.99, 'PG-13');
INSERT INTO public.film VALUES (910, 'Treatment Jekyll', 'A Boring Story of a Teacher And a Student who must Outgun a Cat in An Abandoned Mine Shaft', 2006, 1, 3, 0.99, 87, 19.99, 'PG');
INSERT INTO public.film VALUES (911, 'Trip Newton', 'A Fanciful Character Study of a Lumberjack And a Car who must Discover a Cat in An Abandoned Amusement Park', 2006, 1, 7, 4.99, 64, 14.99, 'PG-13');
INSERT INTO public.film VALUES (912, 'Trojan Tomorrow', 'A Astounding Panorama of a Husband And a Sumo Wrestler who must Pursue a Boat in Ancient India', 2006, 1, 3, 2.99, 52, 9.99, 'PG');
INSERT INTO public.film VALUES (913, 'Troopers Metal', 'A Fanciful Drama of a Monkey And a Feminist who must Sink a Man in Berlin', 2006, 1, 3, 0.99, 115, 20.99, 'R');
INSERT INTO public.film VALUES (914, 'Trouble Date', 'A Lacklusture Panorama of a Forensic Psychologist And a Woman who must Kill a Explorer in Ancient Japan', 2006, 1, 6, 2.99, 61, 13.99, 'PG');
INSERT INTO public.film VALUES (915, 'Truman Crazy', 'A Thrilling Epistle of a Moose And a Boy who must Meet a Database Administrator in A Monastery', 2006, 1, 7, 4.99, 92, 9.99, 'G');
INSERT INTO public.film VALUES (916, 'Turn Star', 'A Stunning Tale of a Man And a Monkey who must Chase a Student in New Orleans', 2006, 1, 3, 2.99, 80, 10.99, 'G');
INSERT INTO public.film VALUES (917, 'Tuxedo Mile', 'A Boring Drama of a Man And a Forensic Psychologist who must Face a Frisbee in Ancient India', 2006, 1, 3, 2.99, 152, 24.99, 'R');
INSERT INTO public.film VALUES (918, 'Twisted Pirates', 'A Touching Display of a Frisbee And a Boat who must Kill a Girl in A MySQL Convention', 2006, 1, 4, 4.99, 152, 23.99, 'PG');
INSERT INTO public.film VALUES (919, 'Tycoon Gathering', 'A Emotional Display of a Husband And a A Shark who must Succumb a Madman in A Manhattan Penthouse', 2006, 1, 3, 4.99, 82, 17.99, 'G');
INSERT INTO public.film VALUES (920, 'Unbreakable Karate', 'A Amazing Character Study of a Robot And a Student who must Chase a Robot in Australia', 2006, 1, 3, 0.99, 62, 16.99, 'G');
INSERT INTO public.film VALUES (921, 'Uncut Suicides', 'A Intrepid Yarn of a Explorer And a Pastry Chef who must Pursue a Mad Cow in A U-Boat', 2006, 1, 7, 2.99, 172, 29.99, 'PG-13');
INSERT INTO public.film VALUES (922, 'Undefeated Dalmations', 'A Unbelieveable Display of a Crocodile And a Feminist who must Overcome a Moose in An Abandoned Amusement Park', 2006, 1, 7, 4.99, 107, 22.99, 'PG-13');
INSERT INTO public.film VALUES (923, 'Unfaithful Kill', 'A Taut Documentary of a Waitress And a Mad Scientist who must Battle a Technical Writer in New Orleans', 2006, 1, 7, 2.99, 78, 12.99, 'R');
INSERT INTO public.film VALUES (924, 'Unforgiven Zoolander', 'A Taut Epistle of a Monkey And a Sumo Wrestler who must Vanquish a A Shark in A Baloon Factory', 2006, 1, 7, 0.99, 129, 15.99, 'PG');
INSERT INTO public.film VALUES (925, 'United Pilot', 'A Fast-Paced Reflection of a Cat And a Mad Cow who must Fight a Car in The Sahara Desert', 2006, 1, 3, 0.99, 164, 27.99, 'R');
INSERT INTO public.film VALUES (926, 'Untouchables Sunrise', 'A Amazing Documentary of a Woman And a Astronaut who must Outrace a Teacher in An Abandoned Fun House', 2006, 1, 5, 2.99, 120, 11.99, 'NC-17');
INSERT INTO public.film VALUES (928, 'Uptown Young', 'A Fateful Documentary of a Dog And a Hunter who must Pursue a Teacher in An Abandoned Amusement Park', 2006, 1, 5, 2.99, 84, 16.99, 'PG');
INSERT INTO public.film VALUES (929, 'Usual Untouchables', 'A Touching Display of a Explorer And a Lumberjack who must Fight a Forensic Psychologist in A Shark Tank', 2006, 1, 5, 4.99, 128, 21.99, 'PG-13');
INSERT INTO public.film VALUES (930, 'Vacation Boondock', 'A Fanciful Character Study of a Secret Agent And a Mad Scientist who must Reach a Teacher in Australia', 2006, 1, 4, 2.99, 145, 23.99, 'R');
INSERT INTO public.film VALUES (931, 'Valentine Vanishing', 'A Thrilling Display of a Husband And a Butler who must Reach a Pastry Chef in California', 2006, 1, 7, 0.99, 48, 9.99, 'PG-13');
INSERT INTO public.film VALUES (932, 'Valley Packer', 'A Astounding Documentary of a Astronaut And a Boy who must Outrace a Sumo Wrestler in Berlin', 2006, 1, 3, 0.99, 73, 21.99, 'G');
INSERT INTO public.film VALUES (933, 'Vampire Whale', 'A Epic Story of a Lumberjack And a Monkey who must Confront a Pioneer in A MySQL Convention', 2006, 1, 4, 4.99, 126, 11.99, 'NC-17');
INSERT INTO public.film VALUES (934, 'Vanilla Day', 'A Fast-Paced Saga of a Girl And a Forensic Psychologist who must Redeem a Girl in Nigeria', 2006, 1, 7, 4.99, 122, 20.99, 'NC-17');
INSERT INTO public.film VALUES (935, 'Vanished Garden', 'A Intrepid Character Study of a Squirrel And a A Shark who must Kill a Lumberjack in California', 2006, 1, 5, 0.99, 142, 17.99, 'R');
INSERT INTO public.film VALUES (936, 'Vanishing Rocky', 'A Brilliant Reflection of a Man And a Woman who must Conquer a Pioneer in A MySQL Convention', 2006, 1, 3, 2.99, 123, 21.99, 'NC-17');
INSERT INTO public.film VALUES (937, 'Varsity Trip', 'A Action-Packed Character Study of a Astronaut And a Explorer who must Reach a Monkey in A MySQL Convention', 2006, 1, 7, 2.99, 85, 14.99, 'NC-17');
INSERT INTO public.film VALUES (938, 'Velvet Terminator', 'A Lacklusture Tale of a Pastry Chef And a Technical Writer who must Confront a Crocodile in An Abandoned Amusement Park', 2006, 1, 3, 4.99, 173, 14.99, 'R');
INSERT INTO public.film VALUES (939, 'Vertigo Northwest', 'A Unbelieveable Display of a Mad Scientist And a Mad Scientist who must Outgun a Mad Cow in Ancient Japan', 2006, 1, 4, 2.99, 90, 17.99, 'R');
INSERT INTO public.film VALUES (940, 'Victory Academy', 'A Insightful Epistle of a Mad Scientist And a Explorer who must Challenge a Cat in The Sahara Desert', 2006, 1, 6, 0.99, 64, 19.99, 'PG-13');
INSERT INTO public.film VALUES (941, 'Videotape Arsenic', 'A Lacklusture Display of a Girl And a Astronaut who must Succumb a Student in Australia', 2006, 1, 4, 4.99, 145, 10.99, 'NC-17');
INSERT INTO public.film VALUES (942, 'Vietnam Smoochy', 'A Lacklusture Display of a Butler And a Man who must Sink a Explorer in Soviet Georgia', 2006, 1, 7, 0.99, 174, 27.99, 'PG-13');
INSERT INTO public.film VALUES (943, 'Villain Desperate', 'A Boring Yarn of a Pioneer And a Feminist who must Redeem a Cat in An Abandoned Amusement Park', 2006, 1, 4, 4.99, 76, 27.99, 'PG-13');
INSERT INTO public.film VALUES (944, 'Virgin Daisy', 'A Awe-Inspiring Documentary of a Robot And a Mad Scientist who must Reach a Database Administrator in A Shark Tank', 2006, 1, 6, 4.99, 179, 29.99, 'PG-13');
INSERT INTO public.film VALUES (945, 'Virginian Pluto', 'A Emotional Panorama of a Dentist And a Crocodile who must Meet a Boy in Berlin', 2006, 1, 5, 0.99, 164, 22.99, 'R');
INSERT INTO public.film VALUES (946, 'Virtual Spoilers', 'A Fateful Tale of a Database Administrator And a Squirrel who must Discover a Student in Soviet Georgia', 2006, 1, 3, 4.99, 144, 14.99, 'NC-17');
INSERT INTO public.film VALUES (947, 'Vision Torque', 'A Thoughtful Documentary of a Dog And a Man who must Sink a Man in A Shark Tank', 2006, 1, 5, 0.99, 59, 16.99, 'PG-13');
INSERT INTO public.film VALUES (948, 'Voice Peach', 'A Amazing Panorama of a Pioneer And a Student who must Overcome a Mad Scientist in A Manhattan Penthouse', 2006, 1, 6, 0.99, 139, 22.99, 'PG-13');
INSERT INTO public.film VALUES (949, 'Volcano Texas', 'A Awe-Inspiring Yarn of a Hunter And a Feminist who must Challenge a Dentist in The Outback', 2006, 1, 6, 0.99, 157, 27.99, 'NC-17');
INSERT INTO public.film VALUES (950, 'Volume House', 'A Boring Tale of a Dog And a Woman who must Meet a Dentist in California', 2006, 1, 7, 4.99, 132, 12.99, 'PG');
INSERT INTO public.film VALUES (951, 'Voyage Legally', 'A Epic Tale of a Squirrel And a Hunter who must Conquer a Boy in An Abandoned Mine Shaft', 2006, 1, 6, 0.99, 78, 28.99, 'PG-13');
INSERT INTO public.film VALUES (952, 'Wagon Jaws', 'A Intrepid Drama of a Moose And a Boat who must Kill a Explorer in A Manhattan Penthouse', 2006, 1, 7, 2.99, 152, 17.99, 'PG');
INSERT INTO public.film VALUES (953, 'Wait Cider', 'A Intrepid Epistle of a Woman And a Forensic Psychologist who must Succumb a Astronaut in A Manhattan Penthouse', 2006, 1, 3, 0.99, 112, 9.99, 'PG-13');
INSERT INTO public.film VALUES (954, 'Wake Jaws', 'A Beautiful Saga of a Feminist And a Composer who must Challenge a Moose in Berlin', 2006, 1, 7, 4.99, 73, 18.99, 'G');
INSERT INTO public.film VALUES (955, 'Walls Artist', 'A Insightful Panorama of a Teacher And a Teacher who must Overcome a Mad Cow in An Abandoned Fun House', 2006, 1, 7, 4.99, 135, 19.99, 'PG');
INSERT INTO public.film VALUES (956, 'Wanda Chamber', 'A Insightful Drama of a A Shark And a Pioneer who must Find a Womanizer in The Outback', 2006, 1, 7, 4.99, 107, 23.99, 'PG-13');
INSERT INTO public.film VALUES (957, 'War Notting', 'A Boring Drama of a Teacher And a Sumo Wrestler who must Challenge a Secret Agent in The Canadian Rockies', 2006, 1, 7, 4.99, 80, 26.99, 'G');
INSERT INTO public.film VALUES (958, 'Wardrobe Phantom', 'A Action-Packed Display of a Mad Cow And a Astronaut who must Kill a Car in Ancient India', 2006, 1, 6, 2.99, 178, 19.99, 'G');
INSERT INTO public.film VALUES (959, 'Warlock Werewolf', 'A Astounding Yarn of a Pioneer And a Crocodile who must Defeat a A Shark in The Outback', 2006, 1, 6, 2.99, 83, 10.99, 'G');
INSERT INTO public.film VALUES (960, 'Wars Pluto', 'A Taut Reflection of a Teacher And a Database Administrator who must Chase a Madman in The Sahara Desert', 2006, 1, 5, 2.99, 128, 15.99, 'G');
INSERT INTO public.film VALUES (961, 'Wash Heavenly', 'A Awe-Inspiring Reflection of a Cat And a Pioneer who must Escape a Hunter in Ancient China', 2006, 1, 7, 4.99, 161, 22.99, 'R');
INSERT INTO public.film VALUES (962, 'Wasteland Divine', 'A Fanciful Story of a Database Administrator And a Womanizer who must Fight a Database Administrator in Ancient China', 2006, 1, 7, 2.99, 85, 18.99, 'PG');
INSERT INTO public.film VALUES (963, 'Watch Tracy', 'A Fast-Paced Yarn of a Dog And a Frisbee who must Conquer a Hunter in Nigeria', 2006, 1, 5, 0.99, 78, 12.99, 'PG');
INSERT INTO public.film VALUES (964, 'Waterfront Deliverance', 'A Unbelieveable Documentary of a Dentist And a Technical Writer who must Build a Womanizer in Nigeria', 2006, 1, 4, 4.99, 61, 17.99, 'G');
INSERT INTO public.film VALUES (966, 'Wedding Apollo', 'A Action-Packed Tale of a Student And a Waitress who must Conquer a Lumberjack in An Abandoned Mine Shaft', 2006, 1, 3, 0.99, 70, 14.99, 'PG');
INSERT INTO public.film VALUES (967, 'Weekend Personal', 'A Fast-Paced Documentary of a Car And a Butler who must Find a Frisbee in A Jet Boat', 2006, 1, 5, 2.99, 134, 26.99, 'R');
INSERT INTO public.film VALUES (968, 'Werewolf Lola', 'A Fanciful Story of a Man And a Sumo Wrestler who must Outrace a Student in A Monastery', 2006, 1, 6, 4.99, 79, 19.99, 'G');
INSERT INTO public.film VALUES (969, 'West Lion', 'A Intrepid Drama of a Butler And a Lumberjack who must Challenge a Database Administrator in A Manhattan Penthouse', 2006, 1, 4, 4.99, 159, 29.99, 'G');
INSERT INTO public.film VALUES (970, 'Westward Seabiscuit', 'A Lacklusture Tale of a Butler And a Husband who must Face a Boy in Ancient China', 2006, 1, 7, 0.99, 52, 11.99, 'NC-17');
INSERT INTO public.film VALUES (971, 'Whale Bikini', 'A Intrepid Story of a Pastry Chef And a Database Administrator who must Kill a Feminist in A MySQL Convention', 2006, 1, 4, 4.99, 109, 11.99, 'PG-13');
INSERT INTO public.film VALUES (972, 'Whisperer Giant', 'A Intrepid Story of a Dentist And a Hunter who must Confront a Monkey in Ancient Japan', 2006, 1, 4, 4.99, 59, 24.99, 'PG-13');
INSERT INTO public.film VALUES (973, 'Wife Turn', 'A Awe-Inspiring Epistle of a Teacher And a Feminist who must Confront a Pioneer in Ancient Japan', 2006, 1, 3, 4.99, 183, 27.99, 'NC-17');
INSERT INTO public.film VALUES (974, 'Wild Apollo', 'A Beautiful Story of a Monkey And a Sumo Wrestler who must Conquer a A Shark in A MySQL Convention', 2006, 1, 4, 0.99, 181, 24.99, 'R');
INSERT INTO public.film VALUES (975, 'Willow Tracy', 'A Brilliant Panorama of a Boat And a Astronaut who must Challenge a Teacher in A Manhattan Penthouse', 2006, 1, 6, 2.99, 137, 22.99, 'R');
INSERT INTO public.film VALUES (976, 'Wind Phantom', 'A Touching Saga of a Madman And a Forensic Psychologist who must Build a Sumo Wrestler in An Abandoned Mine Shaft', 2006, 1, 6, 0.99, 111, 12.99, 'R');
INSERT INTO public.film VALUES (977, 'Window Side', 'A Astounding Character Study of a Womanizer And a Hunter who must Escape a Robot in A Monastery', 2006, 1, 3, 2.99, 85, 25.99, 'R');
INSERT INTO public.film VALUES (978, 'Wisdom Worker', 'A Unbelieveable Saga of a Forensic Psychologist And a Student who must Face a Squirrel in The First Manned Space Station', 2006, 1, 3, 0.99, 98, 12.99, 'R');
INSERT INTO public.film VALUES (979, 'Witches Panic', 'A Awe-Inspiring Drama of a Secret Agent And a Hunter who must Fight a Moose in Nigeria', 2006, 1, 6, 4.99, 100, 10.99, 'NC-17');
INSERT INTO public.film VALUES (980, 'Wizard Coldblooded', 'A Lacklusture Display of a Robot And a Girl who must Defeat a Sumo Wrestler in A MySQL Convention', 2006, 1, 4, 4.99, 75, 12.99, 'PG');
INSERT INTO public.film VALUES (981, 'Wolves Desire', 'A Fast-Paced Drama of a Squirrel And a Robot who must Succumb a Technical Writer in A Manhattan Penthouse', 2006, 1, 7, 0.99, 55, 13.99, 'NC-17');
INSERT INTO public.film VALUES (982, 'Women Dorado', 'A Insightful Documentary of a Waitress And a Butler who must Vanquish a Composer in Australia', 2006, 1, 4, 0.99, 126, 23.99, 'R');
INSERT INTO public.film VALUES (983, 'Won Dares', 'A Unbelieveable Documentary of a Teacher And a Monkey who must Defeat a Explorer in A U-Boat', 2006, 1, 7, 2.99, 105, 18.99, 'PG');
INSERT INTO public.film VALUES (984, 'Wonderful Drop', 'A Boring Panorama of a Woman And a Madman who must Overcome a Butler in A U-Boat', 2006, 1, 3, 2.99, 126, 20.99, 'NC-17');
INSERT INTO public.film VALUES (985, 'Wonderland Christmas', 'A Awe-Inspiring Character Study of a Waitress And a Car who must Pursue a Mad Scientist in The First Manned Space Station', 2006, 1, 4, 4.99, 111, 19.99, 'PG');
INSERT INTO public.film VALUES (986, 'Wonka Sea', 'A Brilliant Saga of a Boat And a Mad Scientist who must Meet a Moose in Ancient India', 2006, 1, 6, 2.99, 85, 24.99, 'NC-17');
INSERT INTO public.film VALUES (987, 'Words Hunter', 'A Action-Packed Reflection of a Composer And a Mad Scientist who must Face a Pioneer in A MySQL Convention', 2006, 1, 3, 2.99, 116, 13.99, 'PG');
INSERT INTO public.film VALUES (988, 'Worker Tarzan', 'A Action-Packed Yarn of a Secret Agent And a Technical Writer who must Battle a Sumo Wrestler in The First Manned Space Station', 2006, 1, 7, 2.99, 139, 26.99, 'R');
INSERT INTO public.film VALUES (989, 'Working Microcosmos', 'A Stunning Epistle of a Dentist And a Dog who must Kill a Madman in Ancient China', 2006, 1, 4, 4.99, 74, 22.99, 'R');
INSERT INTO public.film VALUES (990, 'World Leathernecks', 'A Unbelieveable Tale of a Pioneer And a Astronaut who must Overcome a Robot in An Abandoned Amusement Park', 2006, 1, 3, 0.99, 171, 13.99, 'PG-13');
INSERT INTO public.film VALUES (991, 'Worst Banger', 'A Thrilling Drama of a Madman And a Dentist who must Conquer a Boy in The Outback', 2006, 1, 4, 2.99, 185, 26.99, 'PG');
INSERT INTO public.film VALUES (992, 'Wrath Mile', 'A Intrepid Reflection of a Technical Writer And a Hunter who must Defeat a Sumo Wrestler in A Monastery', 2006, 1, 5, 0.99, 176, 17.99, 'NC-17');
INSERT INTO public.film VALUES (993, 'Wrong Behavior', 'A Emotional Saga of a Crocodile And a Sumo Wrestler who must Discover a Mad Cow in New Orleans', 2006, 1, 6, 2.99, 178, 10.99, 'PG-13');
INSERT INTO public.film VALUES (994, 'Wyoming Storm', 'A Awe-Inspiring Panorama of a Robot And a Boat who must Overcome a Feminist in A U-Boat', 2006, 1, 6, 4.99, 100, 29.99, 'PG-13');
INSERT INTO public.film VALUES (995, 'Yentl Idaho', 'A Amazing Display of a Robot And a Astronaut who must Fight a Womanizer in Berlin', 2006, 1, 5, 4.99, 86, 11.99, 'R');
INSERT INTO public.film VALUES (996, 'Young Language', 'A Unbelieveable Yarn of a Boat And a Database Administrator who must Meet a Boy in The First Manned Space Station', 2006, 1, 6, 0.99, 183, 9.99, 'G');
INSERT INTO public.film VALUES (997, 'Youth Kick', 'A Touching Drama of a Teacher And a Cat who must Challenge a Technical Writer in A U-Boat', 2006, 1, 4, 0.99, 179, 14.99, 'NC-17');
INSERT INTO public.film VALUES (998, 'Zhivago Core', 'A Fateful Yarn of a Composer And a Man who must Face a Boy in The Canadian Rockies', 2006, 1, 6, 0.99, 105, 10.99, 'NC-17');
INSERT INTO public.film VALUES (999, 'Zoolander Fiction', 'A Fateful Reflection of a Waitress And a Boat who must Discover a Sumo Wrestler in Ancient China', 2006, 1, 5, 2.99, 101, 28.99, 'R');
INSERT INTO public.film VALUES (1000, 'Zorro Ark', 'A Intrepid Panorama of a Mad Scientist And a Boy who must Redeem a Boy in A Monastery', 2006, 1, 3, 4.99, 50, 18.99, 'NC-17');
INSERT INTO public.film VALUES (16, 'Alley Evolution', 'A Fast-Paced Drama of a Robot And a Composer who must Battle a Astronaut in New Orleans', 2006, 2, 6, 2.99, 180, 23.99, 'NC-17');
INSERT INTO public.film VALUES (17, 'Alone Trip', 'A Fast-Paced Character Study of a Composer And a Dog who must Outgun a Boat in An Abandoned Fun House', 2006, 2, 3, 0.99, 82, 14.99, 'R');
INSERT INTO public.film VALUES (18, 'Alter Victory', 'A Thoughtful Drama of a Composer And a Feminist who must Meet a Secret Agent in The Canadian Rockies', 2006, 2, 6, 0.99, 57, 27.99, 'PG-13');
INSERT INTO public.film VALUES (19, 'Amadeus Holy', 'A Emotional Display of a Pioneer And a Technical Writer who must Battle a Man in A Baloon', 2006, 2, 6, 0.99, 113, 20.99, 'PG');
INSERT INTO public.film VALUES (20, 'Amelie Hellfighters', 'A Boring Drama of a Woman And a Squirrel who must Conquer a Student in A Baloon', 2006, 2, 4, 4.99, 79, 23.99, 'R');
INSERT INTO public.film VALUES (21, 'American Circus', 'A Insightful Drama of a Girl And a Astronaut who must Face a Database Administrator in A Shark Tank', 2006, 2, 3, 4.99, 129, 17.99, 'R');
INSERT INTO public.film VALUES (22, 'Amistad Midsummer', 'A Emotional Character Study of a Dentist And a Crocodile who must Meet a Sumo Wrestler in California', 2006, 2, 6, 2.99, 85, 10.99, 'G');
INSERT INTO public.film VALUES (23, 'Anaconda Confessions', 'A Lacklusture Display of a Dentist And a Dentist who must Fight a Girl in Australia', 2006, 2, 3, 0.99, 92, 9.99, 'R');
INSERT INTO public.film VALUES (24, 'Analyze Hoosiers', 'A Thoughtful Display of a Explorer And a Pastry Chef who must Overcome a Feminist in The Sahara Desert', 2006, 2, 6, 2.99, 181, 19.99, 'R');
INSERT INTO public.film VALUES (25, 'Angels Life', 'A Thoughtful Display of a Woman And a Astronaut who must Battle a Robot in Berlin', 2006, 2, 3, 2.99, 74, 15.99, 'G');
INSERT INTO public.film VALUES (26, 'Annie Identity', 'A Amazing Panorama of a Pastry Chef And a Boat who must Escape a Woman in An Abandoned Amusement Park', 2006, 2, 3, 0.99, 86, 15.99, 'G');
INSERT INTO public.film VALUES (27, 'Anonymous Human', 'A Amazing Reflection of a Database Administrator And a Astronaut who must Outrace a Database Administrator in A Shark Tank', 2006, 2, 7, 0.99, 179, 12.99, 'NC-17');
INSERT INTO public.film VALUES (28, 'Anthem Luke', 'A Touching Panorama of a Waitress And a Woman who must Outrace a Dog in An Abandoned Amusement Park', 2006, 2, 5, 4.99, 91, 16.99, 'PG-13');
INSERT INTO public.film VALUES (29, 'Antitrust Tomatoes', 'A Fateful Yarn of a Womanizer And a Feminist who must Succumb a Database Administrator in Ancient India', 2006, 2, 5, 2.99, 168, 11.99, 'NC-17');
INSERT INTO public.film VALUES (30, 'Anything Savannah', 'A Epic Story of a Pastry Chef And a Woman who must Chase a Feminist in An Abandoned Fun House', 2006, 2, 4, 2.99, 82, 27.99, 'R');
INSERT INTO public.film VALUES (34, 'Arabia Dogma', 'A Touching Epistle of a Madman And a Mad Cow who must Defeat a Student in Nigeria', 2006, 3, 6, 0.99, 62, 29.99, 'NC-17');
INSERT INTO public.film VALUES (35, 'Arachnophobia Rollercoaster', 'A Action-Packed Reflection of a Pastry Chef And a Composer who must Discover a Mad Scientist in The First Manned Space Station', 2006, 3, 4, 2.99, 147, 24.99, 'PG-13');
INSERT INTO public.film VALUES (36, 'Argonauts Town', 'A Emotional Epistle of a Forensic Psychologist And a Butler who must Challenge a Waitress in An Abandoned Mine Shaft', 2006, 3, 7, 0.99, 127, 12.99, 'PG-13');
INSERT INTO public.film VALUES (37, 'Arizona Bang', 'A Brilliant Panorama of a Mad Scientist And a Mad Cow who must Meet a Pioneer in A Monastery', 2006, 3, 3, 2.99, 121, 28.99, 'PG');
INSERT INTO public.film VALUES (38, 'Ark Ridgemont', 'A Beautiful Yarn of a Pioneer And a Monkey who must Pursue a Explorer in The Sahara Desert', 2006, 3, 6, 0.99, 68, 25.99, 'NC-17');
INSERT INTO public.film VALUES (39, 'Armageddon Lost', 'A Fast-Paced Tale of a Boat And a Teacher who must Succumb a Composer in An Abandoned Mine Shaft', 2006, 3, 5, 0.99, 99, 10.99, 'G');
INSERT INTO public.film VALUES (40, 'Army Flintstones', 'A Boring Saga of a Database Administrator And a Womanizer who must Battle a Waitress in Nigeria', 2006, 3, 4, 0.99, 148, 22.99, 'R');
INSERT INTO public.film VALUES (41, 'Arsenic Independence', 'A Fanciful Documentary of a Mad Cow And a Womanizer who must Find a Dentist in Berlin', 2006, 3, 4, 0.99, 137, 17.99, 'PG');
INSERT INTO public.film VALUES (42, 'Artist Coldblooded', 'A Stunning Reflection of a Robot And a Moose who must Challenge a Woman in California', 2006, 3, 5, 2.99, 170, 10.99, 'NC-17');
INSERT INTO public.film VALUES (43, 'Atlantis Cause', 'A Thrilling Yarn of a Feminist And a Hunter who must Fight a Technical Writer in A Shark Tank', 2006, 3, 6, 2.99, 170, 15.99, 'G');
INSERT INTO public.film VALUES (44, 'Attacks Hate', 'A Fast-Paced Panorama of a Technical Writer And a Mad Scientist who must Find a Feminist in An Abandoned Mine Shaft', 2006, 3, 5, 4.99, 113, 21.99, 'PG-13');
INSERT INTO public.film VALUES (45, 'Attraction Newton', 'A Astounding Panorama of a Composer And a Frisbee who must Reach a Husband in Ancient Japan', 2006, 3, 5, 4.99, 83, 14.99, 'PG-13');
INSERT INTO public.film VALUES (51, 'Balloon Homeward', 'A Insightful Panorama of a Forensic Psychologist And a Mad Cow who must Build a Mad Scientist in The First Manned Space Station', 2006, 4, 5, 2.99, 75, 10.99, 'NC-17');
INSERT INTO public.film VALUES (52, 'Ballroom Mockingbird', 'A Thrilling Documentary of a Composer And a Monkey who must Find a Feminist in California', 2006, 4, 6, 0.99, 173, 29.99, 'G');
INSERT INTO public.film VALUES (53, 'Bang Kwai', 'A Epic Drama of a Madman And a Cat who must Face a A Shark in An Abandoned Amusement Park', 2006, 4, 5, 2.99, 87, 25.99, 'NC-17');
INSERT INTO public.film VALUES (54, 'Banger Pinocchio', 'A Awe-Inspiring Drama of a Car And a Pastry Chef who must Chase a Crocodile in The First Manned Space Station', 2006, 4, 5, 0.99, 113, 15.99, 'R');
INSERT INTO public.film VALUES (55, 'Barbarella Streetcar', 'A Awe-Inspiring Story of a Feminist And a Cat who must Conquer a Dog in A Monastery', 2006, 4, 6, 2.99, 65, 27.99, 'G');
INSERT INTO public.film VALUES (56, 'Barefoot Manchurian', 'A Intrepid Story of a Cat And a Student who must Vanquish a Girl in An Abandoned Amusement Park', 2006, 4, 6, 2.99, 129, 15.99, 'G');
INSERT INTO public.film VALUES (57, 'Basic Easy', 'A Stunning Epistle of a Man And a Husband who must Reach a Mad Scientist in A Jet Boat', 2006, 4, 4, 2.99, 90, 18.99, 'PG-13');
INSERT INTO public.film VALUES (58, 'Beach Heartbreakers', 'A Fateful Display of a Womanizer And a Mad Scientist who must Outgun a A Shark in Soviet Georgia', 2006, 4, 6, 2.99, 122, 16.99, 'G');
INSERT INTO public.film VALUES (59, 'Bear Graceland', 'A Astounding Saga of a Dog And a Boy who must Kill a Teacher in The First Manned Space Station', 2006, 4, 4, 2.99, 160, 20.99, 'R');
INSERT INTO public.film VALUES (60, 'Beast Hunchback', 'A Awe-Inspiring Epistle of a Student And a Squirrel who must Defeat a Boy in Ancient China', 2006, 4, 3, 4.99, 89, 22.99, 'R');
INSERT INTO public.film VALUES (68, 'Betrayed Rear', 'A Emotional Character Study of a Boat And a Pioneer who must Find a Explorer in A Shark Tank', 2006, 5, 5, 4.99, 122, 26.99, 'NC-17');
INSERT INTO public.film VALUES (69, 'Beverly Outlaw', 'A Fanciful Documentary of a Womanizer And a Boat who must Defeat a Madman in The First Manned Space Station', 2006, 5, 3, 2.99, 85, 21.99, 'R');
INSERT INTO public.film VALUES (70, 'Bikini Borrowers', 'A Astounding Drama of a Astronaut And a Cat who must Discover a Woman in The First Manned Space Station', 2006, 5, 7, 4.99, 142, 26.99, 'NC-17');
INSERT INTO public.film VALUES (71, 'Bilko Anonymous', 'A Emotional Reflection of a Teacher And a Man who must Meet a Cat in The First Manned Space Station', 2006, 5, 3, 4.99, 100, 25.99, 'PG-13');
INSERT INTO public.film VALUES (72, 'Bill Others', 'A Stunning Saga of a Mad Scientist And a Forensic Psychologist who must Challenge a Squirrel in A MySQL Convention', 2006, 5, 6, 2.99, 93, 12.99, 'PG');
INSERT INTO public.film VALUES (73, 'Bingo Talented', 'A Touching Tale of a Girl And a Crocodile who must Discover a Waitress in Nigeria', 2006, 5, 5, 2.99, 150, 22.99, 'PG-13');
INSERT INTO public.film VALUES (74, 'Birch Antitrust', 'A Fanciful Panorama of a Husband And a Pioneer who must Outgun a Dog in A Baloon', 2006, 5, 4, 4.99, 162, 18.99, 'PG');
INSERT INTO public.film VALUES (75, 'Bird Independence', 'A Thrilling Documentary of a Car And a Student who must Sink a Hunter in The Canadian Rockies', 2006, 5, 6, 4.99, 163, 14.99, 'G');
INSERT INTO public.film VALUES (84, 'Boiled Dares', 'A Awe-Inspiring Story of a Waitress And a Dog who must Discover a Dentist in Ancient Japan', 2006, 6, 7, 4.99, 102, 13.99, 'PG');
INSERT INTO public.film VALUES (85, 'Bonnie Holocaust', 'A Fast-Paced Story of a Crocodile And a Robot who must Find a Moose in Ancient Japan', 2006, 6, 4, 0.99, 63, 29.99, 'G');
INSERT INTO public.film VALUES (86, 'Boogie Amelie', 'A Lacklusture Character Study of a Husband And a Sumo Wrestler who must Succumb a Technical Writer in The Gulf of Mexico', 2006, 6, 6, 4.99, 121, 11.99, 'R');
INSERT INTO public.film VALUES (87, 'Boondock Ballroom', 'A Fateful Panorama of a Crocodile And a Boy who must Defeat a Monkey in The Gulf of Mexico', 2006, 6, 7, 0.99, 76, 14.99, 'NC-17');
INSERT INTO public.film VALUES (88, 'Born Spinal', 'A Touching Epistle of a Frisbee And a Husband who must Pursue a Student in Nigeria', 2006, 6, 7, 4.99, 179, 17.99, 'PG');
INSERT INTO public.film VALUES (89, 'Borrowers Bedazzled', 'A Brilliant Epistle of a Teacher And a Sumo Wrestler who must Defeat a Man in An Abandoned Fun House', 2006, 6, 7, 0.99, 63, 22.99, 'G');
INSERT INTO public.film VALUES (90, 'Boulevard Mob', 'A Fateful Epistle of a Moose And a Monkey who must Confront a Lumberjack in Ancient China', 2006, 6, 3, 0.99, 63, 11.99, 'R');
INSERT INTO public.film VALUES (96, 'Breaking Home', 'A Beautiful Display of a Secret Agent And a Monkey who must Battle a Sumo Wrestler in An Abandoned Mine Shaft', 2006, 6, 4, 2.99, 169, 21.99, 'PG-13');
INSERT INTO public.film VALUES (97, 'Bride Intrigue', 'A Epic Tale of a Robot And a Monkey who must Vanquish a Man in New Orleans', 2006, 6, 7, 0.99, 56, 24.99, 'G');
INSERT INTO public.film VALUES (98, 'Bright Encounters', 'A Fateful Yarn of a Lumberjack And a Feminist who must Conquer a Student in A Jet Boat', 2006, 6, 4, 4.99, 73, 12.99, 'PG-13');
INSERT INTO public.film VALUES (99, 'Bringing Hysterical', 'A Fateful Saga of a A Shark And a Technical Writer who must Find a Woman in A Jet Boat', 2006, 6, 7, 2.99, 136, 14.99, 'PG');
INSERT INTO public.film VALUES (100, 'Brooklyn Desert', 'A Beautiful Drama of a Dentist And a Composer who must Battle a Sumo Wrestler in The First Manned Space Station', 2006, 6, 7, 4.99, 161, 21.99, 'R');


--
-- TOC entry 2971 (class 0 OID 18466)
-- Dependencies: 210
-- Data for Name: film_actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.film_actor VALUES (1, 1);
INSERT INTO public.film_actor VALUES (1, 23);
INSERT INTO public.film_actor VALUES (1, 25);
INSERT INTO public.film_actor VALUES (2, 3);
INSERT INTO public.film_actor VALUES (2, 31);
INSERT INTO public.film_actor VALUES (2, 47);
INSERT INTO public.film_actor VALUES (3, 17);
INSERT INTO public.film_actor VALUES (3, 40);
INSERT INTO public.film_actor VALUES (3, 42);
INSERT INTO public.film_actor VALUES (3, 87);
INSERT INTO public.film_actor VALUES (4, 23);
INSERT INTO public.film_actor VALUES (4, 25);
INSERT INTO public.film_actor VALUES (4, 56);
INSERT INTO public.film_actor VALUES (4, 62);
INSERT INTO public.film_actor VALUES (4, 79);
INSERT INTO public.film_actor VALUES (4, 87);
INSERT INTO public.film_actor VALUES (5, 19);
INSERT INTO public.film_actor VALUES (5, 54);
INSERT INTO public.film_actor VALUES (5, 85);
INSERT INTO public.film_actor VALUES (6, 29);
INSERT INTO public.film_actor VALUES (6, 53);
INSERT INTO public.film_actor VALUES (6, 60);
INSERT INTO public.film_actor VALUES (6, 70);
INSERT INTO public.film_actor VALUES (7, 25);
INSERT INTO public.film_actor VALUES (7, 27);
INSERT INTO public.film_actor VALUES (7, 35);
INSERT INTO public.film_actor VALUES (7, 67);
INSERT INTO public.film_actor VALUES (7, 96);
INSERT INTO public.film_actor VALUES (8, 47);
INSERT INTO public.film_actor VALUES (9, 30);
INSERT INTO public.film_actor VALUES (9, 74);
INSERT INTO public.film_actor VALUES (10, 1);
INSERT INTO public.film_actor VALUES (10, 9);
INSERT INTO public.film_actor VALUES (12, 16);
INSERT INTO public.film_actor VALUES (12, 17);
INSERT INTO public.film_actor VALUES (12, 34);
INSERT INTO public.film_actor VALUES (12, 37);
INSERT INTO public.film_actor VALUES (12, 91);
INSERT INTO public.film_actor VALUES (12, 92);
INSERT INTO public.film_actor VALUES (13, 17);
INSERT INTO public.film_actor VALUES (13, 29);
INSERT INTO public.film_actor VALUES (13, 45);
INSERT INTO public.film_actor VALUES (13, 87);
INSERT INTO public.film_actor VALUES (15, 31);
INSERT INTO public.film_actor VALUES (15, 89);
INSERT INTO public.film_actor VALUES (15, 91);
INSERT INTO public.film_actor VALUES (16, 80);
INSERT INTO public.film_actor VALUES (16, 87);
INSERT INTO public.film_actor VALUES (17, 96);
INSERT INTO public.film_actor VALUES (18, 44);
INSERT INTO public.film_actor VALUES (18, 84);
INSERT INTO public.film_actor VALUES (19, 2);
INSERT INTO public.film_actor VALUES (19, 3);
INSERT INTO public.film_actor VALUES (20, 1);
INSERT INTO public.film_actor VALUES (20, 54);
INSERT INTO public.film_actor VALUES (20, 63);
INSERT INTO public.film_actor VALUES (21, 6);
INSERT INTO public.film_actor VALUES (21, 87);
INSERT INTO public.film_actor VALUES (21, 88);
INSERT INTO public.film_actor VALUES (22, 9);
INSERT INTO public.film_actor VALUES (22, 23);
INSERT INTO public.film_actor VALUES (22, 56);
INSERT INTO public.film_actor VALUES (22, 89);
INSERT INTO public.film_actor VALUES (23, 6);
INSERT INTO public.film_actor VALUES (23, 42);
INSERT INTO public.film_actor VALUES (23, 78);
INSERT INTO public.film_actor VALUES (24, 3);
INSERT INTO public.film_actor VALUES (24, 83);
INSERT INTO public.film_actor VALUES (25, 21);
INSERT INTO public.film_actor VALUES (25, 86);
INSERT INTO public.film_actor VALUES (26, 9);
INSERT INTO public.film_actor VALUES (26, 21);
INSERT INTO public.film_actor VALUES (26, 34);
INSERT INTO public.film_actor VALUES (26, 90);
INSERT INTO public.film_actor VALUES (26, 93);
INSERT INTO public.film_actor VALUES (27, 19);
INSERT INTO public.film_actor VALUES (27, 34);
INSERT INTO public.film_actor VALUES (27, 85);
INSERT INTO public.film_actor VALUES (28, 14);
INSERT INTO public.film_actor VALUES (28, 43);
INSERT INTO public.film_actor VALUES (28, 58);
INSERT INTO public.film_actor VALUES (28, 74);
INSERT INTO public.film_actor VALUES (28, 96);
INSERT INTO public.film_actor VALUES (29, 10);
INSERT INTO public.film_actor VALUES (29, 79);
INSERT INTO public.film_actor VALUES (30, 1);
INSERT INTO public.film_actor VALUES (30, 53);
INSERT INTO public.film_actor VALUES (30, 64);
INSERT INTO public.film_actor VALUES (30, 69);
INSERT INTO public.film_actor VALUES (30, 77);
INSERT INTO public.film_actor VALUES (30, 87);
INSERT INTO public.film_actor VALUES (31, 88);
INSERT INTO public.film_actor VALUES (32, 65);
INSERT INTO public.film_actor VALUES (32, 84);
INSERT INTO public.film_actor VALUES (33, 56);
INSERT INTO public.film_actor VALUES (34, 43);
INSERT INTO public.film_actor VALUES (34, 90);
INSERT INTO public.film_actor VALUES (35, 10);
INSERT INTO public.film_actor VALUES (35, 35);
INSERT INTO public.film_actor VALUES (35, 52);
INSERT INTO public.film_actor VALUES (36, 15);
INSERT INTO public.film_actor VALUES (36, 81);
INSERT INTO public.film_actor VALUES (37, 10);
INSERT INTO public.film_actor VALUES (37, 12);
INSERT INTO public.film_actor VALUES (37, 19);
INSERT INTO public.film_actor VALUES (38, 24);
INSERT INTO public.film_actor VALUES (39, 71);
INSERT INTO public.film_actor VALUES (39, 73);
INSERT INTO public.film_actor VALUES (40, 1);
INSERT INTO public.film_actor VALUES (40, 11);
INSERT INTO public.film_actor VALUES (40, 34);
INSERT INTO public.film_actor VALUES (41, 4);
INSERT INTO public.film_actor VALUES (41, 60);
INSERT INTO public.film_actor VALUES (41, 69);
INSERT INTO public.film_actor VALUES (41, 86);
INSERT INTO public.film_actor VALUES (41, 100);
INSERT INTO public.film_actor VALUES (42, 24);
INSERT INTO public.film_actor VALUES (43, 19);
INSERT INTO public.film_actor VALUES (43, 42);
INSERT INTO public.film_actor VALUES (43, 56);
INSERT INTO public.film_actor VALUES (43, 89);
INSERT INTO public.film_actor VALUES (44, 58);
INSERT INTO public.film_actor VALUES (44, 84);
INSERT INTO public.film_actor VALUES (44, 88);
INSERT INTO public.film_actor VALUES (44, 94);
INSERT INTO public.film_actor VALUES (45, 18);
INSERT INTO public.film_actor VALUES (45, 65);
INSERT INTO public.film_actor VALUES (45, 66);
INSERT INTO public.film_actor VALUES (46, 38);
INSERT INTO public.film_actor VALUES (46, 51);
INSERT INTO public.film_actor VALUES (47, 25);
INSERT INTO public.film_actor VALUES (47, 36);
INSERT INTO public.film_actor VALUES (47, 53);
INSERT INTO public.film_actor VALUES (47, 67);
INSERT INTO public.film_actor VALUES (48, 99);
INSERT INTO public.film_actor VALUES (49, 31);
INSERT INTO public.film_actor VALUES (51, 5);
INSERT INTO public.film_actor VALUES (51, 63);
INSERT INTO public.film_actor VALUES (52, 20);
INSERT INTO public.film_actor VALUES (52, 92);
INSERT INTO public.film_actor VALUES (52, 96);
INSERT INTO public.film_actor VALUES (53, 1);
INSERT INTO public.film_actor VALUES (53, 9);
INSERT INTO public.film_actor VALUES (53, 51);
INSERT INTO public.film_actor VALUES (53, 58);
INSERT INTO public.film_actor VALUES (54, 84);
INSERT INTO public.film_actor VALUES (55, 8);
INSERT INTO public.film_actor VALUES (55, 27);
INSERT INTO public.film_actor VALUES (55, 75);
INSERT INTO public.film_actor VALUES (56, 63);
INSERT INTO public.film_actor VALUES (56, 87);
INSERT INTO public.film_actor VALUES (57, 16);
INSERT INTO public.film_actor VALUES (57, 34);
INSERT INTO public.film_actor VALUES (58, 48);
INSERT INTO public.film_actor VALUES (58, 68);
INSERT INTO public.film_actor VALUES (59, 5);
INSERT INTO public.film_actor VALUES (59, 46);
INSERT INTO public.film_actor VALUES (59, 54);
INSERT INTO public.film_actor VALUES (59, 72);
INSERT INTO public.film_actor VALUES (59, 88);
INSERT INTO public.film_actor VALUES (60, 31);
INSERT INTO public.film_actor VALUES (60, 85);
INSERT INTO public.film_actor VALUES (62, 6);
INSERT INTO public.film_actor VALUES (62, 42);
INSERT INTO public.film_actor VALUES (62, 54);
INSERT INTO public.film_actor VALUES (62, 100);
INSERT INTO public.film_actor VALUES (63, 73);
INSERT INTO public.film_actor VALUES (64, 3);
INSERT INTO public.film_actor VALUES (64, 10);
INSERT INTO public.film_actor VALUES (64, 37);
INSERT INTO public.film_actor VALUES (64, 87);
INSERT INTO public.film_actor VALUES (64, 88);
INSERT INTO public.film_actor VALUES (65, 39);
INSERT INTO public.film_actor VALUES (65, 46);
INSERT INTO public.film_actor VALUES (65, 97);
INSERT INTO public.film_actor VALUES (66, 55);
INSERT INTO public.film_actor VALUES (67, 24);
INSERT INTO public.film_actor VALUES (67, 57);
INSERT INTO public.film_actor VALUES (67, 67);
INSERT INTO public.film_actor VALUES (68, 9);
INSERT INTO public.film_actor VALUES (68, 45);
INSERT INTO public.film_actor VALUES (69, 15);
INSERT INTO public.film_actor VALUES (69, 88);
INSERT INTO public.film_actor VALUES (70, 50);
INSERT INTO public.film_actor VALUES (70, 53);
INSERT INTO public.film_actor VALUES (70, 92);
INSERT INTO public.film_actor VALUES (71, 26);
INSERT INTO public.film_actor VALUES (71, 52);
INSERT INTO public.film_actor VALUES (72, 34);
INSERT INTO public.film_actor VALUES (73, 36);
INSERT INTO public.film_actor VALUES (73, 45);
INSERT INTO public.film_actor VALUES (73, 51);
INSERT INTO public.film_actor VALUES (73, 77);
INSERT INTO public.film_actor VALUES (74, 28);
INSERT INTO public.film_actor VALUES (74, 44);
INSERT INTO public.film_actor VALUES (75, 12);
INSERT INTO public.film_actor VALUES (75, 34);
INSERT INTO public.film_actor VALUES (76, 60);
INSERT INTO public.film_actor VALUES (76, 66);
INSERT INTO public.film_actor VALUES (76, 68);
INSERT INTO public.film_actor VALUES (76, 95);
INSERT INTO public.film_actor VALUES (77, 13);
INSERT INTO public.film_actor VALUES (77, 22);
INSERT INTO public.film_actor VALUES (77, 40);
INSERT INTO public.film_actor VALUES (77, 73);
INSERT INTO public.film_actor VALUES (77, 78);
INSERT INTO public.film_actor VALUES (78, 86);
INSERT INTO public.film_actor VALUES (79, 32);
INSERT INTO public.film_actor VALUES (79, 33);
INSERT INTO public.film_actor VALUES (79, 40);
INSERT INTO public.film_actor VALUES (80, 69);
INSERT INTO public.film_actor VALUES (81, 4);
INSERT INTO public.film_actor VALUES (81, 11);
INSERT INTO public.film_actor VALUES (81, 59);
INSERT INTO public.film_actor VALUES (81, 89);
INSERT INTO public.film_actor VALUES (82, 17);
INSERT INTO public.film_actor VALUES (82, 33);
INSERT INTO public.film_actor VALUES (83, 49);
INSERT INTO public.film_actor VALUES (83, 52);
INSERT INTO public.film_actor VALUES (83, 58);
INSERT INTO public.film_actor VALUES (84, 19);
INSERT INTO public.film_actor VALUES (84, 39);
INSERT INTO public.film_actor VALUES (84, 46);
INSERT INTO public.film_actor VALUES (85, 2);
INSERT INTO public.film_actor VALUES (85, 14);
INSERT INTO public.film_actor VALUES (85, 72);
INSERT INTO public.film_actor VALUES (85, 85);
INSERT INTO public.film_actor VALUES (85, 92);
INSERT INTO public.film_actor VALUES (87, 48);
INSERT INTO public.film_actor VALUES (88, 4);
INSERT INTO public.film_actor VALUES (88, 76);
INSERT INTO public.film_actor VALUES (88, 87);
INSERT INTO public.film_actor VALUES (89, 47);
INSERT INTO public.film_actor VALUES (90, 2);
INSERT INTO public.film_actor VALUES (90, 11);
INSERT INTO public.film_actor VALUES (90, 100);
INSERT INTO public.film_actor VALUES (91, 13);
INSERT INTO public.film_actor VALUES (91, 25);
INSERT INTO public.film_actor VALUES (91, 48);
INSERT INTO public.film_actor VALUES (92, 90);
INSERT INTO public.film_actor VALUES (92, 94);
INSERT INTO public.film_actor VALUES (93, 71);
INSERT INTO public.film_actor VALUES (94, 13);
INSERT INTO public.film_actor VALUES (94, 60);
INSERT INTO public.film_actor VALUES (94, 76);
INSERT INTO public.film_actor VALUES (95, 22);
INSERT INTO public.film_actor VALUES (95, 35);
INSERT INTO public.film_actor VALUES (95, 47);
INSERT INTO public.film_actor VALUES (95, 52);
INSERT INTO public.film_actor VALUES (95, 65);
INSERT INTO public.film_actor VALUES (95, 74);
INSERT INTO public.film_actor VALUES (96, 8);
INSERT INTO public.film_actor VALUES (96, 36);
INSERT INTO public.film_actor VALUES (96, 40);
INSERT INTO public.film_actor VALUES (96, 54);
INSERT INTO public.film_actor VALUES (96, 58);
INSERT INTO public.film_actor VALUES (96, 66);
INSERT INTO public.film_actor VALUES (98, 66);
INSERT INTO public.film_actor VALUES (98, 72);
INSERT INTO public.film_actor VALUES (98, 81);
INSERT INTO public.film_actor VALUES (98, 87);
INSERT INTO public.film_actor VALUES (99, 7);
INSERT INTO public.film_actor VALUES (99, 27);
INSERT INTO public.film_actor VALUES (99, 84);
INSERT INTO public.film_actor VALUES (100, 17);
INSERT INTO public.film_actor VALUES (101, 60);
INSERT INTO public.film_actor VALUES (101, 66);
INSERT INTO public.film_actor VALUES (101, 85);
INSERT INTO public.film_actor VALUES (102, 20);
INSERT INTO public.film_actor VALUES (102, 34);
INSERT INTO public.film_actor VALUES (102, 53);
INSERT INTO public.film_actor VALUES (103, 5);
INSERT INTO public.film_actor VALUES (104, 19);
INSERT INTO public.film_actor VALUES (104, 39);
INSERT INTO public.film_actor VALUES (104, 40);
INSERT INTO public.film_actor VALUES (104, 59);
INSERT INTO public.film_actor VALUES (104, 70);
INSERT INTO public.film_actor VALUES (105, 12);
INSERT INTO public.film_actor VALUES (105, 15);
INSERT INTO public.film_actor VALUES (105, 21);
INSERT INTO public.film_actor VALUES (105, 29);
INSERT INTO public.film_actor VALUES (105, 42);
INSERT INTO public.film_actor VALUES (106, 44);
INSERT INTO public.film_actor VALUES (106, 83);
INSERT INTO public.film_actor VALUES (107, 62);
INSERT INTO public.film_actor VALUES (108, 1);
INSERT INTO public.film_actor VALUES (108, 6);
INSERT INTO public.film_actor VALUES (108, 9);
INSERT INTO public.film_actor VALUES (109, 12);
INSERT INTO public.film_actor VALUES (109, 48);
INSERT INTO public.film_actor VALUES (109, 77);
INSERT INTO public.film_actor VALUES (110, 8);
INSERT INTO public.film_actor VALUES (110, 27);
INSERT INTO public.film_actor VALUES (110, 62);
INSERT INTO public.film_actor VALUES (111, 61);
INSERT INTO public.film_actor VALUES (111, 78);
INSERT INTO public.film_actor VALUES (111, 98);
INSERT INTO public.film_actor VALUES (112, 34);
INSERT INTO public.film_actor VALUES (112, 37);
INSERT INTO public.film_actor VALUES (113, 35);
INSERT INTO public.film_actor VALUES (113, 84);
INSERT INTO public.film_actor VALUES (114, 13);
INSERT INTO public.film_actor VALUES (114, 68);
INSERT INTO public.film_actor VALUES (114, 90);
INSERT INTO public.film_actor VALUES (115, 49);
INSERT INTO public.film_actor VALUES (115, 52);
INSERT INTO public.film_actor VALUES (116, 36);
INSERT INTO public.film_actor VALUES (116, 48);
INSERT INTO public.film_actor VALUES (116, 88);
INSERT INTO public.film_actor VALUES (116, 90);
INSERT INTO public.film_actor VALUES (117, 10);
INSERT INTO public.film_actor VALUES (117, 15);
INSERT INTO public.film_actor VALUES (117, 42);
INSERT INTO public.film_actor VALUES (118, 35);
INSERT INTO public.film_actor VALUES (118, 39);
INSERT INTO public.film_actor VALUES (118, 41);
INSERT INTO public.film_actor VALUES (118, 49);
INSERT INTO public.film_actor VALUES (118, 55);
INSERT INTO public.film_actor VALUES (119, 21);
INSERT INTO public.film_actor VALUES (119, 49);
INSERT INTO public.film_actor VALUES (119, 64);
INSERT INTO public.film_actor VALUES (119, 87);
INSERT INTO public.film_actor VALUES (120, 57);
INSERT INTO public.film_actor VALUES (120, 63);
INSERT INTO public.film_actor VALUES (122, 22);
INSERT INTO public.film_actor VALUES (122, 29);
INSERT INTO public.film_actor VALUES (122, 76);
INSERT INTO public.film_actor VALUES (122, 83);
INSERT INTO public.film_actor VALUES (123, 3);
INSERT INTO public.film_actor VALUES (123, 43);
INSERT INTO public.film_actor VALUES (123, 67);
INSERT INTO public.film_actor VALUES (124, 22);
INSERT INTO public.film_actor VALUES (124, 64);
INSERT INTO public.film_actor VALUES (125, 62);
INSERT INTO public.film_actor VALUES (125, 98);
INSERT INTO public.film_actor VALUES (125, 100);
INSERT INTO public.film_actor VALUES (126, 21);
INSERT INTO public.film_actor VALUES (126, 34);
INSERT INTO public.film_actor VALUES (126, 43);
INSERT INTO public.film_actor VALUES (126, 58);
INSERT INTO public.film_actor VALUES (126, 85);
INSERT INTO public.film_actor VALUES (126, 96);
INSERT INTO public.film_actor VALUES (127, 36);
INSERT INTO public.film_actor VALUES (127, 47);
INSERT INTO public.film_actor VALUES (127, 48);
INSERT INTO public.film_actor VALUES (127, 79);
INSERT INTO public.film_actor VALUES (128, 26);
INSERT INTO public.film_actor VALUES (128, 82);
INSERT INTO public.film_actor VALUES (129, 56);
INSERT INTO public.film_actor VALUES (129, 89);
INSERT INTO public.film_actor VALUES (130, 9);
INSERT INTO public.film_actor VALUES (130, 26);
INSERT INTO public.film_actor VALUES (130, 37);
INSERT INTO public.film_actor VALUES (130, 43);
INSERT INTO public.film_actor VALUES (130, 49);
INSERT INTO public.film_actor VALUES (130, 57);
INSERT INTO public.film_actor VALUES (131, 48);
INSERT INTO public.film_actor VALUES (131, 66);
INSERT INTO public.film_actor VALUES (131, 94);
INSERT INTO public.film_actor VALUES (132, 81);
INSERT INTO public.film_actor VALUES (132, 82);
INSERT INTO public.film_actor VALUES (133, 7);
INSERT INTO public.film_actor VALUES (133, 51);
INSERT INTO public.film_actor VALUES (135, 35);
INSERT INTO public.film_actor VALUES (135, 41);
INSERT INTO public.film_actor VALUES (135, 65);
INSERT INTO public.film_actor VALUES (135, 88);
INSERT INTO public.film_actor VALUES (136, 20);
INSERT INTO public.film_actor VALUES (136, 25);
INSERT INTO public.film_actor VALUES (136, 33);
INSERT INTO public.film_actor VALUES (136, 56);
INSERT INTO public.film_actor VALUES (136, 61);
INSERT INTO public.film_actor VALUES (137, 6);
INSERT INTO public.film_actor VALUES (137, 14);
INSERT INTO public.film_actor VALUES (137, 56);
INSERT INTO public.film_actor VALUES (137, 96);
INSERT INTO public.film_actor VALUES (138, 8);
INSERT INTO public.film_actor VALUES (138, 52);
INSERT INTO public.film_actor VALUES (138, 61);
INSERT INTO public.film_actor VALUES (139, 20);
INSERT INTO public.film_actor VALUES (139, 35);
INSERT INTO public.film_actor VALUES (139, 57);
INSERT INTO public.film_actor VALUES (139, 74);
INSERT INTO public.film_actor VALUES (139, 90);
INSERT INTO public.film_actor VALUES (140, 27);
INSERT INTO public.film_actor VALUES (140, 77);
INSERT INTO public.film_actor VALUES (141, 43);
INSERT INTO public.film_actor VALUES (141, 67);
INSERT INTO public.film_actor VALUES (142, 10);
INSERT INTO public.film_actor VALUES (142, 18);
INSERT INTO public.film_actor VALUES (143, 47);
INSERT INTO public.film_actor VALUES (143, 79);
INSERT INTO public.film_actor VALUES (144, 18);
INSERT INTO public.film_actor VALUES (144, 67);
INSERT INTO public.film_actor VALUES (144, 79);
INSERT INTO public.film_actor VALUES (144, 90);
INSERT INTO public.film_actor VALUES (144, 99);
INSERT INTO public.film_actor VALUES (145, 39);
INSERT INTO public.film_actor VALUES (146, 12);
INSERT INTO public.film_actor VALUES (146, 16);
INSERT INTO public.film_actor VALUES (146, 33);
INSERT INTO public.film_actor VALUES (147, 4);
INSERT INTO public.film_actor VALUES (147, 85);
INSERT INTO public.film_actor VALUES (148, 27);
INSERT INTO public.film_actor VALUES (148, 57);
INSERT INTO public.film_actor VALUES (149, 53);
INSERT INTO public.film_actor VALUES (149, 72);
INSERT INTO public.film_actor VALUES (149, 95);
INSERT INTO public.film_actor VALUES (150, 23);
INSERT INTO public.film_actor VALUES (150, 63);
INSERT INTO public.film_actor VALUES (150, 75);
INSERT INTO public.film_actor VALUES (150, 94);
INSERT INTO public.film_actor VALUES (152, 59);
INSERT INTO public.film_actor VALUES (153, 47);
INSERT INTO public.film_actor VALUES (153, 64);
INSERT INTO public.film_actor VALUES (154, 27);
INSERT INTO public.film_actor VALUES (155, 20);
INSERT INTO public.film_actor VALUES (155, 67);
INSERT INTO public.film_actor VALUES (156, 53);
INSERT INTO public.film_actor VALUES (157, 10);
INSERT INTO public.film_actor VALUES (157, 24);
INSERT INTO public.film_actor VALUES (157, 34);
INSERT INTO public.film_actor VALUES (158, 32);
INSERT INTO public.film_actor VALUES (158, 47);
INSERT INTO public.film_actor VALUES (158, 64);
INSERT INTO public.film_actor VALUES (158, 66);
INSERT INTO public.film_actor VALUES (159, 20);
INSERT INTO public.film_actor VALUES (159, 82);
INSERT INTO public.film_actor VALUES (160, 2);
INSERT INTO public.film_actor VALUES (160, 17);
INSERT INTO public.film_actor VALUES (160, 43);
INSERT INTO public.film_actor VALUES (161, 43);
INSERT INTO public.film_actor VALUES (161, 58);
INSERT INTO public.film_actor VALUES (161, 89);
INSERT INTO public.film_actor VALUES (161, 90);
INSERT INTO public.film_actor VALUES (162, 1);
INSERT INTO public.film_actor VALUES (162, 4);
INSERT INTO public.film_actor VALUES (162, 7);
INSERT INTO public.film_actor VALUES (162, 18);
INSERT INTO public.film_actor VALUES (162, 28);
INSERT INTO public.film_actor VALUES (162, 32);
INSERT INTO public.film_actor VALUES (162, 33);
INSERT INTO public.film_actor VALUES (162, 41);
INSERT INTO public.film_actor VALUES (162, 85);
INSERT INTO public.film_actor VALUES (163, 30);
INSERT INTO public.film_actor VALUES (163, 45);
INSERT INTO public.film_actor VALUES (164, 15);
INSERT INTO public.film_actor VALUES (164, 23);
INSERT INTO public.film_actor VALUES (165, 72);
INSERT INTO public.film_actor VALUES (165, 95);
INSERT INTO public.film_actor VALUES (166, 25);
INSERT INTO public.film_actor VALUES (166, 38);
INSERT INTO public.film_actor VALUES (166, 55);
INSERT INTO public.film_actor VALUES (166, 61);
INSERT INTO public.film_actor VALUES (166, 68);
INSERT INTO public.film_actor VALUES (166, 86);
INSERT INTO public.film_actor VALUES (167, 17);
INSERT INTO public.film_actor VALUES (167, 25);
INSERT INTO public.film_actor VALUES (167, 63);
INSERT INTO public.film_actor VALUES (167, 72);
INSERT INTO public.film_actor VALUES (168, 32);
INSERT INTO public.film_actor VALUES (168, 56);
INSERT INTO public.film_actor VALUES (168, 92);
INSERT INTO public.film_actor VALUES (169, 6);
INSERT INTO public.film_actor VALUES (169, 78);
INSERT INTO public.film_actor VALUES (169, 93);
INSERT INTO public.film_actor VALUES (170, 7);
INSERT INTO public.film_actor VALUES (170, 15);
INSERT INTO public.film_actor VALUES (170, 27);
INSERT INTO public.film_actor VALUES (170, 33);
INSERT INTO public.film_actor VALUES (171, 49);
INSERT INTO public.film_actor VALUES (172, 57);
INSERT INTO public.film_actor VALUES (172, 100);
INSERT INTO public.film_actor VALUES (173, 49);
INSERT INTO public.film_actor VALUES (173, 55);
INSERT INTO public.film_actor VALUES (173, 74);
INSERT INTO public.film_actor VALUES (173, 80);
INSERT INTO public.film_actor VALUES (174, 11);
INSERT INTO public.film_actor VALUES (174, 61);
INSERT INTO public.film_actor VALUES (175, 9);
INSERT INTO public.film_actor VALUES (175, 29);
INSERT INTO public.film_actor VALUES (175, 67);
INSERT INTO public.film_actor VALUES (176, 13);
INSERT INTO public.film_actor VALUES (176, 73);
INSERT INTO public.film_actor VALUES (176, 89);
INSERT INTO public.film_actor VALUES (177, 12);
INSERT INTO public.film_actor VALUES (177, 39);
INSERT INTO public.film_actor VALUES (177, 52);
INSERT INTO public.film_actor VALUES (177, 55);
INSERT INTO public.film_actor VALUES (177, 86);
INSERT INTO public.film_actor VALUES (178, 30);
INSERT INTO public.film_actor VALUES (178, 34);
INSERT INTO public.film_actor VALUES (179, 24);
INSERT INTO public.film_actor VALUES (179, 27);
INSERT INTO public.film_actor VALUES (179, 65);
INSERT INTO public.film_actor VALUES (179, 85);
INSERT INTO public.film_actor VALUES (180, 12);
INSERT INTO public.film_actor VALUES (180, 33);
INSERT INTO public.film_actor VALUES (181, 5);
INSERT INTO public.film_actor VALUES (181, 40);
INSERT INTO public.film_actor VALUES (181, 74);
INSERT INTO public.film_actor VALUES (181, 78);
INSERT INTO public.film_actor VALUES (181, 83);
INSERT INTO public.film_actor VALUES (182, 33);
INSERT INTO public.film_actor VALUES (183, 32);
INSERT INTO public.film_actor VALUES (183, 40);
INSERT INTO public.film_actor VALUES (183, 71);
INSERT INTO public.film_actor VALUES (184, 35);
INSERT INTO public.film_actor VALUES (184, 87);
INSERT INTO public.film_actor VALUES (185, 7);
INSERT INTO public.film_actor VALUES (185, 95);
INSERT INTO public.film_actor VALUES (186, 95);
INSERT INTO public.film_actor VALUES (187, 17);
INSERT INTO public.film_actor VALUES (187, 25);
INSERT INTO public.film_actor VALUES (187, 29);
INSERT INTO public.film_actor VALUES (187, 51);
INSERT INTO public.film_actor VALUES (187, 73);
INSERT INTO public.film_actor VALUES (187, 76);
INSERT INTO public.film_actor VALUES (187, 98);
INSERT INTO public.film_actor VALUES (188, 1);
INSERT INTO public.film_actor VALUES (188, 10);
INSERT INTO public.film_actor VALUES (188, 14);
INSERT INTO public.film_actor VALUES (188, 51);
INSERT INTO public.film_actor VALUES (189, 43);
INSERT INTO public.film_actor VALUES (189, 82);
INSERT INTO public.film_actor VALUES (190, 38);
INSERT INTO public.film_actor VALUES (190, 54);
INSERT INTO public.film_actor VALUES (190, 62);
INSERT INTO public.film_actor VALUES (190, 87);
INSERT INTO public.film_actor VALUES (191, 16);
INSERT INTO public.film_actor VALUES (191, 39);
INSERT INTO public.film_actor VALUES (191, 84);
INSERT INTO public.film_actor VALUES (192, 16);
INSERT INTO public.film_actor VALUES (192, 69);
INSERT INTO public.film_actor VALUES (193, 44);
INSERT INTO public.film_actor VALUES (193, 80);
INSERT INTO public.film_actor VALUES (194, 9);
INSERT INTO public.film_actor VALUES (194, 42);
INSERT INTO public.film_actor VALUES (194, 67);
INSERT INTO public.film_actor VALUES (194, 86);
INSERT INTO public.film_actor VALUES (194, 88);
INSERT INTO public.film_actor VALUES (194, 98);
INSERT INTO public.film_actor VALUES (196, 64);
INSERT INTO public.film_actor VALUES (197, 6);
INSERT INTO public.film_actor VALUES (197, 29);
INSERT INTO public.film_actor VALUES (197, 63);
INSERT INTO public.film_actor VALUES (198, 1);
INSERT INTO public.film_actor VALUES (199, 67);
INSERT INTO public.film_actor VALUES (199, 84);
INSERT INTO public.film_actor VALUES (200, 5);
INSERT INTO public.film_actor VALUES (200, 49);
INSERT INTO public.film_actor VALUES (200, 80);


--
-- TOC entry 2972 (class 0 OID 18470)
-- Dependencies: 211
-- Data for Name: film_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.film_category VALUES (1, 6);
INSERT INTO public.film_category VALUES (2, 11);
INSERT INTO public.film_category VALUES (3, 6);
INSERT INTO public.film_category VALUES (4, 11);
INSERT INTO public.film_category VALUES (5, 8);
INSERT INTO public.film_category VALUES (6, 9);
INSERT INTO public.film_category VALUES (7, 5);
INSERT INTO public.film_category VALUES (8, 11);
INSERT INTO public.film_category VALUES (9, 11);
INSERT INTO public.film_category VALUES (10, 15);
INSERT INTO public.film_category VALUES (11, 9);
INSERT INTO public.film_category VALUES (12, 12);
INSERT INTO public.film_category VALUES (13, 11);
INSERT INTO public.film_category VALUES (14, 4);
INSERT INTO public.film_category VALUES (15, 9);
INSERT INTO public.film_category VALUES (16, 9);
INSERT INTO public.film_category VALUES (17, 12);
INSERT INTO public.film_category VALUES (18, 2);
INSERT INTO public.film_category VALUES (19, 1);
INSERT INTO public.film_category VALUES (20, 12);
INSERT INTO public.film_category VALUES (21, 1);
INSERT INTO public.film_category VALUES (22, 13);
INSERT INTO public.film_category VALUES (23, 2);
INSERT INTO public.film_category VALUES (24, 11);
INSERT INTO public.film_category VALUES (25, 13);
INSERT INTO public.film_category VALUES (26, 14);
INSERT INTO public.film_category VALUES (27, 15);
INSERT INTO public.film_category VALUES (28, 5);
INSERT INTO public.film_category VALUES (29, 1);
INSERT INTO public.film_category VALUES (30, 11);
INSERT INTO public.film_category VALUES (31, 8);
INSERT INTO public.film_category VALUES (32, 13);
INSERT INTO public.film_category VALUES (33, 7);
INSERT INTO public.film_category VALUES (34, 11);
INSERT INTO public.film_category VALUES (35, 11);
INSERT INTO public.film_category VALUES (36, 2);
INSERT INTO public.film_category VALUES (37, 4);
INSERT INTO public.film_category VALUES (38, 1);
INSERT INTO public.film_category VALUES (39, 14);
INSERT INTO public.film_category VALUES (40, 6);
INSERT INTO public.film_category VALUES (41, 16);
INSERT INTO public.film_category VALUES (42, 15);
INSERT INTO public.film_category VALUES (43, 8);
INSERT INTO public.film_category VALUES (44, 14);
INSERT INTO public.film_category VALUES (45, 13);
INSERT INTO public.film_category VALUES (46, 10);
INSERT INTO public.film_category VALUES (47, 9);
INSERT INTO public.film_category VALUES (48, 3);
INSERT INTO public.film_category VALUES (49, 14);
INSERT INTO public.film_category VALUES (50, 8);
INSERT INTO public.film_category VALUES (51, 12);
INSERT INTO public.film_category VALUES (52, 9);
INSERT INTO public.film_category VALUES (53, 8);
INSERT INTO public.film_category VALUES (54, 12);
INSERT INTO public.film_category VALUES (55, 14);
INSERT INTO public.film_category VALUES (56, 1);
INSERT INTO public.film_category VALUES (57, 16);
INSERT INTO public.film_category VALUES (58, 6);
INSERT INTO public.film_category VALUES (59, 3);
INSERT INTO public.film_category VALUES (60, 4);
INSERT INTO public.film_category VALUES (61, 7);
INSERT INTO public.film_category VALUES (62, 6);
INSERT INTO public.film_category VALUES (63, 8);
INSERT INTO public.film_category VALUES (64, 7);
INSERT INTO public.film_category VALUES (65, 11);
INSERT INTO public.film_category VALUES (66, 3);
INSERT INTO public.film_category VALUES (67, 1);
INSERT INTO public.film_category VALUES (68, 3);
INSERT INTO public.film_category VALUES (69, 14);
INSERT INTO public.film_category VALUES (70, 2);
INSERT INTO public.film_category VALUES (71, 8);
INSERT INTO public.film_category VALUES (72, 6);
INSERT INTO public.film_category VALUES (73, 14);
INSERT INTO public.film_category VALUES (74, 12);
INSERT INTO public.film_category VALUES (75, 16);
INSERT INTO public.film_category VALUES (76, 12);
INSERT INTO public.film_category VALUES (77, 13);
INSERT INTO public.film_category VALUES (78, 2);
INSERT INTO public.film_category VALUES (79, 7);
INSERT INTO public.film_category VALUES (80, 8);
INSERT INTO public.film_category VALUES (81, 14);
INSERT INTO public.film_category VALUES (82, 8);
INSERT INTO public.film_category VALUES (83, 8);
INSERT INTO public.film_category VALUES (84, 16);
INSERT INTO public.film_category VALUES (85, 6);
INSERT INTO public.film_category VALUES (86, 12);
INSERT INTO public.film_category VALUES (87, 16);
INSERT INTO public.film_category VALUES (88, 16);
INSERT INTO public.film_category VALUES (89, 2);
INSERT INTO public.film_category VALUES (90, 13);
INSERT INTO public.film_category VALUES (91, 4);
INSERT INTO public.film_category VALUES (92, 11);
INSERT INTO public.film_category VALUES (93, 13);
INSERT INTO public.film_category VALUES (94, 8);
INSERT INTO public.film_category VALUES (95, 13);
INSERT INTO public.film_category VALUES (96, 13);
INSERT INTO public.film_category VALUES (97, 1);
INSERT INTO public.film_category VALUES (98, 7);
INSERT INTO public.film_category VALUES (99, 5);
INSERT INTO public.film_category VALUES (100, 9);


--
-- TOC entry 2974 (class 0 OID 18476)
-- Dependencies: 213
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inventory VALUES (1, 1, 1);
INSERT INTO public.inventory VALUES (2, 1, 1);
INSERT INTO public.inventory VALUES (3, 1, 1);
INSERT INTO public.inventory VALUES (4, 1, 1);
INSERT INTO public.inventory VALUES (5, 1, 2);
INSERT INTO public.inventory VALUES (6, 1, 2);
INSERT INTO public.inventory VALUES (7, 1, 2);
INSERT INTO public.inventory VALUES (8, 1, 2);
INSERT INTO public.inventory VALUES (9, 2, 2);
INSERT INTO public.inventory VALUES (10, 2, 2);
INSERT INTO public.inventory VALUES (11, 2, 2);
INSERT INTO public.inventory VALUES (12, 3, 2);
INSERT INTO public.inventory VALUES (13, 3, 2);
INSERT INTO public.inventory VALUES (14, 3, 2);
INSERT INTO public.inventory VALUES (15, 3, 2);
INSERT INTO public.inventory VALUES (16, 4, 1);
INSERT INTO public.inventory VALUES (17, 4, 1);
INSERT INTO public.inventory VALUES (18, 4, 1);
INSERT INTO public.inventory VALUES (19, 4, 1);
INSERT INTO public.inventory VALUES (20, 4, 2);
INSERT INTO public.inventory VALUES (21, 4, 2);
INSERT INTO public.inventory VALUES (22, 4, 2);
INSERT INTO public.inventory VALUES (23, 5, 2);
INSERT INTO public.inventory VALUES (24, 5, 2);
INSERT INTO public.inventory VALUES (25, 5, 2);
INSERT INTO public.inventory VALUES (26, 6, 1);
INSERT INTO public.inventory VALUES (27, 6, 1);
INSERT INTO public.inventory VALUES (28, 6, 1);
INSERT INTO public.inventory VALUES (29, 6, 2);
INSERT INTO public.inventory VALUES (30, 6, 2);
INSERT INTO public.inventory VALUES (31, 6, 2);
INSERT INTO public.inventory VALUES (32, 7, 1);
INSERT INTO public.inventory VALUES (33, 7, 1);
INSERT INTO public.inventory VALUES (34, 7, 2);
INSERT INTO public.inventory VALUES (35, 7, 2);
INSERT INTO public.inventory VALUES (36, 7, 2);
INSERT INTO public.inventory VALUES (37, 8, 2);
INSERT INTO public.inventory VALUES (38, 8, 2);
INSERT INTO public.inventory VALUES (39, 8, 2);
INSERT INTO public.inventory VALUES (40, 8, 2);
INSERT INTO public.inventory VALUES (41, 9, 1);
INSERT INTO public.inventory VALUES (42, 9, 1);
INSERT INTO public.inventory VALUES (43, 9, 1);
INSERT INTO public.inventory VALUES (44, 9, 2);
INSERT INTO public.inventory VALUES (45, 9, 2);
INSERT INTO public.inventory VALUES (46, 10, 1);
INSERT INTO public.inventory VALUES (47, 10, 1);
INSERT INTO public.inventory VALUES (48, 10, 1);
INSERT INTO public.inventory VALUES (49, 10, 1);
INSERT INTO public.inventory VALUES (50, 10, 2);
INSERT INTO public.inventory VALUES (51, 10, 2);
INSERT INTO public.inventory VALUES (52, 10, 2);
INSERT INTO public.inventory VALUES (53, 11, 1);
INSERT INTO public.inventory VALUES (54, 11, 1);
INSERT INTO public.inventory VALUES (55, 11, 1);
INSERT INTO public.inventory VALUES (56, 11, 1);
INSERT INTO public.inventory VALUES (57, 11, 2);
INSERT INTO public.inventory VALUES (58, 11, 2);
INSERT INTO public.inventory VALUES (59, 11, 2);
INSERT INTO public.inventory VALUES (60, 12, 1);
INSERT INTO public.inventory VALUES (61, 12, 1);
INSERT INTO public.inventory VALUES (62, 12, 1);
INSERT INTO public.inventory VALUES (63, 12, 2);
INSERT INTO public.inventory VALUES (64, 12, 2);
INSERT INTO public.inventory VALUES (65, 12, 2);
INSERT INTO public.inventory VALUES (66, 12, 2);
INSERT INTO public.inventory VALUES (67, 13, 2);
INSERT INTO public.inventory VALUES (68, 13, 2);
INSERT INTO public.inventory VALUES (69, 13, 2);
INSERT INTO public.inventory VALUES (70, 13, 2);
INSERT INTO public.inventory VALUES (71, 15, 1);
INSERT INTO public.inventory VALUES (72, 15, 1);
INSERT INTO public.inventory VALUES (73, 15, 2);
INSERT INTO public.inventory VALUES (74, 15, 2);
INSERT INTO public.inventory VALUES (75, 15, 2);
INSERT INTO public.inventory VALUES (76, 15, 2);
INSERT INTO public.inventory VALUES (77, 16, 1);
INSERT INTO public.inventory VALUES (78, 16, 1);
INSERT INTO public.inventory VALUES (79, 16, 2);
INSERT INTO public.inventory VALUES (80, 16, 2);
INSERT INTO public.inventory VALUES (81, 17, 1);
INSERT INTO public.inventory VALUES (82, 17, 1);
INSERT INTO public.inventory VALUES (83, 17, 1);
INSERT INTO public.inventory VALUES (84, 17, 2);
INSERT INTO public.inventory VALUES (85, 17, 2);
INSERT INTO public.inventory VALUES (86, 17, 2);
INSERT INTO public.inventory VALUES (87, 18, 1);
INSERT INTO public.inventory VALUES (88, 18, 1);
INSERT INTO public.inventory VALUES (89, 18, 1);
INSERT INTO public.inventory VALUES (90, 18, 2);
INSERT INTO public.inventory VALUES (91, 18, 2);
INSERT INTO public.inventory VALUES (92, 18, 2);
INSERT INTO public.inventory VALUES (93, 19, 1);
INSERT INTO public.inventory VALUES (94, 19, 1);
INSERT INTO public.inventory VALUES (95, 19, 1);
INSERT INTO public.inventory VALUES (96, 19, 1);
INSERT INTO public.inventory VALUES (97, 19, 2);
INSERT INTO public.inventory VALUES (98, 19, 2);
INSERT INTO public.inventory VALUES (99, 20, 1);
INSERT INTO public.inventory VALUES (100, 20, 1);


--
-- TOC entry 2976 (class 0 OID 18483)
-- Dependencies: 215
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.language VALUES (1, 'English');
INSERT INTO public.language VALUES (2, 'Italian');
INSERT INTO public.language VALUES (3, 'Japanese');
INSERT INTO public.language VALUES (4, 'Mandarin');
INSERT INTO public.language VALUES (5, 'French');
INSERT INTO public.language VALUES (6, 'German');


--
-- TOC entry 2978 (class 0 OID 18490)
-- Dependencies: 217
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2980 (class 0 OID 18496)
-- Dependencies: 219
-- Data for Name: rental; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rental VALUES (64, '2005-05-25', 79, 368, '2005-06-03', 1);


--
-- TOC entry 2982 (class 0 OID 18503)
-- Dependencies: 221
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.staff VALUES (1, 'Mike', 'Hillyer', 3, 'Mike.Hillyer@sakilastaff.com', 1, true, 'Mike', '8cb2237d0679ca88db6464eac60da96345513964');
INSERT INTO public.staff VALUES (2, 'Jon', 'Stephens', 4, 'Jon.Stephens@sakilastaff.com', 2, true, 'Jon', '8cb2237d0679ca88db6464eac60da96345513964');


--
-- TOC entry 2984 (class 0 OID 18514)
-- Dependencies: 223
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.store VALUES (1, 1, 1);
INSERT INTO public.store VALUES (2, 2, 2);


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 196
-- Name: actor_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actor_actor_id_seq', 200, true);


--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 198
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_address_id_seq', 605, true);


--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 200
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 16, true);


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 202
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_city_id_seq', 600, true);


--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 204
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_country_id_seq', 109, true);


--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 206
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 599, true);


--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 208
-- Name: film_film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.film_film_id_seq', 1001, true);


--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 212
-- Name: inventory_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_inventory_id_seq', 4581, true);


--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 214
-- Name: language_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.language_language_id_seq', 6, true);


--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 216
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 32098, true);


--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 218
-- Name: rental_rental_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_rental_id_seq', 16049, true);


--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 220
-- Name: staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_staff_id_seq', 2, true);


--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 222
-- Name: store_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_store_id_seq', 2, true);


--
-- TOC entry 2772 (class 2606 OID 18520)
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (actor_id);


--
-- TOC entry 2775 (class 2606 OID 18522)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


--
-- TOC entry 2778 (class 2606 OID 18524)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- TOC entry 2780 (class 2606 OID 18526)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);


--
-- TOC entry 2783 (class 2606 OID 18528)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- TOC entry 2785 (class 2606 OID 18530)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 2794 (class 2606 OID 41051)
-- Name: film_actor film_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_actor
    ADD CONSTRAINT film_actor_pkey PRIMARY KEY (actor_id, film_id);


--
-- TOC entry 2797 (class 2606 OID 41075)
-- Name: film_category film_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT film_category_pkey PRIMARY KEY (film_id, category_id);


--
-- TOC entry 2790 (class 2606 OID 18536)
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (film_id);


--
-- TOC entry 2800 (class 2606 OID 18538)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id);


--
-- TOC entry 2802 (class 2606 OID 18540)
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);


--
-- TOC entry 2807 (class 2606 OID 18542)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 2811 (class 2606 OID 18544)
-- Name: rental rental_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_pkey PRIMARY KEY (rental_id);


--
-- TOC entry 2813 (class 2606 OID 18546)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);


--
-- TOC entry 2816 (class 2606 OID 18548)
-- Name: store store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (store_id);


--
-- TOC entry 2773 (class 1259 OID 18550)
-- Name: idx_actor_last_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_actor_last_name ON public.actor USING btree (last_name);


--
-- TOC entry 2786 (class 1259 OID 18551)
-- Name: idx_fk_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_address_id ON public.customer USING btree (address_id);


--
-- TOC entry 2776 (class 1259 OID 18552)
-- Name: idx_fk_city_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_city_id ON public.address USING btree (city_id);


--
-- TOC entry 2781 (class 1259 OID 18553)
-- Name: idx_fk_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_country_id ON public.city USING btree (country_id);


--
-- TOC entry 2803 (class 1259 OID 18554)
-- Name: idx_fk_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_customer_id ON public.payment USING btree (customer_id);


--
-- TOC entry 2795 (class 1259 OID 41052)
-- Name: idx_fk_film_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_film_id ON public.film_actor USING btree (film_id);


--
-- TOC entry 2808 (class 1259 OID 18556)
-- Name: idx_fk_inventory_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_inventory_id ON public.rental USING btree (inventory_id);


--
-- TOC entry 2791 (class 1259 OID 18557)
-- Name: idx_fk_language_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_language_id ON public.film USING btree (language_id);


--
-- TOC entry 2804 (class 1259 OID 18558)
-- Name: idx_fk_rental_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_rental_id ON public.payment USING btree (rental_id);


--
-- TOC entry 2805 (class 1259 OID 18559)
-- Name: idx_fk_staff_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_staff_id ON public.payment USING btree (staff_id);


--
-- TOC entry 2787 (class 1259 OID 18560)
-- Name: idx_fk_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_store_id ON public.customer USING btree (store_id);


--
-- TOC entry 2788 (class 1259 OID 18561)
-- Name: idx_last_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_last_name ON public.customer USING btree (last_name);


--
-- TOC entry 2798 (class 1259 OID 18562)
-- Name: idx_store_id_film_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_store_id_film_id ON public.inventory USING btree (store_id, film_id);


--
-- TOC entry 2792 (class 1259 OID 18563)
-- Name: idx_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_title ON public.film USING btree (title);


--
-- TOC entry 2814 (class 1259 OID 18564)
-- Name: idx_unq_manager_staff_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_unq_manager_staff_id ON public.store USING btree (manager_staff_id);


--
-- TOC entry 2809 (class 1259 OID 43257)
-- Name: idx_unq_rental_rental_date_inventory_id_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_unq_rental_rental_date_inventory_id_customer_id ON public.rental USING btree (rental_date, inventory_id, customer_id);


--
-- TOC entry 2835 (class 2620 OID 18566)
-- Name: film film_fulltext_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER film_fulltext_trigger BEFORE INSERT OR UPDATE ON public.film FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('fulltext', 'pg_catalog.english', 'title', 'description');


--
-- TOC entry 2819 (class 2606 OID 18567)
-- Name: customer customer_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2821 (class 2606 OID 41040)
-- Name: film_actor film_actor_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_actor
    ADD CONSTRAINT film_actor_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actor(actor_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2822 (class 2606 OID 41053)
-- Name: film_actor film_actor_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_actor
    ADD CONSTRAINT film_actor_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film(film_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2824 (class 2606 OID 41076)
-- Name: film_category film_category_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT film_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2823 (class 2606 OID 41065)
-- Name: film_category film_category_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT film_category_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film(film_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2820 (class 2606 OID 18592)
-- Name: film film_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.language(language_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2817 (class 2606 OID 18597)
-- Name: address fk_address_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT fk_address_city FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- TOC entry 2818 (class 2606 OID 18602)
-- Name: city fk_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT fk_city FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- TOC entry 2825 (class 2606 OID 18607)
-- Name: inventory inventory_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film(film_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2826 (class 2606 OID 18612)
-- Name: payment payment_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2827 (class 2606 OID 18617)
-- Name: payment payment_rental_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_rental_id_fkey FOREIGN KEY (rental_id) REFERENCES public.rental(rental_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2828 (class 2606 OID 18622)
-- Name: payment payment_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2829 (class 2606 OID 18627)
-- Name: rental rental_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2830 (class 2606 OID 18632)
-- Name: rental rental_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES public.inventory(inventory_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2831 (class 2606 OID 18637)
-- Name: rental rental_staff_id_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_staff_id_key FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id);


--
-- TOC entry 2832 (class 2606 OID 18642)
-- Name: staff staff_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2833 (class 2606 OID 18647)
-- Name: store store_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2834 (class 2606 OID 18652)
-- Name: store store_manager_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_manager_staff_id_fkey FOREIGN KEY (manager_staff_id) REFERENCES public.staff(staff_id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2021-01-16 10:44:32

--
-- PostgreSQL database dump complete
--

