# RPPOOP-HospitalManagement
Mini Project for subject RPPOOP(Rapid Prototyping Object Oriented Programming)

## Database Schema
![image](https://user-images.githubusercontent.com/44437936/115153106-d8a00580-a091-11eb-99d7-6d6593b141d2.png)

## Database Function Documentation

### Add Doctor

#### Function Name
```sql
fn_add_doctor
```

#### Function Parameter
```sql
	doctor_name text,
	doctor_age integer,
	doctor_gender boolean,
	doctor_specialization text,
	doctor_experience integer,
	doctor_contact_number text
```

#### Function Descriptions

Used to add a new doctor

#### Returns
```sql
boolean
```

#### Query
```sql
SELECT * FROM public.fn_add_doctor(
	doctor_name text,
	doctor_age integer,
	doctor_gender boolean,
	doctor_specialization text,
	doctor_experience integer,
	doctor_contact_number text
);
```

---

### Add Patient

#### Function Name
```sql
fn_add_patient
```

#### Function Parameter
```sql
	patient_name text,
	patient_age integer,
	patient_gender boolean,
	patient_contact_number text,
	patient_email_id text,
	patient_disease text,
	patient_ward_number text,
	doctor_assigned bigint,
	covid_patient_flag boolean
```

#### Function Descriptions

Used to add a new patient

#### Returns
```sql
boolean
```

#### Query
```sql
SELECT * FROM public.fn_add_patient(
	patient_name text,
	patient_age integer,
	patient_gender boolean,
	patient_contact_number text,
	patient_email_id text,
	patient_disease text,
	patient_ward_number text,
	doctor_assigned bigint,
	covid_patient_flag boolean
);
```

---

### User Login

#### Function Name
```sql
fn_login_user
```

#### Function Parameter
```sql
	username text,
	password text
```

#### Function Descriptions

Used to provice user login validation

#### Returns
```sql
username text
```

#### Query
```sql
SELECT * FROM public.fn_login_user(
	username text,
	password text
);
```

---

### Search Doctor

#### Function Name
```sql
fn_search_doctor
```

#### Function Parameter
```sql
  doctor_name text
```

#### Function Descriptions

Used to provice search functionality to doctor's list

#### Returns
```sql
		doctor_id bigint, 
		doctor_name text, 
		doctor_age integer,
		doctor_gender boolean, 
		doctor_specialization text, 
		doctor_experience integer, 
		doctor_contact_number text
```

#### Query
```sql
SELECT * FROM public.fn_search_doctor(
	doctor_name text
);
```

---

### Search Patient

#### Function Name
```sql
fn_search_patient
```

#### Function Parameter
```sql
  patient_name text
```

#### Function Descriptions

Used to provice search functionality to patient's list

#### Returns
```sql
		patient_id bigint, 
		patient_name text, 
		patient_age integer,
		patient_gender boolean,
		patient_contact_number text,
		patient_email_id text,
		patient_disease text, 
		patient_ward_number text, 
		doctor_id bigint, 
		doctor_name text, 
		doctor_contact_number text,
		covid_patient_flag boolean
```

#### Query
```sql
SELECT * FROM public.fn_search_patient(
	patient_name text
);
```
---

### Select All COVID-19 Patients

#### Function Name
```sql
fn_select_all_covid_patients
```

#### Function Parameter
```sql
  void
```

#### Function Descriptions

Used to select all covid-19 affected patient's in database

#### Returns
```sql
		patient_id bigint,
		patient_name text,
		patient_age integer, 
		patient_gender boolean, 
		patient_contact_number text,
		patient_email_id text, 
		patient_disease text, 
		patient_ward_number text,
		doctor_id bigint,
		doctor_name text,
		doctor_contact_number text,
		covid_patient_flag boolean
```

#### Query
```sql
SELECT * FROM public.fn_select_all_covid_patients();
```

---

### Select All Doctors

#### Function Name
```sql
fn_select_all_doctors
```

#### Function Parameter
```sql
  void
```

#### Function Descriptions

Used to select all doctor's in database

#### Returns
```sql
		doctor_id bigint, 
		doctor_name text, 
		doctor_age integer, 
		doctor_gender boolean,
		doctor_specialization text, 
		doctor_experience integer, 
		doctor_contact_number text
```

#### Query
```sql
SELECT * FROM public.fn_select_all_doctors();
```

---

### Select All Patients

#### Function Name
```sql
fn_select_all_patients
```

#### Function Parameter
```sql
  void
```

#### Function Descriptions

Used to select all patient's in database


#### Returns
```sql
		patient_id bigint,
		patient_name text, 
		patient_age integer, 
		patient_gender boolean, 
		patient_contact_number text, 
		patient_email_id text, 
		patient_disease text,
		patient_ward_number text,
		doctor_id bigint, 
		doctor_name text, 
		doctor_contact_number text,
		covid_patient_flag boolean
```

#### Query
```sql
SELECT * FROM public.fn_select_all_patients();
```

---

### Select All Doctors (id, name)

#### Function Name
```sql
fn_select_all_doctor_name_id
```

#### Function Parameter
```sql
  void
```

#### Function Descriptions

Used to select all doctor's id and name in database


#### Returns
```sql
	doctor_id bigint, 
	doctor_name text
```

#### Query
```sql
SELECT * FROM public.fn_select_all_doctor_name_id();
```
