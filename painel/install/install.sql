CREATE TABLE `hb_account_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `account_id` int(11) NOT NULL,
  `admin_login` text NOT NULL,
  `module` text NOT NULL,
  `manual` tinyint(1) NOT NULL,
  `action` text NOT NULL,
  `change` text NOT NULL,
  `result` tinyint(1) NOT NULL,
  `error` text NOT NULL,
  `event` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `event` (`event`(12)),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `date_created` date NOT NULL,
  `domain` text NOT NULL,
  `server_id` int(11) NOT NULL,
  `payment_module` int(11) NOT NULL,
  `firstpayment` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `billingcycle` enum('Free','One Time','Monthly','Quarterly','Semi-Annually','Annually','Biennially','Triennially','Quadrennially','Quinquennially','Daily','Weekly','Hourly') DEFAULT NULL,
  `next_due` date DEFAULT NULL,
  `next_invoice` date NOT NULL,
  `status` enum('Pending','Active','Suspended','Terminated','Cancelled','Fraud') NOT NULL,
  `label` varchar(40) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `autosuspend` tinyint(1) NOT NULL DEFAULT '0',
  `autosuspend_date` date DEFAULT NULL,
  `rootpassword` text NOT NULL,
  `date_changed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `synch_date` datetime NOT NULL,
  `synch_error` tinyint(1) NOT NULL,
  `user_error` tinyint(1) NOT NULL,
  `domain_error` tinyint(1) NOT NULL,
  `notes` text NOT NULL,
  `manual` tinyint(1) NOT NULL,
  `extra_details` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `server_id` (`server_id`),
  KEY `domain` (`domain`(64)),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_accounts2servers`
--

CREATE TABLE `hb_accounts2servers` (
  `account_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `status` enum('Pending','Active','Suspended','Terminated') NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `rootpassword` text NOT NULL,
  `extra_details` text NOT NULL,
  PRIMARY KEY (`account_id`,`module_id`),
  KEY `server_id` (`server_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_accounts_addons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `addon_id` int(11) NOT NULL,
  `payment_module` int(11) NOT NULL,
  `name` text NOT NULL,
  `setup_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `recurring_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `billingcycle` enum('Free','One Time','Monthly','Quarterly','Semi-Annually','Annually','Biennially','Triennially','Daily','Weekly','Hourly') DEFAULT NULL,
  `status` enum('Pending','Active','Suspended','Terminated','Cancelled') NOT NULL DEFAULT 'Pending',
  `regdate` date NOT NULL,
  `next_due` date DEFAULT NULL,
  `next_invoice` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `order_id` (`order_id`),
  KEY `status` (`status`),
  KEY `addon_id` (`addon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_accounts_tags` (
  `account_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(63) NOT NULL DEFAULT '',
  PRIMARY KEY (`account_id`,`target_id`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_addons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `products` text NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `unique` tinyint(1) NOT NULL DEFAULT '0',
  `taxable` tinyint(1) NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `autosetup` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_addons_modules` (
  `addon_id` int(11) NOT NULL,
  `module` varchar(64) NOT NULL,
  `parentmod` varchar(64) NOT NULL,
  `options` text NOT NULL,
  `features` text NOT NULL,
  PRIMARY KEY (`addon_id`),
  KEY `module` (`module`(32)),
  KEY `parentmod` (`parentmod`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_admin_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `loginattempts` int(1) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `emails` text NOT NULL,
  `access` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_admin_access` (`id`, `username`, `password`, `loginattempts`, `status`, `emails`, `access`) VALUES
(1, 'admin', '$2a$08$MVxsK20RMi2u0lXqS7e5fO1iQUHZjnqpglck17v1QrnqRkeCDpfHu', 0, 'Active', 'a:15:{i:0;s:13:"createAccount";i:1;s:16:"terminateAccount";i:2;s:14:"suspendAccount";i:3;s:16:"unsuspendAccount";i:4;s:8:"newOrder";i:5;s:11:"cancelOrder";i:6;s:9:"autoSetup";i:7;s:11:"cronResults";i:8;s:11:"failedLogin";i:9;s:20:"clientDetailsChanged";i:10;s:16:"mobileNewPayment";i:11;s:14:"mobileNewOrder";i:12;s:22:"mobileFailedAutomation";i:13;s:18:"editOrderOwnership";i:14;s:22:"editOrderOwnershipToMe";}', 'viewInvoices,viewEstimates,viewTransactions,viewOrders,viewAccounts,listClients,viewCC,editCC,emailClient,viewTickets,viewLogs,editKBase,accessChat,loginAsClient,editConfiguration,editNews,viewDomains,editDownloads,registerClient,manageAffiliates,viewStats,deleteClients,deleteServices,deleteInvoices,deleteEstimates,deleteTransactions,deleteOrders,viewEmailLogs,editInvoices,refundInvoices,addInvoices,addTransactions,editTransactions,addOrders,editOrders,editAccounts,editClients,editClientsCredit,deleteDomains,editDomains,editOrderOwnership,editOrderTakeOwnership,affilateSettings,clientFieldsSettings,productsSettings,promotionSettings,emailTemplateSettings,languageSettings,appsSettings,departmentSettings,staffMembers,ipAccess,ipBanned,emailsBanned,loginNotifications,apiManagement,passwordSettings,editInfoPages,importAccounts');
##########
CREATE TABLE `hb_admin_details` (
  `id` int(10) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `email` text NOT NULL,
  `signature` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`(64)),
  KEY `firstname_lastname` (`firstname`(32),`lastname`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_admin_details` (`id`, `firstname`, `lastname`, `email`, `signature`) VALUES
(1, 'Default', 'User', 'change@me.com', '--my signature--');
##########
CREATE TABLE `hb_admin_failed_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `login` varchar(255) NOT NULL,
  `ip` varbinary(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_admin_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) NOT NULL,
  `variable` varchar(127) NOT NULL,
  `type` varchar(127) NOT NULL,
  `default` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `variable` (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_admin_fields_values` (
  `field_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`field_id`,`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_admin_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) NOT NULL,
  `username` text NOT NULL,
  `login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logout` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` text NOT NULL,
  `token` text NOT NULL,
  `lastvisit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `logout` (`logout`),
  KEY `admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_aff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `status` enum('Active','Disabled') NOT NULL DEFAULT 'Active',
  `date_created` datetime NOT NULL,
  `visits` int(11) NOT NULL,
  `total_commissions` decimal(10,2) NOT NULL,
  `total_withdrawn` decimal(10,2) NOT NULL,
  `withdraw_method` tinyint(4) NOT NULL DEFAULT '0',
  `sendreport` tinyint(4) NOT NULL DEFAULT '0',
  `commision_plans` text NOT NULL,
  `landing_url` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_aff_commisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `type` enum('Fixed','Percent') NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `applicable_cycles` text NOT NULL,
  `applicable_products` text NOT NULL,
  `recurring` tinyint(1) NOT NULL,
  `enable_voucher` tinyint(1) NOT NULL,
  `notes` text NOT NULL,
  `enable_overcommission` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_aff_commisions` (`id`, `name`, `type`, `rate`, `applicable_cycles`, `applicable_products`, `recurring`, `enable_voucher`, `notes`, `enable_overcommission`) VALUES
(1, 'Default', 'Percent', '10.00', 'all', '', 0, 1, 'Default commisions plan', 0);
##########
CREATE TABLE `hb_aff_coupons` (
  `aff_id` int(10) NOT NULL,
  `coupon_id` int(10) NOT NULL,
  `commision_plan` int(10) NOT NULL,
  PRIMARY KEY (`aff_id`,`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_aff_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aff_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `type` enum('Visit','Singup') NOT NULL,
  `target` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aff_id` (`aff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_aff_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aff_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `commission` decimal(10,2) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `datepaid` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aff_id` (`aff_id`),
  KEY `order_id` (`order_id`),
  KEY `paid` (`paid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_aff_widlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aff_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `note` text,
  `method` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `aff_id` (`aff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_annoucements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` tinytext NOT NULL,
  `content` text NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_api_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` varchar(20) NOT NULL,
  `api_key` varchar(20) NOT NULL,
  `ip` varchar(64) NOT NULL,
  `acl` text,
  PRIMARY KEY (`id`),
  KEY `api_id` (`api_id`,`api_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_api_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(32) NOT NULL,
  `action` text NOT NULL,
  `result` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_automation_settings` (
  `item_id` int(11) NOT NULL,
  `type` enum('Hosting','Addon','Domain','ClientGroup') NOT NULL DEFAULT 'Hosting',
  `setting` varchar(32) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`item_id`,`type`,`setting`(29))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_banned_emails` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `domain` varchar(128) NOT NULL,
  `reason` text NOT NULL,
  `expires` datetime NOT NULL,
  `count` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_banned_ip` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `ip` varchar(64) NOT NULL,
  `reason` text NOT NULL,
  `expires` datetime NOT NULL,
  `count` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_cancel_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `reason` text NOT NULL,
  `type` enum('Immediate','End of billing period','Other') NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `sort_order` int(1) NOT NULL DEFAULT '0',
  `template` varchar(32) NOT NULL DEFAULT 'default',
  `ctype` enum('wizard','onestep','quote','domain') NOT NULL DEFAULT 'wizard',
  `ptype` tinyint(2) NOT NULL,
  `slug` varchar(255) NOT NULL DEFAULT '',
  `opconfig` text NOT NULL,
  `scenario_id` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `visible` (`visible`),
  KEY `slug` (`slug`(32)),
  KEY `module` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_chat_canned_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_chat_canned_fav` (
  `admin_id` int(11) NOT NULL,
  `response_id` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`,`response_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_chat_canned_resp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(127) NOT NULL,
  `body` text NOT NULL,
  `used` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_chat_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) NOT NULL,
  `description` text NOT NULL,
  `ticket_dept_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `options` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ticket_dept` (`ticket_dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_chat_discussions2`
--

CREATE TABLE `hb_chat_discussions2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `footprint_id` int(11) NOT NULL,
  `staff_id_1` int(11) NOT NULL,
  `staff_id_2` int(11) NOT NULL DEFAULT '0',
  `staff_rejects` varchar(127) NOT NULL DEFAULT '',
  `type` enum('CA','AC') NOT NULL DEFAULT 'CA',
  `status` enum('Invite','Invite Recv','Invite Decline','Active','Pending','Transfer','Timeout','Closed') NOT NULL DEFAULT 'Pending',
  `date_start` datetime NOT NULL,
  `date_answered` datetime NOT NULL,
  `date_last` datetime NOT NULL,
  `visitor_name` varchar(127) NOT NULL,
  `visitor_email` varchar(127) NOT NULL,
  `subject` text NOT NULL,
  `robin_count` int(11) NOT NULL DEFAULT '0',
  `staff_type` tinyint(4) NOT NULL DEFAULT '0',
  `visitor_type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `visitor_id` (`visitor_id`),
  KEY `department_id` (`department_id`),
  KEY `staff_id_1` (`staff_id_1`),
  KEY `status` (`status`),
  KEY `footprint_id` (`footprint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_chat_footprints` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL,
  `date` datetime NOT NULL,
  `page` text NOT NULL,
  `ref` text NOT NULL,
  `searchterm` text NOT NULL,
  `page_title` text NOT NULL,
  `hash` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `visitor_id` (`visitor_id`),
  KEY `hash` (`hash`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_chat_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('invitation','status') NOT NULL DEFAULT 'status',
  `name` varchar(127) NOT NULL DEFAULT '',
  `filename_off` varchar(255) NOT NULL DEFAULT '',
  `filename_on` varchar(255) NOT NULL DEFAULT '',
  `location` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_chat_messages2`
--

CREATE TABLE `hb_chat_messages2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` int(11) NOT NULL,
  `staff_read` tinyint(1) NOT NULL DEFAULT '0',
  `visitor_read` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('Staff','Client','Status','System') NOT NULL DEFAULT 'Status',
  `date` datetime NOT NULL,
  `message` text NOT NULL,
  `submitter_id` int(11) NOT NULL DEFAULT '0',
  `submitter_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_id` (`chat_id`),
  KEY `submitter_id` (`submitter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_chat_staff2`
--

CREATE TABLE `hb_chat_staff2` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('Active','Away','Offline') NOT NULL DEFAULT 'Offline',
  `lastseen` datetime NOT NULL,
  `canned_welcome_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_chat_staff2dept`
--

CREATE TABLE `hb_chat_staff2dept` (
  `admin_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_chat_visitor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `session` varchar(32) NOT NULL DEFAULT '0',
  `last_visit` datetime NOT NULL,
  `first_visit` datetime NOT NULL,
  `ban_util` date NOT NULL DEFAULT '0000-00-00',
  `ip` varchar(45) NOT NULL,
  `hostname` varchar(127) NOT NULL,
  `name` varchar(127) NOT NULL,
  `email` varchar(127) NOT NULL,
  `os` varchar(45) NOT NULL,
  `browser` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `ip` (`ip`),
  KEY `session` (`session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_chat_visitor_geodata` (
  `visitor_id` int(11) NOT NULL,
  `locId` int(11) NOT NULL,
  `country` varchar(5) NOT NULL,
  `region` varchar(100) NOT NULL,
  `city` varchar(255) NOT NULL,
  `postalCode` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  PRIMARY KEY (`visitor_id`),
  KEY `locId` (`locId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_client_access` (
  `id` int(10) NOT NULL,
  `group_id` int(10) NOT NULL DEFAULT '0',
  `email` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `ip` text NOT NULL,
  `host` text NOT NULL,
  `status` enum('Active','Closed') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`),
  KEY `email` (`email`(64)),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_client_ach` (
  `client_id` int(11) NOT NULL,
  `type` enum('checkings','savings','business_checking') NOT NULL,
  `account` blob NOT NULL,
  `routing` blob NOT NULL,
  `token` blob NOT NULL,
  `token_gateway_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_client_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `client_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `admin_name` varchar(50) NOT NULL DEFAULT '',
  `event` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_client_billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `credit` decimal(10,2) NOT NULL,
  `taxexempt` tinyint(1) NOT NULL,
  `latefeeoveride` tinyint(1) NOT NULL,
  `overideduenotices` tinyint(1) NOT NULL,
  `overideautosusp` tinyint(1) NOT NULL,
  `cardtype` enum('Visa','MasterCard','Discover','American Express','Laser','Maestro') NOT NULL,
  `cardnum` blob NOT NULL,
  `expdate` blob NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `token` blob NOT NULL,
  `token_gateway_id` int(11) NOT NULL DEFAULT '0',
  `taxrateoverride` tinyint(1) NOT NULL DEFAULT '0',
  `taxrate` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `currency_id` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_client_changes_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `who` varchar(127) NOT NULL DEFAULT '',
  `change` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_client_credit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `client_id` int(11) NOT NULL,
  `in` decimal(10,2) NOT NULL DEFAULT '0.00',
  `out` decimal(10,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `description` varchar(255) NOT NULL,
  `transaction_id` varchar(32) NOT NULL DEFAULT '',
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `admin_name` varchar(70) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_client_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `companyname` text NOT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `postcode` text NOT NULL,
  `country` text NOT NULL,
  `phonenumber` text NOT NULL,
  `datecreated` date NOT NULL,
  `notes` text NOT NULL,
  `language` text NOT NULL,
  `company` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `firstname_lastname` (`firstname`(32),`lastname`(32)),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_client_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `field_type` enum('Select','Check','Input','Password') DEFAULT NULL,
  `default_value` text NOT NULL,
  `type` enum('Company','Private','All') NOT NULL DEFAULT 'Private',
  `options` int(5) NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(11) NOT NULL,
  `expression` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `options` (`options`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_client_fields` (`id`, `code`, `name`, `field_type`, `default_value`, `type`, `options`, `description`, `sort_order`, `expression`) VALUES
(1, 'firstname', 'First Name', 'Input', '', 'All', 15, '', 1, NULL),
(2, 'lastname', 'Last Name', 'Input', '', 'All', 15, '', 2, NULL),
(3, 'companyname', 'Organization', 'Input', '', 'Company', 15, '', 3, NULL),
(4, 'address1', 'Address 1', 'Input', '', 'All', 15, '', 4, NULL),
(5, 'address2', 'Address 2', 'Input', '', 'All', 13, '', 5, NULL),
(6, 'city', 'City', 'Input', '', 'All', 15, '', 6, NULL),
(7, 'state', 'State', 'Input', '', 'All', 15, '', 7, NULL),
(8, 'postcode', 'Post code', 'Input', '', 'All', 15, '', 8, NULL),
(9, 'country', 'Country', 'Input', '', 'All', 15, '', 9, NULL),
(10, 'phonenumber', 'Phone', 'Input', '', 'All', 15, '', 10, NULL),
(11, 'type', 'Account Type', 'Select', '', 'All', 27, '', 11, NULL),
(12, 'email', 'Email Address', 'Input', '', 'All', 331, '', 0, NULL),
(13, 'password', 'Password', 'Password', '', 'All', 331, '', 0, NULL),
(14, 'password2', 'Repeat Password', 'Password', '', 'All', 27, '', 0, NULL),
(15, 'language', '_none', 'Input', '', 'All', 47, '', 0, NULL),
(16, 'notes', '_none', 'Input', '', 'All', 47, '', 0, NULL),
(17, 'datecreated', '_none', 'Input', '', 'All', 47, '', 0, NULL),
(18, 'comapny', '_none', 'Input', '', 'All', 47, '', 0, NULL),
(19, 'captcha', 'Image Verification', 'Input', '', 'All', 147, '', 100, NULL);
##########
CREATE TABLE `hb_client_fields_values` (
  `client_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`client_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_client_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) NOT NULL,
  `description` text NOT NULL,
  `color` varchar(7) NOT NULL DEFAULT '#000000',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `scenario_id` int(10) NOT NULL DEFAULT '0',
  `default_priority` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_client_group_discount` (
  `group_id` int(11) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `rel` enum('Product','Category') NOT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  PRIMARY KEY (`group_id`,`rel_id`,`rel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_client_login_status` (
  `client_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `token` varchar(40) NOT NULL,
  `lastseen` datetime NOT NULL,
  PRIMARY KEY (`client_id`,`session_id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_client_privileges` (
  `client_id` int(11) NOT NULL,
  `privileges` text NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_common` (
  `id` int(11) NOT NULL,
  `rel` enum('Product','Addon','Config','Bundled','FResource') NOT NULL,
  `paytype` varchar(20) NOT NULL DEFAULT 'Free',
  `m_setup` decimal(10,2) NOT NULL DEFAULT '0.00',
  `q_setup` decimal(10,2) NOT NULL DEFAULT '0.00',
  `s_setup` decimal(10,2) NOT NULL DEFAULT '0.00',
  `a_setup` decimal(10,2) NOT NULL DEFAULT '0.00',
  `b_setup` decimal(10,2) NOT NULL DEFAULT '0.00',
  `t_setup` decimal(10,2) NOT NULL DEFAULT '0.00',
  `p4_setup` decimal(10,2) NOT NULL DEFAULT '0.00',
  `p5_setup` decimal(10,2) NOT NULL DEFAULT '0.00',
  `d_setup` decimal(10,2) NOT NULL DEFAULT '0.00',
  `w_setup` decimal(10,2) NOT NULL DEFAULT '0.00',
  `h_setup` decimal(10,2) NOT NULL DEFAULT '0.00',
  `m` decimal(10,2) NOT NULL DEFAULT '0.00',
  `q` decimal(10,2) NOT NULL DEFAULT '0.00',
  `s` decimal(10,2) NOT NULL DEFAULT '0.00',
  `a` decimal(10,2) NOT NULL DEFAULT '0.00',
  `b` decimal(10,2) NOT NULL DEFAULT '0.00',
  `t` decimal(10,2) NOT NULL DEFAULT '0.00',
  `p4` decimal(10,2) NOT NULL DEFAULT '0.00',
  `p5` decimal(10,2) NOT NULL DEFAULT '0.00',
  `d` decimal(10,2) NOT NULL DEFAULT '0.00',
  `w` decimal(10,2) NOT NULL DEFAULT '0.00',
  `h` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`,`rel`),
  KEY `paytype` (`paytype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_config2accounts`
--

CREATE TABLE `hb_config2accounts` (
  `rel_type` enum('Hosting','Domain') NOT NULL DEFAULT 'Hosting',
  `account_id` int(11) NOT NULL,
  `config_cat` int(11) NOT NULL,
  `config_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `data` text NOT NULL,
  PRIMARY KEY (`rel_type`,`account_id`,`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_config_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `variable_id` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_config_items_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '1',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `key` varchar(32) NOT NULL,
  `variable` varchar(64) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `category` varchar(64) NOT NULL DEFAULT '',
  `product_id` int(11) NOT NULL,
  `copy_of` int(11) NOT NULL DEFAULT '0',
  `options` int(11) NOT NULL DEFAULT '0',
  `config` text,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category` (`category`(16)),
  KEY `type` (`type`),
  KEY `options` (`options`),
  KEY `copy_of` (`copy_of`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_config_items_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_config_items_types` (`id`, `type`) VALUES
(1, 'select'),
(2, 'qty'),
(3, 'checkbox'),
(4, 'input'),
(5, 'radio'),
(6, 'textarea'),
(7, 'slider'),
(8, 'idprotection');
##########
CREATE TABLE `hb_config_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `qty_max` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_config_upgrades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_type` enum('Hosting','Domain') NOT NULL DEFAULT 'Hosting',
  `account_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `config_cat` int(11) NOT NULL,
  `old_config_id` int(11) NOT NULL,
  `new_config_id` int(11) NOT NULL,
  `old_qty` int(11) NOT NULL,
  `new_qty` int(11) NOT NULL,
  `status` enum('Pending','Upgraded') NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `config_cat` (`config_cat`),
  KEY `rel_type` (`rel_type`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_configuration` (
  `setting` varchar(128) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`setting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_configuration` (`setting`, `value`) VALUES
('1DomainReminder', '50'),
('1OverdueReminder', '1'),
('2DomainReminder', '40'),
('2OverdueReminder', '2'),
('3DomainReminder', '30'),
('3OverdueReminder', '3'),
('4DomainReminder', '10'),
('5DomainReminder', '5'),
('ACHAllowRemove', 'off'),
('ACHAllowStorage', 'on'),
('ACHChargeAuto', 'on'),
('ACHChargeAutoDays', '7'),
('ACHReChargeAuto', 'on'),
('ACHRetryForDays', '3'),
('AddLateFeeAfter', '6'),
('AdvancedDueDate', 'off'),
('AffBonus', '5'),
('AffDelay', '2'),
('AffIntegration', ''),
('AffLandingPage', 'default'),
('AffMinWid', '30'),
('AffRecItems', ''),
('AffRecurring', 'off'),
('AffType', 'Percent'),
('AffValue', '10'),
('AfterOrderRedirect', '1'),
('AllowBulkPayment', 'on'),
('AllowedAttachmentExt', '.jpg;.gif;.zip'),
('ApplyTermsURL', ''),
('AttachPDFCopy', 'off'),
('AttachPDFInvoice', 'off'),
('AttachPDFInvoicePaid', 'off'),
('AutoCancelUnpaidInvoices', 'off'),
('AutologoutTime', '30'),
('AutoProcessCancellations', 'off'),
('AutoRegDomains', 'on'),
('AutoSuspensionPeriod', '10'),
('AutoTerminationPeriod', '30'),
('BCCInvoiceEmails', ''),
('BusinessName', 'Your Business Name'),
('CancelInvoicesOnExpire', 'off'),
('CancelInvoicesOnTerminate', 'off'),
('CaptchaUnregTickets', 'off'),
('CCAllowRemove', 'on'),
('CCAllowStorage', 'on'),
('CCAttemptOnce', 'off'),
('CCChargeAuto', 'on'),
('CCDaysBeforeCharge', '5'),
('CCForceAttempt', 'off'),
('CCRetryForDays', '4'),
('ChatAllowedHosts', ''),
('ChatGeoIPEnabled', 'off'),
('ChatInvitationTimeout', '120'),
('ChatNonClients', 'off'),
('ChatRoundRobinInterval', '45'),
('ChatRoundRobinMiss', '2'),
('ChatTrackHostBill', 'on'),
('CnoteEnable', 'off'),
('CNoteNumerationFormat', '{$number}/{$y}'),
('CNoteNumerationPaid', '1'),
('CNoteTemplate', '102'),
('CompoundL2', 'off'),
('ContinueInvoices', 'on'),
('CurrencyCode', 'USD'),
('CurrencyFormat', '1,234.56'),
('CurrencyName', 'US Dollars'),
('CurrencySign', '$'),
('DateFormat', 'YYYY-MM-DD'),
('DecimalPlaces', '2'),
('DefaultPassComplex', 'off'),
('DefaultPassLength', '8'),
('DefaultPassOptions', '1;1;1;0;8'),
('DefaultResultsQty', '30'),
('DefaultTimezone', 'America/Los_Angeles'),
('DisplayBanInfo', 'off'),
('DisplayDecimalPlaces', '2'),
('dnsmanagement', 'off'),
('DomainAllowOwn', 'on'),
('DomainAllowRegister', 'off'),
('DomainAllowSubdomain', 'on'),
('DomainAllowTransfer', 'off'),
('DomainDNSCharge', '0.00'),
('DomainEmailCharge', '0.00'),
('DomainIDCharge', '0.00'),
('DontSendSubscrInvNotify', 'on'),
('EmailHTMLWrapper', '<div style="font-family:Verdana;font-size:11px">{$message}</div>'),
('EmailSignature', ''),
('EmailSwitch', 'on'),
('EnableAddonRelatedTermination', 'off'),
('EnableAffiliates', 'off'),
('EnableAfteractions', 'on'),
('EnableAutoRegisterDomain', 'on'),
('EnableAutoRenewDomain', 'on'),
('EnableAutoSuspension', 'off'),
('EnableAutoTermination', 'off'),
('EnableAutoTransferDomain', 'on'),
('EnableAutoUnSuspension', 'on'),
('EnableAutoUpgrades', 'on'),
('EnableChat', 'off'),
('EnableClientCaptchaLogin', 'off'),
('EnableClientScurity', 'on'),
('EnableProfiles', 'on'),
('EnableProRata', 'off'),
('EnableQueue', 'on'),
('EnableTax', 'off'),
('EstimateTemplate', '101'),
('ForceSSL', 'off'),
('GenerateSeparateInvoices', 'off'),
('InitialDueDays', '0'),
('InstallURL', 'http://on.hostbillapp.com/'),
('InvCompanyLogo', ''),
('InvoiceDelay', 'off'),
('InvoiceDelayDays', '0'),
('InvoiceExpectDays', '0'),
('InvoiceFooter', ''),
('InvoiceGeneration', '7'),
('InvoiceModel', 'default'),
('InvoiceNumerationFormat', '{$number}/{$m}/{$y}'),
('InvoiceNumerationFrom', '1'),
('InvoiceNumerationPaid', '1'),
('InvoicePaidAutoReset', '0'),
('InvoicePrefix', ''),
('InvoiceStoreClient', 'off'),
('InvoiceTemplate', '1'),
('InvoiceUnpaidReminder', '0'),
('ISOCurrency', 'USD'),
('LateFeeType', '0'),
('LateFeeValue', '0'),
('License', ''),
('MailSMTPEmail', ''),
('MailSMTPHost', 'localhost'),
('MailSMTPPassword', ''),
('MailSMTPPort', '25'),
('MailSMTPUsername', ''),
('MailUseSMTP', 'off'),
('MaintenanceMode', 'off'),
('MaxAttachmentSize', '1'),
('MaxDeposit', '500'),
('MinDeposit', '50'),
('MobileNotificationsAdmin', 'off'),
('MobileNotificationsAPriority', ''),
('MobileNotificationsClient', 'off'),
('MobileNotificationsDepts', ''),
('MobileNotificationsModAdmin', 'all'),
('MobileNotificationsModClient', 'all'),
('Netstat', 'off'),
('NetstatFTP', 'on'),
('NetstatHTTP', 'on'),
('NetstatIMAP', 'on'),
('NetstatLOAD', 'on'),
('NetstatMYSQL', 'on'),
('NetstatPOP3', 'on'),
('NetstatSSH', 'on'),
('NetstatUPTIME', 'on'),
('OfferDeposit', 'on'),
('OfferDomains', 'off'),
('OfferDownloads', 'off'),
('OfferEstimates', 'off'),
('OfferKB', 'off'),
('OfferNews', 'off'),
('OfferSupport', 'off'),
('OrderAutoAccept', 'on'),
('PayToText', 'HostBill Demo'),
('PluginUpdates', ''),
('ProRataDay', '1'),
('ProRataMonth', 'disabled'),
('ProRataNextMonth', '0'),
('quickconfig', 'admin_pass|payment'),
('RecordsPerPage', '25'),
('RenewInvoice', '1'),
('RenewOnOrder', ''),
('SendPaymentReminderEmails', 'off'),
('SEOUrlMode', 'index.php?/'),
('ShopingCartMode', '1'),
('StorePDFInvoice', 'off'),
('StorePDFPath', ''),
('SupportedCC', 'Visa,MasterCard,Discover,American Express'),
('SystemMail', ''),
('TaxClientFunds', 'off'),
('TaxDomains', 'off'),
('TaxLateFee', 'off'),
('TaxTimetracking', 'on'),
('TaxType', 'exclusive'),
('TicketAutoClose', '0'),
('TicketHTMLTags', 'off'),
('TicketImportTimeLimit', '5'),
('UserCountry', 'US'),
('UserLanguage', 'english'),
('UserTemplate', 'nextgen_clean'),
('Version', '2015-10-06'),
('VersionLastCheck', '0'),
('VersionLatest', '4.9.8');
##########
CREATE TABLE `hb_coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `type` enum('fixed','percent') NOT NULL,
  `applyto` enum('price','setupfee','both') NOT NULL DEFAULT 'price',
  `cycle` enum('once','recurring') NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `cycles` text NOT NULL,
  `products` text NOT NULL,
  `upgrades` text NOT NULL,
  `addons` text NOT NULL,
  `domains` text NOT NULL,
  `expires` date NOT NULL,
  `max_usage` int(5) NOT NULL,
  `num_usage` int(5) NOT NULL DEFAULT '0',
  `clients` enum('all','new','existing') NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_coupons_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coupon_id` (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_creditnotes` (
  `invoice_id` int(11) NOT NULL,
  `credit_note_id` int(11) NOT NULL,
  `invoice_item_id` int(11) NOT NULL DEFAULT '0',
  `credit_item_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`invoice_id`,`credit_note_id`,`invoice_item_id`),
  KEY `credit_item_id` (`credit_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
##########
CREATE TABLE `hb_cron_tasks` (
  `task` varchar(40) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `lastrun` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `count` tinyint(4) NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `output` text NOT NULL,
  `run_every` enum('Run','Time','Week','Month','Hour') NOT NULL,
  `run_every_time` varchar(5) NOT NULL,
  PRIMARY KEY (`task`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_cron_tasks` (`task`, `name`, `lastrun`, `status`, `count`, `metadata`, `output`, `run_every`, `run_every_time`) VALUES
('affiliateAutoPayout', 'Automatic pay-out for affiliates', '0000-00-00 00:00:00', 1, 0, '', '', 'Time', '1200'),
('affiliateMonthlyReport', 'Send affiliate monthly referral report', '0000-00-00 00:00:00', -1, 0, '', '', 'Month', '1'),
('automaticDomainExpire', 'Change status of expired domains', '0000-00-00 00:00:00', -1, 0, '', '', 'Time', '1200'),
('automaticRegisterDomains', 'Auto-Register Domains', '0000-00-00 00:00:00', 1, 0, '', '', 'Run', '1200'),
('automaticRenewDomains', 'Auto-Renew Domains', '0000-00-00 00:00:00', 1, 0, '', '', 'Run', '1200'),
('automaticSynchronizePendingDomains', 'Synchronize Pending Action Domains', '0000-00-00 00:00:00', -1, 0, '', '', 'Hour', '1200'),
('automaticTransferDomains', 'Auto-Transfer Domains', '0000-00-00 00:00:00', -1, 0, '', '', 'Run', '1200'),
('cancellationRequests', 'Automatic Cancellation Requests Processing ', '0000-00-00 00:00:00', 1, 0, '', '', 'Run', '1200'),
('chargeACH', 'Process ACH/eChecks Charges', '0000-00-00 00:00:00', 1, 0, '', '', 'Time', '1100'),
('chargeCC', 'Charge credit cards', '0000-00-00 00:00:00', -1, 0, '', '', 'Time', '1200'),
('custom:2:call_Daily', 'Module - AutoUpgrade, daily cron call', '0000-00-00 00:00:00', 1, 0, '', '', 'Time', '1200'),
('customModules', 'customModules', '0000-00-00 00:00:00', 1, 0, '', '', 'Run', '1200'),
('domainNotification', 'Send Expiring Domain Notifications ', '0000-00-00 00:00:00', 1, 0, '', '', 'Time', '1200'),
('domainSync', 'Synchronize domain expiration dates with registrars ', '0000-00-00 00:00:00', 1, 0, '', '', 'Hour', '1'),
('escalateTickets', 'Escalate overdue tickets', '0000-00-00 00:00:00', 1, 0, '', '', 'Run', '1200'),
('generateInvoices', 'Generate Invoices', '0000-00-00 00:00:00', 1, 0, '', '', 'Time', '1200'),
('importPOP', 'Import Tickets using POP method', '0000-00-00 00:00:00', 1, 0, '', '', 'Run', '1200'),
('InvoiceReminder', 'Send Invoice Reminders', '0000-00-00 00:00:00', 1, 0, '', '', 'Time', '1200'),
('lateFeeInvoices', 'Add Late Fee to overdue invoices', '0000-00-00 00:00:00', 1, 0, '', '', 'Time', '1200'),
('meteredBillingUpdate', 'Update Metered Billing Values', '0000-00-00 00:00:00', 1, 0, '', '', 'Run', '1200'),
('moduleAutomation', 'Perform auto provisioning tasks like suspend/terminate', '0000-00-00 00:00:00', 1, 0, '', '', 'Time', '1200'),
('outdateEstimates', 'Mark outdated estimates Dead', '0000-00-00 00:00:00', -1, 0, '', '', 'Time', '1200'),
('processAccountProvisioning', 'Auto provision paid accounts', '0000-00-00 00:00:00', 1, 0, '', '', 'Run', '1200'),
('sendCronResults', 'Send daily Cron-Runs results email', '0000-00-00 00:00:00', 1, 0, '', '', 'Time', '1200'),
('sendScheduledTickets', 'Send-Out scheduled support tickets / ticket replies', '0000-00-00 00:00:00', 1, 0, '', '', 'Run', '1200'),
('subscriptionItemsCleanup', 'Remove unused subscription items', '0000-00-00 00:00:00', 1, 0, '', '', 'Time', '1200'),
('TaskScheduler', 'Automation queue scheduler', '0000-00-00 00:00:00', 1, 0, '', '', 'Hour', '1100'),
('TaskScheduler_Execute', 'Execute custom automation tasks', '0000-00-00 00:00:00', 1, 0, '', '', 'Run', '1100'),
('ticketAutoClose', 'Auto-Close tickets non-answered by client', '0000-00-00 00:00:00', 1, 0, '', '', 'Run', '1200'),
('updateConversionRates', 'Update Conversion Rates', '0000-00-00 00:00:00', -1, 0, '', '', 'Time', '1200');
##########
CREATE TABLE `hb_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(4) NOT NULL,
  `sign` varchar(4) NOT NULL,
  `iso` varchar(4) NOT NULL,
  `rate` decimal(15,10) NOT NULL DEFAULT '1.0000000000',
  `last_changes` datetime NOT NULL,
  `update` tinyint(1) NOT NULL DEFAULT '1',
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `format` varchar(16) NOT NULL,
  `decimal` tinyint(4) DEFAULT NULL,
  `rounding` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_currency2country`
--

CREATE TABLE `hb_currency2country` (
  `country` varchar(2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  PRIMARY KEY (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
##########
CREATE TABLE `hb_currency_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL,
  `base_currency_id` int(11) NOT NULL DEFAULT '0',
  `rate` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `comment` varchar(127) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`,`currency_id`,`date`),
  KEY `base_currency_id` (`base_currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_declined_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_hash` char(40) NOT NULL,
  `client_id` int(11) NOT NULL,
  `card` char(16) NOT NULL,
  `date` datetime NOT NULL,
  `reason` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `card_hash` (`card_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_dns_domains` (
  `account_id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`domain_id`,`account_id`),
  KEY `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_dns_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `template` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_dns_templates_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(6) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `ttl` int(11) DEFAULT NULL,
  `prio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_dnsconfig` (
  `setting` varchar(128) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`setting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_dnsconfig` (`setting`, `value`) VALUES
('hash', ''),
('ip', ''),
('ns1', ''),
('ns1ip', ''),
('ns2', ''),
('ns2ip', ''),
('ns3', ''),
('ns3ip', ''),
('password', ''),
('ssl', '0'),
('username', '');
##########
CREATE TABLE `hb_dnsdomains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `domain` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_dnslogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action` text NOT NULL,
  `fields` text NOT NULL,
  `errors` text NOT NULL,
  `result` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_domain_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `admin_login` text NOT NULL,
  `date` datetime NOT NULL,
  `module` varchar(32) NOT NULL,
  `action` text NOT NULL,
  `result` tinyint(1) NOT NULL,
  `change` text NOT NULL,
  `error` text NOT NULL,
  `event` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `domain_id` (`domain_id`),
  KEY `event` (`event`(12))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_domain_periods` (
  `product_id` int(11) NOT NULL,
  `period` tinyint(3) NOT NULL DEFAULT '1',
  `register` decimal(10,2) NOT NULL DEFAULT '0.00',
  `transfer` decimal(10,2) NOT NULL DEFAULT '0.00',
  `renew` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`product_id`,`period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_domain_prices` (
  `product_id` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  `not_renew` tinyint(1) NOT NULL,
  `epp` tinyint(4) NOT NULL DEFAULT '1',
  `options` tinyint(4) NOT NULL DEFAULT '1',
  `ns` text NOT NULL,
  `nsips` text NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `tld_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `reg_module` int(11) NOT NULL,
  `payment_module` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `firstpayment` decimal(10,2) NOT NULL DEFAULT '0.00',
  `recurring_amount` decimal(10,2) NOT NULL,
  `period` int(1) NOT NULL DEFAULT '1',
  `expires` date DEFAULT NULL,
  `type` enum('Register','Transfer','Renew') NOT NULL,
  `status` enum('Pending','Pending Registration','Pending Transfer','Active','Expired','Cancelled','Fraud') NOT NULL DEFAULT 'Pending',
  `next_due` date NOT NULL,
  `next_invoice` date NOT NULL,
  `idprotection` tinyint(1) NOT NULL DEFAULT '0',
  `nameservers` text NOT NULL,
  `autorenew` tinyint(1) NOT NULL,
  `reglock` tinyint(1) NOT NULL,
  `manual` tinyint(1) NOT NULL DEFAULT '0',
  `epp_code` text NOT NULL,
  `notes` text NOT NULL,
  `extended` text NOT NULL,
  `synch_date` datetime DEFAULT '0000-00-00 00:00:00',
  `nsips` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `order_id` (`order_id`),
  KEY `name` (`name`(64)),
  KEY `status` (`status`),
  KEY `tld_id` (`tld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `size` int(11) NOT NULL,
  `uploaded` date NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `rel_type` tinyint(11) NOT NULL DEFAULT '0',
  `rel_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `clients` (`rel_type`),
  KEY `client_id` (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_downloads_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `visible` (`visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_email_assign` (
  `id` int(11) NOT NULL,
  `rel` enum('Product','Addon','Department') NOT NULL DEFAULT 'Product',
  `event` varchar(64) NOT NULL,
  `email_id` int(11) NOT NULL,
  `options` text,
  PRIMARY KEY (`id`,`rel`,`event`),
  KEY `email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_email_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tplname` varchar(128) NOT NULL,
  `group` enum('Domain','Product','Invoice','General','Support','Custom','Mobile') DEFAULT NULL,
  `for` enum('Client','Admin') NOT NULL DEFAULT 'Client',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `altmessage` text NOT NULL,
  `send` tinyint(1) DEFAULT '1',
  `plain` tinyint(1) DEFAULT '0',
  `system` tinyint(1) DEFAULT '1',
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`,`language_id`),
  KEY `tplname` (`tplname`(32)),
  KEY `group` (`group`),
  KEY `for` (`for`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_email_templates` (`id`, `tplname`, `group`, `for`, `language_id`, `subject`, `message`, `altmessage`, `send`, `plain`, `system`, `hidden`) VALUES
(1, 'Details:Signup', 'General', 'Client', 1, 'Client:Welcome to Portal', 'DEAR {$client.firstname} {$client.lastname},\r\n\r\nLOGIN DETAILS:\r\nEmail Address: {$client.email}\r\nPassword: {$client.password}\r\n{$system_url}?cmd=clientarea\r\n ', '', 1, 1, 1, 0),
(2, 'Invoice:New', 'Invoice', 'Client', 1, 'Invoice #{$invoice.id}: Created', 'Dear {$client.firstname} {$client.lastname}, \r\n\r\nINVOICE  #{$invoice.id} \r\nSTATUS: {$invoice.status}\r\nAMOUNT DUE: {$invoice.total|price:$currency}\r\nDUE DATE: {$invoice.duedate|dateformat:$date_format}\r\nGENERATE ON: {$invoice.date|dateformat:$date_format}.\r\n\r\nPAYMENT METHOD:\r\n {$invoice.gateway}\r\n\r\nInvoice Items\r\n{foreach from=$invoiceitems item=item}\r\n {$item.description}  {if $item.qty}{$item.qty} x {/if}{$item.amount|price:$currency}\r\n{/foreach}\r\n------------------------------------------------------\r\n\r\nPAY LINK:\r\n {$invoices_url}\r\n\r\n', '', 1, 1, 1, 0),
(3, 'Invoice:Paid', 'Invoice', 'Client', 1, 'Invoice #{$invoice.id}: Paid', 'Dear {$client.firstname} {$client.lastname}, \r\n\r\nTHANK YOU FOR PAYMENT!\r\n\r\nINVOICE  #{$invoice.id} \r\nSTATUS: {$invoice.status}\r\nTOTAL PAID: {$invoice.total|price:$currency}\r\nSENT ON: {$invoice.date|dateformat:$date_format}\r\n\r\n\r\n\r\n\r\nINVOICE HISTORY: {$clientarea_url}\r\n', '', 1, 1, 1, 0),
(4, 'Order:New', 'General', 'Client', 1, 'New Order #{$order.number}', 'DEAR {$client.firstname} {$client.lastname},\r\n\r\nTHANK YOU FOR ORDER\r\n\r\nORDER NUMBER: {$order.number}\r\n\r\n{foreach from=$order_details item=item}\r\n {$item.description} {$item.amount|price:$currency}\r\n{/foreach}\r\n\r\n\r\nWE WILL ACTIVATE PRODUCT/SERVICE ASAP.\r\n ', '', 1, 1, 1, 0),
(5, 'Ticket:New', 'Support', 'Client', 1, 'Ticket:New', '{$ticket.name},\r\n\r\nThank you for request. We will be in touch shortly.\r\n\r\nSUBJECT: {$ticket.subject}\r\n\r\nSTATUS:\r\n{$ticket.status}\r\n{$ticket_url}\r\n\r\n{if $ticket_attachments}\r\nFollowing files have been attached:\r\n{foreach from=$ticket_attachments item=attachment}\r\n{$attachment.org_filename},\r\n{/foreach}\r\n{/if}\r\n\r\n{if $ticket_attachments_errors}\r\nFollowing Files: {foreach from=$ticket_attachments_errors item=attachment}{$attachment.org_filename},{/foreach} have been rejected.\r\nSupported attachments extensions: {$attachments_ext}\r\n{/if}', '', 1, 1, 1, 0),
(7, 'Account:Created:DirectAdmin', 'Product', 'Client', 1, 'New Hosting Account Created', 'Dear {$client.firstname} {$client.lastname}.\r\n\r\nYour order has been accepted and your hosting account has been activated.\r\n\r\n<strong>New Account Information</strong>\r\n\r\nHosting Package: {$service.product_name}\r\nDomain: {$service.domain}\r\nFirst Payment Amount: {$service.firstpayment|price:$currency}\r\nTotal Amount: {$service.total|price:$currency}\r\nBilling Cycle: {$service.billingcycle}\r\nNext Due Date: {$service.next_due|dateformat:$date_format}\r\n\r\n<strong>Login Details</strong>\r\n\r\nUsername: {$service.username}\r\nPassword: {$service.password}\r\n\r\nControl Panel URL: http://{$server.ip}:2222/\r\nOnce your domain has propogated, you may also use http://www.{$service.domain}:2222/\r\n\r\n<strong>Server Information</strong>\r\n\r\nServer Name: {$server.name}\r\nServer IP: {$server.ip}\r\n\r\nIf you are using an existing domain with your new hosting account, you will need to update the nameservers to point to the nameservers listed below.\r\n\r\nNameserver 1: {$server.ns1} ({$server.ip1})\r\nNameserver 2: {$server.ns2} ({$server.ip2}){if $service_ns3}\r\nNameserver 3: {$server.ns3} ({$server.ip3}){/if}{if $service_ns4}\r\nNameserver 4: {$server.ns4} ({$server.ip4}){/if}\r\n\r\n<strong>Uploading Your Website</strong>\r\n\r\nTemporarily you may use one of the addresses given below manage your web site:\r\n\r\nTemporary FTP Hostname: {$server.ip}\r\nTemporary Webpage URL: http://{$server.ip}/~{$service.username}/\r\n\r\nAnd once your domain has propagated you may use the details below:\r\n\r\nFTP Hostname: www.{$service.domain}\r\nWebpage URL: http://www.{$service.domain}\r\n\r\n<strong>Email Settings</strong>\r\n\r\nFor email accounts that you setup, you should use the following connection details in your email program:\r\n\r\nPOP3 Host Address: mail.{$service.domain}\r\nSMTP Host Address: mail.{$service.domain}\r\nUsername: The email address you are checking email for\r\nPassword: As specified in your control panel\r\n', '', 1, 0, 1, 0),
(8, 'Account:Suspended', 'Product', 'Client', 1, 'Account :Suspended', 'DEAR {$client.firstname} {$client.lastname},\r\n\r\nYOUR HOSTING ACCOUNT HAS BEEN SUSPENDED \r\n\r\nDETAILS:\r\nPRODUCT/SERVICE: {$service.product_name}\r\nDOMAIN: {$service.domain}\r\n\r\n <strong>NEXT DUE DATE: {$service.next_due|dateformat:$date_format}</strong>\r\n\r\n\r\n', '', 1, 0, 1, 0),
(9, 'Account:Unsuspended', 'Product', 'Client', 1, 'Account {$service.domain}: Unsuspended', 'DEAR {$client.firstname} {$client.lastname},\r\n\r\nYOUR HOSTING ACCOUNT HAS BEEN UNSUSPENDED \r\n\r\nDETAILS:\r\nPRODUCT/SERVICE: {$service.product_name}\r\nDOMAIN: {$service.domain}\r\n <strong>NEXT DUE DATE: {$service.next_due|dateformat:$date_format}</strong>\r\n\r\n', '', 1, 0, 1, 0),
(10, 'Ticket:Reply', 'Support', 'Client', 1, 'Ticket:Reply', '{$reply.body}\r\n\r\n{$reply.signature}\r\n----------------------------------------------\r\nTicket ID: {$ticket.ticket_number}\r\nSubject: {$ticket.subject}\r\nStatus: {$ticket.status}\r\nTicket URL:  {$ticket_url}\r\n----------------------------------------------', '', 1, 1, 1, 0),
(11, 'Ticket:Reply', 'Support', 'Admin', 1, 'New Admin Ticket Reply', '{$reply.body}\r\n\r\n----------------------------------------------\r\nTicket ID: {$ticket.ticket_number}\r\nSubject: {$ticket.subject}\r\nStatus: {$ticket.status}\r\nURL: {$ticket_admin_url}\r\nAvailable actions:\r\n- Close ticket: {$admin_url}?cmd=tickets&action=menubutton&id={$ticket.ticket_number}&status=Closed&make=setstatus\r\n- Delete Ticket: {$admin_url}?cmd=tickets&action=menubutton&id={$ticket.ticket_number}&make=deleteticket\r\n----------------------------------------------', '', 1, 1, 1, 0),
(12, 'Ticket:New', 'Support', 'Admin', 1, 'New Admin Ticket', '{$ticket.body}\r\n\r\n------------------------------------------\r\nSubject: {$ticket.subject}\r\nStatus: {$ticket.status}\r\nSubmitter: {$ticket.name}\r\nURL: {$ticket_admin_url}\r\n----------------------------------------------', '', 1, 1, 1, 0),
(13, 'Ticket:Bounce', 'Support', 'Client', 1, 'Your Ticket was not opened', '{$email_name},\r\n\r\nYour email to our support system could not be accepted as ticket because department you''ve sent email to is for registered customers only, and Your email was not recognised as our customer''s one.', '', 1, 1, 1, 0),
(15, 'Invoice:Overdue', 'Invoice', 'Client', 1, 'Invoice #{$invoice.id}: Payment Reminder', 'Dear {$client.firstname} {$client.lastname},\r\n\r\nINVOICE:                {$invoice.id}\r\nGENERATED AT: {$invoice.date|dateformat:$date_format} \r\nDUE DATE:           {$invoice.duedate|dateformat:$date_format}.\r\n\r\nPAYMENT METHOD \r\n{$invoice.gateway}\r\n\r\n\r\nAmount Due: {$invoice.total|price:$currency}\r\n\r\nLINK TO PAY\r\n{$invoices_url}', '', 1, 1, 1, 0),
(19, 'Account:Automation Results', 'Product', 'Admin', 1, 'Account #{$service.id} Notify', 'Action: {$account_action}\r\nResult: {if $result}Success{else}FAIL{/if}\r\n\r\n{if $account_error}Errors:\r\n    {foreach from=$account_error item=errx}\r\n        {$errx}\r\n    {/foreach}\r\n{/if}\r\n----------------------------------------------------\r\n# Client: {$client.firstname} {$client.lastname}\r\n# Order ID:  {$service.order_id}\r\n# Order Number: {$service.order_num}\r\n\r\n# Domain Name: {$service.domain}\r\n# Registrar: {$domain_module}\r\n\r\n# Server Name: {$server.name}\r\n# Server Hostname: {$server.host}\r\n# Server IP: {$server.ip}\r\n# Server NameServer 1: {$server.ns1}\r\n# Server NameServer 2: {$server.ns2}\r\n\r\n# Product: {$service.product_name}\r\n# Username: {$service.username}', '', 1, 1, 1, 0),
(20, 'Account:Created:Cpanel', 'Product', 'Client', 1, 'New Hosting Account Created', 'Dear {$client.firstname} {$client.lastname}.\r\nYour order has been accepted and your hosting account has been activated.\r\n\r\n<strong>New Account Information</strong>\r\nHosting Package: {$service.product_name}\r\nDomain: {$service.domain}\r\nFirst Payment Amount: {$service.firstpayment|price:$currency}\r\nTotal Amount: {$service.total|price:$currency}\r\nBilling Cycle: {$service.billingcycle}\r\nNext Due Date: {$service.next_due|dateformat:$date_format}\r\n\r\n<strong>Login Details</strong>\r\n\r\nUsername: {$service.username}\r\nPassword: {$service.password}\r\n\r\nControl Panel URL: http://{$server.ip}:2082/\r\nSecure Connection Control Panel URL: https://{$server.ip}:2083/\r\nOnce your domain has propogated, you may also use http://www.{$service.domain}:2082/\r\n\r\n<strong>Server Information</strong>\r\n\r\nServer Name: {$server.name}\r\nServer IP: {$server.ip}\r\n\r\nIf you are using an existing domain with your new hosting account, you will need to update the nameservers to point to the nameservers listed below.\r\n\r\nNameserver 1: {$server.ns1} ({$server.ip1})\r\nNameserver 2: {$server.ns2} ({$server.ip2}){if $service_ns3}\r\nNameserver 3: {$server.ns3} ({$server.ip3}){/if}{if $service_ns4}\r\nNameserver 4: {$server.ns4} ({$server.ip4}){/if}\r\n\r\n<strong>Uploading Your Website</strong>\r\n\r\nTemporarily you may use one of the addresses given below manage your web site:\r\n\r\nTemporary FTP Hostname: {$server.ip}\r\nTemporary Webpage URL: http://{$server.ip}/~{$service.username}/\r\n\r\nAnd once your domain has propagated you may use the details below:\r\n\r\nFTP Hostname: www.{$service.domain}\r\nWebpage URL: http://www.{$service.domain}\r\n\r\n<strong>Email Settings</strong>\r\n\r\nFor email accounts that you setup, you should use the following connection details in your email program:\r\n\r\nPOP3 Host Address: mail.{$service.domain}\r\nSMTP Host Address: mail.{$service.domain}\r\nUsername: The email address you are checking email for\r\nPassword: As specified in your control panel', '', 1, 0, 1, 0),
(21, 'Account:Created:Plesk', 'Product', 'Client', 1, 'New Hosting Account Created', 'Dear {$client.firstname} {$client.lastname}.\r\nYour order has been accepted and your hosting account has been activated.\r\n<strong>New Account Information</strong>\r\n\r\nHosting Package: {$service.product_name}\r\nDomain: {$service.domain}\r\nFirst Payment Amount: {$service.firstpayment|price:$currency}\r\nTotal Amount: {$service.total|price:$currency}\r\nBilling Cycle: {$service.billingcycle}\r\nNext Due Date: {$service.next_due|dateformat:$date_format}\r\n\r\n<strong>Login Details</strong>\r\n\r\nUsername: {$service.username}\r\nPassword: {$service.password}\r\n\r\nControl Panel URL: https://{$server.ip}:8443/\r\n\r\n<strong>Server Information</strong>\r\n\r\nServer Name: {$server.name}\r\nServer IP: {$server.ip}\r\n\r\nIf you are using an existing domain with your new hosting account, you will need to update the nameservers to point to the nameservers listed below.\r\n\r\nNameserver 1: {$server.ns1} ({$server.ip1})\r\nNameserver 2: {$server.ns2} ({$server.ip2}){if $server.ns3}\r\nNameserver 3: {$server.ns3} ({$server.ip3}){/if}{if $server.ns4}\r\nNameserver 4: {$server.ns4} ({$server.ip4}){/if}\r\n\r\n<strong>Uploading Your Website</strong>\r\n\r\nTemporarily you may use one of the addresses given below manage your web site:\r\n\r\nTemporary FTP Hostname: {$server.ip}\r\nTemporary Webpage URL: https://{$server.ip}:8443/sitepreview/http/{$service.domain}/\r\n\r\nAnd once your domain has propagated you may use the details below:\r\n\r\nFTP Hostname: www.{$service.domain}\r\nWebpage URL: http://www.{$service.domain}\r\n\r\n<strong>Email Settings</strong>\r\n\r\nFor email accounts that you setup, you should use the following connection details in your email program:\r\n\r\nPOP3 Host Address: mail.{$service.domain}\r\nSMTP Host Address: mail.{$service.domain}\r\nUsername: The email address you are checking email for\r\nPassword: As specified in your control panel\r\n', '', 1, 0, 1, 0),
(22, 'Account:Created:LxAdmin', 'Product', 'Client', 1, 'New Hosting Account Created', 'Dear {$client.firstname} {$client.lastname}.\r\nYour order has been accepted and your hosting account has been activated.\r\n\r\n<strong>New Account Information</strong>\r\nHosting Package: {$service.product_name}\r\nDomain: {$service.domain}\r\nFirst Payment Amount: {$service.firstpayment|price:$currency}\r\nTotal Amount: {$service.total|price:$currency}\r\nBilling Cycle: {$service.billingcycle}\r\nNext Due Date: {$service.next_due|dateformat:$date_format}\r\n\r\n<strong>Login Details</strong>\r\n\r\nUsername: {$service.username}\r\nPassword: {$service.password}\r\n\r\nControl Panel URL: http://{$server.ip}:7778/\r\nSecure Connection Control Panel URL: https://{$server.ip}:7777/\r\nOnce your domain has propogated, you may also use http://www.{$service.domain}:7778/\r\n\r\n<strong>Server Information</strong>\r\n\r\nServer Name: {$server.name}\r\nServer IP: {$server.ip}\r\n\r\nIf you are using an existing domain with your new hosting account, you will need to update the nameservers to point to the nameservers listed below.\r\n\r\nNameserver 1: {$server.ns1} ({$server.ip1})\r\nNameserver 2: {$server.ns2} ({$server.ip2}){if $service_ns3}\r\nNameserver 3: {$server.ns3} ({$server.ip3}){/if}{if $service_ns4}\r\nNameserver 4: {$server.ns4} ({$server.ip4}){/if}\r\n\r\n<strong>Uploading Your Website</strong>\r\n\r\nTemporarily you may use one of the addresses given below manage your web site:\r\n\r\nTemporary FTP Hostname: {$server.ip}\r\nTemporary Webpage URL: http://{$server.ip}/~{$service.username}/\r\n\r\nAnd once your domain has propagated you may use the details below:\r\n\r\nFTP Hostname: www.{$service.domain}\r\nWebpage URL: http://www.{$service.domain}\r\n\r\n<strong>Email Settings</strong>\r\nFor email accounts that you setup, you should use the following connection details in your email program:\r\n\r\nPOP3 Host Address: mail.{$service.domain}\r\nSMTP Host Address: mail.{$service.domain}\r\nUsername: The email address you are checking email for\r\nPassword: As specified in your control panel', '', 1, 0, 1, 0),
(23, 'Cron Results', 'General', 'Admin', 1, 'Cron-Run Results', '{$failed_tasks}<br/>\r\nCron Report generated: {$date}<br/>\r\n<br/>\r\n<br/>\r\n<strong>Invoices</strong><br/>\r\n<u>Invoices Generated ({$invoices_generated_count})</u><br/>\r\n{if $invoices_generated}<br/>\r\n{foreach from=$invoices_generated item=gen_inv}<br/>\r\n        #{$gen_inv.id} - {$gen_inv.client}(ID: {$gen_inv.client_id}) - Total: {$gen_inv.total|price:$currency}<br/>\r\n    {/foreach}<br/>\r\n{else}<br/>\r\n<br/>\r\n{/if}<br/>\r\n<u>Invoices Cancelled ({$invoices_cancelled_count})</u><br/>\r\n{if $invoices_cancelled}<br/>\r\n    {foreach from=$invoices_cancelled item=can_inv}<br/>\r\n        #{$can_inv.id}: {$can_inv.firstname} {$can_inv.lastname}(ID: {$can_inv.client_id}) - Total: {$can_inv.total|price:$currency}, Balance: {$can_inv.balance|price:$currency}<br/>\r\n    {/foreach}<br/>\r\n{else}<br/>\r\n<br/>\r\n{/if}<br/>\r\n<br/>\r\n{if $reminds}<br/>\r\n<strong>Overdue Invoice Reminders Sent ({$reminds_count})</strong><br/>\r\n<br/>\r\n    {foreach from=$reminds item=remind}<br/>\r\n        {if $remind.number == 1}First{elseif $remind.number == 2}Second{else}Third{/if} Remind For {$remind.client}(ID:{$remind.client_id}) - Invoice #{$remind.id}<br/>\r\n    {/foreach}<br/>\r\n<br/>\r\n{/if}<br/>\r\n<br/>\r\n<strong>Accounts</strong><br/>\r\n<u>Accounts Suspended ({$suspended_accounts_count})</u><br/>\r\n{if $suspended_accounts}<br/>\r\n    {foreach from=$suspended_accounts item=sacc}<br/>\r\n        #{$sacc.id}: {$sacc.product_name} - {$sacc.domain} (Server: {$sacc.server_name} - {$sacc.server_ip}, Username: {$sacc.username}) Client: {$sacc.client}(ID:{$sacc.client_id})<br/>\r\n    {/foreach}<br/>\r\n{else}<br/>\r\n<br/>\r\n{/if}<br/>\r\n<u>Accounts Terminated ({$terminated_accounts_count})</u><br/>\r\n{if $terminated_accounts}<br/>\r\n    {foreach from=$terminated_accounts item=tacc}<br/>\r\n        #{$tacc.id}: {$tacc.product_name} - {$tacc.domain} (Server: {$tacc.server_name} - {$tacc.server_ip}, Username: {$tacc.username}) Client: {$tacc.client}(ID:{$tacc.client_id})<br/>\r\n    {/foreach}<br/>\r\n{else}<br/>\r\n<br/>\r\n{/if}<br/>\r\n<br/>\r\n<strong>Addons</strong><br/>\r\n<u>Addons Suspended ({$suspended_addons_count})</u><br/>\r\n{if $suspended_addons}<br/>\r\n    {foreach from=$suspended_addons item=sadd}<br/>\r\n        #{$sadd.id}: {$sadd.name} {if $sadd.product_name}({$sadd.product_name}, {$sadd.domain}){else}(Account ID:{$sadd.account_id}){/if} Client: {$sadd.client}(ID:{$sadd.client_id})<br/>\r\n    {/foreach}<br/>\r\n{else}<br/>\r\n<br/>\r\n{/if}<br/>\r\n<u>Addons Terminated ({$terminated_addons_count})</u><br/>\r\n{if $terminated_addons}<br/>\r\n    {foreach from=$terminated_addons item=tadd}<br/>\r\n        #{$tadd.id}: {$tadd.name} {if $tadd.product_name}({$tadd.product_name}, {$sadd.domain}){else}(Account ID:{$tadd.account_id}){/if} Client: {$tadd.client}(ID:{$tadd.client_id})<br/>\r\n    {/foreach}<br/>\r\n{else}<br/>\r\n<br/>\r\n{/if}<br/>\r\n<br/>\r\n<strong></strong><br/>\r\n<strong>Upcoming Domain Renewal Notifications Sent ({$domain_reminds_count})</strong><br/>\r\n<br/>\r\n{if $domain_reminds}<br/>\r\n	{foreach from=$domain_reminds item=remind}<br/>\r\n	- Client: {$remind.client} (ID:{$remind.client_id}) - {$remind.domain} expiring: {$remind.expires|dateformat:$date_format}<br/>\r\n	 {/foreach}<br/>\r\n{/if}<br/>\r\n<br/>\r\n<br/>\r\n<strong>Cancellation Requests Processing</strong><br/>\r\n<u>Successfull automatic cancellations ({$cancellations_success_count})</u><br/>\r\n{if $cancellations_success}<br/>\r\n	{foreach from=$cancellations_success item=cancel}<br/>\r\n	#Acc ID: {$cancel.account_id} - Client: {$cancel.client} (ID:{$cancel.client_id}) - {$cancel.domain}<br/>\r\n	 {/foreach}<br/>\r\n{/if}<br/>\r\n<br/>\r\n<br/>\r\n<u>Manual cancellation needed ({$cancellations_failed_count})</u><br/>\r\n{if $cancellations_failed} [see errors below]<br/>\r\n	{foreach from=$cancellations_failed item=cancel}<br/>\r\n	#Acc ID: {$cancel.account_id} - Client: {$cancel.client} (ID:{$cancel.client_id}) - {$cancel.domain}<br/>\r\n	 {/foreach}<br/>\r\n{/if}<br/>\r\n<br/>\r\n<br/>\r\n<br/>\r\n<strong>Tickets</strong><br/>\r\n<u>Tickets Automatically Closed ({$tickets_closed_count})</u><br/>\r\n{if $tickets_closed}<br/>\r\n {foreach from=$tickets_closed item=closed}<br/>\r\n- {$closed.subject}<br/>\r\n{/foreach}<br/>\r\n<br/>\r\n{/if}<br/>\r\n<br/>\r\n<br/>\r\n------------------------------------------------------------------------<br/>\r\n<strong>Errors:</strong><br/>\r\n{if $suspend_errors}<br/>\r\n<br/>\r\n    <u>Failed accounts automatic suspension (<font style="" red\\="">{$suspend_errors_count}</font>)</u><br/>\r\n    {foreach from=$suspend_errors item=sus_err}<br/>\r\n        #{$sus_err.id}: {$sus_err.product_name} - {$sus_err.domain} (Server: {$sus_err.server_name} - {$sus_err.server_ip}, Username: {$sus_err.username}) Client: {$sus_err.client}(ID:{$sus_err.client_id})<br/>\r\n        <font style="" red\\="">{$sus_err.error}</font><br/>\r\n    {/foreach}<br/>\r\n{/if}<br/>\r\n{if $terminate_errors}<br/>\r\n<br/>\r\n    <u>Failed accounts automatic termination (<font style="" red\\="">{$terminate_errors_count}</font>)</u><br/>\r\n    {foreach from=$terminate_errors item=ter_err}<br/>\r\n        #{$ter_err.id}: {$ter_err.product_name} - {$ter_err.domain} (Server: {$ter_err.server_name} - {$ter_err.server_ip}, Username: {$ter_err.username}) Client: {$ter_err.client}(ID:{$ter_err.client_id})<br/>\r\n        <font style="" red\\="">{$ter_err.error}</font><br/>\r\n    {/foreach}<br/>\r\n{/if}<br/>\r\n{if $cancellations_failed}<br/>\r\n<br/>\r\n<u>Errors during automatic cancellation requests processing:</u><br/>\r\n	{foreach from=$cancellations_failed item=cancel}<br/>\r\n	#Acc ID: {$cancel.account_id} - Client: {$cancel.client} (ID:{$cancel.client_id}) - {$cancel.domain} <br/>\r\n                           {foreach from=$cancel.errors item=err} <font style="" red\\="">{$err}</font><br/>\r\n		{/foreach}<br/>\r\n            {/foreach}<br/>\r\n{/if}<br/>\r\n<br/>\r\n------------------------------------------------------------------------<br/>\r\n<br/>\r\n<br/>\r\n {$output}<br/>\r\n', '', 1, 0, 1, 0),
(24, 'Order:New', 'General', 'Admin', 1, 'New Order #{$order.id}', '---------------------------------------------------------------\r\nOrder Info\r\n---------------------------------------------------------------\r\n# Order ID: {$order.id}\r\n# Order Number: {$order.number}\r\n# Date Created: {$order.date_created|dateformat:$date_format}\r\n# Invoice Number: {$order.invoice_id}\r\n# Payment Method: {$order.module}\r\n{if $order.fraudscore}# FraudModule risk score: {$order.fraudscore}{/if}\r\n\r\n---------------------------------------------------------------\r\nClient Info\r\n---------------------------------------------------------------\r\n# ID: {$client.id}\r\n# Name: {$client.firstname} {$client.lastname}\r\n# Email: {$client.email}\r\n# Company: {$client.companyname}\r\n# Address 1: {$client.address1}\r\n# Address 2: {$client.address2}\r\n# City: {$client.city}\r\n# State/Region: {$client.state}\r\n# Zip Code: {$client.postcode}\r\n# Country: {$client.country}\r\n# Phone Number: {$client.phonenumber}\r\n\r\n---------------------------------------------------------------\r\nOrder Items\r\n---------------------------------------------------------------\r\n{if $order_details}\r\n{foreach from=$order_details item=item}\r\n #  {$item.amount|price:$currency} - {$item.description}\r\n{/foreach}\r\n\r\nTotal(+tax): {$order.total|price:$currency}\r\n{else}\r\nNo items to list.\r\n{/if}\r\n\r\n\r\n---------------------------------------------------------------\r\nIP: {$ip_addr}\r\nHost: {$host_addr}', '', 1, 1, 1, 0),
(25, 'Account:Cancellation Request', 'General', 'Admin', 1, 'Account #{$details.acc_id} Cancellation Request', 'Cancellation request has been submitted by:\r\n# Client ID: {$client.id} \r\n# Client Name: {$client.firstname} {$client.lastname} \r\n\r\n# Order ID: {$order_id}\r\n\r\n# Account ID: {$details.acc_id}\r\n# Type: {$details.type}\r\n# Reason: {$details.reason}', '', 1, 1, 1, 0),
(28, 'Domain:Registered', 'Domain', 'Client', 1, 'Domain {$domain.name}: Registered', 'Dear {$client.firstname} {$client.lastname},\r\n\r\nDOMAIN: {$domain.name} has been registered.\r\n\r\n\r\nDETAILS:\r\nREGISTRATION DATE: {$domain.date_created|dateformat:$date_format}\r\nREGISTRATION PERIOD: {$domain.period} year/s\r\nNEXT DUE DATE: {$domain.next_due|dateformat:$date_format}\r\nAMOUNT: {$domain.firstpayment|price:$currency}', '', 1, 1, 1, 1),
(29, 'Domain:Renewed', 'Domain', 'Client', 1, 'Domain {$domain.name}: Renewed', 'Dear {$client.firstname} {$client.lastname},\r\n\r\nDOMAIN: {$domain.name} has been renewed!\r\n\r\nDETAILS:\r\nRENEWAL PERIOD:  {$domain.period} year/s\r\nRENEWAL PRICE: {$domain.recurring_amount|price:$currency}\r\nNEXT DUE DATE:  {$domain.next_due|dateformat:$date_format}\r\n', '', 1, 1, 1, 1),
(30, 'Domain:Transfer Started', 'Domain', 'Client', 1, 'Domain {$domain.name}: Transfer Initiated', 'Dear {$client.firstname} {$client.lastname},\r\n\r\nTransfer of  DOMAIN: {$domain.name} has been initiated. \r\n\r\nDETAILS:\r\nREGISTRATION PERIOD:  {$domain.period} year/s\r\nAMOUNT:  {$domain.firstpayment|price:$currency}\r\nRENEWAL PRICE: {$domain.recurring_amount|price:$currency}\r\nNEXT DUE DATE:  {$domain.next_due|dateformat:$date_format}', '', 1, 1, 1, 1),
(32, 'Details:Failed Login', 'General', 'Admin', 1, 'Failed Admin Login', '{if $third}\r\nThis is third failed login attempt!\r\nIP has been banned for 5 hours.\r\n{else}\r\nThere was a failed login attempt to admin area in HostBill.\r\n{/if}\r\n----------------------------------------------------\r\nDate: {$date}\r\nIP: {$ip}\r\nHost: {$host}\r\n\r\nLogin: {$login}\r\n----------------------------------------------------', '', 1, 1, 1, 1),
(33, 'Clients:Details Changed', 'General', 'Admin', 1, 'Client #{$old.id} Details Changed', 'Client with ID #{$old.id} changed his details.\r\n\r\n---------------------------------------------------------------\r\nOld Details\r\n---------------------------------------------------------------\r\n# First Name: {$old.firstname}\r\n# Last Name: {$old.lastname}\r\n# Email Address: {$old.email}\r\n# Company Name: {$old.companyname}\r\n# Address 1: {$old.address1}\r\n# Address 2: {$old.address2}\r\n# City: {$old.city}\r\n# State/Region: {$old.state}\r\n# Zip Code: {$old.postcode}\r\n# Country: {$old.country}\r\n# Phone Number: {$old.phonenumber}\r\n\r\n---------------------------------------------------------------\r\nNew Details\r\n---------------------------------------------------------------\r\n# First Name: {$new.firstname}\r\n# Last Name: {$new.lastname}\r\n# Email Address: {$new.email}\r\n# Company Name: {$new.companyname}\r\n# Address 1: {$new.address1}\r\n# Address 2: {$new.address2}\r\n# City: {$new.city}\r\n# State/Region: {$new.state}\r\n# Zip Code: {$new.postcode}\r\n# Country: {$new.country}\r\n# Phone Number: {$new.phonenumber}', '', 1, 1, 1, 1),
(34, 'Account:Automatic Setup', 'Product', 'Admin', 1, 'Automatic Setup: Account #{$service.id}', 'First payment has been received for the following order and account has been automatically created.\r\n\r\n# Order ID: {$service.order_id}\r\n# Order Number: {$service.order_num}\r\n\r\n# Client: {$client.firstname} {$client.lastname}, ID: {$client.client_id}\r\n# Product: {$service.product_name}\r\n# Domain: {$service.domain}', '', 1, 1, 1, 1),
(35, 'Details:Password Reset', 'General', 'Client', 1, 'Login details to {$system_url}', 'DEAR {$client.firstname} {$client.lastname},\r\n\r\n\r\nEMAIL: {$client.email}\r\nPASSWORD:{$newpass}\r\n\r\nLOGIN LINK  {$system_url}\r\n ', '', 1, 1, 1, 1),
(54, 'Domain:Reminder', 'Domain', 'Client', 1, 'Domain: {$domain.name} Renew Now', 'DEAR {$client.firstname} {$client.lastname},\r\n\r\nDOMAIN:{$domain.name}  WILL EXPIRE ON {$domain.expires|dateformat:$date_format} .\r\n\r\n\r\n\r\nRENEW DOMAIN:\r\n {$clientarea_url}\r\n\r\n', '', 1, 1, 1, 0),
(55, 'Ticket:AutoClose', 'Support', 'Client', 1, 'Support Ticket Closed', '{$ticket.name},\r\n\r\nTicket: #{$ticket.ticket_number} changed status from Open to Closed \r\nLast response: {$ticket_autoclose_time} hours ago. \r\n\r\nIf your issue is not resolved within a reasonable timeframe, you should contact us again.\r\n\r\n------------------------------------- \r\nSubject: {$ticket.subject} \r\nDepartment: {$ticket.department} \r\nStatus: {$ticket.status} \r\n-------------------------------------\r\n', '', 1, 1, 1, 0),
(56, 'Domain:Manual Register', 'Domain', 'Admin', 1, 'Register Domain {$domain.name}', '# Domain Name: {$domain.name}\r\n# Period: {$domain.period} Year/s\r\n{foreach from=$nameservers item=ns key=nsnr}\r\n{if $ns}# Name Server {$nsnr} : {$ns}{/if}\r\n{/foreach}\r\n\r\n# Registrant First Name: {$client.firstname}\r\n# Registrant Last Name: {$client.lastname}\r\n# Registrant Email: {$client.email}\r\n# Registrant Company: {$client.companyname}\r\n# Registrant Address 1: {$client.address1}\r\n# Registrant Address 2: {$client.address2}\r\n# Registrant City: {$client.city}\r\n# Registrant State/Region: {$client.state}\r\n# Registrant Zip Code: {$client.postcode}\r\n# Registrant Country: {$client.country}\r\n# Registrant Phone Number: {$client.phonenumber}\r\n\r\n# Admin First Name: {$client.firstname}\r\n# Admin Last Name: {$client.lastname}\r\n# Admin Email: {$client.email}\r\n# Admin Company: {$client.companyname}\r\n# Admin Address 1: {$client.address1}\r\n# Admin Address 2: {$client.address2}\r\n# Admin City: {$client.city}\r\n# Admin State/Region: {$client.state}\r\n# Admin Zip Code: {$client.postcode}\r\n# Admin Country: {$client.country}\r\n# Admin Phone Number: {$client.phonenumber}', '', 1, 1, 1, 1),
(57, 'Domain:Manual Transfer', 'Domain', 'Admin', 1, 'Transfer Domain {$domain.name}', '# Domain Name: {$domain.name}\r\n# Period: {$domain.period} Year/s\r\n# Epp Code: {$domain.epp_code}\r\n{foreach from=$nameservers item=ns key=nsnr}\r\n{if $ns}\r\n# Name Server {$nsnr} : {$ns}\r\n{/if}\r\n{/foreach}\r\n\r\n# Registrant First Name: {$client.firstname}\r\n# Registrant Last Name: {$client.lastname}\r\n# Registrant Email: {$client.email}\r\n# Registrant Company: {$client.companyname}\r\n# Registrant Address 1: {$client.address1}\r\n# Registrant Address 2: {$client.address2}\r\n# Registrant City: {$client.city}\r\n# Registrant State/Region: {$client.state}\r\n# Registrant Zip Code: {$client.postcode}\r\n# Registrant Country: {$client.country}\r\n# Registrant Phone Number: {$client.phonenumber}\r\n\r\n# Admin First Name: {$client.firstname}\r\n# Admin Last Name: {$client.lastname}\r\n# Admin Email: {$client.email}\r\n# Admin Company: {$client.companyname}\r\n# Admin Address 1: {$client.address1}\r\n# Admin Address 2: {$client.address2}\r\n# Admin City: {$client.city}\r\n# Admin State/Region: {$client.state}\r\n# Admin Zip Code: {$client.postcode}\r\n# Admin Country: {$client.country}\r\n# Admin Phone Number: {$client.phonenumber}', '', 1, 1, 1, 1),
(58, 'Domain:Manual Renew', 'Domain', 'Admin', 1, 'Renew Domain {$domain.name}', '# Domain Name: {$domain.name}\r\n# Period: {$domain.period} Year/s', '', 1, 1, 1, 1),
(59, 'Invoice:Reminder', 'Invoice', 'Client', 1, 'Invoice #{$invoice.id}: Unpaid Reminder', 'Dear {$client.firstname} {$client.lastname},\r\n\r\nINVOICE:                {$invoice.id}\r\nGENERATED AT: {$invoice.date|dateformat:$date_format} \r\nDUE DATE:           {$invoice.duedate|dateformat:$date_format}.\r\n\r\nPAYMENT METHOD \r\n{$invoice.gateway}\r\n\r\n\r\nAmount Due: {$invoice.total|price:$currency}\r\n\r\nLINK TO PAY\r\n{$invoices_url}', '', 1, 1, 1, 0),
(60, 'Account:Created:VPS', 'Product', 'Client', 1, 'New Hosting Account Created', 'Dear {$client.firstname} {$client.lastname}.\r\nYour order has been accepted and your\r\n   VPS Server has been set-up.\r\n\r\n<strong>New Account Information</strong>\r\n\r\n   Package: {$service.product_name}\r\n\r\n   Hostname: {$service.domain}\r\n\r\n   First Payment Amount: {$service.firstpayment|price:$currency}\r\n\r\n   Total Amount: {$service.total|price:$currency}\r\n\r\n   Billing Cycle: {$service.billingcycle}\r\n\r\n   Next Due Date: {$service.next_due|dateformat:$date_format}\r\n\r\n\r\n\r\n   <strong>Login Details</strong>\r\n\r\n\r\n   Username: {$service.username}\r\n\r\n   Password: {$service.password}\r\n\r\n   RootPassword: {$service.rootpassword}\r\n\r\n   Main IP: {$service.ip}\r\n\r\n{if $service.additional_ip!=""}Additional IPs: {$service.additional_ip}\r\n{/if}\r\n{if $service.disk_limit!="0"}Disk Limit: {$service.disk_limit} GB\r\n{/if}\r\n{if $service.bw_limit!="0"}Bandwidth Limit: {$service.bw_limit} MB\r\n{/if}\r\n{if $service.guaranteed_ram!="0"}Guaranteed RAM: {$service.guaranteed_ram} MB\r\n{/if}\r\n{if $service.burstable_ram!="0"}Burstable RAM: {$service.burstable_ram} MB\r\n{/if}\r\n{if $service.os!=""}OS: {$service.os}\r\n{/if}\r\n\r\n', '', 1, 0, 1, 0),
(61, 'Domain:Manual Change NS', 'Domain', 'Admin', 1, 'Domain: {$domain.name} Change Nameservers', '# Domain Name: {$domain.name}\r\n\r\n{foreach from=$ns item=n key=k}\r\n# Nameserver {$k+1}: {$n} \r\n\r\n{/foreach} ', '', 1, 1, 1, 1),
(63, 'Account:Created:InterWorx', 'Product', 'Client', 1, 'New Hosting Account Created', 'Dear {$client.firstname} {$client.lastname}.\r\nYour order has been accepted and your hosting account has been activated.\r\n\r\n<strong>New Account Information</strong>\r\nHosting Package: {$service.product_name}\r\nDomain: {$service.domain}\r\nFirst Payment Amount: {$service.firstpayment|price:$currency}\r\nTotal Amount: {$service.total|price:$currency}\r\nBilling Cycle: {$service.billingcycle}\r\nNext Due Date: {$service.next_due|dateformat:$date_format}\r\n\r\n<strong>Login Details</strong>\r\n\r\nUsername: {$service.username}\r\n\r\nEmail Address: {$client.email}\r\nPassword: {$service.password}\r\nDomain: {$service.domain}\r\n\r\nControl Panel URL: https://integrate.interworx.com:2443/siteworx/\r\nOnce your domain has propogated, you may also use https://integrate.interworx.com:2443/siteworx/\r\n\r\n<strong>Server Information</strong>\r\n\r\nServer Name: {$server.name}\r\nServer IP: {$server.ip}\r\n{if $server.host}Server Hostname: {$server.host}\r\n{/if}\r\nIf you are using an existing domain with your new hosting account, you will need to update the nameservers to point to the nameservers listed below.\r\n\r\nNameserver 1: {$server.ns1} ({$server.ip1})\r\nNameserver 2: {$server.ns2} ({$server.ip2})\r\n{if $service_ns3}Nameserver 3: {$server.ns3} ({$server.ip3})\r\n{/if}{if $service_ns4}Nameserver 4: {$server.ns4} ({$server.ip4})\r\n{/if}\r\n', '', 1, 0, 1, 0),
(64, 'Account:Password Reset', 'Product', 'Admin', 1, 'Account #{$service.id} Password Reset', 'Password for account has been changed.\r\n\r\n# Client: {$client.firstname} {$client.lastname}\r\n# Order ID:  {$service.order_id}\r\n\r\n# Server Name: {$server.name}\r\n# Product: {$service.name}\r\n# Username: {$service.username}\r\n# Password:*HIDDEN*\r\n\r\n#IP: {$ip}\r\n#Host: {$host}', '', 1, 1, 1, 0),
(65, 'Details:CreditCard:ChargeFailed', 'General', 'Client', 1, 'Credit Card Charge Failed', 'Dear {$details.firstname} {$details.lastname},\r\n\r\n\r\nThis is notification that we were unable to automatically charge your credit card ({$details.cardnum}).\r\nPlease verify credit card details in our client section.', '', 1, 1, 1, 0),
(66, 'Account:Password Reset', 'Product', 'Client', 1, 'Service Password Reset', 'Dear  {$client.firstname} {$client.lastname},\r\n\r\nYou requested to reset the password for the service {$service.name} .\r\nThis is your new details:\r\n\r\nUsername: {$service.username}\r\nPassword: {$newpassword}', '', 1, 1, 1, 0),
(67, 'Account:Created:Dedicated', 'Product', 'Client', 1, 'New Dedicated server set-up', 'Dear {$client.firstname} {$client.lastname}.\r\nYour order has been accepted and your\r\n   Deducated Server has been set-up.\r\n\r\n<strong>New Account Information</strong>\r\n\r\n   Package: {$service.product_name}\r\n\r\n   Hostname: {$service.domain}\r\n\r\n   First Payment Amount: {$service.firstpayment|price:$currency}\r\n\r\n   Total Amount: {$service.total|price:$currency}\r\n\r\n   Billing Cycle: {$service.billingcycle}\r\n\r\n   Next Due Date: {$service.next_due|dateformat:$date_format}\r\n\r\n\r\n\r\n   <strong>Login Details</strong>\r\n\r\n\r\n   Username: {$service.username}\r\n\r\n   Password: {$service.password}\r\n\r\n   RootPassword: {$service.rootpassword}\r\n\r\n{if $service.ip  Main IP: {$service.ip}\r\n{/if}\r\n{if $service.additional_ip!=""}Additional IPs: {$service.additional_ip}\r\n{/if}\r\n{if $service.disk_limit!="0"}Disk Limit: {$service.disk_limit} GB\r\n{/if}\r\n{if $service.bw_limit!="0"}Bandwidth Limit: {$service.bw_limit} MB\r\n{/if}\r\n{if $service.guaranteed_ram!="0"}Memory: {$service.guaranteed_ram} MB\r\n{/if}\r\n{if $service.os!=""}OS: {$service.os}\r\n{/if}\r\n\r\n', '', 1, 0, 1, 0),
(68, 'Account:Created:Reseller', 'Product', 'Client', 1, 'New Reseller Account Created', 'Dear {$client.firstname} {$client.lastname}.\r\nYour order has been accepted and your reseller account has\r\nbeen activated.\r\n\r\n<strong>New Account Information</strong>\r\nHosting Package: {$service.product_name}\r\n\r\nDomain: {$service.domain}\r\nFirst Payment Amount: {$service.firstpayment|price:$currency}\r\n\r\nTotal Amount: {$service.total|price:$currency}\r\nBilling Cycle: {$service.billingcycle}\r\n\r\nNext Due Date: {$service.next_due|dateformat:$date_format}\r\n\r\n\r\n<strong>Login Details</strong>\r\n\r\nUsername: {$service.username}\r\nPassword: {$service.password}\r\n\r\n\r\nOnce your domain has propogated, you may also use http://www.{$service.domain}:2082/\r\n\r\n\r\n<strong>Server Information</strong>\r\n\r\nServer Name: {$server.name}\r\nServer IP: {$server.ip}\r\n\r\n\r\nIf you are using an existing domain with your new hosting account,\r\nyou will need to update the nameservers to point to the nameservers listed below.\r\n\r\n\r\nNameserver 1: {$server.ns1} ({$server.ip1})\r\nNameserver 2: {$server.ns2} ({$server.ip2}){if $service_ns3}\r\n\r\nNameserver 3: {$server.ns3} ({$server.ip3}){/if}{if $service_ns4}\r\n\r\nNameserver 4: {$server.ns4} ({$server.ip4}){/if}\r\n\r\n\r\n<strong>Uploading Your Website</strong>\r\n\r\n\r\nTemporarily you may use one of the addresses given below manage your web site:\r\n\r\n\r\nTemporary FTP Hostname: {$server.ip}\r\n\r\nTemporary Webpage URL: http://{$server.ip}/~{$service.username}/\r\n\r\n\r\nAnd once your domain has propagated you may use the details below:\r\n\r\n\r\nFTP Hostname: www.{$service.domain}\r\nWebpage URL: http://www.{$service.domain}\r\n\r\n\r\n\r\n<strong>Email Settings</strong>\r\n\r\nFor email accounts that you setup, you should use the following connection\r\ndetails in your email program:\r\n\r\nPOP3 Host Address: mail.{$service.domain}\r\nSMTP Host Address: mail.\r\n{$service.domain}\r\nUsername: The email address you are checking email for\r\n\r\nPassword: As specified in your control panel', '', 1, 0, 1, 0),
(69, 'Affiliate Monthly Report', 'General', 'Client', 1, 'Affiliate Monthly Report', 'Dear {$client.firstname} {$client.lastname},\r\n\r\n\r\nThis is your monthly affiliate referrals report. You can view your affiliate statistics by logging in to the client area.\r\n\r\nTotal Visitors : {$affiliate.visits}\r\nCurrent Balance: {$affiliate.balance|price:$affiliate.currency_id}\r\nAmount Withdrawn: {$affiliate.total_withdrawn|price:$affiliate.currency_id}\r\n\r\n{if $affiliate.orders}\r\nNew Signups this Month referred by you:\r\n--\r\n{foreach from=$affiliate.orders item=order}\r\n{if $order.acstatus}Account: {$order.pname}\r\n{/if}{if $order.domstatus}Domain: {$order.domain}\r\n{/if}\r\nOrder Total: {$order.total|price:$affiliate.currency_id} \r\n{if $moredetails}\r\n{if $order.firstname || $order.lastname || $order.companyname}Client Info: {if $order.companyname}{$order.companyname}\r\n{else}{$order.firstname}{$order.lastname}{$order.companyname}\r\n{/if}\r\n{/if}\r\n{if $order.inv_id}Invoice ID: #{if $proforma && ($order.inv_status==''Paid'' || $order.inv_status==''Refunded'') && $order.inv_paid!=''''}{$order.inv_paid}\r\n{else}{$order.inv_date|invprefix:$prefix:$order.client_id}{$order.inv_id}\r\n{/if}\r\nInvoice Date: {$order.inv_date|dateformat:$date_format}\r\nInvoice Due Date: {$order.inv_due|dateformat:$date_format}\r\nInvoice Total: {$order.inv_total|price:$order.currency_id} \r\n{/if}{/if}\r\nCommission: {$order.commission|price:$affiliate.currency_id}\r\n--\r\n{/foreach}\r\n{/if}\r\nYou can refer new customers using your unique affiliate link: {$affiliate.url}\r\n', '', 1, 1, 1, 0),
(70, 'Details:Password Reset', 'General', 'Admin', 1, 'Admin Password Reset', 'Dear  {$firstname} {$lastname},\r\n\r\n You have requested password reset in Admin Area. Your new details:\r\n #Username: {$username}\r\n #Password: {$newpassword}\r\n\r\n ----------------------------------------------------\r\n Date: {$date}\r\n IP: {$ip}\r\n Host: {$host}\r\n ----------------------------------------------------', '', 1, 1, 1, 1),
(71, 'Details:Password Request', 'General', 'Client', 1, 'Password Reset for {$system_url}', 'Dear  {$client.firstname} {$client.lastname},\r\n\r\nYou requested that you be reminded of your Client Area Login Details.\r\nPlease click the link below to reset your password:\r\n {$hash}\r\n ', '', 1, 1, 1, 0),
(72, 'Details:Password Request', 'General', 'Admin', 1, 'Admin Area new password', 'Dear  {$firstname} {$lastname},\r\n\r\n You have requested password reset in Admin Area.\r\n Please click the link below to reset your password:\r\n {$hash}\r\n\r\n\r\n ----------------------------------------------------\r\n Date: {$date}\r\n IP: {$ip}\r\n Host: {$host}\r\n ----------------------------------------------------', '', 1, 1, 1, 1),
(73, 'Estimate', 'General', 'Client', 1, 'Requested Estimate', 'Dear {$client.firstname} {$client.lastname}, \r\n\r\n Attached is estimate you''ve requested. You can view this estimate online following this link: {$estimate_link} \r\n\r\n {if $estimate.date_expires!=''0000-00-00''}Estimate is valid until {$estimate.date_expires|dateformat:$date_format}{/if}. Reply to this email if you''re having further questions', '', 1, 1, 1, 0),
(74, 'Domain:Automation Results', 'Domain', 'Admin', 1, 'Domain {$domain.name}:Automation Results', 'Action: {$domain_action}\r\nResult: {if $domain_result}Success{else}FAIL{/if}\r\n\r\n{if $domain_error}Error: {$domain_error}{/if}\r\n\r\n----------------------------------------------------\r\n# Client: {$client.firstname} {$client.lastname}\r\n# Order ID:  {$domain.order_id}\r\n# Order Number: {$domain.order_num}\r\n\r\n\r\n# Domain Name: {$domain.name}\r\n# Period: {$domain.period} Year/s\r\n# Registrar: {$domain.module}', '', 1, 1, 1, 1),
(75, 'Account:Created:CakeMail', 'Product', 'Client', 1, 'New Email Marketing Account Created', 'Dear {$client.firstname} {$client.lastname}.\r\nYour order has been accepted and your email marketing account has been activated.\r\n\r\n<strong>New Account Information</strong>\r\nMarketing Package: {$service.product_name} \r\nFirst Payment Amount: {$service.firstpayment|price:$currency}\r\nTotal Amount: {$service.total|price:$currency}\r\nBilling Cycle: {$service.billingcycle}\r\nNext Due Date: {$service.next_due|dateformat:$date_format}\r\n\r\n<strong>Login Details</strong>\r\nUsername: {$client.email} \r\nPassword: {$service.password} \r\nLogin URL: http://{$server.host}', '', 1, 0, 1, 0),
(76, 'Ticket:By Admin', 'Support', 'Client', 1, 'Ticket: New', 'Subject: {$ticket.subject}\r\n {$ticket.body}\r\n\r\n\r\nTicket URL: {$ticket_url}', '', 1, 1, 1, 0),
(77, 'Ticket:Closed', 'Support', 'Admin', 1, 'Client closed ticket #{$ticket.ticket_number} ', '----------------------------------------------\r\nTicket ID: {$ticket.ticket_number}\r\nSubject: {$ticket.subject}\r\nStatus: {$ticket.status}\r\nURL: {$ticket_admin_url}\r\nAvailable actions:\r\n- Re-Open ticket: {$admin_url}?cmd=tickets&action=menubutton&id={$ticket.ticket_number}&status=Open&make=setstatus\r\n- Delete Ticket: {$admin_url}?cmd=tickets&action=menubutton&id={$ticket.ticket_number}&make=deleteticket\r\n----------------------------------------------', '', 1, 1, 1, 0),
(78, 'Ticket:Notes Change', 'Support', 'Admin', 1, 'Notes for ticket: #{$ticket.ticket_number}  updated', 'Notes has just been updated for ticket #{$ticket.ticket_number}\r\n\r\n{if $notes}\r\n{foreach from=$notes item=entry}\r\n----------------------------------------------------------------\r\n{$entry.date|dateformat:$date_format}\r\n{$entry.name}:  {$entry.note}\r\n{/foreach}\r\n----------------------------------------------------------------\r\n{/if}\r\n\r\n\r\nNew note:\r\n----------------------------------------------------------------\r\n{$note.date|dateformat:$date_format}\r\n{$note.name}:  {$note.msg}\r\n\r\nURL: {$ticket.url}', '', 1, 1, 1, 0),
(80, 'Clients:Add Contact', 'General', 'Admin', 1, 'Client #{$client.id} added new contact to his profile', 'Client #{$client.id} {$client.firstname} {$client.lastname} added new contact to his profile:\r\n\r\n# First Name: {$new.firstname}\r\n# Last Name: {$new.lastname}\r\n# Email Address: {$new.email}\r\n# Address 1: {$new.address1}\r\n# Address 2: {$new.address2}\r\n# City: {$new.city}\r\n# State/Region: {$new.state}\r\n# Zip Code: {$new.postcode}\r\n# Country: {$new.country}\r\n# Phone Number: {$new.phonenumber}', '', 1, 1, 1, 0),
(81, 'Details:Admin Login Notification', 'General', 'Admin', 1, 'Login from {$ip}', 'Admin: ''{$login}'' was logged into HostBill\r\n----------------------------------------------------\r\nDate: {$date} \r\nIP: {$ip} Host: {$host} \r\n----------------------------------------------------', '', 1, 1, 1, 1),
(82, 'Clients:Credit Balance Updated', 'General', 'Admin', 1, 'Client #{$client.id} {$client.firstname} {$client.lastname} Credit Balance Change', 'Client with ID {$client.id} credit balance was increased\r\n\r\n---------------------------------------------------------------\r\n# Previous balance: {$credit.old_credit|price:$currency}\r\n# Current balance: {$credit.new_credit|price:$currency}\r\n---------------------------------------------------------------\r\n{if $credit.invoice_id}\r\n# Related invoice ID: {$credit.invoice_id}\r\n# Related gateway: {$credit.gateway}\r\n---------------------------------------------------------------\r\n{/if}', '', 1, 1, 1, 1),
(83, 'Invoice:Refund', 'Invoice', 'Client', 1, 'Invoice #{$invoice.id}: Refund', 'Dear {$client.firstname} {$client.lastname},\r\n\r\nTransaction #{$transaction.trans_id} has been refunded, amount refunded {$amount}\r\n', '', 1, 0, 0, 0),
(84, 'Mobile:Account:Created', 'Mobile', 'Client', 1, 'Your service is ready', 'Dear client, Your order has been accepted and your service {$service.product_name} is active', '', 1, 1, 1, 0),
(85, 'Mobile:Domain:Registered', 'Mobile', 'Client', 1, 'Your domain has been registered', 'Dear client, Your domain: {$domain.name} has been registered', '', 1, 1, 1, 0),
(86, 'Mobile:Domain:Transfered', 'Mobile', 'Client', 1, 'Your domain has been transfered', 'Dear client, Your domain: {$domain.name} has been transfered', '', 1, 1, 1, 0),
(87, 'Mobile:Domain:Reminder', 'Mobile', 'Client', 1, 'Your domain will soon expire', 'Dear client, Your domain: {$domain.name} will soon expire - make sure to renew!', '', 1, 1, 1, 0),
(88, 'Mobile:Invoice:New', 'Mobile', 'Client', 1, 'New invoice', 'Dear client, New invoice has been added to your account with us, proceed to our client area for details', '', 1, 1, 1, 0),
(89, 'Mobile:Invoice:Reminder', 'Mobile', 'Client', 1, 'Due invoice', 'Dear client, Invoice in your account is due, to avoid downtimes pay it in time', '', 1, 1, 1, 0),
(90, 'Mobile:Ticket:Reply', 'Mobile', 'Client', 1, 'Reply to ticket', 'Dear client, staff member replied to your support ticket -  {$ticket.subject}', '', 1, 1, 1, 0),
(91, 'Mobile:Ticket:New', 'Mobile', 'Admin', 1, 'New Support Ticket', 'Subject: {$ticket.subject}\r\n Submitter: {$ticket.name} \r\n Dept: {$ticket.department}', '', 1, 1, 1, 0),
(92, 'Mobile:Ticket:Escalated', 'Mobile', 'Admin', 1, 'Support Ticket Escalated', 'Subject: {$ticket.subject}\r\n Submitter: {$ticket.name} \r\n Dept: {$ticket.department}', '', 1, 1, 1, 0),
(93, 'Mobile:Ticket:Reply', 'Mobile', 'Admin', 1, 'Client repiled to ticket', 'Subject: {$ticket.subject}\r\n Submitter: {$ticket.name} \r\n Dept: {$ticket.department}', '', 1, 1, 1, 0),
(94, 'Mobile:Ticket:Note', 'Mobile', 'Admin', 1, 'New ticket note', '#{$ticket.ticket_number} \r\n Note: {$note.msg}', '', 1, 1, 1, 0),
(95, 'Mobile:Failed Login', 'Mobile', 'Admin', 1, 'Adminarea failed login', 'Failed Login: Date: {$date}\r\nIP: {$ip}\r\nHost: {$host}\r\n\r\nLogin: {$login}', '', 1, 1, 1, 0),
(96, 'Mobile:Order:New', 'Mobile', 'Admin', 1, 'New HostBill Order', 'Client: {$client.firstname} {$client.lastname}\r\nTotal(+tax): {$order.total|price:$currency}', '', 1, 1, 1, 0),
(97, 'Mobile:Transaction:New', 'Mobile', 'Admin', 1, 'New Payment from client', 'Transaction total: {$transaction.in|price:$currency}, Invoice: {$transaction.invoice_id}', '', 1, 1, 1, 0),
(98, 'Mobile:AccountAutomation:Failed', 'Mobile', 'Admin', 1, 'Account automation failed', 'Action: {$account_action}, {if $account_error}Errors:{foreach from=$account_error item=errx} {$errx}    {/foreach}{/if}Account ID: {$service.id} ', '', 1, 1, 1, 0),
(99, 'Mobile:DomainAutomation:Failed', 'Mobile', 'Admin', 1, 'Domain automation failed', 'Action:  {$domain_action} FAILED, {if $domain_error}Error: {$domain_error}{/if}, Domain Name: {$domain.name}', '', 1, 1, 1, 0),
(100, 'Ticket:Assigned', 'Support', 'Admin', 1, 'You have been assigned to ticket: #{$ticket.ticket_number}', 'Staff member: {$admin.firstname} {$admin.lastname} assigned you to ticket #{$ticket.ticket_number}\r\n\r\n------------------------------------------\r\n\r\n{$ticket.body}\r\n\r\n------------------------------------------\r\nSubject: {$ticket.subject}\r\nStatus: {$ticket.status}\r\nSubmitter: {$ticket.name}\r\nURL: {$ticket_admin_url}\r\n----------------------------------------------', '', 1, 1, 1, 0),
(101, 'Ticket:Escalated', 'Support', 'Admin', 1, 'Ticket: #{$ticket.ticket_number} has been escalated', 'This ticket is now: {if $overdue}OVERDUE{else}ESCALATED{/if}\r\n\r\nTicket #{$ticket.ticket_number}\r\nSubject: {$ticket.subject}\r\nStatus: {$ticket.status}\r\nSubmitter: {$ticket.name}\r\nURL: {$ticket_admin_url}\r\n----------------------------------------------', '', 1, 1, 1, 0),
(102, 'Ticket:TimeLimit', 'Support', 'Client', 1, 'Your Ticket was not opened', '{$email_name},\r\n\r\nYour email to our support system could not be accepted as ticket, you have to wait {$time_left} second(s) before sending next request.', '', 1, 1, 1, 0),
(103, 'LiveChat:Chat transcription', 'Support', 'Client', 1, 'Chat session transcription - {$chat.start_date|dateformat:$date_format}', 'Hello {$client.visitor_name},\r\n\r\nYou can find requested chat session transcription bellow.\r\n\r\n{foreach from=$chat.messages item=line}\r\n{if $line.type=="Staff"}\r\n\r\n#{$line.submitter_name}:\r\n{elseif $line.type=="Client"}\r\n\r\n#{$line.submitter_name}:\r\n{else}-{/if}{$line.message}\r\n{/foreach}', '', 1, 1, 1, 0),
(104, 'Ticket:BounceClose', 'Support', 'Client', 1, 'Your ticket is closed', '{$email_name},\r\n\r\nYour email to our support system could not be accepted as ticket reply because related ticket has already been closed by staff member. If required, please open new ticket.', '', 1, 1, 1, 0);
INSERT INTO `hb_email_templates` (`id`, `tplname`, `group`, `for`, `language_id`, `subject`, `message`, `altmessage`, `send`, `plain`, `system`, `hidden`) VALUES
(105, 'Mobile:Ticket:Closed', 'Mobile', 'Admin', 1, 'Support Ticket Closed', 'Subject: {$ticket.subject}\r\n Submitter: {$ticket.name} \r\n Dept: {$ticket.department}', '', 1, 1, 1, 0),
(106, 'Notes:Change', 'General', 'Admin', 1, 'Notes for {$type}: #{$id} updated', 'Note has just been updated for {$type} #{$id}\r\n\r\n{if $notes}\r\n{foreach from=$notes item=entry}\r\n----------------------------------------------------------------\r\n{$entry.date|dateformat:$date_format}\r\n{$entry.note}\r\n{/foreach}\r\n----------------------------------------------------------------\r\n{/if}\r\n\r\n{if $note}\r\n{if $note.action==''add''}New note:{else}Updated note:{/if}\r\n----------------------------------------------------------------\r\n{$note.date|dateformat:$date_format}\r\n{$note.note}\r\n{/if}\r\nURL: {$url}', '', 1, 1, 1, 0),
(107, 'Invoice:Final', 'Invoice', 'Client', 1, 'Invoice #{$invoice.id} generated', 'Dear {$client.firstname} {$client.lastname}, \r\n\r\nFinal invoice has been generated to your recent payment\r\n\r\nINVOICE  #{$invoice.id} \r\n\r\n\r\n\r\n\r\n\r\nINVOICE HISTORY: {$clientarea_url}\r\n', '', 1, 1, 1, 0),
(108, 'CreditNote:New', 'Invoice', 'Client', 1, 'New Credit Note Created', 'Dear {$client.firstname} {$client.lastname}, \r\n\r\nCredit Note  #{$invoice.id} \r\nAMOUNT: {$invoice.total|price:$currency}\r\nGENERATED ON: {$invoice.date|dateformat:$date_format}.\r\n\r\nItems\r\n{foreach from=$invoiceitems item=item}\r\n {$item.description}  {if $item.qty}{$item.qty} x {/if}{$item.amount|price:$currency}\r\n{/foreach}\r\n\r\n', '', 1, 1, 1, 0),
(109, 'New Incoming Transaction', 'General', 'Admin', 1, 'Admin: New Incoming Transaction', 'New transaction just came in!\r\n\r\nCustomer: {$client.firstname} {$client.lastname}\r\nGateway: {$transaction.gateway}\r\nAmount: {$transaction.in|price:$currency}\r\nTransaction id: {$transaction.trans_id}\r\n\r\n{if $transaction.invoice_id}\r\nRelated invoice id: {$transaction.invoice_id}\r\nRelated invoice status: {$invoice.status}\r\n{/if}', '', 1, 1, 1, 0),
(110, 'Admin:Order Ownership Changed', 'General', 'Admin', 1, 'Admin:Order Ownership Changed', 'Ownership for Order ID: {$order.id} has been  {if $order.staff_member_id}changed to {$order.admin_firstname} {$order.admin_lastname}{else}removed{/if}\r\n\r\n---------------------------------------------------------------\r\nOrder Info\r\n---------------------------------------------------------------\r\n# Order ID: {$order.id}\r\n# Order Number: {$order.number}\r\n# Date Created: {$order.date_created|dateformat:$date_format}\r\n# Invoice Number: {$order.invoice_id}\r\n# Payment Method: {$order.module}\r\n{if $order.fraudscore}# FraudModule risk score: {$order.fraudscore}{/if}\r\n\r\n---------------------------------------------------------------\r\nClient Info\r\n---------------------------------------------------------------\r\n# ID: {$client.id}\r\n# Name: {$client.firstname} {$client.lastname}\r\n# Email: {$client.email}\r\n# Company: {$client.companyname}\r\n# Address 1: {$client.address1}\r\n# Address 2: {$client.address2}\r\n# City: {$client.city}\r\n# State/Region: {$client.state}\r\n# Zip Code: {$client.postcode}\r\n# Country: {$client.country}\r\n# Phone Number: {$client.phonenumber}\r\n\r\n---------------------------------------------------------------\r\nOrder Items\r\n---------------------------------------------------------------\r\n{if $order_details}\r\n{foreach from=$order_details item=item}\r\n #  {$item.amount|price:$currency} - {$item.description}\r\n{/foreach}\r\n\r\nTotal(+tax): {$order.total|price:$currency}\r\n{else}\r\nNo items to list.\r\n{/if}\r\n\r\n\r\n---------------------------------------------------------------\r\nIP: {$ip_addr}\r\nHost: {$host_addr}', '', 1, 1, 1, 0),
(111, 'Admin:Assigned Order Ownership', 'General', 'Admin', 1, 'Admin:Assigned Order Ownership', 'You were assigned to Order ID: {$order.id}\r\n\r\n---------------------------------------------------------------\r\nOrder Info\r\n---------------------------------------------------------------\r\n# Order ID: {$order.id}\r\n# Order Number: {$order.number}\r\n# Date Created: {$order.date_created|dateformat:$date_format}\r\n# Invoice Number: {$order.invoice_id}\r\n# Payment Method: {$order.module}\r\n{if $order.fraudscore}# FraudModule risk score: {$order.fraudscore}{/if}\r\n\r\n---------------------------------------------------------------\r\nClient Info\r\n---------------------------------------------------------------\r\n# ID: {$client.id}\r\n# Name: {$client.firstname} {$client.lastname}\r\n# Email: {$client.email}\r\n# Company: {$client.companyname}\r\n# Address 1: {$client.address1}\r\n# Address 2: {$client.address2}\r\n# City: {$client.city}\r\n# State/Region: {$client.state}\r\n# Zip Code: {$client.postcode}\r\n# Country: {$client.country}\r\n# Phone Number: {$client.phonenumber}\r\n\r\n---------------------------------------------------------------\r\nOrder Items\r\n---------------------------------------------------------------\r\n{if $order_details}\r\n{foreach from=$order_details item=item}\r\n #  {$item.amount|price:$currency} - {$item.description}\r\n{/foreach}\r\n\r\nTotal(+tax): {$order.total|price:$currency}\r\n{else}\r\nNo items to list.\r\n{/if}\r\n\r\n\r\n---------------------------------------------------------------\r\nIP: {$ip_addr}\r\nHost: {$host_addr}', '', 1, 1, 1, 0),
(112, 'Details:ACHCard:ChargeFailed', 'General', 'Client', 1, 'Account/eCheck Charge Failed', 'Dear {$details.firstname} {$details.lastname},\r\n\r\n\r\nThis is notification that we were unable to automatically charge your bank account ({$details.account}).\r\nPlease verify bank details in our client section.', '', 1, 1, 1, 0);
##########
CREATE TABLE `hb_email_templates_lang` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `language` varchar(32) NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_email_templates_lang` (`id`, `language`) VALUES
(1, 'english');
##########
CREATE TABLE `hb_error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `entry` text NOT NULL,
  `type` enum('Exception','PHP Error','Other') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_estimate_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estimate_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `type` enum('Other','Product','Addon','Config') NOT NULL DEFAULT 'Other',
  `description` text NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `taxed` tinyint(1) NOT NULL,
  `qty` int(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `estid` (`estimate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_estimates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('Draft','Sent','Accepted','Invoiced','Dead') NOT NULL,
  `subject` varchar(64) NOT NULL,
  `client_id` int(11) NOT NULL,
  `date_created` date DEFAULT NULL,
  `date_expires` date DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `credit` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `taxrate` decimal(10,2) NOT NULL,
  `tax2` decimal(10,2) NOT NULL,
  `taxrate2` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency_id` int(3) NOT NULL DEFAULT '0',
  `rate` decimal(10,4) NOT NULL DEFAULT '1.0000',
  `notes` text NOT NULL,
  `notes_private` text NOT NULL,
  `hash` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_fraud_output` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  `output` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `module` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_gateway_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `output` text NOT NULL,
  `result` enum('Successfull','Failure','Pending') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module_id` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_geoip_block_0`
--

CREATE TABLE `hb_geoip_block_0` (
  `startIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `endIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `locId` int(11) NOT NULL,
  KEY `locId` (`locId`),
  KEY `endIpNum` (`endIpNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_geoip_block_1`
--

CREATE TABLE `hb_geoip_block_1` (
  `startIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `endIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `locId` int(11) NOT NULL,
  KEY `locId` (`locId`),
  KEY `endIpNum` (`endIpNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_geoip_block_2`
--

CREATE TABLE `hb_geoip_block_2` (
  `startIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `endIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `locId` int(11) NOT NULL,
  KEY `locId` (`locId`),
  KEY `endIpNum` (`endIpNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_geoip_block_3`
--

CREATE TABLE `hb_geoip_block_3` (
  `startIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `endIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `locId` int(11) NOT NULL,
  KEY `locId` (`locId`),
  KEY `endIpNum` (`endIpNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_geoip_block_4`
--

CREATE TABLE `hb_geoip_block_4` (
  `startIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `endIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `locId` int(11) NOT NULL,
  KEY `locId` (`locId`),
  KEY `endIpNum` (`endIpNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_geoip_block_5`
--

CREATE TABLE `hb_geoip_block_5` (
  `startIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `endIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `locId` int(11) NOT NULL,
  KEY `locId` (`locId`),
  KEY `endIpNum` (`endIpNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_geoip_block_6`
--

CREATE TABLE `hb_geoip_block_6` (
  `startIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `endIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `locId` int(11) NOT NULL,
  KEY `locId` (`locId`),
  KEY `endIpNum` (`endIpNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `hb_geoip_block_7`
--

CREATE TABLE `hb_geoip_block_7` (
  `startIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `endIpNum` int(20) unsigned NOT NULL DEFAULT '0',
  `locId` int(11) NOT NULL,
  KEY `locId` (`locId`),
  KEY `endIpNum` (`endIpNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_geoip_cities` (
  `locId` int(11) NOT NULL,
  `country` varchar(5) NOT NULL,
  `region` varchar(100) NOT NULL,
  `city` varchar(255) NOT NULL,
  `postalCode` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  PRIMARY KEY (`locId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_infopages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `url` (`url`,`visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_invoice_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `type` enum('Domain Register','Domain Renew','Domain Transfer','Hosting','Addon','Other','Upgrade','Invoice','Config','Credit','FieldUpgrade','Field','Discount','Support','RefundedItem','OSLicense') NOT NULL,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `taxed` tinyint(1) NOT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT '1.00',
  PRIMARY KEY (`id`),
  KEY `invid` (`invoice_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_invoice_items_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `client_id` int(10) NOT NULL,
  `rel_id` int(10) NOT NULL,
  `rel_type` varchar(50) NOT NULL,
  `item_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `note` text NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `taxed` tinyint(4) NOT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT '1.00',
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `rel_id` (`rel_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paid_id` varchar(64) NOT NULL DEFAULT '',
  `recurring_id` int(11) NOT NULL DEFAULT '0',
  `status` enum('Paid','Unpaid','Cancelled','Draft','Recurring','Refunded','Creditnote') NOT NULL,
  `client_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `paybefore` date NOT NULL,
  `datepaid` datetime NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `credit` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `taxrate` decimal(10,2) NOT NULL,
  `tax2` decimal(10,2) NOT NULL,
  `taxrate2` decimal(10,2) NOT NULL,
  `taxexempt` tinyint(4) NOT NULL DEFAULT '0',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_module` int(11) NOT NULL,
  `currency_id` int(3) NOT NULL DEFAULT '0',
  `rate` decimal(15,10) NOT NULL DEFAULT '1.0000000000',
  `rate2` decimal(15,10) NOT NULL DEFAULT '0.0000000000',
  `rate3` decimal(15,10) NOT NULL DEFAULT '1.0000000000',
  `notes` text NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `metadata` text,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `client_id` (`client_id`),
  KEY `paid_id` (`paid_id`(32)),
  KEY `recurring_id` (`recurring_id`),
  KEY `flags` (`flags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_knowledgebase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `cat_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `body` text NOT NULL,
  `registered` tinyint(1) NOT NULL,
  `options` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_knowledgebase_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_cat` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `target` enum('admin','user') NOT NULL DEFAULT 'admin',
  `name` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `target` (`target`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_language` (`id`, `parent_id`, `target`, `name`, `status`) VALUES
(1, 0, 'admin', 'english', 1),
(2, 0, 'user', 'english', 1),
(3, 1, 'admin', 'portuguese-br', 0),
(4, 2, 'user', 'portuguese-br', 0),
(5, 2, 'user', 'german', 0);
##########
CREATE TABLE `hb_language_locales` (
  `language_id` int(11) NOT NULL,
  `section` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `keyword` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`language_id`,`section`,`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_localcloud` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `flag` int(11) unsigned NOT NULL,
  `server_id` varchar(200) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id_server_id` (`account_id`,`server_id`),
  KEY `account_id` (`account_id`),
  KEY `account_id_flag` (`account_id`,`flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_mettered_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `qty_max` int(11) NOT NULL,
  `price` decimal(25,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_variable` (`variable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_mettered_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `variable_id` int(11) NOT NULL,
  `type` enum('Admin','Client','Log','Report','Invoice') NOT NULL DEFAULT 'Log',
  `date_created` datetime NOT NULL,
  `output` text NOT NULL,
  `charge` decimal(25,5) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `variable_id` (`variable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_mettered_sync` (
  `account_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `metadata` text,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_mettered_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `charge` decimal(25,5) NOT NULL,
  `qty` decimal(25,5) NOT NULL,
  `output` text NOT NULL,
  `rawoutput` text,
  PRIMARY KEY (`id`),
  KEY `fk_var` (`variable_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_mettered_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `variable_name` varchar(45) NOT NULL,
  `unit_name` varchar(45) NOT NULL,
  `cycle` enum('Account','Hourly','Monthly') NOT NULL DEFAULT 'Account',
  `scheme` varchar(50) NOT NULL DEFAULT 'unit',
  `options` int(11) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`product_id`),
  KEY `variable` (`variable_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_mod_rssfeeds` (
  `fetchdate` date NOT NULL,
  `pubDate` date NOT NULL,
  `title` varchar(128) NOT NULL,
  `link` varchar(256) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`title`(120))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_modules_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(128) NOT NULL,
  `type` enum('Hosting','Payment','Domain','Fraud','Other','Notification') NOT NULL,
  `config` text NOT NULL,
  `filename` varchar(128) NOT NULL,
  `version` varchar(32) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `modname` varchar(100) NOT NULL,
  `subtype` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `settings` text NOT NULL,
  `access` varchar(128) NOT NULL,
  `remote` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_active` (`type`,`active`),
  KEY `filename` (`filename`(32))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_modules_configuration` (`id`, `module`, `type`, `config`, `filename`, `version`, `active`, `modname`, `subtype`, `sort_order`, `settings`, `access`, `remote`) VALUES
(1, 'HBExtras', 'Other', 'a:0:{}', 'class.hbextras.php', '0.5', 0, 'HostBill Extras', 0, 0, '|haveadmin|havetpl|header_js|', '', NULL),
(2, 'AutoUpgrade', 'Other', 'a:0:{}', 'class.autoupgrade.php', '1.2', 1, 'HostBill Auto-Upgrade', 0, 100, '|haveadmin|havetpl|havecron|extras_menu|header_js|', '', NULL),
(3, 'Ticket_Macro_Browser', 'Other', 'a:0:{}', 'class.ticket_macro_browser.php', '1.0', 1, 'Macro Browser', 3, 100, '|haveadmin|havetpl|', '', NULL);
##########
CREATE TABLE `hb_notes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` enum('client','account','domain','order','draft') NOT NULL,
  `rel_id` int(10) NOT NULL,
  `admin_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `rel_id` (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_order_drafts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_module` int(10) NOT NULL,
  `client_id` int(10) NOT NULL,
  `staff_member_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL DEFAULT '0',
  `total` decimal(10,2) NOT NULL,
  `date_created` datetime NOT NULL,
  `options` tinyint(4) NOT NULL DEFAULT '7',
  `scenario_id` int(11) NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_order_drafts_items` (
  `draft_id` int(10) unsigned NOT NULL,
  `item_id` int(10) NOT NULL,
  `item_type` varchar(50) NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY (`draft_id`,`item_id`,`item_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT '',
  `entry` text NOT NULL,
  `who` varchar(127) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_order_scenarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_order_scenarios` (`id`, `name`) VALUES
(1, 'Default scenario');
##########
CREATE TABLE `hb_order_scenarios_steps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scenario_id` int(11) NOT NULL,
  `name` varchar(127) NOT NULL,
  `auto` tinyint(1) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `scenario_id` (`scenario_id`),
  KEY `name` (`name`(16))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_order_scenarios_steps` (`id`, `scenario_id`, `name`, `auto`, `enabled`) VALUES
(1, 1, 'FraudCheck', 1, 1),
(2, 1, 'SendInvoice', 1, 1),
(3, 1, 'Authorize', 1, 1),
(4, 1, 'Capture', 1, 1),
(5, 1, 'Provision', 1, 1),
(6, 1, 'FinalReview', 0, 0);
##########
CREATE TABLE `hb_order_steps` (
  `order_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `status` enum('Pending','Completed','Failed') NOT NULL DEFAULT 'Pending',
  `date_changed` datetime NOT NULL,
  `output` text NOT NULL,
  PRIMARY KEY (`order_id`,`step_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `payment_module` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `staff_member_id` int(11) NOT NULL DEFAULT '0',
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `total` decimal(10,2) NOT NULL,
  `date_created` datetime NOT NULL,
  `status` enum('Pending','Active','Cancelled','Fraud') NOT NULL,
  `order_ip` text NOT NULL,
  `notes` text,
  `metadata` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `invoice_id` (`invoice_id`),
  KEY `client_id` (`client_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_oslicenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL,
  `template_id` varchar(255) DEFAULT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '0',
  `invoice_item` int(11) DEFAULT NULL,
  `meta` text,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_paid_addons` (
  `module` varchar(127) NOT NULL,
  `key` text NOT NULL,
  PRIMARY KEY (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
##########
CREATE TABLE `hb_product_bundles` (
  `product_id` int(10) NOT NULL,
  `options` tinyint(4) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `draft` int(10) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_product_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_product_types` (`id`, `type`) VALUES
(10, 'bundles'),
(6, 'Colocation'),
(3, 'Dedicated'),
(9, 'DomainsType'),
(7, 'Marketing'),
(5, 'Other'),
(2, 'Reseller'),
(4, 'Server'),
(1, 'Shared');
##########
CREATE TABLE `hb_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `domain_options` tinyint(1) NOT NULL,
  `stock` tinyint(1) NOT NULL DEFAULT '0',
  `qty` int(1) NOT NULL DEFAULT '0',
  `autosetup` tinyint(1) NOT NULL,
  `subdomain` text NOT NULL,
  `owndomain` tinyint(1) NOT NULL DEFAULT '1',
  `tax` tinyint(1) NOT NULL,
  `upgrades` text NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `client_limit` int(10) NOT NULL DEFAULT '0',
  `hostname` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_products_freetlds` (
  `product_id` int(11) NOT NULL,
  `tlds` varchar(128) NOT NULL,
  `periods` varchar(256) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_products_modules` (
  `product_id` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  `main` tinyint(1) NOT NULL DEFAULT '1',
  `server` varchar(128) NOT NULL DEFAULT '',
  `options` text NOT NULL,
  PRIMARY KEY (`product_id`,`module`),
  KEY `main` (`main`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_recurring_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frequency` enum('1w','2w','4w','1m','2m','3m','6m','1y','2y') NOT NULL DEFAULT '1w',
  `start_from` date NOT NULL,
  `next_invoice` date NOT NULL,
  `occurrences` int(11) NOT NULL DEFAULT '0',
  `invoices_left` int(11) NOT NULL DEFAULT '0',
  `recstatus` enum('Active','Stopped','Finished','Pending') NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `occurrences` (`occurrences`),
  KEY `recstatus` (`recstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `query` text NOT NULL,
  `options` int(10) NOT NULL,
  `handler` enum('php','sql') NOT NULL DEFAULT 'sql',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_reports` (`id`, `type`, `name`, `query`, `options`, `handler`) VALUES
(1, 'Orders', 'Orders list in selected period', 'SELECT\r\n	o.id as `Order ID`,\r\n	o.number as `Order Number`,\r\n	COALESCE(m.modname,''None'') AS `Payment Gateway`,\r\n	o.client_id AS `Client ID`,\r\n	ca.email AS `Client Email`,\r\n	CONCAT(cd.firstname,'' '',cd.lastname) AS `Client`,\r\n	hb_currency(o.total) AS `Order Total`,\r\n	o.order_ip AS `Order IP`,\r\n	hb_date(o.date_created) AS `Order Date`,\r\n	o.status AS `Current Status`,\r\n	COALESCE(cp.code,''None'') AS `Promotional Coupon`,\r\n	COALESCE(clog.discount,''0.00'') AS `Discount`\r\n\r\n\r\nFROM\r\n	hb_orders o JOIN\r\n	hb_modules_configuration m ON (m.id=o.payment_module) JOIN\r\n	hb_client_details cd ON (cd.id = o.client_id) JOIN\r\n	hb_client_access ca ON (ca.id=cd.id) LEFT JOIN\r\n	hb_coupons_log clog ON (clog.order_id=o.id) LEFT JOIN\r\n	hb_coupons cp ON (cp.id=clog.coupon_id)\r\nWHERE\r\n	o.date_created > :date_bottom	  AND\r\n	o.date_created < :date_top\r\n\r\n\r\nORDER BY\r\n	o.date_created ASC', 1, 'sql'),
(2, 'Invoices', 'List of all invoices in given period', 'SELECT\r\ni.id AS `Invoice ID`,\r\nCONCAT(d.firstname,'' '',d.lastname) AS `Client`,\r\nhb_currency(i.total,i.currency_id,i.rate) AS `Invoice Total`,\r\ni.status AS `Invoice Status`,\r\nCASE WHEN hbc.value=''eu'' THEN hb_date( i.datepaid) ELSE hb_date( i.date) END AS `Invoice Date`,\r\nhb_currency(i.credit,i.currency_id,i.rate) AS `Invoice Credit`,\r\nm.modname AS `Gateway Name`,\r\ntaxrate as `Tax1 rate`,\r\ntaxrate2 as `Tax2 rate`,\r\ntax as `Tax1 Amount`,\r\ntax2 as `Tax2 Amount`,\r\ni.rate AS `Exchange Rate`,\r\nhb_date(i.duedate) AS `Invoice Due Date`,\r\nhb_date(i.datepaid) AS `Invoice Paid Date`,\r\nt.trans_id AS `Related transaction`,\r\nca.email AS `Client Email`,\r\nd.phonenumber AS `Client Phone`,\r\nd.companyname  AS `Client Company`,\r\nd.city AS `Client City`,\r\nd.country AS `Client Country`,\r\nd.address1 AS `Client Address`,\r\nd.postcode AS `Client ZIP`\r\n\r\nFROM hb_invoices i\r\n    JOIN hb_client_details d ON (i.client_id=d.id)\r\n    JOIN hb_client_access ca ON (i.client_id=ca.id)\r\n    LEFT JOIN hb_modules_configuration m ON (m.id=i.payment_module)\r\n    LEFT JOIN hb_currencies c ON (c.id=i.currency_id)\r\n    LEFT JOIN hb_transactions t ON (t.invoice_id=i.id)\r\n    LEFT JOIN hb_configuration hbc ON hbc.setting=''InvoiceModel''\r\nWHERE\r\n    i.id NOT IN (\r\n        SELECT invoice_id\r\n        FROM hb_invoice_items\r\n        WHERE `type` = ''Invoice''\r\n    ) \r\n    AND i.status NOT IN (''Draft'',''Recurring'')\r\n   AND ( (hbc.value!=''eu'' AND i.`date`>=  :date_bottom AND i.`date`<= :date_top ) OR (hbc.value=''eu'' AND i.`datepaid`>= :date_bottom AND i.`datepaid`<= :date_top) )\r\nORDER BY\r\n	i.id ASC', 1, 'sql'),
(3, 'Clients', 'Top 15 customers by income', 'SELECT\r\ncd.id AS `Client ID`,\r\nCONCAT(cd.firstname,'' '',cd.lastname) AS `Client`,\r\nhb_currency(SUM(t.`in`),cb.currency_id) AS `Total Income`\r\nFROM hb_client_details cd\r\nJOIN hb_client_billing cb ON (cb.client_id=cd.id)\r\nJOIN hb_transactions t ON (t.client_id=cd.id)\r\nGROUP BY cd.id\r\nORDER BY SUM(t.`in`) DESC\r\nLIMIT 15', 1, 'sql'),
(4, 'Support', 'Average number of ticket replies per department', 'SELECT\r\nd.name AS `Department`,\r\n(a.tot/COUNT(t.id)) AS `Average replies`\r\nFROM hb_ticket_departments d JOIN\r\n(\r\n SELECT COUNT(r.id) as tot, t.dept_id FROM hb_ticket_replies r JOIN hb_tickets t ON (t.id=r.ticket_id)\r\n GROUP BY t.dept_id\r\n) a ON (a.dept_id=d.id)\r\nJOIN hb_tickets t ON (t.dept_id=d.id)\r\nGROUP BY t.dept_id\r\n', 1, 'sql'),
(5, 'Support', 'Unresolved tickets count by staff member', 'SELECT aa.id AS `Staff ID` , CONCAT( ad.firstname, '' '', ad.lastname ) AS `Staff Member` , COUNT( t.id ) AS `Unresolved Tickets Count`\r\nFROM hb_admin_access aa\r\nJOIN hb_admin_details ad ON ( aa.id = ad.id )\r\nJOIN hb_tickets t ON ( t.owner_id = aa.id )\r\nWHERE t.status!=''Closed''\r\nGROUP BY t.owner_id', 1, 'sql'),
(6, 'Support', 'Unresolved tickets count by department member', 'SELECT d.id AS `Department ID` , d.name AS `Department Name` , COUNT( t.id ) AS `Unresolved Tickets Count`\r\nFROM hb_tickets t\r\nJOIN hb_ticket_departments d ON ( t.dept_id = d.id )\r\nWHERE t.status != ''Closed''\r\nGROUP BY t.dept_id', 1, 'sql'),
(7, 'Clients', 'List of clients that are Active, but dont have any active service', 'SELECT\r\ncd.id AS `Client ID`,\r\nCONCAT(cd.firstname,'' '',cd.lastname) AS `Client`\r\nFROM hb_client_details cd\r\nWHERE \r\ncd.parent_id=0 \r\nAND cd.id NOT IN (SELECT client_id FROM hb_accounts WHERE status=''Active'')\r\nAND cd.id NOT IN (SELECT client_id FROM hb_domains WHERE status=''Active'')\r\nAND cd.id NOT IN (SELECT a.client_id FROM hb_accounts a JOIN hb_accounts_addons ad ON (ad.account_id=a.id) WHERE ad.status=''Active'')\r\nORDER BY cd.id ASC', 1, 'sql'),
(8, 'Clients', 'List of clients with active services, with inactive profile (disabled login)', 'SELECT\r\ncd.id AS `Client ID`,\r\nCONCAT(cd.firstname,'' '',cd.lastname) AS `Client`\r\nFROM hb_client_details cd\r\nJOIN hb_client_access ca ON (ca.id=cd.id)\r\nWHERE (cd.id IN (SELECT client_id FROM hb_accounts WHERE status=''Active'')\r\nOR cd.id IN (SELECT client_id FROM hb_domains WHERE status=''Active'')\r\nOR cd.id IN  (SELECT a.client_id FROM hb_accounts a JOIN hb_accounts_addons ad ON (ad.account_id=a.id) WHERE ad.status=''Active''))\r\nAND ca.status!=''Active''\r\nORDER BY cd.id ASC', 1, 'sql'),
(9, 'Clients', 'List of possible duplicates in client profiles', 'SELECT\r\ncd.id AS `Client ID`,\r\nCONCAT(cd.firstname,'' '',cd.lastname) AS `Client`,\r\nca.email AS `Client Email`\r\nFROM hb_client_details cd\r\nJOIN hb_client_access ca ON (ca.id=cd.id)\r\nINNER JOIN (\r\n SELECT firstname, lastname FROM hb_client_details GROUP BY firstname,lastname HAVING COUNT(id)>1\r\n) dup ON (dup.firstname=cd.firstname AND dup.lastname=cd.lastname)\r\nORDER BY cd.firstname,cd.lastname ASC', 1, 'sql'),
(10, 'Orders', 'Total transaction fees by gateway', 'SELECT\r\nm.modname AS `Gateway Name`,\r\nhb_currency(SUM(t.fee),t.currency_id,t.rate) AS `Total Fee`\r\nFROM hb_modules_configuration m\r\nJOIN hb_transactions t ON (t.module=m.id)\r\nGROUP BY t.module', 1, 'sql'),
(11, 'Orders', 'Total transactions count by gateway', 'SELECT\r\nm.modname AS `Gateway Name`,\r\nCOUNT(t.id) AS `Transactions count`\r\nFROM hb_modules_configuration m\r\nJOIN hb_transactions t ON (t.module=m.id)\r\nGROUP BY t.module', 1, 'sql'),
(12, 'Support', 'List of tickets due today (based on SLA)', 'SELECT\r\nt.subject AS `Ticket Subject`,\r\nt.ticket_number AS `Ticket ID`,\r\nd.name AS `Department`,\r\nt.status AS `Ticket Status`,\r\nt.name AS `Submitter Name`,\r\nt.email AS `Submitter Email`,\r\nt.`date` AS `Ticket Date`,\r\nt.resolve_date AS `Ticket Due Date`\r\nFROM hb_tickets t\r\nJOIN hb_ticket_departments d ON ( t.dept_id = d.id )\r\nWHERE t.status != ''Closed''\r\nAND\r\nt.resolve_date!=''0000-00-00 00:00:00''\r\nAND\r\nDATE(t.resolve_date)=DATE(NOW())', 1, 'sql'),
(13, 'Support', 'List of overdue tickets (based on SLA)', 'SELECT\r\nt.subject AS `Ticket Subject`,\r\nt.ticket_number AS `Ticket ID`,\r\nd.name AS `Department`,\r\nt.status AS `Ticket Status`,\r\nt.name AS `Submitter Name`,\r\nt.email AS `Submitter Email`,\r\nt.`date` AS `Ticket Date`,\r\nt.resolve_date AS `Ticket Due Date`\r\nFROM hb_tickets t\r\nJOIN hb_ticket_departments d ON ( t.dept_id = d.id )\r\nWHERE t.status != ''Closed''\r\nAND\r\nt.resolve_date!=''0000-00-00 00:00:00''\r\nAND\r\nt.resolve_date < NOW()', 1, 'sql'),
(14, 'Support', 'List of tickets rated less than 3 points this month', 'SELECT\r\nt.subject AS `Ticket Subject`,\r\nt.ticket_number AS `Ticket ID`,\r\nd.name AS `Department`,\r\nt.status AS `Ticket Status`,\r\nt.name AS `Submitter Name`,\r\nt.email AS `Submitter Email`,\r\nt.`date` AS `Ticket Date`\r\nFROM hb_tickets t\r\nJOIN hb_ticket_departments d ON ( t.dept_id = d.id )\r\nWHERE t.id IN (\r\n    SELECT r.ticket_id FROM hb_ticket_replies r JOIN  `hb_ticket_replies_rating` rate ON (rate.reply_id=r.id)\r\n    WHERE rate.rating<3\r\n)\r\nORDER BY t.date ASC', 1, 'sql'),
(15, 'Invoices', 'List of overdue invoices', '\r\nSELECT\r\ni.id AS `Invoice ID`,\r\nCONCAT(d.firstname,'' '',d.lastname) AS `Client`,\r\nhb_currency(i.total,i.currency_id,i.rate) AS `Invoice Total`,\r\ni.status AS `Invoice Status`,\r\ni.duedate AS `Invoice Due Date`,\r\nm.modname AS `Gateway Name`,\r\ntaxrate as `Tax1 rate`,\r\ntaxrate2 as `Tax2 rate`,\r\ntax as `Tax1 Amount`,\r\ntax2 as `Tax2 Amount`,\r\ni.rate AS `Exchange Rate`,\r\ni.date AS `Invoice Date`,\r\nca.email AS `Client Email`,\r\nd.phonenumber AS `Client Phone`,\r\nd.companyname  AS `Client Company`,\r\nd.city AS `Client City`,\r\nd.country AS `Client Country`,\r\nd.address1 AS `Client Address`,\r\nd.postcode AS `Client ZIP`,\r\nd.id AS `Client ID`\r\n\r\nFROM hb_invoices i\r\n    JOIN hb_client_details d ON (i.client_id=d.id)\r\n    JOIN hb_client_access ca ON (i.client_id=ca.id)\r\n    LEFT JOIN hb_modules_configuration m ON (m.id=i.payment_module)\r\n    LEFT JOIN hb_currencies c ON (c.id=i.currency_id)\r\nWHERE\r\n    i.id NOT IN (\r\n        SELECT invoice_id\r\n        FROM hb_invoice_items\r\n        WHERE `type` = ''Invoice''\r\n    )\r\n    AND i.status IN (''Unpaid'')\r\n    AND i.duedate >= NOW()\r\n\r\nORDER BY\r\n	i.id ASC', 1, 'sql'),
(16, 'Staff', 'Hours spent online by staff this week', '\r\nSELECT\r\nl.admin_id AS `Staff ID`,\r\nCONCAT( ad.firstname, '' '', ad.lastname ) AS `Staff Member`,\r\nSUM(TIME_TO_SEC(TIMEDIFF(l.logout,l.login)))/3600 as `Hours Online`\r\nFROM hb_admin_log l \r\nJOIN hb_admin_details ad ON (ad.id=l.admin_id)\r\nWHERE\r\n YEARWEEK(l.login) = YEARWEEK(NOW())\r\n GROUP BY admin_id', 1, 'sql'),
(17, 'Staff', 'Hours spent online by staff this month', '\r\nSELECT\r\nl.admin_id AS `Staff ID`,\r\nCONCAT( ad.firstname, '' '', ad.lastname ) AS `Staff Member`,\r\nSUM(TIME_TO_SEC(TIMEDIFF(l.logout,l.login)))/3600 as `Hours Online`\r\nFROM hb_admin_log l\r\nJOIN hb_admin_details ad ON (ad.id=l.admin_id)\r\nWHERE\r\n MONTH(l.login) = MONTH(NOW())\r\nAND\r\n YEAR(l.login) = YEAR(NOW())\r\n GROUP BY admin_id', 1, 'sql'),
(18, 'Support', 'Number of support ticket opened per service in given period', 'SELECT\r\nc.name AS `Product Category`,\r\np.name AS `Product Name`,\r\nCOUNT(t.id) AS `Tickets count`\r\nFROM hb_products p\r\nJOIN hb_categories c ON (c.id=p.category_id)\r\nJOIN hb_accounts a ON (a.product_id=p.id)\r\nJOIN hb_tickets t ON (t.client_id=a.client_id)\r\nWHERE\r\n    t.date >= :date_bottom\r\n    AND t.date <= :date_top\r\nGROUP BY p.id\r\n', 1, 'sql'),
(19, 'Invoices', 'Income from manually created invoices in given period', 'SELECT\r\n hb_currency(SUM(t.`in`),t.currency_id,t.rate) AS `Total Income`\r\nFROM\r\n hb_transactions t\r\n JOIN hb_invoices i ON (t.invoice_id=i.id)\r\n WHERE\r\n i.id IN (SELECT invoice_id FROM hb_invoice_items WHERE  `type`=''Other'')\r\n AND\r\n    t.date >= :date_bottom\r\n    AND t.date <= :date_top\r\n', 1, 'sql'),
(20, 'Invoices', 'List of overdue but non-terminated recurring accounts', 'SELECT\r\n a.id AS `Account ID`,\r\n c.name AS `Category Name`,\r\n p.name AS `Product Name`,\r\n a.status AS `Account Status`,\r\n a.next_due AS `Account next due date`\r\n\r\nFROM hb_accounts a\r\n JOIN hb_products p ON (p.id=a.product_id)\r\n JOIN hb_categories c ON (c.id=p.category_id)\r\nWHERE\r\n a.status NOT IN (''Terminated'',''Cancelled'',''Fraud'',''Pending'')\r\nAND\r\n a.billingcycle NOT IN (''Free'',''One Time'')\r\nAND\r\n a.id IN (\r\n SELECT it.item_id FROM hb_invoice_items it JOIN hb_invoices i ON (i.id=it.invoice_id)\r\n WHERE it.type=''Hosting'' AND i.status=''Unpaid''\r\n)', 1, 'sql'),
(21, 'Invoices', 'Total sales tax liability in selected period', 'SELECT\r\n hb_currency(SUM(i.tax)) AS `Total Tax L1`,\r\n hb_currency(SUM(i.tax2)) AS `Total Tax L2`,\r\n hb_currency(SUM(i.total)) AS `Invoice totals`,\r\n hb_currency(SUM(i.subtotal)) AS `Invoice subtotals`,\r\n hb_currency(SUM(i.credit)) AS `Invoice credits`\r\nFROM hb_invoices i\r\n WHERE i.status=''Paid''\r\n AND  i.datepaid>= :date_bottom\r\n    AND i.datepaid<= :date_top', 1, 'sql'),
(22, 'Invoices', 'Sales tax liability in selected period, converted to main currency', '\r\nSELECT\r\ni.id AS `Invoice ID`,\r\nCONCAT(d.firstname,'' '',d.lastname) AS `Client`,\r\nhb_currency(i.total) AS `Invoice Subtotal`,\r\nhb_currency(i.credit) AS `Invoice Credit`,\r\nhb_currency(i.tax) AS `Invoice Tax L1`,\r\nhb_currency(i.tax2) AS `Invoice Tax L2`,\r\nhb_currency(i.total) AS `Invoice Total`,\r\nhb_date(i.datepaid) AS `Invoice Paid Date`,\r\nhb_date(i.date) AS `Invoice Date`,\r\nm.modname AS `Gateway Name`,\r\nt.trans_id AS `Related transaction`\r\n\r\nFROM hb_invoices i\r\n    JOIN hb_client_details d ON (i.client_id=d.id)\r\n    JOIN hb_client_access ca ON (i.client_id=ca.id)\r\n    LEFT JOIN hb_modules_configuration m ON (m.id=i.payment_module)\r\n    LEFT JOIN hb_transactions t ON (t.invoice_id=i.id)\r\nWHERE\r\n    i.id NOT IN (\r\n        SELECT invoice_id\r\n        FROM hb_invoice_items\r\n        WHERE `type` = ''Invoice''\r\n    )\r\n    AND i.status IN (''Paid'')\r\n    AND i.datepaid>= :date_bottom\r\n    AND i.datepaid<= :date_top\r\n\r\nORDER BY\r\n	i.id ASC', 1, 'sql'),
(23, 'Support', '15 clients with highest number of tickets', 'SELECT\r\n t.client_id AS `Client ID`,\r\n COUNT(t.id) AS `Total tickets`,\r\n CONCAT(cd.firstname,'' '',cd.lastname) AS `Client`,\r\n cd.datecreated AS `Client since`\r\nFROM hb_tickets t JOIN\r\n hb_client_details cd ON (cd.id=t.client_id)\r\n\r\nGROUP BY t.client_id\r\nORDER BY `Total tickets` DESC\r\nLIMIT 15', 1, 'sql'),
(24, 'Clients', 'List all suspended accounts with their suspension dates', 'SELECT\r\n a.id AS `Account ID`,\r\n MAX(s.`date`) AS `Suspension Date`,\r\n a.client_id AS `Client ID`,\r\n CONCAT(cd.firstname,'' '',cd.lastname) AS `Client`,\r\n a.`domain` AS `Account Domain`,\r\n a.date_created AS `Creation date`,\r\n a.billingcycle AS `Billing cycle`,\r\n a.username AS `Username`\r\nFROM\r\n     hb_accounts a JOIN\r\n     hb_client_details cd ON (cd.id=a.client_id) JOIN\r\n     `hb_account_logs` s ON (s.account_id=a.id)\r\nWHERE\r\n     a.status=''Suspended''\r\n    AND s.`event`=''AccountSuspend'' \r\n    AND s.`result`=''1''\r\nGROUP BY a.id\r\nORDER BY `Suspension Date` DESC', 1, 'sql'),
(25, 'Orders', 'All transactions informations in given period with purchased items details', 'SELECT t.trans_id AS `Transaction ID`, t.date AS `Transaction Date`, hb_currency(t.`in`,t.`currency_id`,t.rate) AS `Amount In`, it.description AS `Invoice Item`, hb_currency(t.`fee`,t.`currency_id`,t.rate) AS `Transaction Fees`, CONCAT(d.firstname,'' '',d.lastname) AS `Client`, t.description AS `Transaction Description`, hb_currency(t.`out`,t.`currency_id`,t.rate) AS `Amount Out`, t.client_id AS `Client ID`, t.invoice_id AS `Invoice ID`, m.modname AS `Payment Gateway` FROM hb_transactions t JOIN hb_invoices i ON (i.id=t.invoice_id) JOIN hb_invoice_items it ON (it.invoice_id=i.id) JOIN hb_client_details d ON (d.id=t.client_id) JOIN hb_modules_configuration m ON (m.id=t.`module`) WHERE t.date>= :date_bottom AND t.date<= :date_top ORDER BY t.date DESC', 1, 'sql'),
(26, 'Support', 'Weekend support by staff member in given period', '\r\nSELECT COUNT(DISTINCT t.`id`) AS `Tickets answered`,  r.name AS `Staff Name`\r\nFROM hb_tickets t\r\nJOIN hb_ticket_replies r ON (r.ticket_id=t.id)\r\nWHERE\r\n r.type=''Admin''\r\n AND\r\n r.`date` > :date_bottom\r\nAND\r\n r.`date` < :date_top\r\n AND\r\n DAYOFWEEK(r.`date`) IN (1,7)\r\nGROUP BY\r\nr.replier_id\r\n)\r\n', 1, 'sql'),
(27, 'Support', 'Number of tickets closed per staff member in given period', 'SELECT SUBSTRING_INDEX(l.`action`,''member'',''-1'') AS `Staff member`, COUNT(t.`id`) AS `Total closed`, DATE(l.`date`) AS `Date` FROM `hb_tickets` t JOIN `hb_tickets_log` l ON (l.ticket_id=t.id) WHERE l.date>= :date_bottom AND l.date<= :date_top AND t.status=''Closed'' AND l.action LIKE ''%to "Closed" by%'' GROUP BY `Date`, `Staff member`', 1, 'sql'),
(28, 'Support', 'Detailed list of all tickets in given period', 'SELECT t.subject AS `Ticket Subject`, t.ticket_number AS `Ticket ID`, d.`name` AS `Department`, t.status AS `Ticket Status`, t.`name` AS `Submitter Name`, t.email AS `Submitter Email`, t.`date` AS `Ticket Date`, COALESCE(CONCAT(a.firstname,'' '',a.lastname),''-'') AS `Assigned Admin`, COALESCE(r.`rep`,''0'') AS `Number of Replies`, t.`lastreply` AS `Last Reply Date`, t.`priority` AS `Priority Level` FROM `hb_tickets` t JOIN `hb_ticket_departments` d ON ( t.dept_id = d.id ) LEFT JOIN (SELECT r.`ticket_id`, COUNT(r.`id`) AS `rep` FROM `hb_ticket_replies` r WHERE r.`status`!=''Draft'' GROUP BY r.`ticket_id`) r ON (r.ticket_id=t.id) LEFT JOIN `hb_admin_details` a ON (a.id=t.owner_id) WHERE t.`date`>= :date_bottom AND t.`date`<= :date_top ', 1, 'sql'),
(29, 'Orders', 'Income per product in given period', 'SELECT p.name AS `Product Name`, SUM(it.`amount`) AS `Product Income`, p.id AS `Product ID` FROM hb_invoices i JOIN hb_invoice_items it ON (it.invoice_id=i.id) JOIN hb_accounts a ON (a.id=it.item_id AND it.type=''Hosting'') JOIN hb_products p ON (p.id=a.product_id) WHERE i.status=''Paid'' AND i.`datepaid`>= :date_bottom AND i.`datepaid`<= :date_top GROUP BY p.id ORDER BY `Product Income` DESC', 1, 'sql'),
(30, 'Orders', 'Number of sales per product in given period', 'SELECT c.name as `Category Name`,\r\np.name as `Product Name`,\r\nCOUNT(a.id) as `Items Sold`,\r\np.id as `Product ID` \r\nFROM hb_invoices `i` \r\nINNER JOIN hb_invoice_items `it` ON (it.invoice_id = i.id) \r\nINNER JOIN hb_accounts `a` ON (a.id = it.item_id \r\nAND it.type = ''Hosting'') \r\nINNER JOIN hb_products `p` ON (a.product_id = p.id) \r\nINNER JOIN hb_categories `c` ON (c.id = p.category_id) \r\nWHERE\r\n i.status = ''Paid'' \r\nAND i.datepaid > :date_bottom \r\nAND i.datepaid < :date_top \r\nAND i.id IN (SELECT invoice_id \r\nFROM hb_orders) \r\nGROUP BY p.id \r\n\r\nORDER BY `Items Sold` DESC', 1, 'sql'),
(31, 'Custom', 'Revenue per product type', 'report.revenuepertype.php', 0, 'php'),
(32, 'Support', 'Top 30 tickets-posting countries', 'SELECT cd.country AS  `Client Country` , COUNT( t.id ) AS  `Tickets Count` \r\n    FROM hb_tickets t\r\n    JOIN hb_client_details cd ON ( cd.id = t.client_id ) \r\n    GROUP BY cd.country\r\n    ORDER BY  `Tickets Count` DESC \r\n    LIMIT 30', 1, 'sql'),
(33, 'Orders', 'Total transaction fees by gateway, sort by period', 'SELECT m.modname as `Gateway Name`,\r\nhb_currency(SUM(t.fee) ,\r\nt.currency_id,t.rate) as `Total Fee` \r\nFROM hb_modules_configuration `m` \r\nINNER JOIN hb_transactions `t` ON (t.module = m.id) \r\nWHERE\r\n t.date > :date_bottom \r\nAND t.date < :date_top \r\nGROUP BY t.module', 1, 'sql'),
(34, 'Orders', 'Total transactions count by gateway, sort by period', 'SELECT m.modname as `Gateway Name`,\r\nCOUNT(t.id) as `Transactions count` \r\nFROM hb_modules_configuration `m` \r\nINNER JOIN hb_transactions `t` ON (t.module = m.id) \r\nWHERE\r\n t.date > :date_bottom \r\nAND t.date < :date_top \r\nGROUP BY t.module', 1, 'sql'),
(35, 'Orders', 'Discounts by promocode', 'SELECT \r\nc.code as `Promotional coupon`,\r\nSUM(l.discount) AS `Total Discount`,\r\nCOUNT(l.id) AS `Times Used`,\r\nCOALESCE(cx.iso,''Main Currency'') AS `Currency`\r\nFROM \r\nhb_coupons c\r\nJOIN\r\nhb_coupons_log l ON (l.coupon_id=c.id)\r\nJOIN \r\nhb_client_billing b ON b.client_id=l.client_id\r\nLEFT JOIN hb_currencies cx \r\nON cx.id=b.currency_id\r\nWHERE\r\nl.date>:date_bottom\r\nAND\r\nl.date<:date_top\r\n\r\n\r\nGROUP BY b.currency_id,c.id', 1, 'sql'),
(36, 'Clients', 'List of credits applied to client accounts in given period', 'SELECT l.date AS `Date`,\nl.`in` AS `Credit Applied`,\nl.`admin_id` AS `Staff ID`,\nCONCAT( ad.firstname, '' '', ad.lastname ) AS `Staff Member`,\nCOALESCE(mc.modname,''None'') AS `Gateway`,\nCOALESCE(cx.iso,''Main Currency'') AS `Currency`,\nl.client_id AS `Client Id`,\nCONCAT(cd.firstname,'' '',cd.lastname) AS `Client name`\nFROM hb_client_credit_log l\nJOIN hb_client_details cd ON cd.id =l.client_id\nJOIN hb_client_billing b ON b.client_id=l.client_id\nLEFT JOIN hb_transactions t ON t.id=l.transaction_id\nLEFT JOIN hb_modules_configuration mc ON mc.id=t.module\nLEFT JOIN hb_currencies cx ON cx.id=b.currency_id\nLEFT JOIN hb_admin_details ad ON ad.id=l.admin_id\n\nWHERE l.date>:date_bottom\nAND l.date<:date_top\nAND l.`in`>0\nORDER BY l.date ASC', 1, 'sql'),
(37, 'Clients', 'Amount of credit applied to client accounts in given period by gateway', 'SELECT\r\nSUM(l.`in`) AS `Credit Applied`,\r\nCOALESCE(mc.modname,''None'') AS `Gateway`,\r\nCOALESCE(cx.iso,''Main Currency'') AS `Currency`\r\nFROM\r\nhb_client_credit_log l\r\nJOIN\r\nhb_client_details cd ON cd.id =l.client_id\r\nJOIN\r\nhb_client_billing b ON b.client_id=l.client_id\r\nLEFT JOIN hb_transactions t ON t.id=l.transaction_id\r\nLEFT JOIN hb_modules_configuration mc ON mc.id=t.module\r\n\r\nLEFT JOIN hb_currencies cx ON cx.id=b.currency_id\r\n\r\nWHERE\r\nl.date>:date_bottom\r\nAND\r\nl.date<:date_top\r\nAND\r\nl.`in`>0\r\n\r\nGROUP BY b.currency_id,t.module', 1, 'sql'),
(38, 'Clients', 'Amount of credit applied to client accounts in given period by staff member', 'SELECT SUM(l.`in`) AS `Credit Applied`,\nCOALESCE(cx.iso,''Main Currency'') AS `Currency`,\nl.admin_id AS `Staff ID`,\nCONCAT( ad.firstname, '' '', ad.lastname ) AS `Staff Member`\nFROM hb_client_credit_log l\nJOIN hb_client_details cd ON cd.id =l.client_id\nJOIN hb_client_billing b ON b.client_id=l.client_id\nLEFT JOIN hb_transactions t ON t.id=l.transaction_id\nLEFT JOIN hb_modules_configuration mc ON mc.id=t.module\nLEFT JOIN hb_currencies cx ON cx.id=b.currency_id\nLEFT JOIN hb_admin_details ad ON ad.id=l.admin_id\nWHERE l.date>:date_bottom\nAND l.date<:date_top\nAND\nl.`in`>0\nGROUP BY b.currency_id, l.admin_id', 1, 'sql');
##########
CREATE TABLE `hb_security_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule` varchar(32) NOT NULL,
  `action` enum('allow','deny') NOT NULL DEFAULT 'allow',
  `target` enum('admin','user') NOT NULL DEFAULT 'admin',
  `target_id` int(11) NOT NULL,
  `options` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reule` (`rule`),
  KEY `target_id` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_server_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `module` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_servers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `ip` text NOT NULL,
  `host` text NOT NULL,
  `status_url` text NOT NULL,
  `ns1` varchar(128) NOT NULL,
  `ns2` varchar(128) NOT NULL,
  `ns3` varchar(128) NOT NULL,
  `ns4` varchar(128) NOT NULL,
  `ip1` varchar(128) NOT NULL,
  `ip2` varchar(128) NOT NULL,
  `ip3` varchar(128) NOT NULL,
  `ip4` varchar(128) NOT NULL,
  `max_accounts` int(11) NOT NULL DEFAULT '0',
  `default_module` int(11) NOT NULL,
  `hash` text NOT NULL,
  `secure` tinyint(1) NOT NULL DEFAULT '0',
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `field1` text NOT NULL,
  `field2` text NOT NULL,
  `custom` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `def` (`default_module`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ssh_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `key` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_subproducts` (
  `product_id` int(11) NOT NULL,
  `subproduct_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`subproduct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_subscription_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscr_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `type` enum('Hosting','Addon','Other') NOT NULL,
  `description` text NOT NULL,
  `next_date` date NOT NULL,
  `period` int(2) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `invoice_id` int(11) NOT NULL,
  `gateway_subid` text NOT NULL,
  `gateway_name` text NOT NULL,
  `gateway_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subscr_id` (`subscr_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `client_id` (`client_id`),
  KEY `gateway_id` (`gateway_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `what` text NOT NULL,
  `who` varchar(128) NOT NULL,
  `type` enum('none','order','invoice','client','account','domain','transaction','cron_prof','admin','admin_group','product','product_cat','product_add','server','email_tpl') NOT NULL DEFAULT 'none',
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_task_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task` varchar(128) NOT NULL,
  `when` enum('before','after') NOT NULL DEFAULT 'before',
  `event` varchar(128) NOT NULL,
  `interval` int(11) NOT NULL DEFAULT '0',
  `interval_type` enum('DAY','HOUR','MINUTE') NOT NULL DEFAULT 'DAY',
  `rel_type` enum('Hosting','Addon','Ticket','Domain') NOT NULL DEFAULT 'Hosting',
  `rel_id` int(11) NOT NULL DEFAULT '0',
  `action_config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `when` (`when`,`event`,`interval`),
  KEY `rel_type` (`rel_type`,`rel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_task_list` (`id`, `task`, `when`, `event`, `interval`, `interval_type`, `rel_type`, `rel_id`, `action_config`) VALUES
(1, 'nan', 'before', 'AccountSuspend', 0, 'DAY', 'Hosting', 0, ''),
(2, 'nan', 'before', 'AccountTerminate', 0, 'DAY', 'Hosting', 0, '');
##########
CREATE TABLE `hb_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `rel_type` enum('Hosting','Addon','Domain') NOT NULL DEFAULT 'Hosting',
  `rel_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_execute` datetime NOT NULL,
  `status` enum('Pending','OK','Failed','Canceled','Expired','Archived') NOT NULL DEFAULT 'Pending',
  `log` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`,`status`),
  KEY `rel_type` (`rel_type`,`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `type` enum('L1','L2') NOT NULL,
  `name` varchar(128) NOT NULL,
  `state` text NOT NULL,
  `country` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country` (`country`),
  KEY `state` (`state`(2))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_template_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `checksum` varchar(32) NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `KEY` (`template_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_template_content` (`id`, `template_id`, `name`, `content`, `checksum`, `updated`) VALUES
(1, 1, 'Default', '<style type="text/css">\r\n    body {\r\n        font-family: Arial;\r\n    }\r\n</style>\r\n<div style="padding:40px;font-family: Arial;" id="invoice-table">\r\n    <table border="0" cellspacing="0" width="100%">\r\n        <tbody>\r\n            <tr id="invoice-header">\r\n                <td width="66%" valign="middle" align="left" colspan="2" style="padding-left:10px">\r\n                    <span style="font-size:18px;font-weight:bold;color:#484740;">{$companylogo}</span>\r\n                    <span style="font-size:18px;font-weight:bold;color:#A4A4A4">{$invoice.number}</span>\r\n                </td>\r\n                \r\n                <td valign="middle" align="right">\r\n                    <table cellpadding="2"  cellspacing="0" border="0">\r\n                        <tr>\r\n                            <td align="right"><span style="font-size:12px;font-weight:bold">{$lang.invoice}</span></td>\r\n                            <td align="left"><span style="font-size:12px">{$invoice.id}</span></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align="right"><span style="font-size:12px;font-weight:bold">{$lang.invoice_date}</span></td>\r\n                            <td align="left"><span style="font-size:12px">{$invoice.date}</span></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align="right"><span style="font-size:12px;font-weight:bold">{$lang.invoice_due}</span></td>\r\n                            <td align="left"><span style="font-size:12px">{$invoice.duedate}</span></td>\r\n                        </tr>\r\n                    </table>\r\n\r\n                </td>\r\n            </tr>\r\n\r\n\r\n            <tr id="invoice-details">\r\n                <td valign="top" style="padding-top:40px" width="33%">\r\n                    <span style="font-size:12px;font-weight:bold;">{$lang.invoice_to}</span><br/>\r\n                    <span style="font-size:11px">{$client.companyname}<br/>\r\n                        {$client.firstname} {$client.lastname}<br />\r\n                        {$client.address1} <br />\r\n                        {$client.address2}<br />\r\n                        {$client.city}, {$client.state}{$client.postcode}<br />\r\n                        {$client.country}\r\n                    </span>\r\n\r\n                </td>\r\n                <td valign="top"  style="padding-top:40px" width="33%">\r\n                    <span style="font-size:12px;font-weight:bold;">{$lang.invoice_from}</span><br/>\r\n                    <span style="font-size:11px">{$invoicefrom}</span>\r\n                </td>\r\n                <td valign="top"  style="padding-top:40px" align="left"  width="33%">\r\n                    <table cellpadding="2"  cellspacing="0" border="0">\r\n                        <tr>\r\n                            <td align="right"><span style="font-size:12px;font-weight:bold;">{$lang.status}:</span></td>\r\n                            <td align="left"><span style="font-size:12px;font-weight:bold;">{$invoice.status}</span></td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td align="right"><span style="font-size:12px;font-weight:bold;">{$lang.balance}:</span></td>\r\n                            <td align="left"><span style="font-size:12px;font-weight:bold;">{$transbalance}</span></td>\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n            </tr>\r\n\r\n        </tbody>\r\n    </table>\r\n\r\n\r\n\r\n    <table class="invoice-table" width="100%" border="0" cellpadding="6" cellspacing="0" style="margin-top:50px;width:100%;">\r\n        <tbody>\r\n            <tr>\r\n                <td  align="left" bgcolor="#f0f0f0"  valign="middle" ><span style="font-size:11px;font-weight:bold">{$lang.invoice_desc}</span></td>\r\n                <td style="width:7%"  align="center" bgcolor="#f0f0f0" valign="middle" ><span style="font-size:11px;font-weight:bold">{$lang.invoice_tax}</span></td>\r\n                <td style="width:15%"  align="right" bgcolor="#f0f0f0" valign="middle" ><span style="font-size:11px;font-weight:bold">{$lang.unitcost}</span></td>\r\n                <td style="width:7%"  align="center" bgcolor="#f0f0f0" valign="middle" ><span style="font-size:11px;font-weight:bold">{$lang.qty}</span></td>\r\n                <td style="width:15%"  align="right" bgcolor="#f0f0f0" valign="middle" ><span style="font-size:11px;font-weight:bold">{$lang.price}</span></td>\r\n            </tr>\r\n\r\n\r\n            <tr>\r\n                <td style="border-bottom: 1px solid #F0F0F0;"  valign="middle" ><span style="font-size:11px">{$item.description}</span></td>\r\n                <td style="border-bottom: 1px solid #F0F0F0;" align="center"  valign="middle" ><span style="font-size:11px">{$item.taxed}</span></td>\r\n                <td style="border-bottom: 1px solid #F0F0F0;" align="right"  valign="middle" ><span style="font-size:11px">{$item.amount}</span></td>\r\n                <td style="border-bottom: 1px solid #F0F0F0;" align="center"  valign="middle" ><span style="font-size:11px">{$item.qty}</span></td>\r\n                <td style="border-bottom: 1px solid #F0F0F0;" align="right"  valign="middle" ><span style="font-size:11px">{$item.linetotal}</span></td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td class=""></td>\r\n                <td align="right" colspan="2"  valign="middle" ><span style="font-size:12px;font-weight:bold;">{$lang.subtotal}</span></td>\r\n                <td align="right" colspan="2"   valign="middle" ><span style="font-size:12px">{$invoice.subtotal}</span></td>\r\n            </tr>\r\n            <tr>\r\n                <td class=""></td>\r\n                <td align="right" colspan="2"  valign="middle" ><span style="font-size:12px;font-weight:bold;">{$lang.credit}</span></td>\r\n                <td align="right" colspan="2"   valign="middle" ><span style="font-size:12px">{$invoice.credit}</span></td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td class=""></td>\r\n                <td align="right" colspan="2"  valign="middle" ><span style="font-size:12px;font-weight:bold;">{$lang.tax} ({$invoice.taxrate}%)</span></td>\r\n                <td align="right" colspan="2"  valign="middle" ><span style="font-size:12px">{$invoice.tax}</span></td>\r\n            </tr>\r\n\r\n            <tr>\r\n                <td class=""></td>\r\n                <td align="right" colspan="2"   valign="middle" ><span style="font-size:12px;font-weight:bold;">{$lang.tax} ({$invoice.taxrate2}%)</span></td>\r\n                <td align="right" colspan="2"  valign="middle" ><span style="font-size:12px">{$invoice.tax2}</span></td>\r\n            </tr>\r\n\r\n\r\n            <tr>\r\n                <td class=""></td>\r\n                <td align="right" colspan="2"  valign="middle" ><span style="font-size:14px; font-weight:bold;">{$lang.total}</span></td>\r\n                <td align="right" colspan="2"   valign="middle" ><span style="font-size:14px; font-weight:bold;">{$invoice.total}</span></td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n\r\n\r\n    <table  width="100%" border="0" cellpadding="0" cellspacing="0"  style="margin-top:50px;">\r\n        <tr><td align="left"  valign="middle" style="width:100%">\r\n                <span style="font-size:11px;"><em>{$invoice.notes}</em></span>\r\n            </td></tr>\r\n    </table>\r\n\r\n\r\n\r\n    <table class="invoice-table-transaction" width="100%" border="0" cellpadding="6" cellspacing="0" style="margin-top:50px;">\r\n        <tbody>\r\n            <tr>\r\n                <td colspan="4" style="width:100%">\r\n                    <span style="font-size:11px;font-weight:bold;">{$lang.related_trans}</span>\r\n                </td>\r\n            </tr>\r\n            <tr>\r\n                <td   bgcolor="#f0f0f0" align="left"   valign="middle" ><span style="font-size:11px;font-weight:bold">{$lang.trans_date}</span></td>\r\n                <td  align="center" bgcolor="#f0f0f0"   valign="middle" ><span style="font-size:11px;font-weight:bold">{$lang.trans_gtw}</span></td>\r\n                <td  align="center" bgcolor="#f0f0f0"   valign="middle" ><span style="font-size:11px;font-weight:bold">{$lang.trans_id}</span></td>\r\n                <td  align="right" bgcolor="#f0f0f0"   valign="middle" ><span style="font-size:11px;font-weight:bold">{$lang.trans_amount}</span></td>\r\n            </tr>\r\n            <tr>\r\n                <td align="left"  valign="middle" style="border-bottom: 1px solid #F0F0F0;"><span style="font-size:11px">{$transaction.date}</span></td>\r\n                <td align="center"   valign="middle" style="border-bottom: 1px solid #F0F0F0;"><span style="font-size:11px">{$transaction.module}</span></td>\r\n                <td align="center"   valign="middle" style="border-bottom: 1px solid #F0F0F0;"><span style="font-size:11px">{$transaction.trans_id}</span></td>\r\n                <td align="right" valign="middle" style="border-bottom: 1px solid #F0F0F0;"><span style="font-size:11px">{$transaction.amount}</span></td>\r\n            </tr>\r\n            <tr>\r\n                <td class="" ></td>\r\n                <td class=""></td>\r\n                <td align="right"   valign="middle" ><span style="font-size:11px;font-weight:bold;">{$lang.balance}</span></td>\r\n                <td  align="right"   valign="middle" ><span style="font-size:11px;font-weight:bold;">{$transbalance}</span></td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n\r\n\r\n    <table  width="100%" border="0" cellpadding="0" cellspacing="0"  style="margin-top:50px;">\r\n        <tr><td align="center" style="border-top:1px solid #F0F0F0;padding-top:10px;width:100%">\r\n                <span style="font-size:11px;color:#A4A4A4">{$invoiceFooter}</span>\r\n            </td></tr>\r\n    </table>\r\n</div>', 'd41d8cd98f00b204e9800998ecf8427e', '2011-12-06 00:00:00'),
(100, 100, 'EU Invoicing', '<style type="text/css"><!--\r\n    body {\r\n        font-family: Verdana, Arial, Helvetica;\r\n    }\r\n    #invoice-content #invoice-table {\r\n        padding-top:40px !important;\r\n    }\r\n    .fs_11 {\r\n        font-size:11px;\r\n    }\r\n    #invoice-items-table{\r\n        border-collapse: collapse;\r\n    }\r\n    .fullborder {\r\n        border:solid 1px #000;\r\n    }\r\n    .rowspace td {\r\n        height:2px;padding:0px;\r\n    }\r\n    .doubleborder {\r\n        border:solid 2px #000; font-weight:bold;\r\n    }\r\n    .noborder {\r\n        border:none;\r\n    }\r\n--></style>\r\n<div id="invoice-table" style="padding: 20px; font-family: Verdana, Arial, Helvetica;">\r\n<table style="width: 100%; margin-bottom: 20px;" border="0" cellspacing="0">\r\n<tbody>\r\n<tr id="invoicetitle">\r\n<td style="border-bottom: solid 1px #000;" colspan="3" align="right" valign="middle" width="66%"><em style="font-size: 18px; font-weight: bold;">{$invoice.number}</em></td>\r\n</tr>\r\n<tr id="invoice-dateinfo">\r\n<td class="fs_11" colspan="3" align="right">{$lang.original}<br />{$lang.invoice_date}: {$invoice.date}</td>\r\n</tr>\r\n<tr id="invoice-spacer">\r\n<td colspan="3">&nbsp;</td>\r\n</tr>\r\n<tr id="invoice-details">\r\n<td style="border: solid 1px #000;" valign="top" width="45%"><span style="font-size: 12px; font-weight: bold;">{$lang.invoice_from}</span></td>\r\n<td align="left" valign="top" width="10%">&nbsp;</td>\r\n<td style="border: solid 1px #000;" valign="top" width="45%"><span style="font-size: 12px; font-weight: bold;">{$lang.invoice_to}</span> <br /> <span style="font-size: 11px;">{if $client.companyname}{$client.companyname}, {/if}{$client.firstname} {$client.lastname}<br /> {$client.address1} {if $client.address2}, {$client.address2}{/if}{if $client.postcode}, {$client.postcode}{/if} {$client.city} {if $client.country}, {$client.country}{/if}{if $client.vateu}<br />{$lang.vateu}: {$client.vateu}{/if}</span></td>\r\n</tr>\r\n<tr id="invoice-spacer">\r\n<td colspan="3">&nbsp;</td>\r\n</tr>\r\n<tr id="invoice-payinfo">\r\n<td class="fs_11" colspan="3" align="left">{$lang.paymethod}: {$invoice.paymentgw}<br /> {$lang.dateofsale}: {$invoice.date}</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<span style="font-size: 11px;">{foreach from=$transactions item=trans}{$lang.trans_id} {$trans.trans_id}{break}{/foreach}</span>{if $invoice.notes}{/if}\r\n<table id="invoice-items-table" class="invoice-table" style="width: 100%;" border="0" cellspacing="0" cellpadding="6">\r\n<tbody>\r\n<tr>\r\n<td class="fullborder" align="left" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.invoice_desc}</span></td>\r\n<td class="fullborder" style="width: 8%;" align="right" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.qty}</span></td>\r\n<td class="fullborder" style="width: 11%;" align="right" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.unitcost}</span></td>\r\n<td class="fullborder" style="width: 11%;" align="right" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.netprice}</span></td>\r\n<td class="fullborder" style="width: 8%;" align="right" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.tax}</span></td>\r\n<td class="fullborder" style="width: 11%;" align="right" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.taxamount}</span></td>\r\n<td class="fullborder" style="width: 11%;" align="right" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.grossprice}</span></td>\r\n</tr>\r\n<tr>\r\n<td class="fullborder" valign="middle"><span style="font-size: 11px;">{$item.description}</span></td>\r\n<td class="fullborder" align="right" valign="middle"><span style="font-size: 11px;">{$item.qty}</span></td>\r\n<td class="fullborder" align="right" valign="middle"><span style="font-size: 11px;">{$item.amount}</span></td>\r\n<td class="fullborder" align="right" valign="middle"><span style="font-size: 11px;">{$item.linetotal}</span></td>\r\n<td class="fullborder" align="right" valign="middle"><span style="font-size: 11px;">{if !$item.tax_rate}{$lang.nottaxed}{else}{$item.tax_rate}%{/if}</span></td>\r\n<td class="fullborder" align="right" valign="middle"><span style="font-size: 11px;">{$item.tax_amount}</span></td>\r\n<td class="fullborder" align="right" valign="middle"><span style="font-size: 11px;">{$item.linetaxed}</span></td>\r\n</tr>\r\n<tr>\r\n<td colspan="2" valign="middle"><span style="font-size: 12px; font-weight: bold;">{$lang.invoicedue}: {$invoice.total}</span></td>\r\n<td align="right" valign="middle"><span style="font-size: 12px; font-weight: bold;">{$lang.total}</span></td>\r\n<td class="fullborder" align="right" valign="middle"><span style="font-size: 11px;">{$invoice.subtotal}</span></td>\r\n<td class="fullborder" align="right" valign="middle">&nbsp;</td>\r\n<td class="fullborder" align="right" valign="middle"><span style="font-size: 11px;">{$invoice.tax}</span></td>\r\n<td class="doubleborder" align="right" valign="middle"><span style="font-size: 11px;">{$invoice.total}</span></td>\r\n</tr>\r\n<tr class="rowspace">\r\n<td colspan="7">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td colspan="2" valign="middle">&nbsp;</td>\r\n<td align="right" valign="middle">{if $smarty.foreach.taxloop.first}<span style="font-size: 12px; font-weight: bold;">{$lang.including}</span>{/if}</td>\r\n<td class="fullborder" align="right" valign="middle"><span style="font-size: 11px;">{$taxitm.subtotal}</span></td>\r\n<td class="fullborder" align="right" valign="middle"><span style="font-size: 11px;">{if !$taxitm.name}{$lang.nottaxed}{else}{$taxitm.name}%{/if}</span></td>\r\n<td class="fullborder" align="right" valign="middle"><span style="font-size: 11px;">{$taxitm.tax}</span></td>\r\n<td class="fullborder" align="right" valign="middle"><span style="font-size: 11px;">{$taxitm.total}</span></td>\r\n</tr>\r\n<tr>\r\n<td style="font-size: 12px;" colspan="3" valign="middle">{$lang.Paid}: {$totalpaid}<br /> {$lang.leftunpaid}: {$transbalance}</td>\r\n<td colspan="4" valign="middle">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td colspan="3" valign="middle">&nbsp;</td>\r\n<td style="font-size: 11px; border: solid 1px #000;" colspan="4" valign="middle">{$lang.notes}<br />{$invoice.notes}</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table style="margin-top: 50px; width: 100%;" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td style="width: 100%;" align="left" valign="middle"><span style="font-size: 11px;">{$lang.pdfagreement}</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table style="margin-top: 50px; width: 100%;" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td style="border-top: 1px solid #F0F0F0; padding-top: 10px; width: 100%;" align="right"><span style="font-size: 11px; color: #a4a4a4;">Invoice footer text</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>', 'b3d83359bb9fd7290243d07b6a9a8176', '2013-05-16 13:04:47'),
(101, 101, 'Default', '<style type="text/css"><!--\r\n        body {\r\n            font-family: Arial;\r\n        }\r\n--></style>\r\n<div id="invoice-table" style="padding: 40px; font-family: Arial;">\r\n<table style="width: 100%;" border="0" cellspacing="0">\r\n<tbody>\r\n<tr id="invoice-header">\r\n<td style="padding-left: 10px;" colspan="2" align="left" valign="middle" width="66%"><span style="font-size: 18px; font-weight: bold; color: #484740;">{$companylogo}</span> <span style="font-size: 18px; font-weight: bold; color: #a4a4a4;">{$lang.customerquote}</span></td>\r\n<td align="right" valign="middle">\r\n<table border="0" cellspacing="0" cellpadding="2">\r\n<tbody>\r\n<tr>\r\n<td align="right"><span style="font-size: 12px; font-weight: bold;">{$lang.estimate_id}</span></td>\r\n<td align="left"><span style="font-size: 12px;">#{$estimate.id}</span></td>\r\n</tr>\r\n<tr>\r\n<td align="right"><span style="font-size: 12px; font-weight: bold;">{$lang.status}</span></td>\r\n<td align="left"><span style="font-size: 12px;">{$estimate.status}</span></td>\r\n</tr>\r\n<tr>\r\n<td align="right"><span style="font-size: 12px; font-weight: bold;">{$lang.estimate_date}</span></td>\r\n<td align="left"><span style="font-size: 12px;">{$estimate.date_created}</span></td>\r\n</tr>\r\n<tr>\r\n<td align="right"><span style="font-size: 12px; font-weight: bold;">{$lang.expirydate}</span></td>\r\n<td align="left"><span style="font-size: 12px;">{$estimate.date_expires}</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr id="invoice-details">\r\n<td style="padding-top: 40px;" valign="top" width="33%"><span style="font-size: 12px; font-weight: bold;">{$lang.customer}</span> <br /> <span style="font-size: 11px;">{$client.companyname} <br /> {$estimate.client.firstname} {$estimate.client.lastname} <br /> {$estimate.client.address1} <br /> {$estimate.client.address2} <br /> {$estimate.client.city}, {$estimate.client.state} {$estimate.client.postcode} <br /> {$estimate.client.country} </span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table class="invoice-table" style="margin-top: 50px; width: 100%;" border="0" cellspacing="0" cellpadding="6">\r\n<tbody>\r\n<tr>\r\n<td align="left" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.invoice_desc}</span></td>\r\n<td style="width: 7%;" align="center" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.invoice_tax}</span></td>\r\n<td style="width: 15%;" align="right" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.unitcost}</span></td>\r\n<td style="width: 7%;" align="center" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.qty}</span></td>\r\n<td style="width: 15%;" align="right" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.price}</span></td>\r\n</tr>\r\n<tr>\r\n<td style="border-bottom: 1px solid #F0F0F0;" valign="middle"><span style="font-size: 11px;">{$item.description}</span></td>\r\n<td style="border-bottom: 1px solid #F0F0F0;" align="center" valign="middle"><span style="font-size: 11px;">{$item.taxed}</span></td>\r\n<td style="border-bottom: 1px solid #F0F0F0;" align="right" valign="middle"><span style="font-size: 11px;">{$item.amount}</span></td>\r\n<td style="border-bottom: 1px solid #F0F0F0;" align="center" valign="middle"><span style="font-size: 11px;">{$item.qty}</span></td>\r\n<td style="border-bottom: 1px solid #F0F0F0;" align="right" valign="middle"><span style="font-size: 11px;">{$item.linetotal}</span></td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 12px; font-weight: bold;">{$lang.subtotal}</span></td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 12px;">{$estimate.subtotal}</span></td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 12px; font-weight: bold;">{$lang.credit}</span></td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 12px;">{$estimate.credit}</span></td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 12px; font-weight: bold;">{$lang.tax} ({$estimate.taxrate}%)</span></td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 12px;">{$estimate.tax}</span></td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 12px; font-weight: bold;">{$lang.tax} ({$estimate.taxrate2}%)</span></td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 12px;">{$estimate.tax2}</span></td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 14px; font-weight: bold;">{$lang.total}</span></td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 14px; font-weight: bold;">{$estimate.total}</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n{if $estimate.notes!=''''}\r\n<table style="margin-top: 50px; width: 100%;" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td style="width: 100%;" align="left" valign="middle"><span style="font-size: 11px;" lang="">{$estimate.notes}</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n{/if}\r\n<table style="margin-top: 50px; width: 100%;" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td style="border-top: 1px solid #F0F0F0; padding-top: 10px; width: 100%;" align="center">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>', '015fee79efd5c71bccdd403649591410', '2013-05-21 00:00:00'),
(102, 102, 'Default', '<style type="text/css"><!--\r\n    body {\r\n        font-family: Arial;\r\n    }\r\n--></style>\r\n<div id="invoice-table" style="padding: 40px; font-family: Arial;">\r\n<table style="width: 100%;" border="0" cellspacing="0">\r\n<tbody>\r\n<tr id="invoice-header">\r\n<td style="padding-left: 10px;" colspan="2" align="left" valign="middle" width="66%"><span style="font-size: 18px; font-weight: bold; color: #484740;">{$companylogo}</span> <span style="font-size: 18px; font-weight: bold; color: #a4a4a4;">{$invoice.number}</span></td>\r\n<td align="right" valign="middle">\r\n<table border="0" cellspacing="0" cellpadding="2">\r\n<tbody>\r\n<tr>\r\n<td align="right"><span style="font-size: 12px; font-weight: bold;">{$lang.creditnote}</span></td>\r\n<td align="left"><span style="font-size: 12px;">{$invoice.id}</span></td>\r\n</tr>\r\n<tr>\r\n<td align="right"><span style="font-size: 12px; font-weight: bold;">{$lang.creditnote_date}</span></td>\r\n<td align="left"><span style="font-size: 12px;">{$invoice.date}</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr id="invoice-details">\r\n<td style="padding-top: 40px;" valign="top" width="33%"><span style="font-size: 12px; font-weight: bold;">{$lang.invoice_to}</span><br /> <span style="font-size: 11px;">{$client.companyname}<br /> {$client.firstname} {$client.lastname}<br /> {$client.address1} <br /> {$client.address2}<br /> {$client.city}, {$client.state}{$client.postcode}<br /> {$client.country} </span></td>\r\n<td style="padding-top: 40px;" valign="top" width="33%"><span style="font-size: 12px; font-weight: bold;">{$lang.invoice_from}</span><br /> <span style="font-size: 11px;">HostBill Demo</span></td>\r\n<td style="padding-top: 40px;" align="left" valign="top" width="33%">\r\n<table border="0" cellspacing="0" cellpadding="2">\r\n<tbody>\r\n<tr>\r\n<td align="right"><span style="font-size: 12px; font-weight: bold;">{$lang.balance}:</span></td>\r\n<td align="left"><span style="font-size: 12px; font-weight: bold;">{$transbalance}</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<!--{if $invoice.related_invoice_number}--><span style="font-size: 11px; font-weight: bold;">{$lang.related_invoice} {$invoice.related_invoice_number} {$lang.from} {$invoice.related_invoice_date}</span><!--{/if}-->\r\n<table class="invoice-table" style="margin-top: 50px; width: 100%;" border="0" cellspacing="0" cellpadding="6">\r\n<tbody>\r\n<tr>\r\n<td align="left" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.invoice_desc}</span></td>\r\n<td style="width: 7%;" align="center" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.invoice_tax}</span></td>\r\n<td style="width: 15%;" align="right" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.unitcost}</span></td>\r\n<td style="width: 7%;" align="center" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.qty}</span></td>\r\n<td style="width: 15%;" align="right" valign="middle" bgcolor="#f0f0f0"><span style="font-size: 11px; font-weight: bold;">{$lang.price}</span></td>\r\n</tr>\r\n<tr>\r\n<td style="border-bottom: 1px solid #F0F0F0;" valign="middle"><span style="font-size: 11px;">{$item.description}</span></td>\r\n<td style="border-bottom: 1px solid #F0F0F0;" align="center" valign="middle"><span style="font-size: 11px;">{$item.taxed}</span></td>\r\n<td style="border-bottom: 1px solid #F0F0F0;" align="right" valign="middle"><span style="font-size: 11px;">{$item.amount}</span></td>\r\n<td style="border-bottom: 1px solid #F0F0F0;" align="center" valign="middle"><span style="font-size: 11px;">{$item.qty}</span></td>\r\n<td style="border-bottom: 1px solid #F0F0F0;" align="right" valign="middle"><span style="font-size: 11px;">{$item.linetotal}</span></td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 12px; font-weight: bold;">{$lang.subtotal}</span></td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 12px;">{$invoice.subtotal}</span></td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 12px; font-weight: bold;">{$lang.tax} ({$invoice.taxrate}%)</span></td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 12px;">{$invoice.tax}</span></td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 12px; font-weight: bold;">{$lang.tax} ({$invoice.taxrate2}%)</span></td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 12px;">{$invoice.tax2}</span></td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 14px; font-weight: bold;">{$lang.total}</span></td>\r\n<td colspan="2" align="right" valign="middle"><span style="font-size: 14px; font-weight: bold;">{$invoice.total}</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table style="margin-top: 50px; width: 100%;" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td style="width: 100%;" align="left" valign="middle"><span style="font-size: 11px;"><em>{$invoice.notes}</em></span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table style="margin-top: 50px; width: 100%;" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td style="border-top: 1px solid #F0F0F0; padding-top: 10px; width: 100%;" align="center"><span style="font-size: 11px; color: #a4a4a4;">Invoice footer text</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>', '93fc76301bc84500e071b1b69a73f098', '2013-10-17 10:25:44');
##########
CREATE TABLE `hb_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `target` enum('admin','user','invoice','estimate','creditnote') NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `KEY` (`parent_id`),
  KEY `KEY2` (`name`),
  KEY `KEY3` (`target`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_templates` (`id`, `parent_id`, `name`, `target`, `created`, `updated`) VALUES
(1, 0, 'Default', 'invoice', '2011-12-06 00:00:00', '2011-12-06 00:00:00'),
(100, 0, 'EU Invoicing', 'invoice', '2013-05-16 03:30:01', '2013-05-16 03:30:01'),
(101, 0, 'Default', 'estimate', '2013-05-21 00:00:00', '2013-05-21 00:00:00'),
(102, 0, 'Default', 'creditnote', '2013-10-17 10:25:44', '2013-10-17 10:25:44');
##########
CREATE TABLE `hb_ticket_billing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ticket_billing_items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `rate_id` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `admin_id` int(10) NOT NULL,
  `admin` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rate_id` (`rate_id`),
  KEY `admin_id` (`admin_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ticket_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `email` varchar(128) NOT NULL,
  `senderemail` varchar(128) NOT NULL,
  `assigned_admins` text NOT NULL,
  `sort` int(10) NOT NULL DEFAULT '0',
  `method` enum('POP','PIPE') NOT NULL DEFAULT 'PIPE',
  `host` varchar(128) NOT NULL,
  `port` int(4) NOT NULL DEFAULT '110',
  `login` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `sendmethod` tinyint(1) NOT NULL DEFAULT '1',
  `smtphost` varchar(128) NOT NULL,
  `smtpport` int(11) NOT NULL,
  `smtplogin` varchar(128) NOT NULL,
  `smtpemail` varchar(128) NOT NULL,
  `smtppassword` varchar(128) NOT NULL,
  `options` int(3) unsigned NOT NULL DEFAULT '13',
  `autoclose` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_level_zero` int(10) NOT NULL DEFAULT '0',
  `sla_level_one` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_level_two` int(10) unsigned NOT NULL DEFAULT '0',
  `macro_sla0_id` int(10) NOT NULL DEFAULT '0',
  `macro_sla1_id` int(10) unsigned NOT NULL DEFAULT '0',
  `macro_sla2_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email` (`email`(64)),
  KEY `admins` (`assigned_admins`(30)),
  KEY `method` (`method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ticket_departments_mail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` enum('POP','PIPE') NOT NULL,
  `host` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `port` int(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ticket_departments_staff` (
  `dept_id` int(10) NOT NULL,
  `staff_id` int(10) NOT NULL,
  `options` int(10) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`dept_id`,`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ticket_filter` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` enum('pre','post') NOT NULL,
  `final` int(10) NOT NULL,
  `join_type` enum('all','any') NOT NULL,
  `macro_id` int(10) NOT NULL DEFAULT '0',
  `sort_order` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `macro_id` (`macro_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_ticket_filter` (`id`, `name`, `type`, `final`, `join_type`, `macro_id`, `sort_order`) VALUES
(1, 'Example', 'pre', 1, 'any', 0, 0),
(2, 'Old filters', 'pre', 1, 'any', 0, 0);
##########
CREATE TABLE `hb_ticket_filter_items` (
  `id` int(10) NOT NULL,
  `filter_id` int(10) NOT NULL,
  `field` varchar(50) NOT NULL,
  `type` enum('contains','match','regexp') NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_ticket_filter_items` (`id`, `filter_id`, `field`, `type`, `content`) VALUES
(1, 1, 'subject', 'contains', '***SPAM'),
(2, 1, 'body', 'regexp', '/eval\\s*\\(\\s*base64_decode/i');
##########
CREATE TABLE `hb_ticket_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `replier_id` int(11) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `email` text NOT NULL,
  `date` datetime NOT NULL,
  `lastedit` datetime NOT NULL,
  `editby` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `status` enum('Sent','Draft','Scheduled') NOT NULL DEFAULT 'Sent',
  `type` enum('Client','Admin','Email','Unregistered') DEFAULT 'Client',
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `rep_type` (`replier_id`,`type`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ticket_replies_rating` (
  `reply_id` int(10) NOT NULL,
  `rating` int(10) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ticket_status` (
  `status` varchar(31) NOT NULL,
  `options` int(3) NOT NULL DEFAULT '0',
  `color` varchar(7) NOT NULL DEFAULT '000000',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`status`),
  KEY `options` (`options`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_ticket_status` (`status`, `options`, `color`, `sort_order`) VALUES
('Answered', 3, '000000', 2),
('Client-Reply', 1, '000000', 4),
('Closed', 1, '000000', 1),
('In-Progress', 1, '000000', 3),
('Open', 1, '000000', 0),
('Scheduled', 4, '000000', 0),
('Sent-Out', 4, '000000', 0);
##########
CREATE TABLE `hb_ticket_subscriptions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) NOT NULL,
  `ticket_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id_ticket_id` (`admin_id`,`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ticket_views` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `owner` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `options` int(11) unsigned NOT NULL DEFAULT '0',
  `columns` int(11) unsigned NOT NULL DEFAULT '31',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ticket_views_columns` (
  `id` int(10) NOT NULL,
  `view_id` int(10) NOT NULL,
  `column` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`view_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ticket_views_filters` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `view_id` int(10) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastreply` datetime NOT NULL,
  `lastupdate` datetime NOT NULL,
  `lastedit` datetime NOT NULL,
  `editby` varchar(50) NOT NULL,
  `ticket_number` int(6) NOT NULL DEFAULT '0',
  `acc_hash` varchar(6) NOT NULL DEFAULT '0',
  `dept_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `email` text NOT NULL,
  `cc` text,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `status` varchar(31) NOT NULL DEFAULT 'Open',
  `priority` enum('0','1','2') NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL,
  `tags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `admin_read` tinyint(1) NOT NULL DEFAULT '0',
  `client_read` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('Client','Admin','Email','Unregistered') DEFAULT 'Client',
  `senderip` varchar(16) NOT NULL,
  `escalated` tinyint(1) NOT NULL,
  `start_date` datetime NOT NULL,
  `resolve_date` datetime NOT NULL,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `metadata` text,
  PRIMARY KEY (`id`),
  KEY `ticket_number` (`ticket_number`,`acc_hash`),
  KEY `client_id` (`client_id`),
  KEY `date` (`date`),
  KEY `admins` (`admin_read`),
  KEY `dept_id` (`dept_id`),
  KEY `status` (`status`(3)),
  KEY `lastreply` (`lastreply`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_tickets_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `rel_id` int(11) NOT NULL DEFAULT '0',
  `filename` text NOT NULL,
  `type` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `rel_id` (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_tickets_bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('Email','Subject','Content') NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_tickets_bans` (`id`, `type`, `text`) VALUES
(1, 'Subject', 'eval(base64_decode');
##########
CREATE TABLE `hb_tickets_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `to` text NOT NULL,
  `from` text NOT NULL,
  `subject` text NOT NULL,
  `headers` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `rel` enum('ticket','reply') DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_tickets_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_tickets_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `date` datetime NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_tickets_predefinied` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `reply` text NOT NULL,
  `usability` int(11) DEFAULT '0',
  `note` tinyint(4) DEFAULT NULL,
  `priority` tinyint(4) DEFAULT NULL,
  `status` varchar(31) DEFAULT NULL,
  `owner` int(10) DEFAULT NULL,
  `tags` text,
  `share` int(11) DEFAULT NULL,
  `notify` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_tickets_predefinied_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_cat` int(11) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_tickets_predefinied_my` (
  `admin_id` int(11) NOT NULL,
  `reply_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`,`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_tickets_tags` (
  `tag_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`,`ticket_id`),
  KEY `tag_id` (`tag_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ticketshare_agreements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) NOT NULL,
  `access_key` varchar(40) NOT NULL,
  `name` varchar(128) NOT NULL,
  `tag` varchar(128) NOT NULL,
  `sharing_url` text NOT NULL,
  `status` enum('pending','accepted','declined','inactive') NOT NULL,
  `deactivated_by` enum('sender','receiver') DEFAULT NULL,
  `created_by` enum('sender','receiver') NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ticketshare_attachments` (
  `attach_id` int(10) NOT NULL,
  `uuid` varchar(40) NOT NULL,
  `local` tinyint(4) NOT NULL,
  PRIMARY KEY (`attach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ticketshare_comments` (
  `uuid` varchar(40) NOT NULL,
  `target` enum('reply','note','ticket') NOT NULL,
  `target_id` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `target_taget_id` (`target`,`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_ticketshare_tickets` (
  `uuid` varchar(40) NOT NULL DEFAULT '',
  `type` enum('master','slave') NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `agreement_id` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `ticket_id` (`ticket_id`),
  KEY `agreement_id` (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `description` text NOT NULL,
  `in` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `out` decimal(10,2) NOT NULL DEFAULT '0.00',
  `trans_id` varchar(32) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `rate` decimal(15,10) NOT NULL DEFAULT '1.0000000000',
  `refund_of` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `trans_id` (`trans_id`),
  KEY `currency_id` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_upgrades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_type` enum('Hosting','Domain') NOT NULL DEFAULT 'Hosting',
  `account_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `status` enum('Pending','Upgraded') NOT NULL DEFAULT 'Pending',
  `total` decimal(10,2) NOT NULL,
  `new_value` decimal(10,2) NOT NULL,
  `new_billing` enum('Free','One Time','Monthly','Quarterly','Semi-Annually','Annually','Biennially','Triennially','Daily','Weekly','Hourly') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_type` (`rel_type`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_vps_details` (
  `account_id` int(11) NOT NULL,
  `veid` varchar(64) NOT NULL,
  `type` enum('Xen','Xen HVM','OpenVZ','KVM','Virtuozzo','Other') NOT NULL,
  `ip` varchar(40) NOT NULL,
  `additional_ip` text NOT NULL,
  `guaranteed_ram` int(3) NOT NULL,
  `burstable_ram` int(3) NOT NULL,
  `disk_usage` int(11) NOT NULL,
  `disk_limit` int(11) NOT NULL,
  `bw_usage` int(11) NOT NULL,
  `bw_limit` int(11) NOT NULL,
  `os` text NOT NULL,
  `node` varchar(32) NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_type` enum('Product','Category') NOT NULL DEFAULT 'Product',
  `target_id` int(11) NOT NULL DEFAULT '0',
  `widget_id` int(11) NOT NULL,
  `override_defaults` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `config` text NOT NULL,
  `group` varchar(32) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widget_id` (`widget_id`),
  KEY `tar` (`target_type`,`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE `hb_widgets_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `widget` varchar(32) NOT NULL,
  `name` text NOT NULL,
  `location` text NOT NULL,
  `ptype` int(11) NOT NULL,
  `config` text NOT NULL,
  `options` int(11) NOT NULL DEFAULT '1',
  `group` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `widget` (`widget`),
  KEY `ptype` (`ptype`),
  KEY `options` (`options`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
##########
INSERT INTO `hb_widgets_config` (`id`, `widget`, `name`, `location`, `ptype`, `config`, `options`, `group`) VALUES
(1, 'resetpass', 'Reset Password', 'includes/types/widgets/resetpass/', 0, 'a:2:{s:8:"smallimg";s:42:"includes/types/widgets/resetpass/small.png";s:6:"bigimg";s:40:"includes/types/widgets/resetpass/big.png";}', 1, 'sidemenu'),
(2, 'logindetails', 'Login Details', 'includes/types/widgets/logindetails/', 0, 'a:2:{s:8:"smallimg";s:45:"includes/types/widgets/logindetails/small.png";s:6:"bigimg";s:43:"includes/types/widgets/logindetails/big.png";}', 1, 'sidemenu'),
(3, 'diskbandusage', 'Disk & Bandwidth Usage', 'includes/types/widgets/diskbandusage/', 0, 'a:2:{s:8:"smallimg";s:46:"includes/types/widgets/diskbandusage/small.png";s:6:"bigimg";s:44:"includes/types/widgets/diskbandusage/big.png";}', 1, 'sidemenu'),
(4, 'accesscpanel', 'Access Control Panel', 'includes/types/widgets/accesscpanel/', 0, 'a:2:{s:8:"smallimg";s:45:"includes/types/widgets/accesscpanel/small.png";s:6:"bigimg";s:43:"includes/types/widgets/accesscpanel/big.png";}', 1, 'sidemenu'),
(5, 'accesswebmail', 'Access WebMail', 'includes/types/widgets/accesswebmail/', 0, 'a:2:{s:8:"smallimg";s:46:"includes/types/widgets/accesswebmail/small.png";s:6:"bigimg";s:44:"includes/types/widgets/accesswebmail/big.png";}', 1, 'sidemenu'),
(6, 'contactinfo', 'Contacts Information', 'includes/types/domains/widgets/contactinfo/', 9, 'a:2:{s:8:"smallimg";s:52:"includes/types/domains/widgets/contactinfo/small.png";s:6:"bigimg";s:50:"includes/types/domains/widgets/contactinfo/big.png";}', 1, 'sidemenu'),
(7, 'dnsmanagement_widget', 'DNS Management', 'includes/types/domains/widgets/dnsmanagement_widget/', 9, 'a:2:{s:8:"smallimg";s:61:"includes/types/domains/widgets/dnsmanagement_widget/small.png";s:6:"bigimg";s:59:"includes/types/domains/widgets/dnsmanagement_widget/big.png";}', 1, 'sidemenu'),
(8, 'domainforwarding', 'Domain Forwarding', 'includes/types/domains/widgets/domainforwarding/', 9, 'a:2:{s:8:"smallimg";s:57:"includes/types/domains/widgets/domainforwarding/small.png";s:6:"bigimg";s:55:"includes/types/domains/widgets/domainforwarding/big.png";}', 1, 'sidemenu'),
(9, 'emailforwarding', 'Email Forwarding', 'includes/types/domains/widgets/emailforwarding/', 9, 'a:2:{s:8:"smallimg";s:56:"includes/types/domains/widgets/emailforwarding/small.png";s:6:"bigimg";s:54:"includes/types/domains/widgets/emailforwarding/big.png";}', 1, 'sidemenu'),
(10, 'eppcode', 'Auth Info / EPP Key', 'includes/types/domains/widgets/eppcode/', 9, 'a:2:{s:8:"smallimg";s:48:"includes/types/domains/widgets/eppcode/small.png";s:6:"bigimg";s:46:"includes/types/domains/widgets/eppcode/big.png";}', 1, 'sidemenu'),
(11, 'registernameservers', 'Register Nameservers', 'includes/types/domains/widgets/registernameservers/', 9, 'a:2:{s:8:"smallimg";s:60:"includes/types/domains/widgets/registernameservers/small.png";s:6:"bigimg";s:58:"includes/types/domains/widgets/registernameservers/big.png";}', 1, 'sidemenu'),
(12, 'autorenew', 'Auto-Renewal Options', 'includes/types/domains/widgets/autorenew/', 9, 'a:2:{s:8:"smallimg";s:50:"includes/types/domains/widgets/autorenew/small.png";s:6:"bigimg";s:48:"includes/types/domains/widgets/autorenew/big.png";}', 1, 'sidemenu'),
(13, 'reglock', 'Domain Lock Settings', 'includes/types/domains/widgets/reglock/', 9, 'a:2:{s:8:"smallimg";s:48:"includes/types/domains/widgets/reglock/small.png";s:6:"bigimg";s:46:"includes/types/domains/widgets/reglock/big.png";}', 1, 'sidemenu'),
(14, 'nameservers', 'Manage Nameservers', 'includes/types/domains/widgets/nameservers/', 9, 'a:2:{s:8:"smallimg";s:52:"includes/types/domains/widgets/nameservers/small.png";s:6:"bigimg";s:50:"includes/types/domains/widgets/nameservers/big.png";}', 1, 'sidemenu'),
(15, 'idprotection', 'Manage Privacy', 'includes/types/domains/widgets/idprotection/', 9, 'a:2:{s:8:"smallimg";s:53:"includes/types/domains/widgets/idprotection/small.png";s:6:"bigimg";s:51:"includes/types/domains/widgets/idprotection/big.png";}', 1, 'sidemenu');

