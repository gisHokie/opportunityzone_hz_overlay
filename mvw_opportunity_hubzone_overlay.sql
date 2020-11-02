CREATE MATERIALIZED VIEW mvw_getLAOpportunityZones
AS
SELECT toz.id,
toz."GEOID",
toz.geom,
CASE
    WHEN toz.id IN
        (SELECT toz.id
         FROM qct_r
         WHERE st_intersects(ST_Centroid(st_transform(toz."geom", 3857)), st_transform(qct_r.geom, 3857)) = true
		 	--AND qct_r.county = 'Los Angeles County'
			--AND qct_r.state = 'CA'
		)
         
    THEN 'TRUE'
    ELSE 'FALSE'
    END AS lyr_qct_r,
CASE
    WHEN toz.id IN
        (SELECT toz.id
		 FROM qct_e
         WHERE st_intersects(ST_Centroid(st_transform(toz."geom", 3857)), st_transform(qct_e.geom, 3857)) = true
		 	--AND qct_e.county = 'Los Angeles County'
			--AND qct_e.state = 'CA'
		)
         
    THEN 'TRUE'
    ELSE 'FALSE'
    END AS lyr_qct_e,
CASE
    WHEN toz.id IN
        (SELECT toz.id
         FROM qnmc_r
         WHERE st_intersects(ST_Centroid(st_transform(toz."geom", 3857)), st_transform(qnmc_r.geom, 3857)) = true
		 	--AND county LIKE 'Los Angeles%'
			--AND state = 'CA'
		)
         
    THEN 'TRUE'
    ELSE 'FALSE'
    END AS lyr_qnmc_r,
CASE
    WHEN toz.id IN
        (SELECT toz.id
         FROM qnmc_qda
         WHERE st_intersects(ST_Centroid(st_transform(toz."geom", 3857)), st_transform(qnmc_qda.geom, 3857)) = true
		 	--AND county LIKE 'Los Angeles%'
			--AND state = 'CA'
		)
         
    THEN 'TRUE'
    ELSE 'FALSE'
    END AS lyr_qnmc_qda,
CASE
    WHEN toz.id IN
        (SELECT toz.id
         FROM qct_qda
         WHERE st_intersects(ST_Centroid(st_transform(toz."geom", 3857)), st_transform(qct_qda.geom, 3857)) = true
		 	--AND county = 'Los Angeles County'
			--AND state = 'CA'
		)
         
    THEN 'TRUE'
    ELSE 'FALSE'
    END AS lyr_qct_qda,
CASE
    WHEN toz.id IN
        (SELECT toz.id
         FROM indian_lands
         WHERE st_intersects(ST_Centroid(st_transform(toz."geom", 3857)), st_transform(indian_lands.geom, 3857)) = true
		)
         
    THEN 'TRUE'
    ELSE 'FALSE'
    END AS lyr_indian_lands,
CASE
    WHEN toz.id IN
        (SELECT toz.id
         FROM brac
         WHERE st_intersects(ST_Centroid(st_transform(toz."geom", 3857)), st_transform(brac.geom, 3857)) = true
		 	--AND county LIKE 'Los Angeles%'
			--AND st_name = 'California'
		)
         
    THEN 'TRUE'
    ELSE 'FALSE'
    END AS lyr_brac, 
CASE
    WHEN toz.id IN
        (SELECT toz.id
         FROM qnmc_brac
         WHERE st_intersects(ST_Centroid(st_transform(toz."geom", 3857)), st_transform(qnmc_brac.geom, 3857)) = true
		 	--AND county LIKE 'Los Angeles%'
			--AND state = 'CA'
		)
         
    THEN 'TRUE'
    ELSE 'FALSE'
    END AS lyr_qnmc_brac,
CASE
    WHEN toz.id IN
        (SELECT toz.id
         FROM qct_brac
         WHERE st_intersects(ST_Centroid(st_transform(toz."geom", 3857)), st_transform(qct_brac.geom, 3857)) = true
		 	--AND county LIKE 'Los Angeles%'
			--AND state = 'CA'
		)
         
    THEN 'TRUE'
    ELSE 'FALSE'
    END AS lyr_qct_brac
	
FROM treasury_opportunity_zone AS toz
--WHERE toz."GEOID" LIKE '06037%'

