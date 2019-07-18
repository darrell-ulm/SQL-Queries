SELECT * FROM
(
SELECT
{{record_type}} AS rec_num

FROM
sierra_view.bib_record_item_record_link l
LEFT JOIN
sierra_view.bib_record_order_record_link ol
ON
l.bib_record_id = ol.bib_record_id
LEFT JOIN
sierra_view.item_record i
ON
l.item_record_id = i.id AND i.location_code ~ {{location}}
LEFT JOIN
sierra_view.order_record_cmf o
ON
ol.order_record_id = o.order_record_id AND o.location_code ~ {{location}}

JOIN
sierra_view.phrase_entry v
ON
{{index_field}}
AND v.index_entry IN ({{values}})
) a
WHERE
rec_num IS NOT NULL