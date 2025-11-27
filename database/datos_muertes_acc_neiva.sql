--
-- PostgreSQL database dump
--

\restrict 3JL6IooXbEbhGUY1iFN8gCyQqWZ54LlUsvCkRYn3cakBe0UP1whh6SZ26QIC9Wh

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

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
-- Data for Name: muertes_accidentes; Type: TABLE DATA; Schema: public; Owner: neiva_user
--

COPY public.muertes_accidentes (id, fecha_del_hecho, dia_de_la_semana, hora_del_hecho, comuna_corregimiento, tipo_de_via_de_hechos, clase_de_accidente, genero, edad, caracteristicas_de_la_victima, vehiculo_de_la_victima, vehiculo_2_de_la_contraparte, vehiculo_3_de_la_contraparte, vehiculo_4_de_la_contraparte) FROM stdin;
545	2022-09-24 00:00:00	Domingo	21:41:00	8	Municipal	Colisión con objeto fijo	Masculino	42	Conductor de moto	Conductor de moto	Motocicleta	No aplica	No aplica
541	2022-09-07 00:00:00	Viernes	08:30:00	4	Municipal	Colisión con objeto fijo	Masculino	31	Conductor de moto	Conductor de moto	Motocicleta	No aplica	No aplica
530	2022-07-03 00:00:00	Sábado	19:10:00	Guacirco	Municipal	Colisión con objeto móvil	Masculino	61	Conductor moto	Conductor moto	Motocicleta	Vehiculo particular	No aplica
294	2017-06-30 00:00:00	Viernes	05:00:00	Guacirco	Nacional	Colisión con objeto móvil	Masculino	33	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
254	2016-08-27 00:00:00	Sábado	13:30:00	Guacirco	Nacional	Colisión con objeto móvil	Masculino	21	Conductor de moto	Motocicleta	Tractomula	No aplica	No aplica
253	2016-08-27 00:00:00	Sábado	13:30:00	Guacirco	Nacional	Colisión con objeto móvil	N/E	0	Pasajero de moto	Motocicleta	Tractomula	No aplica	No aplica
8	2012-02-05 00:00:00	Domingo	03:57:00	5	Municipal	Colisión con objeto fijo	Masculino	21	Peatón	Motocicleta	No aplica	No aplica	No aplica
69	2013-03-08 00:00:00	Viernes	20:00:00	1	Municipal	Colisión con objeto fijo	Femenino	54	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
59	2012-12-25 00:00:00	Martes	00:00:00	3	Municipal	Colisión con objeto fijo	Masculino	23	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
15	2012-04-21 00:00:00	Sábado	19:40:00	6	Municipal	Ciclista atropellado	Masculino	16	Ciclista	Bicicleta	Motocicleta	No aplica	No aplica
86	2013-07-21 00:00:00	Domingo	02:30:00	El Caguán	Municipal	Colisión con objeto fijo	Masculino	30	Conductor de moto	Taxi	Sin dato	Sin dato	Sin dato
14	2012-04-16 00:00:00	Lunes	18:00:00	6	Municipal	Volcamiento	Masculino	62	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
17	2012-04-25 00:00:00	Miércoles	09:20:00	6	Municipal	Volcamiento	Femenino	41	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
12	2012-04-11 00:00:00	Miércoles	00:00:00	2	Municipal	Sin dato	Femenino	46	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
99	2013-10-27 00:00:00	Domingo	00:00:00	10	Municipal	Colisión con objeto fijo	Masculino	12	Pasajero de vehículo	Camión/Camioneta	No aplica	No aplica	No aplica
564	2025-11-05 00:00:00	Miércoles	12:00:00	1	Departamental	Volcamiento	Femenino	18	Peatón	Ninguno	A pie	Bicicleta	Bicicleta
144	2014-10-19 00:00:00	Domingo	23:15:00	9	Municipal	Colisión con objeto fijo	Masculino	24	Conductor de moto	Taxi	Sin dato	Sin dato	Sin dato
97	2013-10-14 00:00:00	Lunes	22:30:00	6	Municipal	Colisión con objeto fijo	Masculino	34	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
89	2013-07-30 00:00:00	Martes	22:30:00	10	Municipal	Colisión con objeto fijo	Femenino	22	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
146	2014-10-23 00:00:00	Jueves	00:20:00	1	Municipal	Colisión con objeto fijo	Masculino	33	Conductor de moto	Taxi	Sin dato	Sin dato	Sin dato
150	2014-11-20 00:00:00	Jueves	22:30:00	3	Municipal	Colisión con objeto fijo	Masculino	26	Conductor de moto	Taxi	Sin dato	Sin dato	Sin dato
38	2012-08-29 00:00:00	Miércoles	01:40:00	4	Municipal	Colisión con objeto fijo	Masculino	20	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
34	2012-07-19 00:00:00	Jueves	12:50:00	5	Municipal	Peatón atropellado	Masculino	84	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
33	2012-07-15 00:00:00	Domingo	05:48:00	1	Municipal	Colisión con objeto fijo	Masculino	31	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
565	2025-11-14 00:00:00	Viernes	12:45:00	1	Departamental	Choque	Femenino	14	Motociclista	Bicicleta	Ninguno	Ninguno	Ninguno
37	2012-08-20 00:00:00	Lunes	01:40:00	4	Municipal	Colisión con objeto fijo	Masculino	19	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
47	2012-09-29 00:00:00	Sábado	06:00:00	Vegalarga	Municipal	Volcamiento	Masculino	24	Conductor de vehículo	Vehiculo particular	Sin dato	No aplica	No aplica
49	2012-10-29 00:00:00	Lunes	00:00:00	9	Municipal	Caída de ocupante	Femenino	48	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
42	2012-09-05 00:00:00	Miércoles	00:00:00	5	Municipal	Sin dato	Masculino	21	Conductor de moto	Motocicleta	Sin dato	No aplica	No aplica
41	2012-09-03 00:00:00	Lunes	19:12:00	5	Municipal	Peatón atropellado	Femenino	54	Peatón	Autónomo (Peatón)	Microbus/Busetón	No aplica	No aplica
566	2025-11-06 00:00:00	Jueves	15:45:00	4	Nacional	qwer	Masculino	45	Peatón	A pie	\N	\N	\N
43	2012-09-08 00:00:00	Sábado	00:42:00	3	Municipal	Colisión con objeto fijo	Masculino	23	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
52	2012-11-21 00:00:00	Miércoles	00:00:00	9	Municipal	Peatón atropellado	Femenino	71	Peatón	Autónomo (Peatón)	Vehiculo particular	No aplica	No aplica
45	2012-09-09 00:00:00	Domingo	02:00:00	3	Municipal	Colisión con objeto fijo	Masculino	26	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
209	2016-01-24 00:00:00	Domingo	02:15:00	2	Municipal	Colisión con objeto fijo	Masculino	20	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
56	2012-12-18 00:00:00	Martes	00:00:00	3	Municipal	Colisión con objeto fijo	Masculino	21	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
55	2012-12-17 00:00:00	Lunes	00:00:00	2	Municipal	Colisión con objeto fijo	Masculino	24	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
53	2012-11-23 00:00:00	Viernes	00:00:00	9	Municipal	Peatón atropellado	Femenino	68	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
51	2012-11-21 00:00:00	Miércoles	00:00:00	2	Municipal	Sin dato	Masculino	27	Conductor de moto	Motocicleta	Sin dato	No aplica	No aplica
62	2013-01-10 00:00:00	Jueves	23:05:00	4	Municipal	Colisión con objeto fijo	Masculino	49	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
64	2013-01-24 00:00:00	Jueves	01:50:00	3	Municipal	Colisión con objeto fijo	Masculino	29	Conductor de moto	Taxi	Sin dato	Sin dato	Sin dato
68	2013-02-28 00:00:00	Jueves	00:00:00	4	Municipal	Sin dato	Masculino	27	Conductor de moto	Motocicleta	Sin dato	No aplica	No aplica
61	2013-01-05 00:00:00	Sábado	00:00:00	9	Municipal	Colisión con objeto fijo	Masculino	59	Conductor de moto	Taxi	Sin dato	Sin dato	Sin dato
65	2013-01-30 00:00:00	Miércoles	00:00:00	5	Municipal	Peatón atropellado	Femenino	72	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
71	2013-04-15 00:00:00	Lunes	00:00:00	9	Municipal	Colisión con objeto fijo	Masculino	42	Conductor de moto	Taxi	Lancha/otro	Sin dato	Sin dato
77	2013-06-04 00:00:00	Martes	00:00:00	El Caguán	Municipal	Sin dato	Masculino	18	Conductor de moto	Motocicleta	Sin dato	No aplica	No aplica
228	2016-04-28 00:00:00	Jueves	05:07:00	1	Municipal	Colisión con objeto fijo	Masculino	29	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
79	2013-06-16 00:00:00	Domingo	15:00:00	Ninguna	Nacional	Colisión con objeto fijo	Masculino	35	Conductor de vehículo	Vehiculo particular	No aplica	No aplica	No aplica
472	2021-05-30 00:00:00	Domingo	15:35:00	1	Municipal	Colisión con objeto fijo	Masculino	46	Conductor de moto	Motocicleta	Sin dato	No aplica	No aplica
74	2013-05-25 00:00:00	Sábado	00:00:00	6	Municipal	Colisión con objeto fijo	Femenino	38	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
101	2013-11-10 00:00:00	Domingo	00:00:00	4	Municipal	Sin dato	Masculino	20	Conductor de moto	Motocicleta	Sin dato	No aplica	No aplica
84	2013-07-02 00:00:00	Martes	00:00:00	1	Municipal	Colisión con objeto fijo	Masculino	20	Conductor de moto	Vehiculo particular	No aplica	No aplica	No aplica
88	2013-07-28 00:00:00	Domingo	00:00:00	El Caguán	Municipal	Sin dato	Masculino	35	Conductor de moto	Taxi	Lancha/otro	Sin dato	Sin dato
82	2013-06-24 00:00:00	Lunes	00:00:00	9	Municipal	Sin dato	Masculino	47	Conductor de moto	Taxi	Lancha/otro	Sin dato	Sin dato
85	2013-07-21 00:00:00	Domingo	07:00:00	4	Municipal	Colisión con objeto fijo	Masculino	26	Conductor de vehículo	Vehiculo particular	No aplica	No aplica	No aplica
141	2014-09-28 00:00:00	Domingo	00:00:00	9	Municipal	Sin dato	Masculino	37	Conductor de moto	Taxi	Lancha/otro	Sin dato	Sin dato
298	2017-07-23 00:00:00	Domingo	05:05:00	El Caguán	Municipal	Colisión con objeto fijo	Masculino	32	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
90	2013-08-04 00:00:00	Domingo	21:30:00	6	Municipal	Peatón atropellado	Masculino	8	Peatón	Autónomo (Peatón)	Vehiculo particular	No aplica	No aplica
92	2013-08-11 00:00:00	Domingo	00:00:00	El Caguán	Municipal	Sin dato	Masculino	25	Conductor de moto	Motocicleta	Sin dato	No aplica	No aplica
302	2017-09-17 00:00:00	Domingo	20:17:00	6	Municipal	Colisión con objeto fijo	Masculino	32	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
306	2017-10-15 00:00:00	Domingo	21:20:00	5	Municipal	Colisión con objeto fijo	Masculino	28	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
380	2019-05-16 00:00:00	Jueves	00:53:00	7	Municipal	Colisión con objeto fijo	Masculino	31	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
375	2019-03-15 00:00:00	Viernes	23:30:00	8	Municipal	Volcamiento	Masculino	20	Conductor de moto	No aplica	No aplica	No aplica	No aplica
93	2013-09-07 00:00:00	Sábado	00:00:00	1	Municipal	Sin dato	Masculino	65	Sin Dato	Lancha/otro	Tractomula	Sin dato	Sin dato
91	2013-08-10 00:00:00	Sábado	01:45:00	7	Municipal	Colisión con objeto fijo	Masculino	15	Conductor de vehículo	Vehiculo particular	No aplica	No aplica	No aplica
100	2013-10-27 00:00:00	Domingo	00:00:00	10	Municipal	Otra clase de accidente	Masculino	19	Otro	No aplica	Camión/Camioneta	No aplica	No aplica
270	2016-12-29 00:00:00	Jueves	07:35:00	4	Municipal	Colisión con objeto fijo	Femenino	27	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
398	2019-08-25 00:00:00	Domingo	03:50:00	1	Municipal	Colisión con objeto fijo	Femenino	23	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
439	2020-09-27 00:00:00	Domingo	04:50:00	8	Municipal	Colisión con objeto fijo	Masculino	25	Conductor de moto	Motocicleta	Particular	No aplica	No aplica
463	2021-03-28 00:00:00	Domingo	20:23:00	1	Municipal	Volcamiento	Masculino	24	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
23	2012-05-06 00:00:00	Domingo	14:28:00	6	Municipal	Colisión con objeto móvil	Masculino	38	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
359	2018-12-02 00:00:00	Domingo	12:35:00	6	Municipal	Colisión con objeto fijo	Femenino	46	Pasajero de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
440	2020-09-29 00:00:00	Martes	\N	1	Municipal	Colisión con objeto fijo	Femenino	53	Conductor Bicicleta	Bicicleta	Camión/Camioneta	No aplica	No aplica
103	2013-11-19 00:00:00	Martes	00:00:00	8	Municipal	Peatón atropellado	Masculino	41	Peatón	Bicicleta	Vehiculo particular	Sin dato	Sin dato
115	2014-02-02 00:00:00	Domingo	00:00:00	4	Municipal	Colisión con objeto fijo	Masculino	31	Conductor de moto	Taxi	Sin dato	Sin dato	Sin dato
480	2021-08-19 00:00:00	Jueves	13:40:00	El Caguán	Municipal	Colisión con objeto fijo	Masculino	17	Conductor de moto	Motocicleta	Otro	No aplica	No aplica
127	2014-06-08 00:00:00	Domingo	00:00:00	5	Municipal	Colisión con objeto móvil	Masculino	31	Conductor de moto	Taxi	Vehiculo particular	Sin dato	Sin dato
130	2014-06-29 00:00:00	Domingo	00:00:00	1	Municipal	Colisión con objeto móvil	Masculino	32	Conductor de moto	Taxi	Taxi	Sin dato	Sin dato
11	2012-03-25 00:00:00	Domingo	07:23:00	5	Municipal	Caída de ocupante	Femenino	43	Pasajero de vehículo	Microbus/Busetón	No aplica	No aplica	No aplica
479	2021-08-19 00:00:00	Jueves	18:04:00	El Caguán	Municipal	Colisión con objeto fijo	Masculino	18	Pasajero moto	Particular	Otro	No aplica	No aplica
119	2014-03-31 00:00:00	Lunes	00:00:00	Ninguna	Municipal	Peatón atropellado	Masculino	83	Peatón	Bicicleta	Taxi	Sin dato	Sin dato
120	2014-04-05 00:00:00	Sábado	00:00:00	7	Municipal	Ciclista atropellado	Masculino	79	Ciclista	Motocicleta	Taxi	Sin dato	Sin dato
104	2013-11-23 00:00:00	Sábado	00:00:00	Ninguna	Municipal	Caída de ocupante	Masculino	10	Pasajero de vehículo	Camión/Camioneta	No aplica	No aplica	No aplica
124	2014-05-05 00:00:00	Lunes	00:00:00	3	Municipal	Colisión con objeto fijo	Masculino	30	Conductor de moto	Taxi	Sin dato	Sin dato	Sin dato
559	2022-12-18 00:00:00	Viernes	05:21:00	3	Municipal	Caída de ocupante	Masculino	30	Conductor de moto	Conductor de moto	Motocicleta	No aplica	No aplica
26	2012-05-23 00:00:00	Miércoles	20:00:00	2	Municipal	Peatón atropellado	Femenino	90	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
107	2013-12-18 00:00:00	Miércoles	16:30:00	9	Municipal	Peatón atropellado	Femenino	67	Peatón	Autónomo (Peatón)	Camión/Camioneta	No aplica	No aplica
557	2022-12-11 00:00:00	Domingo	04:10:00	Río Las Ceibas	Municipal	Caída de ocupante	Masculino	28	Conductor de moto	Conductor de moto	Motocicleta	No aplica	No aplica
137	2014-08-28 00:00:00	Jueves	00:00:00	1	Municipal	Colisión con objeto fijo	Masculino	18	Conductor de moto	Taxi	Sin dato	Sin dato	Sin dato
135	2014-07-23 00:00:00	Miércoles	00:00:00	10	Municipal	Peatón atropellado	Femenino	8	Peatón	Bicicleta	Vehiculo particular	Sin dato	Sin dato
140	2014-09-25 00:00:00	Jueves	00:00:00	9	Municipal	Ciclista atropellado	Masculino	69	Ciclista	Motocicleta	Camión/Camioneta	Sin dato	Sin dato
132	2014-06-29 00:00:00	Domingo	00:00:00	Fortalecillas	Municipal	Sin dato	Masculino	40	Conductor de moto	Taxi	Lancha/otro	Sin dato	Sin dato
408	2019-10-03 00:00:00	Jueves	01:30:00	3	Municipal	Colisión con objeto fijo	Masculino	20	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
401	2019-09-07 00:00:00	Sábado	05:14:00	5	Municipal	Colisión con objeto fijo	Femenino	18	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
430	2020-05-25 00:00:00	Lunes	05:56:00	Fortalecillas	Municipal	Colisión con objeto fijo	Masculino	29	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
134	2014-07-20 00:00:00	Domingo	00:00:00	6	Municipal	Sin dato	Masculino	61	Ciclista	Motocicleta	Lancha/otro	Sin dato	Sin dato
143	2014-10-10 00:00:00	Viernes	00:00:00	Fortalecillas	Municipal	Colisión con objeto fijo	Masculino	48	Conductor de moto	Taxi	Sin dato	Sin dato	Sin dato
131	2014-06-29 00:00:00	Domingo	00:30:00	4	Municipal	Colisión con objeto móvil	Masculino	35	Conductor de moto	Taxi	Vehiculo particular	Sin dato	Sin dato
145	2014-10-19 00:00:00	Domingo	05:00:00	6	Municipal	Colisión con objeto móvil	Masculino	31	Conductor de moto	Taxi	Camión/Camioneta	Sin dato	Sin dato
218	2016-03-07 00:00:00	Lunes	18:25:00	6	Municipal	Peatón atropellado	Masculino	62	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
151	2014-11-30 00:00:00	Domingo	02:40:00	4	Municipal	Colisión con objeto fijo	Masculino	26	Conductor de moto	Taxi	Sin dato	Sin dato	Sin dato
160	2015-01-12 00:00:00	Lunes	03:50:00	5	Municipal	Colisión con objeto fijo	Masculino	27	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
183	2015-07-19 00:00:00	Domingo	12:55:00	9	Municipal	Colisión con objeto móvil	Masculino	39	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
186	2015-08-16 00:00:00	Domingo	05:10:00	Guacirco	Municipal	Colisión con objeto móvil	Masculino	53	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
458	2021-03-07 00:00:00	Domingo	23:17:00	3	Municipal	Colisión con objeto fijo	Masculino	21	Conductor de moto	Motocicleta	Sin dato	No aplica	No aplica
319	2018-02-07 00:00:00	Miércoles	17:12:00	4	Municipal	Peatón atropellado	Masculino	60	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
316	2018-01-05 00:00:00	Viernes	13:08:00	4	Municipal	Peatón atropellado	Masculino	94	Peatón	Autónomo (Peatón)	Vehiculo particular	No aplica	No aplica
238	2016-06-12 00:00:00	Domingo	04:00:00	3	Municipal	Colisión con objeto móvil	Masculino	34	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
165	2015-01-26 00:00:00	Lunes	07:35:00	3	Municipal	Colisión con objeto fijo	Masculino	22	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
167	2015-02-15 00:00:00	Domingo	06:35:00	El Caguán	Municipal	Colisión con objeto fijo	Masculino	22	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
168	2015-02-15 00:00:00	Domingo	06:35:00	El Caguán	Municipal	Colisión con objeto fijo	Masculino	23	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
163	2015-01-20 00:00:00	Martes	14:30:00	1	Municipal	Ciclista atropellado	Masculino	66	Ciclista	Bicicleta	Camión/Camioneta	No aplica	No aplica
242	2016-06-19 00:00:00	Domingo	13:38:00	4	Municipal	Colisión con objeto móvil	Masculino	22	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
326	2018-04-12 00:00:00	Jueves	17:46:00	4	Municipal	Peatón atropellado	Masculino	64	Peatón	Autónomo (Peatón)	Microbus/Busetón	No aplica	No aplica
162	2015-01-18 00:00:00	Domingo	10:30:00	6	Municipal	Caída de ocupante	Masculino	18	Pasajero Externo	Camión/Camioneta	No aplica	No aplica	No aplica
179	2015-06-16 00:00:00	Martes	07:40:00	5	Municipal	Colisión con objeto fijo	Masculino	26	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
471	2021-05-11 00:00:00	Martes	15:13:00	10	Municipal	Colisión con objeto fijo	Masculino	15	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
473	2021-06-24 00:00:00	Jueves	17:23:00	6	Municipal	Colisión con animales	Masculino	43	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
295	2017-07-02 00:00:00	Domingo	09:45:00	6	Municipal	Colisión con objeto móvil	Masculino	23	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
297	2017-07-16 00:00:00	Domingo	08:55:00	4	Municipal	Colisión con objeto móvil	Masculino	48	Conductor de moto	Motocicleta	Taxi	No aplica	No aplica
320	2018-02-18 00:00:00	Domingo	02:15:00	1	Municipal	Colisión con objeto móvil	Femenino	20	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
72	2013-05-09 00:00:00	Jueves	06:00:00	2	Municipal	Colisión con objeto móvil	Masculino	36	Conductor de moto	Taxi	Tractomula	Sin dato	Sin dato
60	2013-01-04 00:00:00	Viernes	05:00:00	5	Municipal	Colisión con objeto móvil	Masculino	18	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
171	2015-04-14 00:00:00	Martes	18:45:00	4	Municipal	Peatón atropellado	Masculino	76	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
184	2015-07-26 00:00:00	Domingo	00:00:00	1	Municipal	Colisión con objeto fijo	Masculino	53	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
190	2015-09-20 00:00:00	Domingo	04:47:00	Fortalecillas	Municipal	Volcamiento	Masculino	34	Conductor de vehículo	Vehiculo particular	No aplica	No aplica	No aplica
379	2019-05-07 00:00:00	Martes	06:00:00	El Caguán	Municipal	Peatón atropellado	Masculino	58	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
423	2020-01-21 00:00:00	Martes	23:05:00	6	Municipal	Peatón atropellado	Femenino	75	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
189	2015-09-20 00:00:00	Domingo	00:00:00	4	Municipal	Colisión con objeto fijo	Masculino	20	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
181	2015-06-27 00:00:00	Sábado	05:52:00	7	Municipal	Colisión con objeto fijo	Masculino	19	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
194	2015-10-20 00:00:00	Martes	00:15:00	9	Municipal	Colisión con objeto fijo	Masculino	25	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
195	2015-10-29 00:00:00	Jueves	01:41:00	5	Municipal	Colisión con objeto fijo	Masculino	17	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
66	2013-02-09 00:00:00	Sábado	00:00:00	El Caguán	Municipal	Colisión con objeto móvil	Masculino	24	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
126	2014-06-04 00:00:00	Miércoles	00:00:00	5	Municipal	Colisión con objeto móvil	Masculino	55	Conductor de moto	Taxi	Tractomula	Sin dato	Sin dato
122	2014-04-26 00:00:00	Sábado	00:00:00	10	Municipal	Colisión con objeto móvil	Masculino	18	Conductor de moto	Taxi	Taxi	Sin dato	Sin dato
191	2015-09-25 00:00:00	Viernes	00:00:00	3	Municipal	Caída de ocupante	Femenino	19	Pasajero de moto	Motocicleta	Sin dato	Sin dato	Sin dato
197	2015-11-20 00:00:00	Viernes	09:16:00	Ninguna	Municipal	Caída de ocupante	Masculino	48	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
192	2015-10-03 00:00:00	Sábado	11:00:00	5	Municipal	Peatón atropellado	Masculino	11	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
204	2015-12-25 00:00:00	Viernes	08:21:00	1	Municipal	Colisión con objeto fijo	Masculino	30	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
202	2015-12-24 00:00:00	Jueves	19:46:00	Río Las Ceibas	Municipal	Colisión con objeto fijo	Masculino	51	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
125	2014-05-24 00:00:00	Sábado	00:00:00	4	Municipal	Colisión con objeto móvil	Femenino	25	Conductor de moto	Taxi	Camión/Camioneta	Sin dato	Sin dato
170	2015-03-21 00:00:00	Sábado	20:47:00	9	Municipal	Colisión con objeto móvil	Masculino	22	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
201	2015-12-20 00:00:00	Domingo	18:40:00	Vegalarga	Municipal	Volcamiento	Femenino	46	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
210	2016-01-24 00:00:00	Domingo	13:38:00	El Caguán	Municipal	Caída de ocupante	Femenino	56	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
203	2015-12-25 00:00:00	Viernes	22:45:00	6	Municipal	Volcamiento	Masculino	18	Pasajero de vehículo	Vehiculo particular	No aplica	No aplica	No aplica
224	2016-04-01 00:00:00	Viernes	00:00:00	4	Municipal	Colisión con objeto móvil	Masculino	24	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
206	2016-01-16 00:00:00	Sábado	18:36:00	El Caguán	Municipal	Colisión con objeto móvil	Masculino	54	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
357	2018-10-12 00:00:00	Viernes	14:40:00	6	Municipal	Colisión con objeto móvil	Femenino	16	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
442	2020-10-03 00:00:00	Sábado	09:20:00	Guacirco	Municipal	Colisión con objeto móvil	Masculino	29	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
431	2020-06-16 00:00:00	Martes	17:30:00	6	Municipal	Colisión con objeto móvil	Masculino	28	Conductor de moto	Motocicleta	Sin dato	No aplica	No aplica
432	2020-07-16 00:00:00	Jueves	11:30:00	Fortalecillas	Municipal	Colisión con objeto móvil	Masculino	17	Conductor de moto	Motocicleta	Sin dato	No aplica	No aplica
211	2016-01-25 00:00:00	Lunes	17:47:00	1	Municipal	Caída de ocupante	Femenino	77	Pasajero de vehículo	Microbus/Busetón	No aplica	No aplica	No aplica
215	2016-02-14 00:00:00	Domingo	20:10:00	9	Municipal	Peatón atropellado	Femenino	73	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
214	2016-02-14 00:00:00	Domingo	19:08:00	7	Municipal	Caída de ocupante	Femenino	30	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
221	2016-03-16 00:00:00	Miércoles	21:33:00	El Caguán	Municipal	Colisión con objeto fijo	Masculino	48	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
226	2016-04-13 00:00:00	Miércoles	06:48:00	2	Municipal	Colisión con objeto fijo	Femenino	41	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
222	2016-03-18 00:00:00	Viernes	07:57:00	3	Municipal	Ciclista atropellado	Masculino	65	Ciclista	Bicicleta	Motocicleta	No aplica	No aplica
441	2020-09-18 00:00:00	Viernes	13:30:00	4	Municipal	Colisión con objeto móvil	Masculino	22	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
227	2016-04-28 00:00:00	Jueves	05:07:00	1	Municipal	Colisión con objeto fijo	Masculino	23	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
426	2020-01-31 00:00:00	Viernes	19:03:00	5	Municipal	Peatón atropellado	Masculino	66	Peatón	Autónomo (Peatón)	Vehiculo particular	No aplica	No aplica
239	2016-06-17 00:00:00	Viernes	00:00:00	2	Municipal	Colisión con objeto fijo	Masculino	28	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
455	2021-02-10 00:00:00	Miércoles	20:10:00	6	Municipal	Colisión con objeto móvil	Masculino	57	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
450	2020-12-24 00:00:00	Jueves	12:30:00	2	Municipal	Colisión con objeto móvil	Masculino	25	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
451	2020-12-25 00:00:00	Viernes	01:04:00	1	Municipal	Colisión con objeto móvil	Masculino	57	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
489	2021-10-20 00:00:00	Miércoles	17:44:00	1	Municipal	Colisión con objeto móvil	Masculino	25	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
477	2021-08-07 00:00:00	Sábado	03:58:00	6	Municipal	Colisión con objeto móvil	Masculino	36	Conductor de moto	Particular	Sin dato	Sin dato	Sin dato
236	2016-05-23 00:00:00	Lunes	10:35:00	4	Municipal	Peatón atropellado	Masculino	50	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
233	2016-05-10 00:00:00	Martes	00:00:00	10	Municipal	Caída de ocupante	Femenino	66	Pasajero Externo	Microbus/Busetón	No aplica	No aplica	No aplica
234	2016-05-11 00:00:00	Miércoles	16:40:00	El Caguán	Municipal	Ciclista atropellado	Masculino	59	Ciclista	Bicicleta	Motocicleta	No aplica	No aplica
250	2016-07-20 00:00:00	Miércoles	14:30:00	10	Municipal	Colisión con objeto fijo	Masculino	31	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
246	2016-07-08 00:00:00	Viernes	13:00:00	4	Municipal	Peatón atropellado	Masculino	76	Peatón	Autónomo (Peatón)	Camión/Camioneta	No aplica	No aplica
247	2016-07-08 00:00:00	Viernes	06:30:00	6	Municipal	Peatón atropellado	Femenino	64	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
244	2016-07-02 00:00:00	Sábado	21:00:00	5	Municipal	Colisión con objeto fijo	Masculino	52	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
245	2016-07-03 00:00:00	Domingo	13:30:00	5	Municipal	Colisión con objeto fijo	Masculino	25	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
249	2016-07-17 00:00:00	Domingo	03:00:00	6	Municipal	Colisión con objeto fijo	Masculino	25	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
252	2016-08-16 00:00:00	Martes	09:51:00	6	Municipal	Volcamiento	Masculino	22	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
259	2016-10-06 00:00:00	Jueves	03:40:00	3	Municipal	Colisión con objeto fijo	Masculino	22	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
257	2016-09-05 00:00:00	Lunes	02:58:00	6	Municipal	Peatón atropellado	Masculino	20	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
258	2016-09-17 00:00:00	Sábado	02:32:00	6	Municipal	Colisión con objeto fijo	Masculino	20	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
142	2014-09-28 00:00:00	Domingo	00:00:00	7	Municipal	Ciclista atropellado	Masculino	79	Ciclista	Motocicleta	Lancha/otro	Sin dato	Sin dato
542	2022-09-13 00:00:00	Sábado	10:31:00	6	Municipal	Colisión con objeto móvil	Masculino	24	Conductor de moto	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica
543	2022-09-18 00:00:00	Sábado	00:05:00	6	Nacional	Colisión con objeto móvil	Masculino	30	Conductor de moto	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica
263	2016-10-22 00:00:00	Sábado	17:27:00	Ninguna	Nacional	Colisión con objeto fijo	Masculino	85	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
269	2016-12-23 00:00:00	Viernes	04:40:00	4	Municipal	Colisión con objeto fijo	Masculino	38	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
268	2016-12-03 00:00:00	Sábado	23:00:00	10	Municipal	Colisión con objeto fijo	Femenino	21	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
367	2019-01-27 00:00:00	Domingo	07:39:00	4	Municipal	Colisión con objeto móvil	Masculino	54	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
266	2016-11-09 00:00:00	Miércoles	15:43:00	4	Municipal	Peatón atropellado	Femenino	87	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
549	2022-11-01 00:00:00	Sábado	\N	4	Municipal	Colisión con objeto móvil	Masculino	23	Conductor de moto	Conductor de moto	No reportada	\N	\N
164	2015-01-22 00:00:00	Jueves	04:23:00	7	Municipal	Ciclista atropellado	Masculino	84	Ciclista	Bicicleta	Vehiculo particular	No aplica	No aplica
114	2014-01-31 00:00:00	Viernes	00:00:00	7	Municipal	Sin dato	Masculino	28	Sin Dato	Lancha/otro	Lancha/otro	Lancha/otro	Lancha/otro
271	2017-01-01 00:00:00	Domingo	05:26:00	4	Municipal	Colisión con objeto fijo	Masculino	36	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
410	2019-10-13 00:00:00	Domingo	00:31:00	7	Municipal	Colisión con objeto móvil	Masculino	18	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
449	2020-12-20 00:00:00	Domingo	15:03:00	4	Municipal	Colisión con objeto móvil	Masculino	51	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
487	2021-10-17 00:00:00	Domingo	22:15:00	5	Municipal	Colisión con objeto móvil	Masculino	32	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
48	2012-10-15 00:00:00	Lunes	00:00:00	3	Municipal	Sin dato	Masculino	24	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
272	2017-01-01 00:00:00	Domingo	08:00:00	El Caguán	Municipal	Colisión con objeto fijo	Masculino	12	Pasajero de vehículo	Vehiculo particular	No aplica	No aplica	No aplica
279	2017-04-13 00:00:00	Jueves	23:21:00	6	Municipal	Peatón atropellado	Masculino	67	Peatón	Autónomo (Peatón)	Microbus/Busetón	No aplica	No aplica
288	2017-06-11 00:00:00	Domingo	00:18:00	Río Las Ceibas	Municipal	Volcamiento	Masculino	17	Conductor de vehículo	Vehiculo particular	No aplica	No aplica	No aplica
506	2021-12-25 00:00:00	Sábado	16:15:00	4	Municipal	Colisión con objeto móvil	Masculino	32	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
284	2017-06-04 00:00:00	Domingo	04:30:00	El Caguán	Municipal	Colisión con objeto fijo	Masculino	29	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
83	2013-07-01 00:00:00	Lunes	00:00:00	3	Municipal	Sin dato	Masculino	37	Conductor de moto	Motocicleta	Sin dato	No aplica	No aplica
289	2017-06-12 00:00:00	Lunes	13:30:00	3	Municipal	Peatón atropellado	Masculino	50	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
30	2012-06-25 00:00:00	Lunes	21:30:00	4	Municipal	Colisión con objeto móvil	Masculino	44	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
35	2012-07-30 00:00:00	Lunes	07:32:00	1	Municipal	Colisión con objeto móvil	Masculino	23	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
300	2017-08-26 00:00:00	Sábado	\N	9	Municipal	Peatón atropellado	Femenino	56	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
40	2012-09-03 00:00:00	Lunes	00:00:00	1	Municipal	Colisión con objeto móvil	Femenino	47	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
507	2021-12-25 00:00:00	Sábado	20:19:00	1	Municipal	Colisión con objeto móvil	Masculino	74	Ciclista	Bicicleta	Motocicleta	No aplica	No aplica
46	2012-09-17 00:00:00	Lunes	20:47:00	9	Municipal	Colisión con objeto móvil	Masculino	24	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
118	2014-03-17 00:00:00	Lunes	00:00:00	6	Municipal	Colisión con objeto móvil	Masculino	19	Conductor de moto	Taxi	Camión/Camioneta	Sin dato	Sin dato
121	2014-04-21 00:00:00	Lunes	00:00:00	4	Municipal	Colisión con objeto móvil	Masculino	58	Conductor de moto	Taxi	Vehiculo particular	Sin dato	Sin dato
232	2016-05-09 00:00:00	Lunes	07:38:00	6	Municipal	Colisión con objeto móvil	Masculino	56	Conductor de moto	Motocicleta	Vehiculo particular	Vehiculo particular	No aplica
344	2018-07-23 00:00:00	Lunes	05:24:00	El Caguán	Municipal	Colisión con objeto móvil	Masculino	42	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
303	2017-09-23 00:00:00	Sábado	17:01:00	1	Municipal	Colisión con objeto fijo	Masculino	56	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
148	2014-11-16 00:00:00	Domingo	04:20:00	5	Municipal	Colisión con objeto fijo	Femenino	29	Conductor de moto	Taxi	Sin dato	Sin dato	Sin dato
305	2017-10-06 00:00:00	Viernes	23:10:00	1	Municipal	Caída de ocupante	Masculino	58	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
9	2012-02-05 00:00:00	Domingo	03:25:00	3	Municipal	Colisión con objeto fijo	Masculino	25	Motociclista	Motocicleta	Buseta	No aplica	No aplica
149	2014-11-16 00:00:00	Domingo	00:00:00	1	Municipal	Colisión con objeto fijo	Masculino	36	Conductor de moto	Taxi	Sin dato	Sin dato	Sin dato
387	2019-06-09 00:00:00	Domingo	07:47:00	3	Municipal	Colisión con objeto fijo	Masculino	21	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
315	2017-12-25 00:00:00	Lunes	22:17:00	6	Municipal	Colisión con objeto fijo	Masculino	33	Conductor de vehículo	Camión/Camioneta	Lancha/otro	No aplica	No aplica
78	2013-06-16 00:00:00	Domingo	00:00:00	Ninguna	Nacional	Volcamiento	Masculino	11	Pasajero de vehículo	Vehiculo particular	No aplica	No aplica	No aplica
311	2017-11-30 00:00:00	Jueves	08:28:00	4	Municipal	Peatón atropellado	Masculino	74	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
73	2013-05-19 00:00:00	Domingo	00:00:00	3	Municipal	Sin dato	Femenino	56	Sin Dato	Sin dato	Motocicleta	No aplica	No aplica
13	2012-04-15 00:00:00	Domingo	22:10:00	2	Municipal	Caída de ocupante	Femenino	42	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
328	2018-04-28 00:00:00	Sábado	04:23:00	1	Municipal	Volcamiento	Masculino	21	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
324	2018-04-05 00:00:00	Jueves	04:50:00	3	Municipal	Colisión con objeto fijo	Masculino	38	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
323	2018-03-14 00:00:00	Miércoles	15:51:00	4	Municipal	Peatón atropellado	Femenino	55	Peatón	Autónomo (Peatón)	Microbus/Busetón	No aplica	No aplica
29	2012-06-24 00:00:00	Domingo	00:00:00	Ninguna	Municipal	Peatón atropellado	Masculino	73	Peatón	Autónomo (Peatón)	Camión/Camioneta	No aplica	No aplica
111	2014-01-05 00:00:00	Domingo	00:00:00	6	Municipal	Sin dato	Masculino	35	Sin Dato	Lancha/otro	Lancha/otro	Sin dato	Sin dato
273	2017-01-01 00:00:00	Domingo	08:00:00	El Caguán	Municipal	Colisión con objeto fijo	Masculino	32	Conductor de vehículo	Vehiculo particular	No aplica	No aplica	No aplica
338	2018-06-21 00:00:00	Jueves	08:11:00	9	Municipal	Volcamiento	Masculino	37	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
277	2017-02-19 00:00:00	Domingo	03:35:00	6	Municipal	Colisión con objeto fijo	Masculino	25	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
457	2021-02-15 00:00:00	Lunes	08:05:00	6	Municipal	Colisión con objeto móvil	Masculino	20	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
332	2018-05-30 00:00:00	Miércoles	00:00:00	Ninguna	Municipal	Caída de ocupante	Masculino	86	Pasajero de vehículo	Autónomo (Peatón)	Microbus/Busetón	No aplica	No aplica
334	2018-06-02 00:00:00	Sábado	19:02:00	5	Municipal	Peatón atropellado	Masculino	68	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
527	2022-06-28 00:00:00	Domingo	17:40:00	8	Municipal	Peatón atropellado	Femenino	76	Peatón	Peatón	Autónomo (Peatón)	Motocicleta	No aplica
350	2018-09-01 00:00:00	Sábado	23:15:00	Fortalecillas	Municipal	Colisión con objeto fijo	Femenino	55	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
296	2017-07-09 00:00:00	Domingo	\N	1	Municipal	Colisión con objeto fijo	Masculino	39	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
346	2018-08-06 00:00:00	Lunes	12:34:00	2	Municipal	Peatón atropellado	Masculino	60	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
343	2018-07-12 00:00:00	Jueves	09:43:00	4	Municipal	Peatón atropellado	Femenino	64	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
308	2017-10-22 00:00:00	Domingo	12:57:00	2	Municipal	Peatón atropellado	Masculino	6	Peatón	Autónomo (Peatón)	Vehiculo particular	No aplica	No aplica
351	2018-09-01 00:00:00	Sábado	16:05:00	9	Municipal	Peatón atropellado	Masculino	62	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
356	2018-10-06 00:00:00	Sábado	21:50:00	3	Municipal	Colisión con objeto fijo	Masculino	20	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
314	2017-12-17 00:00:00	Domingo	17:43:00	3	Municipal	Colisión con objeto fijo	Masculino	22	Conductor de moto	Motocicleta	Lancha/otro	No aplica	No aplica
352	2018-09-05 00:00:00	Miércoles	08:20:00	10	Municipal	Colisión con objeto fijo	Masculino	20	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
354	2018-09-14 00:00:00	Viernes	23:42:00	8	Municipal	Colisión con objeto fijo	Masculino	24	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
355	2018-09-17 00:00:00	Lunes	19:13:00	5	Municipal	Peatón atropellado	Femenino	47	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
552	2022-11-13 00:00:00	Martes	04:21:00	3	Municipal	Volcamiento	Masculino	21	Conductor de moto	Conductor de moto	Motocicleta	No aplica	No aplica
556	2022-12-10 00:00:00	Martes	23:15:00	Vegalarga	Municipal	Caída de ocupante	Masculino	20	Conductor de moto	Conductor de moto	Motocicleta	No aplica	No aplica
336	2018-06-10 00:00:00	Domingo	01:06:00	6	Municipal	Volcamiento	Masculino	39	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
339	2018-06-26 00:00:00	Martes	\N	2	Municipal	Colisión con objeto móvil	Masculino	50	Conductor de moto	Motocicleta	Autónomo (Peatón)	No aplica	No aplica
399	2019-08-27 00:00:00	Martes	06:56:00	4	Municipal	Colisión con objeto móvil	Masculino	17	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
364	2018-12-26 00:00:00	Miércoles	16:37:00	4	Municipal	Peatón atropellado	Masculino	61	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
372	2019-03-02 00:00:00	Sábado	05:25:00	6	Municipal	Peatón atropellado	Femenino	23	Peatón	Autónomo (Peatón)	Camión/Camioneta	No aplica	No aplica
490	2021-10-24 00:00:00	Domingo	01:00:00	Guacirco	Municipal	Colisión con objeto fijo	Masculino	30	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
390	2019-06-28 00:00:00	Viernes	01:30:00	Fortalecillas	Municipal	Caída de ocupante	Masculino	49	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
384	2019-05-28 00:00:00	Martes	08:27:00	Río Las Ceibas	Municipal	Caída de ocupante	Masculino	55	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
50	2012-11-18 00:00:00	Domingo	00:00:00	4	Municipal	Colisión con objeto móvil	Femenino	19	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
412	2019-10-29 00:00:00	Martes	05:26:00	4	Municipal	Colisión con objeto móvil	Masculino	53	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
383	2019-05-27 00:00:00	Lunes	08:23:00	4	Municipal	Peatón atropellado	Masculino	86	Peatón	Autónomo (Peatón)	Sin dato	No aplica	No aplica
386	2019-06-07 00:00:00	Viernes	06:36:00	2	Municipal	Peatón atropellado	Masculino	66	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
385	2019-06-02 00:00:00	Domingo	08:45:00	7	Municipal	Colisión con objeto fijo	Masculino	68	Ciclista	Bicicleta	No aplica	No aplica	No aplica
391	2019-06-30 00:00:00	Domingo	22:00:00	Vegalarga	Municipal	Colisión con objeto fijo	Masculino	15	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
400	2019-09-02 00:00:00	Lunes	08:12:00	Vegalarga	Municipal	Volcamiento	Masculino	43	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
495	2021-11-09 00:00:00	Martes	15:27:00	6	Municipal	Colisión con objeto móvil	Masculino	27	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
158	2014-12-24 00:00:00	Miércoles	19:00:00	6	Municipal	Colisión con objeto móvil	Masculino	53	Conductor de moto	Taxi	Taxi	Sin dato	Sin dato
393	2019-07-29 00:00:00	Lunes	06:40:00	2	Municipal	Peatón atropellado	Masculino	70	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
176	2015-05-13 00:00:00	Miércoles	18:55:00	6	Municipal	Colisión con objeto móvil	Masculino	17	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
493	2021-10-27 00:00:00	Miércoles	16:15:00	6	Municipal	Colisión con objeto móvil	Masculino	34	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
123	2014-05-01 00:00:00	Jueves	00:00:00	El Caguán	Municipal	Sin dato	Masculino	43	Conductor de moto	Taxi	Lancha/otro	Sin dato	Sin dato
70	2013-04-14 00:00:00	Domingo	00:00:00	El Caguán	Municipal	Colisión con objeto móvil	Masculino	42	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
75	2013-05-26 00:00:00	Domingo	00:00:00	4	Municipal	Colisión con objeto móvil	Masculino	22	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
98	2013-10-20 00:00:00	Domingo	00:00:00	6	Municipal	Colisión con objeto móvil	Masculino	22	Ciclista	Bicicleta	Taxi	No aplica	No aplica
106	2013-12-15 00:00:00	Domingo	00:00:00	El Caguán	Municipal	Colisión con objeto móvil	Masculino	56	Ciclista	Motocicleta	Vehiculo particular	Sin dato	Sin dato
414	2019-11-09 00:00:00	Sábado	04:20:00	Guacirco	Nacional	Colisión con objeto fijo	Masculino	68	Pasajero de vehículo	Vehiculo particular	No aplica	No aplica	No aplica
419	2019-12-30 00:00:00	Lunes	11:30:00	4	Municipal	Colisión con objeto fijo	Masculino	53	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
411	2019-10-27 00:00:00	Domingo	09:13:00	1	Municipal	Colisión con objeto fijo	Masculino	64	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
415	2019-11-17 00:00:00	Domingo	03:00:00	6	Municipal	Colisión con objeto fijo	Masculino	46	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
459	2021-03-11 00:00:00	Jueves	23:17:00	1	Municipal	Volcamiento	Femenino	49	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
110	2014-01-02 00:00:00	Jueves	00:00:00	5	Municipal	Colisión con objeto móvil	Masculino	22	Conductor de moto	Taxi	Vehiculo particular	Sin dato	Sin dato
424	2020-01-22 00:00:00	Miércoles	13:15:00	9	Municipal	Volcamiento	Masculino	64	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
428	2020-02-08 00:00:00	Sábado	20:50:00	10	Municipal	Volcamiento	Masculino	56	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
182	2015-07-19 00:00:00	Domingo	11:00:00	6	Municipal	Colisión con objeto móvil	Femenino	24	Pasajero de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
421	2020-01-12 00:00:00	Domingo	11:00:00	6	Municipal	Caída de ocupante	Masculino	30	Pasajero de vehículo	Autónomo (Peatón)	Tractomula	No aplica	No aplica
422	2020-01-16 00:00:00	Jueves	00:00:00	5	Municipal	Peatón atropellado	Masculino	80	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
435	2020-09-09 00:00:00	Miércoles	19:27:00	9	Municipal	Peatón atropellado	Masculino	83	Peatón	Autónomo (Peatón)	Público	No aplica	No aplica
436	2020-09-22 00:00:00	Martes	15:00:00	3	Municipal	Colisión	Masculino	26	Conductor de moto	Motocicleta	Particular	No aplica	No aplica
437	2020-09-20 00:00:00	Domingo	16:04:00	Fortalecillas	Municipal	Colisión con objeto fijo	Masculino	24	Conductor de moto	Motocicleta	Particular	No aplica	No aplica
438	2020-09-26 00:00:00	Sábado	12:15:00	Vegalarga	Municipal	Volcamiento	Masculino	53	Pasajero	Camión/Camioneta	No aplica	No aplica	No aplica
434	2020-08-12 00:00:00	Miércoles	19:27:00	7	Municipal	Sin dato	Masculino	21	Conductor de moto	Sin dato	Sin dato	No aplica	No aplica
433	2020-07-24 00:00:00	Viernes	17:10:00	8	Municipal	Volcamiento	Femenino	28	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
185	2015-08-16 00:00:00	Domingo	05:10:00	Guacirco	Municipal	Colisión con objeto móvil	Masculino	44	Pasajero de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
547	2022-10-31 00:00:00	Viernes	23:49:00	4	Municipal	Volcamiento	Masculino	57	Conductor de moto	Conductor de moto	Motocicleta	No aplica	No aplica
443	2020-10-09 00:00:00	Viernes	05:00:00	6	Municipal	Peatón atropellado	Masculino	25	Peatón	Autónomo (Peatón)	Camión/Camioneta	No aplica	No aplica
445	2020-10-26 00:00:00	Lunes	09:04:00	9	Municipal	Volcamiento	Masculino	52	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
446	2020-11-22 00:00:00	Domingo	11:34:00	1	Municipal	Colisión con objeto fijo	Masculino	43	Conductor de moto	Motocicleta	Sin dato	No aplica	No aplica
447	2020-12-06 00:00:00	Domingo	00:30:00	El Caguán	Municipal	Colisión con objeto fijo	Masculino	22	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
452	2020-12-31 00:00:00	Jueves	00:00:00	Fortalecillas	Municipal	Peatón atropellado	Masculino	81	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
453	2021-01-08 00:00:00	Viernes	22:40:00	Guacirco	Municipal	Volcamiento	Masculino	33	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
460	2021-03-13 00:00:00	Sábado	02:44:00	4	Municipal	Colisión con objeto fijo	Masculino	58	Ciclista	Bicicleta	Vehiculo particular	No aplica	No aplica
468	2021-04-25 00:00:00	Domingo	08:20:00	1	Municipal	Colisión con objeto fijo	Masculino	33	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
462	2021-02-14 00:00:00	Domingo	05:44:00	El Caguán	Municipal	Volcamiento	Femenino	31	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
200	2015-12-11 00:00:00	Viernes	04:40:00	6	Municipal	Colisión con objeto móvil	Masculino	29	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
467	2021-04-19 00:00:00	Lunes	05:13:00	9	Municipal	Peatón atropellado	Masculino	6	Peatón	Autónomo (Peatón)	Particular	No aplica	No aplica
470	2021-05-06 00:00:00	Jueves	03:00:00	4	Municipal	Peatón atropellado	Femenino	72	Peatón	Autónomo (Peatón)	Microbus/Busetón	No aplica	No aplica
205	2016-01-01 00:00:00	Viernes	02:36:00	6	Municipal	Colisión con objeto móvil	Masculino	33	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
267	2016-11-26 00:00:00	Sábado	20:31:00	3	Municipal	Volcamiento	Masculino	29	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
329	2018-04-28 00:00:00	Sábado	18:30:00	Vegalarga	Municipal	Volcamiento	Masculino	59	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
476	2021-08-02 00:00:00	Lunes	23:00:00	1	Municipal	Volcamiento	Masculino	42	Conductor de moto	Particular	Sin dato	Sin dato	Sin dato
478	2021-08-14 00:00:00	Sábado	03:58:00	Vegalarga	Municipal	Volcamiento	Masculino	53	Conductor Camioneta	Particular	No aplica	No aplica	No aplica
475	2021-08-01 00:00:00	Domingo	14:50:00	1	Municipal	Volcamiento	Masculino	49	Conductor de moto	Particular	Sin dato	Sin dato	Sin dato
474	2021-07-25 00:00:00	Domingo	03:36:00	San Luis	Municipal	Sin dato	Masculino	27	Conductor de moto	Motocicleta	Sin dato	Sin dato	Sin dato
243	2016-06-19 00:00:00	Domingo	09:37:00	7	Municipal	Colisión con objeto móvil	Masculino	10	Pasajero de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
482	2021-09-20 00:00:00	Lunes	00:29:00	9	Municipal	Colisión con objeto fijo	Masculino	25	Conductor de moto	Motocicleta	Particular	No aplica	Particular
481	2021-08-30 00:00:00	Lunes	00:29:00	7	Municipal	Caída de ocupante	Masculino	21	Peatón	No aplica	No aplica	No aplica	Particular
485	2021-10-03 00:00:00	Domingo	05:30:00	1	Municipal	Colisión con objeto fijo	Masculino	26	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
28	2012-06-23 00:00:00	Sábado	06:35:00	1	Municipal	Colisión con objeto móvil	Masculino	47	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
44	2012-09-08 00:00:00	Sábado	07:18:00	2	Municipal	Colisión con objeto móvil	Masculino	53	Conductor de moto	Motocicleta	Sin dato	No aplica	No aplica
213	2016-02-13 00:00:00	Sábado	19:46:00	4	Municipal	Colisión con objeto móvil	Masculino	44	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
486	2021-10-13 00:00:00	Miércoles	06:30:00	9	Nacional	Sin dato	Masculino	30	Peatón	No aplica	No aplica	No aplica	No aplica
492	2021-10-27 00:00:00	Miércoles	\N	5	Municipal	Sin dato	Masculino	76	Sin Dato	Sin dato	Sin dato	Sin dato	Sin dato
255	2016-08-28 00:00:00	Domingo	00:30:00	El Caguán	Municipal	Colisión con objeto móvil	Masculino	19	Pasajero de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
497	2021-11-11 00:00:00	Jueves	23:15:00	2	Municipal	Volcamiento	Masculino	22	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
499	2021-11-15 00:00:00	Lunes	15:11:00	San Antonio	Municipal	Volcamiento	Femenino	62	Pasajero de vehículo	Camión/Camioneta	No aplica	No aplica	No aplica
496	2021-11-09 00:00:00	Martes	21:00:00	6	Municipal	Peatón atropellado	Masculino	47	Peatón	No aplica	Motocicleta	No aplica	No aplica
491	2021-10-26 00:00:00	Martes	22:00:00	El Caguán	Municipal	Colisión con objeto fijo	Masculino	47	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
494	2021-11-05 00:00:00	Viernes	\N	6	Municipal	Volcamiento	Femenino	40	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
501	2021-11-29 00:00:00	Lunes	01:10:00	3	Municipal	Colisión con objeto fijo	Masculino	43	Conductor de vehículo	Motocicleta	No aplica	No aplica	No aplica
505	2021-12-24 00:00:00	Viernes	13:09:00	8	Municipal	Volcamiento	Femenino	23	Conductor de moto	Motocicleta	No aplica	No aplica	No aplica
349	2018-09-01 00:00:00	Sábado	16:15:00	9	Municipal	Colisión con objeto móvil	Masculino	41	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
509	2022-02-06 00:00:00	Domingo	19:50:00	1	Municipal	No reportada	Masculino	22	Conductor moto	Conductor moto	Motocicleta	No aplica	No aplica
504	2021-12-21 00:00:00	Martes	18:59:00	10	Municipal	Peatón atropellado	Masculino	67	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
502	2021-12-07 00:00:00	Martes	16:04:00	4	Municipal	Sin dato	Masculino	58	Sin Dato	Sin dato	Sin dato	No aplica	No aplica
510	2022-02-26 00:00:00	Martes	07:13:00	1	Municipal	No reportada	Masculino	34	No reportada	No reportada	No reportada	No reportada	No reportada
376	2019-03-30 00:00:00	Sábado	12:56:00	5	Municipal	Colisión con objeto móvil	Femenino	23	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
396	2019-08-17 00:00:00	Sábado	16:07:00	El Caguán	Municipal	Colisión con objeto móvil	Masculino	41	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
256	2016-08-28 00:00:00	Domingo	00:30:00	El Caguán	Municipal	Colisión con objeto móvil	Masculino	25	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
260	2016-10-16 00:00:00	Domingo	09:18:00	3	Municipal	Colisión con objeto móvil	Masculino	29	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
261	2016-10-16 00:00:00	Domingo	05:55:00	6	Departamental	Colisión con objeto móvil	Masculino	24	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
397	2019-08-24 00:00:00	Sábado	23:43:00	4	Municipal	Colisión con objeto móvil	Masculino	24	Conductor de moto	Motocicleta	Taxi	No aplica	No aplica
518	2022-05-22 00:00:00	Sábado	12:17:00	Río Las Ceibas	Municipal	Volcamiento	Femenino	32	Conductor moto	Conductor moto	Motocicleta	No aplica	No aplica
511	2022-03-11 00:00:00	Viernes	14:15:00	2	Municipal	Peatón atropellado	Masculino	81	Peatón	Peatón	No aplica	Motocicleta	No aplica
512	2022-03-13 00:00:00	Sábado	18:00:00	2	Municipal	Peatón atropellado	Femenino	36	Peatón	Peatón	Autónomo (Peatón)	Vehiculo particular	No aplica
523	2022-06-22 00:00:00	Viernes	15:36:00	1	Municipal	Peatón atropellado	Femenino	67	Peatón	Peatón	No aplica	Motocicleta	No aplica
406	2019-09-28 00:00:00	Sábado	20:54:00	6	Municipal	Colisión con objeto móvil	Masculino	48	Conductor de moto	Motocicleta	Tractomula	No aplica	No aplica
413	2019-11-02 00:00:00	Sábado	14:00:00	6	Municipal	Colisión con objeto móvil	Masculino	24	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
94	2013-09-13 00:00:00	Viernes	04:10:00	Ninguna	Nacional	Volcamiento	Masculino	39	Conductor de vehículo	Vehiculo particular	Sin dato	Sin dato	Sin dato
220	2016-03-12 00:00:00	Sábado	03:14:00	2	Municipal	Colisión con objeto fijo	Masculino	44	Conductor de vehículo	Vehiculo particular	No aplica	No aplica	No aplica
526	2022-06-27 00:00:00	Martes	13:50:00	San Luis	Municipal	Otra clase de accidente	Masculino	45	Conductor de vehículo	Conductor vehiculo	Vehiculo particular	No aplica	No aplica
525	2022-06-24 00:00:00	Sábado	12:05:00	6	Municipal	Ciclista atropellado	Masculino	78	Ciclista	Ciclista	Bicicleta	Motocicleta	No aplica
274	2017-01-01 00:00:00	Domingo	08:10:00	3	Municipal	Colisión con objeto móvil	Masculino	54	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
540	2022-08-28 00:00:00	Martes	04:30:00	6	Municipal	Caída de ocupante	Masculino	44	Pasajero moto	Pasajero moto	Motocicleta	No aplica	No aplica
281	2017-04-23 00:00:00	Domingo	22:00:00	6	Municipal	Colisión con objeto móvil	Masculino	29	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
536	2022-08-08 00:00:00	Sábado	15:30:00	Chapinero	Municipal	Colisión con objeto fijo	Masculino	51	Conductor moto	Conductor moto	Motocicleta	No aplica	No aplica
389	2019-06-26 00:00:00	Miércoles	02:39:00	1	Municipal	Colisión con objeto fijo	Masculino	44	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
208	2016-01-20 00:00:00	Miércoles	20:23:00	6	Municipal	Caída de ocupante	Femenino	19	Pasajero de moto	Motocicleta	Tractomula	No aplica	No aplica
133	2014-07-05 00:00:00	Sábado	00:00:00	8	Municipal	Colisión con objeto móvil	Masculino	47	Pasajero de moto	Taxi	Camión/Camioneta	Sin dato	Sin dato
533	2022-07-19 00:00:00	Domingo	14:20:00	1	Municipal	Colisión con objeto fijo	Femenino	21	Conductor moto	Conductor moto	Motocicleta	No aplica	No aplica
291	2017-06-19 00:00:00	Lunes	08:28:00	2	Municipal	Colisión con objeto fijo	Femenino	53	Pasajero de vehículo	Vehiculo particular	Tractomula	No aplica	No aplica
544	2022-09-18 00:00:00	Martes	03:10:00	9	Municipal	Colisión con objeto fijo	Masculino	30	Conductor de moto	Conductor de moto	Motocicleta	No aplica	No aplica
285	2017-06-04 00:00:00	Domingo	18:09:00	6	Municipal	Colisión con objeto móvil	Femenino	65	Pasajero de vehículo	Vehiculo particular	Vehiculo particular	Microbus/Busetón	No aplica
231	2016-05-09 00:00:00	Lunes	07:38:00	6	Municipal	Colisión con objeto móvil	Masculino	23	Pasajero de vehículo	Vehiculo particular	Vehiculo particular	Motocicleta	No aplica
31	2012-07-01 00:00:00	Domingo	20:30:00	5	Municipal	Peatón atropellado	Masculino	56	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
172	2015-04-25 00:00:00	Sábado	16:40:00	4	Municipal	Peatón atropellado	Masculino	80	Peatón	Autónomo (Peatón)	Microbus/Busetón	No aplica	No aplica
548	2022-11-01 00:00:00	Sábado	19:32:00	4	Municipal	Peatón atropellado	Masculino	61	Peatón	Peatón	Autónomo (Peatón)	No aplica	No aplica
286	2017-06-04 00:00:00	Domingo	18:09:00	6	Municipal	Colisión con objeto móvil	Masculino	70	Conductor de vehículo	Vehiculo particular	Vehiculo particular	Microbus/Busetón	No aplica
175	2015-05-10 00:00:00	Domingo	01:06:00	1	Municipal	Peatón atropellado	Masculino	40	Peatón	Autónomo (Peatón)	Taxi	No aplica	No aplica
304	2017-09-24 00:00:00	Domingo	18:30:00	Guacirco	Nacional	Colisión con objeto móvil	Masculino	58	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
327	2018-04-15 00:00:00	Domingo	19:30:00	Guacirco	Nacional	Colisión con objeto móvil	Masculino	38	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
180	2015-06-24 00:00:00	Miércoles	07:00:00	3	Municipal	Peatón atropellado	Masculino	85	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
217	2016-03-02 00:00:00	Miércoles	14:57:00	7	Municipal	Peatón atropellado	Femenino	82	Peatón	Autónomo (Peatón)	Taxi	No aplica	No aplica
174	2015-05-07 00:00:00	Jueves	19:10:00	6	Municipal	Peatón atropellado	Femenino	55	Peatón	Autónomo (Peatón)	Vehiculo particular	No aplica	No aplica
553	2022-11-16 00:00:00	Viernes	18:00:00	6	Municipal	Peatón atropellado	Masculino	72	Peatón	Peatón	Autónomo (Peatón)	Motocicleta	No aplica
560	2022-12-24 00:00:00	Sábado	14:15:00	6	Municipal	Colisión con objeto fijo	Masculino	41	Conductor moto	Conductor moto	Motocicleta	No aplica	No aplica
6	2012-01-29 00:00:00	Domingo	00:00:00	2	Municipal	Colisión con objeto móvil	Masculino	49	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
18	2012-05-02 00:00:00	Miércoles	10:22:00	10	Municipal	Colisión con objeto móvil	Masculino	24	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
19	2012-05-05 00:00:00	Sábado	23:15:00	2	Municipal	Colisión con objeto móvil	Masculino	19	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
10	2012-02-10 00:00:00	Viernes	17:45:00	5	Municipal	Colisión con objeto móvil	Femenino	40	Pasajero de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
178	2015-05-29 00:00:00	Viernes	22:05:00	1	Municipal	Peatón atropellado	Femenino	17	Peatón	Autónomo (Peatón)	Camión/Camioneta	No aplica	No aplica
24	2012-05-22 00:00:00	Martes	12:17:00	5	Municipal	Colisión con objeto móvil	Femenino	30	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
25	2012-05-22 00:00:00	Martes	12:17:00	5	Municipal	Colisión con objeto móvil	Femenino	47	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
27	2012-06-23 00:00:00	Sábado	06:35:00	1	Municipal	Colisión con objeto móvil	Masculino	27	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
32	2012-07-03 00:00:00	Martes	10:50:00	5	Municipal	Colisión con objeto móvil	Femenino	4	Pasajero de moto	Motocicleta	Motocicleta	No aplica	No aplica
325	2018-04-11 00:00:00	Miércoles	19:05:00	2	Municipal	Peatón atropellado	Femenino	3	Peatón	Autónomo (Peatón)	Vehiculo particular	No aplica	No aplica
425	2020-01-23 00:00:00	Jueves	15:15:00	6	Municipal	Peatón atropellado	Masculino	78	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
63	2013-01-21 00:00:00	Lunes	06:30:00	6	Municipal	Colisión con objeto móvil	Masculino	29	Conductor de moto	Taxi	Camión/Camioneta	Sin dato	Sin dato
76	2013-05-28 00:00:00	Martes	00:00:00	4	Municipal	Colisión con objeto móvil	Masculino	46	Conductor de moto	Taxi	Taxi	Sin dato	Sin dato
57	2012-12-19 00:00:00	Miércoles	00:00:00	4	Municipal	Colisión con objeto móvil	Masculino	25	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
229	2016-04-30 00:00:00	Sábado	00:00:00	7	Municipal	Peatón atropellado	Masculino	85	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
429	2020-03-11 00:00:00	Martes	20:21:00	3	Municipal	Peatón atropellado	Masculino	68	Peatón	Autónomo (Peatón)	Bicicleta	No aplica	No aplica
80	2013-06-18 00:00:00	Martes	00:00:00	4	Municipal	Colisión con objeto móvil	Masculino	68	Sin Dato	Lancha/otro	Taxi	Sin dato	Sin dato
554	2022-11-26 00:00:00	Sábado	09:33:00	4	Municipal	Peatón atropellado	Femenino	64	Peatón	Peatón	Autónomo (Peatón)	No aplica	No aplica
555	2022-12-07 00:00:00	Sábado	17:28:00	4	Municipal	Peatón atropellado	Femenino	78	Peatón	Peatón	Autónomo (Peatón)	No aplica	No aplica
282	2017-05-23 00:00:00	Martes	13:30:00	6	Municipal	Peatón atropellado	Masculino	84	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
292	2017-06-27 00:00:00	Martes	05:53:00	3	Municipal	Peatón atropellado	Masculino	90	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
102	2013-11-12 00:00:00	Martes	07:25:00	3	Municipal	Colisión con objeto móvil	Femenino	20	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
81	2013-06-19 00:00:00	Miércoles	00:00:00	6	Municipal	Colisión con objeto móvil	Masculino	44	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
105	2013-12-11 00:00:00	Miércoles	22:40:00	4	Municipal	Colisión con objeto móvil	Femenino	19	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
87	2013-07-26 00:00:00	Viernes	16:20:00	1	Municipal	Colisión con objeto móvil	Masculino	25	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
109	2013-12-26 00:00:00	Jueves	00:00:00	6	Municipal	Colisión con objeto móvil	Femenino	42	Pasajero de moto	Motocicleta	Motocicleta	No aplica	No aplica
108	2013-12-24 00:00:00	Martes	00:00:00	6	Municipal	Colisión con objeto móvil	Masculino	47	Ciclista	Motocicleta	Vehiculo particular	Sin dato	Sin dato
16	2012-04-22 00:00:00	Domingo	00:00:00	7	Municipal	Peatón atropellado	Masculino	88	Peatón	Autónomo (Peatón)	Vehiculo particular	No aplica	No aplica
39	2012-09-02 00:00:00	Domingo	00:00:00	Vegalarga	Municipal	Peatón atropellado	Masculino	43	Peatón	Autónomo (Peatón)	Vehiculo particular	No aplica	No aplica
276	2017-02-12 00:00:00	Domingo	17:35:00	1	Municipal	Peatón atropellado	Femenino	68	Peatón	Autónomo (Peatón)	Vehiculo particular	No aplica	No aplica
117	2014-03-03 00:00:00	Lunes	00:00:00	4	Municipal	Colisión con objeto móvil	Masculino	30	Conductor de moto	Taxi	Tractomula	Sin dato	Sin dato
113	2014-01-22 00:00:00	Miércoles	14:30:00	El Caguán	Municipal	Colisión con objeto móvil	Masculino	18	Conductor de moto	Taxi	Camión/Camioneta	Sin dato	Sin dato
116	2014-02-26 00:00:00	Miércoles	14:30:00	2	Municipal	Colisión con objeto móvil	Masculino	18	Conductor de moto	Taxi	Camión/Camioneta	Sin dato	Sin dato
128	2014-06-28 00:00:00	Sábado	06:00:00	Ninguna	Departamental	Colisión con objeto móvil	Femenino	20	Pasajero de moto	Taxi	Camión/Camioneta	Sin dato	Sin dato
342	2018-07-01 00:00:00	Domingo	21:28:00	4	Municipal	Peatón atropellado	Masculino	77	Peatón	Autónomo (Peatón)	Vehiculo particular	No aplica	No aplica
362	2018-12-16 00:00:00	Domingo	00:00:00	1	Municipal	Peatón atropellado	Femenino	90	Peatón	Autónomo (Peatón)	Sin dato	No aplica	No aplica
368	2019-02-10 00:00:00	Domingo	20:18:00	1	Municipal	Peatón atropellado	Femenino	55	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
395	2019-08-01 00:00:00	Jueves	13:16:00	6	Municipal	Peatón atropellado	Masculino	85	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
484	2021-10-02 00:00:00	Sábado	11:04:00	6	Municipal	Peatón atropellado	Femenino	71	Peatón	No aplica	Motocicleta	No aplica	No aplica
136	2014-08-19 00:00:00	Martes	00:00:00	7	Municipal	Colisión con objeto móvil	Masculino	23	Conductor de moto	Taxi	Taxi	Sin dato	Sin dato
138	2014-09-02 00:00:00	Martes	22:30:00	3	Municipal	Colisión con objeto móvil	Masculino	38	Conductor de moto	Taxi	Vehiculo particular	Sin dato	Sin dato
129	2014-06-28 00:00:00	Sábado	06:00:00	Ninguna	Departamental	Colisión con objeto móvil	Masculino	33	Conductor de moto	Taxi	Camión/Camioneta	Sin dato	Sin dato
154	2014-12-11 00:00:00	Jueves	19:00:00	4	Municipal	Colisión con objeto móvil	Femenino	18	Pasajero de moto	Taxi	Vehiculo particular	Sin dato	Sin dato
152	2014-12-01 00:00:00	Lunes	00:00:00	8	Municipal	Colisión con objeto móvil	Masculino	57	Sin Dato	Lancha/otro	Vehiculo particular	Sin dato	Sin dato
524	2022-06-24 00:00:00	Sábado	18:55:00	4	Municipal	Peatón atropellado	Masculino	72	Peatón	Peatón	No aplica	Motocicleta	No aplica
521	2022-06-21 00:00:00	Domingo	19:20:00	4	Municipal	Peatón atropellado	Masculino	10	Peatón	Peatón	No aplica	Motocicleta	No aplica
538	2022-08-26 00:00:00	Martes	18:35:00	6	Municipal	Peatón atropellado	Masculino	69	Peatón	Peatón	Autónomo (Peatón)	Motocicleta	No aplica
330	2018-05-12 00:00:00	Sábado	06:14:00	4	Municipal	Colisión con objeto móvil	Femenino	74	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
36	2012-08-08 00:00:00	Miércoles	11:10:00	1	Municipal	Peatón atropellado	Masculino	1	Peatón	Autónomo (Peatón)	Vehiculo particular	No aplica	No aplica
156	2014-12-16 00:00:00	Martes	17:00:00	6	Municipal	Colisión con objeto móvil	Masculino	22	Conductor de moto	Taxi	Vehiculo particular	Sin dato	Sin dato
157	2014-12-24 00:00:00	Miércoles	17:00:00	6	Municipal	Colisión con objeto móvil	Masculino	24	Conductor de moto	Taxi	Tractomula	Sin dato	Sin dato
169	2015-03-05 00:00:00	Jueves	07:20:00	6	Municipal	Colisión con objeto móvil	Femenino	46	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
177	2015-05-21 00:00:00	Jueves	21:05:00	6	Municipal	Colisión con objeto móvil	Masculino	19	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
161	2015-01-17 00:00:00	Sábado	18:30:00	9	Municipal	Colisión con objeto móvil	Masculino	31	Pasajero de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
67	2013-02-27 00:00:00	Miércoles	20:30:00	7	Municipal	Peatón atropellado	Masculino	58	Peatón	Bicicleta	Taxi	Sin dato	Sin dato
139	2014-09-17 00:00:00	Miércoles	00:00:00	5	Municipal	Peatón atropellado	Masculino	73	Peatón	Bicicleta	Taxi	Sin dato	Sin dato
173	2015-05-06 00:00:00	Miércoles	10:30:00	10	Municipal	Peatón atropellado	Masculino	62	Peatón	Autónomo (Peatón)	Camión/Camioneta	No aplica	No aplica
207	2016-01-20 00:00:00	Miércoles	17:38:00	4	Municipal	Peatón atropellado	Masculino	74	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
196	2015-10-30 00:00:00	Viernes	00:40:00	7	Municipal	Colisión con objeto móvil	Masculino	41	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
187	2015-08-22 00:00:00	Sábado	05:24:00	9	Municipal	Colisión con objeto móvil	Masculino	32	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
193	2015-10-10 00:00:00	Sábado	19:43:00	Fortalecillas	Municipal	Colisión con objeto móvil	Masculino	44	Conductor de moto	Motocicleta	Animales	No aplica	No aplica
199	2015-12-05 00:00:00	Sábado	23:02:00	2	Municipal	Colisión con objeto móvil	Masculino	39	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
198	2015-11-24 00:00:00	Martes	09:30:00	4	Municipal	Colisión con objeto móvil	Masculino	46	Ciclista	Bicicleta	Camión/Camioneta	No aplica	No aplica
188	2015-08-22 00:00:00	Sábado	05:24:00	9	Municipal	Colisión con objeto móvil	Masculino	66	Pasajero de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
225	2016-04-13 00:00:00	Miércoles	00:22:00	6	Municipal	Peatón atropellado	Masculino	7	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
546	2022-10-22 00:00:00	Martes	08:22:00	10	Municipal	Colisión con objeto fijo	Masculino	21	Conductor de moto	Conductor de moto	Motocicleta	No aplica	No aplica
337	2018-06-20 00:00:00	Miércoles	06:35:00	2	Municipal	Peatón atropellado	Masculino	73	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
366	2019-01-18 00:00:00	Viernes	00:38:00	10	Municipal	Colisión con objeto móvil	Masculino	80	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
219	2016-03-08 00:00:00	Martes	21:40:00	6	Municipal	Colisión con objeto móvil	Masculino	25	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
223	2016-03-29 00:00:00	Martes	19:38:00	Ninguna	Municipal	Colisión con objeto móvil	Masculino	52	Conductor de moto	Motocicleta	Bicicleta	No aplica	No aplica
212	2016-02-03 00:00:00	Miércoles	21:56:00	7	Municipal	Colisión con objeto móvil	Masculino	36	Conductor de moto	Motocicleta	Taxi	No aplica	No aplica
216	2016-02-18 00:00:00	Jueves	22:23:00	4	Municipal	Colisión con objeto móvil	Masculino	21	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
248	2016-07-12 00:00:00	Martes	12:11:00	3	Municipal	Colisión con objeto móvil	Femenino	22	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
251	2016-08-11 00:00:00	Jueves	15:19:00	4	Municipal	Colisión con objeto móvil	Masculino	61	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
241	2016-06-18 00:00:00	Sábado	23:48:00	4	Municipal	Colisión con objeto móvil	Masculino	32	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
235	2016-05-17 00:00:00	Martes	00:00:00	7	Municipal	Colisión con objeto móvil	Femenino	58	Pasajero de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
265	2016-11-07 00:00:00	Lunes	12:37:00	6	Municipal	Colisión con objeto móvil	Masculino	17	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
262	2016-10-18 00:00:00	Martes	10:15:00	7	Municipal	Colisión con objeto móvil	Masculino	48	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
280	2017-04-19 00:00:00	Miércoles	09:05:00	6	Municipal	Colisión con objeto móvil	Femenino	25	Conductor de moto	Motocicleta	Autónomo (Peatón)	No aplica	No aplica
275	2017-01-16 00:00:00	Lunes	15:11:00	5	Municipal	Colisión con objeto móvil	Masculino	82	Ciclista	Bicicleta	Motocicleta	No aplica	No aplica
278	2017-03-04 00:00:00	Sábado	13:54:00	3	Municipal	Colisión con objeto móvil	Masculino	48	Ciclista	Bicicleta	Motocicleta	No aplica	No aplica
287	2017-06-07 00:00:00	Miércoles	16:45:00	7	Municipal	Colisión con objeto móvil	Masculino	24	Conductor de moto	Motocicleta	Vehiculo particular	Camión/Camioneta	No aplica
290	2017-06-17 00:00:00	Sábado	19:08:00	El Caguán	Municipal	Colisión con objeto móvil	Masculino	31	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
301	2017-08-31 00:00:00	Jueves	23:32:00	1	Municipal	Colisión con objeto móvil	Masculino	35	Conductor de vehículo	Vehiculo particular	Motocicleta	No aplica	No aplica
293	2017-06-30 00:00:00	Viernes	05:00:00	Guacirco	Nacional	Colisión con objeto móvil	Masculino	14	Pasajero de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
299	2017-07-24 00:00:00	Lunes	12:15:00	9	Municipal	Colisión con objeto móvil	Masculino	61	Ciclista	Bicicleta	Camión/Camioneta	No aplica	No aplica
321	2018-02-19 00:00:00	Lunes	15:59:00	4	Municipal	Colisión con objeto móvil	Masculino	61	Conductor de moto	Motocicleta	Taxi	No aplica	No aplica
313	2017-12-14 00:00:00	Jueves	19:04:00	4	Municipal	Colisión con objeto móvil	Masculino	29	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
307	2017-10-21 00:00:00	Sábado	18:19:00	10	Municipal	Colisión con objeto móvil	Masculino	18	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
318	2018-01-31 00:00:00	Miércoles	11:59:00	10	Municipal	Colisión con objeto móvil	Masculino	23	Sin Dato	Motocicleta	Vehiculo particular	No aplica	No aplica
309	2017-11-03 00:00:00	Viernes	07:25:00	6	Municipal	Colisión con objeto móvil	Masculino	76	Ciclista	Bicicleta	Motocicleta	No aplica	No aplica
310	2017-11-24 00:00:00	Viernes	18:27:00	5	Municipal	Colisión con objeto móvil	Masculino	50	Ciclista	Bicicleta	Microbus/Busetón	No aplica	No aplica
341	2018-06-30 00:00:00	Sábado	01:20:00	Guacirco	Nacional	Colisión con objeto móvil	Masculino	19	Conductor de moto	Motocicleta	Animales	No aplica	No aplica
333	2018-06-01 00:00:00	Viernes	05:09:00	3	Municipal	Colisión con objeto móvil	Masculino	24	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
335	2018-06-08 00:00:00	Viernes	12:56:00	1	Municipal	Colisión con objeto móvil	Masculino	29	Conductor de moto	Motocicleta	Tractomula	No aplica	No aplica
331	2018-05-15 00:00:00	Martes	06:55:00	6	Municipal	Colisión con objeto móvil	Femenino	50	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
363	2018-12-17 00:00:00	Lunes	00:00:00	6	Municipal	Colisión con objeto móvil	Femenino	50	Pasajero de moto	Motocicleta	Motocicleta	No aplica	No aplica
361	2018-12-06 00:00:00	Jueves	19:30:00	Guacirco	Nacional	Colisión con objeto móvil	Masculino	46	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
369	2019-02-28 00:00:00	Jueves	09:45:00	4	Municipal	Colisión con objeto móvil	Masculino	21	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
365	2019-01-16 00:00:00	Miércoles	09:35:00	4	Municipal	Colisión con objeto móvil	Masculino	63	Ciclista	Bicicleta	Tractomula	No aplica	No aplica
370	2019-03-02 00:00:00	Sábado	01:18:00	2	Municipal	Colisión con objeto móvil	Masculino	28	Pasajero de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
353	2018-09-07 00:00:00	Viernes	13:50:00	1	Municipal	Colisión con objeto móvil	Masculino	11	Ciclista	Bicicleta	Camión/Camioneta	No aplica	No aplica
378	2019-04-16 00:00:00	Martes	06:00:00	6	Municipal	Colisión con objeto móvil	Masculino	36	Conductor de moto	Motocicleta	Taxi	No aplica	No aplica
394	2019-07-31 00:00:00	Miércoles	00:00:00	5	Municipal	Colisión con objeto móvil	Masculino	21	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
374	2019-03-14 00:00:00	Jueves	00:00:00	5	Municipal	Colisión con objeto móvil	Masculino	26	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
371	2019-03-02 00:00:00	Sábado	01:18:00	2	Municipal	Colisión con objeto móvil	Masculino	29	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
402	2019-09-07 00:00:00	Sábado	07:22:00	1	Municipal	Colisión con objeto móvil	Masculino	32	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
405	2019-09-23 00:00:00	Lunes	16:07:00	6	Municipal	Colisión con objeto móvil	Femenino	63	Pasajero de moto	Motocicleta	Motocicleta	No aplica	No aplica
409	2019-10-11 00:00:00	Viernes	04:37:00	4	Municipal	Colisión con objeto móvil	Masculino	51	Pasajero de moto	Motocicleta	Taxi	No aplica	No aplica
407	2019-10-01 00:00:00	Martes	08:00:00	5	Municipal	Colisión con objeto móvil	Masculino	59	Ciclista	Bicicleta	Motocicleta	No aplica	No aplica
420	2020-01-11 00:00:00	Sábado	11:29:00	7	Municipal	Colisión con objeto móvil	Femenino	71	Pasajero de moto	Motocicleta	Motocicleta	No aplica	No aplica
417	2019-12-07 00:00:00	Sábado	22:35:00	Guacirco	Nacional	Colisión con objeto móvil	Masculino	46	Conductor de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
427	2020-02-05 00:00:00	Miércoles	08:40:00	3	Municipal	Colisión con objeto móvil	Masculino	76	Ciclista	Bicicleta	Motocicleta	No aplica	No aplica
448	2020-12-15 00:00:00	Martes	19:50:00	El Caguán	Municipal	Colisión con objeto móvil	Femenino	33	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
464	2021-04-06 00:00:00	Martes	02:50:00	6	Municipal	Colisión con objeto móvil	Masculino	28	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
456	2021-02-15 00:00:00	Lunes	06:30:00	6	Municipal	Colisión con objeto móvil	Masculino	20	Pasajero de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
465	2021-04-09 00:00:00	Viernes	00:47:00	3	Municipal	Colisión con objeto móvil	Masculino	77	Ciclista	Bicicleta	Vehiculo particular	No aplica	No aplica
461	2021-03-13 00:00:00	Sábado	08:24:00	Fortalecillas	Municipal	Colisión con objeto móvil	Masculino	63	Ciclista	Bicicleta	Motocicleta	No aplica	No aplica
483	2021-09-27 00:00:00	Lunes	16:30:00	6	Municipal	Colisión con objeto móvil	Masculino	35	Conductor de moto	Motocicleta	No aplica	No aplica	Particular
466	2021-04-13 00:00:00	Martes	06:08:00	6	Municipal	Colisión con objeto móvil	Femenino	22	Conductor de moto	Motocicleta	Particular	No aplica	No aplica
488	2021-10-20 00:00:00	Miércoles	11:04:00	4	Municipal	Colisión con objeto móvil	Femenino	53	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
469	2021-05-08 00:00:00	Sábado	13:55:00	Fortalecillas	Municipal	Colisión con objeto móvil	Masculino	28	Pasajero de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
498	2021-11-13 00:00:00	Sábado	15:43:00	Trapichito	Municipal	Colisión con objeto móvil	Masculino	55	Conductor moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
503	2021-12-12 00:00:00	Domingo	15:50:00	4	Municipal	Colisión con objeto móvil	Femenino	28	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
500	2021-11-22 00:00:00	Lunes	21:07:00	6	Municipal	Colisión con objeto móvil	Femenino	40	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
515	2022-04-03 00:00:00	Domingo	08:00:00	6	Municipal	Colisión con objeto móvil	Masculino	46	Conductor moto	Conductor moto	Motocicleta	Motocicleta	No aplica
508	2022-01-31 00:00:00	Martes	17:58:00	6	Municipal	Colisión con objeto móvil	Masculino	54	Ciclista	Ciclista	Bicicleta	Microbus/Busetón	No aplica
514	2022-04-02 00:00:00	Martes	08:00:00	6	Municipal	Colisión con objeto móvil	Masculino	64	Conductor moto	Conductor moto	Motocicleta	Tractomula	No aplica
516	2022-05-07 00:00:00	Martes	19:58:00	2	Municipal	Colisión con objeto móvil	Femenino	64	Ciclista	Ciclista	Bicicleta	Camión/Camioneta	No aplica
517	2022-05-15 00:00:00	Viernes	08:55:00	4	Municipal	Colisión con objeto móvil	Masculino	72	Conductor moto	Conductor moto	Motocicleta	No reportada	No aplica
539	2022-08-27 00:00:00	Domingo	22:06:00	6	Municipal	Colisión con objeto móvil	Masculino	38	Conductor moto	Conductor moto	Motocicleta	Vehiculo particular	No aplica
520	2022-06-06 00:00:00	Martes	09:42:00	4	Municipal	Colisión con objeto móvil	Masculino	49	Conductor moto	Conductor moto	Motocicleta	Camión/Camioneta	No aplica
522	2022-06-21 00:00:00	Martes	18:08:00	6	Municipal	Colisión con objeto móvil	Masculino	30	Conductor moto	Conductor moto	Motocicleta	Camión/Camioneta	No aplica
535	2022-07-30 00:00:00	Viernes	23:48:00	2	Municipal	Colisión con objeto móvil	Masculino	43	Conductor moto	Conductor moto	Motocicleta	Motocicleta	No aplica
551	2022-11-10 00:00:00	Domingo	18:20:00	4	Municipal	Colisión con objeto móvil	Masculino	64	Conductor de moto	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica
550	2022-11-02 00:00:00	Martes	19:20:00	5	Municipal	Colisión con objeto móvil	Masculino	22	Conductor de moto	Conductor de moto	Motocicleta	Motocicleta	No aplica
360	2018-12-02 00:00:00	Domingo	12:35:00	6	Municipal	Colisión con objeto móvil	Masculino	49	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
558	2022-12-16 00:00:00	Martes	19:04:00	4	Municipal	Colisión con objeto móvil	Masculino	69	Ciclista	Ciclista	Bicicleta	No aplica	No aplica
382	2019-05-26 00:00:00	Domingo	05:12:00	6	Municipal	Colisión con objeto móvil	Femenino	29	Pasajero de moto	Motocicleta	Camión/Camioneta	No aplica	No aplica
58	2012-12-24 00:00:00	Lunes	00:00:00	1	Municipal	Otra clase de accidente	Femenino	23	Pasajero de vehículo	Vehiculo particular	No aplica	No aplica	No aplica
153	2014-12-08 00:00:00	Lunes	00:00:00	4	Municipal	Peatón atropellado	Masculino	49	Peatón	Bicicleta	Vehiculo particular	Sin dato	Sin dato
237	2016-06-06 00:00:00	Lunes	12:40:00	5	Municipal	Peatón atropellado	Masculino	32	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
159	2014-12-29 00:00:00	Lunes	00:00:00	9	Municipal	Sin dato	Femenino	44	Pasajero de moto	Taxi	Lancha/otro	Sin dato	Sin dato
322	2018-02-26 00:00:00	Lunes	07:22:00	6	Municipal	Caída de ocupante	Femenino	62	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
373	2019-03-11 00:00:00	Lunes	05:24:00	6	Municipal	Peatón atropellado	Masculino	15	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
377	2019-04-01 00:00:00	Lunes	11:50:00	6	Municipal	Peatón atropellado	Masculino	88	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
166	2015-02-03 00:00:00	Martes	11:30:00	9	Municipal	Ciclista atropellado	Masculino	62	Ciclista	Bicicleta	Motocicleta	No aplica	No aplica
416	2019-11-18 00:00:00	Lunes	00:00:00	6	Municipal	Colisión con objeto móvil	Masculino	69	Pasajero de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
418	2019-12-16 00:00:00	Lunes	07:50:00	3	Municipal	Colisión con objeto móvil	Masculino	78	Pasajero de moto	Motocicleta	Motocicleta	No aplica	No aplica
230	2016-05-09 00:00:00	Lunes	07:38:00	6	Municipal	Colisión con objeto móvil	Femenino	21	Pasajero de vehículo	Vehiculo particular	Vehiculo particular	Motocicleta	No aplica
283	2017-05-23 00:00:00	Martes	18:32:00	6	Municipal	Peatón atropellado	Masculino	82	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
381	2019-05-21 00:00:00	Martes	13:07:00	6	Municipal	Peatón atropellado	Masculino	73	Peatón	Autónomo (Peatón)	Microbus/Busetón	No aplica	No aplica
347	2018-08-21 00:00:00	Martes	13:36:00	7	Municipal	Colisión con objeto móvil	Masculino	26	Ciclista	Bicicleta	Microbus/Busetón	No aplica	No aplica
348	2018-08-28 00:00:00	Martes	00:00:00	4	Municipal	Colisión con objeto móvil	Masculino	17	Ciclista	Bicicleta	Camión/Camioneta	No aplica	No aplica
112	2014-01-21 00:00:00	Martes	14:30:00	El Caguán	Municipal	Colisión con objeto móvil	Femenino	47	Pasajero de moto	Taxi	Camión/Camioneta	Sin dato	Sin dato
392	2019-07-09 00:00:00	Martes	07:07:00	2	Municipal	Colisión con objeto móvil	Femenino	64	Pasajero de moto	Motocicleta	Motocicleta	No aplica	No aplica
528	2022-07-02 00:00:00	Martes	03:00:00	6	Municipal	Colisión con objeto móvil	Masculino	31	Conductor moto	Conductor moto	Motocicleta	Vehiculo particular	No aplica
532	2022-07-14 00:00:00	Martes	\N	4	Municipal	Colisión con objeto móvil	Femenino	36	Pasajero moto	Pasajero moto	Motocicleta	Motocicleta	No aplica
534	2022-07-25 00:00:00	Martes	13:05:00	10	Municipal	Colisión con objeto móvil	Femenino	58	Conductor moto	Conductor moto	Motocicleta	Vehiculo particular	No aplica
345	2018-07-26 00:00:00	Jueves	\N	4	Municipal	Sin dato	Masculino	55	Sin Dato	Sin dato	Sin dato	Sin dato	Sin dato
340	2018-06-27 00:00:00	Miércoles	13:00:00	3	Municipal	Peatón atropellado	Masculino	81	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
312	2017-12-14 00:00:00	Jueves	20:03:00	4	Municipal	Peatón atropellado	Masculino	31	Peatón	Autónomo (Peatón)	Vehiculo particular	No aplica	No aplica
54	2012-11-30 00:00:00	Viernes	00:00:00	2	Municipal	Peatón atropellado	Masculino	77	Peatón	Autónomo (Peatón)	Camión/Camioneta	No aplica	No aplica
240	2016-06-17 00:00:00	Viernes	22:45:00	6	Municipal	Caída de ocupante	Masculino	49	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
95	2013-09-13 00:00:00	Viernes	04:10:00	Ninguna	Nacional	Volcamiento	Femenino	44	Pasajero de vehículo	Vehiculo particular	Sin dato	Sin dato	Sin dato
96	2013-09-13 00:00:00	Viernes	04:10:00	Ninguna	Nacional	Volcamiento	Femenino	67	Pasajero de vehículo	Vehiculo particular	Sin dato	Sin dato	Sin dato
529	2022-07-03 00:00:00	Viernes	11:47:00	5	Municipal	Peatón atropellado	Masculino	90	Peatón	Peatón	Autónomo (Peatón)	Microbus/Busetón	No aplica
358	2018-11-30 00:00:00	Viernes	16:51:00	4	Municipal	Peatón atropellado	Masculino	84	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
147	2014-11-01 00:00:00	Sábado	11:00:00	3	Municipal	Ciclista atropellado	Masculino	66	Ciclista	Motocicleta	Taxi	Sin dato	Sin dato
513	2022-04-02 00:00:00	Sábado	19:09:00	6	Municipal	Colisión con objeto móvil	Masculino	56	Conductor moto	Conductor moto	Motocicleta	Vehiculo particular	No aplica
519	2022-05-25 00:00:00	Sábado	17:00:00	2	Municipal	Colisión con objeto móvil	Femenino	41	Conductor de moto	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica
537	2022-08-25 00:00:00	Sábado	18:45:00	6	Municipal	Colisión con objeto móvil	Masculino	21	Conductor moto	Conductor moto	Motocicleta	Camión/Camioneta	No aplica
444	2020-10-23 00:00:00	Viernes	12:10:00	9	Municipal	Colisión con objeto móvil	Masculino	32	Conductor de moto	Motocicleta	Microbus/Busetón	No aplica	No aplica
561	2022-12-26 00:00:00	Sábado	09:47:00	3	Municipal	Peatón atropellado	Femenino	71	Peatón	Peatón	Autónomo (Peatón)	No aplica	No aplica
264	2016-11-05 00:00:00	Sábado	23:56:00	El Caguán	Municipal	Peatón atropellado	Femenino	79	Peatón	Autónomo (Peatón)	Motocicleta	No aplica	No aplica
454	2021-02-06 00:00:00	Sábado	06:27:00	6	Municipal	Otra clase de accidente	Femenino	17	Ciclista	Bicicleta	No aplica	No aplica	No aplica
22	2012-05-05 00:00:00	Sábado	23:15:00	2	Municipal	Colisión con objeto móvil	Masculino	43	Conductor de moto	Motocicleta	Motocicleta	No aplica	No aplica
20	2012-05-05 00:00:00	Sábado	23:15:00	2	Municipal	Colisión con objeto móvil	Masculino	22	Pasajero de moto	Motocicleta	Motocicleta	No aplica	No aplica
21	2012-05-05 00:00:00	Sábado	23:15:00	2	Municipal	Colisión con objeto móvil	Masculino	28	Pasajero de moto	Motocicleta	Motocicleta	No aplica	No aplica
531	2022-07-07 00:00:00	Sábado	09:05:00	5	Municipal	Peatón atropellado	Femenino	72	Peatón	Peatón	Autónomo (Peatón)	Motocicleta	No aplica
155	2014-12-13 00:00:00	Sábado	00:00:00	10	Municipal	Colisión con objeto móvil	Masculino	85	Peatón	Bicicleta	Taxi	Sin dato	Sin dato
403	2019-09-14 00:00:00	Sábado	05:55:00	1	Municipal	Colisión con objeto móvil	Masculino	71	Ciclista	Bicicleta	Motocicleta	No aplica	No aplica
404	2019-09-14 00:00:00	Sábado	17:36:00	2	Municipal	Colisión con objeto móvil	Masculino	81	Ciclista	Bicicleta	Motocicleta	No aplica	No aplica
317	2018-01-06 00:00:00	Sábado	17:35:00	3	Municipal	Colisión con objeto móvil	Masculino	25	Conductor de moto	Motocicleta	Vehiculo particular	No aplica	No aplica
388	2019-06-09 00:00:00	Domingo	03:00:00	Río Las Ceibas	Municipal	Caída de ocupante	Masculino	24	Pasajero de moto	Motocicleta	No aplica	No aplica	No aplica
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: neiva_user
--

COPY public.usuarios (id, nombre, correo, password_hash, rol, creado_en) FROM stdin;
1	Maria Alejandra Barros Murillo	admin@neiva.gov	scrypt:32768:8:1$il3iGYB3cJs930Wo$d7a1c2ec44263b28ce521fffd1fc3b456e66b147776a7f2665fdbec920d0cc0aad8f5adf9cf3689a4f12a96f2320f2b9b3b12cb3628aff337a83913b10c05844	admin	2025-11-26 05:50:58.017247
2	Maria Jose Garcia Arias	consulta@neiva.gov	scrypt:32768:8:1$il3iGYB3cJs930Wo$d7a1c2ec44263b28ce521fffd1fc3b456e66b147776a7f2665fdbec920d0cc0aad8f5adf9cf3689a4f12a96f2320f2b9`b3b12cb3628a1ff337a839113b10c105844	consultor	2025-11-26 05:52:26.520312
\.


--
-- Data for Name: auditoria_accidentes; Type: TABLE DATA; Schema: public; Owner: neiva_user
--

COPY public.auditoria_accidentes (id_auditoria, id_muertes_accidente, id_usuario, accion, usuario_creacion, fecha_creacion, usuario_modificacion, fecha_modificacion, datos_anteriores, datos_nuevos) FROM stdin;
2	\N	\N	UPDATE	\N	2025-11-22 21:27:44.13803	\N	\N	{"id": 1, "ano": 2012, "mes": 1, "edad": 46, "genero": "Masculino", "creado_en": "2025-11-16T17:25:26.239856", "fuente_raw": {"edad": "46", "genero": "Masculino", "fecha_del_hecho": "2012-01-01T00:00:00.000", "dia_de_la_semana": "domingo", "clase_de_accidente": "Peatón Atropellado", "comuna_corregimiento": "8", "hora_del_hecho_hh_mm": "1899-12-31T05:05:00.000", "tipo_de_via_de_hechos": "Municipal", "fecha_y_hora_del_hecho": "2012-01-01T05:05:00.000", "vehiculo_de_la_victima": "Autónomo (Peatón)", "vehiculo_2_de_la_contraparte": "Vehiculo particular", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracter_sticas_de_la_victima": "Peatón"}, "id_registro": null, "hora_del_hecho": "05:05:00", "fecha_del_hecho": "2012-01-01T00:00:00", "dia_de_la_semana": "Domingo", "clase_de_accidente": "Peatón atropellado", "comuna_corregimiento": "8", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Autónomo (Peatón)", "vehiculo_2_de_la_contraparte": "Vehiculo particular", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Peatón"}	{"id": 1, "ano": 2012, "mes": 1, "edad": 46, "genero": "Masculino", "creado_en": "2025-11-16T17:25:26.239856", "fuente_raw": {"edad": "46", "genero": "Masculino", "fecha_del_hecho": "2012-01-01T00:00:00.000", "dia_de_la_semana": "domingo", "clase_de_accidente": "Peatón Atropellado", "comuna_corregimiento": "8", "hora_del_hecho_hh_mm": "1899-12-31T05:05:00.000", "tipo_de_via_de_hechos": "Municipal", "fecha_y_hora_del_hecho": "2012-01-01T05:05:00.000", "vehiculo_de_la_victima": "Autónomo (Peatón)", "vehiculo_2_de_la_contraparte": "Vehiculo particular", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracter_sticas_de_la_victima": "Peatón"}, "id_registro": null, "hora_del_hecho": "05:05:00", "fecha_del_hecho": "2012-01-01T00:00:00", "dia_de_la_semana": "Domingo", "clase_de_accidente": "Peatón atropellado", "comuna_corregimiento": "8", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Autónomo (Peatón)", "vehiculo_2_de_la_contraparte": "Vehiculo particular", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Peatón"}
9	\N	\N	UPDATE	\N	2025-11-25 03:51:07.385728	\N	\N	{"id": 1, "edad": 46, "genero": "Masculino", "hora_del_hecho": "05:05:00", "fecha_del_hecho": "2012-01-01T00:00:00", "dia_de_la_semana": "Domingo", "clase_de_accidente": "Peatón atropellado", "comuna_corregimiento": "8", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Autónomo (Peatón)", "vehiculo_2_de_la_contraparte": "Vehiculo particular", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Peatón"}	{"id": 1, "edad": 46, "genero": "Masculino", "hora_del_hecho": "05:05:00", "fecha_del_hecho": "2012-01-01T00:00:00", "dia_de_la_semana": "Domingo", "clase_de_accidente": "2", "comuna_corregimiento": "8", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Autónomo (Peatón)", "vehiculo_2_de_la_contraparte": "Vehiculo particular", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Peatón"}
8	\N	\N	INSERT	\N	2025-11-25 03:51:07.356876	\N	\N	\N	{"id": 562, "edad": null, "genero": null, "hora_del_hecho": null, "fecha_del_hecho": "2025-11-25T03:51:07.356876", "dia_de_la_semana": null, "clase_de_accidente": "1", "comuna_corregimiento": null, "tipo_de_via_de_hechos": null, "vehiculo_de_la_victima": null, "vehiculo_2_de_la_contraparte": null, "vehiculo_3_de_la_contraparte": null, "vehiculo_4_de_la_contraparte": null, "caracteristicas_de_la_victima": null}
12	\N	\N	UPDATE	\N	2025-11-25 03:53:20.261761	\N	\N	{"id": 1, "edad": 46, "genero": "Masculino", "hora_del_hecho": "05:05:00", "fecha_del_hecho": "2012-01-01T00:00:00", "dia_de_la_semana": "Domingo", "clase_de_accidente": "2", "comuna_corregimiento": "8", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Autónomo (Peatón)", "vehiculo_2_de_la_contraparte": "Vehiculo particular", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Peatón"}	{"id": 1, "edad": 46, "genero": "Masculino", "hora_del_hecho": "05:05:00", "fecha_del_hecho": "2012-01-01T00:00:00", "dia_de_la_semana": "Domingo", "clase_de_accidente": "2", "comuna_corregimiento": "8", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Autónomo (Peatón)", "vehiculo_2_de_la_contraparte": "Vehiculo particular", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Peatón"}
13	\N	\N	DELETE	\N	2025-11-25 03:53:20.264648	\N	\N	{"id": 1, "edad": 46, "genero": "Masculino", "hora_del_hecho": "05:05:00", "fecha_del_hecho": "2012-01-01T00:00:00", "dia_de_la_semana": "Domingo", "clase_de_accidente": "2", "comuna_corregimiento": "8", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Autónomo (Peatón)", "vehiculo_2_de_la_contraparte": "Vehiculo particular", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Peatón"}	\N
14	\N	\N	DELETE	\N	2025-11-25 03:54:02.025237	\N	\N	{"id": 2, "edad": 79, "genero": "Masculino", "hora_del_hecho": "20:00:00", "fecha_del_hecho": "2012-01-03T00:00:00", "dia_de_la_semana": "Martes", "clase_de_accidente": "Colisión con objeto móvil", "comuna_corregimiento": "6", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Bicicleta", "vehiculo_2_de_la_contraparte": "Motocicleta", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Ciclista"}	\N
15	\N	\N	DELETE	\N	2025-11-25 03:54:15.875524	\N	\N	{"id": 3, "edad": 73, "genero": "Femenino", "hora_del_hecho": "00:00:00", "fecha_del_hecho": "2012-01-16T00:00:00", "dia_de_la_semana": "Lunes", "clase_de_accidente": "Sin dato", "comuna_corregimiento": "1", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Autónomo (Peatón)", "vehiculo_2_de_la_contraparte": "Sin dato", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Peatón"}	\N
16	\N	\N	DELETE	\N	2025-11-25 15:04:43.146549	\N	\N	{"id": 4, "edad": 23, "genero": "Femenino", "hora_del_hecho": "06:45:00", "fecha_del_hecho": "2012-01-22T00:00:00", "dia_de_la_semana": "Domingo", "clase_de_accidente": "Colisión con objeto fijo", "comuna_corregimiento": "4", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Motocicleta", "vehiculo_2_de_la_contraparte": "No aplica", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Conductor de moto"}	\N
17	\N	\N	DELETE	\N	2025-11-26 03:28:03.680853	\N	\N	{"id": 562, "edad": null, "genero": null, "hora_del_hecho": null, "fecha_del_hecho": "2025-11-25T03:51:07.356876", "dia_de_la_semana": null, "clase_de_accidente": "1", "comuna_corregimiento": null, "tipo_de_via_de_hechos": null, "vehiculo_de_la_victima": null, "vehiculo_2_de_la_contraparte": null, "vehiculo_3_de_la_contraparte": null, "vehiculo_4_de_la_contraparte": null, "caracteristicas_de_la_victima": null}	\N
11	\N	\N	INSERT	\N	2025-11-25 03:53:20.23736	\N	\N	\N	{"id": 563, "edad": null, "genero": null, "hora_del_hecho": null, "fecha_del_hecho": "2025-11-25T03:53:20.23736", "dia_de_la_semana": null, "clase_de_accidente": "1", "comuna_corregimiento": null, "tipo_de_via_de_hechos": null, "vehiculo_de_la_victima": null, "vehiculo_2_de_la_contraparte": null, "vehiculo_3_de_la_contraparte": null, "vehiculo_4_de_la_contraparte": null, "caracteristicas_de_la_victima": null}
18	\N	\N	DELETE	\N	2025-11-26 03:28:10.123205	\N	\N	{"id": 563, "edad": null, "genero": null, "hora_del_hecho": null, "fecha_del_hecho": "2025-11-25T03:53:20.23736", "dia_de_la_semana": null, "clase_de_accidente": "1", "comuna_corregimiento": null, "tipo_de_via_de_hechos": null, "vehiculo_de_la_victima": null, "vehiculo_2_de_la_contraparte": null, "vehiculo_3_de_la_contraparte": null, "vehiculo_4_de_la_contraparte": null, "caracteristicas_de_la_victima": null}	\N
19	564	\N	INSERT	\N	2025-11-26 03:50:08.585612	\N	\N	\N	{"id": 564, "edad": 18, "genero": "Femenino", "hora_del_hecho": "12:00:00", "fecha_del_hecho": "2025-11-05T00:00:00", "dia_de_la_semana": "Miércoles", "clase_de_accidente": "Volcamiento", "comuna_corregimiento": "1", "tipo_de_via_de_hechos": "Departamental", "vehiculo_de_la_victima": "Ninguno", "vehiculo_2_de_la_contraparte": "A pie", "vehiculo_3_de_la_contraparte": "Bicicleta", "vehiculo_4_de_la_contraparte": "Bicicleta", "caracteristicas_de_la_victima": "Peatón"}
20	565	\N	INSERT	\N	2025-11-26 04:26:49.174463	\N	\N	\N	{"id": 565, "edad": 45, "genero": "Masculino", "hora_del_hecho": "00:45:00", "fecha_del_hecho": "2025-11-14T00:00:00", "dia_de_la_semana": "Viernes", "clase_de_accidente": "Choque", "comuna_corregimiento": "1", "tipo_de_via_de_hechos": "Departamental", "vehiculo_de_la_victima": "Bicicleta", "vehiculo_2_de_la_contraparte": null, "vehiculo_3_de_la_contraparte": null, "vehiculo_4_de_la_contraparte": null, "caracteristicas_de_la_victima": "Motociclista"}
21	566	\N	INSERT	\N	2025-11-26 04:28:26.21976	\N	\N	\N	{"id": 566, "edad": 45, "genero": "Masculino", "hora_del_hecho": "15:45:00", "fecha_del_hecho": "2025-11-06T00:00:00", "dia_de_la_semana": "Jueves", "clase_de_accidente": "qwer", "comuna_corregimiento": "4", "tipo_de_via_de_hechos": "Nacional", "vehiculo_de_la_victima": "A pie", "vehiculo_2_de_la_contraparte": null, "vehiculo_3_de_la_contraparte": null, "vehiculo_4_de_la_contraparte": null, "caracteristicas_de_la_victima": "Peatón"}
22	565	\N	UPDATE	\N	2025-11-26 05:14:33.030721	\N	\N	{"id": 565, "edad": 45, "genero": "Masculino", "hora_del_hecho": "00:45:00", "fecha_del_hecho": "2025-11-14T00:00:00", "dia_de_la_semana": "Viernes", "clase_de_accidente": "Choque", "comuna_corregimiento": "1", "tipo_de_via_de_hechos": "Departamental", "vehiculo_de_la_victima": "Bicicleta", "vehiculo_2_de_la_contraparte": null, "vehiculo_3_de_la_contraparte": null, "vehiculo_4_de_la_contraparte": null, "caracteristicas_de_la_victima": "Motociclista"}	{"id": 565, "edad": 14, "genero": "Masculino", "hora_del_hecho": "12:45:00", "fecha_del_hecho": "2025-11-14T00:00:00", "dia_de_la_semana": "Viernes", "clase_de_accidente": "Choque", "comuna_corregimiento": "1", "tipo_de_via_de_hechos": "Departamental", "vehiculo_de_la_victima": "Bicicleta", "vehiculo_2_de_la_contraparte": "Ninguno", "vehiculo_3_de_la_contraparte": "Ninguno", "vehiculo_4_de_la_contraparte": "Ninguno", "caracteristicas_de_la_victima": "Motociclista"}
23	565	\N	UPDATE	\N	2025-11-26 05:15:09.555573	\N	\N	{"id": 565, "edad": 14, "genero": "Masculino", "hora_del_hecho": "12:45:00", "fecha_del_hecho": "2025-11-14T00:00:00", "dia_de_la_semana": "Viernes", "clase_de_accidente": "Choque", "comuna_corregimiento": "1", "tipo_de_via_de_hechos": "Departamental", "vehiculo_de_la_victima": "Bicicleta", "vehiculo_2_de_la_contraparte": "Ninguno", "vehiculo_3_de_la_contraparte": "Ninguno", "vehiculo_4_de_la_contraparte": "Ninguno", "caracteristicas_de_la_victima": "Motociclista"}	{"id": 565, "edad": 14, "genero": "Femenino", "hora_del_hecho": "12:45:00", "fecha_del_hecho": "2025-11-14T00:00:00", "dia_de_la_semana": "Viernes", "clase_de_accidente": "Choque", "comuna_corregimiento": "1", "tipo_de_via_de_hechos": "Departamental", "vehiculo_de_la_victima": "Bicicleta", "vehiculo_2_de_la_contraparte": "Ninguno", "vehiculo_3_de_la_contraparte": "Ninguno", "vehiculo_4_de_la_contraparte": "Ninguno", "caracteristicas_de_la_victima": "Motociclista"}
24	\N	\N	DELETE	\N	2025-11-26 07:03:43.367282	\N	\N	{"id": 5, "edad": 5, "genero": "Femenino", "hora_del_hecho": "18:45:00", "fecha_del_hecho": "2012-01-25T00:00:00", "dia_de_la_semana": "Miércoles", "clase_de_accidente": "Ciclista atropellado", "comuna_corregimiento": "1", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Bicicleta", "vehiculo_2_de_la_contraparte": "Camión/Camioneta", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Ciclista"}	\N
25	\N	\N	DELETE	\N	2025-11-26 07:04:25.889441	\N	\N	{"id": 7, "edad": 59, "genero": "Femenino", "hora_del_hecho": "00:00:00", "fecha_del_hecho": "2012-01-29T00:00:00", "dia_de_la_semana": "Domingo", "clase_de_accidente": "Peatón atropellado", "comuna_corregimiento": "6", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Autónomo (Peatón)", "vehiculo_2_de_la_contraparte": "Motocicleta", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Peatón"}	\N
26	8	\N	UPDATE	\N	2025-11-26 07:07:38.278018	\N	\N	{"id": 8, "edad": 21, "genero": "Masculino", "hora_del_hecho": "03:57:00", "fecha_del_hecho": "2012-02-05T00:00:00", "dia_de_la_semana": "Domingo", "clase_de_accidente": "Colisión con objeto fijo", "comuna_corregimiento": "5", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Motocicleta", "vehiculo_2_de_la_contraparte": "No aplica", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Conductor de moto"}	{"id": 8, "edad": 21, "genero": "Masculino", "hora_del_hecho": "03:57:00", "fecha_del_hecho": "2012-02-05T00:00:00", "dia_de_la_semana": "Domingo", "clase_de_accidente": "Colisión con objeto fijo", "comuna_corregimiento": "5", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Motocicleta", "vehiculo_2_de_la_contraparte": "No aplica", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Peatón"}
27	9	\N	UPDATE	\N	2025-11-26 11:05:40.286042	\N	\N	{"id": 9, "edad": 25, "genero": "Masculino", "hora_del_hecho": "03:25:00", "fecha_del_hecho": "2012-02-05T00:00:00", "dia_de_la_semana": "Domingo", "clase_de_accidente": "Colisión con objeto fijo", "comuna_corregimiento": "3", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Motocicleta", "vehiculo_2_de_la_contraparte": "No aplica", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Conductor de moto"}	{"id": 9, "edad": 25, "genero": "Masculino", "hora_del_hecho": "03:25:00", "fecha_del_hecho": "2012-02-05T00:00:00", "dia_de_la_semana": "Domingo", "clase_de_accidente": "Colisión con objeto fijo", "comuna_corregimiento": "3", "tipo_de_via_de_hechos": "Municipal", "vehiculo_de_la_victima": "Motocicleta", "vehiculo_2_de_la_contraparte": "Buseta", "vehiculo_3_de_la_contraparte": "No aplica", "vehiculo_4_de_la_contraparte": "No aplica", "caracteristicas_de_la_victima": "Motociclista"}
28	\N	\N	INSERT	\N	2025-11-26 11:09:28.494809	\N	\N	\N	{"id": 567, "edad": 45, "genero": "Masculino", "hora_del_hecho": "06:25:00", "fecha_del_hecho": "2025-11-26T00:00:00", "dia_de_la_semana": "Miércoles", "clase_de_accidente": "wertyui", "comuna_corregimiento": "3", "tipo_de_via_de_hechos": "Departamental", "vehiculo_de_la_victima": "A pie", "vehiculo_2_de_la_contraparte": "Peatón", "vehiculo_3_de_la_contraparte": "Bicicleta", "vehiculo_4_de_la_contraparte": "Peatón", "caracteristicas_de_la_victima": "Motociclista"}
29	\N	\N	DELETE	\N	2025-11-26 11:09:47.707007	\N	\N	{"id": 567, "edad": 45, "genero": "Masculino", "hora_del_hecho": "06:25:00", "fecha_del_hecho": "2025-11-26T00:00:00", "dia_de_la_semana": "Miércoles", "clase_de_accidente": "wertyui", "comuna_corregimiento": "3", "tipo_de_via_de_hechos": "Departamental", "vehiculo_de_la_victima": "A pie", "vehiculo_2_de_la_contraparte": "Peatón", "vehiculo_3_de_la_contraparte": "Bicicleta", "vehiculo_4_de_la_contraparte": "Peatón", "caracteristicas_de_la_victima": "Motociclista"}	\N
\.


--
-- Name: auditoria_accidentes_id_auditoria_seq; Type: SEQUENCE SET; Schema: public; Owner: neiva_user
--

SELECT pg_catalog.setval('public.auditoria_accidentes_id_auditoria_seq', 29, true);


--
-- Name: muertes_accidentes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neiva_user
--

SELECT pg_catalog.setval('public.muertes_accidentes_id_seq', 567, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neiva_user
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 3JL6IooXbEbhGUY1iFN8gCyQqWZ54LlUsvCkRYn3cakBe0UP1whh6SZ26QIC9Wh

