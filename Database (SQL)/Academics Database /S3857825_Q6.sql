SELECT ACNUM
  FROM academic
 WHERE acnum NOT IN (
           SELECT DISTINCT acnum
             FROM author
            WHERE panum IN (
                      SELECT PANUM
                        FROM author
                       WHERE acnum IN (
                                 SELECT ACNUM
                                   FROM ACADEMIC
                                  WHERE ACADEMIC.GIVENAME = 'Steve' AND 
                                        academic.FAMNAME = 'Bruce'
                             )
                  )
       );