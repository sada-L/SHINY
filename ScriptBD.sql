-- public."AgentType" definition

-- Drop table

-- DROP TABLE public."AgentType";

CREATE TABLE public."AgentType" (
	"ID" int4 NOT NULL,
	"Title" _char NULL,
	"Image" _char NOT NULL,
	CONSTRAINT "AgentType_pkey" PRIMARY KEY ("ID")
);


-- public."MaterialType" definition

-- Drop table

-- DROP TABLE public."MaterialType";

CREATE TABLE public."MaterialType" (
	"ID" int4 NOT NULL,
	"Title" varchar(50) NOT NULL,
	"DefectedPercent" float4 NOT NULL,
	CONSTRAINT "MaterialType_pkey" PRIMARY KEY ("ID")
);


-- public."ProductType" definition

-- Drop table

-- DROP TABLE public."ProductType";

CREATE TABLE public."ProductType" (
	"ID" int4 NOT NULL,
	"Title" varchar(50) NOT NULL,
	"DefectedPercent" float4 NOT NULL,
	CONSTRAINT "ProductType_pkey" PRIMARY KEY ("ID")
);


-- public."Supplier" definition

-- Drop table

-- DROP TABLE public."Supplier";

CREATE TABLE public."Supplier" (
	"ID" int4 NOT NULL,
	"Title" varchar(150) NULL,
	"INN" varchar(12) NULL,
	"StartDate" date NULL,
	"QualityRating" int4 NOT NULL,
	"SupplierType" varchar(20) NOT NULL,
	CONSTRAINT "Supplier_pkey" PRIMARY KEY ("ID")
);


-- public."Agent" definition

-- Drop table

-- DROP TABLE public."Agent";

CREATE TABLE public."Agent" (
	"ID" int4 NOT NULL,
	"Title" _char NULL,
	"AgentTypeID" int4 NULL,
	"Address" _char NOT NULL,
	"INN" _char NULL,
	"KPP" _char NOT NULL,
	"DirectorName" _char NOT NULL,
	"Phone" _char NULL,
	"Email" _char NOT NULL,
	"Logo" _char NOT NULL,
	"Priority" int4 NULL,
	CONSTRAINT "Agent_pkey" PRIMARY KEY ("ID"),
	CONSTRAINT "Agent_AgentTypeID_fkey" FOREIGN KEY ("AgentTypeID") REFERENCES public."AgentType"("ID")
);


-- public."AgentPriorityHistory" definition

-- Drop table

-- DROP TABLE public."AgentPriorityHistory";

CREATE TABLE public."AgentPriorityHistory" (
	"ID" int4 NOT NULL,
	"AgentID" int4 NULL,
	"ChangeDate" date NULL,
	"PriorityValue" int4 NULL,
	CONSTRAINT "AgentPriorityHistory_pkey" PRIMARY KEY ("ID"),
	CONSTRAINT "AgentPriorityHistory_AgentID_fkey" FOREIGN KEY ("AgentID") REFERENCES public."Agent"("ID")
);


-- public."Material" definition

-- Drop table

-- DROP TABLE public."Material";

CREATE TABLE public."Material" (
	"ID" int4 NOT NULL,
	"Title" varchar(100) NOT NULL,
	"CountinPack" int4 NOT NULL,
	"Unit" varchar(10) NOT NULL,
	"CountinStock" float4 NULL,
	"MinCount" float4 NOT NULL,
	"Description" _varchar NULL,
	"Cost" numeric(10, 2) NOT NULL,
	"Image" varchar(100) NULL,
	"MaterialtypeID" int4 NOT NULL,
	CONSTRAINT "Material_pkey" PRIMARY KEY ("ID"),
	CONSTRAINT "Material_MaterialtypeID_fkey" FOREIGN KEY ("MaterialtypeID") REFERENCES public."MaterialType"("ID")
);


-- public."MaterialCountHistory" definition

-- Drop table

-- DROP TABLE public."MaterialCountHistory";

CREATE TABLE public."MaterialCountHistory" (
	"ID" int4 NOT NULL,
	"MaterialID" int4 NULL,
	"ChangeDate" date NULL,
	"CountValue" float4 NULL,
	CONSTRAINT "MaterialCountHistory_pkey" PRIMARY KEY ("ID"),
	CONSTRAINT "MaterialCountHistory_MaterialID_fkey" FOREIGN KEY ("MaterialID") REFERENCES public."Material"("ID")
);


-- public."MaterialSupplier" definition

-- Drop table

-- DROP TABLE public."MaterialSupplier";

CREATE TABLE public."MaterialSupplier" (
	"MaterialID" int4 NOT NULL,
	"SupplierID" int4 NOT NULL,
	CONSTRAINT "MaterialSupplier_pkey" PRIMARY KEY ("MaterialID", "SupplierID"),
	CONSTRAINT "MaterialSupplier_MaterialID_fkey" FOREIGN KEY ("MaterialID") REFERENCES public."Material"("ID"),
	CONSTRAINT "MaterialSupplier_SupplierID_fkey" FOREIGN KEY ("SupplierID") REFERENCES public."Supplier"("ID")
);


-- public."Product" definition

-- Drop table

-- DROP TABLE public."Product";

CREATE TABLE public."Product" (
	"ID" int4 NOT NULL,
	"Title" varchar(100) NOT NULL,
	"ProductTypeID" int4 NULL,
	"ArticleNumber" varchar(10) NOT NULL,
	"Description" _varchar NULL,
	"Image" varchar(100) NULL,
	"ProductionPersonCount" int4 NULL,
	"ProductionWorkshopNumber" int4 NULL,
	"MinCostForAgent" numeric(10, 2) NOT NULL,
	prodactionpersoncount int4 NULL,
	CONSTRAINT "Product_pkey" PRIMARY KEY ("ID"),
	CONSTRAINT "Product_ProductTypeID_fkey" FOREIGN KEY ("ProductTypeID") REFERENCES public."ProductType"("ID")
);


-- public."ProductCostHistory" definition

-- Drop table

-- DROP TABLE public."ProductCostHistory";

CREATE TABLE public."ProductCostHistory" (
	"ID" int4 NOT NULL,
	"ProductID" int4 NULL,
	"ChangeDate" date NULL,
	"CostValue" _float4 NULL,
	CONSTRAINT "ProductCostHistory_pkey" PRIMARY KEY ("ID"),
	CONSTRAINT "ProductCostHistory_ProductID_fkey" FOREIGN KEY ("ProductID") REFERENCES public."Product"("ID")
);


-- public."ProductMaterial" definition

-- Drop table

-- DROP TABLE public."ProductMaterial";

CREATE TABLE public."ProductMaterial" (
	"ProductID" int4 NOT NULL,
	"MaterialID" int4 NOT NULL,
	"Count" float4 NULL,
	CONSTRAINT "ProductMaterial_pkey" PRIMARY KEY ("ProductID", "MaterialID"),
	CONSTRAINT "ProductMaterial_MaterialID_fkey" FOREIGN KEY ("MaterialID") REFERENCES public."Material"("ID"),
	CONSTRAINT "ProductMaterial_ProductID_fkey" FOREIGN KEY ("ProductID") REFERENCES public."Product"("ID")
);


-- public."ProductSale" definition

-- Drop table

-- DROP TABLE public."ProductSale";

CREATE TABLE public."ProductSale" (
	"ID" int4 NOT NULL,
	"AgentID" int4 NULL,
	"ProductID" int4 NULL,
	"SaleDate" date NULL,
	"ProductCount" int4 NULL,
	CONSTRAINT "ProductSale_pkey" PRIMARY KEY ("ID"),
	CONSTRAINT "ProductSale_AgentID_fkey" FOREIGN KEY ("AgentID") REFERENCES public."Agent"("ID"),
	CONSTRAINT "ProductSale_ProductID_fkey" FOREIGN KEY ("ProductID") REFERENCES public."Product"("ID")
);


-- public."Shop" definition

-- Drop table

-- DROP TABLE public."Shop";

CREATE TABLE public."Shop" (
	"ID" int4 NOT NULL,
	"Title" _char NULL,
	"Address" _char NOT NULL,
	"AgentID" int4 NULL,
	CONSTRAINT "Shop_pkey" PRIMARY KEY ("ID"),
	CONSTRAINT "Shop_AgentID_fkey" FOREIGN KEY ("AgentID") REFERENCES public."Agent"("ID")
);

INSERT INTO public."MaterialType" ("ID","Title","DefectedPercent") VALUES
	 (1,'Резина',0.0),
	 (2,'Шипы',0.0);

INSERT INTO public."Material" ("ID","Title","CountinPack","Unit","CountinStock","MinCount","Description","Cost","Image","MaterialtypeID") VALUES
	 (1,'резина для зимы 0x3',4,' м',726.0,46.0,NULL,37293.00,NULL,1),
	 (2,'резина для зимы 1x0',5,' кг',929.0,48.0,NULL,43046.00,NULL,1),
	 (3,'резина для зимы 1x3',9,' м',84.0,50.0,NULL,27823.00,NULL,1),
	 (4,'резина для зимы 2x3',3,' м',344.0,12.0,NULL,53323.00,NULL,1),
	 (5,'резина для зимы 3x1',9,' кг',690.0,24.0,NULL,25844.00,NULL,1),
	 (6,'резина для зимы 3x3',2,' кг',275.0,28.0,NULL,31356.00,NULL,1),
	 (7,'резина для лета 0x1',9,' кг',127.0,17.0,NULL,23936.00,NULL,1),
	 (8,'резина для лета 0x2',4,' кг',753.0,33.0,NULL,9069.00,NULL,1),
	 (9,'резина для лета 1x0',5,' м',234.0,32.0,NULL,25499.00,NULL,1),
	 (10,'резина для лета 2x1',2,' м',561.0,39.0,NULL,47610.00,NULL,1);
INSERT INTO public."Material" ("ID","Title","CountinPack","Unit","CountinStock","MinCount","Description","Cost","Image","MaterialtypeID") VALUES
	 (11,'резина для лета 2x2',2,' м',542.0,20.0,NULL,54298.00,NULL,1),
	 (12,'резина для лета 3x3',6,' м',652.0,28.0,NULL,6764.00,NULL,1),
	 (13,'резина для льда 0x1',5,' м',964.0,34.0,NULL,53394.00,NULL,1),
	 (14,'резина для льда 0x2',2,' кг',816.0,21.0,NULL,48785.00,NULL,1),
	 (15,'резина для льда 1x3',2,' кг',286.0,39.0,NULL,23551.00,NULL,1),
	 (16,'резина для льда 2x0',6,' м',86.0,8.0,NULL,24767.00,NULL,1),
	 (17,'резина для льда 3x3',7,' кг',909.0,35.0,NULL,23174.00,NULL,1),
	 (18,'резина для пустыни 0x3',8,' м',761.0,7.0,NULL,8094.00,NULL,1),
	 (19,'резина для пустыни 1x1',6,' кг',120.0,21.0,NULL,11642.00,NULL,1),
	 (20,'резина для пустыни 1x2',9,' кг',496.0,36.0,NULL,24876.00,NULL,1);
INSERT INTO public."Material" ("ID","Title","CountinPack","Unit","CountinStock","MinCount","Description","Cost","Image","MaterialtypeID") VALUES
	 (21,'резина для пустыни 1x3',5,' кг',222.0,9.0,NULL,21546.00,NULL,1),
	 (22,'резина для пустыни 2x0',5,' кг',769.0,14.0,NULL,17425.00,NULL,1),
	 (23,'резина для пустыни 2x1',10,' кг',918.0,12.0,NULL,34518.00,NULL,1),
	 (24,'резина для пустыни 2x3',5,' м',103.0,38.0,NULL,55679.00,NULL,1),
	 (25,'резина для пустыни 3x2',1,' м',931.0,43.0,NULL,5854.00,NULL,1),
	 (26,'резина для пустыни 3x3',9,' м',840.0,11.0,NULL,5144.00,NULL,1),
	 (27,'Шипы для зимы 0x1',3,' г',255.0,25.0,NULL,6484.00,NULL,2),
	 (28,'Шипы для зимы 2x0',3,' шт',466.0,8.0,NULL,34841.00,NULL,2),
	 (29,'Шипы для зимы 3x0',6,' г',192.0,48.0,NULL,9260.00,NULL,2),
	 (30,'Шипы для зимы 3x3',4,' г',652.0,33.0,NULL,15159.00,NULL,2);
INSERT INTO public."Material" ("ID","Title","CountinPack","Unit","CountinStock","MinCount","Description","Cost","Image","MaterialtypeID") VALUES
	 (31,'Шипы для лета 0x1',2,' кг',974.0,35.0,NULL,28825.00,NULL,2),
	 (32,'Шипы для лета 2x0',1,' г',68.0,43.0,NULL,8206.00,NULL,2),
	 (33,'Шипы для лета 2x2',4,' г',15.0,10.0,NULL,44506.00,NULL,2),
	 (34,'Шипы для лета 3x1',6,' кг',184.0,40.0,NULL,51974.00,NULL,2),
	 (35,'Шипы для лета 3x2',1,' г',547.0,11.0,NULL,43288.00,NULL,2),
	 (36,'Шипы для льда 0x0',2,' кг',585.0,37.0,NULL,21188.00,NULL,2),
	 (37,'Шипы для льда 0x1',2,' шт',147.0,8.0,NULL,49557.00,NULL,2),
	 (38,'Шипы для льда 1x0',10,' г',914.0,22.0,NULL,25538.00,NULL,2),
	 (39,'Шипы для льда 1x1',7,' г',335.0,33.0,NULL,48279.00,NULL,2),
	 (40,'Шипы для льда 2x0',4,' шт',214.0,15.0,NULL,17996.00,NULL,2);
INSERT INTO public."Material" ("ID","Title","CountinPack","Unit","CountinStock","MinCount","Description","Cost","Image","MaterialtypeID") VALUES
	 (41,'Шипы для льда 2x1',10,' шт',634.0,25.0,NULL,23287.00,NULL,2),
	 (42,'Шипы для льда 2x2',1,' г',479.0,22.0,NULL,13077.00,NULL,2),
	 (43,'Шипы для льда 2x3',10,' шт',237.0,7.0,NULL,27105.00,NULL,2),
	 (44,'Шипы для льда 3x0',9,' г',885.0,5.0,NULL,52272.00,NULL,2),
	 (45,'Шипы для льда 3x1',8,' г',123.0,43.0,NULL,42668.00,NULL,2),
	 (46,'Шипы для льда 3x2',3,' г',470.0,26.0,NULL,6511.00,NULL,2),
	 (47,'Шипы для пустыни 0x1',4,' шт',612.0,24.0,NULL,55689.00,NULL,2),
	 (48,'Шипы для пустыни 0x2',4,' г',792.0,46.0,NULL,8571.00,NULL,2),
	 (49,'Шипы для пустыни 3x1',4,' г',37.0,43.0,NULL,27104.00,NULL,2),
	 (50,'Шипы для пустыни 3x2',2,' г',923.0,19.0,NULL,28748.00,NULL,2);

INSERT INTO public."ProductType" ("ID","Title","DefectedPercent") VALUES
	 (1,'Диск',0.0),
	 (2,'Запаска',0.0),
	 (3,'Колесо',0.0),
	 (4,'Шина',0.0);

INSERT INTO public."Product" ("ID","Title","ProductTypeID","ArticleNumber","Description","Image","ProductionPersonCount","ProductionWorkshopNumber","MinCostForAgent") VALUES
	 (1,'Диск R15 Лето',1,'347427',NULL,NULL,1,1,5071.00),
	 (2,'Диск R16 Кованый',1,'440075',NULL,'"Product"stire_25.jpg',3,9,9068.00),
	 (3,'Диск R16 Лето',1,'251201',NULL,NULL,3,10,8149.00),
	 (4,'Диск R16 Липучка',1,'435703',NULL,NULL,5,2,9934.00),
	 (5,'Диск R17 Зима',1,'343841',NULL,NULL,3,9,12768.00),
	 (6,'Диск R17 Лето',1,'400508',NULL,'"Product"stire_24.jpg',1,4,12941.00),
	 (7,'Диск R17 Липучка',1,'282569',NULL,'"Product"stire_42.jpg',5,5,12356.00),
	 (8,'Диск R18 Зима',1,'255211',NULL,'"Product"stire_21.jpg',1,6,13239.00),
	 (9,'Диск R18 Лето',1,'317858',NULL,'"Product"stire_52.jpg',5,3,8435.00),
	 (10,'Диск R19 Зима',1,'358851',NULL,'"Product"stire_16.jpg',5,6,5695.00);
INSERT INTO public."Product" ("ID","Title","ProductTypeID","ArticleNumber","Description","Image","ProductionPersonCount","ProductionWorkshopNumber","MinCostForAgent") VALUES
	 (11,'Диск R19 Лето',1,'243152',NULL,'"Product"stire_0.jpg',1,9,6264.00),
	 (12,'Диск R19 Липучка',1,'318661',NULL,NULL,1,6,5544.00),
	 (13,'Диск R20 Зима',1,'252453',NULL,NULL,4,9,14526.00),
	 (14,'Диск R20 Лето',1,'300047',NULL,'"Product"stire_56.jpg',3,10,10323.00),
	 (15,'Диск R20 Липучка',1,'447543',NULL,'"Product"stire_3.jpg',4,8,11661.00),
	 (16,'Диск R21 Зима',1,'250714',NULL,'"Product"stire_11.jpg',5,5,8762.00),
	 (17,'Диск R21 Кованый',1,'299085',NULL,'"Product"stire_61.jpg',3,3,4757.00),
	 (18,'Диск R21 Лето',1,'449834',NULL,'"Product"stire_35.jpg',4,8,2698.00),
	 (19,'Диск R22 Зима',1,'453650',NULL,'"Product"stire_22.jpg',5,3,11459.00),
	 (20,'Диск R22 Кованый',1,'388520',NULL,'"Product"stire_19.jpg',3,2,7498.00);
INSERT INTO public."Product" ("ID","Title","ProductTypeID","ArticleNumber","Description","Image","ProductionPersonCount","ProductionWorkshopNumber","MinCostForAgent") VALUES
	 (21,'Диск R22 Лето',1,'406411',NULL,'"Product"stire_23.jpg',2,4,2904.00),
	 (22,'Диск R22 Липучка',1,'418286',NULL,'"Product"stire_4.jpg',4,2,10670.00),
	 (23,'Запаска R14 Зима',2,'440993',NULL,NULL,5,2,6020.00),
	 (24,'Запаска R14 Кованый',2,'412235',NULL,'"Product"stire_47.jpg',4,6,12891.00),
	 (25,'Запаска R14 Лето',2,'448396',NULL,'"Product"stire_32.jpg',1,5,12878.00),
	 (26,'Запаска R15 Зима',2,'251241',NULL,NULL,3,10,3874.00),
	 (27,'Запаска R15 Кованый',2,'327657',NULL,'"Product"stire_64.jpg',2,8,8667.00),
	 (28,'Запаска R15 Лето',2,'348910',NULL,'"Product"stire_50.jpg',1,9,4969.00),
	 (29,'Запаска R15 Липучка',2,'237228',NULL,'"Product"stire_18.jpg',3,8,5510.00),
	 (30,'Запаска R16 Зима',2,'394413',NULL,'"Product"stire_49.jpg',3,10,12679.00);
INSERT INTO public."Product" ("ID","Title","ProductTypeID","ArticleNumber","Description","Image","ProductionPersonCount","ProductionWorkshopNumber","MinCostForAgent") VALUES
	 (31,'Запаска R16 Кованый',2,'432234',NULL,NULL,3,7,13556.00),
	 (32,'Запаска R17 Кованый',2,'372287',NULL,'"Product"stire_57.jpg',5,3,5808.00),
	 (33,'Запаска R17 Лето',2,'331576',NULL,'"Product"stire_39.jpg',3,8,4803.00),
	 (34,'Запаска R17 Липучка',2,'327883',NULL,'"Product"stire_10.jpg',2,2,12332.00),
	 (35,'Запаска R18 Лето',2,'305509',NULL,'"Product"stire_41.jpg',1,3,5192.00),
	 (36,'Запаска R18 Липучка',2,'279256',NULL,'"Product"stire_53.jpg',4,5,9759.00),
	 (37,'Запаска R19 Зима',2,'254860',NULL,NULL,2,5,5568.00),
	 (38,'Запаска R19 Кованый',2,'390434',NULL,'"Product"stire_46.jpg',5,8,14258.00),
	 (39,'Запаска R19 Лето',2,'283112',NULL,'"Product"stire_33.jpg',3,4,3362.00),
	 (40,'Запаска R19 Липучка',2,'438383',NULL,NULL,3,1,12000.00);
INSERT INTO public."Product" ("ID","Title","ProductTypeID","ArticleNumber","Description","Image","ProductionPersonCount","ProductionWorkshopNumber","MinCostForAgent") VALUES
	 (41,'Запаска R20 Зима',2,'241577',NULL,'"Product"stire_51.jpg',2,6,9125.00),
	 (42,'Запаска R20 Кованый',2,'249737',NULL,NULL,5,5,7509.00),
	 (43,'Запаска R20 Липучка',2,'335226',NULL,NULL,1,2,9988.00),
	 (44,'Запаска R21 Зима',2,'365509',NULL,NULL,5,6,14556.00),
	 (45,'Запаска R21 Лето',2,'299112',NULL,'"Product"stire_43.jpg',2,8,3694.00),
	 (46,'Запаска R21 Липучка',2,'247470',NULL,'"Product"stire_62.jpg',1,2,10139.00),
	 (47,'Запаска R22 Зима',2,'268886',NULL,NULL,3,2,13471.00),
	 (48,'Запаска R22 Кованый',2,'341800',NULL,NULL,2,4,5447.00),
	 (49,'Запаска R22 Липучка',2,'328305',NULL,'"Product"stire_13.jpg',2,1,10116.00),
	 (50,'Запаска R23 Зима',2,'394768',NULL,'"Product"stire_8.jpg',1,9,13019.00);
INSERT INTO public."Product" ("ID","Title","ProductTypeID","ArticleNumber","Description","Image","ProductionPersonCount","ProductionWorkshopNumber","MinCostForAgent") VALUES
	 (51,'Колесо R14 Кованый',3,'429265',NULL,NULL,3,6,11838.00),
	 (52,'Колесо R15 Кованый',3,'376388',NULL,NULL,3,4,9439.00),
	 (53,'Колесо R16 Лето',3,'337577',NULL,'"Product"stire_2.jpg',1,9,10161.00),
	 (54,'Колесо R16 Липучка',3,'263261',NULL,NULL,4,1,14521.00),
	 (55,'Колесо R17 Зима',3,'381949',NULL,NULL,4,6,5902.00),
	 (56,'Колесо R17 Лето',3,'332936',NULL,'"Product"stire_28.jpg',2,1,11145.00),
	 (57,'Колесо R17 Липучка',3,'281537',NULL,NULL,1,2,4365.00),
	 (58,'Колесо R18 Зима',3,'387609',NULL,'"Product"stire_9.jpg',1,4,3445.00),
	 (59,'Колесо R18 Кованый',3,'241659',NULL,'"Product"stire_15.jpg',4,10,11509.00),
	 (60,'Колесо R18 Лето',3,'412238',NULL,'"Product"stire_14.jpg',2,7,13892.00);
INSERT INTO public."Product" ("ID","Title","ProductTypeID","ArticleNumber","Description","Image","ProductionPersonCount","ProductionWorkshopNumber","MinCostForAgent") VALUES
	 (61,'Колесо R18 Липучка',3,'332858',NULL,'"Product"stire_12.jpg',3,7,14804.00),
	 (62,'Колесо R19 Лето',3,'298778',NULL,'"Product"stire_38.jpg',1,10,7493.00),
	 (63,'Колесо R19 Липучка',3,'440973',NULL,'"Product"stire_5.jpg',4,4,8439.00),
	 (64,'Колесо R20 Зима',3,'427198',NULL,NULL,4,10,2397.00),
	 (65,'Колесо R20 Кованый',3,'445217',NULL,'"Product"stire_1.jpg',3,10,9569.00),
	 (66,'Колесо R20 Лето',3,'434626',NULL,'"Product"stire_31.jpg',5,8,11959.00),
	 (67,'Колесо R20 Липучка',3,'363664',NULL,NULL,1,8,12681.00),
	 (68,'Колесо R21 Лето',3,'276905',NULL,NULL,1,2,10343.00),
	 (69,'Колесо R21 Липучка',3,'403378',NULL,'"Product"stire_55.jpg',3,10,3626.00),
	 (70,'Шина R14 Кованый',4,'274477',NULL,'"Product"stire_34.jpg',5,5,9527.00);
INSERT INTO public."Product" ("ID","Title","ProductTypeID","ArticleNumber","Description","Image","ProductionPersonCount","ProductionWorkshopNumber","MinCostForAgent") VALUES
	 (71,'Шина R14 Лето',4,'330951',NULL,'"Product"stire_29.jpg',4,7,6786.00),
	 (72,'Шина R14 Липучка',4,'331598',NULL,'"Product"stire_17.jpg',4,1,13879.00),
	 (73,'Шина R15 Зима',4,'312952',NULL,NULL,2,5,4039.00),
	 (74,'Шина R15 Кованый',4,'274665',NULL,'"Product"stire_63.jpg',2,10,13101.00),
	 (75,'Шина R15 Липучка',4,'349418',NULL,'"Product"stire_48.jpg',1,4,6393.00),
	 (76,'Шина R16 Зима',4,'300433',NULL,NULL,4,2,2570.00),
	 (77,'Шина R16 Кованый',4,'421321',NULL,NULL,1,2,14691.00),
	 (78,'Шина R16 Лето',4,'437927',NULL,NULL,3,6,7181.00),
	 (79,'Шина R16 Липучка',4,'320970',NULL,'"Product"stire_60.jpg',1,2,2264.00),
	 (80,'Шина R17 Зима',4,'291319',NULL,'"Product"stire_54.jpg',2,4,6426.00);
INSERT INTO public."Product" ("ID","Title","ProductTypeID","ArticleNumber","Description","Image","ProductionPersonCount","ProductionWorkshopNumber","MinCostForAgent") VALUES
	 (81,'Шина R17 Кованый',4,'299692',NULL,'"Product"stire_58.jpg',3,10,11463.00),
	 (82,'Шина R17 Лето',4,'354738',NULL,'"Product"stire_20.jpg',2,10,11329.00),
	 (83,'Шина R17 Липучка',4,'280863',NULL,NULL,4,8,11695.00),
	 (84,'Шина R18 Зима',4,'444280',NULL,'"Product"stire_44.jpg',4,6,13168.00),
	 (85,'Шина R18 Кованый',4,'275809',NULL,'"Product"stire_40.jpg',4,10,3258.00),
	 (86,'Шина R18 Лето',4,'425463',NULL,NULL,4,10,11625.00),
	 (87,'Шина R18 Липучка',4,'319450',NULL,NULL,3,6,4951.00),
	 (88,'Шина R19 Зима',4,'444141',NULL,NULL,2,8,2741.00),
	 (89,'Шина R19 Кованый',4,'291359',NULL,'"Product"stire_27.jpg',5,10,14682.00),
	 (90,'Шина R19 Лето',4,'335030',NULL,NULL,4,10,4870.00);
INSERT INTO public."Product" ("ID","Title","ProductTypeID","ArticleNumber","Description","Image","ProductionPersonCount","ProductionWorkshopNumber","MinCostForAgent") VALUES
	 (91,'Шина R19 Липучка',4,'341034',NULL,'"Product"stire_36.jpg',1,5,13063.00),
	 (92,'Шина R20 Кованый',4,'330937',NULL,'"Product"stire_45.jpg',3,1,10928.00),
	 (93,'Шина R20 Липучка',4,'348553',NULL,NULL,2,2,3508.00),
	 (94,'Шина R21 Зима',4,'398710',NULL,'"Product"stire_7.jpg',2,2,9378.00),
	 (95,'Шина R21 Кованый',4,'329576',NULL,'"Product"stire_59.jpg',2,2,7989.00),
	 (96,'Шина R21 Лето',4,'266521',NULL,'"Product"stire_6.jpg',4,1,10561.00),
	 (97,'Шина R21 Липучка',4,'308647',NULL,'"Product"stire_26.jpg',4,6,12830.00),
	 (98,'Шина R22 Зима',4,'382661',NULL,NULL,1,2,10373.00),
	 (99,'Шина R22 Кованый',4,'416324',NULL,'"Product"stire_30.jpg',2,8,13841.00),
	 (100,'Шина R22 Лето',4,'406784',NULL,'"Product"stire_37.jpg',3,5,14692.00);
INSERT INTO public."ProductMaterial" ("ProductID","MaterialID","Count") VALUES
	 (2,33,18.0),
	 (2,34,13.0),
	 (2,50,16.0),
	 (6,45,15.0),
	 (7,20,5.0),
	 (7,21,11.0),
	 (7,39,8.0),
	 (7,45,4.0),
	 (8,34,19.0),
	 (10,9,9.0);
INSERT INTO public."ProductMaterial" ("ProductID","MaterialID","Count") VALUES
	 (10,40,2.0),
	 (10,41,8.0),
	 (11,17,8.0),
	 (11,40,5.0),
	 (15,46,14.0),
	 (19,1,8.0),
	 (19,9,8.0),
	 (19,17,11.0),
	 (20,17,1.0),
	 (21,5,3.0);
INSERT INTO public."ProductMaterial" ("ProductID","MaterialID","Count") VALUES
	 (22,5,10.0),
	 (22,14,14.0),
	 (22,38,4.0),
	 (24,1,11.0),
	 (24,4,18.0),
	 (24,5,16.0),
	 (24,17,6.0),
	 (24,33,15.0),
	 (24,36,1.0),
	 (24,46,9.0);
INSERT INTO public."ProductMaterial" ("ProductID","MaterialID","Count") VALUES
	 (25,25,7.0),
	 (29,34,10.0),
	 (29,46,19.0),
	 (30,10,4.0),
	 (30,18,3.0),
	 (33,30,5.0),
	 (34,9,14.0),
	 (34,32,9.0),
	 (35,27,13.0),
	 (35,33,8.0);
INSERT INTO public."ProductMaterial" ("ProductID","MaterialID","Count") VALUES
	 (35,35,13.0),
	 (38,5,6.0),
	 (39,8,8.0),
	 (39,18,13.0),
	 (39,42,11.0),
	 (45,1,4.0),
	 (45,20,19.0),
	 (49,32,8.0),
	 (53,1,14.0),
	 (53,2,2.0);
INSERT INTO public."ProductMaterial" ("ProductID","MaterialID","Count") VALUES
	 (53,49,11.0),
	 (56,3,20.0),
	 (56,11,3.0),
	 (56,14,5.0),
	 (56,36,4.0),
	 (58,1,10.0),
	 (58,40,5.0),
	 (58,48,14.0),
	 (59,11,8.0),
	 (59,35,16.0);
INSERT INTO public."ProductMaterial" ("ProductID","MaterialID","Count") VALUES
	 (59,47,20.0),
	 (60,10,10.0),
	 (60,11,4.0),
	 (60,38,9.0),
	 (61,6,5.0),
	 (61,20,6.0),
	 (61,30,12.0),
	 (61,34,14.0),
	 (63,8,15.0),
	 (63,24,5.0);
INSERT INTO public."ProductMaterial" ("ProductID","MaterialID","Count") VALUES
	 (63,50,5.0),
	 (66,15,14.0),
	 (70,4,9.0),
	 (70,7,14.0),
	 (70,37,14.0),
	 (70,47,10.0),
	 (71,48,12.0),
	 (72,3,3.0),
	 (72,6,3.0),
	 (72,30,10.0);
INSERT INTO public."ProductMaterial" ("ProductID","MaterialID","Count") VALUES
	 (72,32,9.0),
	 (75,4,2.0),
	 (82,40,6.0),
	 (84,2,14.0),
	 (84,23,9.0),
	 (91,2,5.0),
	 (91,21,19.0),
	 (91,25,13.0),
	 (91,34,12.0),
	 (92,8,11.0);
INSERT INTO public."ProductMaterial" ("ProductID","MaterialID","Count") VALUES
	 (92,20,5.0),
	 (94,25,3.0),
	 (94,37,4.0),
	 (96,3,11.0),
	 (96,4,3.0),
	 (97,20,18.0),
	 (97,22,2.0),
	 (97,30,13.0),
	 (97,32,16.0),
	 (100,19,14.0);
