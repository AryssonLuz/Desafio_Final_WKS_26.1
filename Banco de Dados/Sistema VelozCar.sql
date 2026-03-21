CREATE DATABASE velozcar;
USE velozcar;

/* brModelo: */

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(150),
    data_cadastro DATE,
    status_cliente VARCHAR(20)
);
/* brModelo: */

CREATE TABLE Veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50),
    marca VARCHAR(50),
    cor VARCHAR(30),
    ano INT,
    valor_diaria DECIMAL(10,2),
    status_veiculo VARCHAR(20)
);

/* brModelo: */

CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    data_admissao DATE
);
/* brModelo: */

CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_aluguel INT UNIQUE,
    valor DECIMAL(10,2),
    data_pagamento DATE,
    metodo VARCHAR(20),
    status_pagamento VARCHAR(20),
    desconto DECIMAL(10,2),
    multa DECIMAL(10,2),
    
    FOREIGN KEY (id_aluguel) REFERENCES Aluguel(id_aluguel)
);
/* brModelo: */

CREATE TABLE Manutenção (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT,
    descricao VARCHAR(200),
    custo DECIMAL(10,2),
    data_manutencao DATE,
    responsavel VARCHAR(100),
    tipo VARCHAR(50),
    status_manutencao VARCHAR(20),
    
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);
/* brModelo: */

CREATE TABLE Aluguel (
    id_aluguel INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_funcionario INT,
    id_veiculo INT,
    data_inicio DATE,
    data_fim DATE,
    valor_total DECIMAL(10,2),
    status_aluguel VARCHAR(20),
    
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario),
	FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

INSERT INTO Cliente (nome, cpf, email, telefone, endereco, data_cadastro, status_cliente) VALUES
('Ana Beatriz Costa','123.456.789-01','ana.costa@email.com','81991234567','Recife - PE','2023-11-10','ativo'),
('Bruno Henrique Lima','987.654.321-02','bruno.lima@email.com','81992345678','Olinda - PE','2024-01-05','ativo'),
('Carlos Eduardo Souza','456.789.123-03','carlos.souza@email.com','81993456789','João Pessoa - PB','2024-02-12','inativo'),
('Daniela Martins Alves','789.123.456-04','daniela.alves@email.com','81994567890','Goiana - PE','2024-03-01','ativo'),
('Eduardo Ramos Silva','321.654.987-05','eduardo.silva@email.com','81995678901','Paulista - PE','2023-12-20','ativo'),
('Fernanda Oliveira','654.987.321-06','fernanda@email.com','81996789012','Recife - PE','2024-02-28','bloqueado'),
('Gabriel Mendes Rocha','159.753.486-07','gabriel@email.com','81997890123','Igarassu - PE','2024-01-15','ativo'),
('Helena Barros','753.159.486-08','helena@email.com','81998901234','Caruaru - PE','2024-03-10','ativo'),
('Igor Nascimento','852.741.963-09','igor@email.com','81999012345','Abreu e Lima - PE','2023-10-30','inativo'),
('Juliana Freitas','951.357.852-10','juliana@email.com','81990123456','Recife - PE','2024-02-01','ativo');

INSERT INTO Funcionario (nome, cpf, email, telefone, cargo, salario, data_admissao) VALUES
('Marcos Paulo','111.222.333-01','marcos@email.com','81991111111','Atendente',2200,'2022-05-10'),
('Patricia Gomes','111.222.333-02','patricia@email.com','81992222222','Gerente',4500,'2021-03-15'),
('Ricardo Alves','111.222.333-03','ricardo@email.com','81993333333','Supervisor',3200,'2023-07-01'),
('Sandra Melo','111.222.333-04','sandra@email.com','81994444444','Atendente',2100,'2024-01-10'),
('Thiago Costa','111.222.333-05','thiago@email.com','81995555555','Atendente',2000,'2023-09-20'),
('Vanessa Lima','111.222.333-06','vanessa@email.com','81996666666','Financeiro',3000,'2022-11-11'),
('Wesley Santos','111.222.333-07','wesley@email.com','81997777777','Atendente',2100,'2024-02-05'),
('Yara Souza','111.222.333-08','yara@email.com','81998888888','Gerente',4700,'2020-08-18'),
('Zeca Ferreira','111.222.333-09','zeca@email.com','81999999999','Supervisor',3300,'2023-04-22'),
('Larissa Nogueira','111.222.333-10','larissa@email.com','81990000000','Atendente',2000,'2024-03-01');

INSERT INTO Veiculo (placa, modelo, marca, cor, ano, valor_diaria, status_veiculo) VALUES
('QWE1A23','Onix','Chevrolet','Preto',2020,100,'disponivel'),
('RTY2B34','HB20','Hyundai','Branco',2021,120,'alugado'),
('UIO3C45','Gol','Volkswagen','Prata',2018,80,'disponivel'),
('PAS4D56','Civic','Honda','Preto',2022,220,'disponivel'),
('DFG5E67','Corolla','Toyota','Branco',2021,200,'manutencao'),
('HJK6F78','Uno','Fiat','Vermelho',2017,70,'disponivel'),
('LZX7G89','Compass','Jeep','Cinza',2023,280,'alugado'),
('CVB8H90','Renegade','Jeep','Preto',2022,250,'disponivel'),
('BNM9I01','Kwid','Renault','Branco',2020,75,'disponivel'),
('GHJ0J12','Toro','Fiat','Vermelho',2021,210,'manutencao');

INSERT INTO Aluguel (id_cliente, id_funcionario, id_veiculo, data_inicio, data_fim, valor_total, status_aluguel) VALUES
(1,1,2,'2024-02-01','2024-02-05',480,'finalizado'),
(2,2,7,'2024-02-03','2024-02-08',1400,'ativo'),
(3,3,3,'2024-01-10','2024-01-15',400,'finalizado'),
(4,4,1,'2024-03-01','2024-03-05',500,'ativo'),
(5,5,4,'2024-02-20','2024-02-25',1100,'finalizado'),
(6,6,6,'2024-02-15','2024-02-18',210,'cancelado'),
(7,7,8,'2024-03-05','2024-03-10',1250,'ativo'),
(8,8,9,'2024-03-02','2024-03-06',300,'finalizado'),
(9,9,1,'2024-01-25','2024-01-30',500,'finalizado'),
(10,10,2,'2024-03-10','2024-03-15',600,'ativo');

INSERT INTO Pagamento (id_aluguel, valor, data_pagamento, metodo, status_pagamento, desconto, multa) VALUES
(1,480,'2024-02-05','pix','concluido',0,0),
(2,1400,'2024-02-08','cartao','pendente',100,0),
(3,400,'2024-01-15','boleto','concluido',0,0),
(4,500,'2024-03-05','pix','pendente',0,50),
(5,1100,'2024-02-25','cartao','concluido',50,0),
(6,210,'2024-02-18','pix','cancelado',0,0),
(7,1250,'2024-03-10','boleto','pendente',0,100),
(8,300,'2024-03-06','pix','concluido',0,0),
(9,500,'2024-01-30','cartao','concluido',20,0),
(10,600,'2024-03-15','pix','pendente',0,0);

INSERT INTO Manutenção (id_veiculo, descricao, custo, data_manutencao, responsavel, tipo, status_manutencao) VALUES
(5,'Troca de óleo',200,'2024-01-10','Oficina Central','preventiva','finalizado'),
(10,'Reparo no motor',1200,'2024-02-01','Auto Mecânica Silva','corretiva','andamento'),
(2,'Revisão geral',400,'2024-01-20','Oficina Norte','preventiva','finalizado'),
(7,'Troca de pneus',800,'2024-02-10','PneuCar','corretiva','finalizado'),
(4,'Alinhamento',150,'2024-01-25','Oficina Central','preventiva','finalizado'),
(1,'Troca de bateria',350,'2024-02-15','Auto Elétrica','corretiva','finalizado'),
(3,'Freios',500,'2024-01-30','Oficina Sul','corretiva','finalizado'),
(6,'Filtro de ar',100,'2024-02-05','Oficina Norte','preventiva','finalizado'),
(8,'Suspensão',900,'2024-02-18','Auto Mecânica Silva','corretiva','andamento'),
(9,'Óleo',200,'2024-02-22','Oficina Central','preventiva','finalizado');

SELECT * FROM cliente;

SET SQL_SAFE_UPDATES = 0;
UPDATE Veiculo
SET status_veiculo = 'alugado'
WHERE cor = 'Preto'; 
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM veiculo;

UPDATE Manutenção
SET status_manutencao = 'finalizado'
WHERE id_manutencao IN (2,9);

SELECT * FROM Manutenção;

SELECT SUM(valor_total) AS Faturamento
FROM Aluguel;

SELECT MAX(valor_total) AS 'Aluguel mais caro'
FROM Aluguel;

SELECT COUNT(*) AS 'Quantidade de clientes ativos'
FROM Cliente 
WHERE status_cliente = 'ativo';

SELECT nome ,endereco 
FROM Cliente
WHERE endereco = 'Recife - PE'
GROUP BY nome;

SELECT nome, cargo, salario 
FROM Funcionario
GROUP BY nome
HAVING salario >= 3000;

SELECT nome, data_admissao 
FROM Funcionario
WHERE YEAR(data_admissao) >= 2023
GROUP BY nome;

SELECT Cliente.nome, Pagamento.status_pagamento, Aluguel.status_aluguel
FROM Pagamento
INNER JOIN Aluguel ON Pagamento.id_aluguel = Aluguel.id_aluguel
INNER JOIN Cliente ON Aluguel.id_cliente = Cliente.id_cliente;

SELECT metodo, COUNT(*) AS 'Quantas vezes é usado'
FROM Pagamento
GROUP BY metodo;

SELECT descricao, custo, tipo
FROM Manutenção
GROUP BY custo DESC;

SELECT responsavel, data_manutencao
FROM Manutenção;

SELECT modelo, marca, cor, valor_diaria
FROM Veiculo;

SELECT cor, status_veiculo
FROM Veiculo
WHERE cor = 'PRETO'