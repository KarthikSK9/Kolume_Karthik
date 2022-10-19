SELECT DEPTNUM,
       DEPTNAME,
       INSTNAME
  FROM DEPARTMENT
 WHERE DEPTNUM IN (
           SELECT DEPTNUM
             FROM ACADEMIC natural join interest
            WHERE ACNUM IN (
                      SELECT ACNUM
                        FROM INTEREST
                       GROUP BY ACNUM
                      HAVING COUNT( FIELDNUM ) > 10
                  )
       );