using System;
using System.Collections.Generic;
using Core.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Postgres.Scaffolding;

public partial class MyDbContext : DbContext
{
    public MyDbContext(DbContextOptions<MyDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Appointment> Appointments { get; set; }

    public virtual DbSet<ChatRoom> ChatRooms { get; set; }

    public virtual DbSet<Clinic> Clinics { get; set; }

    public virtual DbSet<ClinicDoctor> ClinicDoctors { get; set; }

    public virtual DbSet<ClinicPatient> ClinicPatients { get; set; }

    public virtual DbSet<Diagnosis> Diagnoses { get; set; }

    public virtual DbSet<Doctor> Doctors { get; set; }

    public virtual DbSet<DoctorAvailability> DoctorAvailabilities { get; set; }

    public virtual DbSet<Message> Messages { get; set; }

    public virtual DbSet<Patient> Patients { get; set; }

    public virtual DbSet<PatientVital> PatientVitals { get; set; }

    public virtual DbSet<Rndom> Rndoms { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Appointment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("appointments_pkey");

            entity.ToTable("appointments");

            entity.HasIndex(e => e.DoctorId, "IX_appointments_doctor_id");

            entity.HasIndex(e => e.PatientId, "IX_appointments_patient_id");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CreatedAt)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("created_at");
            entity.Property(e => e.DoctorId).HasColumnName("doctor_id");
            entity.Property(e => e.EndTime).HasColumnName("end_time");
            entity.Property(e => e.Notes).HasColumnName("notes");
            entity.Property(e => e.PatientId).HasColumnName("patient_id");
            entity.Property(e => e.StartTime).HasColumnName("start_time");
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .HasColumnName("status");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("updated_at");

            entity.HasOne(d => d.Doctor).WithMany(p => p.Appointments)
                .HasForeignKey(d => d.DoctorId)
                .HasConstraintName("fk_doctor");

            entity.HasOne(d => d.Patient).WithMany(p => p.Appointments)
                .HasForeignKey(d => d.PatientId)
                .HasConstraintName("fk_patient");
        });

        modelBuilder.Entity<ChatRoom>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("chat_rooms_pkey");

            entity.ToTable("chat_rooms");

            entity.HasIndex(e => e.DoctorId, "IX_chat_rooms_doctor_id");

            entity.HasIndex(e => e.PatientId, "IX_chat_rooms_patient_id");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("created_at");
            entity.Property(e => e.DoctorId).HasColumnName("doctor_id");
            entity.Property(e => e.EndTime).HasColumnName("end_time");
            entity.Property(e => e.IsFinished).HasColumnName("is_finished");
            entity.Property(e => e.PatientId).HasColumnName("patient_id");
            entity.Property(e => e.StartTime).HasColumnName("start_time");
            entity.Property(e => e.Topic).HasColumnName("topic");

            entity.HasOne(d => d.Doctor).WithMany(p => p.ChatRooms)
                .HasForeignKey(d => d.DoctorId)
                .HasConstraintName("chat_rooms_doctor_id_fkey");

            entity.HasOne(d => d.Patient).WithMany(p => p.ChatRooms)
                .HasForeignKey(d => d.PatientId)
                .HasConstraintName("chat_rooms_patient_id_fkey");
        });

        modelBuilder.Entity<Clinic>(entity =>
        {
            entity.HasKey(e => e.Idclinic).HasName("clinic_pk");

            entity.ToTable("clinic");

            entity.Property(e => e.Idclinic).HasColumnName("idclinic");
            entity.Property(e => e.Address).HasColumnName("address");
            entity.Property(e => e.Clinicname).HasColumnName("clinicname");
            entity.Property(e => e.Phonenumber).HasColumnName("phonenumber");
            entity.Property(e => e.Type).HasColumnName("type");
        });

        modelBuilder.Entity<ClinicDoctor>(entity =>
        {
            entity.HasKey(e => e.Idclinicdoctor).HasName("clinic_doctor_pk");

            entity.ToTable("clinic_doctor");

            entity.HasIndex(e => e.Idclinic, "IX_clinic_doctor_idclinic");

            entity.HasIndex(e => e.Iddoctor, "IX_clinic_doctor_iddoctor");

            entity.Property(e => e.Idclinicdoctor).HasColumnName("idclinicdoctor");
            entity.Property(e => e.Idclinic).HasColumnName("idclinic");
            entity.Property(e => e.Iddoctor).HasColumnName("iddoctor");

            entity.HasOne(d => d.IdclinicNavigation).WithMany(p => p.ClinicDoctors)
                .HasForeignKey(d => d.Idclinic)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("clinic_doctor_clinic_idclinic_fk");

            entity.HasOne(d => d.IddoctorNavigation).WithMany(p => p.ClinicDoctors)
                .HasForeignKey(d => d.Iddoctor)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("clinic_doctor_doctors_doctorid_fk");
        });

        modelBuilder.Entity<ClinicPatient>(entity =>
        {
            entity.HasKey(e => e.Idclinicpatient).HasName("clinic_patient_pk");

            entity.ToTable("clinic_patient");

            entity.HasIndex(e => e.Idclinic, "IX_clinic_patient_idclinic");

            entity.HasIndex(e => e.Idpatient, "IX_clinic_patient_idpatient");

            entity.Property(e => e.Idclinicpatient).HasColumnName("idclinicpatient");
            entity.Property(e => e.Idclinic).HasColumnName("idclinic");
            entity.Property(e => e.Idpatient).HasColumnName("idpatient");

            entity.HasOne(d => d.IdclinicNavigation).WithMany(p => p.ClinicPatients)
                .HasForeignKey(d => d.Idclinic)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("clinic_patient_clinic_idclinic_fk");

            entity.HasOne(d => d.IdpatientNavigation).WithMany(p => p.ClinicPatients)
                .HasForeignKey(d => d.Idpatient)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("clinic_patient_patients_userid_fk");
        });

        modelBuilder.Entity<Diagnosis>(entity =>
        {
            entity.HasKey(e => e.Iddiagnoses).HasName("diagnoses_pk");

            entity.ToTable("diagnoses");

            entity.HasIndex(e => e.Iddoctor, "IX_diagnoses_iddoctor");

            entity.HasIndex(e => e.Idpatient, "IX_diagnoses_idpatient");

            entity.Property(e => e.Iddiagnoses)
                .HasColumnType("character varying")
                .HasColumnName("iddiagnoses");
            entity.Property(e => e.Date).HasColumnName("date");
            entity.Property(e => e.Diagnoses)
                .HasColumnType("character varying")
                .HasColumnName("diagnoses");
            entity.Property(e => e.Iddoctor).HasColumnName("iddoctor");
            entity.Property(e => e.Idpatient)
                .HasColumnType("character varying")
                .HasColumnName("idpatient");
            entity.Property(e => e.Treatment).HasColumnName("treatment");

            entity.HasOne(d => d.IddoctorNavigation).WithMany(p => p.Diagnoses)
                .HasForeignKey(d => d.Iddoctor)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("diagnoses_doctors_doctorid_fk");

            entity.HasOne(d => d.IdpatientNavigation).WithMany(p => p.Diagnoses)
                .HasForeignKey(d => d.Idpatient)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("diagnoses_user_iduser_fk");
        });

        modelBuilder.Entity<Doctor>(entity =>
        {
            entity.HasKey(e => e.Doctorid).HasName("doctors_pk");

            entity.ToTable("doctors");

            entity.Property(e => e.Doctorid).HasColumnName("doctorid");
            entity.Property(e => e.Age).HasColumnName("age");
            entity.Property(e => e.Gender).HasColumnName("gender");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.Specialty).HasColumnName("specialty");
            entity.Property(e => e.Surname).HasColumnName("surname");

            entity.HasOne(d => d.DoctorNavigation).WithOne(p => p.Doctor)
                .HasForeignKey<Doctor>(d => d.Doctorid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("doctors_user_iduser_fk");

            entity.HasMany(d => d.Patients).WithMany(p => p.Doctors)
                .UsingEntity<Dictionary<string, object>>(
                    "DoctorPatient",
                    r => r.HasOne<Patient>().WithMany()
                        .HasForeignKey("PatientId")
                        .HasConstraintName("doctor_patient_patient_id_fkey"),
                    l => l.HasOne<Doctor>().WithMany()
                        .HasForeignKey("DoctorId")
                        .HasConstraintName("doctor_patient_doctor_id_fkey"),
                    j =>
                    {
                        j.HasKey("DoctorId", "PatientId").HasName("doctor_patient_pkey");
                        j.ToTable("doctor_patient");
                        j.HasIndex(new[] { "PatientId" }, "IX_doctor_patient_patient_id");
                        j.IndexerProperty<string>("DoctorId").HasColumnName("doctor_id");
                        j.IndexerProperty<string>("PatientId").HasColumnName("patient_id");
                    });
        });

        modelBuilder.Entity<DoctorAvailability>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("doctor_availability_pkey");

            entity.ToTable("doctor_availability");

            entity.HasIndex(e => e.DoctorId, "IX_doctor_availability_doctor_id");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("created_at");
            entity.Property(e => e.DateOverride).HasColumnName("date_override");
            entity.Property(e => e.DayOfWeek).HasColumnName("day_of_week");
            entity.Property(e => e.DoctorId).HasColumnName("doctor_id");
            entity.Property(e => e.EndTime).HasColumnName("end_time");
            entity.Property(e => e.StartTime).HasColumnName("start_time");
            entity.Property(e => e.Type)
                .HasMaxLength(20)
                .HasDefaultValueSql("'default'::character varying")
                .HasColumnName("type");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("updated_at");

            entity.HasOne(d => d.Doctor).WithMany(p => p.DoctorAvailabilities)
                .HasForeignKey(d => d.DoctorId)
                .HasConstraintName("fk_doctor");
        });

        modelBuilder.Entity<Message>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("messages_pkey");

            entity.ToTable("messages");

            entity.HasIndex(e => e.RoomId, "IX_messages_room_id");

            entity.HasIndex(e => e.SenderId, "IX_messages_sender_id");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Content).HasColumnName("content");
            entity.Property(e => e.IsRead)
                .HasDefaultValue(false)
                .HasColumnName("is_read");
            entity.Property(e => e.RoomId).HasColumnName("room_id");
            entity.Property(e => e.SenderId).HasColumnName("sender_id");
            entity.Property(e => e.SenderName).HasColumnName("sender_name");
            entity.Property(e => e.SentAt)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("sent_at");

            entity.HasOne(d => d.Room).WithMany(p => p.Messages)
                .HasForeignKey(d => d.RoomId)
                .HasConstraintName("messages_room_id_fkey");

            entity.HasOne(d => d.Sender).WithMany(p => p.Messages)
                .HasForeignKey(d => d.SenderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("messages_sender_id_fkey");
        });

        modelBuilder.Entity<Patient>(entity =>
        {
            entity.HasKey(e => e.Userid).HasName("patients_pk");

            entity.ToTable("patients");

            entity.Property(e => e.Userid).HasColumnName("userid");
            entity.Property(e => e.Address).HasColumnName("address");
            entity.Property(e => e.Age).HasColumnName("age");
            entity.Property(e => e.Allergies).HasColumnName("allergies");
            entity.Property(e => e.Bloodtype).HasColumnName("bloodtype");
            entity.Property(e => e.DeviceId).HasColumnName("device_id");
            entity.Property(e => e.Gender).HasColumnName("gender");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.Phonenumber).HasColumnName("phonenumber");
            entity.Property(e => e.Surname).HasColumnName("surname");

            entity.HasOne(d => d.User).WithOne(p => p.Patient)
                .HasForeignKey<Patient>(d => d.Userid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("patients_user_iduser_fk");
        });

        modelBuilder.Entity<PatientVital>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("patient_vitals_pkey");

            entity.ToTable("patient_vitals");

            entity.HasIndex(e => e.PatientId, "IX_patient_vitals_patient_id");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.BodyTemperature)
                .HasPrecision(4, 2)
                .HasColumnName("body_temperature");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("now()")
                .HasColumnName("created_at");
            entity.Property(e => e.EcgSummary)
                .HasColumnType("jsonb")
                .HasColumnName("ecg_summary");
            entity.Property(e => e.HeartRate).HasColumnName("heart_rate");
            entity.Property(e => e.OxygenLevel)
                .HasPrecision(5, 2)
                .HasColumnName("oxygen_level");
            entity.Property(e => e.PatientId).HasColumnName("patient_id");

            entity.HasOne(d => d.Patient).WithMany(p => p.PatientVitals)
                .HasForeignKey(d => d.PatientId)
                .HasConstraintName("fk_patient");
        });

        modelBuilder.Entity<Rndom>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("rndom");

            entity.Property(e => e.ColumnName).HasColumnName("column_name");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.Idroles).HasName("roles_pk");

            entity.ToTable("roles");

            entity.Property(e => e.Idroles).HasColumnName("idroles");
            entity.Property(e => e.Namerole).HasColumnName("namerole");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Iduser).HasName("user_pk");

            entity.ToTable("User");

            entity.HasIndex(e => e.Role, "IX_User_role");

            entity.Property(e => e.Iduser).HasColumnName("iduser");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.Hash).HasColumnName("hash");
            entity.Property(e => e.Role).HasColumnName("role");
            entity.Property(e => e.Salt).HasColumnName("salt");

            entity.HasOne(d => d.RoleNavigation).WithMany(p => p.Users)
                .HasForeignKey(d => d.Role)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("user_roles_idroles_fk");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
