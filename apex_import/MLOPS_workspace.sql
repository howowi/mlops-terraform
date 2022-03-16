prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_210100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_default_workspace_id=>10107082786587856
);
end;
/
prompt  WORKSPACE 10107082786587856
--
-- Workspace, User Group, User, and Team Development Export:
--   Date and Time:   08:49 Wednesday March 16, 2022
--   Exported By:     MLOPSU1
--   Export Type:     Workspace Export
--   Version:         21.1.7
--   Instance ID:     9006869016587516
--
-- Import:
--   Using Instance Administration / Manage Workspaces
--   or
--   Using SQL*Plus as the Oracle user APEX_210100
 
begin
    wwv_flow_api.set_security_group_id(p_security_group_id=>10107082786587856);
end;
/
----------------
-- W O R K S P A C E
-- Creating a workspace will not create database schemas or objects.
-- This API creates only the meta data for this APEX workspace
prompt  Creating workspace MLOPS...
begin
wwv_flow_fnd_user_api.create_company (
  p_id => 10107387681587886
 ,p_provisioning_company_id => 10107082786587856
 ,p_short_name => 'MLOPS'
 ,p_display_name => 'MLOPS'
 ,p_first_schema_provisioned => 'MLOPSU1'
 ,p_company_schemas => 'MLOPSU1'
 ,p_account_status => 'ASSIGNED'
 ,p_allow_plsql_editing => 'Y'
 ,p_allow_app_building_yn => 'Y'
 ,p_allow_packaged_app_ins_yn => 'Y'
 ,p_allow_sql_workshop_yn => 'Y'
 ,p_allow_websheet_dev_yn => 'Y'
 ,p_allow_team_development_yn => 'Y'
 ,p_allow_to_be_purged_yn => 'Y'
 ,p_allow_restful_services_yn => 'Y'
 ,p_source_identifier => 'MLOPS'
 ,p_webservice_logging_yn => 'Y'
 ,p_path_prefix => 'MLOPS'
 ,p_files_version => 1
);
end;
/
----------------
-- G R O U P S
--
prompt  Creating Groups...
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1201713559383927,
  p_GROUP_NAME => 'OAuth2 Client Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to register OAuth2 Client Applications');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1201602704383927,
  p_GROUP_NAME => 'RESTful Services',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use RESTful Services with this workspace');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1201581767383923,
  p_GROUP_NAME => 'SQL Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use SQL Developer with this workspace');
end;
/
prompt  Creating group grants...
----------------
-- U S E R S
-- User repository for use with APEX cookie-based authentication.
--
prompt  Creating Users...
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '13038845399546945',
  p_user_name                    => 'ANNA',
  p_first_name                   => 'Anna',
  p_last_name                    => 'Smith',
  p_description                  => '',
  p_email_address                => 'rodney.sowirono@oracle.com',
  p_web_password                 => '944351C0EC95F090B82129573777D18F7E686EE454254C4D4433FD7B8467A415AE2032CA1E63762BFBC51660DC79FD6960C7FB040CB4CA45E1E19B3EB73824F1',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'MLOPSU1',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202202090632','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_websheet_dev_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '13040262360660685',
  p_user_name                    => 'JAMES',
  p_first_name                   => 'James',
  p_last_name                    => 'May',
  p_description                  => '',
  p_email_address                => 'rodney.sowirono@oracle.com',
  p_web_password                 => 'D166B280355531C8C1FEDBEDA67FB6A588E5E1296EC1995E35050170B3F3DD1A7939E808F84C18BF01DF9A56E0145EFBF5FE9217EFC4C1913EAF5326B8BA9915',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'MLOPSU1',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202202090638','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_websheet_dev_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '10107235045587860',
  p_user_name                    => 'MLOPSU1',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'rodney.sowirono@oracle.com',
  p_web_password                 => '6010548B3278970912869936FA06A44E9468D4887C28A2789DCF0F01CCB6F4648B35EEF884AE3FFE47034F55A534033FBF977381E2C217C8468DF5B15BD3857F',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MLOPSU1',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202111041652','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_websheet_dev_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '12907686636921187',
  p_user_name                    => 'RODNEY',
  p_first_name                   => 'Rodney',
  p_last_name                    => 'Sowirono',
  p_description                  => '',
  p_email_address                => 'rodney.sowirono@oracle.com',
  p_web_password                 => 'AE45DA245B2AD0669F8B52A71119A0E3C73A327F9E0B2B69525E4E2972B85A91B54D8C74B8EDBF501BE913E2DD53ABEF4E5EB775E04921040B81EF64EF3AD08A',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'MLOPSU1',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202111080941','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_websheet_dev_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
----------------
--App Builder Preferences
--
----------------
--Click Count Logs
--
----------------
--mail
--
----------------
--mail log
--
----------------
--app models
--
----------------
--password history
--
begin
  wwv_flow_api.create_password_history (
    p_id => 10107565718587901,
    p_user_id => 10107235045587860,
    p_password => '315CAEA480CDED077119E96314A2EE97FC864E76B9C6B6076D9FEE979A975FAAC810F4092A6E2FB92003FC3273B856EAB2217BB04B46238632FF8985C890B8A1');
end;
/
begin
  wwv_flow_api.create_password_history (
    p_id => 12907786938921197,
    p_user_id => 12907686636921187,
    p_password => 'AE45DA245B2AD0669F8B52A71119A0E3C73A327F9E0B2B69525E4E2972B85A91B54D8C74B8EDBF501BE913E2DD53ABEF4E5EB775E04921040B81EF64EF3AD08A');
end;
/
begin
  wwv_flow_api.create_password_history (
    p_id => 13038967523546961,
    p_user_id => 13038845399546945,
    p_password => '5BBE6AECB7E19B0D0CBF482B8DCF0DB45333D3693EB65172E37234E7F711C56CDAAA9D06922F03B2138898C6C573CA876FDD80E0BF3F94A005A7CBA820C3D193');
end;
/
begin
  wwv_flow_api.create_password_history (
    p_id => 16712482052309839,
    p_user_id => 13038845399546945,
    p_password => '944351C0EC95F090B82129573777D18F7E686EE454254C4D4433FD7B8467A415AE2032CA1E63762BFBC51660DC79FD6960C7FB040CB4CA45E1E19B3EB73824F1');
end;
/
begin
  wwv_flow_api.create_password_history (
    p_id => 10107868629598855,
    p_user_id => 10107235045587860,
    p_password => 'B7F803B1A5BC64A380A45A9B47433CC3EB03203845F901DA5C81929E6785534CCD95C6433D92A8142D391D8B2CAA828346384B0EBD14E1B2783B0BBD6D2168C1');
end;
/
begin
  wwv_flow_api.create_password_history (
    p_id => 16712572831340920,
    p_user_id => 13040262360660685,
    p_password => 'D166B280355531C8C1FEDBEDA67FB6A588E5E1296EC1995E35050170B3F3DD1A7939E808F84C18BF01DF9A56E0145EFBF5FE9217EFC4C1913EAF5326B8BA9915');
end;
/
begin
  wwv_flow_api.create_password_history (
    p_id => 13040330610660694,
    p_user_id => 13040262360660685,
    p_password => '35C1579B34BDFEA674E8EF6927AE649DD42F309D1A0AC80394B04EF317D17E35854B8F2E6E43EEF7A4B87FA4D254531E68984D3DCC4AD7D855389811A22F495E');
end;
/
begin
  wwv_flow_api.create_password_history (
    p_id => 12009809987943797,
    p_user_id => 10107235045587860,
    p_password => '6010548B3278970912869936FA06A44E9468D4887C28A2789DCF0F01CCB6F4648B35EEF884AE3FFE47034F55A534033FBF977381E2C217C8468DF5B15BD3857F');
end;
/
----------------
--preferences
--
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11331904969749149,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4000_P1951_R4302959812059816_SORT',
    p_attribute_value => 'sort_3_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11332036503749155,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4000_P1951_R5517859571157119_SORT',
    p_attribute_value => 'sort_6_desc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11332844550776710,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4000_P1927_R468891038148100778_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11385774368006359,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P405_W3852329031687921',
    p_attribute_value => '3853503855690337____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11714015637102883,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_IG_11616291258101453_CURRENT_REPORT',
    p_attribute_value => '11728164082155415:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11714171925102898,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_IG_11623281999101564_CURRENT_REPORT',
    p_attribute_value => '11624123183101565:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12027790225694186,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P4100_W3727618522871356',
    p_attribute_value => '3728530690872449____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12049185068461656,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P638_W450364124712818534',
    p_attribute_value => '450366702032823642____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12049358757473164,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4000_P4654_R1499572493724561712_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12049481354473168,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4000_P4654_R1499573840880561732_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12051707484558521,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_101_P10032_W10706000526166572',
    p_attribute_value => '10708832874166579____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12053401203659666,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P959_W483659607062898467',
    p_attribute_value => '483660631524898748____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 10118661518071402,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_IG_12252226947917958_CURRENT_REPORT',
    p_attribute_value => '12253119901917959:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11293876633706104,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4000_P1948_R759086642437831816_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 10821307438167674,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11183281450228463,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P63_W192583809228792438',
    p_attribute_value => '192585023813792448____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11387846900092089,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P546_W30205316146531602',
    p_attribute_value => '30206031208532453____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13006494130718288,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P40_W48117227188266087',
    p_attribute_value => '48118623144274016____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16712706147377523,
    p_user_id => 'ANNA',
    p_preference_name => 'FSP_IR_101_P10010_W10655334137165817',
    p_attribute_value => '10658483409166151____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17111252245500056,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4350_P25_W9307709001462905',
    p_attribute_value => '9309908769463151____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 17111503538500115,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'PERSISTENT_ITEM_P25_DATE',
    p_attribute_value => '.125',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11388046874092385,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P287_W47869516939800889',
    p_attribute_value => '47870618297805517____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 10110110423653085,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 10110486883653132,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '101',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11081972048389100,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_101_P4_W10354993496165277',
    p_attribute_value => '10503319549165625____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11183048961227813,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P170_W47844825293922430',
    p_attribute_value => '47846032049926790____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11597154108606199,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_H',
    p_attribute_value => '749',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12059185673706625,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'F4500_1157686386582338224_SPLITTER_STATE',
    p_attribute_value => '492:false',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16822052040095848,
    p_user_id => 'ANNA',
    p_preference_name => 'APEX_THEME_STYLE_A101T42',
    p_attribute_value => '11383467446964812',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11082293076493725,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4000_P197_R935666971301945228_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12010773776950622,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P431_W478896025956673213',
    p_attribute_value => '478896612991674411____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12109999667399128,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P556_W188103615005859601',
    p_attribute_value => '188104818844859950____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12110086286399410,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4000_P142_R203053725408397937_SORT',
    p_attribute_value => 'sort_4_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12113294080525477,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4500_P3100_R82702857605738101_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12113699825527152,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4500_P3110_R1595347007342836_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11285674998463495,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4000_P1921_R310374200946241813_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11386267763008531,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'CODE_LANGUAGE',
    p_attribute_value => 'PLSQL',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11597039582606149,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_W',
    p_attribute_value => '1400',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11606103473761515,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P19_W451745617575288584',
    p_attribute_value => '451746507039288843____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11081731944384969,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11083694888559769,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P1955_W809376252104725874',
    p_attribute_value => '809537310000856847____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11182407707223134,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P1622_W154844244090613422',
    p_attribute_value => '158682969820494765____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11182661126223141,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P1622_W533156144563172849',
    p_attribute_value => '537047886332414501____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11182836921223386,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P1623_W501254046333110952',
    p_attribute_value => '501255236844110964____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11286139554508580,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4000_P1948_R755920154500834577_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11286739028519993,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4000_P1946_R226685443264475216_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11398502639161540,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'PD_GAL_CUR_TAB',
    p_attribute_value => '0',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12410908394598417,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_101_P10053_W10788744625167078',
    p_attribute_value => '10794247779167407____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13028784671247504,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'F4000_1157687726908338238_SPLITTER_STATE',
    p_attribute_value => '125:true',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16821909942091646,
    p_user_id => 'JAMES',
    p_preference_name => 'APEX_THEME_STYLE_A101T42',
    p_attribute_value => '11383467446964812',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11182229352202967,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P1620_W312277037396040233',
    p_attribute_value => '312279461465115193____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11935420351640244,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_IG_660073452414686901_CURRENT_REPORT',
    p_attribute_value => '660079397159689022:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11386181807006636,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P4050_W10642116325440827',
    p_attribute_value => '10643624462441172____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11084098218560065,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P1903_W492434661470706644',
    p_attribute_value => '492595719366837617____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11382054914945579,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'PD_TAB_LAYOUT_3',
    p_attribute_value => '0:renderTree_container,0:dynActTree_container,0:procTree_container,0:sharedComp_container,1:grid_layout,1:search,1:help,2:peComponentProperties,2:peAttributesTabPanel,2:pePrintingTabPanel',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12027998320694478,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P130_W5051906577678195',
    p_attribute_value => '5053430969682717____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12109269627370423,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_IG_712080000591813402_CURRENT_REPORT',
    p_attribute_value => '712386498335634625:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12110419308399759,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P686_W193349113387403920',
    p_attribute_value => '193350031644403928____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12410578047593120,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_101_P10034_W10688523506166223',
    p_attribute_value => '10692845814166550____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12051534859557594,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_101_P10010_W10655334137165817',
    p_attribute_value => '10658483409166151____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12107348551304146,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P4110_W1548412223182178',
    p_attribute_value => '1550029190194632____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11082590458543210,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P1600_W157709960601474178',
    p_attribute_value => '157712384670549138____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11331421140732759,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4000_P1922_R922351464945024904_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12107799059311652,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_IG_9499495849275742_CURRENT_REPORT',
    p_attribute_value => '23204494782337413:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12110235409399539,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P87_W631182707640434600',
    p_attribute_value => '631183407357435034____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12228957757518788,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'WIZARD_SQL_SOURCE_TYPE',
    p_attribute_value => 'TABLE',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11745659697196363,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4500_P2102_R5737432600960966_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12009767304941924,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4350_P55_W10236304983033455',
    p_attribute_value => '10238325656034902____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12010267219948271,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'PERSISTENT_ITEM_P34_ROWS',
    p_attribute_value => '',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12010329871948280,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP4000_P34_R77549119545304597_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12011143734951369,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P527_W478911116494917969',
    p_attribute_value => '478911808086918993____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12011309632952190,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P516_W478906809191866600',
    p_attribute_value => '478908119205874812____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12011557444952311,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P273_W48571614952501952',
    p_attribute_value => '48572307979502610____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12109707712398943,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P419_W5092616502941838',
    p_attribute_value => '5093412475942218____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 13040156528649875,
    p_user_id => 'ANNA',
    p_preference_name => 'FSP_IR_101_P10041_W10739102218166693',
    p_attribute_value => '10740625227167008____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16712960123382888,
    p_user_id => 'ANNA',
    p_preference_name => 'FSP_IR_101_P10032_W10706000526166572',
    p_attribute_value => '10708832874166579____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16713184155383765,
    p_user_id => 'ANNA',
    p_preference_name => 'FSP_IR_101_P10033_W10696489948166554',
    p_attribute_value => '10702440683166569____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11606764188762678,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P939_W451352700445603348',
    p_attribute_value => '451353909559603360____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11938067236688776,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'F4000_203904827661009901_SPLITTER_STATE',
    p_attribute_value => '384:false',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12010922343950931,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P514_W478900029710775865',
    p_attribute_value => '478900807852776971____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12025167010585882,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P4910_W3738700462051133',
    p_attribute_value => '3741124531126093____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16822352691334001,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4850T3',
    p_attribute_value => '556403733815126066',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16822466172334003,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4003T3',
    p_attribute_value => '556394903837090864.4003',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16822597144334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4023T101',
    p_attribute_value => '556395613003092800.4023',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16822683762334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4053T3',
    p_attribute_value => '556397202054096672.4053',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16822705657334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4303T3',
    p_attribute_value => '556397718560100358.4303',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16822813632334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4353T3',
    p_attribute_value => '556398801399103962.4353',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16822983465334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4503T3',
    p_attribute_value => '556400064664109422.4503',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16823041681334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4553T3',
    p_attribute_value => '556400313932111365.4553',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16823101005334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4603T101',
    p_attribute_value => '556401349222114691.4603',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16823205683334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4653T3',
    p_attribute_value => '556401691879116466.4653',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16823329259334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4703T3',
    p_attribute_value => '556402525655120954.4703',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16823412514334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4753T3',
    p_attribute_value => '556402834682122674.4753',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16823540561334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4853T3',
    p_attribute_value => '556403733815126066.4853',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16823639634334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4001T3',
    p_attribute_value => '556394903837090864.4001',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16823779870334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4021T101',
    p_attribute_value => '556395613003092800.4021',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16823845833334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4051T3',
    p_attribute_value => '556397202054096672.4051',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16823935003334004,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4301T3',
    p_attribute_value => '556397718560100358.4301',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16824068860334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4351T3',
    p_attribute_value => '556398801399103962.4351',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16824100104334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4501T3',
    p_attribute_value => '556400064664109422.4501',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16824211880334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4551T3',
    p_attribute_value => '556400313932111365.4551',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16824353277334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4601T101',
    p_attribute_value => '556401349222114691.4601',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16824449040334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4651T3',
    p_attribute_value => '556401691879116466.4651',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16824516392334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4701T3',
    p_attribute_value => '556402525655120954.4701',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16824627328334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4751T3',
    p_attribute_value => '556402834682122674.4751',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16824706293334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4851T3',
    p_attribute_value => '556403733815126066.4851',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16824845532334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4002T3',
    p_attribute_value => '556394903837090864.4002',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16824989776334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4022T101',
    p_attribute_value => '556395613003092800.4022',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16825085866334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4052T3',
    p_attribute_value => '556397202054096672.4052',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16825154746334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4302T3',
    p_attribute_value => '556397718560100358.4302',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16825266178334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4352T3',
    p_attribute_value => '556398801399103962.4352',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16825369548334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4502T3',
    p_attribute_value => '556400064664109422.4502',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16825475290334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4552T3',
    p_attribute_value => '556400313932111365.4552',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16825523453334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4602T101',
    p_attribute_value => '556401349222114691.4602',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16825675149334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4652T3',
    p_attribute_value => '556401691879116466.4652',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16825708083334005,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4702T3',
    p_attribute_value => '556402525655120954.4702',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16825812580334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4752T3',
    p_attribute_value => '556402834682122674.4752',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16825944075334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4852T3',
    p_attribute_value => '556403733815126066.4852',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16826008409334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4004T3',
    p_attribute_value => '556394903837090864.4004',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16826111707334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4024T101',
    p_attribute_value => '556395613003092800.4024',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16826286010334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4054T3',
    p_attribute_value => '556397202054096672.4054',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16826336830334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4304T3',
    p_attribute_value => '556397718560100358.4304',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16826461389334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4354T3',
    p_attribute_value => '556398801399103962.4354',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16826530613334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4504T3',
    p_attribute_value => '556400064664109422.4504',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16826648953334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4554T3',
    p_attribute_value => '556400313932111365.4554',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16826762160334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4604T101',
    p_attribute_value => '556401349222114691.4604',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16826846824334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4654T3',
    p_attribute_value => '556401691879116466.4654',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16826904875334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4704T3',
    p_attribute_value => '556402525655120954.4704',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16827076665334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4754T3',
    p_attribute_value => '556402834682122674.4754',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16827190281334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4854T3',
    p_attribute_value => '556403733815126066.4854',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16827235273334006,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4009T3',
    p_attribute_value => '556394903837090864.4009',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16827356911334007,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4000T3',
    p_attribute_value => '556394903837090864',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16827462305334007,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4020T101',
    p_attribute_value => '556395613003092800',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16827542068334007,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4350T3',
    p_attribute_value => '556398801399103962',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16827665870334007,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4050T3',
    p_attribute_value => '556397202054096672',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16827730818334008,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4550T3',
    p_attribute_value => '556400313932111365',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16827808095334008,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4600T101',
    p_attribute_value => '556401349222114691',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16827928734334008,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4650T3',
    p_attribute_value => '556401691879116466',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16828015558334008,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4700T3',
    p_attribute_value => '556402525655120954',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16828175184334009,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4750T3',
    p_attribute_value => '556402834682122674',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16828262282334009,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4500T3',
    p_attribute_value => '556400064664109422',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16828309061334009,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4300T3',
    p_attribute_value => '556397718560100358',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16828445028334010,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4307T3',
    p_attribute_value => '556397718560100358.4307',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16828501121334010,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4357T3',
    p_attribute_value => '556398801399103962.4357',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16828629474334010,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4507T3',
    p_attribute_value => '556400064664109422.4507',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16828797648334010,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4557T3',
    p_attribute_value => '556400313932111365.4557',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16828808735334010,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4607T101',
    p_attribute_value => '556401349222114691.4607',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16828946375334010,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4657T3',
    p_attribute_value => '556401691879116466.4657',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16829085335334010,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4707T3',
    p_attribute_value => '556402525655120954.4707',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16829130844334010,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4757T3',
    p_attribute_value => '556402834682122674.4757',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16829222927334010,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4857T3',
    p_attribute_value => '556403733815126066.4857',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16829399874334010,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4029T101',
    p_attribute_value => '556395613003092800.4029',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16829456252334010,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4059T3',
    p_attribute_value => '556397202054096672.4059',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16829580544334010,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4309T3',
    p_attribute_value => '556397718560100358.4309',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16829664802334010,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4359T3',
    p_attribute_value => '556398801399103962.4359',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16829720100334011,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4509T3',
    p_attribute_value => '556400064664109422.4509',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16829877087334011,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4559T3',
    p_attribute_value => '556400313932111365.4559',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16829983134334011,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4609T101',
    p_attribute_value => '556401349222114691.4609',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16830059996334011,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4659T3',
    p_attribute_value => '556401691879116466.4659',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16830152989334011,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4709T3',
    p_attribute_value => '556402525655120954.4709',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16830263750334011,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4759T3',
    p_attribute_value => '556402834682122674.4759',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16830300584334011,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4859T3',
    p_attribute_value => '556403733815126066.4859',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11083493148557614,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P1901_W3290607658489431',
    p_attribute_value => '3451665554620404____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11083822856559902,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P1902_W244646688122363336',
    p_attribute_value => '244807746018494309____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11285738240466070,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_IG_225857161514926537_CURRENT_REPORT',
    p_attribute_value => '229170045038968477:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11382129168945646,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'PD_ENABLE_COMPONENT_VIEW',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 11482624508367703,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_101_P10031_W10711441792166594',
    p_attribute_value => '10714948299166625____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12009154608939105,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_101_P10041_W10739102218166693',
    p_attribute_value => '10740625227167008____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12024836248580817,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'ADVISOR_CHECKS',
    p_attribute_value => 'SUBSTITUTION_SYNTAX:COLUMN_SYNTAX:BIND_VARIABLE_SYNTAX:APPL_PAGE_ITEM_REF:PAGE_NUMBER_EXISTS:VALID_SQL_PLSQL_CODE:DML_PROCESSES:BRANCH_SEQUENCE:WHEN_BUTTON_PRESSED:BUTTON_DA_COMPATIBLE:SQL_INJECTION:INSECURE_APPLICATION_DEFAULTS:AUTHORIZATION:SESSION_STATE_PROTECTION:BROWSER_SECURITY:IS_ITEM_OF_TARGET_PAGE:PAGE_ITEM_REF_AS_STRING:CLEAR_CACHE_PAGE_NUMBER:ITEM_NAME_LENGTH:BUTTON_DA_INCONSISTENT_REFS:AJAX_ITEMS_WITH_SSP:V_FUNCTION_IN_SQL:UI_INCLUDES_COMPATIBILITY_JS:HARDCODED_APPLICATION_ID:REPORT_DEFAULT_ORDER:HAS_HELP_TEXT:DEPRECATED_ATTRIBUTES:VALIDATION_ASSOCIATED_ITEM:THEME_STYLE_IS_ACCESSIBLE:HAS_PAGE_TITLE:REGION_HAS_ROW_HEADER:ITEM_HAS_LABEL:ITEMS_NO_CONTEXT_CHANGE:IMAGE_ITEM_HAS_ALT',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12028190996694930,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_4000_P4850_W663191354226602129',
    p_attribute_value => '663193778295677089____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 12410217021589953,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'FSP_IR_101_P10033_W10696489948166554',
    p_attribute_value => '10702440683166569____',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16830428207334011,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4008T3',
    p_attribute_value => '556394903837090864.4008',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16830565682334011,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4028T101',
    p_attribute_value => '556395613003092800.4028',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16830687492334011,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4058T3',
    p_attribute_value => '556397202054096672.4058',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16830719435334011,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4308T3',
    p_attribute_value => '556397718560100358.4308',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16830870697334011,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4358T3',
    p_attribute_value => '556398801399103962.4358',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16830900095334011,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4508T3',
    p_attribute_value => '556400064664109422.4508',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16831071159334011,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4558T3',
    p_attribute_value => '556400313932111365.4558',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16831125044334012,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4608T101',
    p_attribute_value => '556401349222114691.4608',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16831217369334012,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4658T3',
    p_attribute_value => '556401691879116466.4658',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16831338619334012,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4708T3',
    p_attribute_value => '556402525655120954.4708',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16831488705334012,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4758T3',
    p_attribute_value => '556402834682122674.4758',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16831548413334012,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4858T3',
    p_attribute_value => '556403733815126066.4858',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16831629161334012,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4005T3',
    p_attribute_value => '556394903837090864.4005',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16831726546334012,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4025T101',
    p_attribute_value => '556395613003092800.4025',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16831836811334012,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4055T3',
    p_attribute_value => '556397202054096672.4055',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16831972845334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4305T3',
    p_attribute_value => '556397718560100358.4305',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16832018174334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4355T3',
    p_attribute_value => '556398801399103962.4355',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16832104398334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4505T3',
    p_attribute_value => '556400064664109422.4505',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16832233832334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4555T3',
    p_attribute_value => '556400313932111365.4555',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16832362509334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4605T101',
    p_attribute_value => '556401349222114691.4605',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16832489820334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4655T3',
    p_attribute_value => '556401691879116466.4655',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16832550104334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4705T3',
    p_attribute_value => '556402525655120954.4705',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16832617860334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4755T3',
    p_attribute_value => '556402834682122674.4755',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16832769969334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4855T3',
    p_attribute_value => '556403733815126066.4855',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16832824824334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4006T3',
    p_attribute_value => '556394903837090864.4006',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16832947578334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4026T101',
    p_attribute_value => '556395613003092800.4026',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16833015375334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4056T3',
    p_attribute_value => '556397202054096672.4056',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16833182273334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4306T3',
    p_attribute_value => '556397718560100358.4306',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16833299478334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4356T3',
    p_attribute_value => '556398801399103962.4356',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16833319061334013,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4506T3',
    p_attribute_value => '556400064664109422.4506',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16833455895334014,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4556T3',
    p_attribute_value => '556400313932111365.4556',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16833580956334014,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4606T101',
    p_attribute_value => '556401349222114691.4606',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16833695592334014,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4656T3',
    p_attribute_value => '556401691879116466.4656',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16833784915334014,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4706T3',
    p_attribute_value => '556402525655120954.4706',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16833871577334014,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4756T3',
    p_attribute_value => '556402834682122674.4756',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16833935294334014,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4856T3',
    p_attribute_value => '556403733815126066.4856',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16834076237334014,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4007T3',
    p_attribute_value => '556394903837090864.4007',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16834117856334014,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4027T101',
    p_attribute_value => '556395613003092800.4027',
    p_tenant_id => '');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 16834252446334014,
    p_user_id => 'MLOPSU1',
    p_preference_name => 'APEX_THEME_STYLE_A4057T3',
    p_attribute_value => '556397202054096672.4057',
    p_tenant_id => '');
end;
/
----------------
--query builder
--
----------------
--sql scripts
--
----------------
--sql commands
--
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12111592353458530
 ,p_command => 
'select distinct RESIDENTAL_STATUS from credit_scoring'
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111070437','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12111845894469362
 ,p_command => 
'select distinct GENDER from credit_scoring'
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111070439','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12112150745476203
 ,p_command => 
'select distinct PRESENT_EMPLOYMENT_SINCE from credit_scoring'
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111070440','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12112238061481038
 ,p_command => 
'select distinct FAMILY_SIZE from credit_scoring'
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111070441','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 13043844616471921
 ,p_command => 
'alter table "APPLICANTS" add'||wwv_flow.LF||
'("RELEASE" VARCHAR2(5))'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111110306','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12111661434464725
 ,p_command => 
'select distinct LOAN_AMOUNT from credit_scoring'
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111070438','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 11613906625018493
 ,p_command => 
'alter table "CUSTOMERS" add'||wwv_flow.LF||
'("CREDIT_SCORING" NUMBER)'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111040557','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 10118823936109193
 ,p_command => 
'drop VIEW "SALES_V"'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111020659','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 11758563938304787
 ,p_command => 
'alter table "CUSTOMERS" add constraint'||wwv_flow.LF||
'"CUSTOMERS_CREDITSCORE" foreign key ("CREDIT_SCORING") references "CREDIT_SCORING" ("CUSTOMER_ID")'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111040645','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 11758774269318190
 ,p_command => 
'alter table "CUSTOMERS" add constraint'||wwv_flow.LF||
'"CUSTOMERS_CREDITSCORE_UNIQUE" unique ("CREDIT_SCORING")'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111040647','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 11758807068324090
 ,p_command => 
'alter table "CUSTOMERS" add constraint'||wwv_flow.LF||
'"CUSTOMERS_CREDITSCORE" foreign key ("CREDIT_SCORING") references "CREDIT_SCORING" ("CUSTOMER_ID")'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111040648','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12112022215473795
 ,p_command => 
'select distinct TENURE from credit_scoring'
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111070440','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12112314144483353
 ,p_command => 
'select distinct OCCUPATION from credit_scoring'
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111070441','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 10118745903108351
 ,p_command => 
'drop VIEW "CUSTOMER_V"'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111020659','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12029136923825287
 ,p_command => 
'select "CREDIT_SCORING",'||wwv_flow.LF||
'    null link_class,'||wwv_flow.LF||
'    apex_page.get_url(p_items => ''P12_CREDIT_SCORING'', p_values => "CREDIT_SCORING") link,'||wwv_flow.LF||
'    null icon_class,'||wwv_flow.LF||
'    null link_attr,'||wwv_flow.LF||
'    null icon_color_class,'||wwv_flow.LF||
'    case when nvl(:P12_CREDIT_SCORING,''0'') = "CREDIT_SCORING"'||wwv_flow.LF||
'      then ''is-active'' '||wwv_flow.LF||
'      else '' '''||wwv_flow.LF||
'    end list_class,'||wwv_flow.LF||
'    substr("FULL_NAME", 1, 50)||( case when length("FULL_NAME") > 50 then '||
'''...'' end ) list_title,'||wwv_flow.LF||
'    substr("EMAIL_ADDRESS", 1, 50)||( case when length("EMAIL_ADDRESS") > 50 then ''...'' end ) list_text,'||wwv_flow.LF||
'    null list_badge'||wwv_flow.LF||
'from "CUSTOMERS" x'||wwv_flow.LF||
'where (:P12_SEARCH is null'||wwv_flow.LF||
'        or upper(x."FULL_NAME") like ''%''||upper(:P12_SEARCH)||''%'''||wwv_flow.LF||
'        or upper(x."EMAIL_ADDRESS") like ''%''||upper(:P12_SEARCH)||''%'''||wwv_flow.LF||
'    ) and CREDIT_SCORING IS NOT NULL'||wwv_flow.LF||
'order by "FULL_NAME"'
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111041918','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12185466979952197
 ,p_command => 
'alter table "APPLICANTS" add'||wwv_flow.LF||
'("AGE" NUMBER)'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111070600','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12059028038705905
 ,p_command => 
'select "CREDIT_SCORING",'||wwv_flow.LF||
'    null link_class,'||wwv_flow.LF||
'    apex_page.get_url(p_items => ''P12_CREDIT_SCORING'', p_values => "CREDIT_SCORING") link,'||wwv_flow.LF||
'    null icon_class,'||wwv_flow.LF||
'    null link_attr,'||wwv_flow.LF||
'    null icon_color_class,'||wwv_flow.LF||
'    case when nvl(:P12_CREDIT_SCORING,''0'') = "CREDIT_SCORING"'||wwv_flow.LF||
'      then ''is-active'' '||wwv_flow.LF||
'      else '' '''||wwv_flow.LF||
'    end list_class,'||wwv_flow.LF||
'    substr("FULL_NAME", 1, 50)||( case when length("FULL_NAME") > 50 then '||
'''...'' end ) list_title,'||wwv_flow.LF||
'    substr("EMAIL_ADDRESS", 1, 50)||( case when length("EMAIL_ADDRESS") > 50 then ''...'' end ) list_text,'||wwv_flow.LF||
'    null list_badge'||wwv_flow.LF||
'from "CUSTOMERS" x'||wwv_flow.LF||
'where (:P12_SEARCH is null'||wwv_flow.LF||
'        or upper(x."FULL_NAME") like ''%''||upper(:P12_SEARCH)||''%'''||wwv_flow.LF||
'        or upper(x."EMAIL_ADDRESS") like ''%''||upper(:P12_SEARCH)||''%'''||wwv_flow.LF||
'    ) and CREDIT_SCORING IS NOT NULL'||wwv_flow.LF||
'order by "FULL_NAME"'
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111050852','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12153792649627711
 ,p_command => 
'drop TABLE "APPLICANTS"'||wwv_flow.LF||
'cascade constraints'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111070505','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 11758614421308527
 ,p_command => 
'alter table "CUSTOMERS" add constraint'||wwv_flow.LF||
'"CUSTOMERS_CREDITSCORE" foreign key ("CREDIT_SCORING") references "CREDIT_SCORING" ("CUSTOMER_ID")'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111040646','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 11758990586330210
 ,p_command => 
'alter table "CREDIT_SCORING" add constraint'||wwv_flow.LF||
'"CREDIT_SCORING_CUST_ID" unique ("CUSTOMER_ID")'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111040649','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 11759024705334768
 ,p_command => 
'alter table "CUSTOMERS" add constraint'||wwv_flow.LF||
'"CUSTOMERS_CREDITSCORE" foreign key ("CREDIT_SCORING") references "CREDIT_SCORING" ("CUSTOMER_ID")'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111040650','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12111302272451945
 ,p_command => 
'select distinct MARITAL_STATUS from credit_scoring'
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111070436','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12111738889467352
 ,p_command => 
'select distinct INCOME from credit_scoring'
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111070439','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12111422145455140
 ,p_command => 
'select distinct EDUCATION_LEVEL from credit_scoring'
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111070437','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12111969465471259
 ,p_command => 
'select distinct NUMBER_OF_PRIOR_LOANS from credit_scoring'
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111070439','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
begin
  wwv_flow_api.create_sw_sql_cmds (
    p_id => 12198290855153953
 ,p_command => 
'alter table "APPLICANTS" add'||wwv_flow.LF||
'("RESULT" VARCHAR2(2000))'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'MLOPSU1'
    ,p_created_on => to_date('202111070633','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MLOPSU1');
end;
/
----------------
--Quick SQL saved models
--
----------------
--user access log
--
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'ANNA',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202230916','YYYYMMDDHH24MI'),
    p_ip_address => '137.254.7.167',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'ANNA',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202230843','YYYYMMDDHH24MI'),
    p_ip_address => '148.87.23.7',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'JAMES',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202203020818','YYYYMMDDHH24MI'),
    p_ip_address => '192.188.170.87',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'ANNA',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202203080324','YYYYMMDDHH24MI'),
    p_ip_address => '121.6.37.209',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'RODNEY.SOWIRONO@ORACLE.COM',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_210100',
    p_access_date => to_date('202202230809','YYYYMMDDHH24MI'),
    p_ip_address => '148.87.23.7',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'JAMES',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202240704','YYYYMMDDHH24MI'),
    p_ip_address => '101.100.174.40',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'JAMES',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202240731','YYYYMMDDHH24MI'),
    p_ip_address => '101.100.174.40',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'ANNA',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202230841','YYYYMMDDHH24MI'),
    p_ip_address => '148.87.23.7',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'ANNA',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202230848','YYYYMMDDHH24MI'),
    p_ip_address => '148.87.23.7',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'JAMES',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202230800','YYYYMMDDHH24MI'),
    p_ip_address => '148.87.23.7',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'JAMES',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202230847','YYYYMMDDHH24MI'),
    p_ip_address => '148.87.23.7',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'ANNA',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202230849','YYYYMMDDHH24MI'),
    p_ip_address => '148.87.23.7',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'MLOPSU1',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_210100',
    p_access_date => to_date('202202230816','YYYYMMDDHH24MI'),
    p_ip_address => '148.87.23.7',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'JAMES',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202240701','YYYYMMDDHH24MI'),
    p_ip_address => '101.100.174.40',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'MLOPSU1',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_210100',
    p_access_date => to_date('202202240905','YYYYMMDDHH24MI'),
    p_ip_address => '101.100.174.40',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'ANNA',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202240906','YYYYMMDDHH24MI'),
    p_ip_address => '101.100.174.40',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'ANNA',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202203070352','YYYYMMDDHH24MI'),
    p_ip_address => '202.187.156.61',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'JAMES',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202230839','YYYYMMDDHH24MI'),
    p_ip_address => '148.87.23.7',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'MLOPSU1',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_210100',
    p_access_date => to_date('202202240742','YYYYMMDDHH24MI'),
    p_ip_address => '101.100.174.40',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'ANNA',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202230846','YYYYMMDDHH24MI'),
    p_ip_address => '148.87.23.7',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'ANNA',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202203070355','YYYYMMDDHH24MI'),
    p_ip_address => '202.187.156.61',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'MLOPSU1',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_210100',
    p_access_date => to_date('202202230814','YYYYMMDDHH24MI'),
    p_ip_address => '148.87.23.7',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 1,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'ANNA',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202240703','YYYYMMDDHH24MI'),
    p_ip_address => '101.100.174.40',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'ANNA',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202202240735','YYYYMMDDHH24MI'),
    p_ip_address => '101.100.174.40',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ANNA',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202203140235','YYYYMMDDHH24MI'),
    p_ip_address => '101.100.174.40',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'MLOPSU1',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_210100',
    p_access_date => to_date('202203160601','YYYYMMDDHH24MI'),
    p_ip_address => '148.87.23.9',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'MLOPSU1',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_210100',
    p_access_date => to_date('202203160604','YYYYMMDDHH24MI'),
    p_ip_address => '148.87.23.9',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ANNA',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'MLOPSU1',
    p_access_date => to_date('202203140233','YYYYMMDDHH24MI'),
    p_ip_address => '101.100.174.40',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'MLOPSU1',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_210100',
    p_access_date => to_date('202203160812','YYYYMMDDHH24MI'),
    p_ip_address => '116.14.195.64',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'MLOPSU1',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_210100',
    p_access_date => to_date('202203160844','YYYYMMDDHH24MI'),
    p_ip_address => '116.14.195.64',
    p_remote_user => 'ORDS_PLSQL_GATEWAY',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
prompt Check Compatibility...
begin
-- This date identifies the minimum version required to import this file.
wwv_flow_team_api.check_version(p_version_yyyy_mm_dd=>'2010.05.13');
end;
/
 
begin wwv_flow.g_import_in_progress := true; wwv_flow.g_user := USER; end; 
/
 
--
prompt ...feedback
--
begin
null;
end;
/
--
prompt ...Issue Templates
--
begin
null;
end;
/
--
prompt ...Issue Email Prefs
--
begin
null;
end;
/
--
prompt ...Label Groups
--
begin
null;
end;
/
--
prompt ...Labels
--
begin
null;
end;
/
--
prompt ... Milestones
--
begin
null;
end;
/
--
prompt ... Issues
--
begin
null;
end;
/
--
prompt ... Issue Attachments
--
begin
null;
end;
/
--
prompt ... Issues Milestones
--
begin
null;
end;
/
--
prompt ... Issues Labels
--
begin
null;
end;
/
--
prompt ... Issues stakeholders
--
begin
null;
end;
/
--
prompt ... Issues Comments
--
begin
null;
end;
/
--
prompt ... Issues Events
--
begin
null;
end;
/
--
prompt ... Issues Notifications
--
begin
null;
end;
/
 
prompt ...workspace objects
 
begin
wwv_flow_api.create_credential(
 p_id=>wwv_flow_api.id(11082852914551962)
,p_name=>'OCI API Access'
,p_static_id=>'OCI_API_ACCESS'
,p_authentication_type=>'OCI'
,p_namespace=>'ocid1.tenancy.oc1..aaaaaaaa5nras26nkpnlcd4g3ox6gfmzjaahxwb245stlrh7krkfrpu2nu5q'
,p_prompt_on_install=>true
);
end;
/
begin
wwv_flow_api.create_remote_server(
 p_id=>wwv_flow_api.id(11282619029462769)
,p_name=>'modeldeployment-us-ashburn-1-oci-customer-oci-com'
,p_static_id=>'modeldeployment_us_ashburn_1_oci_customer_oci_com'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('modeldeployment_us_ashburn_1_oci_customer_oci_com'),'https://modeldeployment.us-ashburn-1.oci.customer-oci.com/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('modeldeployment_us_ashburn_1_oci_customer_oci_com'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('modeldeployment_us_ashburn_1_oci_customer_oci_com'),'')
,p_prompt_on_install=>false
);
end;
/
 
prompt ...RESTful Services
 
-- SET SCHEMA
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'MLOPSU1';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA MLOPSU1 - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_210100
-- Exported 08:49 Wednesday March 16, 2022 by: MLOPSU1
--
 
--------------------------------------------------------------------
prompt User Interface Defaults, Attribute Dictionary
--
-- Exported 08:49 Wednesday March 16, 2022 by: MLOPSU1
--
-- SHOW EXPORTING WORKSPACE
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_exp_workspace := 'MLOPS';
 
end;
/

begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
