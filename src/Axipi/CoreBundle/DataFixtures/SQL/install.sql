SET FOREIGN_KEY_CHECKS=0;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
CREATE TABLE IF NOT EXISTS `component` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` int(10) unsigned DEFAULT NULL,
  `parent` int(10) unsigned DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `service` varchar(255) NOT NULL,
  `template` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `is_search` tinyint(1) NOT NULL DEFAULT '0',
  `is_sitemap` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_schema` longtext,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service` (`service`),
  KEY `parent` (`parent`),
  KEY `zone_id` (`zone_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `component`
--

INSERT INTO `component` (`id`, `zone_id`, `parent`, `category`, `service`, `template`, `title`, `icon`, `is_unique`, `is_search`, `is_sitemap`, `attributes_schema`, `is_active`, `date_created`, `date_modified`) VALUES
(3, NULL, NULL, 'page', 'axipi_content_controller_page', 'AxipiContentBundle:Page:page.html.twig', 'Content / Page', 'file-text-o', 0, 1, 1, '{\r\n    "description": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextareaType",\r\n        "options": {\r\n            "required": "false",\r\n            "attr": {\r\n                "class":"wysiwyg"\r\n            }\r\n        }\r\n    },\r\n    "thumbnail": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\FileType",\r\n        "options": {\r\n            "required": "false"\r\n        }\r\n    }\r\n}', 1, '2016-05-18 17:44:09', '2016-05-23 20:17:33'),
(4, NULL, NULL, 'widget', 'axipi_content_widget_block', 'AxipiContentBundle:Widget:block.html.twig', 'Content / Block', 'file-text-o', 0, 0, 0, '{\r\n    "description": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextareaType",\r\n        "options": {\r\n            "required": "false",\r\n"attr": {"class":"wysiwyg"}\r\n        }\r\n    }\r\n}', 1, '2016-05-18 18:10:25', '2016-05-25 16:59:33'),
(5, NULL, NULL, 'page', 'axipi_gallery_controller_album', 'AxipiGalleryBundle:Page:album.html.twig', 'Gallery / Album', 'book', 0, 0, 0, '{\r\n    "description": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextareaType",\r\n        "options": {\r\n            "required": "false",\r\n            "attr": {\r\n                "class":"wysiwyg"\r\n            }\r\n        }\r\n    },\r\n    "thumbnail": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\FileType",\r\n        "options": {\r\n            "required": "false"\r\n        }\r\n    }\r\n}', 1, '2016-05-18 22:35:46', '2016-05-31 14:53:58'),
(6, NULL, 5, 'page', 'axipi_gallery_controller_media', 'AxipiGalleryBundle:Page:media.html.twig', 'Gallery / Media', 'picture-o', 0, 0, 0, '{\r\n    "image": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\FileType",\r\n        "options": {\r\n            "required": "true"\r\n        }\r\n    },\r\n    "description": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextareaType",\r\n        "options": {\r\n            "required": "false",\r\n"attr": {"class":"wysiwyg"}\r\n        }\r\n    }\r\n}\r\n', 1, '2016-05-18 22:36:09', '2016-05-20 19:00:24'),
(7, 2, NULL, 'widget', 'axipi_google_widget_analytics', 'AxipiGoogleBundle:Widget:analytics.html.twig', 'Google / Analytics', 'google', 0, 0, 0, '{\r\n    "code": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextType",\r\n        "options": {\r\n            "required": "true"\r\n        }\r\n    }\r\n}', 1, '2016-05-18 22:36:43', '2016-05-25 17:23:39'),
(8, NULL, NULL, 'widget', 'axipi_content_widget_menu', 'AxipiContentBundle:Widget:menu.html.twig', 'Content / Menu', 'bars', 0, 0, 0, '{\r\n    "display_title": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\CheckboxType",\r\n        "options": {\r\n            "required": "false"\r\n        }\r\n    },\r\n    "class": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextType",\r\n        "options": {\r\n            "required": "false"\r\n        }\r\n    }\r\n}', 1, '2016-05-18 22:37:33', '2016-05-25 16:59:08'),
(9, NULL, NULL, 'page', 'axipi_content_controller_link', NULL, 'Content / Link', 'share-square-o', 0, 0, 0, '{\r\n    "url": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextType",\r\n        "options": {\r\n            "required": "true"\r\n        }\r\n    }\r\n}', 1, '2016-05-18 22:38:59', '2016-05-23 20:17:46'),
(10, NULL, NULL, 'page', 'axipi_blog_controller_blog', 'AxipiBlogBundle:Page:blog.html.twig', 'Blog', 'pencil-square-o', 0, 0, 0, '{\r\n    "description": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextareaType",\r\n        "options": {\r\n            "required": "false",\r\n            "attr": {\r\n                "class":"wysiwyg"\r\n            }\r\n        }\r\n    },\r\n    "thumbnail": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\FileType",\r\n        "options": {\r\n            "required": "false"\r\n        }\r\n    }\r\n}', 1, '2016-05-18 22:39:45', '2016-05-26 19:53:10'),
(11, NULL, 10, 'page', 'axipi_blog_controller_category', 'AxipiBlogBundle:Page:category.html.twig', 'Blog / Category', 'pencil-square-o', 0, 0, 0, '{\r\n    "description": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextareaType",\r\n        "options": {\r\n            "required": "false",\r\n            "attr": {\r\n                "class":"wysiwyg"\r\n            }\r\n        }\r\n    },\r\n    "thumbnail": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\FileType",\r\n        "options": {\r\n            "required": "false"\r\n        }\r\n    }\r\n}', 1, '2016-05-18 22:39:51', '2016-05-26 20:11:02'),
(12, NULL, 11, 'page', 'axipi_blog_controller_post', 'AxipiBlogBundle:Page:post.html.twig', 'Blog / Post', 'pencil-square-o', 0, 0, 0, '{\r\n    "description": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextareaType",\r\n        "options": {\r\n            "required": "false",\r\n            "attr": {\r\n                "class":"wysiwyg"\r\n            }\r\n        }\r\n    },\r\n    "thumbnail": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\FileType",\r\n        "options": {\r\n            "required": "false"\r\n        }\r\n    }\r\n}', 1, '2016-05-18 22:40:24', '2016-05-26 20:11:37'),
(13, NULL, NULL, 'page', 'axipi_content_controller_home', 'AxipiContentBundle:Page:home.html.twig', 'Content / Home', 'home', 1, 0, 0, '{\r\n    "description": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextareaType",\r\n        "options": {\r\n            "required": "false",\r\n            "attr": {\r\n                "class":"wysiwyg"\r\n            }\r\n        }\r\n    },\r\n    "thumbnail": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\FileType",\r\n        "options": {\r\n            "required": "false"\r\n        }\r\n    }\r\n}', 1, '2016-05-18 22:44:46', '2016-05-25 16:57:43'),
(14, NULL, NULL, 'widget', 'axipi_google_widget_searchconsole', 'AxipiGoogleBundle:Widget:searchconsole.html.twig', 'Google / Search Console', 'google', 0, 0, 0, '{\r\n    "code": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextType",\r\n        "options": {\r\n            "required": "true"\r\n        }\r\n    }\r\n}', 1, '2016-05-20 18:42:10', '2016-05-25 17:23:41'),
(15, NULL, NULL, 'page', 'axipi_content_controller_error404', 'AxipiContentBundle:Page:error404.html.twig', 'Content / Error 404', 'times', 1, 0, 0, NULL, 1, '2016-05-20 23:16:31', '2016-05-25 16:58:51'),
(16, NULL, NULL, 'widget', 'axipi_content_widget_breadcrumbs', 'AxipiContentBundle:Widget:breadcrumbs.html.twig', 'Content / Breadcrumbs', 'road', 0, 0, 0, NULL, 1, '2016-05-20 23:52:18', '2016-05-25 16:59:43'),
(17, NULL, NULL, 'widget', 'axipi_google_widget_tagmanager', 'AxipiGoogleBundle:Widget:tagmanager.html.twig', 'Google / Tag Manager', 'google', 0, 0, 0, '{\r\n    "code": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextType",\r\n        "options": {\r\n            "required": "true"\r\n        }\r\n    }\r\n}', 1, '2016-05-21 20:27:40', '2016-05-25 17:23:44'),
(18, 4, NULL, 'widget', 'axipi_content_widget_icon', 'AxipiContentBundle:Widget:icon.html.twig', 'Content / Favicon', 'star-o', 0, 0, 0, '{\r\n    "image": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\FileType",\r\n        "options": {\r\n            "required": "true"\r\n        }\r\n    }\r\n}', 1, '2016-05-23 20:06:34', '2016-05-31 19:05:27'),
(19, 4, NULL, 'widget', 'axipi_twitter_widget_card', 'AxipiTwitterBundle:Widget:card.html.twig', 'Twitter / Card', 'twitter', 0, 0, 0, '{\r\n    "site": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextType",\r\n        "options": {\r\n            "required": "true"\r\n        }\r\n    }\r\n}', 1, '2016-05-25 17:11:49', '2016-05-25 17:26:48'),
(20, 4, NULL, 'widget', 'axipi_facebook_widget_opengraph', 'AxipiFacebookBundle:Widget:opengraph.html.twig', 'Facebook / Opengraph', 'facebook', 0, 0, 0, '{\r\n    "site": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextType",\r\n        "options": {\r\n            "required": "true"\r\n        }\r\n    }\r\n}', 1, '2016-05-25 17:13:13', '2016-05-25 17:23:30'),
(21, NULL, NULL, 'page', 'axipi_contact_controller_form', 'AxipiContactBundle:Page:form.html.twig', 'Contact / Form', 'envelope-o', 0, 0, 0, NULL, 1, '2016-05-25 17:48:30', '2016-05-25 17:48:30'),
(22, NULL, NULL, 'page', 'axipi_google_controller_map', 'AxipiGoogleBundle:Page:map.html.twig', 'Google / Map', 'map-o', 0, 0, 0, '{\r\n    "api_key": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextType",\r\n        "options": {\r\n            "required": "true"\r\n        }\r\n    },\r\n    "latitude": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextType",\r\n        "options": {\r\n            "required": "true"\r\n        }\r\n    },\r\n    "longitude": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextType",\r\n        "options": {\r\n            "required": "true"\r\n        }\r\n    },\r\n    "zoom": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextType",\r\n        "options": {\r\n            "required": "true"\r\n        }\r\n    },\r\n    "infowindow": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextareaType",\r\n        "options": {\r\n            "required": "false",\r\n"attr": {"class":"wysiwyg"}\r\n        }\r\n    }\r\n}', 1, '2016-05-25 20:19:27', '2016-05-25 20:42:42'),
(23, 5, 10, 'widget', 'axipi_blog_widget_categories', 'AxipiBlogBundle:Widget:categories.html.twig', 'Blog / Categories', 'bars', 0, 0, 0, NULL, 1, '2016-05-26 20:01:00', '2016-05-30 19:38:36'),
(24, NULL, NULL, 'page', 'axipi_sitemap_controller_xml', 'AxipiSitemapBundle:Page:xml.xml.twig', 'Sitemap / Xml', 'code', 0, 0, 0, NULL, 1, '2016-05-27 09:53:41', '2016-05-27 09:55:37'),
(25, NULL, NULL, 'page', 'axipi_content_controller_file', NULL, 'Content / File', 'download', 0, 0, 0, NULL, 1, '2016-05-29 16:47:47', '2016-05-30 10:14:23'),
(26, NULL, NULL, 'page', 'axipi_search_controller_page', 'AxipiSearchBundle:Page:page.html.twig', 'Search / Page', 'search', 0, 0, 0, '{\r\n    "all_languages": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\CheckboxType",\r\n        "options": {\r\n            "required": "false"\r\n        }\r\n    },\r\n    "description": {\r\n        "type": "Symfony\\\\Component\\\\Form\\\\Extension\\\\Core\\\\Type\\\\TextareaType",\r\n        "options": {\r\n            "required": "false",\r\n            "attr": {\r\n                "class":"wysiwyg"\r\n            }\r\n        }\r\n    }\r\n}', 1, '2016-05-29 17:30:16', '2016-05-29 17:33:57'),
(27, NULL, 26, 'widget', 'axipi_search_widget_form', 'AxipiSearchBundle:Widget:form.html.twig', 'Search / Form', 'search', 0, 0, 0, NULL, 1, '2016-05-29 17:31:10', '2016-05-29 17:31:44');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(10) unsigned NOT NULL,
  `component_id` int(10) unsigned NOT NULL,
  `zone_id` int(10) unsigned DEFAULT NULL,
  `parent` int(10) unsigned DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(30) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `slug` varchar(255) DEFAULT NULL,
  `title_seo` varchar(255) DEFAULT NULL,
  `description_seo` text,
  `title_social` varchar(255) DEFAULT NULL,
  `description_social` text,
  `attributes` longtext,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `style` text,
  `meta` text,
  `script` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_id_code` (`language_id`,`code`),
  UNIQUE KEY `language_id_slug` (`language_id`,`slug`),
  KEY `component_id` (`component_id`),
  KEY `parent` (`parent`),
  KEY `language_id` (`language_id`),
  KEY `zone_id` (`zone_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `language_id`, `component_id`, `zone_id`, `parent`, `template`, `title`, `code`, `ordering`, `slug`, `title_seo`, `description_seo`, `title_social`, `description_social`, `attributes`, `is_active`, `date_created`, `date_modified`, `style`, `meta`, `script`) VALUES
(1, 1, 3, NULL, 12, NULL, 'd', 'd', 0, 'a/b/c/d', 'title seo', 'description seo', 'title social', 'description social', '{"description":"<h1>test<\\/h1>\\r\\n<p><a href=\\"[page:12:a\\/b\\/c]\\">test<\\/a><\\/p>\\r\\n<p><img src=\\"..\\/files\\/test1\\/test2\\/1182308.jpg\\" alt=\\"\\" width=\\"849\\" height=\\"565\\" \\/><\\/p>"}', 1, '2016-05-18 18:27:14', '2016-05-30 18:30:48', NULL, NULL, NULL),
(2, 1, 15, NULL, NULL, NULL, 'Error 404', 'error404', 0, 'error404', NULL, NULL, NULL, NULL, NULL, 1, '2016-05-18 21:45:27', '2016-05-20 23:18:45', NULL, NULL, NULL),
(3, 1, 5, NULL, NULL, NULL, 'Album', 'album', 0, 'album', NULL, NULL, NULL, NULL, '{"description":null,"thumbnail":"axipi-48x48.jpg","thumbnail_mime":"image\\/jpeg","thumbnail_size":5424}', 1, '2016-05-18 20:38:09', '2016-05-31 14:54:27', NULL, NULL, NULL),
(4, 1, 9, NULL, NULL, NULL, 'Axipi', 'axipi-link', 0, 'axipi', NULL, NULL, NULL, NULL, '{"url":"http:\\/\\/axipi.com"}', 1, '2016-05-20 19:53:05', '2016-05-23 20:19:02', NULL, NULL, NULL),
(5, 1, 10, NULL, NULL, NULL, 'Blog', 'blog', 0, 'blog', NULL, NULL, NULL, NULL, '{"description":"<h1>test<\\/h1>\\r\\n<p><a href=\\"[page:1:a\\/b\\/c\\/d]\\">test<\\/a><\\/p>"}', 1, '2016-05-20 23:31:20', '2016-05-29 13:47:42', NULL, NULL, NULL),
(6, 1, 11, NULL, 5, NULL, 'Blog category', 'blog-cat', 0, 'blog/category', NULL, NULL, NULL, NULL, '{"description":"<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec vehicula porttitor arcu, a ultrices magna tincidunt eu. Maecenas vel hendrerit velit, ut auctor est. Nunc facilisis magna eu elit commodo consequat. Quisque ac felis volutpat, ultrices lectus ut, lobortis erat. Etiam bibendum a est at feugiat. Nulla id sem tristique, auctor nulla quis, consectetur eros. In dignissim gravida velit commodo lobortis. Aenean gravida tellus non ullamcorper laoreet. Donec et massa accumsan, interdum orci non, sagittis velit. Nulla et tristique nulla. Cras ut imperdiet tellus. Nulla tempus eget elit sed feugiat. Nunc turpis risus, luctus id rhoncus ut, sollicitudin eu erat. Sed eu mauris sem.<\\/p>"}', 1, '2016-05-20 23:31:54', '2016-05-27 20:22:43', NULL, NULL, NULL),
(7, 1, 12, NULL, 6, NULL, 'Blog post', 'blog-post', 0, 'blog/category/post', NULL, NULL, NULL, NULL, '{"description":"<p>Phasellus in nibh eu purus tincidunt posuere at vitae mi. Morbi ut magna et ipsum sagittis feugiat vel in diam. Suspendisse sollicitudin mauris arcu, a tincidunt felis consectetur in. Nullam vel augue enim. Maecenas non consectetur risus, id cursus massa. Vivamus sed sagittis lectus. Praesent in fringilla mi. Proin in quam mauris. Nullam accumsan leo a pulvinar mollis. Vivamus fringilla at neque quis fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras et ultrices nulla.<\\/p>"}', 1, '2016-05-20 23:32:13', '2016-05-26 20:12:27', NULL, NULL, NULL),
(9, 1, 13, NULL, NULL, NULL, 'Home', 'home', 0, NULL, NULL, NULL, NULL, NULL, '{"description":"<p>Nunc ante enim, consectetur ac elit in, maximus blandit turpis. Praesent facilisis venenatis urna, non porta felis rutrum nec. Fusce at arcu at dui <a href=\\"[page:17:map]\\">lobortis<\\/a> tristique in eu leo. Donec rhoncus pharetra lectus id accumsan. Vivamus viverra magna leo, quis hendrerit nisl feugiat eget. Duis ornare justo et mi convallis, vitae ultrices elit ornare. Mauris dignissim, nisi a pretium vehicula, leo neque accumsan sem, non faucibus purus nulla posuere leo.<\\/p>\\r\\n<p>Nunc bibendum hendrerit felis id volutpat. Praesent cursus libero eget tellus convallis, vel iaculis lacus <a href=\\"[page:5:blog]\\">commodo<\\/a>. Vestibulum turpis orci, ultrices eu felis ut, rutrum mollis odio. Maecenas eget ex et elit <a href=\\"[page:18:sitemap.xml]\\">rhoncus<\\/a> eleifend. Aliquam non felis metus. Aenean rutrum, leo eu ultricies molestie, ex felis sodales magna, sed ullamcorper felis ligula gravida quam. Proin at dui leo. Proin iaculis ornare odio non porta.<\\/p>\\r\\n<p>[widgets:footer]<\\/p>\\r\\n<p><img src=\\"..\\/files\\/test1\\/3759312.jpg\\" width=\\"850\\" height=\\"565\\" \\/><\\/p>"}', 1, '2016-05-20 23:46:13', '2016-06-01 17:23:39', NULL, NULL, NULL),
(10, 1, 3, NULL, NULL, NULL, 'a', 'a', 0, 'a', NULL, NULL, NULL, NULL, '{"description":"<p>yopla<\\/p>"}', 1, '2016-05-21 00:08:48', '2016-05-29 19:27:32', NULL, NULL, NULL),
(11, 1, 3, NULL, 10, NULL, 'b', 'b', 0, 'a/b', NULL, NULL, NULL, NULL, '{"description":"<p><strong>test<\\/strong><\\/p>\\r\\n<p><em>test<\\/em> esr<\\/p>"}', 1, '2016-05-21 00:09:01', '2016-05-21 18:50:25', NULL, NULL, NULL),
(12, 1, 3, NULL, 11, NULL, 'c', 'c', 0, 'a/b/c', NULL, NULL, NULL, NULL, '{"description":"<p>Nunc bibendum hendrerit felis id volutpat. Praesent cursus libero eget tellus convallis, vel iaculis lacus <a href=\\"[page:11:a\\/b]\\">commodo<\\/a>. Vestibulum turpis orci, ultrices eu felis ut, rutrum mollis odio. Maecenas eget ex et elit <a href=\\"[page:14:album\\/media]\\">rhoncus<\\/a> eleifend. Aliquam non felis metus. Aenean rutrum, leo eu ultricies molestie, ex felis sodales magna, sed ullamcorper felis ligula gravida quam. Proin at dui leo. Proin iaculis ornare odio non porta.<\\/p>\\r\\n<p><img style=\\"background-color: transparent;\\" src=\\"..\\/files\\/1260524.jpg\\" alt=\\"\\" width=\\"850\\" height=\\"565\\" \\/><\\/p>","test":"test"}', 1, '2016-05-21 00:09:16', '2016-05-29 14:46:42', NULL, NULL, NULL),
(13, 1, 9, NULL, NULL, NULL, 'Site perso', 'sdion.net', 0, 'sdion', NULL, NULL, NULL, NULL, '{"url":"https:\\/\\/sdion.net"}', 1, '2016-05-21 08:37:22', '2016-05-21 08:37:22', NULL, NULL, NULL),
(14, 1, 6, NULL, 3, NULL, 'Media', 'media', 0, 'album/media', NULL, NULL, NULL, NULL, '{"image":"1181907.jpg","description":null,"image_mime":"image\\/jpeg","image_size":607789}', 1, '2016-05-23 19:59:03', '2016-05-27 19:30:28', NULL, NULL, NULL),
(15, 1, 6, NULL, 50, NULL, 'Test 2', 'test2', 0, 'album/media2', NULL, NULL, NULL, NULL, '{"image":"1260521.jpg","image_mime":"image\\/jpeg","image_size":728200,"description":null}', 1, '2016-05-25 10:34:09', '2016-05-30 19:29:35', NULL, NULL, NULL),
(17, 1, 22, NULL, NULL, NULL, 'Map', 'map', 0, 'map', NULL, NULL, NULL, NULL, '{"api_key":"AIzaSyA6iB9JEQ4XiEez_dgv3hoJWlAj4DOCGWo","latitude":"48.8236679","longitude":"2.3761298","zoom":"15","infowindow":"<p><strong>test<\\/strong> test<\\/p>\\r\\n<p><strong>test<\\/strong> <a href=\\"[page:6:blog\\/category]\\">test<\\/a><\\/p>"}', 1, '2016-05-25 20:20:05', '2016-05-30 17:28:13', NULL, NULL, NULL),
(18, 1, 24, NULL, NULL, NULL, 'sitemap.xml', 'sitemap.xml', 0, 'sitemap.xml', NULL, NULL, NULL, NULL, NULL, 1, '2016-05-27 09:53:57', '2016-05-27 09:55:00', NULL, NULL, NULL),
(19, 2, 3, NULL, NULL, NULL, 'Test FR', 'test-fr', 0, 'test-fr', 'title seo', 'description seo', 'title social', 'description social', '{"description":"<p>yopla<\\/p>"}', 1, '2016-05-27 12:43:37', '2016-05-29 19:27:20', NULL, NULL, NULL),
(20, 1, 26, NULL, NULL, NULL, 'Search', 'search', 0, 'search', NULL, NULL, NULL, NULL, '{"all_languages":false,"description":"<p>test<\\/p>"}', 1, '2016-05-29 17:32:20', '2016-05-29 19:45:00', NULL, NULL, NULL),
(21, 2, 26, NULL, NULL, NULL, 'recherche', 'recherche', 0, 'recherche', NULL, NULL, NULL, NULL, '{"all_languages":false,"description":null}', 1, '2016-05-29 19:44:28', '2016-05-29 19:44:28', NULL, NULL, NULL),
(37, 1, 4, 1, NULL, NULL, 'Footer aa', 'widgetfooter', 0, NULL, NULL, NULL, NULL, NULL, '{"description":"<p><em>Morbi aliquam turpis ut dui suscipit, ut accumsan odio elementum.<\\/em><\\/p>"}', 1, '2016-05-18 21:16:37', '2016-05-30 15:24:13', NULL, NULL, NULL),
(38, 1, 8, 3, NULL, NULL, 'Menu', 'widgetmenu', 0, NULL, NULL, NULL, NULL, NULL, '{"display_title":true,"class":"aa"}', 1, '2016-05-20 18:30:12', '2016-05-21 18:53:35', NULL, NULL, NULL),
(39, 1, 14, 4, NULL, NULL, 'Search Console', 'widgetsearchconsole', 0, NULL, NULL, NULL, NULL, NULL, '{"code":"test-searchconsole"}', 1, '2016-05-20 19:28:25', '2016-05-25 18:06:08', NULL, NULL, NULL),
(40, 1, 16, 2, NULL, NULL, 'Breadcrumbs', 'widgetbreadcrumbs', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2016-05-20 20:56:07', '2016-05-21 00:03:00', NULL, NULL, NULL),
(41, 1, 18, 4, NULL, NULL, 'Fav', 'widgetfav', -10, NULL, NULL, NULL, NULL, NULL, '{"image":"axipi-16x16.jpg","image_mime":"image\\/jpeg","image_size":4186}', 1, '2016-05-23 20:08:02', '2016-05-25 19:01:35', NULL, NULL, NULL),
(42, 1, 19, 4, NULL, NULL, 'Twitter card', 'widgettwitter-card', 0, NULL, NULL, NULL, NULL, NULL, '{"site":"@axipi"}', 1, '2016-05-25 17:22:47', '2016-05-25 17:38:09', NULL, NULL, NULL),
(43, 1, 20, 4, NULL, NULL, 'fb-opengraph', 'widgetfb-opengraph', 0, NULL, NULL, NULL, NULL, NULL, '{"site":"Axipi"}', 1, '2016-05-25 17:31:38', '2016-05-25 17:38:18', NULL, NULL, NULL),
(44, 1, 4, 5, NULL, NULL, 'blog-aside', 'widgetblog-aside', 0, NULL, NULL, NULL, NULL, NULL, '{"description":"<h3>Welcome<\\/h3>\\r\\n<p>Aenean eleifend justo tellus, vitae lobortis leo accumsan at. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos.<\\/p>"}', 1, '2016-05-26 19:54:38', '2016-05-26 20:06:00', NULL, NULL, NULL),
(45, 1, 23, 5, 5, NULL, 'Categories', 'widgetblog-categories', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2016-05-26 20:01:19', '2016-05-30 19:38:54', NULL, NULL, NULL),
(46, 2, 4, 1, NULL, NULL, 'footer-fr', 'widgetfooter-fr', 0, NULL, NULL, NULL, NULL, NULL, '{"description":null}', 1, '2016-05-27 14:50:27', '2016-05-27 14:50:27', NULL, NULL, NULL),
(47, 1, 27, 3, 20, NULL, 'search', 'widgetsearch', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2016-05-29 17:33:32', '2016-05-29 17:33:32', NULL, NULL, NULL),
(48, 1, 12, NULL, 6, NULL, 'post2', 'post2', 0, 'post2', NULL, NULL, NULL, NULL, '{"description":null}', 1, '2016-05-30 18:28:51', '2016-05-30 18:28:51', NULL, NULL, NULL),
(50, 1, 5, NULL, 3, NULL, 'subalbum', 'subalbum', 0, 'album/subalbum', NULL, NULL, NULL, NULL, '{"description":null}', 1, '2016-05-30 19:29:23', '2016-05-30 19:29:23', NULL, NULL, NULL),
(51, 1, 11, NULL, 5, NULL, 'category2', 'category2', 0, 'category2', NULL, NULL, NULL, NULL, '{"description":null}', 1, '2016-05-30 19:35:07', '2016-05-30 19:35:07', NULL, NULL, NULL),
(52, 1, 11, NULL, 5, NULL, 'category3', 'category3', 0, 'category3', NULL, NULL, NULL, NULL, '{"description":null}', 1, '2016-05-31 14:56:15', '2016-05-31 14:56:15', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `code`, `title`, `is_active`, `date_created`, `date_modified`) VALUES
(1, 'en', 'English', 1, '2016-05-18 20:24:38', '2016-05-26 17:36:50'),
(2, 'fr', 'Français', 1, '2016-05-26 17:37:14', '2016-05-31 18:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `relation`
--

DROP TABLE IF EXISTS `relation`;
CREATE TABLE IF NOT EXISTS `relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` int(10) unsigned NOT NULL,
  `page_id` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `widget_id_page_id` (`widget_id`,`page_id`),
  KEY `widget_id` (`widget_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relation`
--

INSERT INTO `relation` (`id`, `widget_id`, `page_id`, `title`, `ordering`, `is_active`, `date_created`, `date_modified`) VALUES
(3, 38, 3, NULL, 0, 1, '2016-05-21 19:42:11', '2016-05-31 19:36:59'),
(4, 38, 9, NULL, -10, 1, '2016-05-21 19:42:17', '2016-05-21 19:56:25'),
(5, 3, 5, NULL, 0, 1, '2016-05-21 19:57:12', '2016-05-21 19:57:12'),
(6, 38, 1, NULL, 0, 1, '2016-05-21 19:57:19', '2016-05-21 19:57:19'),
(7, 38, 17, 'Map', 0, 1, '2016-05-25 20:20:13', '2016-05-25 20:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` char(60) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `roles` longtext,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `firstname`, `lastname`, `roles`, `is_active`, `date_created`, `date_modified`) VALUES
(1, 'example@example.com', '$2y$13$RiodLgzy6Mb8HPLzTIGpFueymV1QciZyYxXP0rgN2N11ZR9Hnqdam', 'Example', NULL, '["ROLE_USERS","ROLE_PAGES","ROLE_WIDGETS","ROLE_LANGUAGES","ROLE_COMPONENTS","ROLE_ZONES","ROLE_FILES","ROLE_SEARCH"]', 1, '2016-05-19 22:06:18', '2016-05-29 18:01:25'),
(4, 'install@axipi.com', '$2y$13$gpAnBKy7sty7yk46boLc8ei/vdedb65Yg.dMbpIoPoI64L3R78f7i', 'Install', NULL, '["ROLE_PAGES"]', 1, '2016-05-23 18:59:47', '2016-05-31 20:17:57');

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
CREATE TABLE IF NOT EXISTS `zone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`id`, `code`, `ordering`, `is_active`, `date_created`, `date_modified`) VALUES
(1, 'footer', 4, 0, '2016-05-18 21:17:11', '2016-05-21 21:47:49'),
(2, 'before_content', 3, 1, '2016-05-21 02:01:25', '2016-05-21 21:46:30'),
(3, 'header', 2, 1, '2016-05-21 02:18:34', '2016-05-26 19:41:43'),
(4, 'head', 1, 1, '2016-05-23 20:12:38', '2016-05-23 20:12:38'),
(5, 'blog_aside', 0, 1, '2016-05-26 19:54:16', '2016-05-26 19:54:16');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `component`
--
ALTER TABLE `component`
  ADD CONSTRAINT `FK_49FEA1573D8E604F` FOREIGN KEY (`parent`) REFERENCES `component` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_49FEA1579F2C3FAB` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_140AB6203D8E604F` FOREIGN KEY (`parent`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_140AB62082F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_140AB620E2ABAFFF` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251E9F2C3FAB` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `relation`
--
ALTER TABLE `relation`
  ADD CONSTRAINT `FK_62894749FBE885E2` FOREIGN KEY (`widget_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8CFDBD9FC4663E4` FOREIGN KEY (`page_id`) REFERENCES `item` (`id`) ON DELETE CASCADE;

SET FOREIGN_KEY_CHECKS=1;
