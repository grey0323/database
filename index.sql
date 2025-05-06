CREATE DATABASE SistemaEscolar;
USE SistemaEscolar;

-- Tabla de estudiantes
CREATE TABLE Estudiantes (
    id_estudiante INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    fecha_nacimiento DATE,
    id_direccion INT
);

-- Tabla de direcciones
CREATE TABLE Direcciones (
    id_direccion INT PRIMARY KEY,
    calle VARCHAR(255),
    ciudad VARCHAR(100),
    codigo_postal VARCHAR(10)
);

-- Tabla de curso
CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY ,
    nombre_curso VARCHAR(100),
    id_departamento INT
);

-- Tabla de profesores
CREATE TABLE Profesores (
    id_profesor INT PRIMARY KEY ,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    id_departamento INT
);

-- Tabla de departamento
CREATE TABLE Departamentos (
    id_departamento INT PRIMARY KEY ,
    nombre_departamento VARCHAR(100)
);

-- Tabla de matrículas
CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY ,
    id_estudiante INT,
    id_curso INT,
    fecha_matricula DATE
);

-- Definición de claves foráneas
ALTER TABLE Estudiantes ADD CONSTRAINT fk_estudiante_direccion FOREIGN KEY (id_direccion) REFERENCES Direcciones(id_direccion);
ALTER TABLE Cursos ADD CONSTRAINT fk_curso_departamento FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento);
ALTER TABLE Profesores ADD CONSTRAINT fk_profesor_departamento FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento);
ALTER TABLE Matriculas ADD CONSTRAINT fk_matricula_estudiante FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante);
ALTER TABLE Matriculas ADD CONSTRAINT fk_matricula_curso FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso);
