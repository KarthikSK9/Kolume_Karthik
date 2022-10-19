SELECT DISTINCT instname,
                deptname
  FROM department
 GROUP BY deptnum
HAVING deptnum IN (
           SELECT deptnum
             FROM academic
                  NATURAL JOIN
                  interest
            WHERE ACNUM IN (
                      SELECT acnum
                        FROM interest
                       WHERE descrip IS NULL
                       GROUP BY acnum
                      HAVING count( * ) >= 2
                  )
       )
 ORDER BY instname,
          deptname;