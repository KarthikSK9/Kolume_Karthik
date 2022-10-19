SELECT count(distinct panum) 
  FROM AUTHOR
 WHERE ACNUM IN (
           SELECT ACNUM
             FROM ACADEMIC
                  NATURAL JOIN
                  DEPARTMENT
            WHERE STATE = 'VIC'
       );