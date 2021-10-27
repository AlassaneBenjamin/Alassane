--Zusammenstellung von Zutaten entsprechend eines Rezepts-
select z.bezeichnung 
from zutat z 
left join rezeptzutat r 
on z.zutatennr = r.zutatennr 
left join rezepte re 
on r.rezept_id = re.rezept_id 
where re.rezeptname = 'Kartoffelauflauf';


--Auswahl von Rezepten entsprechend vorgegebener Ernährungskategorien--
select r.rezeptname, e.kategorie_name
from rezepte r 
left join ernaehrungskategorien e 
on r.rezept_id = e.rezept_id
where e.kategorie_name like '%vegan%';


--Auswahl bzw. Ausschluss von Rezepten auf Basis von Beschränkungen-
select r.rezeptname 
from rezepte r 
left join beschraenkungen b 
on r.rezept_id = b.rezept_id 
except 
select r.rezeptname 
from rezepte r
left join beschraenkungen b
on r.rezept_id = b.rezept_id 
where b.beschraenkung = 'Soja';


--Auswahl aller Zutaten eines Rezeptes nach Rezeptname--
select r.rezeptname, r.zutaten 
from rezepte r 
where r.rezeptname like '%Kartoffelauflauf';

select z.bezeichnung 
from zutat z 
left join rezeptzutat r 
on z.zutatennr = r.zutatennr 
where r.rezept_id = $1 ;

--Auswahl aller Rezepte einer bestimmten Ernährungskategorie--
select *
from ernaehrungskategorien ;

select *
from rezepte r
inner join ernaehrungskategorien e 
on e.rezept_id = r.rezept_id
where e.kategorie_name = 'vegan';

select *
from rezepte r
inner join ernaehrungskategorien e 
on e.rezept_id = r.rezept_id
where e.kategorie_name = 'vegetarisch';

select *
from rezepte r
inner join ernaehrungskategorien e 
on e.rezept_id = r.rezept_id
where e.kategorie_name = 'low carb';

select *
from rezepte r
inner join ernaehrungskategorien e 
on e.rezept_id = r.rezept_id
where e.kategorie_name = 'high protein';

select *
from rezepte r
inner join ernaehrungskategorien e 
on e.rezept_id = r.rezept_id
where e.kategorie_name = 'Karnivor';


--Auswahl aller Rezepte, die eine gewisse Zutat enthalten--
select r.rezeptname 
from rezepte r 
where r.zutaten like '%Tomaten%';


--Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden--
SELECT AVG(kalorien) AS Kalorien,
AVG(protein) AS Proteine,
AVG(kohlenhydrate) AS Kohlenhydrate
FROM rezepte INNER JOIN bestellung ON
rezepte.rezept_id = bestellung.rezept_id INNER JOIN kunde ON
kunde.kundennr = bestellung.kundennr where kunde.kundennr= $1;


--Auswahl aller Zutaten, die bisher keinem Rezept zugeordnet sind--
select *
from zutat
where rezept_id = 0;


--Auswahl aller Rezepte, die eine bestimmte Kalorienmenge nicht überschreiten-- 
select*
from rezepte r 
where r.kalorien < 500 ;


--Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten--
ect r.rezeptname, r.zutaten_anzahl, e.kategorie_name 
from rezepte r 
left join ernaehrungskategorien e 
on r.rezept_id = e.rezept_id 
where r.zutaten_anzahl < 5;


--Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten und eine bestimmte Ernährungskategorie erfüllen--
select r.rezeptname, r.zutaten_anzahl, e.kategorie_name 
from rezepte r 
left join ernaehrungskategorien e 
on r.rezept_id = e.rezept_id 
where r.zutaten_anzahl < 5;


-- Zusätzliche Abfragen:--

-- Auswahl aller Bestellungen deren Rechnungsbetrag über 15 ist--
select* 
from bestellung b 
where b.rechnungsbetrag > 15;


--Rezept mit den meisten Zutaten--
select *
from rezepte r2 
where zutaten_anzahl in 
(
	select max(zutaten_anzahl) 
	from rezepte r   
	);


--Wie viele Rezepte gibt es der Datenbank?;--
select count(r.rezeptname) 
from rezepte r;


--Auswahl von Zutaten eines Rezeptes aus der Zutatentabelle-
select z.bezeichnung 
from zutat z 
left join rezeptzutat r 
on z.zutatennr = r.zutatennr 
where r.rezept_id = $1 ;
