/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     2020/4/21 12:19:50                           */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_操作日志_REFERENCE_文件存储区') then
    alter table 操作日志
       delete foreign key FK_操作日志_REFERENCE_文件存储区
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_用户类型表_REFERENCE_权限表') then
    alter table 用户类型表
       delete foreign key FK_用户类型表_REFERENCE_权限表
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_用户表_REFERENCE_用户类型表') then
    alter table 用户表
       delete foreign key FK_用户表_REFERENCE_用户类型表
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_用户表_REFERENCE_文件存储区') then
    alter table 用户表
       delete foreign key FK_用户表_REFERENCE_文件存储区
end if;

drop table if exists 操作日志;

drop table if exists 文件存储区;

drop table if exists 权限表;

drop table if exists 用户类型表;

drop table if exists 用户表;

/*==============================================================*/
/* Table: 操作日志                                                  */
/*==============================================================*/
create table 操作日志 
(
   log_id               bigint                         not null,
   op_type              int                            not null,
   content              varchar(200)                   not null,
   user_id              integer                        not null,
   gen_time             datetime                       not null,
   Re_mark              varchar(200)                   not null,
   Column_7             char(10)                       not null,
   constraint PK_操作日志 primary key clustered (log_id)
);

/*==============================================================*/
/* Table: 文件存储区                                                 */
/*==============================================================*/
create table 文件存储区 
(
   file_id              integer(16)                    not null,
   cname                varchar(16)                    null,
   file_info            varchar(200)                   null,
   gen_time             datetime                       not null,
   file_aut             varchar(20)                    null,
   user_name            varchar(64)                    null,
   user_id              integer                        not null
);

/*==============================================================*/
/* Table: 权限表                                                   */
/*==============================================================*/
create table 权限表 
(
   to_id                varchar(64)                    not null,
   description          varchar(200)                   null,
   right_name           varchar(64)                    not null,
   user_id              integer                        not null,
   right_type           integer                        not null
);

/*==============================================================*/
/* Table: 用户类型表                                                 */
/*==============================================================*/
create table 用户类型表 
(
   to_id                varchar(64)                    not null,
   role_name            varchar(64)                    not null,
   user_name            varchar(64)                    not null,
   user_id              integer                        not null
);

/*==============================================================*/
/* Table: 用户表                                                   */
/*==============================================================*/
create table 用户表 
(
   user_id              integer                        not null,
   user_name            varchar(64)                    not null,
   user_pad             varchar(64)                    not null,
   to_id                varchar(64)                    not null,
   login_time           time                           null,
   last_time            time                           null,
   constraint PK_用户表 primary key clustered (user_id)
);

alter table 操作日志
   add constraint FK_操作日志_REFERENCE_文件存储区 foreign key (user_id)
      references 文件存储区 (user_id)
      on update restrict
      on delete restrict;

alter table 用户类型表
   add constraint FK_用户类型表_REFERENCE_权限表 foreign key (user_id)
      references 权限表 (user_id)
      on update restrict
      on delete restrict;

alter table 用户表
   add constraint FK_用户表_REFERENCE_用户类型表 foreign key (user_name)
      references 用户类型表 (user_name)
      on update restrict
      on delete restrict;

alter table 用户表
   add constraint FK_用户表_REFERENCE_文件存储区 foreign key (user_id)
      references 文件存储区 (user_id)
      on update restrict
      on delete restrict;

