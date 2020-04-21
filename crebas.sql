/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     2020/4/21 12:19:50                           */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_������־_REFERENCE_�ļ��洢��') then
    alter table ������־
       delete foreign key FK_������־_REFERENCE_�ļ��洢��
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_�û����ͱ�_REFERENCE_Ȩ�ޱ�') then
    alter table �û����ͱ�
       delete foreign key FK_�û����ͱ�_REFERENCE_Ȩ�ޱ�
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_�û���_REFERENCE_�û����ͱ�') then
    alter table �û���
       delete foreign key FK_�û���_REFERENCE_�û����ͱ�
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_�û���_REFERENCE_�ļ��洢��') then
    alter table �û���
       delete foreign key FK_�û���_REFERENCE_�ļ��洢��
end if;

drop table if exists ������־;

drop table if exists �ļ��洢��;

drop table if exists Ȩ�ޱ�;

drop table if exists �û����ͱ�;

drop table if exists �û���;

/*==============================================================*/
/* Table: ������־                                                  */
/*==============================================================*/
create table ������־ 
(
   log_id               bigint                         not null,
   op_type              int                            not null,
   content              varchar(200)                   not null,
   user_id              integer                        not null,
   gen_time             datetime                       not null,
   Re_mark              varchar(200)                   not null,
   Column_7             char(10)                       not null,
   constraint PK_������־ primary key clustered (log_id)
);

/*==============================================================*/
/* Table: �ļ��洢��                                                 */
/*==============================================================*/
create table �ļ��洢�� 
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
/* Table: Ȩ�ޱ�                                                   */
/*==============================================================*/
create table Ȩ�ޱ� 
(
   to_id                varchar(64)                    not null,
   description          varchar(200)                   null,
   right_name           varchar(64)                    not null,
   user_id              integer                        not null,
   right_type           integer                        not null
);

/*==============================================================*/
/* Table: �û����ͱ�                                                 */
/*==============================================================*/
create table �û����ͱ� 
(
   to_id                varchar(64)                    not null,
   role_name            varchar(64)                    not null,
   user_name            varchar(64)                    not null,
   user_id              integer                        not null
);

/*==============================================================*/
/* Table: �û���                                                   */
/*==============================================================*/
create table �û��� 
(
   user_id              integer                        not null,
   user_name            varchar(64)                    not null,
   user_pad             varchar(64)                    not null,
   to_id                varchar(64)                    not null,
   login_time           time                           null,
   last_time            time                           null,
   constraint PK_�û��� primary key clustered (user_id)
);

alter table ������־
   add constraint FK_������־_REFERENCE_�ļ��洢�� foreign key (user_id)
      references �ļ��洢�� (user_id)
      on update restrict
      on delete restrict;

alter table �û����ͱ�
   add constraint FK_�û����ͱ�_REFERENCE_Ȩ�ޱ� foreign key (user_id)
      references Ȩ�ޱ� (user_id)
      on update restrict
      on delete restrict;

alter table �û���
   add constraint FK_�û���_REFERENCE_�û����ͱ� foreign key (user_name)
      references �û����ͱ� (user_name)
      on update restrict
      on delete restrict;

alter table �û���
   add constraint FK_�û���_REFERENCE_�ļ��洢�� foreign key (user_id)
      references �ļ��洢�� (user_id)
      on update restrict
      on delete restrict;

