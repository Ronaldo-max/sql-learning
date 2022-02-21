-- SELECIONA TUDO DA TABELA
SELECT * FROM aluno

-- SELECIONA CAMPOS DA TABELA
SELECT nome, responsavel FROM aluno

-- SELECIONA SOMENTE UM CAMPO COM ENDEREÇO ESPECÍFICO 
-- ( = ) SÓ SERVE PARA NÚMEROS
SELECT * FROM aluno WHERE matricula = 1

-- ( LIKE ) SERVE PARA O CAMPO DE TEXTO
-- SELECIONA TODOS OS NOMES QUE COMEÇÃO COM ( J ) TUDO DEPOIS NÃO IMPORTA ( % )
-- PODE SER ( %j ) OU ( J% ) E ( %j% )
SELECT * FROM aluno WHERE nome LIKE 'j%'

-- SELECIONA CAMPOS
SELECT matricula, cpf FROM aluno WHERE nome LIKE '%g%'

-- OPERADOR MAIOR QUE ( > ) E MENOR QUE ( < ) SÓ SERVE PARA NÚMERO
SELECT * FROM aluno WHERE matricula > 2

-- OPERADOR MAIOR OU IGUAL ( >= ) E MENOR OU IGUAL ( <= )
SELECT * FROM aluno WHERE matricula >= 2

-- OPERADOR NÃO IGUAL A ( <> )
SELECT * FROM aluno WHERE matricula <> 2

-- OPERADOR DIFERENTE DE ( != )
SELECT * FROM aluno WHERE matricula != 3

-- OPERADOR DE ADIÇAO ( + )
SELECT * FROM aluno WHERE matricula = 1 + 1

-- OPERADOR DE SUBTRAÇÃO ( - )
SELECT * FROM aluno WHERE matricula = 2 - 1

-- OPERADOR DE MULTIPLICAÇÃO ( * )
SELECT * FROM aluno WHERE matricula = 2 * 1

-- OPERADOR DE DIVISÃO ( / )
SELECT * FROM aluno WHERE matricula = 2 / 2

-- OPERADOR DE MODULO É O QUE SOBRA DA DIVISÃO ( % )
SELECT * FROM aluno WHERE matricula = 4 % 3

-- ( AND ) TEM A FUNÇÃO DE ( E )
SELECT * FROM aluno WHERE nome LIKE 'J%' AND matricula > 2

-- ( OR ) TEM A FUNÇÃO DE ( OU )
SELECT * FROM aluno WHERE matricula > 1 OR nome LIKE 'j%'

-- ( BETWEEN ) INTERVALO DE NÚMEROS
SELECT * FROM professor WHERE id_professor BETWEEN 2 AND 7

-- ( NOT BETWEEN ) IGNORA TODOS NO INTERVALO DE NÚMEROS
SELECT * FROM professor WHERE id_professor NOT BETWEEN 2 AND 7

-- ( IN ) TRAZ TODOS OS DADOS DE UMA DETERMINADA SEQUÊNCIA DE NÚMEROS
SELECT * FROM aluno WHERE matricula IN (1, 2, 4)

-- ( NOT IN ) CONTRÁRIO DO IN
SELECT * FROM aluno WHERE matricula NOT IN (1, 4)

-- ( IS NULL ) TODOS OS QUE SÃO NULL
SELECT * FROM aluno WHERE matricula IS NULL

-- ( IS NOT NULL ) TODOS OS QUE NÃO SÃO NULL
SELECT * FROM aluno WHERE matricula IS NOT NULL

-- ( INSERT INTO ) INSERIR DADOS
-- ( VALUES ) VALORES
INSERT INTO aluno(nome, cpf, responsavel) VALUES ('Maria Luiza', 987384838472, 'Wantuil soares')

-- ( UPDATE ) ATUALIZA OS VALORES
-- ( SET ) VALORES QUE ESTÃO SENDO PASSADOS
UPDATE aluno SET nome= 'Mariano Soares', responsavel='Marciel Soares' WHERE matricula= 2

-- ( DELETE ) APAGA REGISTROS DO BANCO DE DADOS
DELETE FROM aluno WHERE matricula = 4

-- ( JOIN ) TRAZ O CONTEÚDO DE DUAS TABELAS
SELECT * FROM funcionarios 
JOIN departamentos 
ON departamentos.id_dept = funcionarios.id_departamento
-- ( JOIN WHERE )
WHERE departamentos.id_dept = 2

-- ( JOIN ) ESPECIFICANDO CAMPOS
SELECT funcionarios.nome, funcionarios.cpf, departamentos.descricao
FROM funcionarios 
JOIN departamentos 
ON departamentos.id_dept = funcionarios.id_departamento

-- Alias ( AS ) diminui o tamanho do nome do campo
-- Alias SÓ FUNCIONA DENTRO DO - SELECT -
SELECT func.nome, func.cpf, dept.descricao
FROM funcionarios AS func
JOIN departamentos AS dept
ON dept.id_dept = func.id_departamento

-- Alias SERVE PARA MUDAR O NOME DO CAMPO
SELECT func.nome AS 'Nome', func.cpf AS 'CPF', dept.descricao AS 'Departamentos'
FROM funcionarios AS func
JOIN departamentos AS dept
ON dept.id_dept = func.id_departamento

-- TODO CONTEÚDO DA TABELA APAREÇA MESMO QUE NÃO TENHA RELACIONAMENTO NO JOIN
-- LEFT OUTER JOIN
-- PRIORIZA A TABELA DA ESQUERDA
-- DO LADO DO FROM
SELECT * FROM departamentos
LEFT OUTER JOIN funcionari
ON funcionarios.id_departamento = departamentos.id_dept

-- ORDENAR EM ORDEM CRESCENTE ( ORDER BY )
-- ORDENAR EM ORDEM DECRESCENTE ( DESC )
SELECT * FROM aluno
ORDER BY nome DESC

-- ( LIMIT ) LIMITA A QUANTIDADE DE CAMPOS QUE VAI BUSCAR
SELECT * FROM aluno LIMIT 2

-- IGNORA OS PRIMEIROS RESULTADOS ( OFFSET )
SELECT * FROM funcionarios LIMIT 4 OFFSET 4

-- ( COUNT ) CONTA A QUANTIDADE DE DADOS NOS CAMPOS
SELECT COUNT(id_departamento) FROM funcionarios

-- ( GROUP BY ) AGRUPA POR IGUAIS
SELECT COUNT(id_departamento) 
FROM funcionarios
GROUP BY id_departamento

-- GROUP BY, JOIN E COUNT
SELECT departamentos.descricao, COUNT(funcionarios.id_departamento)
FROM funcionarios
JOIN departamentos
ON funcionarios.id_departamento = departamentos.id_dept
GROUP BY departamentos.id_dept

-- ( HAVING ) SEMELHANTE AO ( WHERE ) MAS É USADO COM AGRUPAMENTOS
SELECT departamentos.descricao, COUNT(funcionarios.id_departamento)
FROM funcionarios
JOIN departamentos
ON funcionarios.id_departamento = departamentos.id_dept
GROUP BY departamentos.id_dept
HAVING COUNT(funcionarios.id_departamento) IN (2, 4)

-- CRIAR TABELAS
CREATE TABLE alunos (
  matricula INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT,
  cpf INTEGER UNIQUE,
  responsavel TEXT
)

CREATE TABLE professores (
  id_professor INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT,
  cpf INTEGER UNIQUE,
  materia TEXT
)

CREATE TABLE aulas (
  id_professor INTEGER,
  matricula INTEGER,
  FOREIGN KEY(id_professor) REFERENCES professores(id_professor),
  FOREIGN KEY(matricula) REFERENCES alunos(matricula)
)

-- ALTERAR NOME DA TABELA ( ALTER ) ( RENAME )
ALTER TABLE aluno RENAME TO alunos

ALTER TABLE professor RENAME TO professores

-- MUDAR NOME DO CAMPO DA COLUNA ( RENAME COLUMN )
ALTER TABLE aulas RENAME COLUMN id_aluno TO matricula_aluno

-- ( DROP ) TABLE APAGA TABELAS
DROP TABLE professores











