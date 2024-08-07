PGDMP      	                |         	   STUDPOSTS    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16974 	   STUDPOSTS    DATABASE        CREATE DATABASE "STUDPOSTS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "STUDPOSTS";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    17042    comments    TABLE       CREATE TABLE public.comments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    content text NOT NULL,
    imagedata character varying(255),
    tags character varying(200),
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.comments;
       public         heap    postgres    false    4            �            1259    17041    comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public          postgres    false    220    4            �           0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
          public          postgres    false    219            �            1259    17024    posts    TABLE     �  CREATE TABLE public.posts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    tags character varying(200),
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    imagedata character varying(255),
    viewcount integer DEFAULT 0,
    likescount integer DEFAULT 0,
    dislikescount integer DEFAULT 0
);
    DROP TABLE public.posts;
       public         heap    postgres    false    4            �            1259    17023    posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public          postgres    false    218    4            �           0    0    posts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
          public          postgres    false    217            �            1259    16976    users    TABLE     }  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(120) NOT NULL,
    password character varying(128) NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    privileged boolean DEFAULT false,
    email character varying(36) NOT NULL,
    phonenumber character varying(20),
    persphotodata character varying(255)
);
    DROP TABLE public.users;
       public         heap    postgres    false    4            �            1259    16975    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    4    216            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    215            +           2604    17045    comments id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            &           2604    17027    posts id    DEFAULT     d   ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            $           2604    16979    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    17042    comments 
   TABLE DATA           ]   COPY public.comments (id, user_id, post_id, content, imagedata, tags, createdat) FROM stdin;
    public          postgres    false    220   �!       �          0    17024    posts 
   TABLE DATA           ~   COPY public.posts (id, user_id, title, content, tags, createdat, imagedata, viewcount, likescount, dislikescount) FROM stdin;
    public          postgres    false    218   W"       �          0    16976    users 
   TABLE DATA           {   COPY public.users (id, username, password, firstname, lastname, privileged, email, phonenumber, persphotodata) FROM stdin;
    public          postgres    false    216   g#       �           0    0    comments_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.comments_id_seq', 5, true);
          public          postgres    false    219            �           0    0    posts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.posts_id_seq', 15, true);
          public          postgres    false    217            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    215            2           2606    17050    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    220            0           2606    17035    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    218            .           2606    16984    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            4           2606    17056    comments comments_post_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id);
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_post_id_fkey;
       public          postgres    false    4656    220    218            5           2606    17051    comments comments_user_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_fkey;
       public          postgres    false    216    4654    220            3           2606    17036    posts posts_user_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 B   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_user_id_fkey;
       public          postgres    false    216    4654    218            �   i   x���]� �gn
�?"�0�m�|�������88s�n�<շ�v�Rw�?��>&�416ɛ!($� {L�Hƞ��f�t�iK�L6���U8���4Ys      �      x��һm�0��������!2���0Ҥ���ܥ��F� !:��cA��?:tu���W����Yg����~9�Ӌ# 9B<�0���k�i�
�5�> 7 r��y׼@��L ��WE��a@`�&����{y�'B*�^ADL��%~Ƅx���7"u��q��5��qC� y�DB�&	��.Bl�P0K��'�딠P(,�T��o��j���������VWE�"�V����U�MQ [볋�
�		�'?M�/�VU      �   3   x�3�LL�OJ�441⼰���3Ə3b�Cznbf�^r~.H0Ə+F��� �QV�     