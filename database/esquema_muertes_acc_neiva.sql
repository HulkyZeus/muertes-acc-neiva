--
-- PostgreSQL database dump
--

\restrict I0OJOK3vc30XSpRjF0S98aKKYqmHXW9D6G3rGRHgn8v3mdZzXje7mu4EdPlOFb5

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: neiva_user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO neiva_user;

--
-- Name: registrar_auditoria_accidente(); Type: FUNCTION; Schema: public; Owner: neiva_user
--

CREATE FUNCTION public.registrar_auditoria_accidente() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_old JSONB;
    v_new JSONB;
    v_accion VARCHAR(50);
    v_id_accidente INT;
    v_id_usuario INT;
BEGIN
    IF TG_OP = 'INSERT' THEN
        v_accion := 'INSERT';
        v_new := TO_JSONB(NEW);
        v_old := NULL;
        v_id_accidente := NEW.id;
        v_id_usuario := NULL; -- no hay contexto de usuario en trigger

    ELSIF TG_OP = 'UPDATE' THEN
        v_accion := 'UPDATE';
        v_old := TO_JSONB(OLD);
        v_new := TO_JSONB(NEW);
        v_id_accidente := NEW.id;
        v_id_usuario := NULL;

    ELSIF TG_OP = 'DELETE' THEN
        v_accion := 'DELETE';
        v_old := TO_JSONB(OLD);
        v_new := NULL;
        v_id_accidente := OLD.id;
        v_id_usuario := NULL;
    END IF;

    INSERT INTO auditoria_accidentes (
        id_muertes_accidente,
        id_usuario,
        accion,
        fecha_creacion,
        datos_anteriores,
        datos_nuevos
    )
    VALUES (
        v_id_accidente,
        v_id_usuario,
        v_accion,
        NOW(),
        v_old,
        v_new
    );

    IF TG_OP = 'DELETE' THEN
        RETURN OLD;
    ELSE
        RETURN NEW;
    END IF;
END;
$$;


ALTER FUNCTION public.registrar_auditoria_accidente() OWNER TO neiva_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auditoria_accidentes; Type: TABLE; Schema: public; Owner: neiva_user
--

CREATE TABLE public.auditoria_accidentes (
    id_auditoria integer NOT NULL,
    id_muertes_accidente integer,
    id_usuario integer,
    accion character varying(50) NOT NULL,
    usuario_creacion character varying(100),
    fecha_creacion timestamp without time zone DEFAULT now(),
    usuario_modificacion character varying(100),
    fecha_modificacion timestamp without time zone,
    datos_anteriores jsonb,
    datos_nuevos jsonb
);


ALTER TABLE public.auditoria_accidentes OWNER TO neiva_user;

--
-- Name: auditoria_accidentes_id_auditoria_seq; Type: SEQUENCE; Schema: public; Owner: neiva_user
--

CREATE SEQUENCE public.auditoria_accidentes_id_auditoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auditoria_accidentes_id_auditoria_seq OWNER TO neiva_user;

--
-- Name: auditoria_accidentes_id_auditoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neiva_user
--

ALTER SEQUENCE public.auditoria_accidentes_id_auditoria_seq OWNED BY public.auditoria_accidentes.id_auditoria;


--
-- Name: muertes_accidentes; Type: TABLE; Schema: public; Owner: neiva_user
--

CREATE TABLE public.muertes_accidentes (
    id integer NOT NULL,
    fecha_del_hecho timestamp without time zone,
    dia_de_la_semana character varying(20),
    hora_del_hecho time without time zone,
    comuna_corregimiento character varying(50),
    tipo_de_via_de_hechos character varying(120),
    clase_de_accidente character varying(120),
    genero character varying(20),
    edad integer,
    caracteristicas_de_la_victima character varying(255),
    vehiculo_de_la_victima character varying(255),
    vehiculo_2_de_la_contraparte character varying(255),
    vehiculo_3_de_la_contraparte character varying(255),
    vehiculo_4_de_la_contraparte character varying(255)
);


ALTER TABLE public.muertes_accidentes OWNER TO neiva_user;

--
-- Name: muertes_accidentes_id_seq; Type: SEQUENCE; Schema: public; Owner: neiva_user
--

CREATE SEQUENCE public.muertes_accidentes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.muertes_accidentes_id_seq OWNER TO neiva_user;

--
-- Name: muertes_accidentes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neiva_user
--

ALTER SEQUENCE public.muertes_accidentes_id_seq OWNED BY public.muertes_accidentes.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: neiva_user
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(120) NOT NULL,
    correo character varying(120) NOT NULL,
    password_hash text NOT NULL,
    rol character varying(30) DEFAULT 'consultor'::character varying NOT NULL,
    creado_en timestamp without time zone DEFAULT now()
);


ALTER TABLE public.usuarios OWNER TO neiva_user;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: neiva_user
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO neiva_user;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neiva_user
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: auditoria_accidentes id_auditoria; Type: DEFAULT; Schema: public; Owner: neiva_user
--

ALTER TABLE ONLY public.auditoria_accidentes ALTER COLUMN id_auditoria SET DEFAULT nextval('public.auditoria_accidentes_id_auditoria_seq'::regclass);


--
-- Name: muertes_accidentes id; Type: DEFAULT; Schema: public; Owner: neiva_user
--

ALTER TABLE ONLY public.muertes_accidentes ALTER COLUMN id SET DEFAULT nextval('public.muertes_accidentes_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: neiva_user
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Name: auditoria_accidentes auditoria_accidentes_pkey; Type: CONSTRAINT; Schema: public; Owner: neiva_user
--

ALTER TABLE ONLY public.auditoria_accidentes
    ADD CONSTRAINT auditoria_accidentes_pkey PRIMARY KEY (id_auditoria);


--
-- Name: muertes_accidentes muertes_accidentes_pkey; Type: CONSTRAINT; Schema: public; Owner: neiva_user
--

ALTER TABLE ONLY public.muertes_accidentes
    ADD CONSTRAINT muertes_accidentes_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_correo_key; Type: CONSTRAINT; Schema: public; Owner: neiva_user
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: neiva_user
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: muertes_accidentes trg_auditar_accidente_del; Type: TRIGGER; Schema: public; Owner: neiva_user
--

CREATE TRIGGER trg_auditar_accidente_del BEFORE DELETE ON public.muertes_accidentes FOR EACH ROW EXECUTE FUNCTION public.registrar_auditoria_accidente();


--
-- Name: muertes_accidentes trg_auditar_accidente_iu; Type: TRIGGER; Schema: public; Owner: neiva_user
--

CREATE TRIGGER trg_auditar_accidente_iu AFTER INSERT OR UPDATE ON public.muertes_accidentes FOR EACH ROW EXECUTE FUNCTION public.registrar_auditoria_accidente();


--
-- Name: auditoria_accidentes fk_accidente; Type: FK CONSTRAINT; Schema: public; Owner: neiva_user
--

ALTER TABLE ONLY public.auditoria_accidentes
    ADD CONSTRAINT fk_accidente FOREIGN KEY (id_muertes_accidente) REFERENCES public.muertes_accidentes(id) ON DELETE SET NULL;


--
-- Name: auditoria_accidentes fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: neiva_user
--

ALTER TABLE ONLY public.auditoria_accidentes
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict I0OJOK3vc30XSpRjF0S98aKKYqmHXW9D6G3rGRHgn8v3mdZzXje7mu4EdPlOFb5

