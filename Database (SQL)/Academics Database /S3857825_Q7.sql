SELECT givename,
       famname,
       title
  FROM ACADEMIC
 WHERE acnum IN (
           SELECT DISTINCT a.acnum
             FROM author a,
                  author b
            WHERE a.acnum != b.acnum AND 
                  a.panum = b.panum
            GROUP BY a.acnum
            ORDER BY count(DISTINCT b.acnum) DESC
            LIMIT 1
       );