--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.0

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
-- Name: federasyontrigger(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.federasyontrigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
    DECLARE
    
BEGIN
UPDATE "ToplamFederasyon" SET "FederasyonSayisi" = "FederasyonSayisi"+1;
RETURN NEW;
END;
$$;


ALTER FUNCTION public.federasyontrigger() OWNER TO postgres;

--
-- Name: hakemtrigger(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.hakemtrigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
    DECLARE
    
BEGIN
UPDATE "ToplamHakem" SET "HakemSayisi" = "HakemSayisi"+1;
RETURN NEW;
END;
$$;


ALTER FUNCTION public.hakemtrigger() OWNER TO postgres;

--
-- Name: ligtrigger(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ligtrigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
    DECLARE
    
BEGIN
UPDATE "ToplamLig" SET "LigSayisi" = "LigSayisi"+1;
RETURN NEW;
END;
$$;


ALTER FUNCTION public.ligtrigger() OWNER TO postgres;

--
-- Name: takimtrigger(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.takimtrigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
    DECLARE
    
BEGIN
UPDATE "ToplamTakim" SET "ToplamTakimSayisi" = "ToplamTakimSayisi"+1;
RETURN NEW;
END;
$$;


ALTER FUNCTION public.takimtrigger() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: 15YasAlti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."15YasAlti" (
    "18YasPot" character varying NOT NULL,
    "FutbolcuID" integer NOT NULL
);


ALTER TABLE public."15YasAlti" OWNER TO postgres;

--
-- Name: 18YasAlti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."18YasAlti" (
    "FutbolcuID" integer NOT NULL,
    "21YasPot" character varying NOT NULL
);


ALTER TABLE public."18YasAlti" OWNER TO postgres;

--
-- Name: 21YasAlti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."21YasAlti" (
    "FutbolcuID" integer NOT NULL,
    "23YasPot" integer NOT NULL
);


ALTER TABLE public."21YasAlti" OWNER TO postgres;

--
-- Name: 23YasAlti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."23YasAlti" (
    "FutbolcuID" integer NOT NULL,
    "ProfPot" character varying NOT NULL
);


ALTER TABLE public."23YasAlti" OWNER TO postgres;

--
-- Name: FedBaskani; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FedBaskani" (
    "FedBaskaniID" integer NOT NULL,
    "Adi" character varying NOT NULL,
    "Soyadi" character varying NOT NULL
);


ALTER TABLE public."FedBaskani" OWNER TO postgres;

--
-- Name: Federasyon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Federasyon" (
    "FederasyonID" integer NOT NULL,
    "FederasyonAdi" character varying NOT NULL,
    "TakimSayisi" integer NOT NULL,
    "FedBaskanID" integer NOT NULL
);


ALTER TABLE public."Federasyon" OWNER TO postgres;

--
-- Name: Futbolcu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Futbolcu" (
    "FutbolcuID" integer NOT NULL,
    "FutbolcuAdi" character varying NOT NULL,
    "FutbolcuSoyadi" character varying NOT NULL,
    "Fiyati" bigint NOT NULL,
    "TakimID" integer NOT NULL,
    "MilliID" integer NOT NULL,
    "Ulke" character varying NOT NULL,
    "Ayak" character varying NOT NULL
);


ALTER TABLE public."Futbolcu" OWNER TO postgres;

--
-- Name: Hakem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Hakem" (
    "HakemID" integer NOT NULL,
    "HakemAdi" character varying NOT NULL,
    "HakemLisansi" character varying NOT NULL,
    "FedID" integer NOT NULL
);


ALTER TABLE public."Hakem" OWNER TO postgres;

--
-- Name: Hakem_HakemID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Hakem_HakemID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Hakem_HakemID_seq" OWNER TO postgres;

--
-- Name: Hakem_HakemID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Hakem_HakemID_seq" OWNED BY public."Hakem"."HakemID";


--
-- Name: Lig; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Lig" (
    "LigID" integer NOT NULL,
    "LigAdi" character varying NOT NULL,
    "TakimSayisi" character varying NOT NULL,
    "FedID" integer NOT NULL
);


ALTER TABLE public."Lig" OWNER TO postgres;

--
-- Name: Lig_LigID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Lig_LigID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Lig_LigID_seq" OWNER TO postgres;

--
-- Name: Lig_LigID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Lig_LigID_seq" OWNED BY public."Lig"."LigID";


--
-- Name: MilliTakim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MilliTakim" (
    "MilliID" integer NOT NULL,
    "UlkeAdi" character varying NOT NULL,
    "UlkeBolgesi" character varying NOT NULL
);


ALTER TABLE public."MilliTakim" OWNER TO postgres;

--
-- Name: MilliTaraftar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MilliTaraftar" (
    "MilliTaraftarID" integer NOT NULL,
    "MilliTaraftarAdi" character varying NOT NULL,
    "MilliTaraftarSoyadi" character varying NOT NULL,
    "MilliID" integer NOT NULL
);


ALTER TABLE public."MilliTaraftar" OWNER TO postgres;

--
-- Name: Stadyum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Stadyum" (
    "StadyumID" integer NOT NULL,
    "StadyumAdi" character varying NOT NULL,
    "Kapasite" bigint NOT NULL
);


ALTER TABLE public."Stadyum" OWNER TO postgres;

--
-- Name: TakimBaskani; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TakimBaskani" (
    "TakimBaskaniID" integer NOT NULL,
    "BaskanAdi" character varying NOT NULL,
    "BaskanSoyadi" character varying NOT NULL
);


ALTER TABLE public."TakimBaskani" OWNER TO postgres;

--
-- Name: TakimBaskani_TakimBaskaniID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."TakimBaskani_TakimBaskaniID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TakimBaskani_TakimBaskaniID_seq" OWNER TO postgres;

--
-- Name: TakimBaskani_TakimBaskaniID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."TakimBaskani_TakimBaskaniID_seq" OWNED BY public."TakimBaskani"."TakimBaskaniID";


--
-- Name: TakimTaraftari; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TakimTaraftari" (
    "TaraftarAdi" character varying NOT NULL,
    "UyelikSeviyesi" character varying NOT NULL,
    "TakimID" integer NOT NULL,
    "TakimTaraftariID" integer NOT NULL
);


ALTER TABLE public."TakimTaraftari" OWNER TO postgres;

--
-- Name: Takım; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Takım" (
    "TakimID" integer NOT NULL,
    "TakimAdi" character varying NOT NULL,
    "StadyumID" integer NOT NULL,
    "LigID" integer NOT NULL,
    "TakimSembolu" character varying NOT NULL,
    "BaskanID" integer NOT NULL
);


ALTER TABLE public."Takım" OWNER TO postgres;

--
-- Name: ToplamFederasyon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ToplamFederasyon" (
    "FederasyonSayisi" integer
);


ALTER TABLE public."ToplamFederasyon" OWNER TO postgres;

--
-- Name: ToplamHakem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ToplamHakem" (
    "HakemSayisi" integer
);


ALTER TABLE public."ToplamHakem" OWNER TO postgres;

--
-- Name: ToplamLig; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ToplamLig" (
    "LigSayisi" integer
);


ALTER TABLE public."ToplamLig" OWNER TO postgres;

--
-- Name: ToplamTakim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ToplamTakim" (
    "ToplamTakimSayisi" integer
);


ALTER TABLE public."ToplamTakim" OWNER TO postgres;

--
-- Name: Hakem HakemID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hakem" ALTER COLUMN "HakemID" SET DEFAULT nextval('public."Hakem_HakemID_seq"'::regclass);


--
-- Name: Lig LigID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lig" ALTER COLUMN "LigID" SET DEFAULT nextval('public."Lig_LigID_seq"'::regclass);


--
-- Name: TakimBaskani TakimBaskaniID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TakimBaskani" ALTER COLUMN "TakimBaskaniID" SET DEFAULT nextval('public."TakimBaskani_TakimBaskaniID_seq"'::regclass);


--
-- Data for Name: 15YasAlti; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: 18YasAlti; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: 21YasAlti; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: 23YasAlti; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: FedBaskani; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."FedBaskani" VALUES
	(19231, 'Yıldırım ', 'Demirören');


--
-- Data for Name: Federasyon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Federasyon" VALUES
	(1923, 'TFF', 18, 19231);


--
-- Data for Name: Futbolcu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Futbolcu" VALUES
	(1, 'Mesut', 'Özil', 100000000, 1, 1, 'Almanya', 'Sol'),
	(2, 'Mert Hakan', 'Yandaş', 5000000, 1, 2, 'Türkiye', 'Sağ');


--
-- Data for Name: Hakem; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Hakem" VALUES
	(1, 'Cüneyt Çakır', 'Fifa', 1923),
	(2, 'Faruk Ongun', 'TFF', 1923),
	(3, 'Fırat Aydınus', 'Fifa', 1923);


--
-- Data for Name: Lig; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Lig" VALUES
	(1, 'STSL', '18', 1923);


--
-- Data for Name: MilliTakim; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."MilliTakim" VALUES
	(1, 'Almanya', 'Avrupa'),
	(2, 'Türkiye', 'Avrupa');


--
-- Data for Name: MilliTaraftar; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Stadyum; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Stadyum" VALUES
	(19071, 'Kadıköy', 60000),
	(19051, 'TT Arena', 55000),
	(19671, 'Trabzon Arena', 25000),
	(19031, 'Vodafone Arena', 65000);


--
-- Data for Name: TakimBaskani; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."TakimBaskani" VALUES
	(1, 'Ali', 'Koç'),
	(2, 'Burak', 'Elmas'),
	(3, 'Ahmet ', 'Ağoğlu'),
	(4, 'Yıldırım', 'Demirören');


--
-- Data for Name: TakimTaraftari; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Takım; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Takım" VALUES
	(1, 'Fenerbahçe', 19071, 1, 'Kanarya', 1),
	(2, 'Galatasaray', 19051, 1, 'Aslan', 2),
	(3, 'Trabzonspor', 19671, 1, 'Hamsi', 3),
	(4, 'Beşiktaş', 19031, 1, 'Kartal', 4);


--
-- Data for Name: ToplamFederasyon; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ToplamHakem; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ToplamLig; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ToplamTakim; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ToplamTakim" VALUES
	(4),
	(4);


--
-- Name: Hakem_HakemID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Hakem_HakemID_seq"', 3, true);


--
-- Name: Lig_LigID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Lig_LigID_seq"', 1, true);


--
-- Name: TakimBaskani_TakimBaskaniID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TakimBaskani_TakimBaskaniID_seq"', 4, true);


--
-- Name: 15YasAlti 15YasAlti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."15YasAlti"
    ADD CONSTRAINT "15YasAlti_pkey" PRIMARY KEY ("FutbolcuID");


--
-- Name: 18YasAlti 18YasAlti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."18YasAlti"
    ADD CONSTRAINT "18YasAlti_pkey" PRIMARY KEY ("FutbolcuID");


--
-- Name: 21YasAlti 21YasAlti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."21YasAlti"
    ADD CONSTRAINT "21YasAlti_pkey" PRIMARY KEY ("FutbolcuID");


--
-- Name: 23YasAlti 23YasAlti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."23YasAlti"
    ADD CONSTRAINT "23YasAlti_pkey" PRIMARY KEY ("FutbolcuID");


--
-- Name: FedBaskani FedBaskani_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FedBaskani"
    ADD CONSTRAINT "FedBaskani_pkey" PRIMARY KEY ("FedBaskaniID");


--
-- Name: Federasyon Federasyon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Federasyon"
    ADD CONSTRAINT "Federasyon_pkey" PRIMARY KEY ("FederasyonID");


--
-- Name: Futbolcu Futbolcu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Futbolcu"
    ADD CONSTRAINT "Futbolcu_pkey" PRIMARY KEY ("FutbolcuID");


--
-- Name: Hakem Hakem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hakem"
    ADD CONSTRAINT "Hakem_pkey" PRIMARY KEY ("HakemID");


--
-- Name: Lig Lig_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lig"
    ADD CONSTRAINT "Lig_pkey" PRIMARY KEY ("LigID");


--
-- Name: MilliTakim MilliTakim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MilliTakim"
    ADD CONSTRAINT "MilliTakim_pkey" PRIMARY KEY ("MilliID");


--
-- Name: MilliTaraftar MilliTaraftar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MilliTaraftar"
    ADD CONSTRAINT "MilliTaraftar_pkey" PRIMARY KEY ("MilliTaraftarID");


--
-- Name: Stadyum Stadyum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Stadyum"
    ADD CONSTRAINT "Stadyum_pkey" PRIMARY KEY ("StadyumID");


--
-- Name: TakimBaskani TakimBaskani_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TakimBaskani"
    ADD CONSTRAINT "TakimBaskani_pkey" PRIMARY KEY ("TakimBaskaniID");


--
-- Name: TakimTaraftari TakimTaraftari_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TakimTaraftari"
    ADD CONSTRAINT "TakimTaraftari_pkey" PRIMARY KEY ("TakimTaraftariID");


--
-- Name: Takım Takım_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Takım"
    ADD CONSTRAINT "Takım_pkey" PRIMARY KEY ("TakimID");


--
-- Name: Federasyon unique_Federasyon_FedBaskanID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Federasyon"
    ADD CONSTRAINT "unique_Federasyon_FedBaskanID" UNIQUE ("FedBaskanID");


--
-- Name: TakimTaraftari unique_TakimTaraftari_TakimID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TakimTaraftari"
    ADD CONSTRAINT "unique_TakimTaraftari_TakimID" UNIQUE ("TakimID");


--
-- Name: Takım unique_Takım_BaskanID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Takım"
    ADD CONSTRAINT "unique_Takım_BaskanID" UNIQUE ("BaskanID");


--
-- Name: Takım trigger1; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger1 AFTER INSERT ON public."Takım" FOR EACH ROW EXECUTE FUNCTION public.takimtrigger();


--
-- Name: Hakem trigger2; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger2 AFTER INSERT ON public."Hakem" FOR EACH ROW EXECUTE FUNCTION public.hakemtrigger();


--
-- Name: Federasyon trigger3; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger3 AFTER INSERT ON public."Federasyon" FOR EACH ROW EXECUTE FUNCTION public.federasyontrigger();


--
-- Name: Lig trigger4; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger4 AFTER INSERT ON public."Lig" FOR EACH ROW EXECUTE FUNCTION public.ligtrigger();


--
-- Name: Lig 002; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lig"
    ADD CONSTRAINT "002" FOREIGN KEY ("FedID") REFERENCES public."Federasyon"("FederasyonID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Takım 005; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Takım"
    ADD CONSTRAINT "005" FOREIGN KEY ("LigID") REFERENCES public."Lig"("LigID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Takım 007; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Takım"
    ADD CONSTRAINT "007" FOREIGN KEY ("StadyumID") REFERENCES public."Stadyum"("StadyumID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Futbolcu 009; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Futbolcu"
    ADD CONSTRAINT "009" FOREIGN KEY ("MilliID") REFERENCES public."MilliTakim"("MilliID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MilliTaraftar 010; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MilliTaraftar"
    ADD CONSTRAINT "010" FOREIGN KEY ("MilliID") REFERENCES public."MilliTakim"("MilliID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Futbolcu 0100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Futbolcu"
    ADD CONSTRAINT "0100" FOREIGN KEY ("TakimID") REFERENCES public."Takım"("TakimID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TakimTaraftari 0121; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TakimTaraftari"
    ADD CONSTRAINT "0121" FOREIGN KEY ("TakimTaraftariID") REFERENCES public."Takım"("TakimID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Federasyon 11111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Federasyon"
    ADD CONSTRAINT "11111" FOREIGN KEY ("FedBaskanID") REFERENCES public."FedBaskani"("FedBaskaniID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: 15YasAlti 15YasAltiFB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."15YasAlti"
    ADD CONSTRAINT "15YasAltiFB" FOREIGN KEY ("FutbolcuID") REFERENCES public."Futbolcu"("FutbolcuID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: 18YasAlti 18YasAltiFB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."18YasAlti"
    ADD CONSTRAINT "18YasAltiFB" FOREIGN KEY ("FutbolcuID") REFERENCES public."Futbolcu"("FutbolcuID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Takım 212112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Takım"
    ADD CONSTRAINT "212112" FOREIGN KEY ("BaskanID") REFERENCES public."TakimBaskani"("TakimBaskaniID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: 21YasAlti 21YasAltiFB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."21YasAlti"
    ADD CONSTRAINT "21YasAltiFB" FOREIGN KEY ("FutbolcuID") REFERENCES public."Futbolcu"("FutbolcuID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: 23YasAlti 23YasAltiFB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."23YasAlti"
    ADD CONSTRAINT "23YasAltiFB" FOREIGN KEY ("FutbolcuID") REFERENCES public."Futbolcu"("FutbolcuID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Hakem 32323; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hakem"
    ADD CONSTRAINT "32323" FOREIGN KEY ("FedID") REFERENCES public."Federasyon"("FederasyonID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

