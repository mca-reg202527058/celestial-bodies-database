-- PostgreSQL database dump for freeCodeCamp Celestial Bodies

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

DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;

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

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    meaning character varying(50) NOT NULL,
    is_visible boolean NOT NULL
);

ALTER TABLE public.constellation OWNER TO freecodecamp;

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    galaxy_types character varying(30) NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    has_life boolean NOT NULL
);

ALTER TABLE public.galaxy OWNER TO freecodecamp;

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_type character varying(30) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth integer
);

ALTER TABLE public.star OWNER TO freecodecamp;

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_type character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth integer
);

ALTER TABLE public.planet OWNER TO freecodecamp;

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth integer
);

ALTER TABLE public.moon OWNER TO freecodecamp;

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);
ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);
ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);
ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);
ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 13600.5, 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 'Spiral', 10000.0, 2500000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest local group member', 'Spiral', 12000.0, 3000000, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unusual outer ring', 'Elliptical', 13000.0, 29000000, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Interacting grand-design spiral', 'Spiral', 400.0, 23000000, false);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Dark band of absorbing dust', 'Spiral', 13200.0, 17000000, false);

INSERT INTO public.star VALUES (1, 1, 'Sun', 'Yellow Dwarf', true, 0);
INSERT INTO public.star VALUES (2, 1, 'Sirius', 'Main Sequence', true, 8);
INSERT INTO public.star VALUES (3, 1, 'Betelgeuse', 'Red Supergiant', true, 642);
INSERT INTO public.star VALUES (4, 2, 'Andromeda Star A', 'Blue Giant', true, 2500000);
INSERT INTO public.star VALUES (5, 3, 'Triangulum Star A', 'Red Dwarf', true, 3000000);
INSERT INTO public.star VALUES (6, 4, 'Sombrero Star A', 'White Dwarf', true, 29000000);

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Terrestrial', false, true, 91);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Terrestrial', false, true, 41);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Terrestrial', true, true, 0);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Terrestrial', false, true, 78);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Gas Giant', false, true, 628);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Gas Giant', false, true, 1275);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Ice Giant', false, true, 2724);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Ice Giant', false, true, 4351);
INSERT INTO public.planet VALUES (9, 2, 'Proxima B', 'Exoplanet', false, true, 4);
INSERT INTO public.planet VALUES (10, 3, 'Kepler 22b', 'Exoplanet', false, true, 600);
INSERT INTO public.planet VALUES (11, 4, 'Gliese 581g', 'Exoplanet', false, true, 20);
INSERT INTO public.planet VALUES (12, 5, 'TRAPPIST 1e', 'Exoplanet', false, true, 40);

INSERT INTO public.moon VALUES (1, 3, 'Moon', true, 1);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', false, 78);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', false, 78);
INSERT INTO public.moon VALUES (4, 5, 'Io', true, 628);
INSERT INTO public.moon VALUES (5, 5, 'Europa', true, 628);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', true, 628);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', true, 628);
INSERT INTO public.moon VALUES (8, 6, 'Titan', true, 1275);
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', true, 1275);
INSERT INTO public.moon VALUES (10, 6, 'Mimas', true, 1275);
INSERT INTO public.moon VALUES (11, 6, 'Iapetus', true, 1275);
INSERT INTO public.moon VALUES (12, 6, 'Rhea', true, 1275);
INSERT INTO public.moon VALUES (13, 7, 'Titania', true, 2724);
INSERT INTO public.moon VALUES (14, 7, 'Oberon', true, 2724);
INSERT INTO public.moon VALUES (15, 7, 'Umbriel', true, 2724);
INSERT INTO public.moon VALUES (16, 8, 'Triton', true, 4351);
INSERT INTO public.moon VALUES (17, 8, 'Proteus', false, 4351);
INSERT INTO public.moon VALUES (18, 9, 'ExoMoon 1', false, 4);
INSERT INTO public.moon VALUES (19, 10, 'ExoMoon 2', false, 600);
INSERT INTO public.moon VALUES (20, 11, 'ExoMoon 3', false, 20);

INSERT INTO public.constellation VALUES (1, 'Orion', 'The Hunter', true);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'The Great Bear', true);
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 'The Queen', true);

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);
SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);
SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);
SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);
SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);

ALTER TABLE ONLY public.constellation ADD CONSTRAINT constellation_name_key UNIQUE (name);
ALTER TABLE ONLY public.constellation ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);

ALTER TABLE ONLY public.galaxy ADD CONSTRAINT galaxy_name_key UNIQUE (name);
ALTER TABLE ONLY public.galaxy ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

ALTER TABLE ONLY public.star ADD CONSTRAINT star_name_key UNIQUE (name);
ALTER TABLE ONLY public.star ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);

ALTER TABLE ONLY public.planet ADD CONSTRAINT planet_name_key UNIQUE (name);
ALTER TABLE ONLY public.planet ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

ALTER TABLE ONLY public.moon ADD CONSTRAINT moon_name_key UNIQUE (name);
ALTER TABLE ONLY public.moon ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

ALTER TABLE ONLY public.star ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);
ALTER TABLE ONLY public.planet ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);
ALTER TABLE ONLY public.moon ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);