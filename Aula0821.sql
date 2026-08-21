/*DROP TABLE IF EXISTS alocacao;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS projeto;
DROP TABLE IF EXISTS departamento;
*/
CREATE TABLE departamento (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE funcionario (
    codigo INT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    cargo VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL CHECK (salario > 0),
    data_contratacao DATE NOT NULL,
    data_nascimento DATE,
    situacao VARCHAR(20) NOT NULL DEFAULT 'ATIVO'
        CHECK (situacao IN ('ATIVO', 'FERIAS', 'AFASTADO', 'DESLIGADO')),
    departamento_id INT NOT NULL,
    CONSTRAINT fk_funcionario_departamento
        FOREIGN KEY (departamento_id)
        REFERENCES departamento(id),
    CONSTRAINT confere_data CHECK (data_contratacao <= CURRENT_DATE)
);

CREATE TABLE projeto (
    codigo INT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    orcamento DECIMAL(12,2) NOT NULL CHECK (orcamento > 0),
    data_inicio DATE NOT NULL,
    data_prevista_termino DATE NOT NULL,
    data_efetiva_termino DATE,
    situacao VARCHAR(20) NOT NULL DEFAULT 'PLANEJADO'
        CHECK (situacao IN ('PLANEJADO', 'EM_ANDAMENTO', 'CONCLUIDO', 'CANCELADO')),
    prioridade VARCHAR(20) NOT NULL DEFAULT 'MEDIA'
        CHECK (prioridade IN ('BAIXA', 'MEDIA', 'ALTA', 'CRITICA')),
    CONSTRAINT confere_data_projeto CHECK (data_prevista_termino >= data_inicio)
);

CREATE TABLE alocacao (
    funcionario_id INT NOT NULL,
    projeto_id INT NOT NULL,
    data_alocacao DATE NOT NULL,
    data_saida DATE,
    funcao VARCHAR(100) NOT NULL,
    percentual_dedicacao DECIMAL(5,2),
    CONSTRAINT pk_alocacao
        PRIMARY KEY (funcionario_id, projeto_id, funcao),
    CONSTRAINT fk_alocacao_funcionario
        FOREIGN KEY (funcionario_id)
        REFERENCES funcionario(codigo),
    CONSTRAINT fk_alocacao_projeto
        FOREIGN KEY (projeto_id)
        REFERENCES projeto(codigo),
    CONSTRAINT ck_percentual_dedicacao
        CHECK (percentual_dedicacao >= 0 AND percentual_dedicacao <= 100),
    CONSTRAINT confere_datas_alocacao
        CHECK (data_saida IS NULL OR data_saida >= data_alocacao)
);


-- DEPARTAMENTOS

INSERT INTO departamento (id, nome)
VALUES (1, 'Tecnologia da Informação');

INSERT INTO departamento (id, nome)
VALUES (2, 'Recursos Humanos');

INSERT INTO departamento (id, nome)
VALUES (3, 'Marketing');

INSERT INTO departamento (id, nome)
VALUES (4, 'Desenvolvimento');


-- FUNCIONÁRIOS

INSERT INTO funcionario (codigo, nome, cpf, email, cargo, salario, data_contratacao, data_nascimento, situacao, departamento_id)
VALUES (1, 'Josenildo Bezerra', '123.456.789-01', 'josenildo@empresa.com', 'Desenvolvedor Java', 5800.00, '2023-02-15', '1998-07-12', 'ATIVO', 1);

INSERT INTO funcionario (codigo, nome, cpf, email, cargo, salario, data_contratacao, data_nascimento, situacao, departamento_id)
VALUES (2, 'Genivaldo Araújo', '123.456.789-02', 'genivaldo@empresa.com', 'Analista de Sistemas', 6200.00, '2022-08-20', '1995-03-25', 'ATIVO', 1);

INSERT INTO funcionario (codigo, nome, cpf, email, cargo, salario, data_contratacao, data_nascimento, situacao, departamento_id)
VALUES (3, 'Ubirajara Gomes', '123.456.789-03', 'ubirajara@empresa.com', 'Gerente de Projetos', 8500.00, '2021-05-10', '1989-11-08', 'ATIVO', 4);

INSERT INTO funcionario (codigo, nome, cpf, email, cargo, salario, data_contratacao, data_nascimento, situacao, departamento_id)
VALUES (4, 'Ednalva Cavalcante', '123.456.789-04', 'ednalva@empresa.com', 'Analista de RH', 4800.00, '2024-01-12', '1997-09-17', 'FERIAS', 2);

INSERT INTO funcionario (codigo, nome, cpf, email, cargo, salario, data_contratacao, data_nascimento, situacao, departamento_id)
VALUES (5, 'Raimundo Nonato', '123.456.789-05', 'raimundo@empresa.com', 'Analista de Marketing', 5100.00, '2023-09-05', '1992-04-30', 'ATIVO', 3);

INSERT INTO funcionario (codigo, nome, cpf, email, cargo, salario, data_contratacao, data_nascimento, situacao, departamento_id)
VALUES (6, 'Lindalva Dantas', '123.456.789-06', 'lindalva@empresa.com', 'Desenvolvedora Front-end', 5600.00, '2025-03-18', '2000-12-05', 'ATIVO', 4);


-- PROJETOS

INSERT INTO projeto (codigo, nome, descricao, orcamento, data_inicio, data_prevista_termino, data_efetiva_termino, situacao, prioridade)
VALUES (1, 'Sistema de Vendas', 'Desenvolvimento de um sistema para controle de vendas', 150000.00, '2026-01-10', '2026-06-30', '2026-06-25', 'CONCLUIDO', 'ALTA');

INSERT INTO projeto (codigo, nome, descricao, orcamento, data_inicio, data_prevista_termino, data_efetiva_termino, situacao, prioridade)
VALUES (2, 'Aplicativo da Empresa', 'Desenvolvimento de aplicativo para clientes', 95000.00, '2026-04-01', '2026-10-30', NULL, 'EM_ANDAMENTO', 'CRITICA');

INSERT INTO projeto (codigo, nome, descricao, orcamento, data_inicio, data_prevista_termino, data_efetiva_termino, situacao, prioridade)
VALUES (3, 'Portal da Empresa', 'Desenvolvimento do novo portal institucional', 70000.00, '2026-05-15', '2026-11-20', NULL, 'EM_ANDAMENTO', 'MEDIA');

INSERT INTO projeto (codigo, nome, descricao, orcamento, data_inicio, data_prevista_termino, data_efetiva_termino, situacao, prioridade)
VALUES (4, 'Sistema de Recursos Humanos', 'Sistema para controle de funcionários', 85000.00, '2026-09-01', '2027-02-28', NULL, 'PLANEJADO', 'MEDIA');

INSERT INTO projeto (codigo, nome, descricao, orcamento, data_inicio, data_prevista_termino, data_efetiva_termino, situacao, prioridade)
VALUES (5, 'Campanha de Marketing', 'Sistema para gerenciamento de campanhas de marketing', 45000.00, '2026-02-01', '2026-05-30', '2026-05-10', 'CANCELADO', 'BAIXA');


-- ALOCAÇÕES

INSERT INTO alocacao (funcionario_id, projeto_id, data_alocacao, data_saida, funcao, percentual_dedicacao)
VALUES (1, 1, '2026-01-10', '2026-06-25', 'Desenvolvedor Backend', 70.00);

INSERT INTO alocacao (funcionario_id, projeto_id, data_alocacao, data_saida, funcao, percentual_dedicacao)
VALUES (2, 1, '2026-01-10', '2026-06-25', 'Analista de Sistemas', 50.00);

INSERT INTO alocacao (funcionario_id, projeto_id, data_alocacao, data_saida, funcao, percentual_dedicacao)
VALUES (3, 1, '2026-01-10', '2026-06-25', 'Gerente de Projeto', 30.00);

INSERT INTO alocacao (funcionario_id, projeto_id, data_alocacao, data_saida, funcao, percentual_dedicacao)
VALUES (1, 2, '2026-04-01', NULL, 'Desenvolvedor Backend', 80.00);

INSERT INTO alocacao (funcionario_id, projeto_id, data_alocacao, data_saida, funcao, percentual_dedicacao)
VALUES (2, 2, '2026-04-01', NULL, 'Analista de Sistemas', 60.00);

INSERT INTO alocacao (funcionario_id, projeto_id, data_alocacao, data_saida, funcao, percentual_dedicacao)
VALUES (3, 2, '2026-04-01', NULL, 'Gerente de Projeto', 20.00);

INSERT INTO alocacao (funcionario_id, projeto_id, data_alocacao, data_saida, funcao, percentual_dedicacao)
VALUES (6, 2, '2026-04-15', NULL, 'Desenvolvedora Front-end', 70.00);

INSERT INTO alocacao (funcionario_id, projeto_id, data_alocacao, data_saida, funcao, percentual_dedicacao)
VALUES (5, 3, '2026-05-15', NULL, 'Analista de Marketing', 80.00);

INSERT INTO alocacao (funcionario_id, projeto_id, data_alocacao, data_saida, funcao, percentual_dedicacao)
VALUES (6, 3, '2026-05-15', NULL, 'Desenvolvedora Front-end', 60.00);

INSERT INTO alocacao (funcionario_id, projeto_id, data_alocacao, data_saida, funcao, percentual_dedicacao)
VALUES (4, 4, '2026-09-01', NULL, 'Analista de RH', 100.00);

INSERT INTO alocacao (funcionario_id, projeto_id, data_alocacao, data_saida, funcao, percentual_dedicacao)
VALUES (3, 4, '2026-09-01', NULL, 'Gerente de Projeto', 20.00);

INSERT INTO alocacao (funcionario_id, projeto_id, data_alocacao, data_saida, funcao, percentual_dedicacao)
VALUES (5, 5, '2026-02-01', '2026-05-10', 'Analista de Marketing', 50.00);

SELECT * FROM departamento;

SELECT * FROM funcionario;

SELECT * FROM projeto;

SELECT * FROM alocacao;
-----------------------------------------------------

--testando comandos

select * from Funcionario ORDER BY nome

select nome,data_nascimento, current_date,(current_date-data_nascimento) from Funcionario;
select nome,data_nascimento,  EXTRACT(YEAR FROM AGE(current_date, data_nascimento)) AS idade,AGE(current_date, data_nascimento) from Funcionario;