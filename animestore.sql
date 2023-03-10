toc.dat                                                                                             0000600 0004000 0002000 00000022664 14400165430 0014446 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       +                    {         
   animestore    15.1    15.1 &    $           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         %           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         &           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         '           1262    16731 
   animestore    DATABASE     ?   CREATE DATABASE animestore WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United Kingdom.1251';
    DROP DATABASE animestore;
                postgres    false         ?            1259    16912    details    TABLE     E   CREATE TABLE public.details (
    id integer,
    product integer
);
    DROP TABLE public.details;
       public         heap    postgres    false         ?            1259    16880    orders    TABLE     ?   CREATE TABLE public.orders (
    id integer NOT NULL,
    price integer,
    date timestamp without time zone,
    user_id integer
);
    DROP TABLE public.orders;
       public         heap    postgres    false         ?            1259    16879    orders_id_seq1    SEQUENCE     ?   CREATE SEQUENCE public.orders_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.orders_id_seq1;
       public          postgres    false    221         (           0    0    orders_id_seq1    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.orders_id_seq1 OWNED BY public.orders.id;
          public          postgres    false    220         ?            1259    16751    product    TABLE     ?   CREATE TABLE public.product (
    id integer NOT NULL,
    name text,
    info text,
    price integer,
    type integer,
    picture text DEFAULT 'placeholder'::text,
    instock boolean DEFAULT true
);
    DROP TABLE public.product;
       public         heap    postgres    false         ?            1259    16750    product_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    219         )           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    218         ?            1259    16733    type    TABLE     g   CREATE TABLE public.type (
    id integer NOT NULL,
    name text,
    instock boolean DEFAULT true
);
    DROP TABLE public.type;
       public         heap    postgres    false         ?            1259    16732    type_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.type_id_seq;
       public          postgres    false    215         *           0    0    type_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.type_id_seq OWNED BY public.type.id;
          public          postgres    false    214         ?            1259    16742    users    TABLE     h   CREATE TABLE public.users (
    id integer NOT NULL,
    name text,
    password text,
    role text
);
    DROP TABLE public.users;
       public         heap    postgres    false         ?            1259    16741    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217         +           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216         ~           2604    16883 	   orders id    DEFAULT     g   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq1'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221         {           2604    16754 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219         x           2604    16736    type id    DEFAULT     b   ALTER TABLE ONLY public.type ALTER COLUMN id SET DEFAULT nextval('public.type_id_seq'::regclass);
 6   ALTER TABLE public.type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215         z           2604    16745    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217         !          0    16912    details 
   TABLE DATA                 public          postgres    false    222       3361.dat            0    16880    orders 
   TABLE DATA                 public          postgres    false    221       3360.dat           0    16751    product 
   TABLE DATA                 public          postgres    false    219       3358.dat           0    16733    type 
   TABLE DATA                 public          postgres    false    215       3354.dat           0    16742    users 
   TABLE DATA                 public          postgres    false    217       3356.dat ,           0    0    orders_id_seq1    SEQUENCE SET     =   SELECT pg_catalog.setval('public.orders_id_seq1', 15, true);
          public          postgres    false    220         -           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 39, true);
          public          postgres    false    218         .           0    0    type_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.type_id_seq', 8, true);
          public          postgres    false    214         /           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public          postgres    false    216         ?           2606    16885    orders orders_pkey1 
   CONSTRAINT     Q   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey1 PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey1;
       public            postgres    false    221         ?           2606    16758    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    219         ?           2606    16740    type type_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.type DROP CONSTRAINT type_pkey;
       public            postgres    false    215         ?           2606    16749    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217         ?           2606    16915    details details_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.details
    ADD CONSTRAINT details_id_fkey FOREIGN KEY (id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.details DROP CONSTRAINT details_id_fkey;
       public          postgres    false    222    221    3206         ?           2606    16920    details details_product_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.details
    ADD CONSTRAINT details_product_fkey FOREIGN KEY (product) REFERENCES public.product(id);
 F   ALTER TABLE ONLY public.details DROP CONSTRAINT details_product_fkey;
       public          postgres    false    3204    219    222         ?           2606    16886    orders orders_user_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_id_fkey;
       public          postgres    false    221    217    3202         ?           2606    16759    product product_type_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_type_fkey FOREIGN KEY (type) REFERENCES public.type(id);
 C   ALTER TABLE ONLY public.product DROP CONSTRAINT product_type_fkey;
       public          postgres    false    3200    215    219                                                                                    3361.dat                                                                                            0000600 0004000 0002000 00000000603 14400165430 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.details VALUES (3, 1);
INSERT INTO public.details VALUES (3, 11);
INSERT INTO public.details VALUES (3, 27);
INSERT INTO public.details VALUES (3, 13);
INSERT INTO public.details VALUES (4, 3);
INSERT INTO public.details VALUES (4, 4);
INSERT INTO public.details VALUES (13, 39);
INSERT INTO public.details VALUES (14, 1);
INSERT INTO public.details VALUES (14, 4);


                                                                                                                             3360.dat                                                                                            0000600 0004000 0002000 00000000471 14400165430 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.orders VALUES (3, 1543, '2022-12-25 11:29:21.024334', 2);
INSERT INTO public.orders VALUES (4, 1480, '2022-12-25 11:29:44.506538', 2);
INSERT INTO public.orders VALUES (13, 23423, '2022-12-27 01:28:48.810856', 1);
INSERT INTO public.orders VALUES (14, 1653, '2022-12-27 01:41:36.855402', 5);


                                                                                                                                                                                                       3358.dat                                                                                            0000600 0004000 0002000 00000021127 14400165430 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.product VALUES (11, 'Зажигалка с принтом "Евангелион" - Синдзи', '', 490, 2, '2.1', true);
INSERT INTO public.product VALUES (12, 'Металлический пин "Евангелион" - Синдзи', '', 250, 2, '2.2', true);
INSERT INTO public.product VALUES (13, 'Металлический пин "Семья шпионов" - Аня', '', 200, 2, '2.3', true);
INSERT INTO public.product VALUES (14, 'Кошелёк "Корги офицер Пупсик"', '', 750, 2, '2.4', true);
INSERT INTO public.product VALUES (15, 'Рюкзак 184 (corgi)', '', 1990, 2, '2.5', true);
INSERT INTO public.product VALUES (16, 'Носки теплые "Сердечко" (бел.)', '', 290, 3, '3.1', true);
INSERT INTO public.product VALUES (17, 'Носки "Моя геройская академия - Шото Тодороки"', '', 290, 3, '3.2', true);
INSERT INTO public.product VALUES (18, 'Футболка "Genshin Impact / Геншин - Чжун Ли"', '', 1500, 3, '3.3', true);
INSERT INTO public.product VALUES (19, 'Толстовка "Мой сосед Тоторо"', '', 1790, 3, '3.4', true);
INSERT INTO public.product VALUES (20, 'Футболка "Моя геройская академия - Цую Асуи"', '', 890, 3, '3.5', true);
INSERT INTO public.product VALUES (21, 'Фигурка "Funko POP 01 / Фанко ПОП 01 - Гарри Поттер"', '', 1440, 4, '4.1', true);
INSERT INTO public.product VALUES (22, 'Фигурка "Fairy Tail / Фейри тейл / Хвост Феи - Грей Фуллбастер"', '', 950, 4, '4.2', true);
INSERT INTO public.product VALUES (23, 'Фигурка "Моя геройская академия - Изуку Мидория" (14 см)', '', 2640, 4, '4.3', true);
INSERT INTO public.product VALUES (24, 'Акриловая фигурка "Devil May Cry 5 / DmC - Ви / V"', '', 650, 4, '4.4', true);
INSERT INTO public.product VALUES (25, 'Фигурка "Наруто - Итачи" (светится)', '', 11880, 4, '4.5', true);
INSERT INTO public.product VALUES (26, 'Пенал "Genshin Impact" (логотип)', '', 170, 5, '5.1', true);
INSERT INTO public.product VALUES (27, 'Тетрадь в линейку "Kuromi", 60 л.', '', 150, 5, '5.2', true);
INSERT INTO public.product VALUES (28, 'Линейка "Клинок, рассекающий демонов - Зеницу"', '', 200, 5, '5.3', true);
INSERT INTO public.product VALUES (29, 'Скетчбук "Евангелион" - Рэй и Аска', '', 220, 5, '5.4', true);
INSERT INTO public.product VALUES (30, 'Скетчбук "Евангелион" - Аянами Рэй', '', 220, 5, '5.5', true);
INSERT INTO public.product VALUES (2, 'Naruto. Наруто. Книга 9. День, когда их пути разошлись: Тома 25-27: манга', 'Тёдзи и Нэдзи ценой невероятных усилий одерживают верх над Дзиробо и Кидомару. Однако новая беда не заставляет себя долго ждать: Сикамару, Киба и Рок Ли, вступив в ожесточенное сражение с подручными Оротимару, оказываются на волосок от смерти! К счастью, Пески откликаются на призыв пятой хокагэ, и Тэмари, Канкуро и Гаара успевают прийти на помощь юным синоби Листвы. Тем временем Наруто, оставив позади товарищей по отряду, наконец догоняет Саскэ. Но как переубедить того, кто все давно для себя решил? Получится ли у Наруто вернуть друга в родную деревню?..', 703, 1, '1.2', true);
INSERT INTO public.product VALUES (3, 'Нелюдь. Том 13', 'Заняв авиабазу, Сато объявляет начало третьей волны и угрожает захватить власть над страной. Кэй раскрывает его план и придумывает способ помешать ему, но сможет ли команда Нагаи остановить начавшееся уничтожение правительственных учреждений? В это же время, вопреки приказу начальства, полковник Кома вызывает «Антинел»...', 530, 1, '1.3', true);
INSERT INTO public.product VALUES (4, 'GTO. Крутой учитель Онидзука. Книга 3', 'Благодаря искреннему интересу к судьбе своих подопечных Онидзука заслужил уважение учеников класса 3-4, а после успешной сдачи национального экзамена и учителя поняли, что он не лыком шит. Он уже готов поверить, что трудности позади: Онидзука - любимец школы и даже стал героем новостей!.. Но однажды он встречает девочку, которую прежде никогда не видел в классе. Ее зовут Уруми Канадзаки, ее IQ зашкаливает за 200, она - самый опасный человек в этой школе, и она ненавидит учителей всей душой. Однажды любимая преподавательница подвела ее, раскрыв очень болезненный секрет, и теперь Канадзаки ждет предательства и от всех остальных...', 950, 1, '1.4', true);
INSERT INTO public.product VALUES (5, 'Моб Психо 100. Том 3', 'Чтобы спасти похищенного брата, Мобу придётся сразиться со взрослыми и могущественными обладателями сверхспособностей. Вместе с Тэру и Ямочки он проникает в таинственную организацию «Коготь». Ученики средней школы (и один очень злой дух) против взрослых! Да начнётся настоящая битва экстрасенсов! В третью книгу русского издания вошли 5 и 6 тома оригинального японского издания. ', 684, 1, '1.5', true);
INSERT INTO public.product VALUES (38, 'sadasd', 'fdsfgdfgf', 123123, 8, 'placeholder', false);
INSERT INTO public.product VALUES (39, 'Нормальное', 'сссссс', 10101, 1, 'KVuD04wCmqk', true);
INSERT INTO public.product VALUES (35, 'test', 'test233', 123, 7, 'placeholder', false);
INSERT INTO public.product VALUES (36, 'aaaa', 'asdasd', 123, 7, 'placeholder', false);
INSERT INTO public.product VALUES (37, 'NewMangaAA', 'MaaangaAAA', 121241111, 7, 'manga', false);
INSERT INTO public.product VALUES (1, 'Человек-бензопила. Книга 1. Пес и бензопила. Бензопила против нетопыря', 'Дэндзи – обычный молодой человек, который промышляет охотой на демонов, чтобы расплатиться с долгами покойного отца. Если он хоть раз опоздает с выплатой, его ждет смерть. Дэндзи живет в крошечной лачуге со своим демоническим псом-бензопилой по имени Почита и едва сводит концы с концами. Все о чем он мечтает – ходить на свидания с девушкой и есть хлеб с джемом. Но у судьбы на него другие планы… В один прекрасный день юноша обретает сверхъестественные силы, позволяющие ему превращать свое тело в живое оружие. Дэндзи вырывается из нищеты и под рев дребезжащих бензопил и крики умирающих демонов начинает прорезать себе дорогу в новую жизнь… В первую книгу манги вошли тома 1 и 2 («Пёс и бензопила» и «Бензопила против нетопыря»), что соответствует первым 16 главам оригинальной истории.', 703, 1, '1.1', true);


                                                                                                                                                                                                                                                                                                                                                                                                                                         3354.dat                                                                                            0000600 0004000 0002000 00000000644 14400165430 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.type VALUES (2, 'Аксессуары', true);
INSERT INTO public.type VALUES (3, 'Одежда', true);
INSERT INTO public.type VALUES (4, 'Фигурки', true);
INSERT INTO public.type VALUES (5, 'Канцелярия', true);
INSERT INTO public.type VALUES (7, 'Игрушки', false);
INSERT INTO public.type VALUES (1, 'Манга', true);
INSERT INTO public.type VALUES (8, 'Test', false);


                                                                                            3356.dat                                                                                            0000600 0004000 0002000 00000000274 14400165430 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.users VALUES (1, 'admin', 'admin', 'admin');
INSERT INTO public.users VALUES (2, 'user', 'user', 'user');
INSERT INTO public.users VALUES (5, 'Test', 'Test', 'user');


                                                                                                                                                                                                                                                                                                                                    restore.sql                                                                                         0000600 0004000 0002000 00000016667 14400165430 0015401 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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

DROP DATABASE animestore;
--
-- Name: animestore; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE animestore WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United Kingdom.1251';


ALTER DATABASE animestore OWNER TO postgres;

\connect animestore

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
-- Name: details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.details (
    id integer,
    product integer
);


ALTER TABLE public.details OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    price integer,
    date timestamp without time zone,
    user_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq1 OWNER TO postgres;

--
-- Name: orders_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq1 OWNED BY public.orders.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name text,
    info text,
    price integer,
    type integer,
    picture text DEFAULT 'placeholder'::text,
    instock boolean DEFAULT true
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type (
    id integer NOT NULL,
    name text,
    instock boolean DEFAULT true
);


ALTER TABLE public.type OWNER TO postgres;

--
-- Name: type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_id_seq OWNER TO postgres;

--
-- Name: type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_id_seq OWNED BY public.type.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text,
    password text,
    role text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq1'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type ALTER COLUMN id SET DEFAULT nextval('public.type_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: details; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/3361.dat

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/3360.dat

--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/3358.dat

--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/3354.dat

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/3356.dat

--
-- Name: orders_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq1', 15, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 39, true);


--
-- Name: type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: orders orders_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey1 PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: type type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: details details_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.details
    ADD CONSTRAINT details_id_fkey FOREIGN KEY (id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: details details_product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.details
    ADD CONSTRAINT details_product_fkey FOREIGN KEY (product) REFERENCES public.product(id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: product product_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_type_fkey FOREIGN KEY (type) REFERENCES public.type(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         