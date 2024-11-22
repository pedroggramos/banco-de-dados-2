CREATE TABLE Setor(
	codSetor CHAR(4) PRIMARY KEY,
	nome VARCHAR(50),
	localizacao VARCHAR(20)
);

CREATE TABLE Funcionario(
	codFunc CHAR(4) PRIMARY KEY,
	nome VARCHAR(50),
	salario DECIMAL(10,2),
	dataAdmissao DATE,
	codSetor CHAR(4),
	FOREIGN KEY(codSetor) REFERENCES Setor(codSetor)
);

CREATE TABLE Projeto(
	codProjeto CHAR(4) PRIMARY KEY,
	nome VARCHAR(40),
	totalHoras INT
);

CREATE TABLE TrabalhaEm(
	codFunc CHAR(4),
	codProjeto CHAR(4),
	dataInicio DATE,
	dataFim DATE,
	dedicacao INT,
	PRIMARY KEY(codFunc,codProjeto),
	FOREIGN KEY(codFunc) REFERENCES Funcionario(codFunc),
	FOREIGN KEY(codProjeto) REFERENCES Projeto(codProjeto)
);


INSERT INTO Setor(codSetor,nome,localizacao) VALUES
('S001','Recursos Humanos','4° Andar'),
('S002', 'Tesouraria', '3° Andar'),
('S003', 'TI', '2° Andar'),
('S004', 'Estoque', '3° Andar');

INSERT INTO Funcionario(codFunc, nome, salario, dataAdmissao, codSetor) VALUES
('F200', 'Gilmar Melo', '2500.00', '2010-01-01', 'S003'),
('F100', 'Priscila Marques', '2000.00', '2009-05-22', 'S004'),
('F150', 'Jéssica Pereira', '3000.00', '2008-08-14', 'S004'),
('F500', 'Felipe Marinho', '1500.00', '2008-10-10', 'S001'),
('F003', 'Patrícia Souza', '2500.00', '2006-02-05', 'S002');


