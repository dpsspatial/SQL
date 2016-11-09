--more documentation to follow

--delete rule
create or replace rule "delete_label" as 
on delete to dqmt.schools_district_map do instead
delete from dqmt.district_map_labels
where oid = oid;

--insert rule

create or replace rule "insert_label" as 
on insert to dqmt.schools_district_map do instead
insert into dqmt.district_map_labels (label_x, label_y)
values (new.label_x, new.label_y);


--update rule
create or replace rule "labels_update" as 
on UPDATE TO dqmt.schools_district_map do instead 
update dqmt.district_map_labels 
set label_x = new.label_x
, label_y = new.label_y
where oid = new.oid;
