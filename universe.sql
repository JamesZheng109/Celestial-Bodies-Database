--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_type text,
    diameters integer,
    has_planets boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    is_spherical boolean,
    diameter_km numeric,
    radius_km numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: record; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.record (
    record_id integer NOT NULL,
    record text NOT NULL,
    recorded_on date NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.record OWNER TO freecodecamp;

--
-- Name: notes_record_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.notes_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_record_id_seq OWNER TO freecodecamp;

--
-- Name: notes_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.notes_record_id_seq OWNED BY public.record.record_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    diameter_km numeric,
    is_solid boolean,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_type text,
    light_years integer,
    is_alive boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: record record_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.record ALTER COLUMN record_id SET DEFAULT nextval('public.notes_record_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sb; Sbc; SB(rs)b', 100000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'SA(s)b', 200000, true);
INSERT INTO public.galaxy VALUES (3, 'Bear Claw', 'SB(rs)dm', 13000, false);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 'SAB(rs)cd', 170000, false);
INSERT INTO public.galaxy VALUES (5, 'Knife Edge', 'SA(s)c', 150000, false);
INSERT INTO public.galaxy VALUES (6, 'Sunflower', 'SA(rs)bc', 85000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 3476, 1738, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', true, 22.2, 11.1, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', true, 12.6, 6.3, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', true, 5262, 2631, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', true, 4820.6, 2410.3, 5);
INSERT INTO public.moon VALUES (6, 'Io', true, 3642, 1821, 5);
INSERT INTO public.moon VALUES (7, 'Europa', true, 3113, 1556.5, 5);
INSERT INTO public.moon VALUES (8, 'Titan', true, 5150, 2575, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, 500, 250, 6);
INSERT INTO public.moon VALUES (10, 'Hyperion', false, 270, 135, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', true, 792.4, 396.4, 6);
INSERT INTO public.moon VALUES (12, 'Phoebe', false, 426, 213, 6);
INSERT INTO public.moon VALUES (13, 'Titania', true, 1578, 789, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', true, 1522.8, 761.4, 7);
INSERT INTO public.moon VALUES (15, 'Ariel', true, 1157.8, 578.9, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', true, 1169.4, 584.7, 7);
INSERT INTO public.moon VALUES (17, 'Triton', true, 2710, 1355, 8);
INSERT INTO public.moon VALUES (18, 'Nereid', true, 360, 180, 8);
INSERT INTO public.moon VALUES (19, 'Charon', true, 1212, 606, 9);
INSERT INTO public.moon VALUES (20, 'Nix', false, 99.6, 49.8, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4880, true, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, true, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, true, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 116460, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, false, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49244, false, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 2370, true, false, 1);
INSERT INTO public.planet VALUES (10, 'OGLE-2005-BLG-390Lb', NULL, true, NULL, 2);
INSERT INTO public.planet VALUES (11, 'MOA-2007-BLG-192Lb', NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (12, 'CoRoT-7b', 10070, true, false, 4);


--
-- Data for Name: record; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.record VALUES (1, 'Created database. No issues occured.', '2025-12-15', 'J');
INSERT INTO public.record VALUES (2, 'Planning out schema. It took a while, but I was able to come up with something.', '2025-12-15', 'J');
INSERT INTO public.record VALUES (3, 'Created tables. No issues occured.', '2025-12-15', 'J');
INSERT INTO public.record VALUES (4, 'Searching for info. It took a while, but found enough data to start.', '2025-12-15', 'J');
INSERT INTO public.record VALUES (5, 'Created add data to tables. No issues occured.', '2025-12-15', 'J');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', 0, true, 1);
INSERT INTO public.star VALUES (2, 'OGLE-2005-BLG-390L', 'Red Dwarf', 21500, false, 1);
INSERT INTO public.star VALUES (3, 'MOA-2007-BLG-192L', 'Red Dwarf', 7000, false, 1);
INSERT INTO public.star VALUES (4, 'CoRoT-7', 'Binary Star System', 520, false, 1);
INSERT INTO public.star VALUES (5, 'Alpheratz', 'Binary System', 97, false, 2);
INSERT INTO public.star VALUES (6, 'Mirach', 'Brown Dwarf', 199, true, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: notes_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.notes_record_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: record notes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT notes_pkey PRIMARY KEY (record_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: record record_record; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_record UNIQUE (record);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

