--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accesos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accesos (
    idacceso integer NOT NULL,
    token character varying(32),
    fecha_inicio timestamp without time zone,
    fecha_fin timestamp without time zone,
    ip_origen character varying(16)
);


ALTER TABLE public.accesos OWNER TO postgres;

--
-- Name: accesos_idacceso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accesos_idacceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accesos_idacceso_seq OWNER TO postgres;

--
-- Name: accesos_idacceso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accesos_idacceso_seq OWNED BY public.accesos.idacceso;


--
-- Name: alumno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumno (
    idalumno integer NOT NULL,
    nocontrol character varying(10),
    nombre character varying(100),
    apepaterno character varying(100),
    apematerno character varying(100),
    email character varying(100),
    idcarrera integer
);


ALTER TABLE public.alumno OWNER TO postgres;

--
-- Name: alumno_idalumno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alumno_idalumno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alumno_idalumno_seq OWNER TO postgres;

--
-- Name: alumno_idalumno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumno_idalumno_seq OWNED BY public.alumno.idalumno;


--
-- Name: carrera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carrera (
    idcarrera integer NOT NULL,
    nombre character varying(100)
);


ALTER TABLE public.carrera OWNER TO postgres;

--
-- Name: carrera_idcarrera_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrera_idcarrera_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrera_idcarrera_seq OWNER TO postgres;

--
-- Name: carrera_idcarrera_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrera_idcarrera_seq OWNED BY public.carrera.idcarrera;


--
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamento (
    iddepartamento integer NOT NULL,
    descripcion character varying(100)
);


ALTER TABLE public.departamento OWNER TO postgres;

--
-- Name: departamento_iddepartamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamento_iddepartamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departamento_iddepartamento_seq OWNER TO postgres;

--
-- Name: departamento_iddepartamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamento_iddepartamento_seq OWNED BY public.departamento.iddepartamento;


--
-- Name: grupo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupo (
    idgrupo integer NOT NULL,
    idmateria integer,
    idmaestro integer
);


ALTER TABLE public.grupo OWNER TO postgres;

--
-- Name: grupo_idgrupo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupo_idgrupo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupo_idgrupo_seq OWNER TO postgres;

--
-- Name: grupo_idgrupo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupo_idgrupo_seq OWNED BY public.grupo.idgrupo;


--
-- Name: kardex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kardex (
    idmateria integer NOT NULL,
    idalumno integer NOT NULL,
    idoportunidad integer NOT NULL,
    calificacion integer,
    semestre integer
);


ALTER TABLE public.kardex OWNER TO postgres;

--
-- Name: lista; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lista (
    idgrupo integer NOT NULL,
    idalumno integer NOT NULL,
    periodo character varying(10)
);


ALTER TABLE public.lista OWNER TO postgres;

--
-- Name: maestro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maestro (
    idmaestro integer NOT NULL,
    rfc character varying(13),
    nombre character varying(100),
    apepaterno character varying(100),
    apematerno character varying(100),
    email character varying(100),
    idcarrera integer,
    iddepartamento integer
);


ALTER TABLE public.maestro OWNER TO postgres;

--
-- Name: maestro_idmaestro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maestro_idmaestro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maestro_idmaestro_seq OWNER TO postgres;

--
-- Name: maestro_idmaestro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maestro_idmaestro_seq OWNED BY public.maestro.idmaestro;


--
-- Name: materia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materia (
    idmateria integer NOT NULL,
    nombre character varying(100)
);


ALTER TABLE public.materia OWNER TO postgres;

--
-- Name: materia_idmateria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materia_idmateria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materia_idmateria_seq OWNER TO postgres;

--
-- Name: materia_idmateria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materia_idmateria_seq OWNED BY public.materia.idmateria;


--
-- Name: oportunidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oportunidad (
    idoportunidad integer NOT NULL,
    descripcion character varying(100)
);


ALTER TABLE public.oportunidad OWNER TO postgres;

--
-- Name: oportunidad_idoportunidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oportunidad_idoportunidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oportunidad_idoportunidad_seq OWNER TO postgres;

--
-- Name: oportunidad_idoportunidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oportunidad_idoportunidad_seq OWNED BY public.oportunidad.idoportunidad;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    idusuario integer NOT NULL,
    usuario character varying(20),
    contrasena character varying(32),
    idalumno integer
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_idusuario_seq OWNER TO postgres;

--
-- Name: usuario_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_idusuario_seq OWNED BY public.usuario.idusuario;


--
-- Name: accesos idacceso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accesos ALTER COLUMN idacceso SET DEFAULT nextval('public.accesos_idacceso_seq'::regclass);


--
-- Name: alumno idalumno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno ALTER COLUMN idalumno SET DEFAULT nextval('public.alumno_idalumno_seq'::regclass);


--
-- Name: carrera idcarrera; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera ALTER COLUMN idcarrera SET DEFAULT nextval('public.carrera_idcarrera_seq'::regclass);


--
-- Name: departamento iddepartamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento ALTER COLUMN iddepartamento SET DEFAULT nextval('public.departamento_iddepartamento_seq'::regclass);


--
-- Name: grupo idgrupo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo ALTER COLUMN idgrupo SET DEFAULT nextval('public.grupo_idgrupo_seq'::regclass);


--
-- Name: maestro idmaestro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maestro ALTER COLUMN idmaestro SET DEFAULT nextval('public.maestro_idmaestro_seq'::regclass);


--
-- Name: materia idmateria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materia ALTER COLUMN idmateria SET DEFAULT nextval('public.materia_idmateria_seq'::regclass);


--
-- Name: oportunidad idoportunidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oportunidad ALTER COLUMN idoportunidad SET DEFAULT nextval('public.oportunidad_idoportunidad_seq'::regclass);


--
-- Name: usuario idusuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN idusuario SET DEFAULT nextval('public.usuario_idusuario_seq'::regclass);


--
-- Data for Name: accesos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accesos (idacceso, token, fecha_inicio, fecha_fin, ip_origen) FROM stdin;
1	55edc2d17181d77ae02123d500ece338	2018-09-12 09:45:47.94684	2018-09-12 10:15:47.94684	\N
2	a8bd5c2badf720e763df72553ea9e778	2018-09-12 09:48:08.613501	2018-09-12 10:18:08.613501	\N
3	f15ba94e4e417733b49d5a77bb87d874	2018-09-12 09:48:10.206978	2018-09-12 10:18:10.206978	\N
4	e78eb57a3bd990146e4268669f54ef4e	2018-09-12 09:48:11.252366	2018-09-12 10:18:11.252366	\N
5	1004e3556dc72a5f7f7e0adf42c2ccb5	2018-09-12 09:48:12.233896	2018-09-12 10:18:12.233896	\N
6	3ad6d105b82890447bda6a66e32430b6	2018-09-12 09:48:13.149448	2018-09-12 10:18:13.149448	\N
7	3ad6d105b82890447bda6a66e32430b6	2018-09-12 09:48:13.99781	2018-09-12 10:18:13.99781	\N
8	3bf4f53f36268eb55e5b1fcc5179bbf5	2018-09-12 09:48:14.941734	2018-09-12 10:18:14.941734	\N
9	88a932ea3be7cb7d827c5024d99f1fc6	2018-09-12 09:48:15.803798	2018-09-12 10:18:15.803798	\N
10	96f4f861d37dfaf533824f9e79ca760c	2018-09-12 09:48:18.034067	2018-09-12 10:18:18.034067	\N
11	5dd0d7f1f6e10c325980535f51439285	2018-09-12 09:50:41.612742	2018-09-12 10:20:41.612742	\N
12	181b17e08b7f3dbb35e0c8692b08dc45	2018-09-12 09:50:51.135455	2018-09-12 10:20:51.135455	\N
13	c1d27792434eeb88aabc46052722b9d5	2018-09-12 10:16:44.282456	2018-09-12 10:46:44.282456	\N
14	d81d2728c651d5afd74875a052a8f23b	2018-09-19 09:34:15.506687	2018-09-19 10:04:15.506687	\N
15	929b02c9dccdd3d4d411cbef69ddcee7	2018-09-19 10:11:06.31564	2018-09-19 10:41:06.31564	\N
16	8c5d57c69c1851af4cbbbd1589fea43e	2018-09-24 09:23:19.470335	2018-09-24 09:53:19.470335	\N
17	2f84d2d137e97a3c52ab2ae140d9f1f4	2018-09-24 09:29:27.281331	2018-09-24 09:59:27.281331	\N
18	423c1a9b6e2a46d3a5cc711fb18835f9	2018-09-24 09:29:56.16196	2018-09-24 09:59:56.16196	\N
19	6be9c24659cd082362892efa7da597b2	2018-09-24 09:42:09.734934	2018-09-24 10:12:09.734934	\N
20	5b785bb9acac6799cac21e4207c8dc26	2018-09-24 16:04:18.549094	2018-09-24 16:34:18.549094	\N
21	19e945c7322c7aeb1e2042a2bcba212a	2018-09-24 16:05:57.470776	2018-09-24 16:35:57.470776	\N
22	ee461e3ca851a3183b8289e43b257fa4	2018-09-24 16:05:58.946255	2018-09-24 16:35:58.946255	\N
23	3554852a2d5b6751a6531952c0333e50	2018-09-24 16:10:44.374097	2018-09-24 16:40:44.374097	\N
24	6057765f02b84e3c8dfe7434acf00b41	2018-09-24 16:10:45.579964	2018-09-24 16:40:45.579964	\N
25	0ce09af52f7c87f45df9fa982e6222b8	2018-09-24 16:10:46.681943	2018-09-24 16:40:46.681943	\N
26	82230250c8dc08872dda5b06178cedc3	2018-09-24 16:10:48.129803	2018-09-24 16:40:48.129803	\N
27	07e4d61f324b076bc05515ae125fc402	2018-09-24 16:10:49.181644	2018-09-24 16:40:49.181644	\N
28	445cffb737ac6f49a1dd080340101464	2018-09-24 16:10:50.313921	2018-09-24 16:40:50.313921	\N
29	bfe3a117bd8b2e010efb54f2c6020602	2018-09-24 16:10:51.355064	2018-09-24 16:40:51.355064	\N
30	713432d2641d3eb712e7df4a7f759499	2018-09-24 16:10:52.033122	2018-09-24 16:40:52.033122	\N
31	713432d2641d3eb712e7df4a7f759499	2018-09-24 16:10:52.458934	2018-09-24 16:40:52.458934	\N
32	86d08ac8b438e78fe545edf7b326e442	2018-09-24 16:10:53.036012	2018-09-24 16:40:53.036012	\N
33	86d08ac8b438e78fe545edf7b326e442	2018-09-24 16:10:53.669954	2018-09-24 16:40:53.669954	\N
34	e8ead1f40f14aba130364e042b9cc3d3	2018-09-24 16:10:54.172845	2018-09-24 16:40:54.172845	\N
35	e8ead1f40f14aba130364e042b9cc3d3	2018-09-24 16:10:54.925891	2018-09-24 16:40:54.925891	\N
36	6d1f7c75bff3031804c8ec029480678c	2018-09-24 16:12:10.166331	2018-09-24 16:42:10.166331	\N
37	e59444fd918568ccb260b8b18570048d	2018-09-24 16:12:11.469241	2018-09-24 16:42:11.469241	\N
38	086df5a2eb7c688abad7be28b096723c	2018-09-24 16:12:12.51808	2018-09-24 16:42:12.51808	\N
39	530986fca5a04f55e93dae43b50082fc	2018-09-24 16:12:13.495347	2018-09-24 16:42:13.495347	\N
40	4e58c6f4e7c565dadf883435e66f5d82	2018-09-24 16:12:14.487837	2018-09-24 16:42:14.487837	\N
41	9e9627944f19b0263e372b236eaf78ad	2018-09-24 16:12:15.490652	2018-09-24 16:42:15.490652	\N
42	f089014dfc144b6b171c5546dfe731eb	2018-09-24 16:12:16.455154	2018-09-24 16:42:16.455154	\N
43	bd9364af4db333af7448ee37478b13cc	2018-09-24 16:12:17.319676	2018-09-24 16:42:17.319676	\N
44	e536103dea7c14545bf7b3345f3c0a38	2018-09-24 16:12:18.115859	2018-09-24 16:42:18.115859	\N
45	c9c49cce5fcdecb63d66bd02b773a698	2018-09-24 16:12:19.283103	2018-09-24 16:42:19.283103	\N
46	5897cf0c9236d3707b557aaf8f91d3d8	2018-09-24 16:12:20.291165	2018-09-24 16:42:20.291165	\N
47	861df5d3ded37c189476b289a700bad4	2018-09-24 16:13:30.844993	2018-09-24 16:43:30.844993	\N
48	e6cf7b147888c666ba248a0856b2df98	2018-09-24 16:13:31.890275	2018-09-24 16:43:31.890275	\N
49	65b0d9905e78998e16f0d940791f9ec2	2018-09-24 16:13:32.927106	2018-09-24 16:43:32.927106	\N
50	882b88bc4fc25dd57398b9c402e72454	2018-09-24 16:13:33.89392	2018-09-24 16:43:33.89392	\N
51	bb0bd33fb7ec5de3d885718021846d4b	2018-09-24 16:13:34.85722	2018-09-24 16:43:34.85722	\N
52	600e364ee0b91877d2518059e85ee959	2018-09-24 16:13:51.592257	2018-09-24 16:43:51.592257	\N
53	393725f35b5526711c06684ed6a35b32	2018-09-24 16:15:48.774385	2018-09-24 16:45:48.774385	\N
54	944b190edee003c520db7651d345c4fb	2018-09-24 16:17:20.730669	2018-09-24 16:47:20.730669	\N
55	0c4eec60570f1d277f9064bd67cdbe3a	2018-09-24 16:17:27.531558	2018-09-24 16:47:27.531558	\N
56	01761ca335d510998e7919ba20db7336	2018-09-24 16:17:28.547377	2018-09-24 16:47:28.547377	\N
57	c4d98b6796bffba4b0415c3faf68bbdf	2018-09-24 16:17:29.531919	2018-09-24 16:47:29.531919	\N
58	ed0c31f6d4902676dcc2580dd6f09734	2018-09-24 16:17:30.601935	2018-09-24 16:47:30.601935	\N
59	0ecd0b839468b8f6c68d8f666ae6994e	2018-09-24 16:17:33.949773	2018-09-24 16:47:33.949773	\N
60	a90f6a56ea8277aa97fc1212cada3402	2018-09-24 16:17:34.986793	2018-09-24 16:47:34.986793	\N
61	bbcbcbe90618056dafc41e6fb07a806f	2018-09-24 16:17:35.959491	2018-09-24 16:47:35.959491	\N
62	f3e8f85b4a26a4e4b8e492b29236cccd	2018-09-24 16:17:36.920508	2018-09-24 16:47:36.920508	\N
63	6132eaad978a207d46916909ae7eab4a	2018-09-24 16:25:11.670405	2018-09-24 16:55:11.670405	\N
64	68d17f2f7cc0423286b075e735894274	2018-09-24 16:26:40.780406	2018-09-24 16:56:40.780406	\N
65	e034edb449ad18c20aa5fc9840ce5a6c	2018-09-24 16:28:15.096504	2018-09-24 16:58:15.096504	\N
66	c1b2ad408c3d27cee6d62738b6a66804	2018-09-24 16:30:23.550332	2018-09-24 17:00:23.550332	\N
67	0d7bfe5f5e6fdad601c3594d4be21198	2018-09-24 17:15:48.40325	2018-09-24 17:45:48.40325	192.168.1.64
68	2df78c524f550fe44fb24903c3d8dbd0	2018-09-24 17:20:02.055013	2018-09-24 17:50:02.055013	192.168.1.64
69	82541742e26d573cc5500bc0035ea671	2018-09-24 17:20:04.255648	2018-09-24 17:50:04.255648	192.168.1.64
70	364a3b7ad491362deab5b5634f914a13	2018-09-24 17:20:36.097062	2018-09-24 17:50:36.097062	null
71	cdb59345401dbc40576d9f873b0a97c6	2018-09-24 17:20:53.180415	2018-09-24 17:50:53.180415	null
72	f47ff5a6115c2175b7a586dfd6205948	2018-09-24 17:22:05.046793	2018-09-24 17:52:05.046793	null
73	ba1da946976d5000b9515ff97c40c0d7	2018-09-24 17:22:13.627454	2018-09-24 17:52:13.627454	192.168.1.64
74	2269760d0d46ccf3f8f6ac3e291ae8b9	2018-09-24 17:22:48.683545	2018-09-24 17:52:48.683545	192.168.1.64
75	fd8e2306569d64822a3db6c2748bb82c	2018-09-24 17:22:53.439951	2018-09-24 17:52:53.439951	192.168.1.64
76	798ab5565460d5cf41283b9814aaf2fd	2018-09-26 09:47:48.831699	2018-09-26 10:17:48.831699	0:0:0:0:0:0:0:1
77	264f657aea5475bce2b7aecb7b759177	2018-09-26 09:59:32.591585	2018-09-26 10:29:32.591585	192.168.43.1
\.


--
-- Name: accesos_idacceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accesos_idacceso_seq', 109, true);


--
-- Data for Name: alumno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumno (idalumno, nocontrol, nombre, apepaterno, apematerno, email, idcarrera) FROM stdin;
1	14030658	Juan	Hernandez	Ojeda	14030658@itcelaya.edu.mx	1
4	14040658	Alberto	Lopez	Ramirez	14040658@itcelaya.edu.mx	1
\.


--
-- Name: alumno_idalumno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alumno_idalumno_seq', 6, true);


--
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carrera (idcarrera, nombre) FROM stdin;
1	Ing. Sistemas Computacionales
\.


--
-- Name: carrera_idcarrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrera_idcarrera_seq', 1, true);


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamento (iddepartamento, descripcion) FROM stdin;
\.


--
-- Name: departamento_iddepartamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamento_iddepartamento_seq', 1, false);


--
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grupo (idgrupo, idmateria, idmaestro) FROM stdin;
\.


--
-- Name: grupo_idgrupo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupo_idgrupo_seq', 1, false);


--
-- Data for Name: kardex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kardex (idmateria, idalumno, idoportunidad, calificacion, semestre) FROM stdin;
\.


--
-- Data for Name: lista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lista (idgrupo, idalumno, periodo) FROM stdin;
\.


--
-- Data for Name: maestro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maestro (idmaestro, rfc, nombre, apepaterno, apematerno, email, idcarrera, iddepartamento) FROM stdin;
\.


--
-- Name: maestro_idmaestro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maestro_idmaestro_seq', 1, false);


--
-- Data for Name: materia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materia (idmateria, nombre) FROM stdin;
\.


--
-- Name: materia_idmateria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materia_idmateria_seq', 1, false);


--
-- Data for Name: oportunidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oportunidad (idoportunidad, descripcion) FROM stdin;
\.


--
-- Name: oportunidad_idoportunidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oportunidad_idoportunidad_seq', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (idusuario, usuario, contrasena, idalumno) FROM stdin;
1	juho	181f94563bc5ef93d92052551ca1e589	1
\.


--
-- Name: usuario_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_idusuario_seq', 1, true);


--
-- Name: accesos accesos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accesos
    ADD CONSTRAINT accesos_pkey PRIMARY KEY (idacceso);


--
-- Name: alumno alumno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_pkey PRIMARY KEY (idalumno);


--
-- Name: carrera carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT carrera_pkey PRIMARY KEY (idcarrera);


--
-- Name: departamento departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (iddepartamento);


--
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (idgrupo);


--
-- Name: kardex kardex_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kardex
    ADD CONSTRAINT kardex_pkey PRIMARY KEY (idmateria, idalumno, idoportunidad);


--
-- Name: lista lista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista
    ADD CONSTRAINT lista_pkey PRIMARY KEY (idgrupo, idalumno);


--
-- Name: maestro maestro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maestro
    ADD CONSTRAINT maestro_pkey PRIMARY KEY (idmaestro);


--
-- Name: materia materia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materia
    ADD CONSTRAINT materia_pkey PRIMARY KEY (idmateria);


--
-- Name: oportunidad oportunidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oportunidad
    ADD CONSTRAINT oportunidad_pkey PRIMARY KEY (idoportunidad);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);


--
-- Name: usuario fk_alumno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_alumno FOREIGN KEY (idalumno) REFERENCES public.alumno(idalumno);


--
-- Name: kardex fk_idalumno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kardex
    ADD CONSTRAINT fk_idalumno FOREIGN KEY (idalumno) REFERENCES public.alumno(idalumno);


--
-- Name: lista fk_idalumno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista
    ADD CONSTRAINT fk_idalumno FOREIGN KEY (idalumno) REFERENCES public.alumno(idalumno);


--
-- Name: alumno fk_idcarrera; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT fk_idcarrera FOREIGN KEY (idcarrera) REFERENCES public.carrera(idcarrera);


--
-- Name: maestro fk_idcarrera; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maestro
    ADD CONSTRAINT fk_idcarrera FOREIGN KEY (idcarrera) REFERENCES public.carrera(idcarrera);


--
-- Name: maestro fk_iddepartamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maestro
    ADD CONSTRAINT fk_iddepartamento FOREIGN KEY (iddepartamento) REFERENCES public.departamento(iddepartamento);


--
-- Name: lista fk_idgrupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista
    ADD CONSTRAINT fk_idgrupo FOREIGN KEY (idgrupo) REFERENCES public.grupo(idgrupo);


--
-- Name: grupo fk_idmaestro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT fk_idmaestro FOREIGN KEY (idmaestro) REFERENCES public.maestro(idmaestro);


--
-- Name: grupo fk_idmateria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT fk_idmateria FOREIGN KEY (idmateria) REFERENCES public.materia(idmateria);


--
-- Name: kardex fk_idmateria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kardex
    ADD CONSTRAINT fk_idmateria FOREIGN KEY (idmateria) REFERENCES public.materia(idmateria);


--
-- Name: kardex fk_idoportunidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kardex
    ADD CONSTRAINT fk_idoportunidad FOREIGN KEY (idoportunidad) REFERENCES public.oportunidad(idoportunidad);


--
-- PostgreSQL database dump complete
--

