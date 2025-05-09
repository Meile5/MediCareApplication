-- This schema is generated based on the current DBContext. Please check the class Seeder to see.
CREATE TABLE clinic (
    idclinic text NOT NULL,
    clinicname text NOT NULL,
    address text NOT NULL,
    phonenumber text NOT NULL,
    type text NOT NULL,
    CONSTRAINT clinic_pk PRIMARY KEY (idclinic)
);


CREATE TABLE rndom (
    column_name integer
);


CREATE TABLE roles (
    idroles text NOT NULL,
    namerole text NOT NULL,
    CONSTRAINT roles_pk PRIMARY KEY (idroles)
);


CREATE TABLE "User" (
    iduser text NOT NULL,
    email text NOT NULL,
    hash text NOT NULL,
    salt text NOT NULL,
    role text NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (iduser),
    CONSTRAINT user_roles_idroles_fk FOREIGN KEY (role) REFERENCES roles (idroles)
);


CREATE TABLE doctors (
    doctorid text NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    age text,
    gender text,
    specialty text NOT NULL,
    CONSTRAINT doctors_pk PRIMARY KEY (doctorid),
    CONSTRAINT doctors_user_iduser_fk FOREIGN KEY (doctorid) REFERENCES "User" (iduser)
);


CREATE TABLE patients (
    userid text NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    gender text NOT NULL,
    age text NOT NULL,
    bloodtype text NOT NULL,
    allergies text,
    phonenumber text NOT NULL,
    address text NOT NULL,
    device_id text,
    CONSTRAINT patients_pk PRIMARY KEY (userid),
    CONSTRAINT patients_user_iduser_fk FOREIGN KEY (userid) REFERENCES "User" (iduser)
);


CREATE TABLE clinic_doctor (
    idclinicdoctor text NOT NULL,
    idclinic text NOT NULL,
    iddoctor text NOT NULL,
    CONSTRAINT clinic_doctor_pk PRIMARY KEY (idclinicdoctor),
    CONSTRAINT clinic_doctor_clinic_idclinic_fk FOREIGN KEY (idclinic) REFERENCES clinic (idclinic),
    CONSTRAINT clinic_doctor_doctors_doctorid_fk FOREIGN KEY (iddoctor) REFERENCES doctors (doctorid)
);


CREATE TABLE doctor_availability (
    id text NOT NULL,
    doctor_id text NOT NULL,
    day_of_week text NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT (now()),
    updated_at timestamp without time zone DEFAULT (now()),
    date_override date,
    type character varying(20) DEFAULT ('default'::character varying),
    CONSTRAINT doctor_availability_pkey PRIMARY KEY (id),
    CONSTRAINT fk_doctor FOREIGN KEY (doctor_id) REFERENCES doctors (doctorid) ON DELETE CASCADE
);


CREATE TABLE appointments (
    id text NOT NULL,
    doctor_id text NOT NULL,
    patient_id text NOT NULL,
    status character varying(20) NOT NULL,
    notes text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT (now()),
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    CONSTRAINT appointments_pkey PRIMARY KEY (id),
    CONSTRAINT fk_doctor FOREIGN KEY (doctor_id) REFERENCES doctors (doctorid) ON DELETE CASCADE,
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patients (userid) ON DELETE CASCADE
);


CREATE TABLE chat_rooms (
    id text NOT NULL,
    doctor_id text,
    patient_id text,
    created_at timestamp without time zone DEFAULT (now()),
    topic text NOT NULL,
    start_time timestamp with time zone NOT NULL,
    is_finished boolean,
    end_time timestamp with time zone NOT NULL,
    CONSTRAINT chat_rooms_pkey PRIMARY KEY (id),
    CONSTRAINT chat_rooms_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES doctors (doctorid) ON DELETE CASCADE,
    CONSTRAINT chat_rooms_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES patients (userid) ON DELETE CASCADE
);


CREATE TABLE clinic_patient (
    idclinicpatient text NOT NULL,
    idclinic text NOT NULL,
    idpatient text NOT NULL,
    CONSTRAINT clinic_patient_pk PRIMARY KEY (idclinicpatient),
    CONSTRAINT clinic_patient_clinic_idclinic_fk FOREIGN KEY (idclinic) REFERENCES clinic (idclinic),
    CONSTRAINT clinic_patient_patients_userid_fk FOREIGN KEY (idpatient) REFERENCES patients (userid)
);


CREATE TABLE diagnoses (
    iddiagnoses character varying NOT NULL,
    diagnoses character varying,
    idpatient character varying NOT NULL,
    treatment text,
    iddoctor text NOT NULL,
    date date,
    CONSTRAINT diagnoses_pk PRIMARY KEY (iddiagnoses),
    CONSTRAINT diagnoses_doctors_doctorid_fk FOREIGN KEY (iddoctor) REFERENCES doctors (doctorid),
    CONSTRAINT diagnoses_user_iduser_fk FOREIGN KEY (idpatient) REFERENCES patients (userid)
);


CREATE TABLE doctor_patient (
    id text NOT NULL,
    doctor_id text NOT NULL,
    patient_id text NOT NULL,
    CONSTRAINT doctor_patient_pk PRIMARY KEY (id),
    CONSTRAINT doctor_patient_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES doctors (doctorid) ON DELETE CASCADE,
    CONSTRAINT doctor_patient_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES patients (userid) ON DELETE CASCADE
);


CREATE TABLE patient_vitals (
    id text NOT NULL,
    patient_id text NOT NULL,
    oxygen_level numeric(5,2),
    body_temperature numeric(4,2),
    heart_rate integer,
    created_at timestamp with time zone DEFAULT (now()),
    ecg_summary jsonb,
    CONSTRAINT patient_vitals_pkey PRIMARY KEY (id),
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patients (userid) ON DELETE CASCADE
);


CREATE TABLE messages (
    id text NOT NULL,
    room_id text NOT NULL,
    sender_id text NOT NULL,
    content text NOT NULL,
    sent_at timestamp without time zone DEFAULT (now()),
    is_read boolean DEFAULT FALSE,
    sender_name text NOT NULL,
    CONSTRAINT messages_pkey PRIMARY KEY (id),
    CONSTRAINT messages_room_id_fkey FOREIGN KEY (room_id) REFERENCES chat_rooms (id) ON DELETE CASCADE,
    CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES "User" (iduser)
);


CREATE INDEX "IX_appointments_doctor_id" ON appointments (doctor_id);


CREATE INDEX "IX_appointments_patient_id" ON appointments (patient_id);


CREATE INDEX "IX_chat_rooms_doctor_id" ON chat_rooms (doctor_id);


CREATE INDEX "IX_chat_rooms_patient_id" ON chat_rooms (patient_id);


CREATE INDEX "IX_clinic_doctor_idclinic" ON clinic_doctor (idclinic);


CREATE INDEX "IX_clinic_doctor_iddoctor" ON clinic_doctor (iddoctor);


CREATE INDEX "IX_clinic_patient_idclinic" ON clinic_patient (idclinic);


CREATE INDEX "IX_clinic_patient_idpatient" ON clinic_patient (idpatient);


CREATE INDEX "IX_diagnoses_iddoctor" ON diagnoses (iddoctor);


CREATE INDEX "IX_diagnoses_idpatient" ON diagnoses (idpatient);


CREATE INDEX "IX_doctor_availability_doctor_id" ON doctor_availability (doctor_id);


CREATE INDEX "IX_doctor_patient_doctor_id" ON doctor_patient (doctor_id);


CREATE INDEX "IX_doctor_patient_patient_id" ON doctor_patient (patient_id);


CREATE INDEX "IX_messages_room_id" ON messages (room_id);


CREATE INDEX "IX_messages_sender_id" ON messages (sender_id);


CREATE INDEX "IX_patient_vitals_patient_id" ON patient_vitals (patient_id);


CREATE INDEX "IX_User_role" ON "User" (role);


