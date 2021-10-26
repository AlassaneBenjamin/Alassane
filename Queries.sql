--Auswahl aller Zutaten, die bisher keinem Rezept zugeordnet sind--

select *
from zutat
where rezept_id = 0;

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

--Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden-


SELECT AVG(kalorien) AS Kalorien,
AVG(protein) AS Proteine,
AVG(kohlenhydrate) AS Kohlenhydrate
FROM rezepte INNER JOIN bestellung ON
rezepte.rezept_id = bestellung.rezept_id INNER JOIN kunde ON
kunde.kundennr = bestellung.kundennr where kunde.kundennr= $1;


select*
from rezepte r 
left join ernaehrungskategorien e 
on r.rezept_id = e.rezept_id 
where e.kategorie_name = 'vegan';

select z.bezeichnung 
from zutat z 
left join rezeptzutat r 
on z.zutatennr = r.zutatennr 
left join rezepte re 
on r.rezept_id = re.rezept_id 
where re.rezeptname = 'Kartoffelauflauf';

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

select*
from rezepte r 
where r.kalorien < 500 ;

select* 
from bestellung b 
where b.rechnungsbetrag > 15;


