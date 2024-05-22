--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-06-24 18:59:21

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
-- TOC entry 207 (class 1259 OID 16855)
-- Name: bilhetes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bilhetes (
    codreserva integer NOT NULL,
    dtemissao date NOT NULL,
    codtrecho integer NOT NULL,
    codpass integer NOT NULL,
    preco integer NOT NULL,
    poltrona integer NOT NULL
);


ALTER TABLE public.bilhetes OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16853)
-- Name: bilhetes_codreserva_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bilhetes_codreserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bilhetes_codreserva_seq OWNER TO postgres;

--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 206
-- Name: bilhetes_codreserva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bilhetes_codreserva_seq OWNED BY public.bilhetes.codreserva;


--
-- TOC entry 201 (class 1259 OID 16820)
-- Name: empresas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresas (
    codempresa integer NOT NULL,
    nome character varying(50),
    autorizacao integer
);


ALTER TABLE public.empresas OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16818)
-- Name: empresas_codempresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empresas_codempresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresas_codempresa_seq OWNER TO postgres;

--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 200
-- Name: empresas_codempresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empresas_codempresa_seq OWNED BY public.empresas.codempresa;


--
-- TOC entry 205 (class 1259 OID 16841)
-- Name: passageiros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passageiros (
    codpass integer NOT NULL,
    nome character varying(50) NOT NULL,
    idade integer NOT NULL,
    passresponsavel integer
);


ALTER TABLE public.passageiros OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16839)
-- Name: passageiros_codpass_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.passageiros_codpass_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.passageiros_codpass_seq OWNER TO postgres;

--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 204
-- Name: passageiros_codpass_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.passageiros_codpass_seq OWNED BY public.passageiros.codpass;


--
-- TOC entry 203 (class 1259 OID 16828)
-- Name: trechos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trechos (
    codtrecho integer NOT NULL,
    codempresa integer,
    "cidadeorigem " character varying(30),
    cidadedestino character varying(30)
);


ALTER TABLE public.trechos OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16826)
-- Name: trechos_codtrecho_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trechos_codtrecho_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trechos_codtrecho_seq OWNER TO postgres;

--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 202
-- Name: trechos_codtrecho_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trechos_codtrecho_seq OWNED BY public.trechos.codtrecho;


--
-- TOC entry 2871 (class 2604 OID 16858)
-- Name: bilhetes codreserva; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bilhetes ALTER COLUMN codreserva SET DEFAULT nextval('public.bilhetes_codreserva_seq'::regclass);


--
-- TOC entry 2868 (class 2604 OID 16823)
-- Name: empresas codempresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresas ALTER COLUMN codempresa SET DEFAULT nextval('public.empresas_codempresa_seq'::regclass);


--
-- TOC entry 2870 (class 2604 OID 16844)
-- Name: passageiros codpass; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passageiros ALTER COLUMN codpass SET DEFAULT nextval('public.passageiros_codpass_seq'::regclass);


--
-- TOC entry 2869 (class 2604 OID 16831)
-- Name: trechos codtrecho; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trechos ALTER COLUMN codtrecho SET DEFAULT nextval('public.trechos_codtrecho_seq'::regclass);


--
-- TOC entry 3022 (class 0 OID 16855)
-- Dependencies: 207
-- Data for Name: bilhetes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bilhetes (codreserva, dtemissao, codtrecho, codpass, preco, poltrona) VALUES (1, '2020-10-10', 1, 2, 55, 2);
INSERT INTO public.bilhetes (codreserva, dtemissao, codtrecho, codpass, preco, poltrona) VALUES (2, '2020-10-15', 2, 2, 42, 5);
INSERT INTO public.bilhetes (codreserva, dtemissao, codtrecho, codpass, preco, poltrona) VALUES (3, '2020-11-03', 2, 3, 62, 15);
INSERT INTO public.bilhetes (codreserva, dtemissao, codtrecho, codpass, preco, poltrona) VALUES (4, '2020-11-10', 5, 4, 12, 1);
INSERT INTO public.bilhetes (codreserva, dtemissao, codtrecho, codpass, preco, poltrona) VALUES (5, '2020-10-11', 5, 3, 12, 6);
INSERT INTO public.bilhetes (codreserva, dtemissao, codtrecho, codpass, preco, poltrona) VALUES (6, '2020-11-15', 5, 3, 15, 10);


--
-- TOC entry 3016 (class 0 OID 16820)
-- Dependencies: 201
-- Data for Name: empresas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empresas (codempresa, nome, autorizacao) VALUES (51, 'Catarinense', 122);
INSERT INTO public.empresas (codempresa, nome, autorizacao) VALUES (90, 'Reunidas', 101);
INSERT INTO public.empresas (codempresa, nome, autorizacao) VALUES (88, 'Canarinho', 151);


--
-- TOC entry 3020 (class 0 OID 16841)
-- Dependencies: 205
-- Data for Name: passageiros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.passageiros (codpass, nome, idade, passresponsavel) VALUES (1, 'Rui Hachy', 57, NULL);
INSERT INTO public.passageiros (codpass, nome, idade, passresponsavel) VALUES (3, 'Pedro Hacky', 15, 1);
INSERT INTO public.passageiros (codpass, nome, idade, passresponsavel) VALUES (2, 'Lorena Hachy', 32, 1);
INSERT INTO public.passageiros (codpass, nome, idade, passresponsavel) VALUES (4, 'Victor Prado', 12, 2);


--
-- TOC entry 3018 (class 0 OID 16828)
-- Dependencies: 203
-- Data for Name: trechos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.trechos (codtrecho, codempresa, "cidadeorigem ", cidadedestino) VALUES (1, 51, 'Jlle', 'POA');
INSERT INTO public.trechos (codtrecho, codempresa, "cidadeorigem ", cidadedestino) VALUES (2, 90, 'Jlle', 'Ctba');
INSERT INTO public.trechos (codtrecho, codempresa, "cidadeorigem ", cidadedestino) VALUES (3, 90, 'Ctba', 'POA');
INSERT INTO public.trechos (codtrecho, codempresa, "cidadeorigem ", cidadedestino) VALUES (4, 88, 'Ctba', 'SP');
INSERT INTO public.trechos (codtrecho, codempresa, "cidadeorigem ", cidadedestino) VALUES (5, 88, 'Ctba', 'Maringá');


--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 206
-- Name: bilhetes_codreserva_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bilhetes_codreserva_seq', 6, true);


--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 200
-- Name: empresas_codempresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empresas_codempresa_seq', 1, false);


--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 204
-- Name: passageiros_codpass_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passageiros_codpass_seq', 4, true);


--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 202
-- Name: trechos_codtrecho_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trechos_codtrecho_seq', 5, true);


--
-- TOC entry 2880 (class 2606 OID 16860)
-- Name: bilhetes bilhetes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bilhetes
    ADD CONSTRAINT bilhetes_pkey PRIMARY KEY (codreserva);


--
-- TOC entry 2873 (class 2606 OID 16825)
-- Name: empresas empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (codempresa);


--
-- TOC entry 2878 (class 2606 OID 16846)
-- Name: passageiros passageiros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passageiros
    ADD CONSTRAINT passageiros_pkey PRIMARY KEY (codpass);


--
-- TOC entry 2875 (class 2606 OID 16833)
-- Name: trechos trechos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trechos
    ADD CONSTRAINT trechos_pkey PRIMARY KEY (codtrecho);


--
-- TOC entry 2876 (class 1259 OID 16852)
-- Name: fki_fk_responsavel; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_responsavel ON public.passageiros USING btree (passresponsavel);


--
-- TOC entry 2884 (class 2606 OID 16866)
-- Name: bilhetes bilhetes_codpass_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bilhetes
    ADD CONSTRAINT bilhetes_codpass_fkey FOREIGN KEY (codpass) REFERENCES public.passageiros(codpass);


--
-- TOC entry 2883 (class 2606 OID 16861)
-- Name: bilhetes bilhetes_codtrecho_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bilhetes
    ADD CONSTRAINT bilhetes_codtrecho_fkey FOREIGN KEY (codtrecho) REFERENCES public.trechos(codtrecho);


--
-- TOC entry 2882 (class 2606 OID 16847)
-- Name: passageiros fk_responsavel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passageiros
    ADD CONSTRAINT fk_responsavel FOREIGN KEY (passresponsavel) REFERENCES public.passageiros(codpass) NOT VALID;


--
-- TOC entry 2881 (class 2606 OID 16834)
-- Name: trechos trechos_codempresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trechos
    ADD CONSTRAINT trechos_codempresa_fkey FOREIGN KEY (codempresa) REFERENCES public.empresas(codempresa);


-- Completed on 2021-06-24 18:59:28

--
-- PostgreSQL database dump complete
--
