﻿select 
distinct 'i'||i.record_num||'a',
--'r'||r.record_num||'a',
i.location_code
--v.field_content
from
--sierra_view.varfield as v
--join
sierra_view.item_view as i
--ON
--v.record_id = i.id
left join
sierra_view.course_record_item_record_link as ci
On 
ci.item_record_id = i.id
--left join
--sierra_view.course_view as r
--ON
--ci.course_record_id = r.id
JOIN
sierra_view.bib_record_item_record_link as bi
ON
bi.item_record_id = i.id
Join sierra_view.bib_view as b
ON
bi.bib_record_id = b.id
where
--varfield_type_code = 'r' and 
ci.course_record_id is null and b.bcode3 = 'r'
order by 1
;