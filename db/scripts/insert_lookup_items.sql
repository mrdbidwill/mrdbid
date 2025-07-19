INSERT INTO `lookup_items` ( mr_character_id, name, description, comments, data_source_id, created_at, updated_at) VALUES  -- refer to mr_characters table
(1, 'id',       '','',5, now(), now() ),                      -- 1 id
(2, 'None',     '','',5, now(), now() ),                      -- 2 abundance
(2, 'Low',      '','',5, now(), now() ),
(2, 'Moderate', '','',5, now(), now() ),
(2, 'High',     '','',5, now(), now() ),
(3,'Button','very young','',1, now(), now() ),                 -- 3 mushroom_age
(3,'Young','','',1, now(), now() ),
(3,'Mature','','',1, now(), now() ),
(3,'Past Prime','','',1, now(), now() ),
(4,'None','','',5, now(), now() ),                              -- 4 odor
(4,'Fruity','','',5, now(), now() ),
(4,'Lemony','','',5, now(), now() ),
(4,'Anise (licorice)','','',5, now(), now() ),
(4,'Farinaceous (like fresh meal)','','',5, now(), now() ),
(4,'Pungent','','',5, now(), now() ),
(4,'Nauseous','','',5, now(), now() ),
(4,'Nitrous','','',5, now(), now() ),
(4,'Earthy','','',5, now(), now() ),
(4,'Spermatic','','',5, now(), now() ),
(4,'Garlic','','',4, now(), now() ),
(4,'Maraschino cherries','','',4, now(), now() ),
(4,'Sewer gas','','',4, now(), now() ),
(4,'spicy - red hots - dirty socks','','',4, now(), now() ),
(5,'None','','',5, now(), now() ),                                 -- 5 taste
(5,'Mild','','',5, now(), now() ),
(5,'Bitter','','',5, now(), now() ),
(5,'Acrid (= puckery? astringent)/Peppery','','',5, now(), now() ),
(5,'Agreeable','','',5, now(), now() ),
(5,'Farinaceous (like fresh meal)','','',5, now(), now() ),
(6,'Not Toxic','','',2, now(), now() ),                              -- 6 toxic
(6,'Toxic','','',2, now(), now() ),
(7,'Single, solitary','','',5, now(), now() ),                       -- 7 habit
(7,'Scattered (1-2 feet apart)','','',5, now(), now() ),
(7,'Gregarious (growing in a group)','','',5, now(), now() ),
(7,'Caespitose (clustered, not joined)','','',5, now(), now() ),
(7,'Connate (fused at base)','','',5, now(), now() ),
(7,'Imbricate (overlapping)','','',5, now(), now() ),
(7,'In troops or rings','','',5, now(), now() ),
(8,'pileus_width','','',5, now(), now() ),                          -- 8 pileus_width
(9,'pileus_height','','',5, now(), now() ),                         -- 9 pileus_height
(10,'Convex','evenly rounded','',5, now(), now() ),                               -- 10 pileus_shape
(10, 'Convex','evenly rounded','',5, now(), now() ),
(10,'ovoid','egg','',5, now(), now() ),
(10,'conic','cone','',5, now(), now() ),
(10,'campanulate','bell-shaped.','vv',5, now(), now() ),
(10,'parabolic','half-egg','',5, now(), now() ),
(10,'pulvinate','cushion','',5, now(), now() ),
(10,'cylindric','bullet','',5, now(), now() ),
(10,'plane','flat','',5, now(), now() ),
(10,'conchate','sea-shell','',5, now(), now() ),
(10,'umbonate','w/bump','',5, now(), now() ),
(10,'cuspidate','Umbonate with a pointy conical apex; Witch-hat shaped. also known as eye-tooth.','',5, now(), now() ),
(10,'papillate','w/nipple','',5, now(), now() ),
(10,'depressed','Saucer-shaped; The center is lower than the cap margin.','',5, now(), now() ),
(10,'umbilicate','a navel-like depression in the center.','',5, now(), now() ),
(10,'infundibuliform','funnel-shaped','',5, now(), now() ),
(11,'Petaloid','petal','',5, now(), now() ),                                     -- 11 pileus_shape_top_view
(11,'Spathulate','spatula','',5, now(), now() ),
(11,'Dimidiate','1/2 circle','',5, now(), now() ),
(11,'Flabelliform','fan-shaped','',5, now(), now() ),
(12,'Pileus Color','','',5, now(), now() ),                                     -- 12 pileus_color
(13,'Pileus Color Disc','','',5, now(), now() ),                                -- 13 pileus_color_disc
(14,'Pileus Color Margin','','',5, now(), now() ),                              -- 14 pileus_color_margin
(15,'Pileus Color Background','','',5, now(), now() ),                          -- 15 pileus_color_background
(16,'Pileus Color Fibrils','','',5, now(), now() ),                              -- 16 pileus_color_fibrils
(17,'Pileus Color Bruised','','',5, now(), now() ),                              -- 17 pileus_color_bruised
(18,'Pileus Color Wet','','',5, now(), now() ),                                  -- 18 pileus_color_wet
(19,'Pileus Color Dry','','',5, now(), now() ),                                  -- 19 pileus_color_dry
(20,'dry: Dull','','',5, now(), now() ),                                          -- 20 pileus_surface_dryness
(20,'dry:  Silky','','',5, now(), now() ),
(20,'Moist:  lubricous/greasy','','',5, now(), now() ),
(20,'Moist: Glutinous (slimy)','','',5, now(), now() ),
(20,'dry: Shiny','','',5, now(), now() ),
(21,'Smooth','No defining features found on the surface.','',7, now(), now() ),                             -- 21 pileus_surface_texture
(21,'Uneven','A bumpy surface.','',7, now(), now() ),
(21,'Rugose','A wrinkled or rough surface.','',7, now(), now() ),
(21,'Rugulose','A slightly wrinkled surface.','',7, now(), now() ),
(21,'Rivulose','A thinly wrinkled surface of branching wavy or crooked lines.','',7, now(), now() ),
(21,'Scrobiculate','A pitted or furrowed surface.','',7, now(), now() ),
(21,'Warty','Remnants of the universal veil remain on the surface in small patches.','',7, now(), now() ),
(21,'Virgate','A streaked surface.','',7, now(), now() ),
(21,'Hygrophanous','A surface that is transparent when wet and opaque when dry.','',7, now(), now() ),
(21,'Sericeous','A silky surface.','',7, now(), now() ),
(21,'Fibrillose','A surface covered in thread-like filaments.','',7, now(), now() ),
(21,'Squamose','A surface covered with scales.','',7, now(), now() ),
(21,'Squarrose','A ragged surface covered with small scales.','',7, now(), now() ),
(21,'Pruinose','A surface covered with a white powdery frostlike substance.','',7, now(), now() ),
(21,'Pulverulent','A surface covered with fine dust or powder.','',7, now(), now() ),
(21,'Granulose','A surface covered in salt-like granulates.','',7, now(), now() ),
(21,'Furfuraceous','A surface covered in flaky bran-like particles; dandruff-like.','',7, now(), now() ),
(21,'Zonate','A surface containing zones or bands that are distinguished by texture or color.','',7, now(), now() ),
(21,'Areolate','A cracked surface resembling dried-mud or paint.','',7, now(), now() ),
(21,'Rimose','A surface covered in cracks and crevices.','',7, now(), now() ),
(21,'Laccate','A waxy or lacquered surface texture.','',7, now(), now() ),
(21, 'Viscid -','A sticky glue-like surface texture.','',7, now(), now() ),
(21,'Glutinous','A slimy surface.','',7, now(), now() ),
(21,'Glabrous - Hairy','Hairy - a bald surface.','',7, now(), now() ),
(21,'Velvety - Hairy','Hairy - A surface covered with very fine and soft hairs.','',7, now(), now() ),
(21,'Pubescent - Hairy','Hairy - A surface cover with fuzz or fine hairs.','',7, now(), now() ),
(21,'Canescent - Hairy','Hairy - A surface covered in dense white or gray down-like hairs. Giving a frosted appearance.','',7, now(), now() ),
(21,'Floccose - Hairy','Hairy - A surface covered in Wooly or cotton-like hairs.','',7, now(), now() ),
(21,'Tomentose - Hairy','Hairy - A surface covered densely with matted hairs.','',7, now(), now() ),
(21,'Hispid - Hairy','Hairy - A surface covered with straight bristle-like hairs.','',7, now(), now() ),
(21,'Hirsute - Hairy','Hairy - A surface covered with slightly stiff and shaggy hairs.','',7, now(), now() ),
(21,'Villose - Hairy','Hairy - A surface covered with long soft hairs.','',7, now(), now() ),
(21,'Strigose - Hairy','Hairy - A surface covered with long bristle-like hairs.','',7, now(), now() ),
(22,'Straight','The margins remain uniform and do not curve.','edited 3-8-2023',7, now(), now() ),                                         -- 22 pileus_margin_shape
(22,'Decurved','The margins curve slightly downwards.','',7, now(), now() ),
(22,'Incurved','The margins curve down and inwards.','',7, now(), now() ),
(22,'Involute','The margins curve downwards and roll inwards. Also known as inrolled.','',7, now(), now() ),
(22,'Arched','The margins curve upwards between the edge and stipe (stem).','',7, now(), now() ),
(22,'Uplifted','The margins curve upwards. Also known as elevated.','',7, now(), now() ),
(22,'Revolute','The margins curve inwards and also rolled back..','',7, now(), now() ),
(22,'Exceeding','The margins extend past the gills.','',7, now(), now() ),
(23,'Entire','There is a smooth transition from the top of the cap to its underside. No irregular attributes should be present on the edges. Also referred to as Smooth, Even, Seamless, Flush, or Regular.','',7, now(), now() ),   -- 23 pileus_margin_type
(23,'Appendiculate','Remnants of a partial veil hang from the edge of the cap.','',7, now(), now() ),
(23,'Striate','Fine and narrow stripes run parallel on the cap margins. The lines will often coincide with the gills underneath the cap. In some cases, the lines are only visible when the cap is wet. Also referred to as striped, furrowed, streaked, ribbed, lined,','',7, now(), now() ),
(23,'Sulcate','Narrow parallel grooves that line the margins of the cap. Sulcate margins are more defined than striate but less ridged than plicated. Also referred to as plicate-striate.','',7, now(), now() ),
(23,'Plicate','Parallel pleated margins. They are best described as fan-like or umbrella-like as if the surface of the cap were folded. Plicate margins are more defined and ridged than Striate or Sulcate. Also referred to as pleated or ridged.','',7, now(), now() ),
(23,'Eroded','Deteriorated, gnawed, or eaten away. The disfigured margins are usually found in older specimens and are the result of insects or deliquescence (common with Ink Caps). Also referred to as gnawed or ragged.','',7, now(), now() ),
(23,'Split','The edges of the cap are split apart or full of large crevices. Also referred to as cracked or rimose.','',7, now(), now() ),
(23,'Lacerate','Many tears mark the edge of the cap. Similar to split margins, however, the cuts are smaller and more frequent. Also referred to as torn.','',7, now(), now() ),
(23,'Undulating - Hairy','Hairy - The edges of the cap form a wave-like pattern as they rise and fall. Also referred to as wavy irregular or festoony.','',7, now(), now() ),
(23,'Crenate - Hairy','Hairy - Semi-circle notches or round-toothed edges that are more blunted than serrate margins. Also referred to as scalloped.','',7, now(), now() ),
(23,'Serrate - Hairy','Hairy - The edges of the cap appear jagged and saw-toothed. More pronounced than crenate margins.','',7, now(), now() ),
(24,'pileus_hairy_y_n','','',7, now(), now() ),                                                                                                                            -- 24 pileus_hairy_y_n
(25,'pileus_context_flesh_color_moist',6,1,3, now(), now() ),                                                           -- 25 pileus_context_flesh_color_moist
(26,'pileus_context_flesh_color_dry',6,1,3, now(), now() ),                                               -- 26  pileus_context_flesh_color_dry
(27,'pileus_context_flesh_color_cuticle',6,1,3, now(), now() ),                         -- 27  pileus_context_flesh_color_cuticle
(28,'pileus_context_flesh_thickness_disc',2,1,3, now(), now() ),                                    -- 28  pileus_context_flesh_thickness_disc
(29,'pileus_context_flesh_thickness_margin',2,1,3, now(), now() ),                                              -- 29 pileus_context_flesh_thickness_margin
(30,'Soft','','',5, now(), now() ),                                               -- 30 pileus_context_flesh_texture
(30,'Spongy','','',5, now(), now() ),
(30,'Firm','','',5, now(), now() ),
(30,'Compact','','',5, now(), now() ),
(30,'Rigid','','',5, now(), now() ),
(30,'Brittle','','',5, now(), now() ),
(30,'Corky','','',5, now(), now() ),
(30,'Other','','',5, now(), now() ),
(31,'pileus_context_flesh_latex_color',6,1,3, now(), now() ),                     -- 31  'pileus_context_flesh_latex_color
(32,'pileus_context_flesh_latex_color_exposed',6,1,3, now(), now() ),                                        -- 32  pileus_context_flesh_latex_color_exposed
(33,'pileus_context_flesh_latex_taste',7,1,3, now(), now() ),                            -- 33  pileus_context_flesh_latex_taste
(34,'pileus_context_flesh_latex_abundance',15,1,3, now(), now() ),                -- 34   pileus_context_flesh_latex_abundance
(35,'Free - remote','','',5, now(), now() ),                                  -- 35 lamella_attachment
(35,'Free - close','','',5, now(), now() ),
(35,'Adnate - horizontal','','',5, now(), now() ),
(35,'Adnate - ascending','','',5, now(), now() ),
(35,'Adnexed (almost free)','','',5, now(), now() ),
(35,'Sinuate','','',5, now(), now() ),
(35,'Emarginate (notched)','','',5, now(), now() ),
(35,'Decurrent - long','','',5, now(), now() ),
(35,'Decurrent - short','','',5, now(), now() ),
(35,'Seceding (breaking away)','','',5, now(), now() ),
(35,'Uncinate (w/decurrent tooth)','','',5, now(), now() ),
(35,'Collared','Gills are attached to a collar or ring that encircles the stipe.','',7, now(), now() ),
(36,'Broad','','',5, now(), now() ),                     -- 36 lamella_breadth
(36,'Free - close','','',5, now(), now() ),
(36,'Ventricose','','',5, now(), now() ),
(37,'Average','','',5, now(), now() ),      -- 37 lamella_thickness
(37,'Thick','','',5, now(), now() ),
(37,'Tapering','','',5, now(), now() ),
(38,'Crowded','The Gills are tightly close together.','',7, now(), now() ),   -- 38 lamella_spacing
(38,'Close','The Gills are close together.','',7, now(), now() ),
(38,'Subdistant','The gills are spaced apart.','',7, now(), now() ),
(38,'Distant','The gills are widely spaced apart.','',7, now(), now() ),
(39,'lamella_color_young',6,1,4, now(), now() ),                              -- 39 lamella_color_young
(40,'lamella_color_mature',6,1,4, now(), now() ),                       -- 40  lamella_color_mature
(41,'Even - entire','','',5, now(), now() ),   -- 41 lamella_edge
(41,'Serrate','','',5, now(), now() ),
(41,'Serrulate','','',5, now(), now() ),
(41,'Eroded (\"gnawed\")','','',5, now(), now() ),
(41,'Fimbriate (fringed)','','',5, now(), now() ),
(41,'Marginate (diff. color)','','',5, now(), now() ),
(41,'Crenate (scalloped)','','',5, now(), now() ),
(41,'Acute','','',5, now(), now() ),
(41,'Obtuse (blunt)','','',5, now(), now() ),
(41,'Crisped (crinkled)','','',5, now(), now() ),
(41,'lamella_misc_waxy_y_n',14,1,4, now(), now() ),
(41,'lamella_misc_arid_dry_y_n',14,1,4, now(), now() ),
(41,'lamella_misc_deliquescent_y_n',14,1,4, now(), now() ),
(42,'lamella_misc_waxy_y_n',14,1,4, now(), now() ),          -- 42 lamella_misc_deliquescent_y_n
(43,'lamella_misc_arid_dry_y_n',14,1,4, now(), now() ),        -- 43 lamella_misc_arid_dry_y_n
(44,'lamella_misc_deliquescent_y_n',14,1,4, now(), now() ),        -- 44  lamella_misc_deliquescent_y_n
(45,'Central','','',5, now(), now() ),                            -- 45 stipe location
(45,'Eccentric - off-center','','',5, now(), now() ),
(45,'Lateral - attached at margin','','',5, now(), now() ),
(45,'Sessile - missing','','',5, now(), now() ),
(46,'stipe_height',2,1,5, now(), now() ),                     -- 46 stipe_height
(47,'stipe_diameter_top',2,1,5, now(), now() ),                       -- 47 stipe_diameter_top
(48,'stipe_diameter_mid',2,1,5, now(), now() ),               -- 48  stipe_diameter_mid
(49,'stipe_diameter_low',2,1,5, now(), now() ),                       -- 49 stipe_diameter_low
(50,'Terete (round)','','',5, now(), now() ),                  -- 50 stipe shape
(50,'Compressed (flattened)','','',5, now(), now() ),
(50,'Equal','','',5, now(), now() ),
(50,'Clavate (club)','','',5, now(), now() ),
(50,'Radicating (w/\"root\")','','',5, now(), now() ),
(50,'Flexous','','',5, now(), now() ),
(50,'Ventricose Fusiform','','',5, now(), now() ),
(50,'Tapering','','',5, now(), now() ),
(50,'Abruptly bulbous','','',5, now(), now() ),
(50,'Rounded','','',5, now(), now() ),
(50,'Oblique (angle)','','',5, now(), now() ),
(50,'Marginate','','',5, now(), now() ),
(51,'stipe_color',6,1,5, now(), now() ),                 -- 51  stipe_color
(52,'stipe_color_change',6,1,5, now(), now() ),        -- 52 stipe_color_change
(53,'stipe_color_base',6,1,5, now(), now() ),                  -- 53 stipe_color_base
(54,'stipe_color_apex',6,1,5, now(), now() ),          -- 54 stipe_color_apex
(55,'stipe_color_interior',6,1,5, now(), now() ),               -- 55 stipe_color_interior
(56,'stipe_color_exterior',6,1,5, now(), now() ),    -- 56 stipe_color_exterior
(57,'stipe_color_bruise',6,1,5, now(), now() ),             -- 57 stipe_color_bruise
(58,'Smooth','No defining features found on the surface.','',7, now(), now() ),   -- 58 stipe_surface
(58,'Uneven','A bumpy surface.','',7, now(), now() ),
(58,'Rugose','A wrinkled or rough surface.','',7, now(), now() ),
(58,'Rugulose','A slightly wrinkled surface.','',7, now(), now() ),
(58,'Rivulose','A thinly wrinkled surface of branching wavy or crooked lines.','',7, now(), now() ),
(58,'Scrobiculate','A pitted or furrowed surface.','',7, now(), now() ),
(58,'Warty','Remnants of the universal veil remain on the surface in small patches.','',7, now(), now() ),
(58,'Virgate','A streaked surface.','',7, now(), now() ),
(58,'Hygrophanous','A surface that is transparent when wet and opaque when dry.','',7, now(), now() ),
(58,'Sericeous','A silky surface.','',7, now(), now() ),
(58,'Fibrillose','A surface covered in thread-like filaments.','',7, now(), now() ),
(58,'Squamose','A surface covered with scales.','',7, now(), now() ),
(58,'Squarrose','A ragged surface covered with small scales.','',7, now(), now() ),
(58,'Pruinose','A surface covered with a white powdery frostlike substance.','',7, now(), now() ),
(58,'Pulverulent','A surface covered with fine dust or powder.','',7, now(), now() ),
(58,'Granulose','A surface covered in salt-like granulates.','',7, now(), now() ),
(58,'Furfuraceous','A surface covered in flaky bran-like particles; dandruff-like.','',7, now(), now() ),
(58,'Zonate','A surface containing zones or bands that are distinguished by texture or color.','',7, now(), now() ),
(58,'Areolate','A cracked surface resembling dried-mud or paint.','',7, now(), now() ),
(58,'Rimose','A surface covered in cracks and crevices.','',7, now(), now() ),
(58,'Laccate','A waxy or lacquered surface texture.','',7, now(), now() ),
(58, 'Viscid -','A sticky glue-like surface texture.','',7, now(), now() ),
(58,'Glutinous','A slimy surface.','',7, now(), now() ),
(58,'Glabrous - Hairy','Hairy - a bald surface.','',7, now(), now() ),
(58,'Velvety - Hairy','Hairy - A surface covered with very fine and soft hairs.','',7, now(), now() ),
(58,'Pubescent - Hairy','Hairy - A surface cover with fuzz or fine hairs.','',7, now(), now() ),
(58,'Canescent - Hairy','Hairy - A surface covered in dense white or gray down-like hairs. Giving a frosted appearance.','',7, now(), now() ),
(58,'Floccose - Hairy','Hairy - A surface covered in Wooly or cotton-like hairs.','',7, now(), now() ),
(58,'Tomentose - Hairy','Hairy - A surface covered densely with matted hairs.','',7, now(), now() ),
(58,'Hispid - Hairy','Hairy - A surface covered with straight bristle-like hairs.','',7, now(), now() ),
(58,'Hirsute - Hairy','Hairy - A surface covered with slightly stiff and shaggy hairs.','',7, now(), now() ),
(58,'Villose - Hairy','Hairy - A surface covered with long soft hairs.','',7, now(), now() ),
(58,'Strigose - Hairy','Hairy - A surface covered with long bristle-like hairs.','',7, now(), now() ),
(58,'Banded','','',5, now(), now() ),
(58,'Peronate','','',5, now(), now() ),
(58,'Fibrous','','',5, now(), now() ),
(58,'Lacunose (w/dp.grooves)','','',5, now(), now() ),
(58,'Longitudinally striate','','',5, now(), now() ),
(58,'Ribbed/Costate','','',5, now(), now() ),
(58,'Scabrous (scabby)','','',5, now(), now() ),
(58,'Punctuate (w/small dots)','','',5, now(), now() ),
(58,'Glanular-dotted (w/dark sticky dots)','','',5, now(), now() ),
(58,'Reticulate (fishnet)','','',5, now(), now() ),
(59,'Fragile','','',5, now(), now() ),                              -- 59 stipe_texture
(59,'Pliable','','',5, now(), now() ),
(59,'Chalky','','',5, now(), now() ),
(59,'Rigid','','',5, now(), now() ),
(59,'Fibrous (Fleshy-Fibrous)','usually rather thick, and when broken in two, leaves a ragged edge.','',5, now(), now() ),
(59,'Cartilaginous','Common stipe, usually thin and breaks with a firm split when bent in two, similar to cartilage.','',13, now(), now() ),
(59,'Firm','','',5, now(), now() ),
(59,'Woody','','',13, now(), now() ),
(59,'Corky','','',13, now(), now() ),
(59,'Leathery (coriaceous)','','',13, now(), now() ),
(59,'Chalky','feels and breaks like chalk in hand. When crushed, it breaks up into powder or chunks.','',13, now(), now() ),
(59,'Breaking with a snap','','',5, now(), now() ),
(60,  'Solid',             '','', 5, now(), now() ),            -- 60 stipe_interior
(60,  'Hollow - fistulose','','', 5, now(), now() ),
(60,  'Tubular',           '','', 5, now(), now() ),
(60,  'Cavernous',         '','', 5, now(), now() ),
(60,  'Stuffed with pith', '','', 5, now(), now() ),
(61,'None','Does not have annulus ring','',5, now(), now() ),   -- 61 partial_inner_veil_annular_ring_position
(61,'Superior','Near the cap','',5, now(), now() ),
(61,'Apical','upper half','',5, now(), now() ),
(61,'Median','in the middle','',5, now(), now() ),
(61,'Inferior','Lower half','',5, now(), now() ),
(61,'Basal','Near the base','',5, now(), now() ),
(62,'veil_annulus',4,1,6, now(), now() ),              -- 62 veil_annulus ? not sure about this one
(63,'partial_inner_veil_color',6,1,6, now(), now() ),      -- 63  partial_inner_veil_color
(64,'Membranous (skin-like)','','',5, now(), now() ),   -- 64 partial_inner_veil_texture
(64,'Cortinate (cobwebby)','','',5, now(), now() ),
(64,'Fibillose (thready)','','',5, now(), now() ),
(64,'Gelatinous (slimy)','','',5, now(), now() ),
(65,'Disappearing - Evanescent','can only be detected in button stage','',4, now(), now() ),  -- 65 partial_inner_veil_fate
(65,'Persistent','leaving remnants on cap','',4, now(), now() ),
(66,'partial_inner_veil_annular_ring',4,1,6, now(), now() ),  -- 66 partial_inner_veil_annular_ring ?? chek this
(67,'Two Rings (from 2 veils)','','',5, now(), now() ),  -- 67  partial_inner_veil_appearance
(67,'Doubly-flared Ring','','',5, now(), now() ),
(67,'\"Cogwheel\" Stellate','','',5, now(), now() ),
(67,'Floccose (downy tuffs)','','',5, now(), now() ),
(67,'Cortinate PV & Fibrillose Annular Zone','','',5, now(), now() ),
(67,'Single Ring thick on edge','','',5, now(), now() ),
(67,'Pendant (hanging)','','',5, now(), now() ),
(67,'Subperonate','','',5, now(), now() ),
(67,'Peronate (w/\"boot\")','','',5, now(), now() ),
(68,'universal_outer_veil_description',4,1,6, now(), now() ),     -- 68  universal_outer_veil_description ??
(69,'universal_outer_veil_volva',4,1,6, now(), now() ),        -- 69   universal_outer_veil_volva  ??
(70,'Napiform (turnip)','','',5, now(), now() ),                         -- 70 bulb_type
(70,'Saccate','','',5, now(), now() ),
(70,'Sheathing','','',5, now(), now() ),
(70,'Collar','','',5, now(), now() ),
(70,'Granular','','',5, now(), now() ),
(70,'Concentric rings or scales','','',5, now(), now() ),
(70,'Friable, disappearing','','',5, now(), now() ),
(70,'Fusiform','','',5, now(), now() ),
(70,'Marginate-depressed','','',5, now(), now() ),
(70,'Cleft','','',5, now(), now() ),
(71,'mycelium_color',6,1,7, now(), now() ),                 -- 71 mycelium_color
(72,'mycelium_texture',13,1,7, now(), now() ),         -- 72 mycelium_texture
(73,'spore_color',6,1,8, now(), now() ),          -- 73 spore_color
(74,'spore_range_low',3,1,8, now(), now() ),            -- 74 spore_range_low
(75,'spore_range_high',3,1,8, now(), now() ),     -- 75 spore_range_high
(76,'Terrestrial (on soil - bare )','','',5, now(), now() ),           -- 76 habitat
(76,'Terrestrial (on soil - burned )','','',5, now(), now() ),
(76,'Terrestrial (on soil - disturbed )','','',5, now(), now() ),
(76,'Lignicolous (on wood) - what kind of tree?','','',5, now(), now() ),
(76,'Humicolous (on humus, duff) - conifer, other?','','',5, now(), now() ),
(76,'Coprophious (on dung) what kind?','','',5, now(), now() ),
(76,'In grassy area - lawn, pasture, etc?','','',5, now(), now() ),
(76,'In forest - conifer, hardwood, mixed?','','',5, now(), now() ),
(76,'fungicolous','mushroom mycelia grow in other mushrooms','p 7, How to Identify Mushrooms to Genus I: Macroscopic Features - David L. Largent',13,'2023-03-16 21:46:17','2023-03-16 21:46:17'),
(77,'Unknown','','',1, now(), now() ),                                  -- 77 soil_type
(77,'Loam','','',1, now(), now() ),
(78,'soil_temp',4,1,11, now(), now() ),                -- 78 soil_temp
(79,'air_temp',4,1,11, now(), now() ),          -- 79 air_temp
(80,'plant_association',9,1,11, now(), now() ),    -- 80 plant_association
(81,'rhizomorph_color',6,1,12, now(), now() ),               -- 81 rhizomorph_color
(82,'rhizomorph_texture',13,1,12, now(), now() ),    -- 82 rhizomorph_texture
(83,'Ammonia (NH4OH, Ammonium Hydroxide)','','',8, now(), now() ),  -- 83 chem_reaction
(83,'KOH (Potassium Hydroxide) - 3%','','',8, now(), now() ),
(84,'weight_before_dry',4,1,17, now(), now() ),              -- 84  weight_before_dry
(85,'weight_after_dry',4,1,17, now(), now() ),     -- 85    weight_after_dry
(86,'elevation',4,1,11, now(), now() ),                      -- 86 elevation
(87,'soil_ph',4,1,11, now(), now() ),                   -- 87  soil_ph
(88,'stipe_latex_color_exposed',6,1,5, now(), now() ),            -- 88  stipe_latex_color_exposed
(89,'stipe_latex_taste',7,1,5, now(), now() ),        -- 89 stipe_latex_taste
(90,'stipe_latex_abundance',15,1,5, now(), now() ),       -- 90
(91,'mycobank_name',5,1,16, now(), now() ),                       -- 91  mycobank_name
(92,'inaturalist_num',5,1,16, now(), now() ),            -- 92 inaturalist_num
(93,'mushroom_observer_num',5,1,16, now(), now() ),               -- 93 mushroom_observer_num
(94,'location_found_latitude',5,1,15, now(), now() ),    -- 94 location_found_latitude
(95,'location_found_longitude',5,1,15, now(), now() ),            -- 95 location_found_longitude
(96,'project_belong_to',9,1,16, now(), now() ),             -- 96 project_belong_to
(97,'microscope_slides_included',14,1,17, now(), now() ),           -- 97 microscope_slides_included
(98,'preservation_method',9,1,17, 1, now(), now() ),           -- 98 preservation-method
(99,'Superior','Near the cap','',7, now(), now() ),      --  99 annulus_position
(99,'Apical','upper half', '',   7, now(), now() ),
(99,'Median','in the middle','', 7, now(), now() ),
(99,'Inferior','Lower half','',  7, now(), now() ),
(99,'Basal','Near the base','',  7, now(), now() ),
(100,'Observation Only - No specimen collected','','None',2, now(), now() ),              -- 100 mushroom_storage_location
(100,'Specimen Collector','This is you, if you collected this specimen','',2, now(), now() ),
(100,'Herbarium','','',2, now(), now() ),
(101, 'USA', 'United States', '',  23, now(), now() ),  -- 101 countries
(101, 'MEX', 'Mexico',        '',  23, now(), now() ),
(101, 'CAN', 'Canada',        '',  23, now(), now() ),
(102,'text_box_number_mm','','',1, now(), now() ),           -- 102 display_options
(102,'text_box_number_um','','',1, now(), now() ),
(102,'text_box_number','','',1, now(), now() ),
(102,'text_box_string','','',1, now(), now() ),
(102,'color','','',1, now(), now() ),
(102,'taste','','',1, now(), now() ),
(102,'odor','','',1, now(), now() ),
(102,'radio','','',1, now(), now() ),
(102,'drop-down','','',1, now(), now() ),
(102,'state','','',1, now(), now() ),
(102,'country','','',1, now(), now() ),
(102,'texture','','',1, now(), now() ),
(102,'yes no','','',1,now(), now() ),
(102,'abundance','','',1,now(), now() ),
(102,'text box number grams measurement','','',1,now(), now() ),
(102,'Genus Species','','',1,now(), now() ),
(103,'Admin','','',1, now(), now() ),                                           -- 103 parts
(103,'Basic','default data that every specimen will have','',5, now(), now() ),
(103,'Macro - Pileus - Cap','','',5, now(), now() ),
(103,'Macro - Lamellae - Gills','','',5, now(), now() ),
(103,'Macro - Stipe - Stem','','',5, now(), now() ),
(103,'Macro - Veil','','',5, now(), now() ),
(103,'Macro - Mycelium','','',5, now(), now() ),
(103,'Macro - Spores','micro for spores is here - not in micro','',5, now(), now() ),
(103,'Macro - Chemical Reaction','','',5, now(), now() ),
(103,'Macro -General','','',5, now(), now() ),
(103,'Low Magnification','','',5, now(), now() ),
(103,'Micro - Pileus - Cap','','',5, now(), now() ),
(103,'Micro - Lamellae - Gills','','',5, now(), now() ),
(103,'Micro - Stipe - Stem','','',5, now(), now() ),
(103,'Micro - Veil','','',5, now(), now() ),
(103,'Micro - Mycelium','','',5, now(), now() ),
(103,'Micro - Spores','','',5, now(), now() ),
(103,'Micro - Chemical Reaction','','',5, now(), now() ),
(103,'Micro -General','','',5, now(), now() ),
(103,'DNA','','',5, now(), now() ),
(103,'Habitat','Habitat, Plant Assoc ','',5, now(), now() ),
(103,'Rhizomorph','','',5, now(), now() ),
(103,'Color','this will allow color selection for ALL color characters to be in one place','',1, now(), now() ),
(103,'Location','lat lon city county state country','',1, now(), now() ),
(103,'Identification','species genus inaturalist etc','',1, now(), now() ),
(103,'Storage','','',1, now(), now() ),
(103,'Other','','',5, now(), now() ),
(103,'Undecided','','',5, now(), now() ),
(104,'Book','','', '23',now(), now() ),                              -- 104 source_data_type
(104,'Website','','', '23', now(), now() ),
(104,'Magazine','','', '23',  now(), now() ),
(104,'Chart','like Scates','', '23', now(), now() ),
(104,'Database','','', '23', now(), now() ),
(105,'Lamella - Gills','','',1, now(), now() ),        -- 105 fungus_types
(105,'Pores','','',1, now(), now() ),
(105,'Teeth','','',1, now(), now() ),
(105,'Cups','','',1, now(), now() ),
(105,'Stinkhorn','','',1, now(), now() ),
(106,'Two Rings (from 2 veils)','','',5, now(), now() ),               -- 106 universal_outer_veil_appearances
(106,'Doubly-flared Ring','','',5, now(), now() ),
(106,'\"Cogwheel\" Stellate','','',5, now(), now() ),
(106,'Floccose (downy tuffs)','','',5, now(), now() ),
(106,'Cortinate PV & Fibrillose Annular Zone','','',5, now(), now() ),
(106,'Single Ring thick on edge','','',5, now(), now() ),
(106,'Pendant (hanging)','','',5, now(), now() ),
(106,'Subperonate','','',5, now(), now() ),
(106,'Peronate (w/\"boot\")','','',5, now(), now() ),
(107,'Disappearing','','',5, now(), now() ),                          -- 107 universal_outer_veil_fates
(107,'Leaving fragments on cap','','',5, now(), now() ),
(108,'Membranous (skin-like)','','',5, now(), now() ),                        -- 108  `universal_outer_veil_textures
(108,'Cortinate (cobwebby)','','',5, now(), now() ),
(108,'Fibillose (thready)','','',5, now(), now() ),
(108,'Gelatinous (slimy)','','',5, now(), now() ),
(109,'Flaring','The annulus is flaring upwards.','',7, now(), now() ),                                -- 109  veils
(109,'Pendant','The veil is hanging downward from the stipe.','',7, now(), now() ),
(109,'Double Rings','Two visible veils..','',7, now(), now() ),
(109,'Ring Zone','The stipe is marked with the remnants of the annulus','',7, now(), now() ),
(109,'Cortinate','The partial veil is cobweb-like or tread-like (Fibrillose)..','',7, now(), now() ),
(109,'Stellate','The partial veil resembles a cogwheel.','',7, now(), now() ),
(109,'Floccose','The partial veil is fluffy and down-like.','',7, now(), now() ),
(109,'Peronate','The stipe resembles a sheath-like boot or stocking','',7, now(), now() ),
(110,'epigeous','above-ground ','',2, now(), now() ),                                             -- 110 synonyms
(110,'hypogeous','underground','',2, now(), now() ),
(110,'mushroom','fruiting body of a fungus','',2, now(), now() ),
(110,'basidiocarp','fruiting body','',2, now(), now() ),
(110,'thallus','soma','entire body of fungus',2, now(), now() ),
(110,'sporocarp','fruiting body','',2, now(), now() ),
(110,'pileus','cap','',2, now(), now() ),
(110,'Stipe','Stalk','',2, now(), now() ),
(110,'Gills','Lamellae','',2, now(), now() ),
(110,'Volva','cup','',2, now(), now() ),
(110,'Annulus','ring','',2, now(), now() ),
(110,'cone','conical','',5, now(), now() ),
(110,'conic','conical','',5, now(), now() ),
(110,'disc','center','',5, now(), now() ),
(110,'margin','edge','',5, now(), now() ),
(110,'ring','annulus','',5, now(), now() ),
(110,'stem','stipe','',5, now(), now() ),
(110,'volva','cup','',5, now(), now() ),
(110,'convex','evenly rounded','',1, now(), now() ),
(110,'ovoid','egg','',5, now(), now() ),
(110,'campanulate','bell-shaped','',5, now(), now() ),
(110,'parabolic','half-egg','',5, now(), now() ),
(110,'pulvinate','cushion','',5, now(), now() ),
(110,'cylindric','bullet','',5, now(), now() ),
(110,'plane','flat','',5, now(), now() ),
(111,'Admin','','',1, now(), now() ),                              -- 111 parts
(111,'Basic','default data that every specimen will have','',5, now(), now() ),
(111,'Pileus - Cap','','',5, now(), now() ),
(111,'Lamellae - Gills','','',5, now(), now() ),
(111,'Stipe - Stem','','',5, now(), now() ),
(111,'Veil','','',5, now(), now() ),
(111,'Mycelium','','',5, now(), now() ),
(111,'Spores','micro for spores is here - not in micro','',5, now(), now() ),
(111,'Chemical Reaction','','',5, now(), now() ),
(111,'General','','',5, now(), now() ),
(111,'DNA','','',5, now(), now() ),
(111,'Habitat','Habitat, Plant Assoc ','',5, now(), now() ),
(111,'Rhizomorph','','',5, now(), now() ),
(111,'Color','this will allow color selection for ALL color characters to be in one place','',1, now(), now() ),
(111,'Location','lat lon city county state country','',1, now(), now() ),
(111,'Identification','species genus inaturalist etc','',1, now(), now() ),
(111,'Storage','','',1, now(), now() ),
(111,'Other','','',5, now(), now() ),
(111,'Undecided','','',5, now(), now() );