-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/10/2024 às 02:25
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_mundo_dos_livros`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `fk_mov_produto`
--

CREATE TABLE `fk_mov_produto` (
  `id_movimentacao` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` varchar(45) NOT NULL,
  `tb_produto_id_produto` int(11) NOT NULL,
  `ttb_movimentacao_id_movimentacao` int(11) NOT NULL,
  `ttb_movimentacao_tb_tipo_id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_autor`
--

CREATE TABLE `tb_autor` (
  `id_fabricante` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `email` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_movimentacao`
--

CREATE TABLE `tb_movimentacao` (
  `id_movimentacao` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `dt_movimentacao` varchar(45) NOT NULL,
  `tb_tipo_id_tipo` int(11) NOT NULL,
  `tb_usuario_id_usuario` int(11) NOT NULL,
  `tb_tipo_id_tipo1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_produto`
--

CREATE TABLE `tb_produto` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `fabricante` varchar(45) NOT NULL,
  `preco` decimal(9,3) NOT NULL,
  `garantia` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `tb_autor_id_fabricante` int(11) NOT NULL,
  `tb_tipo_id_tipo` int(11) NOT NULL,
  `link` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tipo`
--

CREATE TABLE `tb_tipo` (
  `id_tipo` int(11) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tb_tipo`
--

INSERT INTO `tb_tipo` (`id_tipo`, `descricao`) VALUES
(1, 'usuario normal'),
(2, 'usuario administrador'),
(3, 'usuario normal'),
(4, 'usuario administrador');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `sobrenome` varchar(20) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(200) NOT NULL,
  `email` varchar(70) DEFAULT NULL,
  `dt_criacao` datetime NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `dt_nascimento` date NOT NULL,
  `ativo` binary(1) NOT NULL,
  `tb_tipo_id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`id_usuario`, `nome`, `sobrenome`, `login`, `senha`, `email`, `dt_criacao`, `telefone`, `dt_nascimento`, `ativo`, `tb_tipo_id_tipo`) VALUES
(4, 'Alan', 'Bento', 'AlanBen', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'alangab@gmail.com', '0000-00-00 00:00:00', '47992346780', '0000-00-00', 0x00, 2),
(5, 'Maria', 'Silva', 'MariaSilva', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'maria.silva@example.com', '2024-09-01 00:00:00', '51987654321', '1990-05-15', 0x00, 1),
(8, 'Carlos', 'Souza', 'CarlosSouza', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'carlos.souza@example.com', '2024-09-02 00:00:00', '31987654321', '1985-03-22', 0x00, 2),
(9, 'hdhf', 'dfhd', 'teste', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'dhhd', '0000-00-00 00:00:00', '65654456645', '2024-10-01', 0x00, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `fk_mov_produto`
--
ALTER TABLE `fk_mov_produto`
  ADD PRIMARY KEY (`id_movimentacao`,`id_produto`),
  ADD UNIQUE KEY `id_movimentacao_UNIQUE` (`id_movimentacao`),
  ADD KEY `fk_fk_mov_produto_tb_produto1_idx` (`tb_produto_id_produto`),
  ADD KEY `fk_fk_mov_produto_ttb_movimentacao1_idx` (`ttb_movimentacao_id_movimentacao`,`ttb_movimentacao_tb_tipo_id_tipo`);

--
-- Índices de tabela `tb_autor`
--
ALTER TABLE `tb_autor`
  ADD PRIMARY KEY (`id_fabricante`),
  ADD UNIQUE KEY `id_fabricante_UNIQUE` (`id_fabricante`);

--
-- Índices de tabela `tb_movimentacao`
--
ALTER TABLE `tb_movimentacao`
  ADD PRIMARY KEY (`id_movimentacao`,`tb_tipo_id_tipo`),
  ADD UNIQUE KEY `id_movimentacao_UNIQUE` (`id_movimentacao`),
  ADD KEY `fk_ttb_movimentacao_tb_usuario1_idx` (`tb_usuario_id_usuario`),
  ADD KEY `fk_ttb_movimentacao_tb_tipo1_idx` (`tb_tipo_id_tipo1`);

--
-- Índices de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD PRIMARY KEY (`id_produto`),
  ADD UNIQUE KEY `id_produto_UNIQUE` (`id_produto`),
  ADD KEY `fk_tb_produto_tb_autor_idx` (`tb_autor_id_fabricante`),
  ADD KEY `fk_tb_produto_tb_tipo1_idx` (`tb_tipo_id_tipo`);

--
-- Índices de tabela `tb_tipo`
--
ALTER TABLE `tb_tipo`
  ADD PRIMARY KEY (`id_tipo`),
  ADD UNIQUE KEY `id_tipo_UNIQUE` (`id_tipo`);

--
-- Índices de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `idtb_usuario_UNIQUE` (`id_usuario`),
  ADD KEY `fk_tb_usuario_tb_tipo1_idx` (`tb_tipo_id_tipo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `fk_mov_produto`
--
ALTER TABLE `fk_mov_produto`
  MODIFY `id_movimentacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_autor`
--
ALTER TABLE `tb_autor`
  MODIFY `id_fabricante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_movimentacao`
--
ALTER TABLE `tb_movimentacao`
  MODIFY `id_movimentacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tipo`
--
ALTER TABLE `tb_tipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `fk_mov_produto`
--
ALTER TABLE `fk_mov_produto`
  ADD CONSTRAINT `fk_fk_mov_produto_tb_produto1` FOREIGN KEY (`tb_produto_id_produto`) REFERENCES `tb_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fk_mov_produto_ttb_movimentacao1` FOREIGN KEY (`ttb_movimentacao_id_movimentacao`,`ttb_movimentacao_tb_tipo_id_tipo`) REFERENCES `tb_movimentacao` (`id_movimentacao`, `tb_tipo_id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_movimentacao`
--
ALTER TABLE `tb_movimentacao`
  ADD CONSTRAINT `fk_ttb_movimentacao_tb_tipo1` FOREIGN KEY (`tb_tipo_id_tipo1`) REFERENCES `tb_tipo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ttb_movimentacao_tb_usuario1` FOREIGN KEY (`tb_usuario_id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD CONSTRAINT `fk_tb_produto_tb_autor` FOREIGN KEY (`tb_autor_id_fabricante`) REFERENCES `tb_autor` (`id_fabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_produto_tb_tipo1` FOREIGN KEY (`tb_tipo_id_tipo`) REFERENCES `tb_tipo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `fk_tb_usuario_tb_tipo1` FOREIGN KEY (`tb_tipo_id_tipo`) REFERENCES `tb_tipo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
