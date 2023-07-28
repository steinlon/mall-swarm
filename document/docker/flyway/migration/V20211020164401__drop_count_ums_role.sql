alter table ums_role
    drop column if exists admin_count;

insert into ums_role (name, description, create_time, status, sort)
values ('用户管理员', '用户管理员', '2021-10-20 22:22:05', '1', '0');

insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('0', '2021-10-20 17:07:22', '管理', '0', '0', 'manage', 'example', '0');

insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('25', '2021-10-20 17:07:22', 'Swagger信息', '1', '0', 'info', 'form', '0');

insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('25', '2021-10-20 17:07:22', 'Api', '1', '0', 'api', 'order-setting', '0');
