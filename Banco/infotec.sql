-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 22-Maio-2019 às 19:04
-- Versão do servidor: 5.7.25
-- versão do PHP: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infotec`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf_cliente` char(11) NOT NULL,
  `nome_cliente` varchar(50) NOT NULL,
  `tel_cliente` varchar(30) NOT NULL,
  `senha_cliente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cpf_cliente`, `nome_cliente`, `tel_cliente`, `senha_cliente`) VALUES
('08427728980', 'Fernando', '99652013', '356497'),
('15222619079', 'Guilherme', '99652013', '356497'),
('42625174030', 'Fernando', '99652013', '356497'),
('53466854059', 'Silva', '99652013', '123'),
('56413006080', 'Lucas', '99652013', '123'),
('90513336095', 'Elos', '9965213', '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `cpf_func` char(11) NOT NULL,
  `nome_func` varchar(50) NOT NULL,
  `senha_func` varchar(50) NOT NULL,
  `id_tipo` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`cpf_func`, `nome_func`, `senha_func`, `id_tipo`) VALUES
('08427728980', 'Guilherme', '123456789', 2),
('53466854059', 'Oliveira', '123', 2),
('58404780080', 'Pedro', '123', 1),
('8427728980', 'GuilhermeF', '123', 1),
('97795876080', 'FF', '123', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id_servicos` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `cpf_cliente` char(11) NOT NULL,
  `cpf_func` char(11) NOT NULL,
  `nome_cliente` varchar(60) DEFAULT NULL,
  `telefone_do_cliente` varchar(20) DEFAULT NULL,
  `situacao` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id_servicos`, `tipo`, `cpf_cliente`, `cpf_func`, `nome_cliente`, `telefone_do_cliente`, `situacao`) VALUES
(58, 'Suporte', '56413006080', '08427728980', 'Lucas', '99652013', 2),
(59, 'Suporte', '15222619079', '08427728980', 'Guilherme', '99652013', 0),
(60, 'Montar_PC', '56413006080', '08427728980', 'Lucas', '99652013', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_func`
--

CREATE TABLE `tipo_func` (
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_func`
--

INSERT INTO `tipo_func` (`id_tipo`) VALUES
(1),
(2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf_cliente`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`cpf_func`),
  ADD KEY `tipo` (`id_tipo`);

--
-- Indexes for table `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id_servicos`),
  ADD KEY `fk_func` (`cpf_func`),
  ADD KEY `fk_cliente` (`cpf_cliente`);

--
-- Indexes for table `tipo_func`
--
ALTER TABLE `tipo_func`
  ADD PRIMARY KEY (`id_tipo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id_servicos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_func` (`id_tipo`);

--
-- Limitadores para a tabela `servicos`
--
ALTER TABLE `servicos`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`),
  ADD CONSTRAINT `fk_func` FOREIGN KEY (`cpf_func`) REFERENCES `funcionario` (`cpf_func`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
