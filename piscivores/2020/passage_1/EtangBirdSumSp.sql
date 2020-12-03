CREATE TABLE EtangBirdSumSp as
SELECT etg_name
     , SUM(bird_num) FILTER (WHERE bird_sp =  'cormo') G_Cormoran
     , SUM(bird_num) FILTER (WHERE bird_sp =  'h_cendre') H_Cendre
     , SUM(bird_num) FILTER (WHERE bird_sp =  'g_aigrette') G_Aigrette
     , SUM(bird_num) FILTER (WHERE bird_sp =  'g_huppe') G_Huppe
     , SUM(bird_num) FILTER (WHERE bird_sp =  'g_casta') G_Castagneux
     , SUM(bird_num) FILTER (WHERE bird_sp =  'c_tuber') C_Tubercule
     , SUM(bird_num) FILTER (WHERE bird_sp =  'm_rieuse') M_Rieuse
     , SUM(bird_num) FILTER (WHERE bird_sp =  'h_bievre') H_Bievre
     , y_lat, x_long
FROM (SELECT etg_name, bird_sp, bird_num, y_lat, x_long
     FROM etang, bird
     WHERE p_key=f_key
     ORDER by etg_name) EtangBird
GROUP BY etg_name
ORDER BY etg_name;

UPDATE EtangBirdSumSp
SET G_Cormoran=0
WHERE G_Cormoran IS NULL;

UPDATE EtangBirdSumSp
SET H_Cendre=0
WHERE H_Cendre IS NULL;

UPDATE EtangBirdSumSp
SET G_Aigrette=0
WHERE G_Aigrette IS NULL;

UPDATE EtangBirdSumSp
SET G_Huppe=0
WHERE G_Huppe IS NULL;

UPDATE EtangBirdSumSp
SET G_Castagneux=0
WHERE G_Castagneux IS NULL;

UPDATE EtangBirdSumSp
SET C_Tubercule=0
WHERE C_Tubercule IS NULL;

UPDATE EtangBirdSumSp
SET M_Rieuse=0
WHERE M_Rieuse IS NULL;

UPDATE EtangBirdSumSp
SET H_Bievre=0
WHERE H_Bievre IS NULL;

SELECT *
FROM EtangBirdSumSp
limit 20;



