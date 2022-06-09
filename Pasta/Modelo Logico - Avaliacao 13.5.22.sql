/* Modelo Logico - Avaliacao 13.5.22: */

CREATE TABLE Paciente (
    cod_paciente numeric(6) PRIMARY KEY,
    Data_Nasc date,
    nome_pac varchar(60)
);

CREATE TABLE Medico (
    crm numeric(10) PRIMARY KEY,
    nome_medico varchar(60)
);

CREATE TABLE consulta (
    cod_cons numeric(6) PRIMARY KEY,
    data_consulta date,
    hora_consulta time,
    fk_cod_paciente numeric(6),
    fk_crm numeric(10)
);

CREATE TABLE Receita (
    cod_rec numeric(6) PRIMARY KEY,
    dt_emissao date,
    instrucoes varchar(100),
    periodo_validade numeric(10),
    dose varchar(50),
    fk_cod_cons numeric(6)
);

CREATE TABLE Medicamento (
    cod_medicamento numeric(8) PRIMARY KEY,
    nome_medicamento varchar(100)
);

CREATE TABLE Receita_Medicamento (
    fk_cod_medicamento numeric(8),
    fk_cod_rec numeric(6),
    PRIMARY KEY (fk_cod_medicamento, fk_cod_rec)
);
 
ALTER TABLE consulta ADD CONSTRAINT FK_consulta_2
    FOREIGN KEY (fk_cod_paciente)
    REFERENCES Paciente (cod_paciente);
 
ALTER TABLE consulta ADD CONSTRAINT FK_consulta_3
    FOREIGN KEY (fk_crm)
    REFERENCES Medico (crm);
 
ALTER TABLE Receita ADD CONSTRAINT FK_Receita_2
    FOREIGN KEY (fk_cod_cons)
    REFERENCES consulta (cod_cons)
    ON DELETE CASCADE;
 
ALTER TABLE Receita_Medicamento ADD CONSTRAINT FK_Receita_Medicamento_1
    FOREIGN KEY (fk_cod_medicamento)
    REFERENCES Medicamento (cod_medicamento)
    ON DELETE RESTRICT;
 
ALTER TABLE Receita_Medicamento ADD CONSTRAINT FK_Receita_Medicamento_2
    FOREIGN KEY (fk_cod_rec)
    REFERENCES Receita (cod_rec)
    ON DELETE SET NULL;