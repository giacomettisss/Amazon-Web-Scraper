-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Jan 27, 2024 at 09:56 PM
-- Server version: 10.6.16-MariaDB-1:10.6.16+maria~ubu2004
-- PHP Version: 8.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amazon_books_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `url`) VALUES
(2, 'Kubernetes Básico: Mergulhe no futuro da infraestrutur', '', 'https://www.amazon.com.br/dp/B08455LHMY'),
(3, 'Criando Microsserviços – 2ª Edição: Projetando sistemas com componentes menores e mais especializados', '', 'https://www.amazon.com.br/dp/B09WF2MVT8'),
(4, 'Migrando sistemas monolíticos para microsserviços: Padrões evolutivos para transformar seu sistema monolítico', '', 'https://www.amazon.com.br/dp/B086K2MRYV'),
(5, 'Padrões de Projetos: Soluções Reutilizáveis de Software Orientados a Objetos', '', 'https://www.amazon.com.br/dp/B016N8RJUQ'),
(6, 'Engineering Management for the Rest of Us (English Edition)', '', 'https://www.amazon.com.br/dp/B0BGYVDX35'),
(7, 'Avalie o que importa: como o Google, Bono Vox e a Fundação Gates sacudiram o mundo com os OKRs', '', 'https://www.amazon.com.br/dp/855080455X'),
(8, 'Fundamentals of Software Architecture: An Engineering Approach (English Edition)', '', 'https://www.amazon.com.br/dp/B0849MPK73'),
(9, 'The Staff Engineer\'s Path: A Guide for Individual Contributors Navigating Growth and Change', '', 'https://www.amazon.com.br/dp/1098118731'),
(10, 'Tidy First? (English Edition)', '', 'https://www.amazon.com.br/dp/B0CL7ZMLWH'),
(11, 'Software Engineering at Google: Lessons Learned from Programming Over Time (English Edition)', '', 'https://www.amazon.com.br/dp/B0859PF5HB'),
(12, 'Data Management at Scale (English Edition)', '', 'https://www.amazon.com.br/dp/B0C22373Q9'),
(13, 'Building Event-Driven Microservices: Leveraging Organizational Data at Scale (English Edition)', '', 'https://www.amazon.com.br/dp/B08C9V1FC9'),
(14, 'Software Architecture: The Hard Parts (English Edition)', '', 'https://www.amazon.com.br/dp/B09H2H5QKC'),
(15, 'The Staff Engineer\'s Path (English Edition)', '', 'https://www.amazon.com.br/dp/B0BG16Y553'),
(16, 'Becoming a Data Head: How to Think, Speak, and Understand Data Science, Statistics, and Machine Learning (English Edition)', '', 'https://www.amazon.com.br/dp/B092TSVZJ8'),
(17, 'Practical Statistics for Data Scientists: 50+ Essential Concepts Using R and Python (English Edition)', '', 'https://www.amazon.com.br/dp/B08712TT3F'),
(18, 'Building Recommendation Systems in Python and JAX (English Edition)', '', 'https://www.amazon.com.br/dp/B0CPH3QF96'),
(19, 'Cloud FinOps (English Edition)', '', 'https://www.amazon.com.br/dp/B0BSP52MHL'),
(20, 'Machine Learning Design Patterns: Solutions to Common Challenges in Data Preparation, Model Building, and MLOps (English Edition)', '', 'https://www.amazon.com.br/dp/B08L8GRRBM'),
(21, 'Introducing MLOps: How to Scale Machine Learning in the Enterprise (English Edition)', '', 'https://www.amazon.com.br/dp/B08PDW3JLY'),
(22, 'Python for Algorithmic Trading: From Idea to Cloud Deployment', '', 'https://www.amazon.com.br/dp/149205335X'),
(23, 'Machine Learning for Financial Risk Management with Python (English Edition)', '', 'https://www.amazon.com.br/dp/B09N9V3X36'),
(24, 'Generative Deep Learning (English Edition)', '', 'https://www.amazon.com.br/dp/B0C3WVJWBF'),
(25, 'Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow (English Edition)', '', 'https://www.amazon.com.br/dp/B0BHCFNY9Q'),
(26, 'Fluent Python (English Edition)', '', 'https://www.amazon.com.br/dp/B09WZJMMJP'),
(27, 'Financial Theory with Python (English Edition)', '', 'https://www.amazon.com.br/dp/B09H22LXJG'),
(28, 'Essential Math for Data Science (English Edition)', '', 'https://www.amazon.com.br/dp/B0B2HMGWQQ'),
(29, 'Artificial Intelligence in Finance: A Python-Based Guide (English Edition)', '', 'https://www.amazon.com.br/dp/B08L7232B5'),
(30, 'Machine Learning and Data Science Blueprints for Finance: From Building Trading Strategies to Robo-Advisors Using Python (English Edition)', '', 'https://www.amazon.com.br/dp/B08KKDXNV4'),
(31, 'Data Mesh (English Edition)', '', 'https://www.amazon.com.br/dp/B09V4KWWJ8'),
(32, 'Linux Eficiente na Linha de Comando: Aumente suas habilidades na linha de comando', '', 'https://www.amazon.com.br/dp/B0BDT8167C'),
(33, 'Refatoração: Aperfeiçoando o design de códigos existentes', '', 'https://www.amazon.com.br/dp/B087N8LKYB'),
(34, 'Data Science para Negócios: O que você precisa saber sobre mineração de dados e pensamento analítico de dados', '', 'https://www.amazon.com.br/dp/B07HQTW1X6'),
(35, 'Data Science Do Zero: Noções Fundamentais com Python', '', 'https://www.amazon.com.br/dp/B093XQ11C8'),
(36, 'Estatística: O que é, para que serve, como funciona', '', 'https://www.amazon.com.br/dp/B01D209XHK'),
(37, 'Como mentir com estatística', '', 'https://www.amazon.com.br/dp/B01FIGE0S8'),
(38, 'Storytelling com Dados: Um guia sobre visualização de dados para profissionais de negócios', '', 'https://www.amazon.com.br/dp/B0851R57ZL'),
(39, 'Código limpo: habilidades práticas do Agile software', '', 'https://www.amazon.com.br/dp/8576082675'),
(40, 'Arquitetura limpa: o guia do artesão para estrutura e design de software', '', 'https://www.amazon.com.br/dp/8550804606'),
(41, 'O codificador limpo: um código de conduta para programadores profissionais', '', 'https://www.amazon.com.br/dp/8576086476'),
(42, 'Craftsmanship limpo: disciplinas, padrões e ética (Robert C. Martin)', '', 'https://www.amazon.com.br/dp/B0BHLK7RFX'),
(43, 'Desenvolvimento Ágil Limpo: De volta às origens', '', 'https://www.amazon.com.br/dp/B08P7YJNM7'),
(44, 'Domain-driven design: atacando as complexidades no coração do software', '', 'https://www.amazon.com.br/dp/8550800651'),
(45, 'Entendendo Algoritmos: Um Guia Ilustrado Para Programadores e Outros Curiosos', '', 'https://www.amazon.com.br/dp/8575225634'),
(46, 'Desenvolvimento web com Flask: Desenvolvendo aplicações web com Python', '', 'https://www.amazon.com.br/dp/B07QH2SK7R'),
(47, 'Sprint a Sprint: Erros e acertos na transformação cultural de um time ágil', '', 'https://www.amazon.com.br/dp/B087N2LKXB'),
(48, 'Machine Learning Design Patterns: Solutions to Common Challenges in Data Preparation, Model Building, and Mlops', '', 'https://www.amazon.com.br/dp/1098115783'),
(49, 'Curso Intensivo de Python: uma Introdução Prática e Baseada em Projetos à Programação', '', 'https://www.amazon.com.br/dp/8575228439'),
(50, 'Mãos A Obra: Aprendizado De Máquina Com Scikit-Learn, Keras & TensorFlow: Conceitos, Ferramentas e Técnicas Para a Construção de Sistemas Inteligentes', '', 'https://www.amazon.com.br/dp/B09H13N8FN'),
(51, 'SQL - Guia Prático: um Guia Para o uso de SQL', '', 'https://www.amazon.com.br/dp/8575228315'),
(52, 'O Catálogo de Dados Corporativo: Aprimore a descoberta de dados, garanta a governança de dados e impulsione a inovação', '', 'https://www.amazon.com.br/dp/B0CJZQX1XV'),
(53, 'Análise prática de séries temporais: predição com estatística e aprendizado de máquina', '', 'https://www.amazon.com.br/dp/8550815624'),
(54, 'Desenvolvendo aplicativos com GPT-4 e ChatGPT: Crie chatbots inteligentes, geradores de conteúdo e muito mais', '', 'https://www.amazon.com.br/dp/8575228749'),
(55, 'Pense em Python: Pense como um cientista da computação', '', 'https://www.amazon.com.br/dp/B07QL2LKBG'),
(56, 'Web Scraping com Python: Coletando mais dados da web moderna', '', 'https://www.amazon.com.br/dp/B07NQVWJ1C'),
(57, 'TDD com Python: Siga o bode dos testes: usando Django, Selenium e JavaScript', '', 'https://www.amazon.com.br/dp/B07S7F656C'),
(58, 'Python e R para o Cientista de Dados Moderno: O melhor de dois mundos', '', 'https://www.amazon.com.br/dp/B0BDTBMNL8'),
(59, 'Fundamentos de Engenharia de Dados: Projete e Construa Sistemas de Dados Robustos', '', 'https://www.amazon.com.br/dp/8575228765'),
(60, 'SQL para Análise de Dados: Técnicas avançadas para transformar dados em insights', '', 'https://www.amazon.com.br/dp/B0B7CN81J2'),
(61, 'O Guia do Mochileiro Python: Melhores Práticas Para Desenvolvimento', '', 'https://www.amazon.com.br/dp/8575225413'),
(62, 'Introdução às Expressões Regulares', '', 'https://www.amazon.com.br/dp/8575223305'),
(63, 'Como ser um Programador Melhor: um Manual Para Programadores que se Importam com Código', '', 'https://www.amazon.com.br/dp/8575224158'),
(64, 'Pragmatic Programmer, The: Your journey to mastery, 20th Anniversary Edition (English Edition)', '', 'https://www.amazon.com.br/dp/B07VRS84D1'),
(65, 'Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Maintainable Systems (English Edition) ', '', 'https://www.amazon.com.br/dp/B06XPJML5D'),
(66, 'Clean Architecture: A Craftsman\'s Guide to Software Structure and Design (Robert C. Martin Series) (English Edition)', '', 'https://www.amazon.com.br/dp/B075LRM681'),
(67, 'Clean Code: A Handbook of Agile Software Craftsmanship (Robert C. Martin Series) (English Edition)', '', 'https://www.amazon.com.br/dp/B001GSTOAM'),
(68, 'Clean Coder, The: A Code of Conduct for Professional Programmers (Robert C. Martin Series) (English Edition)', '', 'https://www.amazon.com.br/dp/B0050JLC9Y'),
(69, 'Working Effectively with Legacy Code (Robert C. Martin Series) (English Edition)', '', 'https://www.amazon.com.br/dp/B005OYHF0A'),
(70, 'Kafka: The Definitive Guide (English Edition)', '', 'https://www.amazon.com.br/dp/B09L6KLWDG'),
(71, 'Database Internals: A Deep Dive into How Distributed Data Systems Work (English Edition)', '', 'https://www.amazon.com.br/dp/B07XW76VHZ'),
(72, 'The Manager\'s Path: A Guide for Tech Leaders Navigating Growth and Change (English Edition)', '', 'https://www.amazon.com.br/dp/B06XP3GJ7F'),
(73, 'Architecting for Scale: How to Maintain High Availability and Manage Risk in the Cloud (English Edition)', '', 'https://www.amazon.com.br/dp/B0859P45K9'),
(74, 'Staff Engineer: Leadership beyond the management track (English Edition)', '', 'https://www.amazon.com.br/dp/B08RMSHYGG'),
(75, 'Observability Engineering (English Edition)', '', 'https://www.amazon.com.br/dp/B09ZQ6FHTT'),
(76, 'Building Evolutionary Architectures (English Edition)', '', 'https://www.amazon.com.br/dp/B0BN4T1P27'),
(77, 'Communication Patterns (English Edition)', '', 'https://www.amazon.com.br/dp/B0CKM8L13H'),
(78, 'Thinking in Systems: International Bestseller (English Edition)', '', 'https://www.amazon.com.br/dp/B005VSRFEA'),
(79, 'Beyond the Basic Stuff with Python: Best Practices for Writing Clean Code', '', 'https://www.amazon.com.br/dp/1593279663'),
(80, 'Robust Python: Write Clean and Maintainable Code', '', 'https://www.amazon.com.br/dp/1098100662');

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT -1.00,
  `price_type` varchar(255) NOT NULL,
  `date_checked` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `book_id`, `price`, `price_type`, `date_checked`) VALUES
(1, 2, 63.20, 'price_kindle', '2024-01-25 15:44:40'),
(2, 3, 125.96, 'price_kindle', '2024-01-25 15:44:48'),
(3, 4, 67.90, 'price_kindle', '2024-01-25 15:44:56'),
(4, 5, 141.07, 'price_kindle', '2024-01-25 15:45:03'),
(5, 6, 47.24, 'price_kindle', '2024-01-25 15:45:11'),
(6, 7, 50.40, 'price_kindle', '2024-01-25 15:45:19'),
(7, 8, 104.39, 'price_kindle', '2024-01-25 15:45:26'),
(8, 9, 59.79, 'price_kindle', '2024-01-25 15:45:33'),
(9, 10, 59.79, 'price_kindle', '2024-01-25 15:45:41'),
(10, 11, 89.29, 'price_kindle', '2024-01-25 15:45:48'),
(11, 12, 294.35, 'price_kindle', '2024-01-25 15:45:56'),
(12, 13, 74.89, 'price_kindle', '2024-01-25 15:46:03'),
(13, 14, 144.99, 'price_kindle', '2024-01-25 15:46:11'),
(14, 15, 59.79, 'price_kindle', '2024-01-25 15:46:18'),
(15, 16, 118.20, 'price_kindle', '2024-01-25 15:46:26'),
(16, 17, 89.29, 'price_kindle', '2024-01-25 15:46:34'),
(17, 18, 266.85, 'price_kindle', '2024-01-25 15:46:41'),
(18, 19, 333.32, 'price_kindle', '2024-01-25 15:46:49'),
(19, 20, 284.37, 'price_kindle', '2024-01-25 15:46:56'),
(20, 21, 277.71, 'price_kindle', '2024-01-25 15:47:04'),
(21, 22, 332.77, 'price_kindle', '2024-01-25 15:47:11'),
(22, 23, 384.16, 'price_kindle', '2024-01-25 15:47:19'),
(23, 24, 89.29, 'price_kindle', '2024-01-25 15:47:26'),
(24, 25, 118.79, 'price_kindle', '2024-01-25 15:47:33'),
(25, 26, 104.39, 'price_kindle', '2024-01-25 15:47:41'),
(26, 27, 233.52, 'price_kindle', '2024-01-25 15:47:48'),
(27, 28, 89.29, 'price_kindle', '2024-01-25 15:47:56'),
(28, 29, 362.98, 'price_kindle', '2024-01-25 15:48:03'),
(29, 30, 327.15, 'price_kindle', '2024-01-25 15:48:11'),
(30, 31, 144.99, 'price_kindle', '2024-01-25 15:48:19'),
(31, 32, 69.60, 'price_kindle', '2024-01-25 15:48:26'),
(32, 33, 103.20, 'price_kindle', '2024-01-25 15:48:34'),
(33, 34, 79.80, 'price_kindle', '2024-01-25 15:48:41'),
(34, 35, 81.60, 'price_kindle', '2024-01-25 15:48:50'),
(35, 36, 31.12, 'price_kindle', '2024-01-25 15:48:58'),
(36, 37, 24.21, 'price_kindle', '2024-01-25 15:49:05'),
(37, 40, 41.58, 'price_kindle', '2024-01-25 15:49:28'),
(38, 42, 46.55, 'price_kindle', '2024-01-25 15:49:44'),
(39, 43, 30.03, 'price_kindle', '2024-01-25 15:49:51'),
(40, 45, 59.90, 'price_kindle', '2024-01-25 15:50:06'),
(41, 46, 84.00, 'price_kindle', '2024-01-25 15:50:14'),
(42, 47, 0.00, 'price_kindle', '2024-01-25 15:50:22'),
(43, 48, 284.37, 'price_kindle', '2024-01-25 15:50:29'),
(44, 49, 133.12, 'price_kindle', '2024-01-25 15:50:37'),
(45, 50, 49.14, 'price_kindle', '2024-01-25 15:50:44'),
(46, 51, 63.20, 'price_kindle', '2024-01-25 15:50:52'),
(47, 52, 59.90, 'price_kindle', '2024-01-25 15:51:00'),
(48, 53, 70.00, 'price_kindle', '2024-01-25 15:51:08'),
(49, 54, 55.20, 'price_kindle', '2024-01-25 15:51:15'),
(50, 55, 76.00, 'price_kindle', '2024-01-25 15:51:23'),
(51, 56, 76.00, 'price_kindle', '2024-01-25 15:51:30'),
(52, 57, 127.20, 'price_kindle', '2024-01-25 15:51:38'),
(53, 58, 63.20, 'price_kindle', '2024-01-25 15:51:46'),
(54, 59, 128.43, 'price_kindle', '2024-01-25 15:51:54'),
(55, 60, 95.20, 'price_kindle', '2024-01-25 15:52:01'),
(56, 61, 84.00, 'price_kindle', '2024-01-25 15:52:09'),
(57, 62, 47.20, 'price_kindle', '2024-01-25 15:52:17'),
(58, 63, 79.20, 'price_kindle', '2024-01-25 15:52:26'),
(59, 64, 197.05, 'price_kindle', '2024-01-25 15:52:33'),
(60, 65, 59.79, 'price_kindle', '2024-01-25 15:52:41'),
(61, 66, 107.44, 'price_kindle', '2024-01-25 15:52:49'),
(62, 67, 112.81, 'price_kindle', '2024-01-25 15:52:57'),
(63, 68, 102.06, 'price_kindle', '2024-01-25 15:53:04'),
(64, 69, 150.44, 'price_kindle', '2024-01-25 15:53:12'),
(65, 70, 89.29, 'price_kindle', '2024-01-25 15:53:19'),
(66, 71, 273.78, 'price_kindle', '2024-01-25 15:53:27'),
(67, 72, 56.29, 'price_kindle', '2024-01-25 15:53:34'),
(68, 73, 284.37, 'price_kindle', '2024-01-25 15:53:42'),
(69, 74, 60.00, 'price_kindle', '2024-01-25 15:53:49'),
(70, 75, 89.29, 'price_kindle', '2024-01-25 15:53:57'),
(71, 76, 144.99, 'price_kindle', '2024-01-25 15:54:04'),
(72, 77, 284.37, 'price_kindle', '2024-01-25 15:54:12'),
(73, 78, 44.49, 'price_kindle', '2024-01-25 15:54:19'),
(74, 79, 139.46, 'price_kindle', '2024-01-25 15:54:27'),
(75, 80, 233.86, 'price_kindle', '2024-01-25 15:54:34'),
(81, 3, 132.59, 'price_paperback', '2024-01-25 16:31:16'),
(82, 4, 74.27, 'price_paperback', '2024-01-25 16:31:23'),
(83, 5, 148.50, 'price_paperback', '2024-01-25 16:31:31'),
(84, 6, 136.39, 'price_hardcover', '2024-01-25 16:31:39'),
(85, 7, 61.12, 'price_paperback', '2024-01-25 16:31:47'),
(86, 8, 349.74, 'price_paperback', '2024-01-25 16:31:54'),
(87, 9, 216.80, 'price_paperback', '2024-01-25 16:32:02'),
(88, 10, 398.87, 'price_paperback', '2024-01-25 16:32:09'),
(89, 11, 291.52, 'price_paperback', '2024-01-25 16:32:17'),
(90, 12, 596.78, 'price_paperback', '2024-01-25 16:32:24'),
(91, 13, 293.95, 'price_paperback', '2024-01-25 16:32:32'),
(92, 14, 352.79, 'price_paperback', '2024-01-25 16:32:39'),
(93, 15, 216.80, 'price_paperback', '2024-01-25 16:32:47'),
(94, 16, 285.54, 'price_paperback', '2024-01-25 16:32:55'),
(95, 17, 346.00, 'price_paperback', '2024-01-25 16:33:03'),
(96, 19, 677.96, 'price_paperback', '2024-01-25 16:33:18'),
(97, 21, 542.08, 'price_paperback', '2024-01-25 16:33:33'),
(98, 22, 350.00, 'price_paperback', '2024-01-25 16:33:40'),
(99, 23, 373.32, 'price_paperback', '2024-01-25 16:33:47'),
(100, 25, 388.73, 'price_paperback', '2024-01-25 16:34:02'),
(101, 26, 356.71, 'price_paperback', '2024-01-25 16:34:10'),
(102, 27, 400.75, 'price_paperback', '2024-01-25 16:34:17'),
(103, 28, 442.20, 'price_paperback', '2024-01-25 16:34:25'),
(104, 29, 381.78, 'price_paperback', '2024-01-25 16:34:32'),
(105, 30, 344.37, 'price_paperback', '2024-01-25 16:34:40'),
(106, 31, 346.69, 'price_paperback', '2024-01-25 16:34:47'),
(107, 32, 75.73, 'price_paperback', '2024-01-25 16:34:55'),
(108, 33, 108.88, 'price_paperback', '2024-01-25 16:35:02'),
(109, 34, 91.23, 'price_paperback', '2024-01-25 16:35:11'),
(110, 35, 85.89, 'price_paperback', '2024-01-25 16:35:18'),
(111, 36, 38.90, 'price_paperback', '2024-01-25 16:35:26'),
(112, 37, 53.02, 'price_paperback', '2024-01-25 16:35:33'),
(113, 38, 72.30, 'price_paperback', '2024-01-25 16:35:41'),
(114, 39, 88.13, 'price_paperback', '2024-01-25 16:35:49'),
(115, 40, 76.15, 'price_paperback', '2024-01-25 16:35:56'),
(116, 41, 68.42, 'price_paperback', '2024-01-25 16:36:04'),
(117, 42, 81.80, 'price_paperback', '2024-01-25 16:36:12'),
(118, 43, 54.57, 'price_paperback', '2024-01-25 16:36:19'),
(119, 44, 100.75, 'price_paperback', '2024-01-25 16:36:27'),
(120, 45, 66.33, 'price_paperback', '2024-01-25 16:36:35'),
(121, 47, 53.87, 'price_paperback', '2024-01-25 16:36:50'),
(122, 49, 140.13, 'price_paperback', '2024-01-25 16:37:05'),
(123, 50, 91.98, 'price_paperback', '2024-01-25 16:37:12'),
(124, 51, 69.12, 'price_paperback', '2024-01-25 16:37:20'),
(125, 52, 66.29, 'price_paperback', '2024-01-25 16:37:27'),
(126, 53, 85.57, 'price_paperback', '2024-01-25 16:37:35'),
(127, 54, 61.47, 'price_paperback', '2024-01-25 16:37:43'),
(128, 55, 82.07, 'price_paperback', '2024-01-25 16:37:51'),
(129, 56, 82.07, 'price_paperback', '2024-01-25 16:37:58'),
(130, 57, 159.00, 'price_paperback', '2024-01-25 16:38:06'),
(131, 58, 69.32, 'price_paperback', '2024-01-25 16:38:14'),
(132, 59, 135.09, 'price_paperback', '2024-01-25 16:38:21'),
(133, 60, 100.89, 'price_paperback', '2024-01-25 16:38:29'),
(134, 61, 88.99, 'price_paperback', '2024-01-25 16:38:37'),
(135, 62, 53.74, 'price_paperback', '2024-01-25 16:38:45'),
(136, 63, 85.45, 'price_paperback', '2024-01-25 16:38:53'),
(137, 64, 247.37, 'price_hardcover', '2024-01-25 16:39:00'),
(138, 65, 480.54, 'price_paperback', '2024-01-25 16:39:08'),
(139, 66, 201.86, 'price_paperback', '2024-01-25 16:39:16'),
(140, 67, 202.71, 'price_paperback', '2024-01-25 16:39:24'),
(141, 68, 385.41, 'price_paperback', '2024-01-25 16:39:32'),
(142, 70, 331.84, 'price_paperback', '2024-01-25 16:39:47'),
(143, 71, 288.19, 'price_paperback', '2024-01-25 16:39:55'),
(144, 72, 233.37, 'price_paperback', '2024-01-25 16:40:02'),
(145, 73, 299.85, 'price_paperback', '2024-01-25 16:40:10'),
(146, 74, 342.42, 'price_paperback', '2024-01-25 16:40:17'),
(147, 76, 362.13, 'price_paperback', '2024-01-25 16:40:32'),
(148, 77, 586.72, 'price_paperback', '2024-01-25 16:40:40'),
(149, 78, 181.12, 'price_paperback', '2024-01-25 16:40:48'),
(150, 80, 481.18, 'price_paperback', '2024-01-25 16:41:03'),
(151, 23, 373.81, 'price_paperback', '2024-01-27 14:38:38'),
(152, 6, 136.37, 'price_hardcover', '2024-01-27 11:40:12'),
(153, 8, 351.60, 'price_paperback', '2024-01-27 11:40:28'),
(154, 17, 347.83, 'price_paperback', '2024-01-27 11:41:35'),
(155, 18, 778.90, 'price_paperback', '2024-01-27 11:41:43'),
(156, 22, 351.85, 'price_paperback', '2024-01-27 11:42:13'),
(157, 26, 354.51, 'price_paperback', '2024-01-27 11:42:43'),
(158, 27, 400.73, 'price_paperback', '2024-01-27 11:42:51'),
(159, 29, 383.80, 'price_paperback', '2024-01-27 11:43:06'),
(160, 41, 64.45, 'price_paperback', '2024-01-27 11:44:40'),
(161, 47, 49.56, 'price_paperback', '2024-01-27 11:45:26'),
(162, 51, 69.32, 'price_paperback', '2024-01-27 11:45:56'),
(163, 64, 183.75, 'price_kindle', '2024-01-27 11:47:38'),
(164, 65, 478.95, 'price_paperback', '2024-01-27 11:47:45'),
(165, 70, 332.28, 'price_paperback', '2024-01-27 11:48:24'),
(166, 72, 332.24, 'price_paperback', '2024-01-27 11:48:39'),
(167, 73, 301.20, 'price_paperback', '2024-01-27 11:48:47'),
(168, 79, 153.22, 'price_paperback', '2024-01-27 11:49:32'),
(169, 4, 63.75, 'price_paperback', '2024-01-27 15:21:08'),
(170, 4, 74.27, 'price_paperback', '2024-01-27 12:24:04'),
(171, 4, 74.27, 'price_paperback', '2024-01-27 12:26:38'),
(172, 3, 119.25, 'price_paperback', '2024-01-27 21:09:35'),
(173, 32, 65.25, 'price_paperback', '2024-01-27 21:11:17'),
(174, 33, 96.75, 'price_paperback', '2024-01-27 21:11:21'),
(175, 42, 73.46, 'price_paperback', '2024-01-27 21:11:56'),
(176, 45, 56.25, 'price_paperback', '2024-01-27 21:12:08'),
(177, 49, 126.75, 'price_paperback', '2024-01-27 21:12:23'),
(178, 51, 59.25, 'price_paperback', '2024-01-27 21:12:31'),
(179, 52, 56.25, 'price_paperback', '2024-01-27 21:12:35'),
(180, 53, 77.12, 'price_paperback', '2024-01-27 21:12:39'),
(181, 54, 51.75, 'price_paperback', '2024-01-27 21:12:43'),
(182, 55, 71.25, 'price_paperback', '2024-01-27 21:12:46'),
(183, 56, 71.25, 'price_paperback', '2024-01-27 21:12:50'),
(184, 58, 59.25, 'price_paperback', '2024-01-27 21:12:57'),
(185, 59, 122.10, 'price_paperback', '2024-01-27 21:13:01'),
(186, 60, 89.25, 'price_paperback', '2024-01-27 21:13:05'),
(187, 61, 78.75, 'price_paperback', '2024-01-27 21:13:08'),
(188, 62, 44.25, 'price_paperback', '2024-01-27 21:13:12'),
(189, 63, 74.25, 'price_paperback', '2024-01-27 21:13:16'),
(190, 3, 132.59, 'price_paperback', '2024-01-27 18:38:25'),
(191, 4, 74.27, 'price_paperback', '2024-01-27 18:38:29'),
(192, 3, 132.59, 'price_paperback', '2024-01-27 18:53:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prices_ibfk_1` (`book_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
