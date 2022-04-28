-- Mysql Backup of appagic
-- Date 2022-04-21T19:40:31+02:00
-- Backup by 
/*!40101 SET NAMES utf8mb4 */;
DROP TABLE IF EXISTS `bstmpl_contact_page_controller`;
CREATE TABLE `bstmpl_contact_page_controller` ( 
	`id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `bstmpl_default_page_controller`;
CREATE TABLE `bstmpl_default_page_controller` ( 
	`id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `bstmpl_start_page_controller`;
CREATE TABLE `bstmpl_start_page_controller` ( 
	`id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_accordion`;
CREATE TABLE `ci_accordion` ( 
	`id` INT NOT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_accordion_content_items`;
CREATE TABLE `ci_accordion_content_items` ( 
	`ci_accordion_id` INT NOT NULL, 
	`content_item_id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_anchor`;
CREATE TABLE `ci_anchor` ( 
	`id` INT NOT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL, 
	`path_part` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_article`;
CREATE TABLE `ci_article` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`title` VARCHAR(128) NULL DEFAULT NULL, 
	`description_html` MEDIUMTEXT NULL DEFAULT NULL, 
	`file_image` VARCHAR(255) NOT NULL, 
	`page_id` INT NULL DEFAULT NULL, 
	`link` VARCHAR(255) NULL DEFAULT NULL, 
	`pic_pos` VARCHAR(255) NOT NULL DEFAULT 'left', 
	`open_lytebox` TINYINT NULL DEFAULT NULL, 
	`show_link` TINYINT NULL DEFAULT NULL, 
	`theme_color` VARCHAR(255) NULL DEFAULT NULL, 
	`ci_type` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_attachment`;
CREATE TABLE `ci_attachment` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`name` VARCHAR(255) NULL DEFAULT NULL, 
	`description` VARCHAR(255) NULL DEFAULT NULL, 
	`file` VARCHAR(255) NOT NULL
) ;
DROP TABLE IF EXISTS `ci_box`;
CREATE TABLE `ci_box` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`title` VARCHAR(255) NULL DEFAULT NULL, 
	`description` TEXT NULL DEFAULT NULL, 
	`color` VARCHAR(255) NULL DEFAULT NULL, 
	`ci_boxes_id` INT NULL DEFAULT NULL, 
	`anchor_page_link_id` INT NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_boxes`;
CREATE TABLE `ci_boxes` ( 
	`id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_cke`;
CREATE TABLE `ci_cke` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`content_html` MEDIUMTEXT NOT NULL, 
	`cke_type` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_cta`;
CREATE TABLE `ci_cta` ( 
	`id` INT NOT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL, 
	`text` VARCHAR(255) NULL DEFAULT NULL, 
	`phone` VARCHAR(255) NULL DEFAULT NULL, 
	`email` VARCHAR(255) NULL DEFAULT NULL, 
	`link_id` INT NULL DEFAULT NULL, 
	`color` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_cta_box`;
CREATE TABLE `ci_cta_box` ( 
	`id` INT NOT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL, 
	`description_html` TEXT NULL DEFAULT NULL, 
	`page_link_id` INT NULL DEFAULT NULL, 
	`link_label` VARCHAR(255) NULL DEFAULT NULL, 
	`file_image` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_hero`;
CREATE TABLE `ci_hero` ( 
	`id` INT NOT NULL, 
	`intro` TEXT NULL DEFAULT NULL, 
	`page_link_id` INT NULL DEFAULT NULL, 
	`youtube_id` VARCHAR(255) NULL DEFAULT NULL, 
	`caption_youtube` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_hero_image`;
CREATE TABLE `ci_hero_image` ( 
	`id` INT NOT NULL, 
	`image_file` VARCHAR(255) NULL DEFAULT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL, 
	`link_id` INT NULL DEFAULT NULL, 
	`intro` TEXT NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_hero_links`;
CREATE TABLE `ci_hero_links` ( 
	`id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_hero_links_icons`;
CREATE TABLE `ci_hero_links_icons` ( 
	`ci_hero_links_id` INT NOT NULL, 
	`icon_id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_html_snippet`;
CREATE TABLE `ci_html_snippet` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`html` MEDIUMTEXT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_icon`;
CREATE TABLE `ci_icon` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`title` VARCHAR(255) NULL DEFAULT NULL, 
	`file_icon` VARCHAR(255) NULL DEFAULT NULL, 
	`anchor_page_link_id` INT NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_icons`;
CREATE TABLE `ci_icons` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`color` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_icons_icons`;
CREATE TABLE `ci_icons_icons` ( 
	`ci_icons_id` INT NOT NULL, 
	`icon_id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_image`;
CREATE TABLE `ci_image` ( 
	`id` INT NOT NULL, 
	`caption` VARCHAR(255) NULL DEFAULT NULL, 
	`expl_page_link_id` INT NULL DEFAULT NULL, 
	`file_image` VARCHAR(255) NULL DEFAULT NULL, 
	`alt_tag` VARCHAR(255) NULL DEFAULT NULL, 
	`format` VARCHAR(255) NULL DEFAULT NULL, 
	`alignment` VARCHAR(255) NULL DEFAULT NULL, 
	`open_lytebox` VARCHAR(255) NULL DEFAULT NULL, 
	`nested_ci_type` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_link`;
CREATE TABLE `ci_link` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`anchor_page_link_id` INT NULL DEFAULT NULL, 
	`ci_links_id` INT NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_links`;
CREATE TABLE `ci_links` ( 
	`id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_nested_content_item`;
CREATE TABLE `ci_nested_content_item` ( 
	`id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_pricing`;
CREATE TABLE `ci_pricing` ( 
	`id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_reference`;
CREATE TABLE `ci_reference` ( 
	`id` INT NOT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL, 
	`file_image` VARCHAR(255) NULL DEFAULT NULL, 
	`subtitle` VARCHAR(255) NULL DEFAULT NULL, 
	`subline` TEXT NULL DEFAULT NULL, 
	`testimonial_author` VARCHAR(255) NULL DEFAULT NULL, 
	`testimonial_text` TEXT NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_references`;
CREATE TABLE `ci_references` ( 
	`id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_references_list`;
CREATE TABLE `ci_references_list` ( 
	`id` INT NOT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `ci_three_columns`;
CREATE TABLE `ci_three_columns` ( 
	`id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_three_columns_content_items`;
CREATE TABLE `ci_three_columns_content_items` ( 
	`ci_three_columns_id` INT NOT NULL, 
	`content_item_id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_two_columns`;
CREATE TABLE `ci_two_columns` ( 
	`id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_two_columns_content_items`;
CREATE TABLE `ci_two_columns_content_items` ( 
	`ci_two_columns_id` INT NOT NULL, 
	`content_item_id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `ci_youtube`;
CREATE TABLE `ci_youtube` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`youtube_id` VARCHAR(32) NOT NULL, 
	`nested_ci_type` VARCHAR(50) NULL DEFAULT NULL, 
	`show_subtitles` TINYINT NOT NULL DEFAULT 0
) ;
DROP TABLE IF EXISTS `dbtext_group`;
CREATE TABLE `dbtext_group` ( 
	`label` VARCHAR(255) NULL DEFAULT NULL, 
	`namespace` VARCHAR(255) NOT NULL
) ;
DROP TABLE IF EXISTS `dbtext_text`;
CREATE TABLE `dbtext_text` ( 
	`group_namespace` VARCHAR(255) NULL DEFAULT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`key` VARCHAR(255) NOT NULL, 
	`placeholders` VARCHAR(1000) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `dbtext_text_t`;
CREATE TABLE `dbtext_text_t` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`n2n_locale` VARCHAR(50) NULL DEFAULT NULL, 
	`str` VARCHAR(8191) NULL DEFAULT NULL, 
	`text_id` INT NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` ( 
	`external_url` VARCHAR(255) NULL DEFAULT NULL, 
	`hook_key` VARCHAR(255) NULL DEFAULT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`in_navigation` TINYINT NOT NULL DEFAULT 1, 
	`in_path` TINYINT NOT NULL DEFAULT 1, 
	`indexable` TINYINT NOT NULL DEFAULT 1, 
	`internal_page_id` INT NULL DEFAULT NULL, 
	`last_mod` DATETIME NULL DEFAULT NULL, 
	`last_mod_by` INT NULL DEFAULT NULL, 
	`lft` INT NOT NULL, 
	`nav_target_new_window` TINYINT NOT NULL DEFAULT 0, 
	`online` TINYINT NOT NULL DEFAULT 1, 
	`page_content_id` INT NULL DEFAULT NULL, 
	`rgt` INT NOT NULL, 
	`subsystem_name` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `page_content`;
CREATE TABLE `page_content` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`page_controller_id` INT NOT NULL, 
	`page_id` INT NULL DEFAULT NULL, 
	`ssl` TINYINT NOT NULL, 
	`subsystem_name` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `page_content_t`;
CREATE TABLE `page_content_t` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`n2n_locale` VARCHAR(5) NOT NULL, 
	`page_content_id` INT NOT NULL, 
	`se_description` VARCHAR(500) NULL DEFAULT NULL, 
	`se_keywords` VARCHAR(255) NULL DEFAULT NULL, 
	`se_title` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `page_controller`;
CREATE TABLE `page_controller` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`method_name` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `page_controller_t`;
CREATE TABLE `page_controller_t` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`n2n_locale` VARCHAR(16) NOT NULL, 
	`page_controller_id` VARCHAR(128) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `page_controller_t_content_items`;
CREATE TABLE `page_controller_t_content_items` ( 
	`content_item_id` INT NOT NULL, 
	`page_controller_t_id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `page_link`;
CREATE TABLE `page_link` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`label` VARCHAR(255) NULL DEFAULT NULL, 
	`linked_page_id` INT NULL DEFAULT NULL, 
	`type` VARCHAR(255) NULL DEFAULT NULL, 
	`url` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `page_t`;
CREATE TABLE `page_t` ( 
	`active` TINYINT NOT NULL DEFAULT 1, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`n2n_locale` VARCHAR(12) NULL DEFAULT NULL, 
	`name` VARCHAR(255) NULL DEFAULT NULL, 
	`page_id` INT NULL DEFAULT NULL, 
	`path_part` VARCHAR(255) NULL DEFAULT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `pgc_access_token`;
CREATE TABLE `pgc_access_token` ( 
	`auth_code` VARCHAR(255) NOT NULL, 
	`auth_user_pgc_id` INT NULL DEFAULT NULL, 
	`expires` DATETIME NULL DEFAULT NULL, 
	`id` VARCHAR(255) NOT NULL
) ;
DROP TABLE IF EXISTS `pgc_auth_code`;
CREATE TABLE `pgc_auth_code` ( 
	`auth_user_pgc_id` INT NOT NULL, 
	`code` VARCHAR(255) NOT NULL, 
	`expires` DATETIME NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `pgc_auth_user`;
CREATE TABLE `pgc_auth_user` ( 
	`email` VARCHAR(255) NULL DEFAULT NULL, 
	`firstname` VARCHAR(255) NULL DEFAULT NULL, 
	`lastname` VARCHAR(255) NULL DEFAULT NULL, 
	`mail_confirmation_token` VARCHAR(255) NULL DEFAULT NULL, 
	`password_hash` VARCHAR(255) NULL DEFAULT NULL, 
	`password_reset_token` VARCHAR(255) NULL DEFAULT NULL, 
	`password_reset_token_created` DATETIME NULL DEFAULT NULL, 
	`pgc_id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`phone` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `pgc_refresh_token`;
CREATE TABLE `pgc_refresh_token` ( 
	`access_token_id` VARCHAR(255) NULL DEFAULT NULL, 
	`id` VARCHAR(255) NOT NULL, 
	`user_id` INT NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_account`;
CREATE TABLE `pgc_sub_account` ( 
	`auth_user_pgc_id` INT NULL DEFAULT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT
) ;
DROP TABLE IF EXISTS `pgc_sub_country`;
CREATE TABLE `pgc_sub_country` ( 
	`code` VARCHAR(255) NOT NULL, 
	`sub_currency_code` VARCHAR(255) NOT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_country_t`;
CREATE TABLE `pgc_sub_country_t` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`n2n_locale` VARCHAR(12) NULL DEFAULT NULL, 
	`name` VARCHAR(255) NULL DEFAULT NULL, 
	`sub_country_code` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_credit_coupon`;
CREATE TABLE `pgc_sub_credit_coupon` ( 
	`amount` DOUBLE NOT NULL, 
	`code` VARCHAR(255) NOT NULL, 
	`consumed` TINYINT NOT NULL, 
	`currency_code` VARCHAR(255) NOT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`redeemed_by_sub_organisation_pgc_id` INT NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_currency`;
CREATE TABLE `pgc_sub_currency` ( 
	`code` VARCHAR(255) NOT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_invoice`;
CREATE TABLE `pgc_sub_invoice` ( 
	`address_str` VARCHAR(255) NULL DEFAULT NULL, 
	`date` DATETIME NULL DEFAULT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`intro` VARCHAR(255) NULL DEFAULT NULL, 
	`open` TINYINT NULL DEFAULT NULL, 
	`paid_date` DATETIME NULL DEFAULT NULL, 
	`sub_currency_code` VARCHAR(255) NULL DEFAULT NULL, 
	`sub_transactions_id` INT NULL DEFAULT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_invoice_position`;
CREATE TABLE `pgc_sub_invoice_position` ( 
	`amount` DECIMAL(12,2) NULL DEFAULT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`sub_invoice_id` INT NULL DEFAULT NULL, 
	`text` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_organisation`;
CREATE TABLE `pgc_sub_organisation` ( 
	`address` VARCHAR(255) NULL DEFAULT NULL, 
	`admin_email` VARCHAR(255) NULL DEFAULT NULL, 
	`admin_email_changed` DATETIME NULL DEFAULT NULL, 
	`admin_email_confirmed` TINYINT NULL DEFAULT NULL, 
	`city` VARCHAR(255) NULL DEFAULT NULL, 
	`current_sub_plan_expiry` DATETIME NULL DEFAULT NULL, 
	`current_sub_plan_id` INT NULL DEFAULT NULL, 
	`current_sub_plan_invoice_id` INT NULL DEFAULT NULL, 
	`current_sub_plan_start` DATETIME NULL DEFAULT NULL, 
	`n2n_locale` VARCHAR(255) NULL DEFAULT NULL, 
	`name` VARCHAR(255) NULL DEFAULT NULL, 
	`next_sub_plan_id` INT NULL DEFAULT NULL, 
	`path_part` VARCHAR(255) NULL DEFAULT NULL, 
	`pgc_id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`redeemed_sub_coupon_credited` TINYINT NULL DEFAULT NULL, 
	`redeemed_sub_coupon_id` INT NULL DEFAULT NULL, 
	`renew_mode` VARCHAR(255) NULL DEFAULT NULL, 
	`sub_country_code` VARCHAR(255) NULL DEFAULT NULL, 
	`zip` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_organisation_current_sub_plan_transactions`;
CREATE TABLE `pgc_sub_organisation_current_sub_plan_transactions` ( 
	`sub_organisation_pgc_id` INT NOT NULL, 
	`sub_transaction_id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_organisation_sub_accounts`;
CREATE TABLE `pgc_sub_organisation_sub_accounts` ( 
	`sub_account_id` INT NOT NULL, 
	`sub_organisation_pgc_id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_organisation_sub_invoices`;
CREATE TABLE `pgc_sub_organisation_sub_invoices` ( 
	`sub_invoice_id` INT NOT NULL, 
	`sub_organisation_pgc_id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_plan`;
CREATE TABLE `pgc_sub_plan` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`pgc_plan_type` VARCHAR(255) NOT NULL, 
	`public` TINYINT NULL DEFAULT NULL, 
	`sub_platform_pgc_platform_id` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_plan_coupon`;
CREATE TABLE `pgc_sub_plan_coupon` ( 
	`code` VARCHAR(255) NULL DEFAULT NULL, 
	`consumed` TINYINT NULL DEFAULT NULL, 
	`discount_monthly_amount` DECIMAL(12,2) NULL DEFAULT NULL, 
	`discount_yearly_amount` DECIMAL(12,2) NULL DEFAULT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`multiple` TINYINT NULL DEFAULT NULL, 
	`owner_pgc_id` INT NULL DEFAULT NULL, 
	`provision_amount` DECIMAL(12,2) NULL DEFAULT NULL, 
	`sub_currency_code` VARCHAR(255) NULL DEFAULT NULL, 
	`sub_plan_id` INT NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_plan_price`;
CREATE TABLE `pgc_sub_plan_price` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`monthly_amount` DECIMAL(12,2) NULL DEFAULT NULL, 
	`sub_currency_code` VARCHAR(255) NULL DEFAULT NULL, 
	`sub_plan_id` INT NULL DEFAULT NULL, 
	`yearly_amount` DECIMAL(12,2) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_plan_t`;
CREATE TABLE `pgc_sub_plan_t` ( 
	`advantages_html` TEXT NULL DEFAULT NULL, 
	`byline` VARCHAR(255) NULL DEFAULT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`n2n_locale` VARCHAR(12) NULL DEFAULT NULL, 
	`name` VARCHAR(255) NULL DEFAULT NULL, 
	`sub_plan_id` INT NULL DEFAULT NULL, 
	`subline` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_platform`;
CREATE TABLE `pgc_sub_platform` ( 
	`order_index` INT NULL DEFAULT NULL, 
	`pgc_platform_id` VARCHAR(255) NOT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_platform_t`;
CREATE TABLE `pgc_sub_platform_t` ( 
	`description` VARCHAR(255) NULL DEFAULT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`n2n_locale` VARCHAR(12) NULL DEFAULT NULL, 
	`name` VARCHAR(255) NULL DEFAULT NULL, 
	`sub_platform_pgc_platform_id` VARCHAR(255) NULL DEFAULT NULL, 
	`info_url` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `pgc_sub_transaction`;
CREATE TABLE `pgc_sub_transaction` ( 
	`amount` DECIMAL(12,2) NULL DEFAULT NULL, 
	`currency_code` VARCHAR(255) NULL DEFAULT NULL, 
	`date` DATETIME NULL DEFAULT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`sub_invoice_id` INT NULL DEFAULT NULL, 
	`sub_organisation_pgc_id` INT NULL DEFAULT NULL, 
	`text` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`name` VARCHAR(255) NULL DEFAULT NULL, 
	`type` VARCHAR(255) NOT NULL DEFAULT 'nql', 
	`query` TEXT NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `report_enum_value`;
CREATE TABLE `report_enum_value` ( 
	`enum_query_variable_id` INT NULL DEFAULT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`key` VARCHAR(255) NULL DEFAULT NULL, 
	`label` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `report_query_variable`;
CREATE TABLE `report_query_variable` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`label` VARCHAR(255) NULL DEFAULT NULL, 
	`name` VARCHAR(255) NULL DEFAULT NULL, 
	`report_id` INT NULL DEFAULT NULL, 
	`target_entity_class` VARCHAR(255) NULL DEFAULT NULL, 
	`type` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `rocket_content_item`;
CREATE TABLE `rocket_content_item` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`order_index` INT NULL DEFAULT NULL, 
	`panel` VARCHAR(32) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `rocket_critmod_save`;
CREATE TABLE `rocket_critmod_save` ( 
	`ei_mask_id` VARCHAR(255) NULL DEFAULT NULL, 
	`ei_spec_id` VARCHAR(255) NOT NULL, 
	`filter_data_json` TEXT NOT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`name` VARCHAR(255) NOT NULL, 
	`sort_data_json` TEXT NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `rocket_custom_grant`;
CREATE TABLE `rocket_custom_grant` ( 
	`access_json` TEXT NOT NULL, 
	`custom_spec_id` VARCHAR(255) NOT NULL, 
	`full` TINYINT NOT NULL DEFAULT 1, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`rocket_user_group_id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `rocket_ei_grant`;
CREATE TABLE `rocket_ei_grant` ( 
	`ei_mask_id` VARCHAR(255) NULL DEFAULT NULL, 
	`ei_spec_id` VARCHAR(255) NOT NULL, 
	`full` TINYINT NOT NULL DEFAULT 1, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`rocket_user_group_id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `rocket_login`;
CREATE TABLE `rocket_login` ( 
	`date_time` DATETIME NOT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`ip` VARCHAR(255) NOT NULL DEFAULT '', 
	`nick` VARCHAR(255) NULL DEFAULT NULL, 
	`power` VARCHAR(255) NULL DEFAULT NULL, 
	`successfull` TINYINT NOT NULL, 
	`wrong_password` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `rocket_user`;
CREATE TABLE `rocket_user` ( 
	`email` VARCHAR(255) NULL DEFAULT NULL, 
	`firstname` VARCHAR(255) NULL DEFAULT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`lastname` VARCHAR(255) NULL DEFAULT NULL, 
	`nick` VARCHAR(255) NOT NULL, 
	`password` VARCHAR(255) NOT NULL, 
	`power` VARCHAR(255) NOT NULL DEFAULT 'none'
) ;
DROP TABLE IF EXISTS `rocket_user_access_grant`;
CREATE TABLE `rocket_user_access_grant` ( 
	`access_json` TEXT NOT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`privileges_json` TEXT NOT NULL, 
	`restricted` TINYINT NOT NULL, 
	`restriction_json` TEXT NOT NULL, 
	`script_id` VARCHAR(255) NOT NULL, 
	`user_group_id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `rocket_user_group`;
CREATE TABLE `rocket_user_group` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`name` VARCHAR(64) NOT NULL, 
	`nav_json` TEXT NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `rocket_user_privileges_grant`;
CREATE TABLE `rocket_user_privileges_grant` ( 
	`ei_command_privilege_json` TEXT NULL DEFAULT NULL, 
	`ei_field_privilege_json` TEXT NULL DEFAULT NULL, 
	`ei_grant_id` INT NOT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`restricted` TINYINT NOT NULL DEFAULT 0, 
	`restriction_group_json` TEXT NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `rocket_user_rocket_user_groups`;
CREATE TABLE `rocket_user_rocket_user_groups` ( 
	`rocket_user_group_id` INT NOT NULL, 
	`rocket_user_id` INT NOT NULL
) ;
DROP TABLE IF EXISTS `search_entry`;
CREATE TABLE `search_entry` ( 
	`description` TEXT NULL DEFAULT NULL, 
	`group_key` VARCHAR(255) NULL DEFAULT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`keywords_str` VARCHAR(255) NULL DEFAULT NULL, 
	`last_checked` DATETIME NULL DEFAULT NULL, 
	`n2n_locale` VARCHAR(12) NULL DEFAULT NULL, 
	`searchable_text` TEXT NULL DEFAULT NULL, 
	`title` VARCHAR(255) NULL DEFAULT NULL, 
	`url_str` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `search_group`;
CREATE TABLE `search_group` ( 
	`key` VARCHAR(255) NOT NULL
) ;
DROP TABLE IF EXISTS `search_group_t`;
CREATE TABLE `search_group_t` ( 
	`group_key` VARCHAR(50) NULL DEFAULT NULL, 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`label` VARCHAR(255) NULL DEFAULT NULL, 
	`n2n_locale` VARCHAR(12) NULL DEFAULT NULL, 
	`url_str` VARCHAR(255) NULL DEFAULT NULL
) ;
DROP TABLE IF EXISTS `search_stat`;
CREATE TABLE `search_stat` ( 
	`id` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`result_amount` VARCHAR(255) NULL DEFAULT NULL, 
	`search_amount` VARCHAR(255) NULL DEFAULT NULL, 
	`text` VARCHAR(255) NULL DEFAULT NULL
) ;
