select cc_rec_start_date, cc_class, count(*) as totals
from
(select cc_call_center_id, cc_rec_start_date, cc_class, row_number() over(partition by cc_call_center_id, cc_class
                                                                        order by cc_class desc) this_is_test
from snowflake_sample_data.tpcds_sf10tcl.call_center)
where this_is_test = 2
group by cc_rec_start_date, cc_class
order by cc_rec_start_date