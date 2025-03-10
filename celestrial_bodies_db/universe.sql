--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(60) NOT NULL,
    size integer,
    travelable boolean NOT NULL,
    creation_date character varying(10) NOT NULL,
    largest_element text
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
-- Name: life; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life (
    life_id integer NOT NULL,
    name character varying(100) NOT NULL,
    classification text NOT NULL,
    habitat text NOT NULL,
    intelligence_level integer,
    planet_id integer,
    moon_id integer,
    CONSTRAINT life_intelligence_level_check CHECK (((intelligence_level >= 1) AND (intelligence_level <= 10))),
    CONSTRAINT life_location_check CHECK ((((planet_id IS NOT NULL) AND (moon_id IS NULL)) OR ((moon_id IS NOT NULL) AND (planet_id IS NULL)) OR ((planet_id IS NOT NULL) AND (moon_id IS NOT NULL))))
);


ALTER TABLE public.life OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_life_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_life_id_seq OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_life_id_seq OWNED BY public.life.life_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    size integer,
    color text,
    creation_date character varying(10) NOT NULL,
    largest_element text,
    life boolean,
    life_count numeric,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    size integer,
    color text,
    creation_date character varying(10) NOT NULL,
    largest_element text,
    life boolean,
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
    name character varying(60) NOT NULL,
    size integer,
    color text,
    creation_date character varying(10) NOT NULL,
    largest_element text,
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
-- Name: life life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life ALTER COLUMN life_id SET DEFAULT nextval('public.life_life_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 220000, true, '2025-03-10', 'Hydrogen');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 100000, true, '2025-03-10', 'Helium');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, false, '2025-03-10', 'Oxygen');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 120000, false, '2025-03-10', 'Carbon');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 76000, true, '2025-03-10', 'Nitrogen');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 50000, false, '2025-03-10', 'Iron');


--
-- Data for Name: life; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life VALUES (1, 'Xylogon', 'Extraterrestrial', 'Gas Giant', 9, 1, NULL);
INSERT INTO public.life VALUES (2, 'Aquafera', 'Amphibious Mammal', 'Water', 6, 5, NULL);
INSERT INTO public.life VALUES (3, 'Cryobacteria', 'Microorganism', 'Frozen Planet', 2, NULL, 15);
INSERT INTO public.life VALUES (4, 'Glacilith', 'Ice-Based Organism', 'Frozen Crust', 4, NULL, 15);
INSERT INTO public.life VALUES (5, 'Tritonic Worms', 'Worm-like Organism', 'Subsurface Oceans', 3, NULL, 10);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3500, 'Gray', '2025-03-10', 'Silicon', false, 0, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 2200, 'Brown', '2025-03-10', 'Iron', false, 0, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', 1200, 'Red', '2025-03-10', 'Carbon', false, 0, 1);
INSERT INTO public.moon VALUES (4, 'Titan', 5150, 'Yellow', '2025-03-10', 'Methane', true, 500, 2);
INSERT INTO public.moon VALUES (5, 'Europa', 3120, 'White', '2025-03-10', 'Water', true, 300, 2);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, 'Gray', '2025-03-10', 'Silicate', false, 0, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 4800, 'Dark Gray', '2025-03-10', 'Ice', false, 0, 3);
INSERT INTO public.moon VALUES (8, 'Io', 3660, 'Yellow', '2025-03-10', 'Sulfur', false, 0, 4);
INSERT INTO public.moon VALUES (9, 'Oberon', 1522, 'Dark Brown', '2025-03-10', 'Iron', false, 0, 4);
INSERT INTO public.moon VALUES (10, 'Triton', 2706, 'Blue', '2025-03-10', 'Nitrogen', true, 200, 5);
INSERT INTO public.moon VALUES (11, 'Miranda', 471, 'Gray', '2025-03-10', 'Rock', false, 0, 5);
INSERT INTO public.moon VALUES (12, 'Ariel', 1157, 'Light Gray', '2025-03-10', 'Water Ice', false, 0, 6);
INSERT INTO public.moon VALUES (13, 'Umbriel', 1169, 'Dark Gray', '2025-03-10', 'Carbon', false, 0, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 1123, 'White', '2025-03-10', 'Ice', false, 0, 7);
INSERT INTO public.moon VALUES (15, 'Rhea', 1527, 'White', '2025-03-10', 'Ice', false, 0, 7);
INSERT INTO public.moon VALUES (16, 'Enceladus', 504, 'White', '2025-03-10', 'Water', true, 100, 8);
INSERT INTO public.moon VALUES (17, 'Iapetus', 1469, 'Two-Tone', '2025-03-10', 'Ice', false, 0, 8);
INSERT INTO public.moon VALUES (18, 'Hyperion', 270, 'Brown', '2025-03-10', 'Porous Rock', false, 0, 9);
INSERT INTO public.moon VALUES (19, 'Charon', 1212, 'Gray', '2025-03-10', 'Rock', false, 0, 10);
INSERT INTO public.moon VALUES (20, 'Nereid', 340, 'Gray', '2025-03-10', 'Rock', false, 0, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima b', 12000, 'Blue', '2025-03-10', 'Oxygen', true, 1);
INSERT INTO public.planet VALUES (2, 'Kepler-22b', 15000, 'Green', '2025-03-10', 'Water', true, 1);
INSERT INTO public.planet VALUES (3, 'HD 209458 b', 18000, 'Gray', '2025-03-10', 'Hydrogen', false, 2);
INSERT INTO public.planet VALUES (4, 'Gliese 581g', 13000, 'Brown', '2025-03-10', 'Carbon', true, 2);
INSERT INTO public.planet VALUES (5, '55 Cancri e', 14000, 'Black', '2025-03-10', 'Diamond', false, 3);
INSERT INTO public.planet VALUES (6, 'TOI 700 d', 17000, 'Blue-Green', '2025-03-10', 'Oxygen', true, 3);
INSERT INTO public.planet VALUES (7, 'TRAPPIST-1e', 11000, 'Orange', '2025-03-10', 'Iron', true, 4);
INSERT INTO public.planet VALUES (8, 'LHS 1140 b', 19000, 'Gray', '2025-03-10', 'Silicon', false, 4);
INSERT INTO public.planet VALUES (9, 'GJ 1214 b', 16000, 'Blue', '2025-03-10', 'Water', false, 5);
INSERT INTO public.planet VALUES (10, 'Ross 128 b', 13500, 'Red', '2025-03-10', 'Oxygen', true, 5);
INSERT INTO public.planet VALUES (11, 'WASP-12b', 17500, 'Yellow', '2025-03-10', 'Hydrogen', false, 6);
INSERT INTO public.planet VALUES (12, 'K2-18b', 14500, 'Green', '2025-03-10', 'Methane', true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1700000, 'Blue-White', '2025-03-10', 'Hydrogen', 2);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1400000, 'Red', '2025-03-10', 'Helium', 1);
INSERT INTO public.star VALUES (3, 'Rigel', 1800000, 'Blue', '2025-03-10', 'Oxygen', 3);
INSERT INTO public.star VALUES (4, 'Vega', 2100000, 'White', '2025-03-10', 'Hydrogen', 5);
INSERT INTO public.star VALUES (5, 'Antares', 1600000, 'Red', '2025-03-10', 'Carbon', 4);
INSERT INTO public.star VALUES (6, 'Altair', 1900000, 'White', '2025-03-10', 'Helium', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: life_life_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_life_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: life life_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_name_unique UNIQUE (name);


--
-- Name: life life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_pkey PRIMARY KEY (life_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: life life_moon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_moon_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id) ON DELETE CASCADE;


--
-- Name: life life_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


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

