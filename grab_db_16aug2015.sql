create table MST_ITEM (
item_id int primary key auto_increment,
item_name varchar(100) not null,
vendor varchar(100));

create table MST_PROJECT(
project_id int primary key auto_increment,
project_name varchar(100) not null,
descrip varchar(100)
);

create table MST_USERGROUP(
usergroup_id int primary key auto_increment,
usergroup_name varchar(50) not null
);

create table MST_USER(
user_id varchar(30) primary key,
usergroup_id int not null,
password varchar(100) not null,
salt varchar(33) not null,
foreign key (usergroup_id) references MST_USERGROUP(usergroup_id) on delete cascade
);

create table MST_MENU(
menu_id int primary key auto_increment,
menu_name varchar(100)
);

create table MST_ACTION(
action_id int primary key auto_increment,
menu_id int not null,
menu_url varchar(200) not null,
descrip varchar(100),
foreign key (menu_id) references MST_MENU(menu_id) on delete cascade
);

create table MST_USERGROUPAC(
usergroupac_id int primary key auto_increment,
usergroup_id int not null,
action_id int not null,
foreign key (usergroup_id) references MST_USERGROUP(usergroup_id) on delete cascade,
foreign key (action_id) references MST_ACTION(action_id) on delete cascade
);

create table MST_PROJECTUSER(
project_id int not null,
user_id varchar(30) not null,
foreign key (project_id) references MST_PROJECT(project_id) on delete cascade,
foreign key (user_id) references MST_USER(user_id) on delete cascade
);

create table T_USER_LOG(
log_dt datetime not null,
user_id varchar(30) not null,
status varchar(10) not null,
foreign key (user_id) references MST_USER(user_id) on delete cascade
);

create table T_USER_ACCESS(
access_dt datetime not null,
user_id varchar(30) not null,
action_id int not null,
foreign key (user_id) references MST_USER(user_id) on delete cascade,
foreign key (action_id) references MST_ACTION(action_id) on delete cascade
);

create table T_RAB(
rab_id int primary key auto_increment,
project_id int not null,
item_id int not null,
qty_order int,
qty_in int,
qty_out int,
foreign key (project_id) references MST_PROJECT(project_id) on delete cascade,
foreign key (item_id) references MST_ITEM(item_id) on delete cascade
);

create table T_RECEIPT(
receipt_id int primary key auto_increment,
receipt_dt date not null,
rab_id int not null,
receipt_qty int,
po_num varchar(50),
supplier_name varchar(50),
descrip varchar(200),
foreign key (rab_id) references T_RAB(rab_id) on delete cascade
);

create table T_RELEASE(
release_id int primary key auto_increment,
release_dt date not null,
rab_id int not null,
release_qty int,
do_num varchar(50),
descrip varchar(200),
foreign key (rab_id) references T_RAB(rab_id) on delete cascade
);
