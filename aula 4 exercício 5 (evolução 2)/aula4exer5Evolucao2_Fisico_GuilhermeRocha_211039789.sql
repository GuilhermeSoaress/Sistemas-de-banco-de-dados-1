create database aula4exer5Evolucao2;

create table MEDICO (
    numeroCrm int(6) not null,
    estadoCrm char(2) not null,
    nomeCompleto varchar(50) not null,
    primary key(numeroCrm)
);

create table ESPECIALIDADE (
    nomeEspecialidade varchar(40) not null,
    idEspecialidade int(2) not null,
    primary key(idEspecialidade)
);

create table CONSULTA (
    idConsulta int(4) not null auto_increment,
    dataConsulta date not null,
    primary key(idConsulta)
);

create table MEDICAMENTO (
    nomeMedicamento varchar(40) not null,
    idMedicamento int(5) not null,
    primary key(idMedicamento)
);

create table PACIENTE (
    nomeCompleto varchar(50) not null,
    sexo enum('M', 'F', 'O') not null,
    dataNascimento date not null,
    idPaciente int(5) not null auto_increment,
    rua varchar(50) not null,
    numero int(4) not null,
    cep int(8) not null,
    cidade varchar(50) not null,
    primary key(idPaciente)
);

create table PARTICIPA (
    numeroCrm int(6) not null,
    idPaciente int(5) not null,
    idConsulta int(5) not null,
    primary key (numeroCrm, idPaciente, idConsulta),
    constraint PARTICIPA_MEDICO_FK FOREIGN KEY (numeroCrm) references MEDICO(numeroCrm),
    constraint PARTICIPA_PACIENTE_FK FOREIGN KEY (idPaciente) references PACIENTE (idPaciente),
    constraint PARTICIPA_CONSULTA_FK FOREIGN KEY (idConsulta) references CONSULTA (idConsulta)
);

create table POSSUI (
    numeroCrm int(6) not null,
    idEspecialidade int(3) not null,
    primary key (numeroCrm, idEspecialidade),
    constraint POSSUI_MEDICO_FK FOREIGN KEY (numeroCrm) references MEDICO (numeroCrm),
    constraint POSSUI_ESPECIALIDADE_FK FOREIGN KEY (idEspecialidade) references (idEspecialidade)
);

create table PRESCREVE (
    numeroCrm int(6) not null,
    idMedicamento int(5) not null,
    primary key (numeroCrm, idMedicamento),
    constraint PRESCREVE_MEDICO_FK FOREIGN KEY (numeroCrm) references MEDICO(numeroCrm),
    constraint PRESCREVE_MEDICAMENTO_FK FOREIGN KEY (idMedicamento) references MEDICAMENTO (idMedicamento)
);