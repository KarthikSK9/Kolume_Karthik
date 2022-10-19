SELECT DISTINCT ACNUM,
                FIELDNUM
  FROM INTEREST
 GROUP BY ACNUM,
          FIELDNUM
HAVING descrip IS NULL
 ORDER BY acnum,
          fieldnum;