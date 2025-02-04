-- Formato respuesta
INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES ('ID DE LA PREGUNTA', 'VALOR SOLUCIO', 'SQL QUERY')

-- 1. Quants estadis hi ha?
SELECT COUNT(*) FROM arena;INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES ('1', '29', 'SELECT COUNT(*) FROM arena;')

-- 11. Per cada equip ret-- 2. Obté el nom i cognom de l'entrenador principal de cada franquícia. Quin és el cognom de l'entrenador de Utah Jazz?
SELECT p.name, p.INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES ('1', '29', 'SELECT COUNT(*) FROM arena;')
SELECT p.name, p.surname FROM person AS p 
JOIN headcoach AS h ON p.IDCard = h.IDCard
JOIN franchise AS f ON f.IDCardCoach = h.IDCard
WHERE f.Name = 'Utah Jazz';

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (2, 'Brooks', 'SELECT p.name, p.surname FROM person AS p 
JOIN headcoach AS h ON p.IDCard = h.IDCard
JOIN franchise AS f ON f.IDCardCoach = h.IDCard
WHERE f.Name = "Utah Jazz";');

-- 3. Troba el nom de la franquícia amb el pressupost més gran.
SELECT f.name FROM franchise AS f
ORDER BY f.budget DESC
LIMIT 1;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (3, 'Chicago Bulls', 'SELECT f.name FROM franchise AS f
ORDER BY f.budget DESC
LIMIT 1;'); 

-- 4. Llista les arenes (noms i ciutats) de les franquícies de la conferència oest. Quin és el nom de la 5a ciutat?
SELECT a.name, a.city FROM arena AS a
JOIN franchise AS f ON f.arenaName = a.name
    WHERE conferenceName = 'Western Conference';


-- 5. Llista els noms dels jugadors que han estat seleccionats en el draft en primera, segona o tercera posició al draft del 2020. Ordena pel cognom i nom del jugador (Z-A). Quin és el nom del jugador mostrat en la primera fila

-- 6. Recupera els noms dels jugadors que tenen una data de naixement anterior al març de 1980. Quin és el nom del jugador de cognom Lue que apareix als primers resultats?

-- 7. Per cada arena, digues el nombre de seients VIP que hi ha. Quants en te el Madison Square Garden?

-- 8. Tenim guardat els colors dels seients de tots els estadis. Retorna quants seients blaus hi ha en total.

-- 9. Retorna la mitjana de seients (arrodonint sense decimals) per color d’entre tots els estadis. Quina es la mitjana dels platejats?

-- 10. Retorna els entrenadors principals amb el seu rendiment segons el salari (rendiment = (VictoryPercentage / 100) * (Salary / 1000)), tallant els decimals que resultin. Quin és el rendiment de l'entrenador 100000004?

-- EVELYN :) --

-- 11. Per cada equip retorna quantes vegades ha guanyat. Sempre que siguin 3 vegades o més. Quantes files retorna el select?
SELECT  f.name, COUNT(f.name) AS contador FROM franchise AS f, franchise_season AS frans 
WHERE f.name = frans.franchiseName AND frans.isWinner IS TRUE
GROUP BY f.name
HAVING COUNT(f.name) >= 3;

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (11,4,'SELECT f.name, COUNT(f.name) AS contador FROM franchise AS f, franchise_season AS frans WHERE f.name = frans.franchiseName AND frans.isWinner IS TRUE GROUP BY f.name HAVING COUNT(f.name) >= 3;');

-- 12. Retorna amb el país i any els equips nacionals amb el nom i cognom del seu entrenador. Fes-ho pels anys del 2010 al 2015 i pels països que comencin per A. Quants entrenadors retorna la consulta?
SELECT nt.Country, nt.year, p.name, p.surname FROM nationalteam AS nt, headcoach AS h, person AS p 
WHERE nt.IDCardHeadCoach  = h.IDCard AND h.IDCard = p.IDCard
AND nt.year BETWEEN 2010 AND 2015 
AND nt.country LIKE 'A%';

INSERT INTO answer (IDquestion, answer_value, sql_query_used) VALUES (12,6,'SELECT nt.Country, nt.year, p.name, p.surname FROM nationalteam AS nt, headcoach AS h, person AS p WHERE nt.IDCardHeadCoach  = h.IDCard AND h.IDCard = p.IDCard AND nt.year BETWEEN 2010 AND 2015 AND nt.country LIKE "A%";');

-- 13. Per un any específic retorna per cada equip la suma dels salaris dels seus jugadors. Asumeix que tots els jugadors que tenen un contracte en qualsevol data de l'any 2007 s'ha de contabilitzar. Quin és el presupost dels Houston Rockets?

--ALEXANDRA--
--21.Per cada especialitat d'entrenadors assistents, retorna quants n'ha tingut cada franquícia. Qunatsmetges tenen els Brooklin Nets?
SELECT COUNT(a.especiality), a.FranchiseName FROM assistantcoach a 
	WHERE Especiality ="Doctor"
	AND FranchiseName="Brooklyn Nets"
	GROUP BY FranchiseName ;

--22.Troba quantes persones han nascut en un any en el qual no hi ha registrat un draft