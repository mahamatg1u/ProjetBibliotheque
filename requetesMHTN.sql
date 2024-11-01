USE tpMHTN;
SELECT IDnumbib,nom from Bibliotheque ;
SELECT IDnumbib,nom from Bibliotheque where nbrtotalouvrage1>10000;
SELECT e.nometab,b.nom FROM Etablissement e,Bibliotheque b where e.nometab= b.nometab and  b.nom = "Stanislas";
SELECT COUNT(*)  FROM bibliotheque WHERE nometab = 'UL';
SELECT AVG(nbrtotalouvrage1)  FROM Bibliotheque;
SELECT AVG(nbrtotalouvrage2)  FROM AutreBibliotheque;
SELECT nometab, COUNT(*)FROM Bibliotheque GROUP BY nometab;
SELECT nometab FROM Bibliotheque group by  nometab order by  COUNT(*) DESC LIMIT 1;
SELECT b.nom, e.nometab FROM Bibliotheque b, Etablissement e, Ouvrage o, Exemplaire x where b.nometab = e.nometab AND b.IDnumbib = x.IDnumbib AND o.numISBN = x.numISBN AND o.numISBN = '978-2-426-00627-2'
                            








