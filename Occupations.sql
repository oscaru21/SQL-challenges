/*Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically 
and displayed underneath its corresponding Occupation. 
The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
Note: Print NULL when there are no more names corresponding to an occupation.*/
set @r1=0, @r2=0, @r3=0, @r4=0;
SELECT min(Doctor), min(Professor), min(Singer), min(Actor)
FROM(
    SELECT  CASE 
                WHEN OCCUPATIONS.OCCUPATION='Doctor' THEN (@r1:=@r1+1)
                WHEN OCCUPATIONS.OCCUPATION='Professor' THEN (@r2:=@r2+1)
                WHEN OCCUPATIONS.OCCUPATION='Singer' THEN (@r3:=@r3+1)
                WHEN OCCUPATIONS.OCCUPATION='Actor' THEN (@r4:=@r4+1) END AS RowNumber,
            CASE WHEN OCCUPATIONS.OCCUPATION='Doctor' THEN OCCUPATIONS.NAME END AS 'Doctor',
            CASE WHEN OCCUPATIONS.OCCUPATION='Professor' THEN OCCUPATIONS.NAME END AS 'Professor',
            CASE WHEN OCCUPATIONS.OCCUPATION='Singer' THEN OCCUPATIONS.NAME END AS 'Singer',
            CASE WHEN OCCUPATIONS.OCCUPATION='Actor' THEN OCCUPATIONS.NAME END AS 'Actor'
    FROM OCCUPATIONS
    ORDER BY NAME) TEMP
GROUP BY ROWNUMBER;