### DYK translation ############################################################

dyk_translated <- 
  tibble(en = character(), fr = character()) |>
  add_row(en = paste0("21.3% of people walk or cycle to work in areas in the h",
                      "ighest class of active living potential. In areas with ",
                      "the lowest active living potential, only 2.5% do."), 
          fr = paste0("21,3 % des personnes se rendent au travail à pied ou à ",
                      "vélo dans les zones présentant l'indice la plus élevée",
                      " de potentiel de vie active. Dans les zones présentant ",
                      "le potentiel de vie active le plus faible, seuls 2,5 % ",
                      "le font.")) |> 
  add_row(en = paste0("Two thirds of new immigrants (67.4%) live in areas with",
                      " the highest active living potential (ALE class 5)."), 
          fr = paste0("Deux tiers des nouveaux immigrants (67,4 %) vivent dans",
                      " des zones présentant le potentiel de vie active le plu",
                      "s élevé (classe 5 de l'AVA).")) |> 
  add_row(en = paste0("11% of new immigrants live in areas with the lowest act",
                      "ive living potential (ALE class 1)."), 
          fr = paste0("11 % des nouveaux immigrants vivent dans des zones prés",
                      "entant le potentiel de vie active le plus faible (class",
                      "e 1 de l'AVA).")) |> 
  add_row(en = paste0("Overall, lower income areas tend to have higher active ",
                      "living potential. But roughly 340,000 people are in Can",
                      "ALE class 3 or lower and have median household income l",
                      "ess than $50,000."), 
          fr = paste0("Dans l'ensemble, les zones à faible revenu ont tendance",
                      " à avoir un potentiel de vie active plus élevé. Mais en",
                      "viron 340 000 personnes se trouvent dans la classe AVA-",
                      "Can 3 ou inférieure et ont un revenu médian par ménage i",
                      "nférieur à 50 000 dollars.")) |> 
  add_row(en = paste0("Areas in class 4 of active living potential have the hi",
                      "ghest average dwelling values, but nearly 10% fewer ren",
                      "ters than areas with active living class 5."), 
          fr = paste0("Les zones de la classe 4 du potentiel de vie active ont",
                      " les valeurs moyennes de logement les plus élevées, mai",
                      "s près de 10% de locataires en moins que les zones de l",
                      "a classe 5 de la vie active.")) |> 
  add_row(en = paste0("Roughly 90% of the region's population lives within a 1",
                      "km walk of a transit station. The vast majority of area",
                      "s which lack access are located off the island of Montr",
                      "eal."), 
          fr = paste0("Environ 90 % de la population de la région vit à moins ",
                      "d'un kilomètre d'une station de transport en commun. La",
                      " grande majorité des zones qui manquent d'accès sont si",
                      "tuées à l'extérieur de l'île de Montréal.")) |> 
  add_row(en = paste0("Le Plateau-Mont-Royal is the borough or municipality wi",
                      "th the highest share of residents walking or biking to ",
                      "work (36%), followed by Ville Marie (32.5%)."), 
          fr = paste0("Le Plateau-Mont-Royal est l'arrondissement ou la munici",
                      "palité où la proportion de résidents se rendant au trav",
                      "ail à pied ou à vélo est la plus élevée (36 %), suivi d",
                      "e Ville Marie (32,5 %).")) |> 
  add_row(en = paste0("Saint-Isidore, Sainte-Marthe-sur-le-Lac, Pointe-Calumet",
                      ", Mascouche, Saint-Joseph-du-Lac, and Léry all have few",
                      "er than 2% of residents walking or biking to work."), 
          fr = paste0("Saint-Isidore, Sainte-Marthe-sur-le-Lac, Pointe-Calumet",
                      ", Mascouche, Saint-Joseph-du-Lac et Léry comptent tous ",
                      "moins de 2 % de résidents qui se rendent au travail à p",
                      "ied ou à vélo.")) |> 
  add_row(en = paste0("Pierrefonds-Roxboro and L'Île-Bizard-Sainte-Geneviève a",
                      "re the two Montreal boroughs with the lowest share of r",
                      "esidents walking or biking to work (fewer than 3%)."), 
          fr = paste0("Pierrefonds-Roxboro et L'Île-Bizard-Sainte-Geneviève so",
                      "nt les deux arrondissements de Montréal où la proportio",
                      "n de résidents se rendant au travail à pied ou à vélo e",
                      "st la plus faible (moins de 3 %).")) |> 
  add_row(en = paste0("Hampstead, Côte-des-Neiges-Notre-Dame-de-Grâce, and Vil",
                      "leray-Saint-Michel-Parc-Extension all have high active ",
                      "living potential (ALE class 4 or higher) but fewer than",
                      " 15% of residents walking or biking to work."), 
          fr = paste0("Hampstead, Côte-des-Neiges-Notre-Dame-de-Grâce et Ville",
                      "ray-Saint-Michel-Parc-Extension ont tous un potentiel d",
                      "e vie active élevé (classe AVA 4 ou plus) mais moins de",
                      " 15 % des résidents se rendent au travail à pied ou à v",
                      "élo.")) |> 
  add_row(en = paste0("Sainte-Julie has the highest share of residents walking",
                      " or biking to work (9.1%) of any borough or municipalit",
                      "y with low active living potential, followed by Sennevi",
                      "lle (5.8%) and Montréal-Est (5.8%)."), 
          fr = paste0("De tous les arrondissements et municipalités à faible p",
                      "otentiel de vie active, c'est à Sainte-Julie que l'on t",
                      "rouve la plus forte proportion de résidents se rendant ",
                      "au travail à pied ou à vélo (9,1 %), suivie de Sennevil",
                      "le (5,8 %) et de Montréal-Est (5,8 %).")) |> 
  add_row(en = paste0("The highest 2016 average rent in Montreal is in Westmou",
                      "nt ($1269 per month), followed by Outremont ($1137 per ",
                      "month)."), 
          fr = paste0("Le loyer moyen 2016 le plus élevé à Montréal se trouve ",
                      "à Westmount (1269 $ par mois), suivi d'Outremont (1137 ",
                      "$ par mois).")) |> 
  add_row(en = paste0("The lowest 2016 average rent in the Montreal CMA is in ",
                      "Beaconsfield ($237 per month), followed by Rosemère ($2",
                      "76) and Boucherville ($362). In the City of Montreal, t",
                      "he borough with the lowest average rent is L'Île-Bizard",
                      "-Sainte-Geneviève ($433 per month), followed by Pierref",
                      "onds-Roxboro ($545) and Rivière-des-Prairies-Pointe-aux",
                      "-Trembles ($611)."), 
          fr = paste0("Le loyer moyen 2016 le plus bas dans la Communauté métropolitaine de Montréal",
                      " se trouve à Beaconsfield (237 $ par mois), suivi de Ro",
                      "semère (276 $) et de Boucherville (362 $). Dans la Vill",
                      "e de Montréal, l'arrondissement où le loyer moyen est l",
                      "e plus bas est L'Île-Bizard-Sainte-Geneviève (433 $ par",
                      " mois), suivi de Pierrefonds-Roxboro (545 $) et de Rivi",
                      "ère-des-Prairies-Pointe-aux-Trembles (611 $).")) |> 
  add_row(en = paste0("Westmount has the highest 2016 average property value (",
                      "$1.2 million), followed by Hampstead ($1.1 million)."), 
          fr = paste0("Westmount a la valeur moyenne des propriétés la plus él",
                      "evée en 2016 (1,2 million de dollars), suivie de Hampst",
                      "ead (1,1 million de dollars).")) |> 
  add_row(en = paste0("The lowest 2016 average property value in the Montreal ",
                      "region is in Pointe-Calumet ($223,600)."), 
          fr = paste0("La valeur moyenne des propriétés la plus basse en 2016 ",
                      "dans la région de Montréal se trouve à Pointe-Calumet (",
                      "223 600 $).")) |> 
  add_row(en = paste0("Baie-d'Urfé is the borough or municipality with the low",
                      "est proportion of tenants (2.6% in 2016), followed by L",
                      "orraine (2.7%)."), 
          fr = paste0("Baie-d'Urfé est l'arrondissement ou la ville où la pr",
                      "oportion de locataires est la plus faible (2,6 % en 201",
                      "6), suivi de la Lorraine (2,7 %).")) |> 
  add_row(en = paste0("Côte-des-Neiges-Notre-Dame-de-Grâce is the borough or m",
                      "unicipality with the highest 2016 proportion of tenants",
                      " (73.7%), closely followed by Ville-Marie (73.0%) and L",
                      "e Plateau-Mont-Royal (72.8%)."), 
          fr = paste0("Côte-des-Neiges-Notre-Dame-de-Grâce est l'arrondissemen",
                      "t ou la ville ayant la plus forte proportion de ",
                      "locataires en 2016 (73,7 %), suivi de près par Ville-Ma",
                      "rie (73,0 %) et Le Plateau-Mont-Royal (72,8 %).")) |> 
  add_row(en = paste0("Anjou is the borough with the lowest 2016 proportion of",
                      " tenants experiencing housing stress (29.6%), followed ",
                      "by Saint-Léonard (29.8%)."), 
          fr = paste0("Anjou est l'arrondissement où la proportion de locatair",
                      "es en tension de logement est la plus faible en 2016 (2",
                      "9,6 %), suivi de Saint-Léonard (29,8 %).")) |> 
  add_row(en = paste0("Ville-Marie is the borough with the highest 2016 propor",
                      "tion of tenants experiencing housing stress (48.3%). Le",
                      " Plateau-Mont-Royal falls just behind with 43.9% of ten",
                      "ants experiencing housing stress."), 
          fr = paste0("Ville-Marie est l'arrondissement où la proportion de lo",
                      "cataires en difficulté de logement est la plus élevée e",
                      "n 2016 (48,3 %). Le Plateau-Mont-Royal arrive juste der",
                      "rière avec 43,9 % de locataires en situation de stress ",
                      "au logement.")) |> 
  add_row(en = paste0("Throughout the Montreal region,  26.7% of 2016 tenant h",
                      "ouseholds in the median neigbhourhood are experiencing ",
                      "housing stress. On the Island of Montreal, that figure ",
                      "rises to 31.8%."), 
          fr = paste0("Dans l'ensemble de la région de Montréal, 26,7 % des mé",
                      "nages locataires de 2016 de l'arrondissement médian connaissen",
                      "t un stress de logement. Sur l'île de Montréal, ce ch",
                      "iffre grimpe à 31,8 %.")) |> 
  add_row(en = paste0("Saint-Laurent is the borough or municipality with the h",
                      "ighest 2016 proportion of unsuitable housing (15.0%), f",
                      "ollowed by Côte-des-Neiges-Notre-Dame-de-Grâce (14.2%).",
                      ""), 
          fr = paste0("Saint-Laurent est l'arrondissement ou la ville a",
                      "yant la plus forte proportion de logements inadaptés en",
                      " 2016 (15,0 %), suivi de Côte-des-Neiges-Notre-Dame-de-",
                      "Grâce (14,2 %).")) |> 
  add_row(en = paste0("Half of neighbourhoods on the Island of Montreal have m",
                      "ore than 4.3% of 2016 households living in unsuitable h",
                      "ousing, while a quarter have more than 11.3%."), 
          fr = paste0("La moitié des quartiers de l'île de Montréal compte plu",
                      "s de 4,3 % des ménages de 2016 vivant dans un logement ",
                      "inadéquat, tandis qu'un quart en compte plus de 11,3 %.",
                      "")) |> 
  # Stories preview
  add_row(en = paste0("Little Burgundy has been the site of nearly 100 years o",
                      "f social and environmental transformation, and is curre",
                      "ntly undergoing a wave of green gentrification."), 
          fr = paste0("La Petite Bourgogne a été le théâtre de près de 100 ans",
                      " de transformations sociales et environnementales, et c",
                      "onnaît actuellement une vague de gentrification écologi",
                      "que.")) |> 
  add_row(en = paste0("Residents and government are coming together to shape t",
                      "he future of the Saint-Michel Environmental Complex, lo",
                      "cated on the site of the former Miron Quarry."), 
          fr = paste0("Les résidents et le gouvernement s'unissent pour façonn",
                      "er l'avenir du complexe environnemental de Saint-Michel",
                      ", situé sur le site de l'ancienne carrière Miron.")) |> 
  add_row(en = paste0("In the Grand Parc de L’Ouest, a renewed drive to protec",
                      "t biodiversity and create greenspace illustrates the ch",
                      "anging politics of development on the island."), 
          fr = paste0("Dans le Grand Parc de l'Ouest, une volonté renouvelée d",
                      "e protéger la biodiversité et de créer des espaces vert",
                      "s illustre l'évolution des politiques de développement ",
                      "sur l'île.")) |> 
  add_row(en = paste0("The City of Montreal claims it is looking to support pe",
                      "destrian-oriented projects as a pathway towards sustain",
                      "able mobility, but contradictions in the implementation",
                      " stage of the Turcot Interchange suggest otherwise."), 
          fr = paste0("La Ville de Montréal affirme qu'elle cherche à soutenir",
                      " les projets axés sur les piétons comme une voie vers l",
                      "a mobilité durable, mais les contradictions dans l'étap",
                      "e de mise en œuvre de l'échangeur Turcot suggèrent le c",
                      "ontraire.")) |> 
  add_row(en = paste0("Griffintown’s social and governance history can be defi",
                      "ned through the politics of water management."), 
          fr = paste0("L'histoire sociale et de gouvernance de Griffintown peu",
                      "t être définie par la politique de gestion de l'eau.")) |> 
  add_row(en = paste0("An urban prairie located in the Mile End, the Champ des",
                      " Possibles is a biodiverse green space that has a uniqu",
                      "e governance structure that was born out of community a",
                      "ctions."), 
          fr = paste0("Une prairie urbaine située dans le Mile End, le Champ de",
                      "s Possibles est un espace vert biodiversifié dont sa str",
                      "ucture de gouvernance unique est née des actions de la c",
                      "ommunauté.")) |> 
  add_row(en = paste0("Since its inception in the early 20th century, the Montr",
                      "eal metro has undergone several major transformations th",
                      "at mirror the city’s ever-changing sociopolitical landsc",
                      "ape."), 
          fr = paste0("Depuis sa création au début du XXe siècle, le métro de M",
                      "ontréal a subi plusieurs transformations majeures qui re",
                      "flètent le paysage sociopolitique en constante évolution",
                      " de la ville.")) |> 
  add_row(en = paste0("Once redeveloped, green alleys often tend to become ambi",
                      "guous spaces, a sort of common, between the public and t",
                      "he private realm. The case of Le Plateau-Mont-Royal is p",
                      "articularly interesting."), 
          fr = paste0("Une fois aménagées, les ruelles vertes tendent à devenir",
                      " des espaces ambigus, à la frontière entre sphère publiq",
                      "ue et privée. Le cas du Plateau-Mont-Royal est particuli",
                      "èrement intéressant.")) |> 
  add_row(en = paste0("Montréal is a world-renowned cycling city, but it hasn’t",
                      " always been this way. Explore how the city’s cycling in",
                      "frastructure has evolved over time in this interactive s",
                      "tory."), 
          fr = paste0("Montréal est une ville cycliste de renommée mondiale, ma",
                      "is il n'en a pas toujours été ainsi. Découvrez comment l",
                      "'infrastructure cyclable de la ville a évolué au fil du ",
                      "temps dans cette histoire interactive."))



