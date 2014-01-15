--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.1
-- Dumped by pg_dump version 9.3.1
-- Started on 2014-01-15 01:12:53 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 178 (class 3079 OID 12018)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 178
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 16438)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE client (
    id integer NOT NULL,
    name character(255),
    email character(255),
    phone character(255),
    website character(255),
    other text
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 16444)
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 171
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE client_id_seq OWNED BY client.id;


--
-- TOC entry 172 (class 1259 OID 16446)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employee (
    id integer NOT NULL,
    name character(255),
    email character(255),
    password character(255),
    role integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16452)
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_id_seq OWNER TO postgres;

--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 173
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE employee_id_seq OWNED BY employee.id;


--
-- TOC entry 174 (class 1259 OID 16454)
-- Name: project; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE project (
    id integer NOT NULL,
    client_id integer,
    description character varying(255),
    end_date date,
    name character varying(255),
    progress double precision,
    start_date date,
    leader_id integer
);


ALTER TABLE public.project OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16460)
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO postgres;

--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 175
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE project_id_seq OWNED BY project.id;


--
-- TOC entry 176 (class 1259 OID 16462)
-- Name: task; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE task (
    id integer NOT NULL,
    project_id integer,
    responsible integer,
    name character(255),
    status integer,
    start_time timestamp with time zone,
    end_time timestamp with time zone,
    description text,
    priority integer,
    estimated_time character(5)
);


ALTER TABLE public.task OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 16468)
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_seq OWNER TO postgres;

--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 177
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE task_id_seq OWNED BY task.id;


--
-- TOC entry 2111 (class 2604 OID 16470)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client ALTER COLUMN id SET DEFAULT nextval('client_id_seq'::regclass);


--
-- TOC entry 2112 (class 2604 OID 16471)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee ALTER COLUMN id SET DEFAULT nextval('employee_id_seq'::regclass);


--
-- TOC entry 2113 (class 2604 OID 16472)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY project ALTER COLUMN id SET DEFAULT nextval('project_id_seq'::regclass);


--
-- TOC entry 2114 (class 2604 OID 16473)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task ALTER COLUMN id SET DEFAULT nextval('task_id_seq'::regclass);


--
-- TOC entry 2235 (class 0 OID 16438)
-- Dependencies: 170
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY client (id, name, email, phone, website, other) FROM stdin;
3	BME                                                                                                                                                                                                                                                            	bme@bme.hu                                                                                                                                                                                                                                                     	+37567938767                                                                                                                                                                                                                                                   	www.bme.hu                                                                                                                                                                                                                                                     	Budapeste
2	ELTE                                                                                                                                                                                                                                                           	elte@elte.hu                                                                                                                                                                                                                                                   	+37567938767                                                                                                                                                                                                                                                   	www.elte.hu                                                                                                                                                                                                                                                    	Budapesta
\.


--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 171
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('client_id_seq', 8, true);


--
-- TOC entry 2237 (class 0 OID 16446)
-- Dependencies: 172
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employee (id, name, email, password, role) FROM stdin;
1	ernane                                                                                                                                                                                                                                                         	ernane.luis@gmail.com                                                                                                                                                                                                                                          	12345                                                                                                                                                                                                                                                          	-1
3	Junior                                                                                                                                                                                                                                                         	junior@gmail.com                                                                                                                                                                                                                                               	12345                                                                                                                                                                                                                                                          	0
4	Julia                                                                                                                                                                                                                                                          	julia@gmail.com                                                                                                                                                                                                                                                	12345                                                                                                                                                                                                                                                          	1
\.


--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 173
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employee_id_seq', 4, true);


--
-- TOC entry 2239 (class 0 OID 16454)
-- Dependencies: 174
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY project (id, client_id, description, end_date, name, progress, start_date, leader_id) FROM stdin;
1	2	Software developed by ernane	2013-12-04	App Dev	0	2013-12-04	3
4	3	teste 21	2013-12-09	Teste2	0	2013-12-07	4
\.


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 175
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('project_id_seq', 4, true);


--
-- TOC entry 2241 (class 0 OID 16462)
-- Dependencies: 176
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY task (id, project_id, responsible, name, status, start_time, end_time, description, priority, estimated_time) FROM stdin;
29	1	1	Dashboard                                                                                                                                                                                                                                                      	2	2013-12-11 16:53:43.782+01	2013-12-11 16:54:00.166+01	teste	0	02:31
21	1	1	Validar dados                                                                                                                                                                                                                                                  	2	2013-12-10 22:17:33.291+01	2013-12-10 23:02:45.868+01	utilizar algum javascript pra validar os dados, nao serem vazios!	0	01:00
30	1	1	Employee  role                                                                                                                                                                                                                                                 	2	2013-12-10 23:03:54.026+01	2013-12-10 23:16:14.343+01	criar nomes para os papeis dos employees: admin, user	0	00:20
32	1	1	tst                                                                                                                                                                                                                                                            	0	\N	\N	sdfghjk	0	01:10
22	1	1	Deletar Projeto                                                                                                                                                                                                                                                	2	2013-12-10 20:48:18.001+01	2013-12-10 21:41:58.285+01	ao deletar um projeto, deletar tambem todas as tarfeas, verificar se o hibernate faz isso!	2	01:00
28	1	1	Numero com 2 casas                                                                                                                                                                                                                                             	2	2013-12-10 22:09:21.801+01	2013-12-10 22:14:39.407+01	decimais em progress do projeto	0	00:30
31	1	1	View Profile                                                                                                                                                                                                                                                   	2	2013-12-10 23:17:54.37+01	2013-12-10 23:20:29.257+01	levar a pagina para employee	0	00:10
33	4	1	tesye                                                                                                                                                                                                                                                          	2	2014-01-15 01:07:41.508+01	2014-01-15 01:09:42.417+01	asdfg	0	00:10
20	1	1	Criar Regras de negocios                                                                                                                                                                                                                                       	2	2013-12-11 15:16:21.851+01	2013-12-11 16:51:55.798+01	Fazer sistema funcionar pra admin e usuario\r\nusuario: nao pode deletar projeto(a n ser q seja o lider), nao pode criar novo employee(somente admin), nao pode criar projeto, so pode criar tarefa para ele mesmo!\r\n\r\nlider: faz o usuario nao faz!	2	01:00
\.


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 177
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('task_id_seq', 33, true);


--
-- TOC entry 2116 (class 2606 OID 16475)
-- Name: client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- TOC entry 2118 (class 2606 OID 16477)
-- Name: employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 2120 (class 2606 OID 16479)
-- Name: project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- TOC entry 2124 (class 2606 OID 16481)
-- Name: task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- TOC entry 2122 (class 2606 OID 19069)
-- Name: uk_pd0f41nfpvncngygkesu8mk9n; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY project
    ADD CONSTRAINT uk_pd0f41nfpvncngygkesu8mk9n UNIQUE (client_id);


--
-- TOC entry 2125 (class 2606 OID 16508)
-- Name: client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY project
    ADD CONSTRAINT client_id FOREIGN KEY (client_id) REFERENCES client(id);


--
-- TOC entry 2126 (class 2606 OID 16553)
-- Name: employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY project
    ADD CONSTRAINT employee_id FOREIGN KEY (leader_id) REFERENCES employee(id);


--
-- TOC entry 2127 (class 2606 OID 17403)
-- Name: fk_dnh5o6g554lrdhgjyl66ddkok; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk_dnh5o6g554lrdhgjyl66ddkok FOREIGN KEY (responsible) REFERENCES employee(id);


--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-01-15 01:12:53 CET

--
-- PostgreSQL database dump complete
--

