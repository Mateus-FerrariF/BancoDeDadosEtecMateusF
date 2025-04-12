-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `tb_Cliente` (
    `Codigo_Cliente` int(11)  NOT NULL ,
    `Nome` string(100)  NOT NULL ,
    `Morada` string(200)  NOT NULL ,
    `Telefone` string(20)  NOT NULL ,
    PRIMARY KEY (
        `Codigo_Cliente`
    )
);

CREATE TABLE `tb_Veiculo` (
    `Codigo_Veiculo` int(11)  NOT NULL ,
    `Codigo_Cliente` int(11)  NOT NULL ,
    `Modelo` string(100)  NOT NULL ,
    `Marca` string(50)  NOT NULL ,
    `Ano` int(4)  NOT NULL ,
    `Data_Aquisicao` date  NOT NULL ,
    PRIMARY KEY (
        `Codigo_Veiculo`
    )
);

CREATE TABLE `tb_Reparacao` (
    `Codigo_Reparacao` int(11)  NOT NULL ,
    `Codigo_Cliente` int(11)  NOT NULL ,
    `Codigo_Veiculo` int(11)  NOT NULL ,
    `Data_Reparacao` date  NOT NULL ,
    `Custo_Total` decimal(10,2)  NOT NULL ,
    PRIMARY KEY (
        `Codigo_Reparacao`
    )
);

CREATE TABLE `tb_Funcionario` (
    `Codigo_Funcionario` int(11)  NOT NULL ,
    `Codigo_Categoria` int(11)  NOT NULL ,
    `Nome` string(100)  NOT NULL ,
    `Morada` string(200)  NOT NULL ,
    `Telefone` string(20)  NOT NULL ,
    `Salario` decimal(10,2)  NOT NULL ,
    PRIMARY KEY (
        `Codigo_Funcionario`
    )
);

CREATE TABLE `tb_Categoria` (
    `Codigo_Categoria` int(11)  NOT NULL ,
    `Nome` string(50)  NOT NULL ,
    `Salario_Basico` decimal(10,2)  NOT NULL ,
    `Descricao` string(255)  NOT NULL ,
    PRIMARY KEY (
        `Codigo_Categoria`
    ),
    CONSTRAINT `uc_tb_Categoria_Nome` UNIQUE (
        `Nome`
    )
);

CREATE TABLE `tb_Reparacao_Funcionario` (
    `Codigo_Reparacao` int(11)  NOT NULL ,
    `Codigo_Funcionario` int(11)  NOT NULL ,
    `Tempo_Manual` decimal(5,2)  NOT NULL ,
    `Custo_Manual` decimal(10,2)  NOT NULL 
);

CREATE TABLE `tb_Peca` (
    `Codigo_Peca` int(11)  NOT NULL ,
    `Designacao` string(150)  NOT NULL ,
    `Custo_Unitario` decimal(10,2)  NOT NULL ,
    `Quantidade_Em_Estoque` int(11)  NOT NULL ,
    `Codigo_Armazem` int(11)  NOT NULL ,
    PRIMARY KEY (
        `Codigo_Peca`
    )
);

CREATE TABLE `tb_Armazem` (
    `Codigo_Armazem` int(11)  NOT NULL ,
    `Localizacao` string(100)  NOT NULL ,
    `Quantidade_Total` int(11)  NOT NULL ,
    PRIMARY KEY (
        `Codigo_Armazem`
    )
);

CREATE TABLE `tb_Reparacao_Peca` (
    `Codigo_Reparacao` int(11)  NOT NULL ,
    `Codigo_Peca` int(11)  NOT NULL ,
    `Quantidade` int(11)  NOT NULL ,
    `Preco_Unitario` decimal(10,2)  NOT NULL 
);

CREATE TABLE `tb1` (

);

-- Free plan table limit reached. SUBSCRIBE for more.



ALTER TABLE `tb_Veiculo` ADD CONSTRAINT `fk_tb_Veiculo_Codigo_Cliente` FOREIGN KEY(`Codigo_Cliente`)
REFERENCES `tb_Cliente` (`Codigo_Cliente`);

ALTER TABLE `tb_Reparacao` ADD CONSTRAINT `fk_tb_Reparacao_Codigo_Cliente` FOREIGN KEY(`Codigo_Cliente`)
REFERENCES `tb_Cliente` (`Codigo_Cliente`);

ALTER TABLE `tb_Reparacao` ADD CONSTRAINT `fk_tb_Reparacao_Codigo_Veiculo` FOREIGN KEY(`Codigo_Veiculo`)
REFERENCES `tb_Veiculo` (`Codigo_Veiculo`);

ALTER TABLE `tb_Funcionario` ADD CONSTRAINT `fk_tb_Funcionario_Codigo_Categoria` FOREIGN KEY(`Codigo_Categoria`)
REFERENCES `tb_Categoria` (`Codigo_Categoria`);

ALTER TABLE `tb_Reparacao_Funcionario` ADD CONSTRAINT `fk_tb_Reparacao_Funcionario_Codigo_Reparacao` FOREIGN KEY(`Codigo_Reparacao`)
REFERENCES `tb_Reparacao` (`Codigo_Reparacao`);

ALTER TABLE `tb_Reparacao_Funcionario` ADD CONSTRAINT `fk_tb_Reparacao_Funcionario_Codigo_Funcionario` FOREIGN KEY(`Codigo_Funcionario`)
REFERENCES `tb_Funcionario` (`Codigo_Funcionario`);

ALTER TABLE `tb_Peca` ADD CONSTRAINT `fk_tb_Peca_Codigo_Armazem` FOREIGN KEY(`Codigo_Armazem`)
REFERENCES `tb_Armazem` (`Codigo_Armazem`);

ALTER TABLE `tb_Reparacao_Peca` ADD CONSTRAINT `fk_tb_Reparacao_Peca_Codigo_Reparacao` FOREIGN KEY(`Codigo_Reparacao`)
REFERENCES `tb_Reparacao` (`Codigo_Reparacao`);

ALTER TABLE `tb_Reparacao_Peca` ADD CONSTRAINT `fk_tb_Reparacao_Peca_Codigo_Peca` FOREIGN KEY(`Codigo_Peca`)
REFERENCES `tb_Peca` (`Codigo_Peca`);

-- Free plan table limit reached. SUBSCRIBE for more.



-- Free plan table limit reached. SUBSCRIBE for more.



