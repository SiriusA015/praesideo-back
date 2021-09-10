CREATE TABLE IF NOT EXISTS static.t_ref_industry_sector
    (
    industry_sector_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT industry_sector_pkey
    PRIMARY KEY (industry_sector_id)
    );

INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (1, 'Energy');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (2, 'Materials');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (3, 'Capital Goods');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (4, 'Commercial & Professional Services');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (5, 'Transportation');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (6, 'Automobiles and Components');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (7, 'Consumer Durables and Apparel');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (8, 'Consumer electronics');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (9, 'Consumer Services');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (10, 'Retailing');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (11, 'Food and Staples Retailing');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (12, 'Food, Beverage and Tobacco');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (13, 'Household and Personal Products');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (14, 'Health Care Equipment and Services');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (15, 'Pharmaceuticals, Biotechnology & Life Sciences');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (16, 'Banks');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (17, 'Diversified Financials');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (18, 'Insurance');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (19, 'Software and Services');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (20, 'Technology Hardware and Equipment');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (21, 'Semiconductors and Semiconductor Equipment');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (22, 'Telecommunication Services');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (23, 'Media and Equipment');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (24, 'Utilities');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (25, 'Real Estate');
INSERT INTO static.t_ref_industry_sector(industry_sector_id, name) VALUES (26, 'Government or Local Authority');

CREATE TABLE IF NOT EXISTS static.t_ref_industry_subsector
    (
    industry_subsector_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    industry_sector_id integer,
    CONSTRAINT industry_subsector_pkey PRIMARY KEY (industry_subsector_id),
    CONSTRAINT fk_t_ref_industry_sector_subsector FOREIGN KEY (industry_sector_id)
    REFERENCES static.t_ref_industry_sector (industry_sector_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    );

INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (1, 1, 'Oil & Gas Drilling');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (2, 1, 'Oil & Gas Equipment & Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (3, 1, 'Integrated Oil & Gas');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (4, 1, 'Oil & Gas Exploration & Production');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (5, 1, 'Oil & Gas Refining & Marketing');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (6, 1, 'Oil & Gas Storage & Transportation');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (7, 1, 'Coal & Consumable Fuels');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (8, 2, 'Commodity Chemicals');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (9, 2, 'Diversified Chemicals');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (10, 2, 'Fertilizers & Agricultural Chemicals');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (11, 2, 'Industrial Gases');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (12, 2, 'Specialty Chemicals');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (13, 2, 'Construction Materials');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (14, 2, 'Metal & Glass Containers');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (15, 2, 'Paper Packaging');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (16, 2, 'Aluminum');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (17, 2, 'Diversified Metals & Mining');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (18, 2, 'Copper');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (19, 2, 'Gold');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (20, 2, 'Precious Metals & Minerals');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (21, 2, 'Silver');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (22, 2, 'Steel');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (23, 2, 'Forest Products');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (24, 2, 'Paper Products');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (25, 3, 'Aerospace & Defense');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (26, 3, 'Building Products');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (27, 3, 'Construction & Engineering');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (28, 3, 'Electrical Components & Equipment');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (29, 3, 'Heavy Electrical Equipment');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (30, 3, 'Industrial Conglomerates');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (31, 3, 'Construction Machinery & Heavy Trucks');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (32, 3, 'Agricultural & Farm Machinery');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (33, 3, 'Industrial Machinery');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (34, 3, 'Trading Companies & Distributors');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (35, 4, 'Commercial Printing');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (36, 4, 'Environmental & Facilities Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (37, 4, 'Office Services & Supplies');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (38, 4, 'Diversified Support Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (39, 4, 'Security & Alarm Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (40, 4, 'Human Resource & Employment Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (41, 4, 'Research & Consulting Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (42, 5, 'Air Freight & Logistics');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (43, 5, 'Airlines');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (44, 5, 'Marine');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (45, 5, 'Railroads');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (46, 5, 'Trucking');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (47, 5, 'Airport Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (48, 5, 'Highways & Railtracks');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (49, 5, 'Marine Ports & Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (50, 6, 'Auto Parts & Equipment');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (51, 6, 'Tires & Rubber');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (52, 6, 'Automobile Manufacturers');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (53, 6, 'Motorcycle Manufacturers');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (54, 8, 'Home Furnishings');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (55, 8, 'Homebuilding');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (56, 8, 'Household Appliances');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (57, 8, 'Housewares & Specialties');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (58, 8, 'Leisure Products');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (59, 8, 'Apparel, Accessories & Luxury Goods');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (60, 8, 'Footwear');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (61, 8, 'Textiles');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (62, 9, 'Casinos & Gaming');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (63, 9, 'Hotels, Resorts & Cruise Lines');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (64, 9, 'Leisure Facilities');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (65, 9, 'Restaurants');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (66, 9, 'Education Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (67, 9, 'Specialized Consumer Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (68, 10, 'Distributors');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (69, 10, 'Internet & Direct Marketing Retail');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (70, 10, 'Department Stores');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (71, 10, 'General Merchandise Stores');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (72, 10, 'Apparel Retail');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (73, 10, 'Computer & Electronics Retail');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (74, 10, 'Home Improvement Retail');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (75, 10, 'Specialty Stores');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (76, 10, 'Automotive Retail');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (77, 10, 'Homefurnishing Retail');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (78, 11, 'Drug Retail');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (79, 11, 'Food Distributors');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (80, 11, 'Food Retail');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (81, 11, 'Hypermarkets & Super Centers');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (82, 12, 'Brewers');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (83, 12, 'Distillers & Vintners');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (84, 12, 'Soft Drinks');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (85, 12, 'Agricultural Products');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (86, 12, 'Packaged Foods & Meats');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (87, 12, 'Tobacco');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (88, 13, 'Household Products');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (89, 13, 'Personal Products');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (90, 14, 'Health Care Equipment');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (91, 14, 'Health Care Supplies');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (92, 14, 'Health Care Distributors');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (93, 14, 'Health Care Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (94, 14, 'Health Care Facilities');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (95, 14, 'Managed Health Care');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (96, 14, 'Health Care Technology');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (97, 15, 'Biotechnology');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (98, 15, 'Pharmaceuticals');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (99, 15, 'Life Sciences Tools & Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (100, 16, 'Biotechnology');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (101, 16, 'Pharmaceuticals');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (102, 16, 'Life Sciences Tools & Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (103, 17, 'Other Diversified Financial Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (104, 17, 'Multi-Sector Holdings');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (105, 17, 'Specialized Finance');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (106, 17, 'Consumer Finance');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (107, 17, 'Asset Management & Custody Banks');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (108, 17, 'Investment Banking & Brokerage');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (109, 17, 'Diversified Capital Markets');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (110, 17, 'Financial Exchanges & Data');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (111, 17, 'Mortgage REITs');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (112, 18, 'Insurance Brokers');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (113, 18, 'Life & Health Insurance');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (114, 18, 'Multi-line Insurance');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (115, 18, 'Property & Casualty Insurance');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (116, 18, 'Reinsurance');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (117, 19, 'IT Consulting & Other Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (118, 19, 'Data Processing & Outsourced Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (119, 19, 'Internet Services & Infrastructure');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (120, 19, 'Application Software');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (121, 19, 'Systems Software');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (122, 19, 'IT Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (123, 20, 'Communications Equipment');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (124, 20, 'Technology Hardware, Storage & Peripherals');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (125, 20, 'Electronic Equipment & Instruments');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (126, 20, 'Electronic Components');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (127, 20, 'Electronic Manufacturing Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (128, 20, 'Technology Distributors');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (129, 21, 'Semiconductor Equipment');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (130, 21, 'Semiconductors');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (131, 22, 'Alternative Carriers');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (132, 22, 'Integrated Telecommunication Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (133, 22, 'Wireless Telecommunication Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (134, 23, 'Advertising');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (135, 23, 'Broadcasting');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (136, 23, 'Cable & Satellite');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (137, 23, 'Publishing');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (138, 23, 'Movies & Entertainment');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (139, 23, 'Interactive Home Entertainment');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (140, 23, 'Interactive Media & Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (141, 24, 'Electric Utilities');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (142, 24, 'Gas Utilities');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (143, 24, 'Multi-Utilities');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (144, 24, 'Water Utilities');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (145, 24, 'Independent Power Producers & Energy Traders');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (146, 24, 'Renewable Electricity');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (147, 25, 'Diversified REITs');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (148, 25, 'Industrial REITs');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (149, 25, 'Hotel & Resort REITs');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (150, 25, 'Office REITs');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (151, 25, 'Health Care REITs');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (152, 25, 'Residential REITs');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (153, 25, 'Retail REITs');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (154, 25, 'Specialized REITs');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (155, 25, 'Diversified Real Estate Activities');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (156, 25, 'Real Estate Operating Companies');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (157, 25, 'Real Estate Development');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (158, 25, 'Real Estate Services');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (159, 26, 'Federal government');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (160, 26, 'State or territory government');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (161, 26, 'Local government');
INSERT INTO static.t_ref_industry_subsector(industry_subsector_id, industry_sector_id, name) VALUES (162, 26, 'Government department');

CREATE SEQUENCE IF NOT EXISTS static.t_ref_base_currency_base_currency_id_seq;

CREATE TABLE IF NOT EXISTS static.t_ref_base_currency
    (
    base_currency_id integer NOT NULL DEFAULT nextval('static.t_ref_base_currency_base_currency_id_seq'::regclass),
    code character varying(255) COLLATE pg_catalog."default",
    conversion_rate double precision,
    country character varying(255) COLLATE pg_catalog."default",
    currency character varying(255) COLLATE pg_catalog."default",
    symbol character varying(255) COLLATE pg_catalog."default",
    ordering integer DEFAULT 99,
    CONSTRAINT base_currency_pkey PRIMARY KEY (base_currency_id)
    );

INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Albania', 'Leke', 'ALL', 'Lek', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('America', 'Dollars', 'USD', '$', 0.0, 6);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Afghanistan', 'Afghanis', 'AFN', '؋', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Argentina', 'Pesos', 'ARS', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Aruba', 'Guilders', 'AWG', 'ƒ', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Australia', 'Dollars', 'AUD', '$', 0.0, 0);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Azerbaijan', 'New Manats', 'AZN', 'ман', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Bahamas', 'Dollars', 'BSD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Barbados', 'Dollars', 'BBD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Belarus', 'Rubles', 'BYR', 'p.', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Belgium', 'Euro', 'EUR', '€', 0.0, 3);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Beliz', 'Dollars', 'BZD', 'BZ$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Bermuda', 'Dollars', 'BMD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Bolivia', 'Bolivianos', 'BOB', '$b', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Botswana', 'Pula', 'BWP', 'P', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Bulgaria', 'Leva', 'BGN', 'лв', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Brazil', 'Reais', 'BRL', 'R$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Britain (United Kingdom)', 'Pounds', 'GBP', '£', 0.0, 4);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Brunei Darussalam', 'Dollars', 'BND', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Cambodia', 'Riels', 'KHR', '៛', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Canada', 'Dollars', 'CAD', '$', 0.0, 1);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Cayman Islands', 'Dollars', 'KYD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Chile', 'Pesos', 'CLP', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('China', 'Yuan Renminbi', 'CNY', '¥', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Colombia', 'Pesos', 'COP', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Costa Rica', 'Colón', 'CRC', '₡', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Croatia', 'Kuna', 'HRK', 'kn', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Cuba', 'Pesos', 'CUP', '₱', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Cyprus', 'Euro', 'EUR', '€', 0.0, 3);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Czech Republic', 'Koruny', 'CZK', 'Kč', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Denmark', 'Kroner', 'DKK', 'kr', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Dominican Republic', 'Pesos', 'DOP ', 'RD$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('East Caribbean', 'Dollars', 'XCD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Egypt', 'Pounds', 'EGP', '£', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('El Salvador', 'Colones', 'SVC', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('England (United Kingdom)', 'Pounds', 'GBP', '£', 0.0, 4);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Euro', 'Euro', 'EUR', '€', 0.0, 3);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Falkland Islands', 'Pounds', 'FKP', '£', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Fiji', 'Dollars', 'FJD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('France', 'Euro', 'EUR', '€', 0.0, 3);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Ghana', 'Cedis', 'GHC', '¢', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Gibraltar', 'Pounds', 'GIP', '£', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Greece', 'Euro', 'EUR', '€', 0.0, 3);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Guatemala', 'Quetzales', 'GTQ', 'Q', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Guernsey', 'Pounds', 'GGP', '£', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Guyana', 'Dollars', 'GYD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Holland (Netherlands)', 'Euro', 'EUR', '€', 0.0, 3);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Honduras', 'Lempiras', 'HNL', 'L', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Hong Kong', 'Dollars', 'HKD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Hungary', 'Forint', 'HUF', 'Ft', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Iceland', 'Kronur', 'ISK', 'kr', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('India', 'Rupees', 'INR', 'Rp', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Indonesia', 'Rupiahs', 'IDR', 'Rp', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Iran', 'Rials', 'IRR', '﷼', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Ireland', 'Euro', 'EUR', '€', 0.0, 3);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Isle of Man', 'Pounds', 'IMP', '£', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Israel', 'New Shekels', 'ILS', '₪', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Italy', 'Euro', 'EUR', '€', 0.0, 3);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Jamaica', 'Dollars', 'JMD', 'J$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Japan', 'Yen', 'JPY', '¥', 0.0, 5);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Jersey', 'Pounds', 'JEP', '£', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Kazakhstan', 'Tenge', 'KZT', 'лв', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Korea (North)', 'Won', 'KPW', '₩', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Korea (South)', 'Won', 'KRW', '₩', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Kyrgyzstan', 'Soms', 'KGS', 'лв', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Laos', 'Kips', 'LAK', '₭', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Latvia', 'Lati', 'LVL', 'Ls', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Lebanon', 'Pounds', 'LBP', '£', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Liberia', 'Dollars', 'LRD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', 0.0, 2);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Lithuania', 'Litai', 'LTL', 'Lt', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Luxembourg', 'Euro', 'EUR', '€', 0.0, 3);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Macedonia', 'Denars', 'MKD', 'ден', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Malaysia', 'Ringgits', 'MYR', 'RM', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Malta', 'Euro', 'EUR', '€', 0.0, 3);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Mauritius', 'Rupees', 'MUR', '₨', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Mexico', 'Pesos', 'MXN', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Mongolia', 'Tugriks', 'MNT', '₮', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Mozambique', 'Meticais', 'MZN', 'MT', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Namibia', 'Dollars', 'NAD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Nepal', 'Rupees', 'NPR', '₨', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Netherlands', 'Euro', 'EUR', '€', 0.0, 3);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('New Zealand', 'Dollars', 'NZD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Nicaragua', 'Cordobas', 'NIO', 'C$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Nigeria', 'Nairas', 'NGN', '₦', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('North Korea', 'Won', 'KPW', '₩', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Norway', 'Krone', 'NOK', 'kr', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Oman', 'Rials', 'OMR', '﷼', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Pakistan', 'Rupees', 'PKR', '₨', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Panama', 'Balboa', 'PAB', 'B/.', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Paraguay', 'Guarani', 'PYG', 'Gs', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Peru', 'Nuevos Soles', 'PEN', 'S/.', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Philippines', 'Pesos', 'PHP', 'Php', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Poland', 'Zlotych', 'PLN', 'zł', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Qatar', 'Rials', 'QAR', '﷼', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Romania', 'New Lei', 'RON', 'lei', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Russia', 'Rubles', 'RUB', 'руб', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Saint Helena', 'Pounds', 'SHP', '£', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Saudi Arabia', 'Riyals', 'SAR', '﷼', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Serbia', 'Dinars', 'RSD', 'Дин.', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Seychelles', 'Rupees', 'SCR', '₨', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Singapore', 'Dollars', 'SGD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Slovenia', 'Euro', 'EUR', '€', 0.0, 3);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Solomon Islands', 'Dollars', 'SBD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Somalia', 'Shillings', 'SOS', 'S', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('South Africa', 'Rand', 'ZAR', 'R', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('South Korea', 'Won', 'KRW', '₩', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Spain', 'Euro', 'EUR', '€', 0.0, 3);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Sri Lanka', 'Rupees', 'LKR', '₨', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Sweden', 'Kronor', 'SEK', 'kr', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Switzerland', 'Francs', 'CHF', 'CHF', 0.0, 2);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Suriname', 'Dollars', 'SRD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Syria', 'Pounds', 'SYP', '£', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Taiwan', 'New Dollars', 'TWD', 'NT$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Thailand', 'Baht', 'THB', '฿', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Turkey', 'Lira', 'TRY', 'TL', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Turkey', 'Liras', 'TRL', '£', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Tuvalu', 'Dollars', 'TVD', '$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Ukraine', 'Hryvnia', 'UAH', '₴', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('United Kingdom', 'Pounds', 'GBP', '£', 0.0, 4);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('United States of America', 'Dollars', 'USD', '$', 0.0, 6);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Uruguay', 'Pesos', 'UYU', '$U', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Uzbekistan', 'Sums', 'UZS', 'лв', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Vatican City', 'Euro', 'EUR', '€', 0.0, 3);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Vietnam', 'Dong', 'VND', '₫', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Yemen', 'Rials', 'YER', '﷼', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', 0.0, 99);
INSERT INTO static.t_ref_base_currency (country, currency, code, symbol, conversion_rate, ordering) VALUES ('India', 'Rupees', 'INR', '₹', 0.0, 99);

CREATE TABLE IF NOT EXISTS static.t_ref_organisational_boundary
    (
    organisational_boundary_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT organisational_boundary_pkey PRIMARY KEY (organisational_boundary_id)
    );

INSERT INTO static.t_ref_organisational_boundary(organisational_boundary_id, name) VALUES (1, 'Equity Share');
INSERT INTO static.t_ref_organisational_boundary(organisational_boundary_id, name) VALUES (2, 'Control');

CREATE TABLE IF NOT EXISTS static.t_ref_organisational_boundary_criteria
    (
    organisational_boundary_criteria_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    organisational_boundary_id integer,
    CONSTRAINT organisational_boundary_criteria_pkey PRIMARY KEY (organisational_boundary_criteria_id),
    CONSTRAINT fk_organisational_boundary FOREIGN KEY (organisational_boundary_id)
    REFERENCES static.t_ref_organisational_boundary (organisational_boundary_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    );

INSERT INTO static.t_ref_organisational_boundary_criteria(organisational_boundary_criteria_id, organisational_boundary_id, name) VALUES (1, 2, 'Operational');
INSERT INTO static.t_ref_organisational_boundary_criteria(organisational_boundary_criteria_id, organisational_boundary_id, name) VALUES (2, 2, 'Financial');

CREATE TABLE IF NOT EXISTS static.t_ref_operational_boundary_scope
    (
    operational_boundary_scope_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT operational_boundary_scope_pkey PRIMARY KEY (operational_boundary_scope_id)
    );

INSERT INTO static.t_ref_operational_boundary_scope(operational_boundary_scope_id, name) VALUES (1, 'Scope 1');
INSERT INTO static.t_ref_operational_boundary_scope(operational_boundary_scope_id, name) VALUES (2, 'Scope 2');
INSERT INTO static.t_ref_operational_boundary_scope(operational_boundary_scope_id, name) VALUES (3, 'Scope 3 - Upstream');
INSERT INTO static.t_ref_operational_boundary_scope(operational_boundary_scope_id, name) VALUES (4, 'Scope 3 - Downstream');

CREATE TABLE IF NOT EXISTS static.t_ref_operational_boundary
    (
    operational_boundary_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    operational_boundary_scope_id integer,
    CONSTRAINT operational_boundary_pkey PRIMARY KEY (operational_boundary_id),
    CONSTRAINT fk_t_ref_operational_boundary_scope FOREIGN KEY (operational_boundary_scope_id)
    REFERENCES static.t_ref_operational_boundary_scope (operational_boundary_scope_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    );

INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (1, 1, 'Fuel Use- Mobile Combustion');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (2, 1, 'Fuel Use- Stationary Combustion');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (3, 1, 'Other Process Emissions');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (4, 1, 'Fugitive Emissions: Refrigerants and Aerosols');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (5, 1, 'Fugitive Emissions: Waste');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (6, 1, 'Fugitive Emissions: Land Use');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (7, 1, 'Fugitive Emissions: Other');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (8, 2, 'Purchased Electricity');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (9, 2, 'Purchased Heat, Cooling and Steam');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (10, 3, 'Purchased Goods and Services');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (11, 3, 'Capital Goods');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (12, 3, 'Fuels and Energy Use');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (13, 3, 'Upstream Transportation and Distribution');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (14, 3, 'Waste generated in operations');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (15, 3, 'Business travel');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (16, 3, 'Employee commuting');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (17, 3, 'Upstream leased assets');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (18, 4, 'Downstream Transportation and Distribution');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (19, 4, 'Processing of sold products');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (20, 4, 'Use of sold products');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (21, 4, 'End-of-life treatment of sold products');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (22, 4, 'Downstream leased assets');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (23, 4, 'Franchises');
INSERT INTO static.t_ref_operational_boundary(operational_boundary_id, operational_boundary_scope_id, name) VALUES (24, 4, 'Investments');

CREATE TABLE IF NOT EXISTS static.t_ref_product_selection
(
    product_selection_id integer NOT NULL,
    name integer,
    CONSTRAINT product_selection_pkey PRIMARY KEY (product_selection_id)
    );

INSERT INTO static.t_ref_product_selection(product_selection_id, name) VALUES (1, 'Impact & Trace');
INSERT INTO static.t_ref_product_selection(product_selection_id, name) VALUES (2, 'Impact Premium & Portofolio');

CREATE TABLE IF NOT EXISTS static.t_ref_customer_type
(
    customer_type_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    product_selection_id integer,
    CONSTRAINT customer_type_pkey PRIMARY KEY (customer_type_id),
    CONSTRAINT fk_t_ref_product_selection FOREIGN KEY (product_selection_id)
    REFERENCES static.t_ref_product_selection (product_selection_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    );

INSERT INTO static.t_ref_customer_type(customer_type_id, product_selection_id, name) VALUES (1, 1, 'Company');
INSERT INTO static.t_ref_customer_type(customer_type_id, product_selection_id, name) VALUES (2, 1, 'Public Authority');
INSERT INTO static.t_ref_customer_type(customer_type_id, product_selection_id, name) VALUES (3, 2, 'Credit Institution');
INSERT INTO static.t_ref_customer_type(customer_type_id, product_selection_id, name) VALUES (4, 2, 'Other Financial Institution');

CREATE TABLE IF NOT EXISTS static.t_ref_stock_exchange_zone
    (
    home_stock_exchange_zone_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT home_stock_exchange_zone_pkey PRIMARY KEY (home_stock_exchange_zone_id)
    );

INSERT INTO static.t_ref_stock_exchange_zone(home_stock_exchange_zone_id, name) VALUES (1, 'Africa');
INSERT INTO static.t_ref_stock_exchange_zone(home_stock_exchange_zone_id, name) VALUES (2, 'Asia-Pacific');
INSERT INTO static.t_ref_stock_exchange_zone(home_stock_exchange_zone_id, name) VALUES (3, 'Central Asia');
INSERT INTO static.t_ref_stock_exchange_zone(home_stock_exchange_zone_id, name) VALUES (4, 'Europe');
INSERT INTO static.t_ref_stock_exchange_zone(home_stock_exchange_zone_id, name) VALUES (5, 'Middle East & North Africa');
INSERT INTO static.t_ref_stock_exchange_zone(home_stock_exchange_zone_id, name) VALUES (6, 'North America');
INSERT INTO static.t_ref_stock_exchange_zone(home_stock_exchange_zone_id, name) VALUES (7, 'Russia');
INSERT INTO static.t_ref_stock_exchange_zone(home_stock_exchange_zone_id, name) VALUES (8, 'South America');
INSERT INTO static.t_ref_stock_exchange_zone(home_stock_exchange_zone_id, name) VALUES (9, 'Other');

CREATE TABLE IF NOT EXISTS static.t_ref_home_stock_exchange
    (
    home_stock_exchange_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    home_stock_exchange_zone_id integer,
    CONSTRAINT home_stock_exchange_pkey PRIMARY KEY (home_stock_exchange_id),
    CONSTRAINT fk_t_ref_stock_exchange_zone FOREIGN KEY (home_stock_exchange_zone_id)
    REFERENCES static.t_ref_stock_exchange_zone (home_stock_exchange_zone_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    );

INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (1, 1, 'Dar es Salaam Stock Exchange PLC');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (2, 1, 'Johannesburg Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (3, 1, 'Nairobi Securities Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (4, 1, 'Nigerian Stock Exchange');

INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (5, 2, 'Stock Exchange of Mauritius');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (6, 2, 'Australian Securities Exchange (ASX)');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (7, 2, 'BSE India Limited');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (8, 2, 'Bursa Malaysia');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (9, 2, 'China Financial Futures Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (10, 2, 'China Securities Depository and Clearing Corporation Ltd.');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (11, 2, 'Colombo Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (12, 2, 'Dalian Commodity Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (13, 2, 'Dhaka Stock Exchange Ltd.');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (14, 2, 'Ho Chi Minh City Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (15, 2, 'Hong Kong Exchanges and Clearing');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (16, 2, 'Indonesia Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (17, 2, 'Japan Exchange Group');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (18, 2, 'Korea Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (19, 2, 'Multi Commodity Exchange of India Ltd.');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (20, 2, 'National Stock Exchange of India');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (21, 2, 'NZX Limited');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (22, 2, 'Philippine Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (23, 2, 'Shanghai Futures Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (24, 2, 'Shanghai Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (25, 2, 'Shenzhen Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (26, 1, 'Singapore Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (27, 2, 'Stock Exchange of Thailand');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (28, 2, 'Taipei Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (29, 2, 'Taiwan Futures Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (30, 2, 'Taiwan Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (31, 2, 'Zhengzhou Commodity Exchange');

INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (32, 3, 'Kaz Athens Stock Exchange');

INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (33, 4, 'Athens Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (34, 4, 'Bolsa de Madrid (Spanish Exchanges)');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (35, 4, 'Borsa Istanbul');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (36, 4, 'Budapest Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (37, 4, 'Cyprus Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (38, 4, 'Deutsche Börse');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (39, 4, 'Euronext');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (40, 4, 'Intercontinental Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (41, 4, 'Irish Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (42, 4, 'London Stock Exchange Group');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (43, 4, 'Luxembourg Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (44, 4, 'Malta Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (45, 4, 'Nasdaq Stockholm AB');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (46, 4, 'Oslo Børs');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (47, 4, 'SIX Swiss Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (48, 4, 'Weiner Borse akhstan Stock Exchange');

INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (49, 5, 'Abu Dhabi Securities Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (50, 5, 'Amman Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (51, 5, 'Bahrain Bourse');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (52, 5, 'Boursa Kuwait');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (53, 5, 'Bourse de Casablanca');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (54, 5, 'Dubai Financial Market');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (55, 5, 'The Egyptian Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (56, 5, 'Muscat Securities Market');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (57, 5, 'Palestine Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (58, 5, 'Qatar Stock Exchange');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (59, 5, 'Saudi Stock Exchange (Tadawul)');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (60, 5, 'Tel Aviv Stock Exchange');

INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (61, 6, 'Bolsa Mexicana de Valores');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (62, 6, 'CBOE');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (63, 6, 'CME Group');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (64, 6, 'The Depository Trust and Clearing Corporation');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (65, 6, 'NASDAQ OMX');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (66, 6, 'New York Stock Exchange (NYSE)');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (67, 6, 'OCC - The Options Clearing Corporation');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (68, 6, 'TMX Group');

INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (69, 7, 'Moscow Exchange');

INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (70, 8, 'B3 Brasil Bolsa Balcão');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (71, 8, 'B3 - Brasil Bolsa Balcão S.A.');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (72, 8, 'Bolsa de Comercio de Buenos Aires');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (73, 8, 'Bolsa de Comercio de Santiago');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (74, 8, 'Bolsa de Valores de Colombia');
INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (75, 8, 'Bolsa de Valores de Lima');

INSERT INTO static.t_ref_home_stock_exchange(home_stock_exchange_id,home_stock_exchange_zone_id, name) VALUES (76, 9, 'Bermuda Stock Exchange');

CREATE SEQUENCE IF NOT EXISTS static.emissions_inventory_method_emissions_inventory_method_id_seq;

CREATE TABLE IF NOT EXISTS static.t_ref_emissions_inventory_method
    (
    emissions_inventory_method_id integer NOT NULL DEFAULT nextval('static.emissions_inventory_method_emissions_inventory_method_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT emissions_inventory_method_pkey PRIMARY KEY (emissions_inventory_method_id)
    );

INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('Greenhouse Gas Protocol (GHGP) Corporate Accounting and Reporting Standard');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('Global Protocol for Community-Scale Greenhouse Gas Emissions Inventories (GPC)');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('ISO14064 Standards for Greenhouse Gas Accounting and Verificatio');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('WRI and WBCSD GHG Protocol Standards');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('PCAF: The Global GHG Accounting and Reporting Standard for the Financial Industry');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('Defra Voluntary Reporting Guidelines');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('US Environmental Protection Agency Greenhouse Gas Reporting Program');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('European Union Greenhouse Gas Emissions Trading System (EU ETS)');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('Australian Government- National Greenhouse Gas and Energy Reporting Scheme (NGERs)');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('California Climate Action Registry');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('World Economic Forum Global GHG Registry');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('New Zealand Business Council for Sustainable Development');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('Taiwan Business Council for Sustainable Development');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('Chicago Climate Exchange');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('UK Emissions Trading Scheme (UK ETS)');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('American Petroleum Institute Compendium of Greenhouse Gas Emissions Methodologies for the Oil and Natural Gas Industry');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('International Aluminium Institute');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('International Council of Forest and Paper Associations');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('International Iron and Steel Institute');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('WBCSD Cement and Sustainability Initiative');
INSERT INTO static.t_ref_emissions_inventory_method(name) VALUES ('International Petroleum Industry Environmental Conservation Association (IPIECA)');

CREATE TABLE IF NOT EXISTS static.t_ref_carbon_credit_category
(
    carbon_credit_category_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT carbon_credit_category_pkey PRIMARY KEY (carbon_credit_category_id)
    );

INSERT INTO static.t_ref_carbon_credit_category(carbon_credit_category_id, name) VALUES (1, 'Certified emissions reduction (CER)');
INSERT INTO static.t_ref_carbon_credit_category(carbon_credit_category_id, name) VALUES (2, 'Voluntary emissions reduction (VER)');
INSERT INTO static.t_ref_carbon_credit_category(carbon_credit_category_id, name) VALUES (3, 'Renewable Energy Certificate');
INSERT INTO static.t_ref_carbon_credit_category(carbon_credit_category_id, name) VALUES (99, 'Other');

CREATE TABLE IF NOT EXISTS static.t_ref_carbon_compensation_type
(
    carbon_compensation_type_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    carbon_credit_category_id integer,
    CONSTRAINT carbon_compensation_type_pkey PRIMARY KEY (carbon_compensation_type_id),
    CONSTRAINT fk_t_ref_carbon_credit_category FOREIGN KEY (carbon_credit_category_id)
    REFERENCES static.t_ref_carbon_credit_category (carbon_credit_category_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    );

INSERT INTO static.t_ref_carbon_compensation_type(carbon_compensation_type_id, carbon_credit_category_id, name) VALUES (1, 1, 'European Union Allowance');
INSERT INTO static.t_ref_carbon_compensation_type(carbon_compensation_type_id, carbon_credit_category_id, name) VALUES (2, 1, 'Certified Emission Reduction (CER)');
INSERT INTO static.t_ref_carbon_compensation_type(carbon_compensation_type_id, carbon_credit_category_id, name) VALUES (3, 1, 'Other');
INSERT INTO static.t_ref_carbon_compensation_type(carbon_compensation_type_id, carbon_credit_category_id, name) VALUES (4, 2, 'Efficiency and Fuel Switching');
INSERT INTO static.t_ref_carbon_compensation_type(carbon_compensation_type_id, carbon_credit_category_id, name) VALUES (5, 2, 'Renewables');
INSERT INTO static.t_ref_carbon_compensation_type(carbon_compensation_type_id, carbon_credit_category_id, name) VALUES (6, 2, 'Forestry and Land Use');
INSERT INTO static.t_ref_carbon_compensation_type(carbon_compensation_type_id, carbon_credit_category_id, name) VALUES (7, 2, 'Gases');
INSERT INTO static.t_ref_carbon_compensation_type(carbon_compensation_type_id, carbon_credit_category_id, name) VALUES (8, 2, 'Household Device');
INSERT INTO static.t_ref_carbon_compensation_type(carbon_compensation_type_id, carbon_credit_category_id, name) VALUES (9, 3, 'Power Purchase Agreement');
INSERT INTO static.t_ref_carbon_compensation_type(carbon_compensation_type_id, carbon_credit_category_id, name) VALUES (10, 3, 'Market Certi');
INSERT INTO static.t_ref_carbon_compensation_type(carbon_compensation_type_id, carbon_credit_category_id, name) VALUES (11, 3, 'Retail Green Energy');
INSERT INTO static.t_ref_carbon_compensation_type(carbon_compensation_type_id, carbon_credit_category_id, name) VALUES (12, 99, 'Other');

CREATE TABLE IF NOT EXISTS static.t_ref_carbon_price_coverage
(
    carbon_price_coverage_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT carbon_price_coverage_pkey PRIMARY KEY (carbon_price_coverage_id)
    );

INSERT INTO static.t_ref_carbon_price_coverage(carbon_price_coverage_id, name) VALUES (1, 'Geography');
INSERT INTO static.t_ref_carbon_price_coverage(carbon_price_coverage_id, name) VALUES (2, 'Projects');
INSERT INTO static.t_ref_carbon_price_coverage(carbon_price_coverage_id, name) VALUES (3, 'Emissions Scopes');
INSERT INTO static.t_ref_carbon_price_coverage(carbon_price_coverage_id, name) VALUES (4, 'Across entire business category');

CREATE TABLE IF NOT EXISTS static.t_ref_carbon_price_coverage_type
(
    carbon_price_coverage_type_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    carbon_price_coverage_id integer,
    CONSTRAINT carbon_price_coverage_type_pkey PRIMARY KEY (carbon_price_coverage_type_id),
    CONSTRAINT fk_t_ref_carbon_price_coverage FOREIGN KEY (carbon_price_coverage_id)
    REFERENCES static.t_ref_carbon_price_coverage (carbon_price_coverage_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    );

INSERT INTO static.t_ref_carbon_price_coverage_type(carbon_price_coverage_type_id, carbon_price_coverage_id, name) VALUES (1, 1, 'Specific Region/s');
INSERT INTO static.t_ref_carbon_price_coverage_type(carbon_price_coverage_type_id, carbon_price_coverage_id, name) VALUES (2, 1, 'Global');
INSERT INTO static.t_ref_carbon_price_coverage_type(carbon_price_coverage_type_id, carbon_price_coverage_id, name) VALUES (3, 2, 'Capital Projects only');
INSERT INTO static.t_ref_carbon_price_coverage_type(carbon_price_coverage_type_id, carbon_price_coverage_id, name) VALUES (4, 2, 'Operational Projets only');
INSERT INTO static.t_ref_carbon_price_coverage_type(carbon_price_coverage_type_id, carbon_price_coverage_id, name) VALUES (5, 2, 'Capital and Operational Projects');
INSERT INTO static.t_ref_carbon_price_coverage_type(carbon_price_coverage_type_id, carbon_price_coverage_id, name) VALUES (6, 3, 'Scope 1');
INSERT INTO static.t_ref_carbon_price_coverage_type(carbon_price_coverage_type_id, carbon_price_coverage_id, name) VALUES (7, 3, 'Scope 2');
INSERT INTO static.t_ref_carbon_price_coverage_type(carbon_price_coverage_type_id, carbon_price_coverage_id, name) VALUES (8, 3, 'Scope 1 & 2');
INSERT INTO static.t_ref_carbon_price_coverage_type(carbon_price_coverage_type_id, carbon_price_coverage_id, name) VALUES (9, 3, 'Scope 3');
INSERT INTO static.t_ref_carbon_price_coverage_type(carbon_price_coverage_type_id, carbon_price_coverage_id, name) VALUES (10, 3, 'Scope 1, 2 & 3');

CREATE TABLE IF NOT EXISTS static.t_ref_emissions_reduction_target_scope
    (
    emissions_reduction_target_scope_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT emissions_reduction_target_scope_pkey PRIMARY KEY (emissions_reduction_target_scope_id)
    );

INSERT INTO static.t_ref_emissions_reduction_target_scope(emissions_reduction_target_scope_id, name) VALUES (1, 'Scope 1');
INSERT INTO static.t_ref_emissions_reduction_target_scope(emissions_reduction_target_scope_id, name) VALUES (2, 'Scope 2');
INSERT INTO static.t_ref_emissions_reduction_target_scope(emissions_reduction_target_scope_id, name) VALUES (3, 'Scope 1 & 2');
INSERT INTO static.t_ref_emissions_reduction_target_scope(emissions_reduction_target_scope_id, name) VALUES (4, 'Scope 3');
INSERT INTO static.t_ref_emissions_reduction_target_scope(emissions_reduction_target_scope_id, name) VALUES (5, 'Scope 1 & 2 & 3');

CREATE TABLE IF NOT EXISTS static.t_ref_auditing_validation
(
    auditing_validation_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT auditing_validation_pkey PRIMARY KEY (auditing_validation_id)
    );

INSERT INTO static.t_ref_auditing_validation(auditing_validation_id, name) VALUES (1, 'Yes');
INSERT INTO static.t_ref_auditing_validation(auditing_validation_id, name) VALUES (2, 'No');


CREATE SEQUENCE IF NOT EXISTS static.year_representation_year_representation_id_seq;

CREATE TABLE IF NOT EXISTS static.t_ref_yearss
(
    year_representation_id integer NOT NULL DEFAULT nextval('static.year_representation_year_representation_id_seq'::regclass),
    calendar_year integer NOT NULL,
    financial_year character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT financial_year_id PRIMARY KEY (year_representation_id)
);

INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2014', 'FY2014/2015');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2015', 'FY2015/2016');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2016', 'FY2016/2017');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2017', 'FY2017/2018');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2018', 'FY2018/2019');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2019', 'FY2019/2020');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2020', 'FY2020/2021');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2021', 'FY2021/2022');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2022', 'FY2022/2023');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2023', 'FY2023/2024');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2024', 'FY2024/2025');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2025', 'FY2025/2026');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2026', 'FY2026/2027');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2027', 'FY2027/2028');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2028', 'FY2028/2029');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2029', 'FY2029/2030');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2030', 'FY2030/2031');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2031', 'FY2031/2032');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2032', 'FY2032/2033');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2033', 'FY2033/2034');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2034', 'FY2034/2035');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2035', 'FY2035/2036');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2036', 'FY2036/2037');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2037', 'FY2037/2038');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2038', 'FY2038/2039');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2039', 'FY2039/2040');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2040', 'FY2040/2041');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2041', 'FY2041/2042');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2042', 'FY2042/2043');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2043', 'FY2043/2044');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2044', 'FY2044/2045');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2045', 'FY2045/2046');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2046', 'FY2046/2047');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2047', 'FY2047/2048');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2048', 'FY2048/2049');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2049', 'FY2049/2050');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2050', 'FY2050/2051');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2051', 'FY2051/2052');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2052', 'FY2052/2053');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2053', 'FY2053/2054');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2054', 'FY2054/2055');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2055', 'FY2055/2056');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2056', 'FY2056/2057');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2057', 'FY2057/2058');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2058', 'FY2058/2059');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2059', 'FY2059/2060');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2060', 'FY2060/2061');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2061', 'FY2061/2062');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2062', 'FY2062/2063');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2063', 'FY2063/2064');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2064', 'FY2064/2065');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2065', 'FY2065/2066');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2066', 'FY2066/2067');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2067', 'FY2067/2068');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2068', 'FY2068/2069');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2069', 'FY2069/2070');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2070', 'FY2070/2071');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2071', 'FY2071/2072');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2072', 'FY2072/2073');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2073', 'FY2073/2074');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2074', 'FY2074/2075');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2075', 'FY2075/2076');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2076', 'FY2076/2077');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2077', 'FY2077/2078');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2078', 'FY2078/2079');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2079', 'FY2079/2080');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2080', 'FY2080/2081');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2081', 'FY2081/2082');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2082', 'FY2082/2083');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2083', 'FY2083/2084');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2084', 'FY2084/2085');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2085', 'FY2085/2086');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2086', 'FY2086/2087');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2087', 'FY2087/2088');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2088', 'FY2088/2089');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2089', 'FY2089/2090');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2090', 'FY2090/2091');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2091', 'FY2091/2092');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2092', 'FY2092/2093');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2093', 'FY2093/2094');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2094', 'FY2094/2095');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2095', 'FY2095/2096');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2096', 'FY2096/2097');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2097', 'FY2097/2098');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2098', 'FY2098/2099');
INSERT INTO static.t_ref_years(calendar_year, financial_year) VALUES ('2099', 'FY2099/2100');
