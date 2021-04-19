PGDMP         	                y            postgres    11.6     13.2 (Ubuntu 13.2-1.pgdg18.04+1) 3    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    14417    postgres    DATABASE     l   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE postgres;
                azure_superuser    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   azure_superuser    false    4285            �            1255    23448 :   fn_add_doctor(text, integer, boolean, text, integer, text)    FUNCTION     o  CREATE FUNCTION public.fn_add_doctor(doctor_name_in text, doctor_age_in integer, doctor_gender_in boolean, doctor_specialization_in text, doctor_experience_in integer, doctor_contact_number_in text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO public.doctors(
	doctor_name, 
	doctor_age, 
	doctor_gender, 
	doctor_specialization, 
	doctor_experience, 
	doctor_contact_number)
	VALUES 
	(
		doctor_name_in,
		doctor_age_in,
		doctor_gender_in,
		doctor_specialization_in,
		doctor_experience_in,
		doctor_contact_number_in
	);
	
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 �   DROP FUNCTION public.fn_add_doctor(doctor_name_in text, doctor_age_in integer, doctor_gender_in boolean, doctor_specialization_in text, doctor_experience_in integer, doctor_contact_number_in text);
       public          purav    false            �            1255    23462 O   fn_add_patient(text, integer, boolean, text, text, text, text, bigint, boolean)    FUNCTION     A  CREATE FUNCTION public.fn_add_patient(patient_name_in text, patient_age_in integer, patient_gender_in boolean, patient_contact_number_in text, patient_email_id_in text, patient_disease_in text, patient_ward_number_in text, doctor_assigned_in bigint, covid_patient_flag_in boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO public.patients(
	patient_name, 
	patient_age, 
	patient_gender,
	patient_contact_number, 
	patient_email_id, 
	patient_disease, 
	patient_ward_number, 
	doctor_assigned, 
	covid_patient_flag)
	VALUES 
	(
	patient_name_in, 
	patient_age_in, 
	patient_gender_in,
	patient_contact_number_in, 
	patient_email_id_in, 
	patient_disease_in, 
	patient_ward_number_in, 
	doctor_assigned_in, 
	covid_patient_flag_in);
	
	
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
   DROP FUNCTION public.fn_add_patient(patient_name_in text, patient_age_in integer, patient_gender_in boolean, patient_contact_number_in text, patient_email_id_in text, patient_disease_in text, patient_ward_number_in text, doctor_assigned_in bigint, covid_patient_flag_in boolean);
       public          purav    false            �            1255    24394    fn_login_user(text, text)    FUNCTION     �   CREATE FUNCTION public.fn_login_user(username_in text, password_in text) RETURNS TABLE(username text)
    LANGUAGE sql
    AS $$
	SELECT username FROM public.application_user WHERE username = username_in AND password = password_in ;
$$;
 H   DROP FUNCTION public.fn_login_user(username_in text, password_in text);
       public          purav    false            �            1255    23706    fn_search_doctor(text)    FUNCTION     �  CREATE FUNCTION public.fn_search_doctor(doctor_name_in text) RETURNS TABLE(doctor_id bigint, doctor_name text, doctor_age integer, doctor_gender boolean, doctor_specialization text, doctor_experience integer, doctor_contact_number text)
    LANGUAGE sql
    AS $$
SELECT 
	doctor_id,
	doctor_name,
	doctor_age, 
	doctor_gender,
	doctor_specialization,
	doctor_experience, 
	doctor_contact_number
FROM public.doctors
WHERE lower(doctor_name) LIKE '%' || lower(doctor_name_in) || '%';
$$;
 <   DROP FUNCTION public.fn_search_doctor(doctor_name_in text);
       public          purav    false            �            1255    23705    fn_search_patient(text)    FUNCTION     S  CREATE FUNCTION public.fn_search_patient(patient_name_in text) RETURNS TABLE(patient_id bigint, patient_name text, patient_age integer, patient_gender boolean, patient_contact_number text, patient_email_id text, patient_disease text, patient_ward_number text, doctor_id bigint, doctor_name text, doctor_contact_number text, covid_patient_flag boolean)
    LANGUAGE sql
    AS $$
SELECT 	patient_id,
		patient_name, 
		patient_age,
		patient_gender,
		patient_contact_number,
		patient_email_id,
		patient_disease,
		patient_ward_number,
		public.doctors.doctor_id,
		public.doctors.doctor_name,
		public.doctors.doctor_contact_number,
		covid_patient_flag
	FROM public.patients
	JOIN public.doctors ON public.patients.doctor_assigned = public.doctors.doctor_id
	WHERE lower(public.patients.patient_name) LIKE '%' || lower(patient_name_in) || '%';
$$;
 >   DROP FUNCTION public.fn_search_patient(patient_name_in text);
       public          purav    false            �            1255    23526    fn_select_all_covid_patients()    FUNCTION     &  CREATE FUNCTION public.fn_select_all_covid_patients() RETURNS TABLE(patient_id bigint, patient_name text, patient_age integer, patient_gender boolean, patient_contact_number text, patient_email_id text, patient_disease text, patient_ward_number text, doctor_id bigint, doctor_name text, doctor_contact_number text, covid_patient_flag boolean)
    LANGUAGE sql
    AS $$
SELECT 	patient_id,
		patient_name, 
		patient_age,
		patient_gender,
		patient_contact_number,
		patient_email_id,
		patient_disease,
		patient_ward_number,
		public.doctors.doctor_id,
		public.doctors.doctor_name,
		public.doctors.doctor_contact_number,
		covid_patient_flag
	FROM public.patients
	JOIN public.doctors ON public.patients.doctor_assigned = public.doctors.doctor_id
	WHERE public.patients.covid_patient_flag = true;
$$;
 5   DROP FUNCTION public.fn_select_all_covid_patients();
       public          purav    false            �            1255    23518    fn_select_all_doctors()    FUNCTION     �  CREATE FUNCTION public.fn_select_all_doctors() RETURNS TABLE(doctor_id bigint, doctor_name text, doctor_age integer, doctor_gender boolean, doctor_specialization text, doctor_experience integer, doctor_contact_number text)
    LANGUAGE sql
    AS $$
SELECT 
	doctor_id,
	doctor_name,
	doctor_age, 
	doctor_gender,
	doctor_specialization,
	doctor_experience, 
	doctor_contact_number
FROM public.doctors;
$$;
 .   DROP FUNCTION public.fn_select_all_doctors();
       public          purav    false            �            1255    23522    fn_select_all_patients()    FUNCTION     �  CREATE FUNCTION public.fn_select_all_patients() RETURNS TABLE(patient_id bigint, patient_name text, patient_age integer, patient_gender boolean, patient_contact_number text, patient_email_id text, patient_disease text, patient_ward_number text, doctor_id bigint, doctor_name text, doctor_contact_number text, covid_patient_flag boolean)
    LANGUAGE sql
    AS $$
SELECT 	patient_id,
		patient_name, 
		patient_age,
		patient_gender,
		patient_contact_number,
		patient_email_id,
		patient_disease,
		patient_ward_number,
		public.doctors.doctor_id,
		public.doctors.doctor_name,
		public.doctors.doctor_contact_number,
		covid_patient_flag
	FROM public.patients
	JOIN public.doctors ON public.patients.doctor_assigned = public.doctors.doctor_id;
$$;
 /   DROP FUNCTION public.fn_select_all_patients();
       public          purav    false            �            1255    23544 "   update_doctor_age(bigint, integer)    FUNCTION     +  CREATE FUNCTION public.update_doctor_age(doctor_id_in bigint, doctor_age_in integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET doctor_age = doctor_age_in WHERE doctor_id = doctor_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 T   DROP FUNCTION public.update_doctor_age(doctor_id_in bigint, doctor_age_in integer);
       public          purav    false            �            1255    23548 *   update_doctor_contact_number(bigint, text)    FUNCTION     T  CREATE FUNCTION public.update_doctor_contact_number(doctor_id_in bigint, doctor_contact_number_in text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET doctor_contact_number = doctor_contact_number_in WHERE doctor_id = doctor_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 g   DROP FUNCTION public.update_doctor_contact_number(doctor_id_in bigint, doctor_contact_number_in text);
       public          purav    false            �            1255    23547 )   update_doctor_experience(bigint, integer)    FUNCTION     G  CREATE FUNCTION public.update_doctor_experience(doctor_id_in bigint, doctor_experience_in integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET doctor_experience = doctor_experience_in WHERE doctor_id = doctor_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 b   DROP FUNCTION public.update_doctor_experience(doctor_id_in bigint, doctor_experience_in integer);
       public          purav    false            �            1255    23545 %   update_doctor_gender(bigint, boolean)    FUNCTION     7  CREATE FUNCTION public.update_doctor_gender(doctor_id_in bigint, doctor_gender_in boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET doctor_gender = doctor_gender_in WHERE doctor_id = doctor_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 Z   DROP FUNCTION public.update_doctor_gender(doctor_id_in bigint, doctor_gender_in boolean);
       public          purav    false            �            1255    23543     update_doctor_name(bigint, text)    FUNCTION     ,  CREATE FUNCTION public.update_doctor_name(doctor_id_in bigint, doctor_name_in text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET doctor_name = doctor_name_in WHERE doctor_id = doctor_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 S   DROP FUNCTION public.update_doctor_name(doctor_id_in bigint, doctor_name_in text);
       public          purav    false            �            1255    23546 *   update_doctor_specialization(bigint, text)    FUNCTION     T  CREATE FUNCTION public.update_doctor_specialization(doctor_id_in bigint, doctor_specialization_in text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET doctor_specialization = doctor_specialization_in WHERE doctor_id = doctor_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 g   DROP FUNCTION public.update_doctor_specialization(doctor_id_in bigint, doctor_specialization_in text);
       public          purav    false            �            1255    23535 #   update_patient_age(bigint, integer)    FUNCTION     2  CREATE FUNCTION public.update_patient_age(patient_id_in bigint, patient_age_in integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET patient_age = patient_age_in WHERE patient_id = patient_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 W   DROP FUNCTION public.update_patient_age(patient_id_in bigint, patient_age_in integer);
       public          purav    false            �            1255    23537 +   update_patient_contact_number(bigint, text)    FUNCTION     [  CREATE FUNCTION public.update_patient_contact_number(patient_id_in bigint, patient_contact_number_in text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET patient_contact_number = patient_contact_number_in WHERE patient_id = patient_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 j   DROP FUNCTION public.update_patient_contact_number(patient_id_in bigint, patient_contact_number_in text);
       public          purav    false            �            1255    23542 *   update_patient_covid_flag(bigint, boolean)    FUNCTION     N  CREATE FUNCTION public.update_patient_covid_flag(patient_id_in bigint, covid_patient_flag_in boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET covid_patient_flag = covid_patient_flag_in WHERE patient_id = patient_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 e   DROP FUNCTION public.update_patient_covid_flag(patient_id_in bigint, covid_patient_flag_in boolean);
       public          purav    false            �            1255    23539 $   update_patient_disease(bigint, text)    FUNCTION     ?  CREATE FUNCTION public.update_patient_disease(patient_id_in bigint, patient_disease_in text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET patient_disease = patient_disease_in WHERE patient_id = patient_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 \   DROP FUNCTION public.update_patient_disease(patient_id_in bigint, patient_disease_in text);
       public          purav    false            �            1255    23541 .   update_patient_doctor_assigned(bigint, bigint)    FUNCTION     I  CREATE FUNCTION public.update_patient_doctor_assigned(patient_id_in bigint, doctor_assigned_in bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET doctor_assigned = doctor_assigned_in WHERE patient_id = patient_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 f   DROP FUNCTION public.update_patient_doctor_assigned(patient_id_in bigint, doctor_assigned_in bigint);
       public          purav    false            �            1255    23538 %   update_patient_email_id(bigint, text)    FUNCTION     C  CREATE FUNCTION public.update_patient_email_id(patient_id_in bigint, patient_email_id_in text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET patient_email_id = patient_email_id_in WHERE patient_id = patient_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 ^   DROP FUNCTION public.update_patient_email_id(patient_id_in bigint, patient_email_id_in text);
       public          purav    false            �            1255    23536 &   update_patient_gender(bigint, boolean)    FUNCTION     >  CREATE FUNCTION public.update_patient_gender(patient_id_in bigint, patient_gender_in boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET patient_gender = patient_gender_in WHERE patient_id = patient_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 ]   DROP FUNCTION public.update_patient_gender(patient_id_in bigint, patient_gender_in boolean);
       public          purav    false            �            1255    23534 !   update_patient_name(bigint, text)    FUNCTION     3  CREATE FUNCTION public.update_patient_name(patient_id_in bigint, patient_name_in text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET patient_name = patient_name_in WHERE patient_id = patient_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 V   DROP FUNCTION public.update_patient_name(patient_id_in bigint, patient_name_in text);
       public          purav    false            �            1255    23540 (   update_patient_ward_number(bigint, text)    FUNCTION     O  CREATE FUNCTION public.update_patient_ward_number(patient_id_in bigint, patient_ward_number_in text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE public.patients SET patient_ward_number = patient_ward_number_in WHERE patient_id = patient_id_in;
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 d   DROP FUNCTION public.update_patient_ward_number(patient_id_in bigint, patient_ward_number_in text);
       public          purav    false            �            1259    16535    application_user    TABLE     ~   CREATE TABLE public.application_user (
    user_id bigint NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);
 $   DROP TABLE public.application_user;
       public            purav    false            �            1259    16533    application_user_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.application_user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.application_user_user_id_seq;
       public          purav    false    205            �           0    0    application_user_user_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.application_user_user_id_seq OWNED BY public.application_user.user_id;
          public          purav    false    204            �            1259    16507    doctors    TABLE     +  CREATE TABLE public.doctors (
    doctor_id bigint NOT NULL,
    doctor_name text NOT NULL,
    doctor_age integer NOT NULL,
    doctor_gender boolean DEFAULT false NOT NULL,
    doctor_specialization text NOT NULL,
    doctor_experience integer NOT NULL,
    doctor_contact_number text NOT NULL
);
    DROP TABLE public.doctors;
       public            purav    false            �            1259    16505    doctors_doctor_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.doctors_doctor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.doctors_doctor_id_seq;
       public          purav    false    201            �           0    0    doctors_doctor_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.doctors_doctor_id_seq OWNED BY public.doctors.doctor_id;
          public          purav    false    200            �            1259    16521    patients    TABLE     �  CREATE TABLE public.patients (
    patient_id bigint NOT NULL,
    patient_name text NOT NULL,
    patient_age integer NOT NULL,
    patient_gender boolean DEFAULT false NOT NULL,
    patient_contact_number text NOT NULL,
    patient_email_id text NOT NULL,
    patient_disease text NOT NULL,
    patient_ward_number text NOT NULL,
    doctor_assigned bigint NOT NULL,
    covid_patient_flag boolean DEFAULT false NOT NULL
);
    DROP TABLE public.patients;
       public            purav    false            �            1259    16519    patients_patient_id_seq    SEQUENCE     �   CREATE SEQUENCE public.patients_patient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.patients_patient_id_seq;
       public          purav    false    203            �           0    0    patients_patient_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.patients_patient_id_seq OWNED BY public.patients.patient_id;
          public          purav    false    202            .           2604    16538    application_user user_id    DEFAULT     �   ALTER TABLE ONLY public.application_user ALTER COLUMN user_id SET DEFAULT nextval('public.application_user_user_id_seq'::regclass);
 G   ALTER TABLE public.application_user ALTER COLUMN user_id DROP DEFAULT;
       public          purav    false    204    205    205            )           2604    16510    doctors doctor_id    DEFAULT     v   ALTER TABLE ONLY public.doctors ALTER COLUMN doctor_id SET DEFAULT nextval('public.doctors_doctor_id_seq'::regclass);
 @   ALTER TABLE public.doctors ALTER COLUMN doctor_id DROP DEFAULT;
       public          purav    false    200    201    201            +           2604    16524    patients patient_id    DEFAULT     z   ALTER TABLE ONLY public.patients ALTER COLUMN patient_id SET DEFAULT nextval('public.patients_patient_id_seq'::regclass);
 B   ALTER TABLE public.patients ALTER COLUMN patient_id DROP DEFAULT;
       public          purav    false    202    203    203            �          0    16535    application_user 
   TABLE DATA           G   COPY public.application_user (user_id, username, password) FROM stdin;
    public          purav    false    205   (^       �          0    16507    doctors 
   TABLE DATA           �   COPY public.doctors (doctor_id, doctor_name, doctor_age, doctor_gender, doctor_specialization, doctor_experience, doctor_contact_number) FROM stdin;
    public          purav    false    201   E^       �          0    16521    patients 
   TABLE DATA           �   COPY public.patients (patient_id, patient_name, patient_age, patient_gender, patient_contact_number, patient_email_id, patient_disease, patient_ward_number, doctor_assigned, covid_patient_flag) FROM stdin;
    public          purav    false    203   �^       �           0    0    application_user_user_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.application_user_user_id_seq', 1, false);
          public          purav    false    204            �           0    0    doctors_doctor_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.doctors_doctor_id_seq', 2, true);
          public          purav    false    200            �           0    0    patients_patient_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.patients_patient_id_seq', 1, true);
          public          purav    false    202            5           2606    16543 &   application_user application_user_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.application_user
    ADD CONSTRAINT application_user_pkey PRIMARY KEY (user_id);
 P   ALTER TABLE ONLY public.application_user DROP CONSTRAINT application_user_pkey;
       public            purav    false    205            0           2606    16515    doctors doctors_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (doctor_id);
 >   ALTER TABLE ONLY public.doctors DROP CONSTRAINT doctors_pkey;
       public            purav    false    201            3           2606    16529    patients patients_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);
 @   ALTER TABLE ONLY public.patients DROP CONSTRAINT patients_pkey;
       public            purav    false    203            1           1259    16549    fki_doctor_assiged_to_patient    INDEX     ]   CREATE INDEX fki_doctor_assiged_to_patient ON public.patients USING btree (doctor_assigned);
 1   DROP INDEX public.fki_doctor_assiged_to_patient;
       public            purav    false    203            6           2606    16544 "   patients doctor_assiged_to_patient    FK CONSTRAINT     �   ALTER TABLE ONLY public.patients
    ADD CONSTRAINT doctor_assiged_to_patient FOREIGN KEY (doctor_assigned) REFERENCES public.doctors(doctor_id);
 L   ALTER TABLE ONLY public.patients DROP CONSTRAINT doctor_assiged_to_patient;
       public          purav    false    201    4144    203            �      x������ � �      �   0   x�3�,(-J,�46�L�LN,J�LL�44�47601063�0������ ��	=      �   a   x�3�,(-J,�4��L�47601063�0�L�(H-��M-�+�3�K�,qH�M���K�ύ���HM,*QH,)IL��r�u�52�542�4�,����� ��z     