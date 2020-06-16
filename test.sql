begin
MERGE INTO  fis_net_result T1
USING
(SELECT '48a4723f4d00' as account_name,
'172.29.120.252' as nas_ip,
'cnsvwnbmesd0001.MES.SVW' as machine_name,
'4/20/2020 9:07:50 AM' as date_latest,
'4/20/2020 9:05:27 AM' as date_earliest,
'2020-04-20 09:11:31.092' as updatetime 
FROM dual) T2
 on (T1.account_name = T2.account_name)
WHEN MATCHED THEN
  UPDATE SET T1.date_latest = T2.date_latest,T1.updatetime = T2.updatetime,
WHEN NOT MATCHED THEN
  INSERT (T1.account_name, T1.nas_ip, T1.machine_name, T1.date_latest, T1.date_earliest, T1.updatetime)
  VALUES (T2.account_name, T2.nas_ip, T2.machine_name, T2.date_latest, T2.date_earliest, T2.updatetime);
commit;
end;


begin
MERGE INTO  fis_net_result T1
USING 
(SELECT 'e4a7a01c1b22' as account_name, 
'ip ' as nas_ip,'machine_name ' as machine_name, '4/14/2020 3:12:47 AM  ' as date_latest, '4/14/2020 3:12:47 AM  ' as date_earliest,'2020-04-20 08:50:30.071' as updatetime FROM dual) T2 
  on (T1.account_name = T2.account_name)
WHEN MATCHED THEN 
  UPDATE SET T1.date_latest = T2.date_latest,T1.updatetime = T2.updatetime
WHEN NOT MATCHED THEN  
  INSERT (T1.account_name, T1.nas_ip, T1.machine_name, T1.date_latest, T1.date_earliest, T1.updatetime)
  VALUES (T2.account_name, T2.nas_ip, T2.machine_name, T2.date_latest, T2.date_earliest, T2.updatetime);
commit;
end;