--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(100) NOT NULL,
    age integer,
    radius integer,
    apparent_magnitude numeric(4,1),
    is_expanding boolean,
    is_in_orbit boolean,
    notes text
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
    name character varying(100) NOT NULL,
    age integer,
    radius integer,
    apparent_magnitude numeric(4,1),
    is_expanding boolean,
    is_in_orbit boolean,
    planet_id integer,
    notes text
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
    name character varying(100) NOT NULL,
    age integer,
    radius integer,
    apparent_magnitude numeric(4,1),
    is_expanding boolean,
    is_in_orbit boolean,
    star_id integer,
    notes text
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
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    belongs_to character varying(60),
    life_span integer NOT NULL,
    notes text,
    name character varying(60) NOT NULL
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_id_seq OWNER TO freecodecamp;

--
-- Name: species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age integer,
    radius integer,
    apparent_magnitude numeric(4,1),
    is_expanding boolean,
    is_in_orbit boolean,
    galaxy_id integer,
    notes text
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
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 13, 0, -6.0, true, true, 'no');
INSERT INTO public.galaxy VALUES (2, 'andromeda', 160, 49, 9.0, true, true, 'noo');
INSERT INTO public.galaxy VALUES (3, 'magellanic', 200, 61, 2.0, true, true, 'nooo');
INSERT INTO public.galaxy VALUES (4, 'large magellanic', 3, 770, 3.0, true, true, 'nooooo');
INSERT INTO public.galaxy VALUES (5, 'triangulum', 3, 890, 6.0, true, true, 'nooooooooooo');
INSERT INTO public.galaxy VALUES (6, 'sculptor', 3, 890, 6.0, true, true, 'nooooooooooooooo');
INSERT INTO public.galaxy VALUES (7, 'bodes', 3, 890, 6.0, true, true, 'yes');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 13, 0, -6.0, true, true, 3, 'no');
INSERT INTO public.moon VALUES (2, 'europa', 160, 49, 9.0, true, true, 6, 'noo');
INSERT INTO public.moon VALUES (3, 'titan', 200, 61, 2.0, true, true, 6, 'nooo');
INSERT INTO public.moon VALUES (4, 'Ganymede', 3, 770, 3.0, true, true, 7, 'nooooo');
INSERT INTO public.moon VALUES (5, 'Io', 3, 890, 6.0, true, true, 15, 'nooooooooooo');
INSERT INTO public.moon VALUES (7, 'mimas', 3, 890, 6.0, true, true, 6, 'yes');
INSERT INTO public.moon VALUES (12, 'hyperion', 3, 890, 6.0, true, true, 11, 'nooooooooooooooo');
INSERT INTO public.moon VALUES (8, 'triton', 160, 49, 9.0, true, true, 7, 'oo');
INSERT INTO public.moon VALUES (9, 'enceladus', 200, 61, 2.0, true, true, 8, 'ooo');
INSERT INTO public.moon VALUES (10, 'lapetus', 3, 770, 3.0, true, true, 9, 'ooooo');
INSERT INTO public.moon VALUES (11, 'epimetheus', 3, 890, 6.0, true, true, 14, 'ooooooooooo');
INSERT INTO public.moon VALUES (13, 'locaste', 3, 890, 6.0, true, true, 11, 'yeqwes');
INSERT INTO public.moon VALUES (15, 'kalyke', 200, 61, 2.0, true, true, 12, 'noooadsa');
INSERT INTO public.moon VALUES (16, 'elara', 3, 770, 3.0, true, true, 13, 'nooooozxcz');
INSERT INTO public.moon VALUES (17, 'himalia', 3, 890, 6.0, true, true, 1, 'nooooohjkhjoooooo');
INSERT INTO public.moon VALUES (18, 'ananke', 3, 890, 6.0, true, true, 1, 'noooooooooqqqoooooo');
INSERT INTO public.moon VALUES (19, 'carme', 3, 890, 6.0, true, true, 1, 'yes1');
INSERT INTO public.moon VALUES (20, 'isonoe', 3, 890, 6.0, true, true, 1, 'yes2');
INSERT INTO public.moon VALUES (21, 'harpalyke', 3, 890, 6.0, true, true, 1, 'yessss');
INSERT INTO public.moon VALUES (14, 'amalthea', 160, 49, 9.0, true, true, 12, 'nooooob');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 13, 0, -6.0, true, true, 1, 'no');
INSERT INTO public.planet VALUES (2, 'venus', 160, 49, 9.0, true, true, 1, 'noo');
INSERT INTO public.planet VALUES (3, 'earth', 200, 61, 2.0, true, true, 1, 'nooo');
INSERT INTO public.planet VALUES (4, 'mars', 3, 770, 3.0, true, true, 1, 'nooooo');
INSERT INTO public.planet VALUES (5, 'jupiter', 3, 890, 6.0, true, true, 1, 'nooooooooooo');
INSERT INTO public.planet VALUES (6, 'uranus', 3, 890, 6.0, true, true, 1, 'noasdaoooooooooooooo');
INSERT INTO public.planet VALUES (7, 'neptune', 3, 890, 6.0, true, true, 1, 'yeasds');
INSERT INTO public.planet VALUES (8, 'pluto', 160, 49, 9.0, true, true, 1, 'noasdo');
INSERT INTO public.planet VALUES (9, 'planet 9', 200, 61, 2.0, true, true, 1, 'nooasdo');
INSERT INTO public.planet VALUES (11, 'triangulum', 3, 890, 6.0, true, true, 3, 'noooooooooaweoo');
INSERT INTO public.planet VALUES (12, 'sculptor', 3, 890, 6.0, true, true, 4, 'noooooooooooooqweoo');
INSERT INTO public.planet VALUES (13, 'bodes', 3, 890, 6.0, true, true, 5, 'yes');
INSERT INTO public.planet VALUES (14, 'andromeda', 160, 49, 9.0, true, true, 6, 'noqwo');
INSERT INTO public.planet VALUES (15, 'magellanic', 200, 61, 2.0, true, true, 6, 'nooao');


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'earth', 60, 'omnivores', 'human');
INSERT INTO public.species VALUES (2, 'earth', 1, 'can also live upto 2 years', 'rat');
INSERT INTO public.species VALUES (3, 'unknown', 100, 'thier life span is a lie', 'aliens');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'ASASSN-V J1', 19, 11, 15.5, true, true, 1, 'no');
INSERT INTO public.star VALUES (2, 'ASASSN-V J2', 21, -70, 14.2, true, true, 1, 'noo');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 5, 7, 0.5, true, true, 2, 'nooo');
INSERT INTO public.star VALUES (4, 'EPIC 2042', 16, -22, 13.7, true, true, 2, 'nooooo');
INSERT INTO public.star VALUES (5, 'EPIC 2043', 4, -21, 0.0, true, true, 2, 'nooooooooooo');
INSERT INTO public.star VALUES (6, 'HD 139139', 15, -19, 9.8, true, true, 3, 'nooooooooooooooo');
INSERT INTO public.star VALUES (7, 'KH 15D', 6, 9, 15.7, true, true, 2, 'yes');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_notes_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_notes_key UNIQUE (notes);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_notes_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_notes_key UNIQUE (notes);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_notes_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_notes_key UNIQUE (notes);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: species species_notes_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_notes_key UNIQUE (notes);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


--
-- Name: star star_notes_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_notes_key UNIQUE (notes);


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

