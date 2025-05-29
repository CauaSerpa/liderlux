-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Ago-2021 às 02:59
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bg1`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_coa`
--

CREATE TABLE `acc_coa` (
  `HeadCode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `HeadName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PHeadName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `HeadLevel` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `IsTransaction` tinyint(1) NOT NULL,
  `IsGL` tinyint(1) NOT NULL,
  `HeadType` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `IsBudget` tinyint(1) NOT NULL,
  `IsDepreciation` tinyint(1) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `DepreciationRate` decimal(18,2) NOT NULL,
  `CreateBy` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CreateDate` datetime NOT NULL,
  `UpdateBy` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `UpdateDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `acc_coa`
--

INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES
('102030000001', '1-Walking Customer', 'Customer Receivable', 4, 1, 1, 0, 'A', 0, 0, 1, NULL, NULL, '0.00', '1', '2019-11-16 08:44:42', '', '0000-00-00 00:00:00'),
('50202', 'Account Payable', 'Current Liabilities', 2, 1, 0, 1, 'L', 0, 0, NULL, NULL, NULL, '0.00', 'admin', '2015-10-15 19:50:43', '', '2019-09-05 00:00:00'),
('10203', 'Account Receivable', 'Current Asset', 2, 1, 0, 0, 'A', 0, 0, NULL, NULL, NULL, '0.00', '', '2019-09-05 00:00:00', 'admin', '2013-09-18 15:29:35'),
('1', 'Assets', 'COA', 0, 1, 0, 0, 'A', 0, 0, NULL, NULL, NULL, '0.00', '', '2019-09-05 00:00:00', '', '2019-09-05 00:00:00'),
('10201', 'Cash & Cash Equivalent', 'Current Asset', 2, 1, 0, 1, 'A', 0, 0, NULL, NULL, NULL, '0.00', '1', '2019-06-25 13:47:29', 'admin', '2015-10-15 15:57:55'),
('1020102', 'Cash At Bank', 'Cash & Cash Equivalent', 3, 1, 0, 1, 'A', 0, 0, NULL, NULL, NULL, '0.00', '1', '2019-03-18 06:08:18', 'admin', '2015-10-15 15:32:42'),
('1020101', 'Cash In Hand', 'Cash & Cash Equivalent', 3, 1, 1, 0, 'A', 0, 0, NULL, NULL, NULL, '0.00', '1', '2019-01-26 07:38:48', 'admin', '2016-05-23 12:05:43'),
('102', 'Current Asset', 'Assets', 1, 1, 0, 0, 'A', 0, 0, NULL, NULL, NULL, '0.00', '', '2019-09-05 00:00:00', 'admin', '2018-07-07 11:23:00'),
('502', 'Current Liabilities', 'Liabilities', 1, 1, 0, 0, 'L', 0, 0, NULL, NULL, NULL, '0.00', 'anwarul', '2014-08-30 13:18:20', 'admin', '2015-10-15 19:49:21'),
('1020301', 'Customer Receivable', 'Account Receivable', 3, 1, 0, 1, 'A', 0, 0, NULL, NULL, NULL, '0.00', '1', '2019-01-24 12:10:05', 'admin', '2018-07-07 12:31:42'),
('401', 'Default expense', 'Expence', 1, 1, 1, 0, 'E', 1, 1, NULL, NULL, NULL, '1.00', '1', '2019-12-21 09:00:55', '', '0000-00-00 00:00:00'),
('50204', 'Employee Ledger', 'Current Liabilities', 2, 1, 0, 1, 'L', 0, 0, NULL, NULL, NULL, '0.00', '1', '2019-04-08 10:36:32', '', '2019-09-05 00:00:00'),
('403', 'Employee Salary', 'Expence', 1, 1, 1, 0, 'E', 0, 1, NULL, NULL, NULL, '1.00', '1', '2019-06-17 11:44:52', '', '2019-09-05 00:00:00'),
('2', 'Equity', 'COA', 0, 1, 0, 0, 'L', 0, 0, NULL, NULL, NULL, '0.00', '', '2019-09-05 00:00:00', '', '2019-09-05 00:00:00'),
('4', 'Expence', 'COA', 0, 1, 0, 0, 'E', 0, 0, NULL, NULL, NULL, '0.00', '', '2019-09-05 00:00:00', '', '2019-09-05 00:00:00'),
('3', 'Income', 'COA', 0, 1, 0, 0, 'I', 0, 0, NULL, NULL, NULL, '0.00', '', '2019-09-05 00:00:00', '', '2019-09-05 00:00:00'),
('10107', 'Inventory', 'Non Current Assets', 1, 1, 0, 0, 'A', 0, 0, NULL, NULL, NULL, '0.00', '2', '2018-07-07 15:21:58', '', '2019-09-05 00:00:00'),
('5', 'Liabilities', 'COA', 0, 1, 0, 0, 'L', 0, 0, NULL, NULL, NULL, '0.00', 'admin', '2013-07-04 12:32:07', 'admin', '2015-10-15 19:46:54'),
('1020302', 'Loan Receivable', 'Account Receivable', 3, 1, 0, 1, 'A', 0, 0, NULL, NULL, NULL, '0.00', '1', '2019-01-26 07:37:20', '', '2019-09-05 00:00:00'),
('101', 'Non Current Assets', 'Assets', 1, 1, 0, 0, 'A', 0, 0, NULL, NULL, NULL, '0.00', '', '2019-09-05 00:00:00', 'admin', '2015-10-15 15:29:11'),
('501', 'Non Current Liabilities', 'Liabilities', 1, 1, 0, 0, 'L', 0, 0, NULL, NULL, NULL, '0.00', 'anwarul', '2014-08-30 13:18:20', 'admin', '2015-10-15 19:49:21'),
('402', 'Product Purchase', 'Expence', 1, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, '0.00', '2', '2018-07-07 14:00:16', 'admin', '2015-10-15 18:37:42'),
('303', 'Product Sale', 'Income', 1, 1, 1, 0, 'I', 0, 0, NULL, NULL, NULL, '0.00', '1', '2019-06-17 08:22:42', '', '2019-09-05 00:00:00'),
('304', 'Service Income', 'Income', 1, 1, 1, 0, 'I', 0, 0, NULL, NULL, NULL, '0.00', '1', '2019-06-17 11:31:11', '', '2019-09-05 00:00:00'),
('10108', 'Service Receive', 'Non Current Assets', 2, 1, 1, 1, 'A', 0, 0, NULL, NULL, NULL, '0.00', '2', '2020-10-11 06:27:59', '', '0000-00-00 00:00:00'),
('50203', 'Tax', 'Current Liabilities', 2, 1, 0, 0, 'L', 0, 0, NULL, NULL, NULL, '0.00', '2', '2020-10-01 11:57:11', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_transaction`
--

CREATE TABLE `acc_transaction` (
  `ID` int(11) NOT NULL,
  `VNo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Vtype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VDate` date DEFAULT NULL,
  `COAID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Narration` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `Debit` decimal(18,2) DEFAULT NULL,
  `Credit` decimal(18,2) DEFAULT NULL,
  `IsPosted` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_opening` int(11) NOT NULL DEFAULT 0,
  `CreateBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `IsAppove` char(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `app_setting`
--

CREATE TABLE `app_setting` (
  `id` int(11) NOT NULL,
  `localhserver` varchar(250) DEFAULT NULL,
  `onlineserver` varchar(250) DEFAULT NULL,
  `hotspot` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `app_setting`
--

INSERT INTO `app_setting` (`id`, `localhserver`, `onlineserver`, `hotspot`) VALUES
(1, 'http://localhost/', 'http://localhost/', 'http://localhost/');

-- --------------------------------------------------------

--
-- Estrutura da tabela `attendance`
--

CREATE TABLE `attendance` (
  `att_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `sign_in` varchar(30) NOT NULL,
  `sign_out` varchar(30) NOT NULL,
  `staytime` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bank_add`
--

CREATE TABLE `bank_add` (
  `id` int(11) NOT NULL,
  `bank_id` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `ac_name` varchar(250) DEFAULT NULL,
  `ac_number` varchar(250) DEFAULT NULL,
  `branch` varchar(250) DEFAULT NULL,
  `signature_pic` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `company_information`
--

CREATE TABLE `company_information` (
  `company_id` varchar(250) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `website` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `company_information`
--

INSERT INTO `company_information` (`company_id`, `company_name`, `email`, `address`, `mobile`, `website`, `status`) VALUES
('1', 'Demo LTD', 'example@gmail.com', '4th Floor Mannan Plaza,Khilkhet,Dhaka-1229', '234234', 'httpss://www.bdtask.com/', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `currency_tbl`
--

CREATE TABLE `currency_tbl` (
  `id` int(11) NOT NULL,
  `currency_name` varchar(50) NOT NULL,
  `icon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `currency_tbl`
--

INSERT INTO `currency_tbl` (`id`, `currency_name`, `icon`) VALUES
(1, 'Dollars', '$'),
(2, 'REAL', 'R$');

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer_information`
--

CREATE TABLE `customer_information` (
  `customer_id` bigint(20) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `address2` text NOT NULL,
  `customer_mobile` varchar(100) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `email_address` varchar(200) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `status` int(2) NOT NULL COMMENT '1=paid,2=credit',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_by` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `customer_information`
--

INSERT INTO `customer_information` (`customer_id`, `customer_name`, `customer_address`, `address2`, `customer_mobile`, `customer_email`, `email_address`, `contact`, `phone`, `fax`, `city`, `state`, `zip`, `country`, `status`, `create_date`, `create_by`) VALUES
(1, 'Walking Customer', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2020-03-03 02:23:10', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `daily_banking_add`
--

CREATE TABLE `daily_banking_add` (
  `banking_id` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `bank_id` varchar(100) DEFAULT NULL,
  `deposit_type` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `daily_closing`
--

CREATE TABLE `daily_closing` (
  `closing_id` int(11) NOT NULL,
  `last_day_closing` float NOT NULL,
  `cash_in` float NOT NULL,
  `cash_out` float NOT NULL,
  `date` varchar(250) NOT NULL,
  `amount` float NOT NULL,
  `adjustment` float DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `designation`
--

CREATE TABLE `designation` (
  `id` int(11) NOT NULL,
  `designation` varchar(150) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_config`
--

CREATE TABLE `email_config` (
  `id` int(11) NOT NULL,
  `protocol` text NOT NULL,
  `smtp_host` text NOT NULL,
  `smtp_port` text NOT NULL,
  `smtp_user` varchar(35) NOT NULL,
  `smtp_pass` varchar(35) NOT NULL,
  `mailtype` varchar(30) DEFAULT NULL,
  `isinvoice` tinyint(4) NOT NULL,
  `isservice` tinyint(4) NOT NULL,
  `isquotation` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `email_config`
--

INSERT INTO `email_config` (`id`, `protocol`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `mailtype`, `isinvoice`, `isservice`, `isquotation`) VALUES
(1, 'ssmtp', 'ssl://ssmtp.gmail.com', '25', 'demo@gmail.coms', 'demo123456', 'html', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `employee_history`
--

CREATE TABLE `employee_history` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `rate_type` int(11) NOT NULL,
  `hrate` float NOT NULL,
  `email` varchar(50) NOT NULL,
  `blood_group` varchar(10) NOT NULL,
  `address_line_1` text NOT NULL,
  `address_line_2` text NOT NULL,
  `image` text DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `employee_salary_payment`
--

CREATE TABLE `employee_salary_payment` (
  `emp_sal_pay_id` int(11) NOT NULL,
  `generate_id` int(11) NOT NULL,
  `employee_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `total_salary` decimal(18,2) NOT NULL DEFAULT 0.00,
  `total_working_minutes` varchar(50) CHARACTER SET latin1 NOT NULL,
  `working_period` varchar(50) CHARACTER SET latin1 NOT NULL,
  `payment_due` varchar(50) CHARACTER SET latin1 NOT NULL,
  `payment_date` varchar(50) CHARACTER SET latin1 NOT NULL,
  `paid_by` varchar(50) CHARACTER SET latin1 NOT NULL,
  `salary_month` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `employee_salary_setup`
--

CREATE TABLE `employee_salary_setup` (
  `e_s_s_id` int(11) UNSIGNED NOT NULL,
  `employee_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `sal_type` varchar(30) NOT NULL,
  `salary_type_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `create_date` date DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `update_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `gross_salary` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `type` varchar(100) NOT NULL,
  `voucher_no` varchar(50) NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `expense_item`
--

CREATE TABLE `expense_item` (
  `id` int(11) NOT NULL,
  `expense_item_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `invoice`
--

CREATE TABLE `invoice` (
  `id` int(30) NOT NULL,
  `invoice_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `total_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `due_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `prevous_due` decimal(20,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `invoice` bigint(20) NOT NULL,
  `offline_invoice_no` bigint(20) DEFAULT NULL,
  `invoice_discount` decimal(10,2) DEFAULT 0.00 COMMENT 'invoice discount',
  `total_discount` decimal(10,2) DEFAULT 0.00 COMMENT 'total invoice discount',
  `total_tax` decimal(10,2) DEFAULT 0.00,
  `sales_by` varchar(50) NOT NULL,
  `invoice_details` text NOT NULL,
  `status` int(2) NOT NULL,
  `bank_id` varchar(30) DEFAULT NULL,
  `payment_type` int(11) NOT NULL,
  `is_online` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` int(11) NOT NULL,
  `invoice_details_id` varchar(100) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `product_id` varchar(30) NOT NULL,
  `serial_no` varchar(30) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `supplier_rate` float DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `discount_per` varchar(15) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `paid_amount` decimal(12,0) DEFAULT NULL,
  `due_amount` decimal(10,2) DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `language`
--

CREATE TABLE `language` (
  `id` int(11) UNSIGNED NOT NULL,
  `phrase` text NOT NULL,
  `english` text DEFAULT NULL,
  `bangla` text DEFAULT NULL,
  `portugues` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `language`
--

INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`, `portugues`) VALUES
(1, 'user_profile', 'User Profile', NULL, 'Perfil de usuário'),
(2, 'setting', 'Setting', NULL, 'Configuração'),
(3, 'language', 'Language', NULL, 'Língua'),
(4, 'manage_users', 'Manage Users', NULL, 'Gerenciar usuários'),
(5, 'add_user', 'Add User', NULL, 'Adicionar usuário'),
(6, 'manage_company', 'Manage Company', NULL, 'Gerenciar Empresa'),
(7, 'web_settings', 'Software Settings', NULL, 'Configurações de software'),
(8, 'manage_accounts', 'Manage Accounts', NULL, 'Gerenciar contas'),
(9, 'create_accounts', 'Create Account', NULL, 'Criar Conta'),
(10, 'manage_bank', 'Manage Bank', NULL, 'Gerenciar Banco'),
(11, 'add_new_bank', 'Add New Bank', NULL, 'Adicionar Novo Banco'),
(12, 'settings', 'Settings', NULL, 'Configurações'),
(13, 'closing_report', 'Closing Report', NULL, 'Relatório de Fechamento'),
(14, 'closing', 'Closing', NULL, 'Fechando'),
(15, 'cheque_manager', 'Cheque Manager', NULL, 'Verificar gerente'),
(16, 'accounts_summary', 'Accounts Summary', NULL, 'Resumo das contas'),
(17, 'expense', 'Expense', NULL, 'Despesa'),
(18, 'income', 'Income', NULL, 'Renda'),
(19, 'accounts', 'Accounts', NULL, 'Contas'),
(20, 'stock_report', 'Stock Report', NULL, 'Relatório de estoque'),
(21, 'stock', 'Stock', NULL, 'Estoque'),
(22, 'pos_invoice', 'POS Sale', NULL, 'Fatura de PDV'),
(23, 'manage_invoice', 'Manage Sale', NULL, 'Gerenciar venda'),
(24, 'new_invoice', 'New Sale', NULL, 'Nova Venda'),
(25, 'invoice', 'Sale', NULL, 'Oferta'),
(26, 'manage_purchase', 'Manage Purchase', NULL, 'Gerenciar compra'),
(27, 'add_purchase', 'Add Purchase', NULL, 'Adicionar Compra'),
(28, 'purchase', 'Purchase', NULL, 'Compra'),
(29, 'paid_customer', 'Paid Customer', NULL, 'Cliente Pago'),
(30, 'manage_customer', 'Manage Customer', NULL, 'Gerenciar cliente'),
(31, 'add_customer', 'Add Customer', NULL, 'Adicionar Cliente'),
(32, 'customer', 'Customer', NULL, 'Cliente'),
(33, 'supplier_payment_actual', 'Supplier Payment Ledger', NULL, 'Livro de pagamento de fornecedores'),
(34, 'supplier_sales_summary', 'Supplier Sales Summary', NULL, 'Resumo de vendas do fornecedor'),
(35, 'supplier_sales_details', 'Supplier Sales Details', NULL, 'Detalhes de vendas do fornecedor'),
(36, 'supplier_ledger', 'Supplier Ledger', NULL, 'Razão de Fornecedores'),
(37, 'manage_supplier', 'Manage Supplier', NULL, 'Gerenciar Fornecedor'),
(38, 'add_supplier', 'Add Supplier', NULL, 'Adicionar fornecedor'),
(39, 'supplier', 'Supplier', NULL, 'Fornecedor'),
(40, 'product_statement', 'Product Statement', NULL, 'Declaração do Produto'),
(41, 'manage_product', 'Manage Product', NULL, 'Gerenciar Produto'),
(42, 'add_product', 'Add Product', NULL, 'Adicionar Produto'),
(43, 'product', 'Product', NULL, 'Produtos'),
(44, 'manage_category', 'Manage Category', NULL, 'Gerenciar categoria'),
(45, 'add_category', 'Add Category', NULL, 'Adicionar categoria'),
(46, 'category', 'Category', NULL, 'Categoria'),
(47, 'sales_report_product_wise', 'Sales Report (Product Wise)', NULL, 'Relatório de vendas (produto sábio)'),
(48, 'purchase_report', 'Purchase Report', NULL, 'Relatório de Compra'),
(49, 'sales_report', 'Sales Report', NULL, 'Relatório de vendas'),
(50, 'todays_report', 'Todays Report', NULL, 'Relatório de hoje'),
(51, 'report', 'Report', NULL, 'Relatório'),
(52, 'dashboard', 'Dashboard', NULL, 'Painel'),
(53, 'online', 'Online', NULL, 'On-line'),
(54, 'logout', 'Logout', NULL, 'Sair'),
(55, 'change_password', 'Change Password', NULL, 'Mudar senha'),
(56, 'total_purchase', 'Total Purchase', NULL, 'Compra Total'),
(57, 'total_amount', 'Total Amount', NULL, 'Montante total'),
(58, 'supplier_name', 'Supplier Name', NULL, 'Nome do Fornecedor'),
(59, 'invoice_no', 'Invoice No', NULL, 'Fatura nº'),
(60, 'purchase_date', 'Purchase Date', NULL, 'data de compra'),
(61, 'todays_purchase_report', 'Todays Purchase Report', NULL, 'Relatório de compra de hoje'),
(62, 'total_sales', 'Total Sales', NULL, 'Vendas totais'),
(63, 'customer_name', 'Customer Name', NULL, 'Nome do cliente'),
(64, 'sales_date', 'Sales Date', NULL, 'Data de Venda'),
(65, 'todays_sales_report', 'Todays Sales Report', NULL, 'Relatório de vendas de hoje'),
(66, 'home', 'Home', NULL, 'Início'),
(67, 'todays_sales_and_purchase_report', 'Todays sales and purchase report', NULL, 'Relatório de vendas e compras de hoje'),
(68, 'total_ammount', 'Total Amount', NULL, 'Montante total'),
(69, 'rate', 'Rate', NULL, 'Avaliar'),
(70, 'product_model', 'Product Model', NULL, 'Modelo de Produto'),
(71, 'product_name', 'Product Name', NULL, 'Nome do Produto'),
(72, 'search', 'Search', NULL, 'Procurar'),
(73, 'end_date', 'End Date', NULL, 'Data final'),
(74, 'start_date', 'Start Date', NULL, 'Data de início'),
(75, 'total_purchase_report', 'Total Purchase Report', NULL, 'Relatório de compra total'),
(76, 'total_sales_report', 'Total Sales Report', NULL, 'Relatório Total de Vendas'),
(77, 'total_seles', 'Total Sales', NULL, 'Vendas totais'),
(78, 'all_stock_report', 'All Stock Report', NULL, 'Relatório de todo o estoque'),
(79, 'search_by_product', 'Search By Product', NULL, 'Pesquisa por produto'),
(80, 'date', 'Date', NULL, 'Data'),
(81, 'print', 'Print', NULL, 'Imprimir'),
(82, 'stock_date', 'Stock Date', NULL, 'Data de Estoque'),
(83, 'print_date', 'Print Date', NULL, 'Data de impressão'),
(84, 'sales', 'Sales', NULL, 'Vendas'),
(85, 'price', 'Price', NULL, 'Preço'),
(86, 'sl', 'SL.', NULL, 'SL.'),
(87, 'add_new_category', 'Add new category', NULL, 'Adicionar nova categoria'),
(88, 'category_name', 'Category Name', NULL, 'Nome da Categoria'),
(89, 'save', 'Save', NULL, 'Salve'),
(90, 'delete', 'Delete', NULL, 'Excluir'),
(91, 'update', 'Update', NULL, 'Atualizar'),
(92, 'action', 'Action', NULL, 'Ação'),
(93, 'manage_your_category', 'Manage your category ', NULL, 'Gerenciar sua categoria'),
(94, 'category_edit', 'Category Edit', NULL, 'Edição de Categoria'),
(95, 'status', 'Status', NULL, 'Status'),
(96, 'active', 'Active', NULL, 'Ativo'),
(97, 'inactive', 'Inactive', NULL, 'Inativo'),
(98, 'save_changes', 'Save Changes', NULL, 'Salvar alterações'),
(99, 'save_and_add_another', 'Save And Add Another', NULL, 'Salvar e adicionar outro'),
(100, 'model', 'Model', NULL, 'Modelo'),
(101, 'supplier_price', 'Supplier Price', NULL, 'Preço do fornecedor'),
(102, 'sell_price', 'Sale Price', NULL, 'Preço de venda'),
(103, 'image', 'Image', NULL, 'Imagem'),
(104, 'select_one', 'Select One', NULL, 'Selecione um'),
(105, 'details', 'Details', NULL, 'Detalhes'),
(106, 'new_product', 'New Product', NULL, 'Novo produto'),
(107, 'add_new_product', 'Add new product', NULL, 'Adicionar novo produto'),
(108, 'barcode', 'Barcode', NULL, 'Código de barras'),
(109, 'qr_code', 'Qr-Code', NULL, 'Qr-Code'),
(110, 'product_details', 'Product Details', NULL, 'Detalhes do produto'),
(111, 'manage_your_product', 'Manage your product', NULL, 'Gerenciar seu produto'),
(112, 'product_edit', 'Product Edit', NULL, 'Edição de Produto'),
(113, 'edit_your_product', 'Edit your product', NULL, 'Edite o seu produto'),
(114, 'cancel', 'Cancel', NULL, 'Cancelar'),
(115, 'incl_vat', 'Incl. Vat', NULL, 'Incl. Vat'),
(116, 'money', 'TK', NULL, 'DH'),
(117, 'grand_total', 'Grand Total', NULL, 'Total geral'),
(118, 'quantity', 'Qnty', NULL, 'Qntd'),
(119, 'product_report', 'Product Report', NULL, 'Relatório de Produto'),
(120, 'product_sales_and_purchase_report', 'Product sales and purchase report', NULL, 'Relatório de vendas e compras de produtos'),
(121, 'previous_stock', 'Previous Stock', NULL, 'Estoque Anterior'),
(122, 'out', 'Out', NULL, 'Fora'),
(123, 'in', 'In', NULL, 'No'),
(124, 'to', 'To', NULL, 'Para'),
(125, 'previous_balance', 'Previous Balance', NULL, 'Balanço prévio'),
(126, 'customer_address', 'Customer Address', NULL, 'Endereço do cliente'),
(127, 'customer_mobile', 'Customer Mobile', NULL, 'Cliente Móvel'),
(128, 'customer_email', 'Customer Email', NULL, 'Email do cliente'),
(129, 'add_new_customer', 'Add new customer', NULL, 'Adicionar novo cliente'),
(130, 'balance', 'Balance', NULL, 'Equilíbrio'),
(131, 'mobile', 'Mobile', NULL, 'Mobile'),
(132, 'address', 'Address', NULL, 'Endereço'),
(133, 'manage_your_customer', 'Manage your customer', NULL, 'Gerencie seu cliente'),
(134, 'customer_edit', 'Customer Edit', NULL, 'Edição do cliente'),
(135, 'paid_customer_list', 'Paid Customer List', NULL, 'Lista de clientes pagos'),
(136, 'ammount', 'Amount', NULL, 'Quantidade'),
(137, 'customer_ledger', 'Customer Ledger', NULL, 'Livro de clientes'),
(138, 'manage_customer_ledger', 'Manage Customer Ledger', NULL, 'Gerenciar livro-razão de clientes'),
(139, 'customer_information', 'Customer Information', NULL, 'Informação ao Cliente'),
(140, 'debit_ammount', 'Debit Amount', NULL, 'Valor de Débito'),
(141, 'credit_ammount', 'Credit Amount', NULL, 'Quantidade de crédito'),
(142, 'balance_ammount', 'Balance Amount', NULL, 'Valor do saldo'),
(143, 'receipt_no', 'Receipt NO', NULL, 'Recibo NÃO'),
(144, 'description', 'Description', NULL, 'Descrição'),
(145, 'debit', 'Debit', NULL, 'Débito'),
(146, 'credit', 'Credit', NULL, 'Crédito'),
(147, 'item_information', 'Item Information', NULL, 'Informações sobre o item'),
(148, 'total', 'Total', NULL, 'Total'),
(149, 'please_select_supplier', 'Please Select Supplier', NULL, 'Selecione o fornecedor'),
(150, 'submit', 'Submit', NULL, 'Enviar'),
(151, 'submit_and_add_another', 'Submit And Add Another One', NULL, 'Envie e adicione outro'),
(152, 'add_new_item', 'Add New Item', NULL, 'Adicionar novo item'),
(153, 'manage_your_purchase', 'Manage your purchase', NULL, 'Gerenciar sua compra'),
(154, 'purchase_edit', 'Purchase Edit', NULL, 'Edição de Compra'),
(155, 'purchase_ledger', 'Purchase Ledger', NULL, 'Livro de compras'),
(156, 'invoice_information', 'Sale Information', NULL, 'Informação de venda'),
(157, 'paid_ammount', 'Paid Amount', NULL, 'Quantidade paga'),
(158, 'discount', 'Dis./Pcs.', NULL, 'Des./Pcs.'),
(159, 'save_and_paid', 'Save And Paid', NULL, 'Economize e pague'),
(160, 'payee_name', 'Payee Name', NULL, 'Nome do beneficiário'),
(161, 'manage_your_invoice', 'Manage your Sale', NULL, 'Gerenciar sua venda'),
(162, 'invoice_edit', 'Sale Edit', NULL, 'Edição de venda'),
(163, 'new_pos_invoice', 'New POS Sale', NULL, 'Nova Venda de PDV'),
(164, 'add_new_pos_invoice', 'Add new pos Sale', NULL, 'Adicionar nova venda de PDV'),
(165, 'product_id', 'Product ID', NULL, 'ID do produto'),
(166, 'paid_amount', 'Paid Amount', NULL, 'Quantidade paga'),
(167, 'authorised_by', 'Authorised By', NULL, 'Autorizado por'),
(168, 'checked_by', 'Checked By', NULL, 'Verificado por'),
(169, 'received_by', 'Received By', NULL, 'Recebido por'),
(170, 'prepared_by', 'Prepared By', NULL, 'Preparado por'),
(171, 'memo_no', 'Memo No', NULL, 'Número de memorando'),
(172, 'website', 'Website', NULL, 'Local na rede Internet'),
(173, 'email', 'Email', NULL, 'Email'),
(174, 'invoice_details', 'Sale Details', NULL, 'Detalhes de venda'),
(175, 'reset', 'Reset', NULL, 'Redefinir'),
(176, 'payment_account', 'Payment Account', NULL, 'Conta de pagamento'),
(177, 'bank_name', 'Bank Name', NULL, 'Nome do banco'),
(178, 'cheque_or_pay_order_no', 'Cheque/Pay Order No', NULL, 'Cheque / ordem de pagamento nº'),
(179, 'payment_type', 'Payment Type', NULL, 'Tipo de pagamento'),
(180, 'payment_from', 'Payment From', NULL, 'Pagamento de'),
(181, 'payment_date', 'Payment Date', NULL, 'Data de pagamento'),
(182, 'add_income', 'Add Income', NULL, 'Adicionar renda'),
(183, 'cash', 'Cash', NULL, 'Dinheiro'),
(184, 'cheque', 'Cheque', NULL, 'Verifica'),
(185, 'pay_order', 'Pay Order', NULL, 'Ordem de pagamento'),
(186, 'payment_to', 'Payment To', NULL, 'Pagamento para'),
(187, 'total_outflow_ammount', 'Total Expense Amount', NULL, 'Valor total da despesa'),
(188, 'transections', 'Transections', NULL, 'Transações'),
(189, 'accounts_name', 'Accounts Name', NULL, 'Nome da conta'),
(190, 'outflow_report', 'Expense Report', NULL, 'Relatório de Despesas'),
(191, 'inflow_report', 'Income Report', NULL, 'Relatório de renda'),
(192, 'all', 'All', NULL, 'Todos'),
(193, 'account', 'Account', NULL, 'Conta'),
(194, 'from', 'From', NULL, 'A partir de'),
(195, 'account_summary_report', 'Account Summary Report', NULL, 'Relatório de síntese da conta'),
(196, 'search_by_date', 'Search By Date', NULL, 'Pesquisa por Data'),
(197, 'cheque_no', 'Cheque No', NULL, 'Verifique não'),
(198, 'name', 'Name', NULL, 'Nome'),
(199, 'closing_account', 'Closing Account', NULL, 'Fechando conta'),
(200, 'close_your_account', 'Close your account', NULL, 'Feche sua conta'),
(201, 'last_day_closing', 'Last Day Closing', NULL, 'Fechamento do último dia'),
(202, 'cash_in', 'Cash In', NULL, 'Entrada de dinheiro'),
(203, 'cash_out', 'Cash Out', NULL, 'Sacar'),
(204, 'cash_in_hand', 'Cash In Hand', NULL, 'Dinheiro na mão'),
(205, 'add_new_bank', 'Add New Bank', NULL, 'Adicionar Novo Banco'),
(206, 'day_closing', 'Day Closing', NULL, 'Encerramento do dia'),
(207, 'account_closing_report', 'Account Closing Report', NULL, 'Relatório de encerramento de conta'),
(208, 'last_day_ammount', 'Last Day Amount', NULL, 'Valor do último dia'),
(209, 'adjustment', 'Adjustment', NULL, 'Ajustamento'),
(210, 'pay_type', 'Pay Type', NULL, 'Tipo de Pagamento'),
(211, 'customer_or_supplier', 'Customer,Supplier Or Others', NULL, 'Cliente, fornecedor ou outro'),
(212, 'transection_id', 'Transections ID', NULL, 'ID de Transações'),
(213, 'accounts_summary_report', 'Accounts Summary Report', NULL, 'Relatório de síntese das contas'),
(214, 'bank_list', 'Bank List', NULL, 'Lista de Bancos'),
(215, 'bank_edit', 'Bank Edit', NULL, 'Edição de banco'),
(216, 'debit_plus', 'Debit (+)', NULL, 'Débito (+)'),
(217, 'credit_minus', 'Credit (-)', NULL, 'Crédito (-)'),
(218, 'account_name', 'Account Name', NULL, 'Nome da conta'),
(219, 'account_type', 'Account Type', NULL, 'Tipo de conta'),
(220, 'account_real_name', 'Account Real Name', NULL, 'Nome real da conta'),
(221, 'manage_account', 'Manage Account', NULL, 'Gerenciar conta'),
(222, 'company_name', 'Niha International', NULL, 'Niha International'),
(223, 'edit_your_company_information', 'Edit your company information', NULL, 'Edite as informações da sua empresa'),
(224, 'company_edit', 'Company Edit', NULL, 'Edição da Empresa'),
(225, 'admin', 'Admin', NULL, 'Admin'),
(226, 'user', 'User', NULL, 'Usuário'),
(227, 'password', 'Password', NULL, 'Senha'),
(228, 'last_name', 'Last Name', NULL, 'Último nome'),
(229, 'first_name', 'First Name', NULL, 'Primeiro nome'),
(230, 'add_new_user_information', 'Add new user information', NULL, 'Adicionar novas informações do usuário'),
(231, 'user_type', 'User Type', NULL, 'Tipo de usuário'),
(232, 'user_edit', 'User Edit', NULL, 'Edição do usuário'),
(233, 'rtr', 'RTR', NULL, 'RTR'),
(234, 'ltr', 'LTR', NULL, 'LTR'),
(235, 'ltr_or_rtr', 'LTR/RTR', NULL, 'LTR/RTR'),
(236, 'footer_text', 'Footer Text', NULL, 'Texto de rodapé'),
(237, 'favicon', 'Favicon', NULL, 'Favicon'),
(238, 'logo', 'Logo', NULL, 'Logotipo'),
(239, 'update_setting', 'Update Setting', NULL, 'Configuração de atualização'),
(240, 'update_your_web_setting', 'Update your web setting', NULL, 'Atualize sua configuração da web'),
(241, 'login', 'Login', NULL, 'Conecte-se'),
(242, 'your_strong_password', 'Your strong password', NULL, 'Sua senha forte'),
(243, 'your_unique_email', 'Your unique email', NULL, 'Seu e-mail único'),
(244, 'please_enter_your_login_information', 'Please enter your login information.', NULL, 'Por favor digite suas informações de login.'),
(245, 'update_profile', 'Update Profile', NULL, 'Atualizar perfil'),
(246, 'your_profile', 'Your Profile', NULL, 'Seu perfil'),
(247, 're_type_password', 'Re-Type Password', NULL, 'Digite novamente a senha'),
(248, 'new_password', 'New Password', NULL, 'Nova Senha'),
(249, 'old_password', 'Old Password', NULL, 'Senha Antiga'),
(250, 'new_information', 'New Information', NULL, 'Nova informação'),
(251, 'old_information', 'Old Information', NULL, 'Informações Antigas'),
(252, 'change_your_information', 'Change your information', NULL, 'Mude suas informações'),
(253, 'change_your_profile', 'Change your profile', NULL, 'Mude o seu perfil'),
(254, 'profile', 'Profile', NULL, 'Perfil'),
(255, 'wrong_username_or_password', 'Wrong User Name Or Password !', NULL, 'Nome de usuário ou senha incorretos!'),
(256, 'successfully_updated', 'Successfully Updated.', NULL, 'Atualizado com sucesso.'),
(257, 'blank_field_does_not_accept', 'Blank Field Does Not Accept !', NULL, 'O campo em branco não aceita!'),
(258, 'successfully_changed_password', 'Successfully changed password.', NULL, 'Senha alterada com sucesso.'),
(259, 'you_are_not_authorised_person', 'You are not authorised person !', NULL, 'Você não é uma pessoa autorizada!'),
(260, 'password_and_repassword_does_not_match', 'Passwor and re-password does not match !', NULL, 'A senha e a nova senha não correspondem!'),
(261, 'new_password_at_least_six_character', 'New Password At Least 6 Character.', NULL, 'Nova senha de no mínimo 6 caracteres.'),
(262, 'you_put_wrong_email_address', 'You put wrong email address !', NULL, 'Você colocou o endereço de e-mail errado!'),
(263, 'cheque_ammount_asjusted', 'Cheque amount adjusted.', NULL, 'Verifique o valor ajustado.'),
(264, 'successfully_payment_paid', 'Successfully Payment Paid.', NULL, 'Pagamento pago com sucesso.'),
(265, 'successfully_added', 'Successfully Added.', NULL, 'Adicionado com sucesso.'),
(266, 'successfully_updated_2_closing_ammount_not_changeale', 'Successfully Updated -2. Note: Closing Amount Not Changeable.', NULL, 'Atualizado com sucesso -2. Nota: Valor de fechamento não alterável.'),
(267, 'successfully_payment_received', 'Successfully Payment Received.', NULL, 'Pagamento recebido com sucesso.'),
(268, 'already_inserted', 'Already Inserted !', NULL, 'Já inserido!'),
(269, 'successfully_delete', 'Successfully Delete.', NULL, 'Excluído com sucesso.'),
(270, 'successfully_created', 'Successfully Created.', NULL, 'Criado com sucesso.'),
(271, 'logo_not_uploaded', 'Logo not uploaded !', NULL, 'Logotipo não carregado!'),
(272, 'favicon_not_uploaded', 'Favicon not uploaded !', NULL, 'Favicon não carregado!'),
(273, 'supplier_mobile', 'Supplier Mobile', NULL, 'Fornecedor Móvel'),
(274, 'supplier_address', 'Supplier Address', NULL, 'Endereço do fornecedor'),
(275, 'supplier_details', 'Supplier Details', NULL, 'Detalhes do fornecedor'),
(276, 'add_new_supplier', 'Add New Supplier', NULL, 'Adicionar Novo Fornecedor'),
(277, 'manage_suppiler', 'Manage Supplier', NULL, 'Gerenciar Fornecedor'),
(278, 'manage_your_supplier', 'Manage your supplier', NULL, 'Gerencie seu fornecedor'),
(279, 'manage_supplier_ledger', 'Manage supplier ledger', NULL, 'Gerenciar livro-razão de fornecedores'),
(280, 'invoice_id', 'Invoice ID', NULL, 'ID da fatura'),
(281, 'deposite_id', 'Deposite ID', NULL, 'ID de depósito'),
(282, 'supplier_actual_ledger', 'Supplier Payment Ledger', NULL, 'Livro de pagamento de fornecedores'),
(283, 'supplier_information', 'Supplier Information', NULL, 'Informação do fornecedor'),
(284, 'event', 'Event', NULL, 'Evento'),
(285, 'add_new_income', 'Add New Income', NULL, 'Adicionar nova renda'),
(286, 'add_expese', 'Add Expense', NULL, 'Adicionar Despesa'),
(287, 'add_new_expense', 'Add New Expense', NULL, 'Adicionar nova despesa'),
(288, 'total_inflow_ammount', 'Total Income Amount', NULL, 'Valor da receita total'),
(289, 'create_new_invoice', 'Create New Sale', NULL, 'Criar nova venda'),
(290, 'create_pos_invoice', 'Create POS Sale', NULL, 'Criar venda de PDV'),
(291, 'total_profit', 'Total Profit', NULL, 'Lucro total'),
(292, 'monthly_progress_report', 'Monthly Progress Report', NULL, 'Relatório Mensal de Progresso'),
(293, 'total_invoice', 'Total Sale', NULL, 'Venda Total'),
(294, 'account_summary', 'Account Summary', NULL, 'Resumo da conta'),
(295, 'total_supplier', 'Total Supplier', NULL, 'Fornecedor Total'),
(296, 'total_product', 'Total Product', NULL, 'Produto Total'),
(297, 'total_customer', 'Total Customer', NULL, 'Cliente Total'),
(298, 'supplier_edit', 'Supplier Edit', NULL, 'Edição de fornecedor'),
(299, 'add_new_invoice', 'Add New Sale', NULL, 'Adicionar nova venda'),
(300, 'add_new_purchase', 'Add new purchase', NULL, 'Adicionar nova compra'),
(301, 'currency', 'Currency', NULL, 'Moeda'),
(302, 'currency_position', 'Currency Position', NULL, 'Posição da moeda'),
(303, 'left', 'Left', NULL, 'Esquerdo'),
(304, 'right', 'Right', NULL, 'Certo'),
(305, 'add_tax', 'Add Tax', NULL, 'Adicionar imposto'),
(306, 'manage_tax', 'Manage Tax', NULL, 'Gerenciar impostos'),
(307, 'add_new_tax', 'Add new tax', NULL, 'Adicionar novo imposto'),
(308, 'enter_tax', 'Enter Tax', NULL, 'Insira o imposto'),
(309, 'already_exists', 'Already Exists !', NULL, 'Já existe !'),
(310, 'successfully_inserted', 'Successfully Inserted.', NULL, 'Inserido com sucesso.'),
(311, 'tax', 'Tax', NULL, 'Imposto'),
(312, 'tax_edit', 'Tax Edit', NULL, 'Edição de imposto'),
(313, 'product_not_added', 'Product not added !', NULL, 'Produto não adicionado!'),
(314, 'total_tax', 'Total Tax', NULL, 'Taxa total'),
(315, 'manage_your_supplier_details', 'Manage your supplier details.', NULL, 'Gerencie os detalhes de seu fornecedor.'),
(316, 'invoice_description', 'Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy', NULL, 'Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy'),
(317, 'thank_you_for_choosing_us', 'Thank you very much for choosing us.', NULL, 'Muito obrigado por nos escolher.'),
(318, 'billing_date', 'Billing Date', NULL, 'Data de cobrança'),
(319, 'billing_to', 'Billing To', NULL, 'Faturamento para'),
(320, 'billing_from', 'Billing From', NULL, 'Faturamento de'),
(321, 'you_cant_delete_this_product', 'Sorry !!  You can\'t delete this product.This product already used in calculation system!', NULL, 'Desculpa !! Você não pode excluir este produto. Este produto já é usado no sistema de cálculo!'),
(322, 'old_customer', 'Old Customer', NULL, 'Cliente Antigo'),
(323, 'new_customer', 'New Customer', NULL, 'Novo cliente'),
(324, 'new_supplier', 'New Supplier', NULL, 'Novo fornecedor'),
(325, 'old_supplier', 'Old Supplier', NULL, 'Fornecedor Antigo'),
(326, 'credit_customer', 'Credit Customer', NULL, 'Cliente de Crédito'),
(327, 'account_already_exists', 'This Account Already Exists !', NULL, 'Esta conta já existe!'),
(328, 'edit_income', 'Edit Income', NULL, 'Editar renda'),
(329, 'you_are_not_access_this_part', 'You are not authorised person !', NULL, 'Você não é uma pessoa autorizada!'),
(330, 'account_edit', 'Account Edit', NULL, 'Edição de contas'),
(331, 'due', 'Due', NULL, 'Dívida'),
(332, 'expense_edit', 'Expense Edit', NULL, 'Edição de despesas'),
(333, 'please_select_customer', 'Please select customer !', NULL, 'Selecione o cliente!'),
(334, 'profit_report', 'Profit Report (Sale Wise)', NULL, 'Relatório de lucro (venda inteligente)'),
(335, 'total_profit_report', 'Total profit report', NULL, 'Relatório de lucro total'),
(336, 'please_enter_valid_captcha', 'Please enter valid captcha.', NULL, 'Insira um captcha válido.'),
(337, 'category_not_selected', 'Category not selected.', NULL, 'Categoria não selecionada.'),
(338, 'supplier_not_selected', 'Supplier not selected.', NULL, 'Fornecedor não selecionado.'),
(339, 'please_select_product', 'Please select product.', NULL, 'Selecione o produto.'),
(340, 'product_model_already_exist', 'Product model already exist !', NULL, 'O modelo do produto já existe!'),
(341, 'invoice_logo', 'Sale Logo', NULL, 'Logotipo de venda'),
(342, 'available_qnty', 'Av. Qnty.', NULL, 'Qnt. Disp.'),
(343, 'you_can_not_buy_greater_than_available_cartoon', 'You can not select grater than available cartoon !', NULL, 'Você não pode selecionar um desenho maior que o disponível!'),
(344, 'customer_details', 'Customer details', NULL, 'Detalhes do cliente'),
(345, 'manage_customer_details', 'Manage customer details.', NULL, 'Gerenciar detalhes do cliente.'),
(346, 'site_key', 'Captcha Site Key', NULL, 'Captcha Site Key'),
(347, 'secret_key', 'Captcha Secret Key', NULL, 'Chave Secreta Captcha'),
(348, 'captcha', 'Captcha', NULL, 'CAPTCHA'),
(349, 'cartoon_quantity', 'Cartoon Quantity', NULL, 'Quantidade de Desenhos'),
(350, 'total_cartoon', 'Total Cartoon', NULL, 'Total Desenho animado'),
(351, 'cartoon', 'Cartoon', NULL, 'Desenho animado'),
(352, 'item_cartoon', 'Item/Cartoon', NULL, 'Item / desenho animado'),
(353, 'product_and_supplier_did_not_match', 'Product and supplier did not match !', NULL, 'Produto e fornecedor não combinam!'),
(354, 'if_you_update_purchase_first_select_supplier_then_product_and_then_quantity', 'If you update purchase,first select supplier then product and then update qnty.', NULL, 'Se você atualizar a compra, primeiro selecione o fornecedor, depois o produto e, a seguir, atualize o qnt.'),
(355, 'item', 'Item', NULL, 'Item'),
(356, 'manage_your_credit_customer', 'Manage your credit customer', NULL, 'Gerenciar seu cliente de crédito'),
(357, 'total_quantity', 'Total Quantity', NULL, 'Quantidade total'),
(358, 'quantity_per_cartoon', 'Quantity per cartoon', NULL, 'Quantidade por desenho animado'),
(359, 'barcode_qrcode_scan_here', 'Barcode or QR-code scan here', NULL, 'Leitura de código de barras ou código QR aqui'),
(360, 'synchronizer_setting', 'Synchronizer Setting', NULL, 'Configuração do sincronizador'),
(361, 'data_synchronizer', 'Data Synchronizer', NULL, 'Sincronizador de Dados'),
(362, 'hostname', 'Host name', NULL, 'Nome da hospedagem'),
(363, 'username', 'User Name', NULL, 'Nome do usuário'),
(364, 'ftp_port', 'FTP Port', NULL, 'Porta FTP'),
(365, 'ftp_debug', 'FTP Debug', NULL, 'Depurar FTP'),
(366, 'project_root', 'Project Root', NULL, 'Raiz do Projeto'),
(367, 'please_try_again', 'Please try again', NULL, 'Por favor, tente novamente'),
(368, 'save_successfully', 'Save successfully', NULL, 'Salvo com sucesso'),
(369, 'synchronize', 'Synchronize', NULL, 'Sincronizar'),
(370, 'internet_connection', 'Internet Connection', NULL, 'Conexão de internet'),
(371, 'outgoing_file', 'Outgoing File', NULL, 'Arquivo de Saída'),
(372, 'incoming_file', 'Incoming File', NULL, 'Arquivo de entrada'),
(373, 'ok', 'Ok', NULL, 'Ok'),
(374, 'not_available', 'Not Available', NULL, 'Não disponível'),
(375, 'available', 'Available', NULL, 'Disponível'),
(376, 'download_data_from_server', 'Download data from server', NULL, 'Baixar dados do servidor'),
(377, 'data_import_to_database', 'Data import to database', NULL, 'Importação de dados para banco de dados'),
(378, 'data_upload_to_server', 'Data uplod to server', NULL, 'Upload de dados para o servidor'),
(379, 'please_wait', 'Please Wait', NULL, 'Por favor, aguarde'),
(380, 'ooops_something_went_wrong', 'Oooops Something went wrong !', NULL, 'Oooops. Algo deu errado!'),
(381, 'upload_successfully', 'Upload successfully', NULL, 'Upload com sucesso'),
(382, 'unable_to_upload_file_please_check_configuration', 'Unable to upload file please check configuration', NULL, 'Não é possível fazer upload do arquivo, verifique a configuração'),
(383, 'please_configure_synchronizer_settings', 'Please configure synchronizer settings', NULL, 'Por favor, defina as configurações do sincronizador'),
(384, 'download_successfully', 'Download successfully', NULL, 'Download com sucesso'),
(385, 'unable_to_download_file_please_check_configuration', 'Unable to download file please check configuration', NULL, 'Não foi possível baixar o arquivo, verifique a configuração'),
(386, 'data_import_first', 'Data import past', NULL, 'Importação de dados anterior'),
(387, 'data_import_successfully', 'Data import successfully', NULL, 'Importação de dados com sucesso'),
(388, 'unable_to_import_data_please_check_config_or_sql_file', 'Unable to import data please check config or sql file', NULL, 'Não é possível importar os dados, verifique o arquivo de configuração ou sql'),
(389, 'total_sale_ctn', 'Total Sale Ctn', NULL, 'Ctn de venda total'),
(390, 'in_qnty', 'In Qnty.', NULL, 'Em Qtd.'),
(391, 'out_qnty', 'Out Qnty.', NULL, 'Saída Qtd.'),
(392, 'stock_report_supplier_wise', 'Stock Report (Supplier Wise)', NULL, 'Relatório de estoque (fornecedor sábio)'),
(393, 'all_stock_report_supplier_wise', 'Stock Report (Suppler Wise)', NULL, 'Relatório de estoque (Suppler Wise)'),
(394, 'select_supplier', 'Select Supplier', NULL, 'Selecione o fornecedor'),
(395, 'stock_report_product_wise', 'Stock Report (Product Wise)', NULL, 'Relatório de estoque (produto sábio)'),
(396, 'phone', 'Phone', NULL, 'Telefone'),
(397, 'select_product', 'Select Product', NULL, 'Selecione o produto'),
(398, 'in_quantity', 'In Qnty.', NULL, 'Em Qtd.'),
(399, 'out_quantity', 'Out Qnty.', NULL, 'Saída Qtd.'),
(400, 'in_taka', 'In TK.', NULL, 'Em TK'),
(401, 'out_taka', 'Out TK.', NULL, 'Saída TK.'),
(402, 'commission', 'Commission', NULL, 'Comissão'),
(403, 'generate_commission', 'Generate Commssion', NULL, 'Gerar Comissão'),
(404, 'commission_rate', 'Commission Rate', NULL, 'Taxa de comissão'),
(405, 'total_ctn', 'Total Ctn.', NULL, 'Total Ctn.'),
(406, 'per_pcs_commission', 'Per PCS Commission', NULL, 'Por Comissão PCS'),
(407, 'total_commission', 'Total Commission', NULL, 'Comissão Total'),
(408, 'enter', 'Enter', NULL, 'Digitar'),
(409, 'please_add_walking_customer_for_default_customer', 'Please add \'Walking Customer\' for default customer.', NULL, 'Adicione \'Cliente ambulante\' para o cliente padrão.'),
(410, 'supplier_ammount', 'Supplier Amount', NULL, 'Quantidade do fornecedor'),
(411, 'my_sale_ammount', 'My Sale Amount', NULL, 'Meu valor de venda'),
(412, 'signature_pic', 'Signature Picture', NULL, 'Foto de Assinatura'),
(413, 'branch', 'Branch', NULL, 'Filial'),
(414, 'ac_no', 'A/C Number', NULL, 'A/C Número'),
(415, 'ac_name', 'A/C Name', NULL, 'A/C Nome'),
(416, 'bank_transaction', 'Bank Transaction', NULL, 'Transação bancária'),
(417, 'bank', 'Bank', NULL, 'Banco'),
(418, 'withdraw_deposite_id', 'Withdraw / Deposite ID', NULL, 'ID de retirada / depósito'),
(419, 'bank_ledger', 'Bank Ledger', NULL, 'Livro Razão'),
(420, 'note_name', 'Note Name', NULL, 'Nome da Nota'),
(421, 'pcs', 'Pcs.', NULL, 'Pcs.'),
(422, '1', '1', NULL, '1'),
(423, '2', '2', NULL, '2'),
(424, '5', '5', NULL, '5'),
(425, '10', '10', NULL, '10'),
(426, '20', '20', NULL, '20'),
(427, '50', '50', NULL, '50'),
(428, '100', '100', NULL, '100'),
(429, '500', '500', NULL, '500'),
(430, '1000', '1000', NULL, '1000'),
(431, 'total_discount', 'Total Discount', NULL, 'Desconto Total'),
(432, 'product_not_found', 'Product not found !', NULL, 'Produto não encontrado !'),
(433, 'this_is_not_credit_customer', 'This is not credit customer !', NULL, 'Este não é um cliente de crédito!'),
(434, 'personal_loan', 'Personal Loan', NULL, 'Empréstimo pessoal'),
(435, 'add_person', 'Add Person', NULL, 'Adicionar Pessoa'),
(436, 'add_loan', 'Add Loan', NULL, 'Adicionar empréstimo'),
(437, 'add_payment', 'Add Payment', NULL, 'Adicionar Pagamento'),
(438, 'manage_person', 'Manage Person', NULL, 'Gerenciar Pessoa'),
(439, 'personal_edit', 'Person Edit', NULL, 'Edição de Pessoa'),
(440, 'person_ledger', 'Person Ledger', NULL, 'Razão de Pessoa'),
(441, 'backup_restore', 'Backup ', NULL, 'Cópia de segurança'),
(442, 'database_backup', 'Database backup', NULL, 'Backup de banco de dados'),
(443, 'file_information', 'File information', NULL, 'Informação do arquivo'),
(444, 'filename', 'Filename', NULL, 'Nome do arquivo'),
(445, 'size', 'Size', NULL, 'Tamanho'),
(446, 'backup_date', 'Backup date', NULL, 'Data de backup'),
(447, 'backup_now', 'Backup now', NULL, 'Faça backup agora'),
(448, 'restore_now', 'Restore now', NULL, 'Restaurar agora'),
(449, 'are_you_sure', 'Are you sure ?', NULL, 'Tem certeza ?'),
(450, 'download', 'Download', NULL, 'Download'),
(451, 'backup_and_restore', 'Backup', NULL, 'Cópia de segurança'),
(452, 'backup_successfully', 'Backup successfully', NULL, 'Backup com sucesso'),
(453, 'delete_successfully', 'successfully Deleted', NULL, 'Excluído com sucesso'),
(454, 'stock_ctn', 'Stock/Qnt', NULL, 'Estoque / Qnt'),
(455, 'unit', 'Unit', NULL, 'Unidade'),
(456, 'meter_m', 'Meter (M)', NULL, 'Medidor (M)'),
(457, 'piece_pc', 'Piece (Pc)', NULL, 'Peça (Pc)'),
(458, 'kilogram_kg', 'Kilogram (Kg)', NULL, 'Kilogram (Kg)'),
(459, 'stock_cartoon', 'Stock Cartoon', NULL, 'Estoque Desenho'),
(460, 'add_product_csv', 'Add Product (CSV)', NULL, 'Adicionar produto (CSV)'),
(461, 'import_product_csv', 'Import product (CSV)', NULL, 'Importar produto (CSV)'),
(462, 'close', 'Close', NULL, 'Fechar'),
(463, 'download_example_file', 'Download example file.', NULL, 'Baixe o arquivo de exemplo.'),
(464, 'upload_csv_file', 'Upload CSV File', NULL, 'Carregar arquivo CSV'),
(465, 'csv_file_informaion', 'CSV File Information', NULL, 'Informações do arquivo CSV'),
(466, 'out_of_stock', 'Out Of Stock', NULL, 'Fora de estoque'),
(467, 'others', 'Others', NULL, 'Outros'),
(468, 'full_paid', 'Full Paid', NULL, 'Totalmente Pago'),
(469, 'successfully_saved', 'Your Data Successfully Saved', NULL, 'Seus dados salvos com sucesso'),
(470, 'manage_loan', 'Manage Loan', NULL, 'Gerenciar Empréstimo'),
(471, 'receipt', 'Receipt', NULL, 'Recibo'),
(472, 'payment', 'Payment', NULL, 'Pagamento'),
(473, 'cashflow', 'Daily Cash Flow', NULL, 'Fluxo de caixa diário'),
(474, 'signature', 'Signature', NULL, 'Assinatura'),
(475, 'supplier_reports', 'Supplier Reports', NULL, 'Relatórios de fornecedores'),
(476, 'generate', 'Generate', NULL, 'Gerar'),
(477, 'todays_overview', 'Todays Overview', NULL, 'Visão geral de hoje'),
(478, 'last_sales', 'Last Sales', NULL, 'Últimas Vendas'),
(479, 'manage_transaction', 'Manage Transaction', NULL, 'Gerenciar transação'),
(480, 'daily_summary', 'Daily Summary', NULL, 'Resumo diário'),
(481, 'daily_cash_flow', 'Daily Cash Flow', NULL, 'Fluxo de caixa diário'),
(482, 'custom_report', 'Custom Report', NULL, 'Relatório Personalizado'),
(483, 'transaction', 'Transaction', NULL, 'Transação'),
(484, 'receipt_amount', 'Receipt Amount', NULL, 'Valor do recibo'),
(485, 'transaction_details_datewise', 'Transaction Details Datewise', NULL, 'Detalhes da transação em relação à data'),
(486, 'cash_closing', 'Cash Closing', NULL, 'Fechamento de caixa'),
(487, 'you_can_not_buy_greater_than_available_qnty', 'You can not buy greater than available qnty.', NULL, 'Você não pode comprar mais do que qntd disponível.'),
(488, 'supplier_id', 'Supplier ID', NULL, 'Identificação do Fornecedor'),
(489, 'category_id', 'Category ID', NULL, 'Categoria ID'),
(490, 'select_report', 'Select Report', NULL, 'Selecione Relatório'),
(491, 'supplier_summary', 'Supplier summary', NULL, 'Resumo do fornecedor'),
(492, 'sales_payment_actual', 'Sales payment actual', NULL, 'Pagamento de vendas real'),
(493, 'today_already_closed', 'Today already closed.', NULL, 'Hoje já fechou.'),
(494, 'root_account', 'Root Account', NULL, 'Conta Root'),
(495, 'office', 'Office', NULL, 'Escritório'),
(496, 'loan', 'Loan', NULL, 'Empréstimo'),
(497, 'transaction_mood', 'Transaction Mood', NULL, 'Modo de transação'),
(498, 'select_account', 'Select Account', NULL, 'Selecione a conta'),
(499, 'add_receipt', 'Add Receipt', NULL, 'Adicionar Recibo'),
(500, 'update_transaction', 'Update Transaction', NULL, 'Transação de atualização'),
(501, 'no_stock_found', 'No Stock Found !', NULL, 'Nenhum estoque encontrado!'),
(502, 'admin_login_area', 'Admin Login Area', NULL, 'Área de login do administrador'),
(503, 'print_qr_code', 'Print QR Code', NULL, 'Imprimir código QR'),
(504, 'discount_type', 'Discount Type', NULL, 'Tipo de Desconto'),
(505, 'discount_percentage', 'Discount', NULL, 'Desconto'),
(506, 'fixed_dis', 'Fixed Dis.', NULL, 'Des. Fixo'),
(507, 'return', 'Return', NULL, 'Devolução'),
(508, 'stock_return_list', 'Stock Return List', NULL, 'Lista de Devolução de Estoque'),
(509, 'wastage_return_list', 'Wastage Return List', NULL, 'Lista de Devolução de Resíduos'),
(510, 'return_invoice', 'Sale Return', NULL, 'Devolução de venda'),
(511, 'sold_qty', 'Sold Qty', NULL, 'Qtd vendida'),
(512, 'ret_quantity', 'Return Qty', NULL, 'Devolução Qtd.'),
(513, 'deduction', 'Deduction', NULL, 'Dedução'),
(514, 'check_return', 'Check Return', NULL, 'Verificar devolução'),
(515, 'reason', 'Reason', NULL, 'Razão'),
(516, 'usablilties', 'Usability', NULL, 'Usabilidade'),
(517, 'adjs_with_stck', 'Adjust With Stock', NULL, 'Ajustar com estoque'),
(518, 'return_to_supplier', 'Return To Supplier', NULL, 'Devolver ao fornecedor'),
(519, 'wastage', 'Wastage', NULL, 'Desperdício'),
(520, 'to_deduction', 'Total Deduction ', NULL, 'Dedução total'),
(521, 'nt_return', 'Net Return Amount', NULL, 'Valor líquido de retorno'),
(522, 'return_list', 'Return List', NULL, 'Lista de Devolução'),
(523, 'add_return', 'Add Return', NULL, 'Adicionar Devolução'),
(524, 'per_qty', 'Purchase Qty', NULL, 'Comprar Qtd'),
(525, 'return_supplier', 'Supplier Return', NULL, 'Devolução de fornecedor'),
(526, 'stock_purchase', 'Stock Purchase Price', NULL, 'Preço de compra de ações'),
(527, 'stock_sale', 'Stock Sale Price', NULL, 'Preço de venda de ações'),
(528, 'supplier_return', 'Supplier Return', NULL, 'Devolução de fornecedor'),
(529, 'purchase_id', 'Purchase ID', NULL, 'ID de compra'),
(530, 'return_id', 'Return ID', NULL, 'ID de devolução'),
(531, 'supplier_return_list', 'Supplier Return List', NULL, 'Lista de Devolução de Fornecedores'),
(532, 'c_r_slist', 'Stock Return Stock', NULL, 'Estoque de Devolução de Estoque'),
(533, 'wastage_list', 'Wastage List', NULL, 'Lista de Desperdícios'),
(534, 'please_input_correct_invoice_id', 'Please Input a Correct Sale ID', NULL, 'Insira um ID de venda correto'),
(535, 'please_input_correct_purchase_id', 'Please Input Your Correct  Purchase ID', NULL, 'Insira sua ID de compra correta'),
(536, 'add_more', 'Add More', NULL, 'Adicione mais'),
(537, 'prouct_details', 'Product Details', NULL, 'Detalhes do produto'),
(538, 'prouct_detail', 'Product Details', NULL, 'Detalhes do produto'),
(539, 'stock_return', 'Stock Return', NULL, 'Retorno das ações'),
(540, 'choose_transaction', 'Select Transaction', NULL, 'Selecione a transação'),
(541, 'transection_category', 'Select  Category', NULL, 'Selecione a Categoria'),
(542, 'transaction_categry', 'Select Category', NULL, 'Selecione a Categoria'),
(543, 'search_supplier', 'Search Supplier', NULL, 'Fornecedor de pesquisa'),
(544, 'customer_id', 'Customer ID', NULL, 'Identificação do Cliente'),
(545, 'search_customer', 'Search Customer Invoice', NULL, 'Pesquisar fatura do cliente'),
(546, 'serial_no', 'SN', NULL, 'SN'),
(547, 'item_discount', 'Item Discount', NULL, 'Desconto de item'),
(548, 'invoice_discount', 'Sale Discount', NULL, 'Desconto de venda'),
(549, 'add_unit', 'Add Unit', NULL, 'Adicionar Unidade'),
(550, 'manage_unit', 'Manage Unit', NULL, 'Gerenciar Unidade'),
(551, 'add_new_unit', 'Add New Unit', NULL, 'Adicionar nova unidade'),
(552, 'unit_name', 'Unit Name', NULL, 'Nome da Unidade'),
(553, 'payment_amount', 'Payment Amount', NULL, 'Valor de Pagamento'),
(554, 'manage_your_unit', 'Manage Your Unit', NULL, 'Gerencie sua unidade'),
(555, 'unit_id', 'Unit ID', NULL, 'ID da unidade'),
(556, 'unit_edit', 'Unit Edit', NULL, 'Edição de Unidade'),
(557, 'vat', 'Vat', NULL, 'Vat'),
(558, 'sales_report_category_wise', 'Sales Report (Category wise)', NULL, 'Relatório de vendas (categoria sábia)'),
(559, 'purchase_report_category_wise', 'Purchase Report (Category wise)', NULL, 'Relatório de compra (categoria sábia)'),
(560, 'category_wise_purchase_report', 'Category wise purchase report', NULL, 'Relatório de compra inteligente da categoria'),
(561, 'category_wise_sales_report', 'Category wise sales report', NULL, 'Relatório de vendas inteligente da categoria'),
(562, 'best_sale_product', 'Best Sale Product', NULL, 'Melhor Produto de Venda'),
(563, 'all_best_sales_product', 'All Best Sales Products', NULL, 'Todos os melhores produtos de vendas'),
(564, 'todays_customer_receipt', 'Todays Customer Receipt', NULL, 'Recibo do cliente de hoje'),
(565, 'not_found', 'Record not found', NULL, 'Registro não encontrado'),
(566, 'collection', 'Collection', NULL, 'Coleção'),
(567, 'increment', 'Increment', NULL, 'Incremento'),
(568, 'accounts_tree_view', 'Accounts Tree View', NULL, 'Vista da árvore das contas'),
(569, 'debit_voucher', 'Debit Voucher', NULL, 'Comprovante de Débito'),
(570, 'voucher_no', 'Voucher No', NULL, 'Comprovante N'),
(571, 'credit_account_head', 'Credit Account Head', NULL, 'Chefe da conta de crédito'),
(572, 'remark', 'Remark', NULL, 'Observação'),
(573, 'code', 'Code', NULL, 'Código'),
(574, 'amount', 'Amount', NULL, 'Quantia'),
(575, 'approved', 'Approved', NULL, 'Aprovado'),
(576, 'debit_account_head', 'Debit Account Head', NULL, 'Cabeça de conta de débito'),
(577, 'credit_voucher', 'Credit Voucher', NULL, 'Comprovante de crédito'),
(578, 'find', 'Find', NULL, 'Achar'),
(579, 'transaction_date', 'Transaction Date', NULL, 'Data de Transação'),
(580, 'voucher_type', 'Voucher Type', NULL, 'Tipo de Comprovante'),
(581, 'particulars', 'Particulars', NULL, 'Características'),
(582, 'with_details', 'With Details', NULL, 'Com detalhes'),
(583, 'general_ledger', 'General Ledger', NULL, 'Contabilidade geral'),
(584, 'general_ledger_of', 'General ledger of', NULL, 'Razão geral de'),
(585, 'pre_balance', 'Pre Balance', NULL, 'Pré-Balanço'),
(586, 'current_balance', 'Current Balance', NULL, 'Saldo Atual'),
(587, 'to_date', 'To Date', NULL, 'Até a presente data'),
(588, 'from_date', 'From Date', NULL, 'Da data'),
(589, 'trial_balance', 'Trial Balance', NULL, 'Balancete'),
(590, 'authorized_signature', 'Authorized Signature', NULL, 'Assinatura autorizada'),
(591, 'chairman', 'Chairman', NULL, 'Presidente'),
(592, 'total_income', 'Total Income', NULL, 'Renda total'),
(593, 'statement_of_comprehensive_income', 'Statement of Comprehensive Income', NULL, 'Demonstração do resultado abrangente'),
(594, 'profit_loss', 'Profit Loss', NULL, 'Perda de lucro'),
(595, 'cash_flow_report', 'Cash Flow Report', NULL, 'Relatório de fluxo de caixa'),
(596, 'cash_flow_statement', 'Cash Flow Statement', NULL, 'Demonstração de fluxo de caixa'),
(597, 'amount_in_dollar', 'Amount In Dollar', NULL, 'Quantidade em dólares'),
(598, 'opening_cash_and_equivalent', 'Opening Cash and Equivalent', NULL, 'Caixa de Abertura e Equivalente'),
(599, 'coa_print', 'Coa Print', NULL, 'Coa Imprimir'),
(600, 'cash_flow', 'Cash Flow', NULL, 'Fluxo de caixa'),
(601, 'cash_book', 'Cash Book', NULL, 'Livro caixa'),
(602, 'bank_book', 'Bank Book', NULL, 'Caderneta bancária'),
(603, 'c_o_a', 'Chart of Account', NULL, 'Plano de Contas'),
(604, 'journal_voucher', 'Journal Voucher', NULL, 'Comprovante de diário'),
(605, 'contra_voucher', 'Contra Voucher', NULL, 'Comprovante'),
(606, 'voucher_approval', 'Vouchar Approval', NULL, 'Comprovante de aprovação'),
(607, 'supplier_payment', 'Supplier Payment', NULL, 'Pagamento de Fornecedor'),
(608, 'customer_receive', 'Customer Receive', NULL, 'Cliente Recebe'),
(609, 'gl_head', 'General Head', NULL, 'Chefe Geral'),
(610, 'account_code', 'Account Head', NULL, 'Chefe de conta'),
(611, 'opening_balance', 'Opening Balance', NULL, 'Saldo inicial'),
(612, 'head_of_account', 'Head of Account', NULL, 'Chefe de Conta'),
(613, 'inventory_ledger', 'Inventory Ledger', NULL, 'Livro de inventário'),
(614, 'newpassword', 'New Password', NULL, 'Nova Senha'),
(615, 'password_recovery', 'Password Recovery', NULL, 'Recuperação de senha'),
(616, 'forgot_password', 'Forgot Password ??', NULL, 'Esqueceu sua senha ??'),
(617, 'send', 'Send', NULL, 'Enviar'),
(618, 'due_report', 'Due Report', NULL, 'Relatório de Vencimento'),
(619, 'due_amount', 'Due Amount', NULL, 'Valor devido'),
(620, 'download_sample_file', 'Download Sample File', NULL, 'Baixar arquivo de amostra'),
(621, 'customer_csv_upload', 'Customer Csv Upload', NULL, 'Upload de Csv do Cliente'),
(622, 'csv_supplier', 'Csv Upload Supplier', NULL, 'Fornecedor de upload de Csv'),
(623, 'csv_upload_supplier', 'Csv Upload Supplier', NULL, 'Fornecedor de upload de Csv'),
(624, 'previous', 'Previous', NULL, 'Anterior'),
(625, 'net_total', 'Net Total', NULL, 'Total Líquido'),
(626, 'currency_list', 'Currency List', NULL, 'Lista de Moedas'),
(627, 'currency_name', 'Currency Name', NULL, 'Currency Name'),
(628, 'currency_icon', 'Currency Symbol', NULL, 'Símbolo da Moeda'),
(629, 'add_currency', 'Add Currency', NULL, 'Adicionar Moeda'),
(630, 'role_permission', 'Role Permission', NULL, 'Permissão de função'),
(631, 'role_list', 'Role List', NULL, 'Lista de Funções'),
(632, 'user_assign_role', 'User Assign Role', NULL, 'Atribuição de função de usuário'),
(633, 'permission', 'Permission', NULL, 'Permissão'),
(634, 'add_role', 'Add Role', NULL, 'Adicionar papel'),
(635, 'add_module', 'Add Module', NULL, 'Adicionar Módulo'),
(636, 'module_name', 'Module Name', NULL, 'Nome do módulo'),
(637, 'office_loan', 'Office Loan', NULL, 'Empréstimo de escritório'),
(638, 'add_menu', 'Add Menu', NULL, 'Adicionar Menu'),
(639, 'menu_name', 'Menu Name', NULL, 'Nome do Menu'),
(640, 'sl_no', 'Sl No', NULL, 'Sl No'),
(641, 'create', 'Create', NULL, 'Criar'),
(642, 'read', 'Read', NULL, 'Leitura'),
(643, 'role_name', 'Role Name', NULL, 'Nome do papel'),
(644, 'qty', 'Quantity', NULL, 'Quantitd'),
(645, 'max_rate', 'Max Rate', NULL, 'Taxa máxima'),
(646, 'min_rate', 'Min Rate', NULL, 'Taxa mínima'),
(647, 'avg_rate', 'Average Rate', NULL, 'Taxa média'),
(648, 'role_permission_added_successfully', 'Role Permission Successfully Added', NULL, 'Permissão de função adicionada com sucesso'),
(649, 'update_successfully', 'Successfully Updated', NULL, 'Atualizado com sucesso'),
(650, 'role_permission_updated_successfully', 'Role Permission Successfully Updated ', NULL, 'Permissão de função atualizada com sucesso'),
(651, 'shipping_cost', 'Shipping Cost', NULL, 'Frete'),
(652, 'in_word', 'In Word ', NULL, 'Em palavra'),
(653, 'shipping_cost_report', 'Shipping Cost Report', NULL, 'Relatório de custos de envio'),
(654, 'cash_book_report', 'Cash Book Report', NULL, 'Relatório de caixa'),
(655, 'inventory_ledger_report', 'Inventory Ledger Report', NULL, 'Relatório do Razão de Estoque'),
(656, 'trial_balance_with_opening_as_on', 'Trial Balance With Opening As On', NULL, 'Balancete com abertura como ativado'),
(657, 'type', 'Type', NULL, 'Modelo'),
(658, 'taka_only', 'Taka Only', NULL, 'Taka apenas'),
(659, 'item_description', 'Desc', NULL, 'Des. item'),
(660, 'sold_by', 'Sold By', NULL, 'Vendido por'),
(661, 'user_wise_sales_report', 'User Wise Sales Report', NULL, 'Relatório de vendas sábio do usuário'),
(662, 'user_name', 'User Name', NULL, 'Nome do usuário'),
(663, 'total_sold', 'Total Sold', NULL, 'Total Vendido'),
(664, 'user_wise_sale_report', 'User Wise Sales Report', NULL, 'Relatório de vendas sábio do usuário'),
(665, 'barcode_or_qrcode', 'Barcode/QR-code', NULL, 'Código de barras / código QR'),
(666, 'category_csv_upload', 'Category Csv  Upload', NULL, 'Upload de Csv de categoria'),
(667, 'unit_csv_upload', 'Unit Csv Upload', NULL, 'Upload de unidade Csv'),
(668, 'invoice_return_list', 'Sales Return list', NULL, 'Lista de devolução de vendas'),
(669, 'invoice_return', 'Sales Return', NULL, 'Retorno de vendas'),
(670, 'tax_report', 'Tax Report', NULL, 'Relatório Fiscal'),
(671, 'select_tax', 'Select Tax', NULL, 'Selecione imposto'),
(672, 'hrm', 'HRM', NULL, 'HRM'),
(673, 'employee', 'Employee', NULL, 'Funcionário(a)'),
(674, 'add_employee', 'Add Employee', NULL, 'Adicionar funcionário'),
(675, 'manage_employee', 'Manage Employee', NULL, 'Gerenciar Funcionário'),
(676, 'attendance', 'Attendance', NULL, 'Comparecimento'),
(677, 'add_attendance', 'Attendance', NULL, 'Comparecimento'),
(678, 'manage_attendance', 'Manage Attendance', NULL, 'Gerenciar Presença'),
(679, 'payroll', 'Payroll', NULL, 'Folha de pagamento'),
(680, 'add_payroll', 'Payroll', NULL, 'Folha de pagamento'),
(681, 'manage_payroll', 'Manage Payroll', NULL, 'Gerenciar folha de pagamento'),
(682, 'employee_type', 'Employee Type', NULL, 'Tipo de Funcionário(a)'),
(683, 'employee_designation', 'Employee Designation', NULL, 'Designação de Funcionário(a)'),
(684, 'designation', 'Designation', NULL, 'Designação'),
(685, 'add_designation', 'Add Designation', NULL, 'Adicionar Designação'),
(686, 'manage_designation', 'Manage Designation', NULL, 'Gerenciar designação'),
(687, 'designation_update_form', 'Designation Update form', NULL, 'Formulário de atualização de designação'),
(688, 'picture', 'Picture', NULL, 'Foto'),
(689, 'country', 'Country', NULL, 'País'),
(690, 'blood_group', 'Blood Group', NULL, 'Grupo sanguíneo'),
(691, 'address_line_1', 'Address Line 1', NULL, 'Endereço Linha 1'),
(692, 'address_line_2', 'Address Line 2', NULL, 'Endereço linha 2'),
(693, 'zip', 'Zip code', NULL, 'Código postal'),
(694, 'city', 'City', NULL, 'Cidade'),
(695, 'hour_rate_or_salary', 'Houre Rate/Salary', NULL, 'Taxa horária / salário'),
(696, 'rate_type', 'Rate Type', NULL, 'Tipo de taxa'),
(697, 'hourly', 'Hourly', NULL, 'De hora em hora'),
(698, 'salary', 'Salary', NULL, 'Salário'),
(699, 'employee_update', 'Employee Update', NULL, 'Atualização de funcionário(a)'),
(700, 'checkin', 'Check In', NULL, 'Check-in'),
(701, 'employee_name', 'Employee Name', NULL, 'nome do empregado(a)'),
(702, 'checkout', 'Check Out', NULL, 'Verificação de saída'),
(703, 'confirm_clock', 'Confirm Clock', NULL, 'Confirme o relógio'),
(704, 'stay', 'Stay Time', NULL, 'Tempo de permanência'),
(705, 'sign_in', 'Sign In', NULL, 'Entrar'),
(706, 'check_in', 'Check In', NULL, 'Check-in'),
(707, 'single_checkin', 'Single Check In', NULL, 'Check-in único'),
(708, 'bulk_checkin', 'Bulk Check In', NULL, 'Bulk Check In'),
(709, 'successfully_checkout', 'Successfully Checkout', NULL, 'Check-out com sucesso'),
(710, 'attendance_report', 'Attendance Report', NULL, 'Relatório de presenças'),
(711, 'datewise_report', 'Date Wise Report', NULL, 'Relatório de Data Wise'),
(712, 'employee_wise_report', 'Employee Wise Report', NULL, 'Relatório do Funcionário Wise'),
(713, 'date_in_time_report', 'Date In Time Report', NULL, 'Relatório de data no tempo'),
(714, 'request', 'Request', NULL, 'Solicitar'),
(715, 'sign_out', 'Sign Out', NULL, 'Sair'),
(716, 'work_hour', 'Work Hours', NULL, 'Horas de trabalho'),
(717, 's_time', 'Start Time', NULL, 'Hora de início'),
(718, 'e_time', 'In Time', NULL, 'Em tempo'),
(719, 'salary_benefits_type', 'Benefits Type', NULL, 'Tipo de Benefícios'),
(720, 'salary_benefits', 'Salary Benefits', NULL, 'Benefícios de salário'),
(721, 'beneficial_list', 'Benefit List', NULL, 'Lista de Benefícios'),
(722, 'add_beneficial', 'Add Benefits', NULL, 'Adicionar Benefícios'),
(723, 'add_benefits', 'Add Benefits', NULL, 'Adicionar Benefícios'),
(724, 'benefits_list', 'Benefit List', NULL, 'Lista de Benefícios'),
(725, 'benefit_type', 'Benefit Type', NULL, 'Tipo de Benefício'),
(726, 'benefits', 'Benefit', NULL, 'Beneficiar'),
(727, 'manage_benefits', 'Manage Benefits', NULL, 'Gerenciar benefícios'),
(728, 'deduct', 'Deduct', NULL, 'Deduzir');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`, `portugues`) VALUES
(729, 'add', 'Add', NULL, 'Adicione'),
(730, 'add_salary_setup', 'Add Salary Setup', NULL, 'Adicionar configuração de salário'),
(731, 'manage_salary_setup', 'Manage Salary Setup', NULL, 'Gerenciar configuração de salário'),
(732, 'basic', 'Basic', NULL, 'Básico'),
(733, 'salary_type', 'Salary Type', NULL, 'Tipo de Salário'),
(734, 'addition', 'Addition', NULL, 'Adição'),
(735, 'gross_salary', 'Gross Salary', NULL, 'Salário Bruto'),
(736, 'set', 'Set', NULL, 'Definir'),
(737, 'salary_generate', 'Salary Generate', NULL, 'Salário Gerar'),
(738, 'manage_salary_generate', 'Manage Salary Generate', NULL, 'Gerenciar Salário Gerar'),
(739, 'sal_name', 'Salary Name', NULL, 'Nome do Salário'),
(740, 'gdate', 'Generated Date', NULL, 'Data Gerada'),
(741, 'generate_by', 'Generated By', NULL, 'Gerado por'),
(742, 'the_salary_of', 'The Salary of ', NULL, 'O Salário de'),
(743, 'already_generated', ' Already Generated', NULL, 'Já Gerado'),
(744, 'salary_month', 'Salary Month', NULL, 'Salário Mês'),
(745, 'successfully_generated', 'Successfully Generated', NULL, 'Gerado com Sucesso'),
(746, 'salary_payment', 'Salary Payment', NULL, 'Pagamento de Salário'),
(747, 'employee_salary_payment', 'Employee Salary Payment', NULL, 'Pagamento de Salário de Funcionário(a)'),
(748, 'total_salary', 'Total Salary', NULL, 'Salário total'),
(749, 'total_working_minutes', 'Total Working Hours', NULL, 'Total de horas de trabalho'),
(750, 'working_period', 'Working Period', NULL, 'Período de trabalho'),
(751, 'paid_by', 'Paid By', NULL, 'Pago pelo'),
(752, 'pay_now', 'Pay Now ', NULL, 'Pague agora'),
(753, 'confirm', 'Confirm', NULL, 'confirme'),
(754, 'successfully_paid', 'Successfully Paid', NULL, 'Pago com sucesso'),
(755, 'add_incometax', 'Add Income Tax', NULL, 'Adicionar imposto de renda'),
(756, 'setup_tax', 'Setup Tax', NULL, 'Imposto de instalação'),
(757, 'start_amount', 'Start Amount', NULL, 'Quantidade inicial'),
(758, 'end_amount', 'End Amount', NULL, 'Valor Final'),
(759, 'tax_rate', 'Tax Rate', NULL, 'Taxa de imposto'),
(760, 'setup', 'Setup', NULL, 'Configurar'),
(761, 'manage_income_tax', 'Manage Income Tax', NULL, 'Gerenciar imposto de renda'),
(762, 'income_tax_updateform', 'Income tax Update form', NULL, 'Formulário de atualização do imposto de renda'),
(763, 'positional_information', 'Positional Information', NULL, 'Informação Posicional'),
(764, 'personal_information', 'Personal Information', NULL, 'Informações pessoais'),
(765, 'timezone', 'Time Zone', NULL, 'Fuso horário'),
(766, 'sms', 'SMS', NULL, 'SMS'),
(767, 'sms_configure', 'SMS Configure', NULL, 'Configurar SMS'),
(768, 'url', 'URL', NULL, 'URL'),
(769, 'sender_id', 'Sender ID', NULL, 'ID do remetente'),
(770, 'api_key', 'Api Key', NULL, 'Chave API'),
(771, 'gui_pos', 'GUI POS', NULL, 'Interface PDV'),
(772, 'manage_service', 'Manage Service', NULL, 'Gerenciar serviço'),
(773, 'service', 'Service', NULL, 'Serviço'),
(774, 'add_service', 'Add Service', NULL, 'Adicionar serviço'),
(775, 'service_edit', 'Service Edit', NULL, 'Edição de serviço'),
(776, 'service_csv_upload', 'Service CSV Upload', NULL, 'Upload de CSV de serviço'),
(777, 'service_name', 'Service Name', NULL, 'Nome do Serviço'),
(778, 'charge', 'Charge', NULL, 'Cobrar'),
(779, 'service_invoice', 'Service Invoice', NULL, 'Fatura de serviço'),
(780, 'service_discount', 'Service Discount', NULL, 'Desconto de serviço'),
(781, 'hanging_over', 'ETD', NULL, 'Tempo estimado de chegada'),
(782, 'service_details', 'Service Details', NULL, 'Detalhes do serviço'),
(783, 'tax_settings', 'Tax Settings', NULL, 'Configurações fiscais'),
(784, 'default_value', 'Default Value', NULL, 'Valor padrão'),
(785, 'number_of_tax', 'Number of Tax', NULL, 'Número de Imposto'),
(786, 'please_select_employee', 'Please Select Employee', NULL, 'Selecione o funcionário'),
(787, 'manage_service_invoice', 'Manage Service Invoice', NULL, 'Gerenciar fatura de serviço'),
(788, 'update_service_invoice', 'Update Service Invoice', NULL, 'Atualizar fatura de serviço'),
(789, 'customer_wise_tax_report', 'Customer Wise  Tax Report', NULL, 'Relatório de imposto do cliente sábio'),
(790, 'service_id', 'Service Id', NULL, 'Id de serviço'),
(791, 'invoice_wise_tax_report', 'Invoice Wise Tax Report', NULL, 'Fatura Wise Tax Relatório'),
(792, 'reg_no', 'Reg No', NULL, 'Reg No'),
(793, 'update_now', 'Update Now', NULL, 'Atualize agora'),
(794, 'import', 'Import', NULL, 'Importar'),
(795, 'add_expense_item', 'Add Expense Item', NULL, 'Adicionar item de despesa'),
(796, 'manage_expense_item', 'Manage Expense Item', NULL, 'Gerenciar item de despesa'),
(797, 'add_expense', 'Add Expense', NULL, 'Adicionar Despesa'),
(798, 'manage_expense', 'Manage Expense', NULL, 'Gerenciar despesas'),
(799, 'expense_statement', 'Expense Statement', NULL, 'Declaração de Despesas'),
(800, 'expense_type', 'Expense Type', NULL, 'Tipo de despesa'),
(801, 'expense_item_name', 'Expense Item Name', NULL, 'Nome do item de despesa'),
(802, 'stock_purchase_price', 'Stock Purchase Price', NULL, 'Preço de compra de ações'),
(803, 'purchase_price', 'Purchase Price', NULL, 'Preço de compra'),
(804, 'customer_advance', 'Customer Advance', NULL, 'Avanço do Cliente'),
(805, 'advance_type', 'Advance Type', NULL, 'Tipo Avançado'),
(806, 'restore', 'Restore', NULL, 'Restaurar'),
(807, 'supplier_advance', 'Supplier Advance', NULL, 'Fornecedor Antecipado'),
(808, 'please_input_correct_invoice_no', 'Please Input Correct Invoice NO', NULL, 'Insira a fatura correta NÃO'),
(809, 'backup', 'Back Up', NULL, 'Cópia de segurança'),
(810, 'app_setting', 'App Settings', NULL, 'Configurações do aplicativo'),
(811, 'local_server_url', 'Local Server Url', NULL, 'URL do servidor local'),
(812, 'online_server_url', 'Online Server Url', NULL, 'URL do servidor online'),
(813, 'connet_url', 'Connected Hotspot Ip/url', NULL, 'IP / url do ponto de acesso conectado'),
(814, 'update_your_app_setting', 'Update Your App Setting', NULL, 'Atualize a configuração do seu aplicativo'),
(815, 'select_category', 'Select Category', NULL, 'Selecione a Categoria'),
(816, 'mini_invoice', 'Mini Invoice', NULL, 'Mini Fatura'),
(817, 'purchase_details', 'Purchase Details', NULL, 'Detalhes da compra'),
(818, 'disc', 'Dis %', NULL, 'Des %'),
(819, 'serial', 'Serial', NULL, 'Serial'),
(820, 'transaction_head', 'Transaction Head', NULL, 'Cabeça de transação'),
(821, 'transaction_type', 'Transaction Type', NULL, 'Tipo de transação'),
(822, 'return_details', 'Return Details', NULL, 'Detalhes de devolução'),
(823, 'return_to_customer', 'Return To Customer', NULL, 'Devolver ao cliente'),
(824, 'sales_and_purchase_report_summary', 'Sales And Purchase Report Summary', NULL, 'Resumo do relatório de vendas e compras'),
(825, 'add_person_officeloan', 'Add Person (Office Loan)', NULL, 'Adicionar Pessoa (Empréstimo para Escritório)'),
(826, 'add_loan_officeloan', 'Add Loan (Office Loan)', NULL, 'Adicionar empréstimo (empréstimo de escritório)'),
(827, 'add_payment_officeloan', 'Add Payment (Office Loan)', NULL, 'Adicionar Pagamento (Empréstimo de Escritório)'),
(828, 'manage_loan_officeloan', 'Manage Loan (Office Loan)', NULL, 'Gerenciar Empréstimo (Empréstimo de Escritório)'),
(829, 'add_person_personalloan', 'Add Person (Personal Loan)', NULL, 'Adicionar pessoa (empréstimo pessoal)'),
(830, 'add_loan_personalloan', 'Add Loan (Personal Loan)', NULL, 'Adicionar empréstimo (empréstimo pessoal)'),
(831, 'add_payment_personalloan', 'Add Payment (Personal Loan)', NULL, 'Adicionar Pagamento (Empréstimo Pessoal)'),
(832, 'manage_loan_personalloan', 'Manage Loan (Personal)', NULL, 'Gerenciar Empréstimo (Pessoal)'),
(833, 'hrm_management', 'Human Resource', NULL, 'Recursos humanos'),
(834, 'cash_adjustment', 'Cash Adjustment', NULL, 'Ajuste de caixa'),
(835, 'adjustment_type', 'Adjustment Type', NULL, 'Tipo de Ajuste'),
(836, 'change', 'Change', NULL, 'Mudar'),
(837, 'sale_by', 'Sale By', NULL, 'Venda por'),
(838, 'salary_date', 'Salary Date', NULL, 'Data de Salário'),
(839, 'earnings', 'Earnings', NULL, 'Ganhos'),
(840, 'total_addition', 'Total Addition', NULL, 'Adição Total'),
(841, 'total_deduction', 'Total Deduction', NULL, 'Dedução total'),
(842, 'net_salary', 'Net Salary', NULL, 'Salário líquido'),
(843, 'ref_number', 'Reference Number', NULL, 'Número de referência'),
(844, 'name_of_bank', 'Name Of Bank', NULL, 'Nome do banco'),
(845, 'salary_slip', 'Salary Slip', NULL, 'Recibo de Salário'),
(846, 'basic_salary', 'Basic Salary', NULL, 'Salário básico'),
(847, 'return_from_customer', 'Return From Customer', NULL, 'Devolução do cliente'),
(848, 'quotation', 'Quotation', NULL, 'Cotação'),
(849, 'add_quotation', 'Add Quotation', NULL, 'Adicionar cotação'),
(850, 'manage_quotation', 'Manage Quotation', NULL, 'Gerenciar cotação'),
(851, 'terms', 'Terms', NULL, 'Termos'),
(852, 'send_to_customer', 'Sent To Customer', NULL, 'Enviado ao cliente'),
(853, 'quotation_no', 'Quotation No', NULL, 'Citação não'),
(854, 'quotation_date', 'Quotation Date', NULL, 'Data de cotação'),
(855, 'total_service_tax', 'Total Service Tax', NULL, 'Taxa de serviço total'),
(856, 'totalservicedicount', 'Total Service Discount', NULL, 'Desconto de serviço total'),
(857, 'item_total', 'Item Total', NULL, 'Total de itens'),
(858, 'service_total', 'Service Total', NULL, 'Serviço Total'),
(859, 'quot_description', 'Quotation Description', NULL, 'Descrição da Cotação'),
(860, 'sub_total', 'Sub Total', NULL, 'Subtotal'),
(861, 'mail_setting', 'Mail Setting', NULL, 'Configuração de correio'),
(862, 'mail_configuration', 'Mail Configuration', NULL, 'Configuração de Correio'),
(863, 'mail', 'Mail', NULL, 'Correspondência'),
(864, 'protocol', 'Protocol', NULL, 'Protocolo'),
(865, 'smtp_host', 'SMTP Host', NULL, 'Host SMTP'),
(866, 'smtp_port', 'SMTP Port', NULL, 'Porta SMTP'),
(867, 'sender_mail', 'Sender Mail', NULL, 'Remetente de Correio'),
(868, 'mail_type', 'Mail Type', NULL, 'Tipo de Correio'),
(869, 'html', 'HTML', NULL, 'HTML'),
(870, 'text', 'TEXT', NULL, 'TEXTO'),
(871, 'expiry_date', 'Expiry Date', NULL, 'Data de validade'),
(872, 'api_secret', 'Api Secret', NULL, 'Api Secret'),
(873, 'please_config_your_mail_setting', NULL, NULL, 'por favor configure sua configuração de e-mail'),
(874, 'quotation_successfully_added', 'Quotation Successfully Added', NULL, 'Cotação adicionada com sucesso'),
(875, 'add_to_invoice', 'Add To Invoice', NULL, 'Adicionar à fatura'),
(876, 'added_to_invoice', 'Added To Invoice', NULL, 'Adicionado à Fatura'),
(877, 'closing_balance', 'Closing Balance', NULL, 'Saldo final'),
(878, 'contact', 'Contact', NULL, 'Contato'),
(879, 'fax', 'Fax', NULL, 'Fax'),
(880, 'state', 'State', NULL, 'Estado'),
(881, 'discounts', 'Discount', NULL, 'Desconto'),
(882, 'address1', 'Address1', NULL, 'Endereço 1'),
(883, 'address2', 'Address2', NULL, 'Endereço 2'),
(884, 'receive', 'Receive', NULL, 'Receber'),
(885, 'purchase_history', 'Purchase History', NULL, 'Histórico de compras'),
(886, 'cash_payment', 'Cash Payment', NULL, 'Pagamento em dinheiro'),
(887, 'bank_payment', 'Bank Payment', NULL, 'Pagamento bancário'),
(888, 'do_you_want_to_print', 'Do You Want to Print', NULL, 'Você deseja imprimir'),
(889, 'yes', 'Yes', NULL, 'Sim'),
(890, 'no', 'No', NULL, 'Não'),
(891, 'todays_sale', 'Today\'s Sales', NULL, 'Vendas de Hoje'),
(892, 'or', 'OR', NULL, 'OU'),
(893, 'no_result_found', 'No Result Found', NULL, 'Nenhum resultado encontrado'),
(894, 'add_service_quotation', 'Add Service Quotation', NULL, 'Adicionar cotação de serviço'),
(895, 'add_to_invoice', 'Add To Invoice', NULL, 'Adicionar à fatura'),
(896, 'item_quotation', 'Item Quotation', NULL, 'Cotação de item'),
(897, 'service_quotation', 'Service Quotation', NULL, 'Cotação de serviço'),
(898, 'return_from', 'Return Form', NULL, 'Formulário de Devolução'),
(899, 'customer_return_list', 'Customer Return List', NULL, 'Lista de Devolução do Cliente'),
(900, 'pdf', 'Pdf', NULL, 'Pdf'),
(901, 'note', 'Note', NULL, 'Nota'),
(902, 'update_debit_voucher', 'Update Debit Voucher', NULL, 'Atualizar comprovante de débito'),
(903, 'update_credit_voucher', 'Update Credit voucher', NULL, 'Atualizar comprovante de crédito'),
(904, 'on', 'On', NULL, 'On'),
(905, '', '', NULL, ''),
(906, 'total_expenses', 'Total Expense', NULL, 'Custo total'),
(907, 'already_exist', 'Already Exist', NULL, 'Já existe'),
(908, 'checked_out', 'Checked Out', NULL, 'Check-out'),
(909, 'update_salary_setup', 'Update Salary Setup', NULL, 'Atualizar configuração de salário'),
(910, 'employee_signature', 'Employee Signature', NULL, 'Assinatura do empregado(a)'),
(911, 'payslip', 'Payslip', NULL, 'Contracheque'),
(912, 'exsisting_role', 'Existing Role', NULL, 'Papel Existente'),
(913, 'filter', 'Filter', NULL, 'Filtro'),
(914, 'testinput', NULL, NULL, 'Entrada de teste'),
(915, 'update_quotation', 'Update Quotation', NULL, 'Atualizar cotação'),
(916, 'quotation_successfully_updated', 'Quotation Successfully Updated', NULL, 'Cotação atualizada com sucesso'),
(917, 'successfully_approved', 'Successfully Approved', NULL, 'Aprovado com sucesso'),
(918, 'expiry', 'Expiry', NULL, 'Termo'),
(919, 'user_list', 'User List', NULL, 'Lista de usuários'),
(920, 'assign_roleto_user', 'Assign Role To User', NULL, 'Atribuir função ao usuário'),
(921, 'assign_role_list', 'Assigned Role List', NULL, 'Lista de funções atribuídas'),
(922, 'application_settings', 'Application Settings', NULL, 'Configurações do aplicativo'),
(923, 'company_list', 'Company List', NULL, 'Lista de Empresas'),
(924, 'edit_company', 'Edit Company', NULL, 'Editar Empresa'),
(925, 'edit_user', 'Edit User', NULL, 'Editar usuário'),
(926, 'edit_currency', 'Edit Currency', NULL, 'Editar Moeda'),
(927, 'mobile_no', 'Mobile No', NULL, 'Celular Não'),
(928, 'email_address', 'Email Address', NULL, 'Endereço de e-mail'),
(929, 'customer_list', 'Customer List', NULL, 'Lista de clientes'),
(930, 'advance_receipt', 'Advance Receipt', NULL, 'Recibo Antecipado'),
(931, 'supplier_list', 'Supplier List', NULL, 'Lista de Fornecedores'),
(932, 'category_list', 'Category List', NULL, 'Lista de categorias'),
(933, 'no_record_found', 'No Record Found', NULL, 'Nenhuma gravação encontrada'),
(934, 'unit_list', 'Unit List', NULL, 'Lista de Unidade'),
(935, 'edit_product', 'Edit Product', NULL, 'Editar Produto'),
(936, 'payable_summary', 'Payable Summary', NULL, 'Resumo a Pagar'),
(937, 'pad_print', 'Pad Print', NULL, 'Impressão de bloco'),
(938, 'pos_print', 'POS Print', NULL, 'Impressão de PDV'),
(939, 'pos_invoice', 'POS Invoice', NULL, 'Fatura de PDV'),
(940, 'employee_profile', 'Employee Profile', NULL, 'Perfil de Funcionário(a)'),
(941, 'edit_beneficials', 'Edit Beneficials', NULL, 'Editar Beneficiários'),
(942, 'edit_setup_update', 'Edit Salary Setup', NULL, 'Editar configuração de salário'),
(943, 'add_office_loan', 'Add Office Loan', NULL, 'Adicionar Empréstimo para Escritório'),
(944, 'income_tax', 'Income Tax', NULL, 'Imposto de Renda'),
(945, 'quotation_to_sale', 'Quotation To Sale', NULL, 'Cotação para venda'),
(946, 'quotation_edit', 'Edit Quotation', NULL, 'Editar Cotação'),
(947, 'edit_profile', 'Edit Profile', NULL, 'Editar Perfil'),
(948, 'edit_supplier', 'Edit Supplier', NULL, 'Editar Fornecedor'),
(949, 'edit_bank', 'Edit Bank', NULL, 'Editar Banco'),
(950, 'balance_sheet', 'Balance Sheet', NULL, 'Balanço patrimonial'),
(951, 'salary_setup', 'Salary Setup', NULL, 'Configuração de salário'),
(952, 'account_head', 'Account Head', NULL, 'Chefe de conta'),
(953, 'add_invoice', 'Add Invoice', NULL, 'Adicionar fatura'),
(954, 'general_ledger_report', 'General Ledger Report', NULL, 'Relatório do Razão Geral'),
(955, 'print_setting', 'Print Setting', NULL, 'Configuração de impressão'),
(956, 'header', 'Header', NULL, 'Cabeçalho'),
(957, 'footer', 'Footer', NULL, 'Rodapé'),
(958, 'supplier_payment_receipt', 'Payment Receipt', NULL, 'Recibo de pagamento'),
(959, 'welcome_back', 'Welcome Back', NULL, 'Bem vindo de volta'),
(960, 'overwrite', 'Over Write', NULL, 'Sobrescrever'),
(961, 'module', 'Module', NULL, 'Módulo'),
(962, 'purchase_key', 'Purchase Key', NULL, 'Chave de Compra'),
(963, 'buy_now', 'Buy Now', NULL, 'Compre Agora'),
(964, 'module_list', 'Module List', NULL, 'Lista de Módulos'),
(965, 'modules', 'Modules', NULL, 'Módulos'),
(966, 'install', 'Install', NULL, 'Instalar'),
(967, 'uninstall', 'Uninstall', NULL, 'Desinstalar'),
(968, 'module_added_successfully', 'Module Added Successfully', NULL, 'Módulo adicionado com sucesso'),
(969, 'no_tables_are_registered_in_config', 'No table registered in config', NULL, 'Nenhuma tabela registrada na configuração'),
(970, 'tables_are_not_available_in_database', 'Table Are not Available in Database', NULL, 'A tabela não está disponível no banco de dados'),
(971, 'addon', 'Add-ons', NULL, 'Complementos'),
(972, 'generate_qr', 'Generate QR', NULL, 'Gerar QR'),
(973, 'latestv', 'Latest Version', 'current_version', 'Última versão'),
(974, 'Current Version', NULL, NULL, 'Versão Atual'),
(976, 'notesupdate', 'Note: If you want to update software,you Must have immediate previous version', NULL, 'Nota: Se você deseja atualizar o software, você deve ter uma versão anterior imediata');

-- --------------------------------------------------------

--
-- Estrutura da tabela `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `directory` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `module`
--

INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES
(1, 'invoice', NULL, NULL, NULL, 1),
(2, 'customer', NULL, NULL, NULL, 1),
(3, 'product', NULL, NULL, NULL, 1),
(4, 'supplier', NULL, NULL, NULL, 1),
(5, 'purchase', NULL, NULL, NULL, 1),
(6, 'stock', NULL, NULL, NULL, 1),
(7, 'return', NULL, NULL, NULL, 1),
(8, 'report', NULL, NULL, NULL, 1),
(9, 'accounts', NULL, NULL, NULL, 1),
(10, 'bank', NULL, NULL, NULL, 1),
(11, 'tax', NULL, NULL, NULL, 1),
(12, 'hrm_management', NULL, NULL, NULL, 1),
(13, 'service', NULL, NULL, NULL, 1),
(14, 'commission', NULL, NULL, NULL, 1),
(15, 'setting', NULL, NULL, NULL, 1),
(16, 'quotation', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `module_purchase_key`
--

CREATE TABLE `module_purchase_key` (
  `id` int(11) NOT NULL,
  `identity` varchar(100) DEFAULT NULL,
  `purchase_key` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `payroll_tax_setup`
--

CREATE TABLE `payroll_tax_setup` (
  `tax_setup_id` int(11) UNSIGNED NOT NULL,
  `start_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `end_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rate` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` varchar(30) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_loan`
--

CREATE TABLE `personal_loan` (
  `per_loan_id` int(11) NOT NULL,
  `transaction_id` varchar(30) NOT NULL,
  `person_id` varchar(30) NOT NULL,
  `debit` decimal(12,2) DEFAULT 0.00,
  `credit` decimal(12,2) NOT NULL DEFAULT 0.00,
  `date` varchar(30) NOT NULL,
  `details` varchar(100) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1=no paid,2=paid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `person_information`
--

CREATE TABLE `person_information` (
  `id` int(11) NOT NULL,
  `person_id` varchar(50) NOT NULL,
  `person_name` varchar(50) NOT NULL,
  `person_phone` varchar(50) NOT NULL,
  `person_address` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `person_ledger`
--

CREATE TABLE `person_ledger` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `person_id` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `debit` decimal(12,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(12,2) NOT NULL DEFAULT 0.00,
  `details` text NOT NULL,
  `status` int(11) NOT NULL COMMENT '1=no paid,2=paid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pesonal_loan_information`
--

CREATE TABLE `pesonal_loan_information` (
  `id` int(11) NOT NULL,
  `person_id` varchar(50) NOT NULL,
  `person_name` varchar(50) NOT NULL,
  `person_phone` varchar(30) NOT NULL,
  `person_address` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `print_setting`
--

CREATE TABLE `print_setting` (
  `id` int(11) NOT NULL,
  `header` int(11) NOT NULL,
  `footer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `print_setting`
--

INSERT INTO `print_setting` (`id`, `header`, `footer`) VALUES
(1, 200, 100);

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_category`
--

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_information`
--

CREATE TABLE `product_information` (
  `id` int(11) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` float DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `tax` float DEFAULT NULL COMMENT 'Tax in %',
  `serial_no` varchar(200) DEFAULT NULL,
  `product_model` varchar(100) DEFAULT NULL,
  `product_details` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_purchase`
--

CREATE TABLE `product_purchase` (
  `id` int(11) NOT NULL,
  `purchase_id` bigint(20) NOT NULL,
  `chalan_no` varchar(100) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `grand_total_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) DEFAULT 0.00,
  `due_amount` decimal(10,2) DEFAULT 0.00,
  `total_discount` decimal(10,2) DEFAULT NULL,
  `purchase_date` varchar(50) DEFAULT NULL,
  `purchase_details` text DEFAULT NULL,
  `status` int(2) NOT NULL,
  `bank_id` varchar(30) DEFAULT NULL,
  `payment_type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_purchase_details`
--

CREATE TABLE `product_purchase_details` (
  `id` int(11) NOT NULL,
  `purchase_detail_id` varchar(100) DEFAULT NULL,
  `purchase_id` bigint(20) DEFAULT NULL,
  `product_id` varchar(30) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_return`
--

CREATE TABLE `product_return` (
  `return_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `product_id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `invoice_id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `purchase_id` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `date_purchase` varchar(20) CHARACTER SET latin1 NOT NULL,
  `date_return` varchar(30) CHARACTER SET latin1 NOT NULL,
  `byy_qty` float NOT NULL,
  `ret_qty` float NOT NULL,
  `customer_id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `supplier_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `product_rate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `deduction` float NOT NULL,
  `total_deduct` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_ret_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `net_total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `reason` text CHARACTER SET latin1 NOT NULL,
  `usablity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_service`
--

CREATE TABLE `product_service` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `charge` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quotation`
--

CREATE TABLE `quotation` (
  `id` int(20) NOT NULL,
  `quotation_id` varchar(30) NOT NULL,
  `quot_description` text NOT NULL,
  `customer_id` varchar(30) NOT NULL,
  `quotdate` date NOT NULL,
  `expire_date` date DEFAULT NULL,
  `item_total_amount` decimal(12,2) NOT NULL,
  `item_total_dicount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `item_total_tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `service_total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `service_total_discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `service_total_tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quot_dis_item` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quot_dis_service` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quot_no` varchar(50) NOT NULL,
  `create_by` varchar(30) NOT NULL,
  `create_date` date NOT NULL,
  `update_by` varchar(30) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `cust_show` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quotation_service_used`
--

CREATE TABLE `quotation_service_used` (
  `id` int(11) NOT NULL,
  `quot_id` varchar(20) NOT NULL,
  `service_id` int(11) NOT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT 0.00,
  `charge` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quotation_taxinfo`
--

CREATE TABLE `quotation_taxinfo` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `relation_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quot_products_used`
--

CREATE TABLE `quot_products_used` (
  `id` int(11) NOT NULL,
  `quot_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `serial_no` varchar(30) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `used_qty` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `supplier_rate` float DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `discount_per` varchar(15) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `role_permission`
--

CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL,
  `fk_module_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `create` tinyint(1) DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `update` tinyint(1) DEFAULT NULL,
  `delete` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `salary_sheet_generate`
--

CREATE TABLE `salary_sheet_generate` (
  `ssg_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `gdate` varchar(30) DEFAULT NULL,
  `start_date` varchar(30) CHARACTER SET latin1 NOT NULL,
  `end_date` varchar(30) CHARACTER SET latin1 NOT NULL,
  `generate_by` varchar(30) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `salary_type`
--

CREATE TABLE `salary_type` (
  `salary_type_id` int(11) NOT NULL,
  `sal_name` varchar(100) NOT NULL,
  `salary_type` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sec_role`
--

CREATE TABLE `sec_role` (
  `id` int(11) NOT NULL,
  `type` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sec_userrole`
--

CREATE TABLE `sec_userrole` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roleid` int(11) NOT NULL,
  `createby` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `service_invoice`
--

CREATE TABLE `service_invoice` (
  `id` int(11) NOT NULL,
  `voucher_no` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `employee_id` varchar(100) DEFAULT NULL,
  `customer_id` varchar(30) NOT NULL,
  `total_amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `invoice_discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `due_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `previous` decimal(10,2) NOT NULL DEFAULT 0.00,
  `details` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `service_invoice_details`
--

CREATE TABLE `service_invoice_details` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_inv_id` varchar(30) NOT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT 0.00,
  `charge` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sms_settings`
--

CREATE TABLE `sms_settings` (
  `id` int(11) NOT NULL,
  `api_key` varchar(100) DEFAULT NULL,
  `api_secret` varchar(100) DEFAULT NULL,
  `from` varchar(100) DEFAULT NULL,
  `isinvoice` int(11) NOT NULL DEFAULT 0,
  `isservice` int(11) NOT NULL DEFAULT 0,
  `isreceive` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sms_settings`
--

INSERT INTO `sms_settings` (`id`, `api_key`, `api_secret`, `from`, `isinvoice`, `isservice`, `isreceive`) VALUES
(1, '5d6db102011', '456452dfgdf', '8801645452', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sub_module`
--

CREATE TABLE `sub_module` (
  `id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `directory` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sub_module`
--

INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES
(1, 1, 'new_invoice', NULL, NULL, 'new_invoice', 1),
(2, 1, 'manage_invoice', NULL, NULL, 'manage_invoice', 1),
(3, 1, 'pos_invoice', NULL, NULL, 'gui_pos', 1),
(4, 2, 'add_customer', NULL, NULL, 'add_customer', 1),
(5, 2, 'manage_customer', NULL, NULL, 'manage_customer', 1),
(6, 2, 'credit_customer', NULL, NULL, 'credit_customer', 1),
(7, 2, 'paid_customer', NULL, NULL, 'paid_customer', 1),
(8, 2, 'customer_ledger', NULL, NULL, 'customer_ledger', 1),
(9, 2, 'customer_advance', NULL, NULL, 'customer_advance', 1),
(10, 3, 'category', NULL, NULL, 'category', 1),
(11, 3, 'manage_category', NULL, NULL, 'manage_category', 1),
(12, 3, 'unit', NULL, NULL, 'unit', 1),
(13, 3, 'manage_unit', NULL, NULL, 'manage_unit', 1),
(14, 3, 'add_product', NULL, NULL, 'create_product', 1),
(15, 3, 'import_product_csv', NULL, NULL, 'add_product_csv', 1),
(16, 3, 'manage_product', NULL, NULL, 'manage_product', 1),
(17, 4, 'add_supplier', NULL, NULL, 'add_supplier', 1),
(18, 4, 'manage_supplier', NULL, NULL, 'manage_supplier', 1),
(19, 4, 'supplier_ledger', NULL, NULL, 'supplier_ledger_report', 1),
(20, 4, 'supplier_advance', NULL, NULL, 'supplier_advance', 1),
(21, 5, 'add_purchase', NULL, NULL, 'add_purchase', 1),
(22, 5, 'manage_purchase', NULL, NULL, 'manage_purchase', 1),
(23, 6, 'stock_report', NULL, NULL, 'stock_report', 1),
(24, 7, 'return', NULL, NULL, 'add_return', 1),
(25, 7, 'stock_return_list', NULL, NULL, 'return_list', 1),
(26, 7, 'supplier_return_list', NULL, NULL, 'supplier_return_list', 1),
(27, 7, 'wastage_return_list', NULL, NULL, 'wastage_return_list', 1),
(28, 8, 'closing', NULL, NULL, 'add_closing', 1),
(29, 8, 'closing_report', NULL, NULL, 'closing_report', 1),
(30, 8, 'todays_report', NULL, NULL, 'all_report', 1),
(31, 8, 'todays_customer_receipt', NULL, NULL, 'todays_customer_receipt', 1),
(32, 8, 'sales_report', NULL, NULL, 'todays_sales_report', 1),
(33, 8, 'due_report', NULL, NULL, 'due_report', 1),
(34, 8, 'purchase_report', NULL, NULL, 'todays_purchase_report', 1),
(35, 8, 'purchase_report_category_wise', NULL, NULL, 'purchase_report_category_wise', 1),
(36, 8, 'sales_report_product_wise', NULL, NULL, 'product_sales_reports_date_wise', 1),
(37, 8, 'sales_report_category_wise', NULL, NULL, 'sales_report_category_wise', 1),
(38, 8, 'shipping_cost_report', NULL, NULL, 'shipping_cost_report', 1),
(39, 8, 'user_wise_sales_report', NULL, NULL, 'user_wise_sales_report', 1),
(40, 8, 'invoice_return', NULL, NULL, 'invoice_return', 1),
(41, 8, 'supplier_return', NULL, NULL, 'supplier_return', 1),
(42, 8, 'tax_report', NULL, NULL, 'tax_report', 1),
(43, 8, 'profit_report', NULL, NULL, 'profit_report', 1),
(44, 9, 'c_o_a', NULL, NULL, 'show_tree', 1),
(45, 9, 'supplier_payment', NULL, NULL, 'supplier_payment', 1),
(46, 9, 'customer_receive', NULL, NULL, 'customer_receive', 1),
(47, 9, 'opening_balance', NULL, NULL, 'opening_balance', 1),
(48, 9, 'debit_voucher', NULL, NULL, 'debit_voucher', 1),
(49, 9, 'credit_voucher', NULL, NULL, 'credit_voucher', 1),
(50, 9, 'voucher_approval', NULL, NULL, 'aprove_v', 1),
(51, 9, 'contra_voucher', NULL, NULL, 'contra_voucher', 1),
(52, 9, 'journal_voucher', NULL, NULL, 'journal_voucher', 1),
(53, 9, 'report', NULL, NULL, 'ac_report', 1),
(54, 9, 'cash_book', NULL, NULL, 'cash_book', 1),
(55, 9, 'Inventory_ledger', NULL, NULL, 'inventory_ledger', 1),
(56, 9, 'bank_book', NULL, NULL, 'bank_book', 1),
(57, 9, 'general_ledger', NULL, NULL, 'general_ledger', 1),
(58, 9, 'trial_balance', NULL, NULL, 'trial_balance', 1),
(59, 9, 'cash_flow', NULL, NULL, 'cash_flow_report', 1),
(60, 9, 'coa_print', NULL, NULL, 'coa_print', 1),
(61, 10, 'add_new_bank', NULL, NULL, 'add_bank', 1),
(62, 10, 'manage_bank', NULL, NULL, 'bank_list', 1),
(63, 10, 'bank_transaction', NULL, NULL, 'bank_transaction', 1),
(64, 10, 'bank_ledger', NULL, NULL, 'bank_ledger', 1),
(65, 11, 'tax_settings', NULL, NULL, 'tax_settings', 1),
(66, 11, 'add_incometax', NULL, NULL, 'add_incometax', 1),
(67, 11, 'manage_income_tax', NULL, NULL, 'manage_income_tax', 1),
(68, 11, 'tax_report', NULL, NULL, 'tax_report', 1),
(69, 11, 'invoice_wise_tax_report', NULL, NULL, 'invoice_wise_tax_report', 1),
(70, 12, 'add_designation', NULL, NULL, 'add_designation', 1),
(71, 12, 'manage_designation', NULL, NULL, 'manage_designation', 1),
(72, 12, 'add_employee', NULL, NULL, 'add_employee', 1),
(73, 12, 'manage_employee', NULL, NULL, 'manage_employee', 1),
(74, 12, 'add_attendance', NULL, NULL, 'add_attendance', 1),
(75, 12, 'manage_attendance', NULL, NULL, 'manage_attendance', 1),
(76, 12, 'attendance_report', NULL, NULL, 'attendance_report', 1),
(77, 12, 'add_benefits', NULL, NULL, 'add_benefits', 1),
(78, 12, 'manage_benefits', NULL, NULL, 'manage_benefits', 1),
(79, 12, 'add_salary_setup', NULL, NULL, 'add_salary_setup', 1),
(80, 12, 'manage_salary_setup', NULL, NULL, 'manage_salary_setup', 1),
(81, 12, 'salary_generate', NULL, NULL, 'salary_generate', 1),
(82, 12, 'manage_salary_generate', NULL, NULL, 'manage_salary_generate', 1),
(83, 12, 'salary_payment', NULL, NULL, 'salary_payment', 1),
(84, 12, 'add_expense_item', NULL, NULL, 'add_expense_item', 1),
(85, 12, 'manage_expense_item', NULL, NULL, 'manage_expense_item', 1),
(86, 12, 'add_expense', NULL, NULL, 'add_expense', 1),
(87, 12, 'manage_expense', NULL, NULL, 'manage_expense', 1),
(88, 12, 'expense_statement', NULL, NULL, 'expense_statement', 1),
(89, 12, 'add_person_officeloan', NULL, NULL, 'add1_person', 1),
(90, 12, 'add_loan_officeloan', NULL, NULL, 'add_office_loan', 1),
(91, 12, 'add_payment_officeloan', NULL, NULL, 'add_loan_payment', 1),
(92, 12, 'manage_loan_officeloan', NULL, NULL, 'manage1_person', 1),
(93, 12, 'add_person_personalloan', NULL, NULL, 'add_person', 1),
(94, 12, 'add_loan_personalloan', NULL, NULL, 'add_loan', 1),
(95, 12, 'add_payment_personalloan', NULL, NULL, 'add_payment', 1),
(96, 12, 'manage_loan_personalloan', NULL, NULL, 'manage_person', 1),
(97, 13, 'add_service', NULL, NULL, 'create_service', 1),
(98, 13, 'manage_service', NULL, NULL, 'manage_service', 1),
(99, 13, 'service_invoice', NULL, NULL, 'service_invoice', 1),
(100, 13, 'manage_service_invoice', NULL, NULL, 'manage_service_invoice', 1),
(101, 14, 'generate_commission', NULL, NULL, 'commission', 1),
(102, 15, 'manage_company', NULL, NULL, 'manage_company', 1),
(103, 15, 'add_user', NULL, NULL, 'add_user', 1),
(104, 15, 'manage_users', NULL, NULL, 'manage_user', 1),
(105, 15, 'language', NULL, NULL, 'add_language', 1),
(106, 15, 'currency', NULL, NULL, 'add_currency', 1),
(107, 15, 'setting', NULL, NULL, 'soft_setting', 1),
(108, 15, 'print_setting', NULL, NULL, 'print_setting', 1),
(109, 15, 'mail_setting', NULL, NULL, 'mail_setting', 1),
(110, 15, 'add_role', NULL, NULL, 'add_role', 1),
(111, 15, 'role_list', NULL, NULL, 'role_list', 1),
(112, 15, 'user_assign_role', NULL, NULL, 'user_assign', 1),
(113, 15, 'Permission', NULL, NULL, NULL, 1),
(114, 15, 'sms_configure', NULL, NULL, 'sms_configure', 1),
(115, 15, 'backup_restore', NULL, NULL, 'back_up', 1),
(116, 15, 'import', NULL, NULL, 'sql_import', 1),
(117, 15, 'restore', NULL, NULL, 'restore', 1),
(118, 16, 'add_quotation', NULL, NULL, 'add_quotation', 1),
(119, 16, 'manage_quotation', NULL, NULL, 'manage_quotation', 1),
(120, 16, 'add_to_invoice', NULL, NULL, 'add_to_invoice', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `supplier_information`
--

CREATE TABLE `supplier_information` (
  `supplier_id` bigint(20) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address2` text NOT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `emailnumber` varchar(200) DEFAULT NULL,
  `email_address` varchar(200) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `supplier_product`
--

CREATE TABLE `supplier_product` (
  `supplier_pr_id` int(11) NOT NULL,
  `product_id` varchar(30) CHARACTER SET utf8 NOT NULL,
  `products_model` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `supplier_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `synchronizer_setting`
--

CREATE TABLE `synchronizer_setting` (
  `id` int(11) NOT NULL,
  `hostname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `port` varchar(10) NOT NULL,
  `debug` varchar(10) NOT NULL,
  `project_root` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tax_collection`
--

CREATE TABLE `tax_collection` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `customer_id` varchar(30) NOT NULL,
  `relation_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tax_settings`
--

CREATE TABLE `tax_settings` (
  `id` int(11) NOT NULL,
  `default_value` float NOT NULL,
  `tax_name` varchar(250) NOT NULL,
  `nt` int(11) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `units`
--

CREATE TABLE `units` (
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `company_name` varchar(250) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` int(2) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `user_id`, `last_name`, `first_name`, `company_name`, `address`, `phone`, `gender`, `date_of_birth`, `logo`, `status`) VALUES
(1, '2', 'User', 'Admin', NULL, NULL, NULL, NULL, NULL, 'http://localhost/saleserp_v9.8/assets/dist/img/profile_picture/profile.jpg', 1),
(2, '1', 'User', 'Admin', NULL, NULL, NULL, NULL, NULL, 'assets/dist/img/profile_picture/profile.jpg', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_login`
--

CREATE TABLE `user_login` (
  `id` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` int(2) DEFAULT NULL,
  `security_code` varchar(255) DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `user_login`
--

INSERT INTO `user_login` (`id`, `user_id`, `username`, `password`, `user_type`, `security_code`, `status`) VALUES
(1, '2', 'admin@example.com', '41d99b369894eb1ec3f461135132d8bb', 1, NULL, 1),
(2, '1', 'admin@admin.com', '42157191a9bef4f97c5cf1a0faf487de', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `web_setting`
--

CREATE TABLE `web_setting` (
  `setting_id` int(11) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `invoice_logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `timezone` varchar(150) NOT NULL,
  `currency_position` varchar(10) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `rtr` varchar(255) DEFAULT NULL,
  `captcha` int(11) DEFAULT 1 COMMENT '0=active,1=inactive',
  `site_key` varchar(250) DEFAULT NULL,
  `secret_key` varchar(250) DEFAULT NULL,
  `discount_type` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `web_setting`
--

INSERT INTO `web_setting` (`setting_id`, `logo`, `invoice_logo`, `favicon`, `currency`, `timezone`, `currency_position`, `footer_text`, `language`, `rtr`, `captcha`, `site_key`, `secret_key`, `discount_type`) VALUES
(1, 'assets/img/icons/2021-08-22/cd2aac437d525e0353804dc871e0cb9a.png', 'assets/img/icons/2021-08-22/9c8870051c9cc8f3fd174c994366d0b9.png', 'assets/img/icons/2021-08-22/f458eec784bfd40e948cfba5a832465a.png', 'R$', 'America/Sao_Paulo', '1', 'CopyrightÂ© 2021 Bigook. Todos os direitos reservados.', 'portugues', '0', 1, '6LdiKhsUAAAAAMV4jQRmNYdZy2kXEuFe1HrdP5tt', '6LdiKhsUAAAAAMV4jQRmNYdZy2kXEuFe1HrdP5tt', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acc_coa`
--
ALTER TABLE `acc_coa`
  ADD PRIMARY KEY (`HeadName`),
  ADD KEY `HeadCode` (`HeadCode`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Índices para tabela `acc_transaction`
--
ALTER TABLE `acc_transaction`
  ADD UNIQUE KEY `ID` (`ID`),
  ADD KEY `COAID` (`COAID`);

--
-- Índices para tabela `app_setting`
--
ALTER TABLE `app_setting`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`att_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Índices para tabela `bank_add`
--
ALTER TABLE `bank_add`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `currency_tbl`
--
ALTER TABLE `currency_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `customer_information`
--
ALTER TABLE `customer_information`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Índices para tabela `daily_closing`
--
ALTER TABLE `daily_closing`
  ADD PRIMARY KEY (`closing_id`);

--
-- Índices para tabela `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `email_config`
--
ALTER TABLE `email_config`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `employee_history`
--
ALTER TABLE `employee_history`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `employee_salary_payment`
--
ALTER TABLE `employee_salary_payment`
  ADD PRIMARY KEY (`emp_sal_pay_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `generate_id` (`generate_id`);

--
-- Índices para tabela `employee_salary_setup`
--
ALTER TABLE `employee_salary_setup`
  ADD PRIMARY KEY (`e_s_s_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Índices para tabela `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `expense_item`
--
ALTER TABLE `expense_item`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Índices para tabela `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Índices para tabela `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `module_purchase_key`
--
ALTER TABLE `module_purchase_key`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `payroll_tax_setup`
--
ALTER TABLE `payroll_tax_setup`
  ADD PRIMARY KEY (`tax_setup_id`);

--
-- Índices para tabela `personal_loan`
--
ALTER TABLE `personal_loan`
  ADD PRIMARY KEY (`per_loan_id`);

--
-- Índices para tabela `person_information`
--
ALTER TABLE `person_information`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `person_ledger`
--
ALTER TABLE `person_ledger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`);

--
-- Índices para tabela `pesonal_loan_information`
--
ALTER TABLE `pesonal_loan_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`);

--
-- Índices para tabela `print_setting`
--
ALTER TABLE `print_setting`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Índices para tabela `product_information`
--
ALTER TABLE `product_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Índices para tabela `product_purchase`
--
ALTER TABLE `product_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Índices para tabela `product_purchase_details`
--
ALTER TABLE `product_purchase_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Índices para tabela `product_return`
--
ALTER TABLE `product_return`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Índices para tabela `product_service`
--
ALTER TABLE `product_service`
  ADD PRIMARY KEY (`service_id`);

--
-- Índices para tabela `quotation`
--
ALTER TABLE `quotation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `quot_no` (`quot_no`),
  ADD KEY `quotation_id` (`quotation_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Índices para tabela `quotation_service_used`
--
ALTER TABLE `quotation_service_used`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quot_id` (`quot_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Índices para tabela `quotation_taxinfo`
--
ALTER TABLE `quotation_taxinfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Índices para tabela `quot_products_used`
--
ALTER TABLE `quot_products_used`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `quot_id` (`quot_id`);

--
-- Índices para tabela `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_module_id` (`fk_module_id`),
  ADD KEY `fk_user_id` (`role_id`);

--
-- Índices para tabela `salary_sheet_generate`
--
ALTER TABLE `salary_sheet_generate`
  ADD PRIMARY KEY (`ssg_id`);

--
-- Índices para tabela `salary_type`
--
ALTER TABLE `salary_type`
  ADD PRIMARY KEY (`salary_type_id`);

--
-- Índices para tabela `sec_role`
--
ALTER TABLE `sec_role`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sec_userrole`
--
ALTER TABLE `sec_userrole`
  ADD UNIQUE KEY `ID` (`id`);

--
-- Índices para tabela `service_invoice`
--
ALTER TABLE `service_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Índices para tabela `service_invoice_details`
--
ALTER TABLE `service_invoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Índices para tabela `sms_settings`
--
ALTER TABLE `sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sub_module`
--
ALTER TABLE `sub_module`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `supplier_information`
--
ALTER TABLE `supplier_information`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Índices para tabela `supplier_product`
--
ALTER TABLE `supplier_product`
  ADD PRIMARY KEY (`supplier_pr_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Índices para tabela `tax_collection`
--
ALTER TABLE `tax_collection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Índices para tabela `tax_settings`
--
ALTER TABLE `tax_settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unit_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `web_setting`
--
ALTER TABLE `web_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acc_transaction`
--
ALTER TABLE `acc_transaction`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `app_setting`
--
ALTER TABLE `app_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `attendance`
--
ALTER TABLE `attendance`
  MODIFY `att_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bank_add`
--
ALTER TABLE `bank_add`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `currency_tbl`
--
ALTER TABLE `currency_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `customer_information`
--
ALTER TABLE `customer_information`
  MODIFY `customer_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `daily_closing`
--
ALTER TABLE `daily_closing`
  MODIFY `closing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `designation`
--
ALTER TABLE `designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `email_config`
--
ALTER TABLE `email_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `employee_history`
--
ALTER TABLE `employee_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `employee_salary_payment`
--
ALTER TABLE `employee_salary_payment`
  MODIFY `emp_sal_pay_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `employee_salary_setup`
--
ALTER TABLE `employee_salary_setup`
  MODIFY `e_s_s_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `expense_item`
--
ALTER TABLE `expense_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=977;

--
-- AUTO_INCREMENT de tabela `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `module_purchase_key`
--
ALTER TABLE `module_purchase_key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `payroll_tax_setup`
--
ALTER TABLE `payroll_tax_setup`
  MODIFY `tax_setup_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `personal_loan`
--
ALTER TABLE `personal_loan`
  MODIFY `per_loan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `person_information`
--
ALTER TABLE `person_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `person_ledger`
--
ALTER TABLE `person_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pesonal_loan_information`
--
ALTER TABLE `pesonal_loan_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `print_setting`
--
ALTER TABLE `print_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `product_category`
--
ALTER TABLE `product_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `product_information`
--
ALTER TABLE `product_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `product_purchase`
--
ALTER TABLE `product_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `product_purchase_details`
--
ALTER TABLE `product_purchase_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `product_service`
--
ALTER TABLE `product_service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quotation`
--
ALTER TABLE `quotation`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quotation_service_used`
--
ALTER TABLE `quotation_service_used`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quotation_taxinfo`
--
ALTER TABLE `quotation_taxinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quot_products_used`
--
ALTER TABLE `quot_products_used`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `salary_sheet_generate`
--
ALTER TABLE `salary_sheet_generate`
  MODIFY `ssg_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `salary_type`
--
ALTER TABLE `salary_type`
  MODIFY `salary_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sec_role`
--
ALTER TABLE `sec_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sec_userrole`
--
ALTER TABLE `sec_userrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `service_invoice`
--
ALTER TABLE `service_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `service_invoice_details`
--
ALTER TABLE `service_invoice_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sms_settings`
--
ALTER TABLE `sms_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sub_module`
--
ALTER TABLE `sub_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de tabela `supplier_information`
--
ALTER TABLE `supplier_information`
  MODIFY `supplier_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `supplier_product`
--
ALTER TABLE `supplier_product`
  MODIFY `supplier_pr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tax_collection`
--
ALTER TABLE `tax_collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tax_settings`
--
ALTER TABLE `tax_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `units`
--
ALTER TABLE `units`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `web_setting`
--
ALTER TABLE `web_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
