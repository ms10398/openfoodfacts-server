#!/usr/bin/perl -w

# This file is part of Product Opener.
# 
# Product Opener
# Copyright (C) 2011-2018 Association Open Food Facts
# Contact: contact@openfoodfacts.org
# Address: 21 rue des Iles, 94100 Saint-Maur des Fossés, France
# 
# Product Opener is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

use Modern::Perl '2012';

my %Nutriments = (

alcohol	=> {
	fr => "Alcool",
	en => "Alcohol",
	es => "Alcohol",
	ar=> "?????????",
	unit => '% vol',
	it => "Alcol",
	pt => "Álcool",
	de => "Alkohol",
	he => "???????",
	ga => "Alcól",
	da => "Alkohol",
	el => "???????",
	fi => "Alkoholi",
	nl => "Alcohol",
	sv => "Alkohol",
	lv => "spirts",
	cs => "Alkohol",
	et => "Alkohol",
	hu => "Alkohol",
	pl => "Alkohol",
	sl => "Alkohol",
	lt => "Alkoholis",
	mt => "Alkohol",
	sk => "Alkohol",
	ro => "Alcool",
	bg => "???????",
},
energy	=> {
	fr => "Énergie",
	en => "Energy",
	es => "Energía",
	ar => "??????",
	unit => 'kj',
	it => "Energia",
	pt => "Energia",
	de => "Energie",
	he => "?????? - ???????",
	ga => "Fuinneamh",
	da => "Energi",
	el => "?????e?a",
	fi => "Energiav",
	nl => "Energie",
	sv => "Energi",
	lv => "Energetiska vertiba",
	cs => "Energetická hodnota",
	et => "Energia",
	hu => "Energia",
	pl => "Wartosc energetyczna",
	sl => "Energijska vrednost",
	lt => "Energine verte",
	mt => "Energija",
	sk => "Energetická hodnota",
	ro => "Valoarea energetica",
	bg => "????????? ????????",
},
proteins => {
	fr => "Protéines",
	en => "Proteins",
	es => "Proteínas",
	ar => "????????",
	it => "Proteine",
	pt => "Proteínas",
	he => "???????",
	ga => "Próitéin",
	de => "Eiweiß",
	da => "Protein",
	el => "???te??e?",
	fi => "Proteiini",
	nl => "Eiwitten",
	sv => "Protein",
	lv => "Olbaltumvielas",
	cs => "Bílkoviny",
	et => "Valgud",
	hu => "Fehérje",
	pl => "Bialko",
	sl => "Beljakovine",
	lt => "Baltymai",
	mt => "Proteini",
	sk => "Bielkoviny",
	ro => "Proteine",
	bg => "???????",
},
casein => {
	fr => 'Caséine',
	en => 'Casein',
},
nucleotides => {
	fr => 'Nucléotides',
	en => 'Nucleotides',
},
"serum-proteins" => {
	fr => "Protéines sériques",
	en => "Serum proteins",
},
carbohydrates => {
	fr => "Glucides",
	en => "Carbohydrate",
	es => "Hidratos de carbono",
	ar => "??????????????",
	it => "Carboidrati",
	pt => "Carboidratos",
	pt_pt => "Hidratos de carbono",
	de => "Kohlenhydrate",
	he => "???????",
	ga => "Carbaihiodráit",
	da => "Kulhydrat",
	el => "?dat????a?e?",
	fi => "Hiilihydraatti",
	nl => "Koolhydraten",
	sv => "Kolhydrat",
	lv => "Oglhidrati",
	cs => "Sacharidy",
	et => "Süsivesikud",
	hu => "Szénhidrát",
	pl => "Weglowodany",
	sl => "Ogljikove hidrate",
	lt => "Angliavandeniai",
	mt => "Karboidrati",
	sk => "Sacharidy",
	ro => "gGlucide",
	bg => "????????????",
},
sugars => {
	fr => "Sucres",
	en => "Sugars",
	es => "Azúcares",
	ar => "?????",
	it => "Zuccheri",
	pt => "Açúcares",
	de => "Zucker",
	he => "????",
	ga => "Siúcraí",
	da => "Sukkerarter",
	el => "S???a?a",
	fi => "Sokerit",
	nl => "Suikers",
	sv => "Sockerarter",
	lv => "Cukuri",
	cs => "Cukryv",
	et => "Suhkrud",
	hu => "Cukrok",
	pl => "Cukry",
	sl => "Sladkorjev",
	lt => "Cukrus",
	mt => "Zokkor",
	sk => "Cukry",
	ro => "Zaharuri",
	bg => "??????",
},
sucrose => {
	fr => 'Saccharose',
	en => 'Sucrose',
	es => 'Sacarosa',
	pt => 'Sacarose',
	he => '??????',
	de => 'Saccharose',

},
glucose => {
	fr => 'Glucose',
	en => 'Glucose',
	pt => 'Glucose',
	es => 'Glucosa',
	he => '??????',
	de => 'Traubenzucker',
},
fructose => {
	fr => 'Fructose',
	pt => 'Frutose',
	en => 'Fructose',
	es => 'Fructosa',
	he => '???????',
	de => 'Fruchtzucker',

},
lactose => {
	fr => 'Lactose',
	en => 'Lactose',
	pt => 'Lactose',
	es => 'Lactosa',
	he => '?????',
	de => 'Milchzucker',

},
maltose => {
	fr => 'Maltose',
	en => 'Maltose',
	pt => 'Maltose',
	es => 'Maltosa',
	he => '?????',
	de => 'Malzzucker',

},
maltodextrins => {
	fr => 'Maltodextrines',
	en => 'Maltodextrins',
	pt => 'Maltodextrinas',
	es => 'Maltodextrinas',
	he => '?????????????',
},
starch => {
	fr => "Amidon",
	en => "Starch",
	es => "Almidón",
	it => "Amido",
	pt => "Amido",
	de => "Stärke",
	he => "?????",
	ga => "Stáirse",
	da => "Stivelse",
	el => "?µ???",
	fi => "Tärkkelys",
	nl => "Zetmeel",
	sv => "Stärkelse",
	lv => "Ciete",
	cs => "Škrob",
	et => "Tärklis",
	hu => "Keményíto",
	pl => "Skrobia",
	sl => "Škroba",
	lt => "Krakmolo",
	mt => "Lamtu",
	sk => "Škrob",
	ro => "Amidon",
	bg => "????????",
},
polyols => {
	fr => "Polyols",
	en => "Sugar alcohols (Polyols)",
	es => "Azúcares alcohólicos (Polialcoholes)",
	it => "Polialcoli/polioli (alcoli degli zuccheri)",
	de => "mehrwertige Alkohole (Polyole)",
	pt => "Açúcares alcoólicos (poliálcools, polióis)",
	he => "???? ???????? (???????)",
	ga => "Polóil",
	da => "Polyoler",
	el => "??????e?",
	fi => "Polyolit",
	nl => "Polyolen",
	sv => "Polyoler",
	lv => "Polioli",
	cs => "Polyalkoholy",
	et => "Polüoolid",
	hu => "Poliolok",
	pl => "Alkohole wielowodorotlenowe",
	sl => "Poliolov",
	lt => "Polioliu",
	mt => "Polioli",
	sk => "Alkoholické cukry (polyoly)",
	ro => "Polioli",
	bg => "???????",
}, 
fat => {
	fr => "Lipides",
	en => "Fat",
	es => "Grasas",
	ar=> "??????",
	it => "Grassi",
	pt => "Gorduras",
	pt_pt => "Lípidos",
	de => "Fett",
	he => "??????",
	ga => "Saill",
	da => "Fedt",
	el => "??pa??",
	fi => "Rasva",
	nl => "Vetten",
	sv => "Fett",
	lv => "Tauki",
	cs => "Tuky",
	et => "Rasvad",
	hu => "Zsír",
	pl => "Tluszcz",
	sl => "Mašcobe",
	lt => "Riebalai",
	mt => "Xahmijiet",
	sk => "Tuky",
	ro => "Grasimi",
	bg => "???????",
},
'saturated-fat' => {
	fr => "Acides gras saturés",
	en => "Saturated fat",
	es => "Grasas saturadas",
	it =>"Acidi Grassi saturi",
	pt => "Gorduras saturadas",
	pt_pt => "Ácidos gordos saturados",
	de => "gesättigte Fettsäuren",
	he => "???? ????",
	ga => "sáSitheáin saill",
	da => "Mættede fedtsyrer",
	el => "???esµ??a ??pa??",
	es => "Ácidos grasos saturados",
	fi => "Tyydyttyneet rasvat",
	nl => "Verzadigde vetzuren",
	sv => "Mättat fett",
	lv => "Piesatinatas taukskabes",
	cs => "Nasycené mastné kyseliny",
	et => "Küllastunud rasvhapped",
	hu => "Telített zsírsavak",
	pl => "Kwasy tluszczowe nasycone",
	sl => "Nasicene mašcobe",
	lt => "Sociosios riebalu rugštys",
	mt => "Saturati xahmijiet",
	sk => "Nasýtené mastné kyseliny",
	ro => "Acizi gra?i satura?i",
	bg => "???????? ?????? ????????",
},
'butyric-acid' => {
	en => 'Butyric acid (4:0)',
	es => 'Ácido butírico (4:0)',
	pt => 'Ácido butírico (4:0)',
	fr => 'Acide butyrique (4:0)',
	he => '????? ??????? (4:0)',
},
'caproic-acid' => {
	en => 'Caproic acid (6:0)',
	es => 'Ácido caproico (6:0)',
	pt => 'Ácido capróico (6:0)',
	fr => 'Acide caproïque (6:0)',
	he => '????? ??????? (6:0)',
},
'caprylic-acid' => {
	en => 'Caprylic acid (8:0)',
	es => 'Ácido caprílico (8:0)',
	pt => 'Ácido caprílico (8:0)',
	fr => 'Acide caproïque (8:0)',
	he => '????? ??????? (8:0)',
},
'capric-acid' => {
	en => 'Capric acid (10:0)',
	es => 'Ácido cáprico (10:0)',
	pt => 'Ácido cáprico (10:0)',
	fr => 'Acide caprique (10:0)',
	he => '????? ????? (10:0)',
},
'lauric-acid' => {
	en => 'Lauric acid (12:0)',
	es => 'Ácido láurico (12:0)',
	pt => 'Ácido láurico (12:0)',
	fr => 'Acide laurique (12:0)',
	he => '????? ?????? (12:0)',
},
'myristic-acid' => {
	en => 'Myristic acid (14:0)',
	es => 'Ácido mirístico (14:0)',
	pt => 'Ácido mirístico (14:0)',
	fr => 'Acide myristique (14:0)',
	he => '????? ???????? (14:0)',
},
'palmitic-acid' => {
	en => 'Palmitic acid (16:0)',
	es => 'Ácido palmítico (16:0)',
	pt => 'Ácido palmítico (16:0)',
	fr => 'Acide palmitique (16:0)',
	he => '????? ??????? (16:0)',
},
'stearic-acid' => {
	en => 'Stearic acid (18:0)',
	es => 'Ácido esteárico (18:0)',
	pt => 'Ácido esteárico (18:0)',
	fr => 'Acide stéarique (18:0)',
	he => '????? ?????? (18:0)',
},
'arachidic-acid' => {
	en => 'Arachidic acid (20:0)',
	es => 'Ácido araquídico (20:0)',
	pt => 'Ácido araquídico (20:0)',
	fr => 'Acide arachidique / acide eicosanoïque (20:0)',
},
'behenic-acid' => {
	en => 'Behenic acid (22:0)',
	es => 'Ácido behénico (22:0)',
	pt => 'Ácido beénico (22:0)',
	fr => 'Acide béhénique (22:0)',
	he => '????? ????? (22:0)',
},
'lignoceric-acid' => {
	en => 'Lignoceric acid (24:0)',
	es => 'Ácido lignocérico (24:0)',
	pt => 'Ácido lignocérico (24:0)',
	fr => 'Acide lignocérique (24:0)',
},
'cerotic-acid' => {
	en => 'Cerotic acid (26:0)',
	es => 'Ácido cerótico (26:0)',
	pt => 'Ácido cerótico (26:0)',
	fr => 'Acide cérotique (26:0)',
},
'montanic-acid' => {
	en => 'Montanic acid (28:0)',
	es => 'Ácido montánico (28:0)',
	pt => 'Ácido montânico (28:0)',
	fr => 'Acide montanique (28:0)',
},
'melissic-acid' => {
	en => 'Melissic acid (30:0)',
	es => 'Ácido melísico (30:0)',
	pt => 'Ácido melíssico (30:0)',
	fr => 'Acide mélissique (30:0)',
},
'monounsaturated-fat' => {
	fr => "Acides gras monoinsaturés",
	en => "Monounsaturated fat",
	es => "Grasas monoinsaturadas",
	it=> "Acidi grassi monoinsaturi", 
	pt => "Gorduras monoinsaturadas",
	pt_pt => "Ácidos gordos monoinsaturados",
	de => "Einfach ungesättigte Fettsäuren",
	he => "???? ?? ???? ????",
	ga => "Monai-neamhsháitheáin saill",
	da => "Enkeltumættede fedtsyrer",
	el => "????a???esta ??pa??",
	fi => "Kertatyydyttymättömät rasvat",
	nl => "Enkelvoudig onverzadigde vetzuren",
	sv => "Enkelomättat fett",
	lv => "Mononepiesatinatas taukskabes",
	cs => "Mononenasycené mastné kyseliny",
	et => "Monoküllastumata rasvhapped",
	hu => "Egyszeresen telítetlen zsírsavak",
	pl => "Kwasy tluszczowe jednonienasycone",
	sl => "Enkrat nenasicene mašcobe",
	lt => "Mononesociosios riebalu rugštys",
	mt => "Mono-insaturati xahmijiet",
	sk => "Mononenasýtené mastné kyseliny",
	ro => "Acizi gra?i mononesatura?i",
	bg => "?????????????? ?????? ????????",
},
'omega-9-fat' => {
	fr => "Acides gras Oméga 9",
	en => "Omega 9 fatty acids",
	es => "Ácidos grasos Omega 9",
	it=> "Acidi grassi Omega 9",
	pt => "Ácidos Graxos Ômega 9",
	pt_pt => "Ácidos gordos Ómega 9",
	de => "Omega-9-Fettsäuren",
	he => "????? 9",
},
'oleic-acid' => {
	en => 'Oleic acid (18:1 n-9)',
	es => 'Ácido oleico (18:1 n-9)',
	pt => 'Ácido oleico (18:1 n-9)',
	fr => 'Acide oléique (18:1 n-9)',
	he => '????? ??????',
},
'elaidic-acid' => {
	en => 'Elaidic acid (18:1 n-9)',
	es => 'Ácido elaídico (18:1 n-9)',
	pt => 'Ácido elaídico (18:1 n-9)',
	fr => 'Acide élaïdique (18:1 n-9)',
},
'gondoic-acid' => {
	en => 'Gondoic acid (20:1 n-9)',
	es => 'Ácido gondoico (20:1 n-9)',
	pt => 'Ácido gondoico (20:1 n-9)',
	fr => 'Acide gadoléique (20:1 n-9)',
},
'mead-acid' => {
	en => 'Mead acid (20:3 n-9)',
	es => 'Ácido Mead (20:3 n-9)',
	pt => 'Ácido de Mead (20:3 n-9)',
	fr => 'Acide de Mead (20:3 n-9)',
},
'erucic-acid' => {
	en => 'Erucic acid (22:1 n-9)',
	es => 'Ácido erúcico (22:1 n-9)',
	pt => 'Ácido erúcico (22:1 n-9)',
	fr => 'Acide érucique (22:1 n-9)',
},
'nervonic-acid' => {
	en => 'Nervonic acid (24:1 n-9)',
	es => 'Ácido nervónico (24:1 n-9)',
	pt => 'Ácido nervônico (24:1 n-9)',
	pt_pt => 'Ácido nervónico (24:1 n-9)',
	fr => 'Acide nervonique (24:1 n-9)',
},
'polyunsaturated-fat' => {
	fr => "Acides gras polyinsaturés",
	en => "Polyunsaturated fat",
	es => "Grasas poliinsaturadas",
	it => "Acidi grassi polinsaturi",
	pt => "Gorduras poli-insaturadas",
	pt_pt => "Ácidos gordos polinsaturados",
	de => "Mehrfach ungesättigte Fettsäuren",
	he => "???? ?? ???? ????",
	ga => "Pola-neamhsháitheáin saill",
	da => "Flerumættede fedtsyrer",
	el => "????a???esta ??pa??",
	fi => "Monityydyttymättömät rasvat",
	nl => "Meervoudig onverzadigde vetzuren",
	sv => "Fleromättat fett",
	lv => "Polinepiesatinatas taukskabes",
	cs => "Polynenasycené mastné kyseliny",
	et => "Polüküllastumata rasvhapped",
	hu => "Többszörösen telítetlen zsírsavak",
	pl => "Kwasy tluszczowe wielonienasycone",
	sl => "Veckrat nenasicene mašcobe",
	lt => "Polinesociosios riebalu rugštys",
	mt => "Poli-insaturati xahmijiet",
	sk => "Polynenasýtené mastné kyseliny",
	ro => "Acizi gra?i polinesatura?i",
	bg => "?????????????? ?????? ????????",
},
'omega-3-fat' => {
	fr => "Acides gras Oméga 3",
	en => "Omega 3 fatty acids",
	es => "Ácidos grasos Omega 3",
	it=> "Acidi grassi Omega 3",
	pt => "Ácidos graxos Ômega 3",
	pt_pt => "Ácidos gordos Ómega 3",
	de => "Omega-3-Fettsäuren",
	he => "????? 3",
},
'alpha-linolenic-acid' => {
	en => 'Alpha-linolenic acid / ALA (18:3 n-3)',
	es => 'Ácido alfa-linolénico / ALA (18:3 n-3)',
	pt => 'Ácido alfa-linolênico / ALA (18:3 n-3)',
	pt_pt => 'Ácido alfa-linolénico / ALA (18:3 n-3)',
	fr => 'Acide alpha-linolénique / ALA (18:3 n-3)',
},
'eicosapentaenoic-acid' => {
	en => 'Eicosapentaenoic acid / EPA (20:5 n-3)',
	es => 'Ácido eicosapentaenoico / EPA (20:5 n-3)',
	pt => 'Ácido eicosapentaenóico / EPA (20:5 n-3)',
	fr => 'Acide eicosapentaénoïque / EPA (20:5 n-3)',
},
'docosahexaenoic-acid' => {
	en => 'Docosahexaenoic acid / DHA (22:6 n-3)',
	es => 'Ácido docosahexaenoico / DHA (22:6 n-3)',
	pt => 'Ácido docosa-hexaenóico / DHA (22:6 n-3)',
	fr => 'Acide docosahexaénoïque / DHA (22:6 n-3)',
},
'omega-6-fat' => {
	fr => "Acides gras Oméga 6",
	en => "Omega 6 fatty acids",
	es => "Ácidos grasos Omega 6",
	it=> "Acidi grassi Omega 6",
	pt => "Ácidos Graxos Ômega 6",
	pt_pt => "Ácidos gordos Ómega 6",
	de => "Omega-6-Fettsäuren",
	he => "????? 6",
},
'linoleic-acid' => {
	en => 'Linoleic acid / LA (18:2 n-6)',
	es => 'Ácido linoleico / LA (18:2 n-6)',
	pt => 'Ácido linoleico / LA (18:2 n-6)',
	fr => 'Acide linoléique / LA (18:2 n-6)',
},
'arachidonic-acid' => {
	en => 'Arachidonic acid / AA / ARA (20:4 n-6)',
	es => 'Ácido araquidónico / AA / ARA (20:4 n-6)',
	pt => 'Ácido araquidônico / AA / ARA (20:4 n-6)',
	pt_pt => 'Ácido araquidónico / AA / ARA (20:4 n-6)',
	fr => 'Acide arachidonique / AA / ARA (20:4 n-6)',
	he => '????? ????????? / AA / ARA (20:4 n-6)',
},
'gamma-linolenic-acid' => {
	en => 'Gamma-linolenic acid / GLA (18:3 n-6)',
	es => 'Ácido gamma-linolénico / GLA (18:3 n-6)',
	pt => 'Ácido gama-linolênico / GLA (18:3 n-6)',
	pt_pt => 'Ácido gama-linolénico / GLA (18:3 n-6)',
	fr => 'Acide gamma-linolénique / GLA (18:3 n-6)',
},
'dihomo-gamma-linolenic-acid' => {
	en => 'Dihomo-gamma-linolenic acid / DGLA (20:3 n-6)',
	es => 'Ácido dihomo-gamma-linolénico / DGLA (20:3 n-6)',
	pt => 'Ácido dihomo-gama-linolênico / DGLA (20:3 n-6)',
	pt_pt => 'Ácido dihomo-gama-linolénico / DGLA (20:3 n-6)',
	fr => 'Acide dihomo-gamma-linolénique / DGLA (20:3 n-6)',
},

'trans-fat' => {
	fr => "Acides gras trans",
	en => "Trans fat",
	es => "Grasas trans",
	it => "Acidi grassi trans",
	pt => "Gorduras trans",
	pt_pt => "Ácidos gordos trans",
	de => "Trans-Fettsäuren",
	he => "???? ????? - ???? ???? ????",
},
cholesterol => {
	fr => "Cholestérol",
	en => "Cholesterol",
	es => "Colesterol",
	ar=> "??????????? ",
	unit => "mg",
	it=> "Colesterolo",
	pt => "Colesterol",
	de => "Cholesterin",
	he => "????????",
},
fiber => {
	fr => "Fibres alimentaires",
	en => "Dietary fiber",
	es => "Fibra alimentaria",
	it=> "Fibra alimentare",
	pt => "Fibra alimentar",
	de => "Ballaststoffe",
	he => "????? ????????",
	ga => "Snáithín",
	da => "Kostfibre",
	el => "ed?d?µe? ??e?",
	fi => "Ravintokuitu",
	nl => "Vezels",
	sv => "Fiber",
	lv => "Škiedrvielas",
	cs => "Vláknina",
	et => "Kiudained",
	hu => "Rost",
	pl => "Blonnik",
	sl => "Prehranskih vlaknin",
	lt => "Skaiduliniu medžiagu",
	mt => "Fibra alimentari",
	sk => "Vláknina",
	bg => "????????",
},
sodium => {
	fr => "Sodium",
	en => "Sodium",
	es => "Sodio",
	ar => "????????",
	it => "Sodio",
	pt => "Sódio",
	de => "Natrium",
	he => "????",
},
salt => {
	fr => "Sel",
	en => "Salt",
	es => "Sal",
	pt => "Sal",
	he => "???",
	de => "Salz",
	ga => "Salann",
	da => "Salt",
	el => "???t?",
	fi => "Suola",
	it => "Sale",
	nl => "Zout",
	lv => "Sals",
	cs => "Sul",
	et => "Sool",
	pl => "Sól",
	sl => "Sol",
	lt => "Druska",
	mt => "Melh",
	sk => "Sol",
	ro => "Sare",
	bg => "???",
},
'salt-equivalent' => {
	fr => "Equivalent en sel",
	en => "Salt equivalent",
	es => "Equivalente en sal",
	pt => "Equivalente em sal",
	he => "?????? ???",
},
'#vitamins' => {
	fr => "Vitamines",
	en => "Vitamin",
	es => "Vitaminas",
	ar => "???????????",
	it => "Vitamine",
	pt => "Vitaminas",
	de => "Vitamine",
	he => "????????",
	ga => "Vitimín",
	el => "??taµ???",
	fi => "vitamiini",
	nl => "Vitamine",
	lv => "vitamins",
	et => "Vitamiin",
	hu => "vitamin",
	pl => "Witamina",
	lt => "Vitaminas",
	mt => "Vitamina",
	sk => "Vitamín",
	ro => "Vitamina",
	bg => "???????",
},
'vitamin-a' => {
	fr => "Vitamine A (rétinol)",
	en => "Vitamin A",
	es => "Vitamina A (Retinol)",
	unit => "µg",
	dv => "1500",
	it => "Vitamina A (Retinolo)",
	pt => "Vitamina A",
	de => "Vitamin A (Retinol)",
	he => "?????? A (??????)",
	ga => "Vitimín A",
	el => "??taµ??? A",
	fi => "A-vitamiini",
	nl => "Vitamine A",
	lv => "A vitamins",
	et => "Vitamiin A",
	hu => "A-vitamin",
	pl => "Witamina A",
	lt => "Vitaminas A",
	mt => "Vitamina A",
	sk => "Vitamín A",
	ro => "Vitamina A",
	bg => "??????? A",
},
'vitamin-d' => {
	fr => "Vitamine D / D3 (cholécalciférol)",
	en => "Vitamin D",
	es => "Vitamina D",
	unit => "µg",
	dv => "40",
	it => "Vitamina D (colecalciferolo)",
	pt => "Vitamina D",
	de => "Vitamin D / D3 (Cholecalciferol)",
	he => "?????? D",
	ga => "Vitimín D",
	el => "??taµ??? D",
	fi => "D-vitamiini",
	nl => "Vitamine D",
	lv => "D vitamins",
	et => "Vitamiin D",
	hu => "D-vitamin",
	pl => "Witamina D",
	lt => "Vitaminas D",
	mt => "Vitamina D",
	sk => "Vitamín D",
	ro => "Vitamina D",
	bg => "??????? D",
},
'vitamin-e' => {
	fr => "Vitamine E (tocophérol)",
	en => "Vitamin E",
	es => "Vitamina E (a-tocoferol)",
	unit => "mg",
	dv => "20",
	it => "Vitamina E (Alfa-tocoferolo)",
	pt => "Vitamina E",
	de => "Vitamin E (Tocopherol)",
	he => "?????? E (???? ????????)",
	ga => "Vitimín E",
	el => "??taµ??? E",
	fi => "E-vitamiini",
	nl => "Vitamine E",
	lv => "E vitamins",
	et => "Vitamiin E",
	hu => "E-vitamin",
	pl => "Witamina E",
	lt => "Vitaminas E",
	mt => "Vitamina E",
	sk => "Vitamín E",
	ro => "Vitamina E",
	bg => "??????? E",
},
'vitamin-k' => {
	fr => "Vitamine K",
	en => "Vitamin K",
	es => "Vitamina K",
	unit => "µg",
	dv => "80",
	it => "Vitamina K",
	pt => "Vitamina K",
	de => "Vitamin K",
	he => "?????? K (??????)",
	ga => "Vitimín K",
	el => "??taµ??? K",
	fi => "K-vitamiini",
	nl => "Vitamine K",
	lv => "K vitamins",
	et => "Vitamiin K",
	hu => "K-vitamin",
	pl => "Witamina K",
	lt => "Vitaminas K",
	mt => "Vitamina K",
	sk => "Vitamín K",
	ro => "Vitamina K",
	bg => "??????? K",
},
'vitamin-c' => {
	fr => "Vitamine C (acide ascorbique)",
	en => "Vitamin C (ascorbic acid)",
	es => "Vitamina C (Ácido ascórbico)",
	unit => "mg",
	dv => "60",
	it => "Vitamina C (Acido ascorbico)",
	pt => "Vitamina C",
	de => "Vitamin C (Ascorbinsäure)",
	he => "?????? C (????? ????????)",
	ga => "Vitimín C",
	el => "??taµ??? C",
	fi => "C-vitamiini",
	nl => "Vitamine C",
	lv => "C vitamins",
	et => "Vitamiin C",
	hu => "C-vitamin",
	pl => "Witamina C",
	lt => "Vitaminas C",
	mt => "Vitamina C",
	sk => "Vitamín C",
	ro => "Vitamina C",
	bg => "??????? C",
},
'vitamin-b1' => {
	fr => "Vitamine B1 (Thiamine)",
	en => "Vitamin B1 (Thiamin)",
	es => "Vitamina B1 (Tiamina)",
	unit => "mg",
	dv => "1.5",
	it => "Vitamina B1 (tiamina)",
	pt => "Vitamina B1 (Tiamina)",
	de => "Vitamin B1 (Thiamin)",
	he => "?????? B1 (??????)",
	ga => "Vitimín B1 (Tiaimín)",
	el => "??taµ??? B1 (Te?aµ???)",
	fi => "B1-vitamiini (Tiamiini)",
	nl => "Vitamine B1 (Thiamine)",
	lv => "B1 vitamins (Tiamins)",
	et => "Vitamiin B1 (Tiamiin)",
	hu => "B1-vitamin (Tiamin)",
	pl => "Witamina B1 (Tiamina)",
	sl => "Vitamin B1 (Tiamin)",
	lt => "Vitaminas B1 (Tiaminas)",
	mt => "Vitamina B1 (Tiamina)",
	sk => "Vitamín B1",
	ro => "Vitamina B1 (Tiamina)",
	bg => "??????? B1 (??????)",
},
'vitamin-b2' => {
	fr => "Vitamine B2 (Riboflavine)",
	en => "Vitamin B2 (Riboflavin)",
	es => "Vitamina B2 (Riboflavina)",
	unit => "mg",
	dv => "1.7",
	it => "Vitamina B2 (Riboflavina)",
	pt => "Vitamina B2 (Riboflavina)",
	de => "Vitamin B2 (Riboflavin)",
	he => "?????? B2 (?????????)",
	ga => "Vitimín B2 (Ribeaflaivin)",
	el => "??taµ??? B2 (??ß?f?aß???)",
	fi => "B2-vitamiini (Riboflaviini)",
	nl => "Vitamine B2 (Riboflavine)",
	lv => "B2 vitamins (Riboflavins)",
	et => "Vitamiin B2 (Riboflaviin)",
	hu => "B2-vitamin (Riboflavin)",
	pl => "Witamina B2 (Ryboflawina)",
	lt => "Vitaminas B2 (Riboflavinas)",
	mt => "Vitamina B2 (Riboflavina)",
	sk => "Vitamín B2",
	ro => "Vitamina B2 (Riboflavina)",
	bg => "??????? B2 (??????????)",
},
'vitamin-pp' => {
	fr => "Vitamine B3 / Vitamine PP (Niacine)",
	en => "Vitamin B3 / Vitamin PP (Niacin)",
	es => "Vitamina B3 / Vitamina PP (Niacina)",
	unit => "mg",
	dv => "20",
	it => "Vitamina B3 / Vitamina PP (Niacina)",
	pt => "Vitamina B3 / Vitamina PP (Niacina)",
	de => "Vitamin B3 / Vitamin PP (Niacin)",
	he => "?????? B3 /?????? PP (?????? ?? ????? ?????????)",
	ga => "Niaicin",
	el => "??as???",
	fi => "Niasiini",
	nl => "Niacine",
	lv => "Niacins",
	et => "Niatsiin",
	pl => "Niacyna",
	lt => "Niacinas",
	mt => "Niacina",
	sk => "Niacín",
	ro => "Niacina",
	bg => "??????",
},	
'vitamin-b6' => {
	fr => "Vitamine B6 (Pyridoxine)",
	en => "Vitamin B6 (Pyridoxin)",
	es => "Vitamina B6 (Piridoxina)",
	unit => "mg",
	dv => "2",
	it => "Vitamina B6 (piridoxina)",
	pt => "Vitamina B6 (Piridoxina)",
	de => "Vitamin B6 (Pyridoxin)",
	he => "?????? B6 (??????????)",
	ga => "Vitimín B6",
	el => "??taµ??? B6",
	fi => "B6-vitamiini",
	nl => "Vitamine B6",
	lv => "B6 vitamins",
	et => "Vitamiin B6",
	hu => "B6-vitamin",
	pl => "Witamina B6",
	lt => "Vitaminas B6",
	sk => "Vitamín B6",
	ro => "Vitamina B6",
	bg => "??????? B6",
},
'vitamin-b9' => {
	fr => "Vitamine B9 (Acide folique)",
	en => "Vitamin B9 (Folic acid)",
	es => "Vitamina B9 (Ácido fólico)",
	unit => "µg",
	dv => "400",
	it => "Vitamina B9 (Acido folico)",
	pt => "Vitamina B9 (Ácido Fólico)",
	de => "Vitamin B9 (Folsäure)",
	he => "?????? B9 (????? ?????)",
	ga => "Vitimín B9 (Aigéad fólach)",
	el => "??taµ??? B9 (F????? ???)",
	fi => "B9-vitamiini (Foolihappo)",
	nl => "Vitamine B9 (Foliumzuur)",
	lv => "B9 vitamins (Folijskabe)",
	et => "Vitamiin B9 (Foolhape)",
	hu => "B9-vitamin (Folsav)",
	pl => "Witamina B9 (Kwas foliowy)",
	lt => "Vitaminas B9 (Folio rugštis)",
	sk => "Vitamín B9 (Kyselina listová)",
	ro => "Vitamina B9 (Acid folic)",
	bg => "??????? B9 (??????? ????????)",
},
'vitamin-b12' => {
	fr => "Vitamine B12 (cobalamine)",
	en => "Vitamin B12 (cobalamin)",
	es => "Vitamina B12 (Cianocobalamina)",
	unit => "µg",
	dv => "6",
	it => "Vitamina B12 (Cobalamina)",
	pt => "Vitamina B12 (Cobalamina)",
	de => "Vitamin B12 (Cobalamin)",
	he => "?????? B12 (?????????????)",
	ga => "Vitimín B12",
	el => "??taµ??? B12",
	fi => "B12-vitamiini",
	nl => "Vitamine B12",
	lv => "B12 vitamins",
	et => "Vitamiin B12",
	hu => "B12-vitamin",
	pl => "Witamina B12",
	lt => "Vitaminas B12",
	sk => "Vitamín B12",
	ro => "Vitamina B12",
	bg => "??????? ?12",
},
'biotin' => {
	fr => "Biotine (Vitamine B8 / B7 / H)",
	en => "Biotin",
	es => "Vitamina B7 (Biotina)",
	unit => "µg",
	dv => "300",
	it => "Vitamina B8/B7/H/I (Biotina)",
	pt => "Vitamina B7 (Biotina)",
	de => "Biotin (Vitamin B8 / B7 / H)",
	he => "?????? (?????? B7)",
	ga => "Bitin",
	el => "???t???",
	fi => "Biotiini",
	nl => "Biotine",
	lv => "Biotins",
	et => "Biotiin",
	pl => "Biotyna",
	lt => "Biotinas",
	sk => "Biotín",
	ro => "Biotina",
	bg => "??????",
},	
'pantothenic-acid' => {
	fr => "Acide pantothénique (Vitamine B5)",
	en => "Panthotenic acid (Vitamin B5)",
	es => "Vitamina B5 (Ácido pantoténico)",
	unit => "mg",
	dv => "10",
	it => "Vitamina B5 (Acido pantotenico)",
	pt => "Vitamina B5 (Ácido Pantotênico)",
	pt_pt => "Vitamina B5 (ácido pantoténico)",
	de => "Pantothensäure (Vitamin B5)",
	he => "????? ???????? (?????? B5)",
	ga => "Aigéad pantaitéineach",
	da => "Pantothensyre",
	el => "?a?t??e???? ???",
	fi => "Pantoteenihappo",
	nl => "Pantotheenzuur",
	sv => "Pantotensyra",
	lv => "Pantotenskabe",
	cs => "Kyselina pantothenová",
	et => "Pantoteenhape",
	hu => "Pantoténsav",
	pl => "Kwas pantotenowy",
	sl => "Pantotenska kislina",
	lt => "Pantoteno rugštis",
	mt => "Acidu Pantoteniku",
	sk => "Kyselina pantotenová",
	ro => "Acid pantotenic",
	bg => "??????????? ????????",
},	
'#minerals' => {
	fr => "Sels minéraux",
	en => "Minerals",
	es => "Sales minerales",
	it => "Sali minerali",
	pt => "Sais Minerais",
	de => "Minerals",
	he => "???????",
},
potassium => {
	fr => "Potassium",
	en => "Potassium",
	es => "Potasio",
	unit => "mg",
	it => "Potassio",
	pt => "Potássio",
	de => "Kalium",
	he => "?????",
	ga => "Potaisiam",
	da => "Kalium",
	el => "?????",
	fi => "Kalium",
	nl => "Kalium",
	sv => "Kalium",
	lv => "Kalijs",
	cs => "Draslík",
	et => "Kaaliumv",
	hu => "Kálium",
	pl => "Potas",
	sl => "Kalij",
	lt => "Kalis",
	mt => "Potassju",
	sk => "Draslík",
	ro => "Potasiu",
	bg => "?????",
},
bicarbonate => {
	fr => "Bicarbonate",
	en => "Bicarbonate",
	es => "Bicarbonato",
	unit => "mg",
	it => "Bicarbonato",
	pt => "Bicarbonato",
	de => "Bikarbonat",
	he => "???????? (???? ?????)",
},
chloride => {
	fr => "Chlorure",
	en => "Chloride",
	es => "Cloro",
	unit => "mg",
	dv => "3400",
	it => "Cloruro",
	pt => "Cloreto",
	de => "Chlor",
	he => "??????",
	ga => "Clóiríd",
	da => "Chlorid",
	el => "??????",
	fi => "Kloridi",
	sv => "Klorid",
	lv => "Hloridsv",
	cs => "Chlor",
	et => "Kloriid",
	hu => "Klorid",
	pl => "Chlor",
	sl => "Klorid",
	lt => "Chloridas",
	mt => "Kloridu",
	sk => "Chlorid",
	ro => "Clorura",
	bg => "??????",
},
silica => {
	fr => "Silice",
	en => "Silica",
	es => "Sílice",
	unit => "mg",
	it => "Silicio",
	pt => "Sílica",
	de => "Kieselerde",
	he => "???? ????????",
},
calcium => {
	fr => "Calcium",
	en => "Calcium",
	es => "Calcio",
	ar => "?????????",
	unit => "mg",
	dv => "1000",
	it => "Calcio",
	pt => "Cálcio",
	de => "Kalzium",
	he => "????",
	ga => "Cailciam",
	el => "?sß?st??",
	fi => "Kalsium",
	sv => "Kalcium",
	lv => "Kalcijs",
	cs => "Vápník",
	et => "Kaltsium",
	hu => "Kalcium",
	pl => "Wapn",
	sl => "Kalcij",
	lt => "Kalcis",
	mt => "Kalcju",
	sk => "Vápnik",
	ro => "Calciu",
	bg => "??????",
},
phosphorus => {
	fr => "Phosphore",
	en => "Phosphorus",
	es => "Fósforo",
	ar => "????????",
	unit => "mg",
	dv => "1000",
	it => "Fosforo",
	pt => "Fósforo",
	de => "Phosphor",
	he => "????",
	ga => "Fosfar",
	da => "Phosphor",
	el => "F?sf????",
	fi => "Fosfori",
	nl => "Fosfor",
	sv => "Fosfor",
	lv => "Fosfors",
	cs => "Fosfor",
	et => "Fosfor",
	hu => "Foszfor",
	pl => "Fosfor",
	sl => "Fosfor",
	lt => "Fosforas",
	mt => "Fosfru",
	sk => "Fosfor",
	ro => "Fosfor",
	bg => "??????",
},
iron => {
	fr => "Fer",
	en => "Iron",
	es => "Hierro",
	unit => "mg",
	dv => "18",
	it => "Ferro",
	pt => "Ferro",
	de => "Eisen",
	he => "????",
	ga => "Iarann",
	da => "Jern",
	el => "S?d????",
	fi => "Rauta",
	nl => "IJzer",
	sv => "Järn",
	lv => "Dzelzs",
	cs => "Železo",
	et => "Raud",
	hu => "Vas",
	pl => "Zelazo",
	sl => "Železo",
	lt => "Geležis",
	mt => "Kalcju",
	sk => "Železo",
	ro => "Fier",
	bg => "??????",
},
magnesium => {
	fr => "Magnésium",
	en => "Magnesium",
	es => "Magnesio",
	unit => "mg",
	dv => "400",
	it => "Magnesio",
	pt => "Magnésio",
	de => "Magnesium",
	he => "???????",
	ga => "Maignéisiam",
	el => "?a???s??",
	lv => "Magnijs",
	cs => "Horcík",
	et => "Magneesium",
	hu => "Magnézium",
	pl => "Magnez",
	sl => "Magnezij",
	lt => "Magnis",
	mt => "Manjesju",
	sk => "Horcík",
	ro => "Magneziu",
	bg => "????????",
},
zinc => {
	fr => "Zinc",
	en => "Zinc",
	es => "Zinc",
	unit => "mg",
	dv => "15",
	it => "Zinco",
	pt => "Zinco",
	de => "Zink",
	he => "???",
	ga => "Sinc",
	da => "Zink",
	el => "?e?d???????",
	fi => "Sinkki",
	nl => "Zink",
	sv => "Zink",
	lv => "Cinks",
	cs => "Zinek",
	et => "Tsink",
	hu => "Cink",
	pl => "Cynk",
	sl => "Cink",
	lt => "Cinkas",
	mt => "Zingu",
	sk => "Zinok",
	bg => "????",
},
copper => {
	fr => "Cuivre",
	en => "Copper",
	es => "Cobre",
	unit => "mg",
	dv => "2",
	it => "Rame",
	pt => "Cobre",
	de => "Kupfer",
	he => "?????",
	ga => "Copar",
	da => "Kobber",
	el => "?a????",
	fi => "Kupari",
	nl => "Koper",
	sv => "Koppar",
	lv => "Varš",
	cs => "Med",
	et => "Vask",
	hu => "Réz",
	pl => "Miedz",
	sl => "Baker",
	lt => "Varis",
	mt => "Ram",
	sk => "Med",
	ro => "Cupru",
	bg => "???",
},
manganese => {
	fr => "Manganèse",
	en => "Manganese",
	es => "Manganeso",
	unit => "mg",
	dv => "2",
	it => "Manganese",
	pt => "Manganês",
	de => "Mangan",
	he => "????",
	ga => "Mangainéis",
	da => "Mangan",
	el => "?a??????",
	fi => "Mangaani",
	nl => "Mangaan",
	sv => "Mangan",
	lv => "Mangans",
	cs => "Mangan",
	et => "Mangaan",
	hu => "Mangán",
	pl => "Mangan",
	sl => "Mangan",
	lt => "Manganas",
	mt => "Manganis",
	sk => "Mangán",
	ro => "Mangan",
	bg => "??????",
},
fluoride => {
	fr => "Fluorure",
	en => "Fluoride",
	es => "Flúor",
	unit => "mg",
	it => "Fluoro",
	pt => "Fluoreto",
	de => "Fluor",
	he => "????????",
	ga => "Fluairíd",
	da => "Fluorid",
	el => "F?????",
	fi => "Fluoridi",
	sv => "Fluorid",
	lv => "Fluorids",
	cs => "Fluor",
	et => "Fluoriid",
	hu => "Fluor",
	pl => "Fluor",
	sl => "Fluorid",
	lt => "Fluoridas",
	mt => "Floridu",
	sk => "Fluorid",
	ro => "Fluorura",
	bg => "???????",
},
selenium => {
	fr => "Sélénium",
	en => "Selenium",
	es => "Selenio",
	unit => "µg",
	dv => "70",
	it => "Selenio",
	pt => "Selênio",
	pt_pt => "Selénio",
	de => "Selen",
	he => "??????",
	ga => "Seiléiniam",
	da => "Selen",
	el => "Se?????",
	fi => "Seleeni",
	nl => "Seleen",
	sv => "Selen",
	lv => "Selens",
	cs => "Selen",
	et => "Seleen",
	hu => "Szelén",
	pl => "Selen",
	sl => "Selen",
	lt => "Selenas",
	mt => "Selenju",
	sk => "Selén",
	ro => "Seleniu",
	bg => "?????",
},
chromium => {
	fr => "Chrome",
	en => "Chromium",
	es => "Cromo",
	unit => "µg",
	dv => "120",
	it => "Cromo",
	pt => "Cromo",
	pt_pt => "Crómio",
	de => "Chrom",
	he => "????",
	ga => "Cróimiam",
	da => "Chrom",
	el => "???µ??",
	fi => "Kromi",
	nl => "Chroom",
	sv => "Krom",
	lv => "Hroms",
	cs => "Chrom",
	et => "Kroom",
	hu => "Króm",
	pl => "Chrom",
	sl => "Krom",
	lt => "Chromas",
	mt => "Kromju",
	sk => "Chróm",
	ro => "Crom",
	bg => "????",
},
molybdenum => {
	fr => "Molybdène",
	en => "Molybdenum",
	es => "Molibdeno",
	unit => "µg",
	dv => "75",
	it => "Molibdeno",
	pt => "Molibdênio",
	pt_pt => "Molibdénio",
	de => "Molybdän",
	he => "???????",
	ga => "Molaibdéineam",
	da => "Molybdæn",
	el => "????ßda????",
	fi => "Molybdeeni",
	nl => "Molybdeen",
	sv => "Molybden",
	lv => "Molibdens",
	cs => "Molybden",
	et => "Molübdeen",
	hu => "Molibdén",
	pl => "Molibden",
	sl => "Molibden",
	lt => "Molibdenas",
	mt => "Molibdenum",
	sk => "Molybdén",
	ro => "Molibden",
	bg => "????????",
},
iodine => {
	fr => "Iode",
	en => "Iodine",
	es => "Yodo",
	unit => "µg",
	dv => "150",
	it=> "Iodio",
	pt => "Iodo",
	de => "Jod",
	he => "???",
	ga => "Iaidín",
	da => "Jod",
	el => "??d??",
	fi => "Jodi",
	nl => "Jood",
	sv => "Jod",
	lv => "Jods",
	cs => "Jód",
	et => "Jood",
	hu => "Jód",
	pl => "Jod",
	sl => "Jod",
	lt => "Jodas",
	mt => "Jodju",
	sk => "Jód",
	ro => "Iod",
	bg => "???",
},
caffeine => {
	fr => 'Caféine / Théine',
	en => 'Caffeine',
},
taurine => {
	fr => 'Taurine',
	en => 'Taurine',
},

ph => {
	en => "pH",
	unit => '',
},

"carbon-footprint" => {
	fr => "Empreinte carbone / émissions de CO2",
	en => "Carbon footprint / CO2 emissions",
	es => "Huella de carbono / Emisiones de CO2",
	unit => 'g',
	it=> "Emissioni di CO2 (impronta climatica)",
	pt => "Pegada de carbono / Emissões de CO<sub>2</sub>",
	de => "Carbon Footprint / CO2-Emissionen",
	he => "????? ??? ?????? / ????? ???? ????????",
},
"fruits-vegetables-nuts" => {
	en => "Fruits, vegetables and nuts (minimum)",
	fr => "Fruits, légumes et noix (minimum)",
	unit => '%',
},
"nutrition-score-uk" => {
	en => "Nutrition score - UK",
	unit => '',
},
"nutrition-score-fr" => {
	fr => "Score nutritionnel expérimental - France",
	en => "Experimental nutrition score",
	unit => '',
},

);

1;
