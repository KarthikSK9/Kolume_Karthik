SELECT DISTINCT FIELDNUM,
       TITLE
  FROM FIELD
       NATURAL JOIN
       INTEREST
 WHERE interest.ACNUM = 100;