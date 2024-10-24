---EX01
CREATE TABLE aluno(
matricula INTEGER PRIMARY KEY,
nomealuno VARCHAR(30) NOT NULL,
sexo CHAR(1),
dtnascimento DATE
);

--EX02
CREATE TABLE departamento(
codepto INTEGER PRIMARY KEY,
nomedepto VARCHAR(30) NOT NULL
);

---EX03
CREATE TABLE curso(
codcurso INTEGER PRIMARY KEY,
nomecurso VARCHAR(30) NOT NULL,
ch INTEGER,
preco REAL,
codepto INTEGER,
FOREIGN KEY (codepto) REFERENCES departamento (codepto)
);

---EX04
CREATE TABLE matricula(
matricula INTEGER,
codcurso INTEGER,
dtmatricula DATE,
PRIMARY KEY (matricula,codcurso),
FOREIGN KEY (matricula) REFERENCES aluno(matricula),
FOREIGN KEY (codcurso) REFERENCES curso(codcurso)
);

/*---EX04 B
CREATE TABLE matricula(
codmatricula SERIAL PRIMARY KEY,
matricula INTEGER,
codcurso INTEGER,
dtmatricula DATE,
FOREIGN KEY (matricula) REFERENCES aluno(matricula),
FOREIGN KEY (codcurso) REFERENCES curso(codcurso)
);
*/

---EX05
CREATE TABLE func(
codfunc INTEGER PRIMARY KEY,
nomefunc VARCHAR(20),
city VARCHAR(20),
cbo INTEGER,
uf CHAR(2),
codepto INTEGER,
FOREIGN KEY (codepto) REFERENCES departamento (codepto)
);

---EX06
ALTER TABLE func RENAME COLUMN city TO cidade;

---EX07
ALTER TABLE func ADD COLUMN sexo CHAR(1);

---EX08
ALTER TABLE func ALTER COLUMN nomefunc TYPE VARCHAR(30);

---EX09
ALTER TABLE func DROP COLUMN cbo;

---EX10
ALTER TABLE func ALTER COLUMN uf SET DEFAULT 'RJ';

---EX11
ALTER TABLE func RENAME TO funcionario;

---EX12
ALTER TABLE funcionario ALTER COLUMN nomefunc SET NOT NULL;

---EX13
CREATE SEQUENCE proxfunc;
ALTER TABLE funcionario 
ALTER COLUMN codfunc SET DEFAULT NEXTVAL('proxfunc');

