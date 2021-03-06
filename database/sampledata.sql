
-- sample data
BEGIN WORK;

INSERT INTO config (section, params, ts, uid) VALUES ('schedule', '"mode_override"=>"hzhz"', '2014-02-28 16:03:18.471943+04', 189);
INSERT INTO config (section, params, ts, uid) VALUES ('ui', '"language"=>"ru"', '2014-03-13 23:42:12.880679+04', 189);
INSERT INTO config (section, params, ts, uid) VALUES ('route', '"debug"=>"true", "schedule_override"=>""', '2014-03-14 06:22:03.983468+04', 189);


INSERT INTO ipnetworks(net, id) VALUES ('192.168.0/17',  1);
INSERT INTO ipnetworks(net, id) VALUES ('192.168.48/24', 2);
INSERT INTO ipnetworks(net, id) VALUES ('10.0.0/24',     1);


INSERT INTO fingroups (name) VALUES ('Sales');
INSERT INTO fingroups (name) VALUES ('Accounting');


INSERT INTO directory(num, numtype, descr) VALUES ('222', 'user', 'vir test spa962');
INSERT INTO users (num, alias, domain, password, login, badges, fingrp, secure) VALUES ('222', 'vir', 'voip.ctm.ru', '222', 'vir@ctm.ru', '{admin,finance}', NULL, 'ssl');
INSERT INTO directory(num, numtype, descr) VALUES ('223', 'user', 'vir test2');
INSERT INTO users (num, alias, domain, password, login, badges, fingrp, secure) VALUES ('223', 'vir2', 'voip.ctm.ru', '223', NULL, '{}', 2, 'on');
INSERT INTO directory(num, numtype, descr) SELECT s::TEXT, 'user', 'test user ' || s::TEXT FROM generate_series(224, 239) AS s;
INSERT INTO users (num, domain, password, fingrp) SELECT s::TEXT, 'voip.ctm.ru', s::TEXT, 1 FROM generate_series(224, 239) AS s;


INSERT INTO directory(num, numtype, descr) VALUES ('822', 'ivr', 'Sample auto-attendant');
INSERT INTO ivr_aa(num, prompt, timeout, e1, e2, e3, etimeout) VALUES (
	'822', '/home/vir/menu.au', 5,
	'115', '106', '223', '496');


INSERT INTO directory(num, numtype, descr) VALUES ('823', 'ivr', 'Sample auto-attendant 2');
INSERT INTO ivr_minidisa(num, prompt, timeout, numlen, firstdigit, etimeout) VALUES (
	'823', '/home/vir/disa.au', 15, 3, '123', '222');

-- INSERT INTO directory VALUES ('898', 'ivr', 'new ivr test', false);
-- INSERT INTO ivr_aa2 (num, prompt, timeout, shortnum, numlen, numtypes, assist, etimeout) VALUES(898, '/home/vir/menu2.au', '{3,2,7}'::INTEGER[], '1=>111,2=>222'::HSTORE, 4, '{user,callgrp}'::TEXT[], TRUE, 10);


INSERT INTO directory(num, numtype, descr) VALUES ('666', 'abbr', 'xxx mobile');
INSERT INTO abbrs (num, target) VALUES ('666', '+79210000001');
INSERT INTO directory(num, numtype, descr) VALUES ('#1', 'abbr', 'some other mobile');
INSERT INTO abbrs (num, owner, target) VALUES ('#1', (SELECT id FROM users WHERE num = '222'), '+79210000002');


INSERT INTO incoming(ctx, called, mode, route) VALUES ('from_outside', NULL,      NULL,      '888');
INSERT INTO incoming(ctx, called, mode, route) VALUES ('from_outside', '3259753', NULL,      '887');
INSERT INTO incoming(ctx, called, mode, route) VALUES ('from_outside', NULL,      'evening', '889');
INSERT INTO incoming(ctx, called, mode, route) VALUES ('from_outside', NULL,      'night',   '886');
INSERT INTO incoming(ctx, called, mode, route) VALUES ('from_outside', NULL,      'work',    '885');


INSERT INTO morenums(uid, numkind, val, div_noans, div_offline) VALUES ((SELECT id FROM users WHERE num = '222'), 1, '+7-921-1234567', true, false);
INSERT INTO morenums(uid, numkind, val, div_noans, div_offline) VALUES ((SELECT id FROM users WHERE num = '222'), 2, '+7-812-1234567', true, true );


INSERT INTO blfs (uid, key, num, label) VALUES (1, '1', '224', NULL);
INSERT INTO blfs (uid, key, num, label) VALUES (1, '4', '223', NULL);
INSERT INTO blfs (uid, key, num, label) VALUES (1, '5', '+79213131113', 'cell');
INSERT INTO blfs (uid, key, num, label) VALUES (1, '7', '+78125858390', 'нет нигде');
INSERT INTO blfs (uid, key, num, label) VALUES (1, '8', '5010', NULL);
INSERT INTO blfs (uid, key, num, label) VALUES (1, '9', '5001', NULL);


INSERT INTO phonebook (id, owner, num, descr, comments, numkind) VALUES (1, NULL, '666223', 'pb-vir test2', 'Comment for vir test2', NULL);
INSERT INTO phonebook (id, owner, num, descr, comments, numkind) VALUES (2, NULL, '666224', 'pb-test user 224', 'Comment for test user 224', NULL);
INSERT INTO phonebook (id, owner, num, descr, comments, numkind) VALUES (3, NULL, '666226', 'pb-test user 226', 'Comment for test user 226', NULL);
INSERT INTO phonebook (id, owner, num, descr, comments, numkind) VALUES (4, NULL, '666227', 'pb-test user 227', 'Comment for test user 227', NULL);
INSERT INTO phonebook (id, owner, num, descr, comments, numkind) VALUES (5, NULL, '666228', 'pb-test user 228', 'Comment for test user 228', NULL);
INSERT INTO phonebook (id, owner, num, descr, comments, numkind) VALUES (6, NULL, '666229', 'pb-test user 229', 'Comment for test user 229', NULL);
INSERT INTO phonebook (id, owner, num, descr, comments, numkind) VALUES (15, NULL, '666108', 'pb-Учебная', 'Comment for Учебная', NULL);
INSERT INTO phonebook (id, owner, num, descr, comments, numkind) VALUES (17, NULL, '666225', 'pb-test user 225', 'Comment for test user 225', NULL);
INSERT INTO phonebook (id, owner, num, descr, comments, numkind) VALUES (28, NULL, '666222', 'pb-vir test spa962', 'Comment for vir test spa962', NULL);
INSERT INTO phonebook (id, owner, num, descr, comments, numkind) VALUES (30, NULL, '666144', 'pb-test user 144', 'Comment for test user 144', NULL);


INSERT INTO provision (uid, hw, devtype, params) VALUES (1, '00:0e:08:d4:8e:b4', 'linksys-spa504g', '"number"=>"one"');
INSERT INTO provision (uid, hw, devtype, params) VALUES (2, '58:bf:ea:11:11:de', 'linksys-spa502g', NULL);
INSERT INTO provision (uid, hw, devtype, params) VALUES (3, '58:bf:ea:11:11:e7', 'linksys-spa502g', NULL);
INSERT INTO provision (uid, hw, devtype, params) VALUES (4, '58:bf:ea:11:11:e8', 'linksys-spa502g', NULL);
INSERT INTO provision (uid, hw, devtype, params) VALUES (5, '58:bf:ea:11:11:f3', 'linksys-spa502g', NULL);
INSERT INTO provision (uid, hw, devtype, params) VALUES (6, '58:bf:ea:11:11:fc', 'linksys-spa502g', NULL);
INSERT INTO provision (uid, hw, devtype, params) VALUES (7, '58:bf:ea:11:11:fd', 'linksys-spa502g', NULL);
INSERT INTO provision (uid, hw, devtype, params) VALUES (8, '64:9e:f3:79:4b:9c', 'linksys-spa502g', NULL);


INSERT INTO vcards (uid, vcard) VALUES (2, '<vCard xmlns="vcard-temp">
<FN>Test 223</FN>
<NICKNAME>t_223</NICKNAME>
</vCard>');



INSERT INTO directory (num, numtype, descr) VALUES ('5000', 'callgrp', 'Test BIG parallel group');
INSERT INTO directory (num, numtype, descr) VALUES ('5001', 'callgrp', 'Test Linear Group');
INSERT INTO directory (num, numtype, descr) VALUES ('5002', 'callgrp', 'Test Group With Queue');
INSERT INTO directory (num, numtype, descr) VALUES ('5003', 'callgrp', 'Test Fourth group');
INSERT INTO directory (num, numtype, descr) VALUES ('5004', 'callgrp', 'Group of groups');
INSERT INTO directory (num, numtype, descr) VALUES ('5005', 'callgrp', 'Simple group');
INSERT INTO directory (num, numtype, descr) VALUES ('5006', 'callgrp', 'grup with infinite recursion');
INSERT INTO callgroups (num, distr, rotary_last, ringback, maxcall, exitpos) VALUES ('5000', 'parallel', 0, 'tone/ring', 20000, NULL);
INSERT INTO callgroups (num, distr, rotary_last, ringback, maxcall, exitpos) VALUES ('5001', 'linear',   0, 'tone/ring', 60000, '266');
INSERT INTO callgroups (num, distr, rotary_last, ringback, maxcall, exitpos) VALUES ('5002', 'queue',    0, NULL,        0,     NULL);
INSERT INTO callgroups (num, distr, rotary_last, ringback, maxcall, exitpos) VALUES ('5003', 'parallel', 0, NULL,        0,     NULL);
INSERT INTO callgroups (num, distr, rotary_last, ringback, maxcall, exitpos) VALUES ('5004', 'linear',   0, NULL,        0,     NULL);
INSERT INTO callgroups (num, distr, rotary_last, ringback, maxcall, exitpos) VALUES ('5005', 'parallel', 0, NULL,        0,     NULL);
INSERT INTO callgroups (num, distr, rotary_last, ringback, maxcall, exitpos) VALUES ('5006', 'linear',   0, NULL,        0,     NULL);

INSERT INTO queues (id, grp, mintime, length, maxout, greeting, onhold, maxcall, prompt, notify, detail, single) VALUES (1, (SELECT id FROM callgroups WHERE num = '5002'), 500, 0, -1, NULL, NULL, NULL, NULL, NULL, true, false);

-- 5000
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (1, 1, '222', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (1, 2, '223', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (1, 3, '224', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (1, 4, '225', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (1, 5, '226', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (1, 6, '227', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (1, 7, '228', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (1, 8, '229', true);

-- 5001
INSERT INTO callgrpmembers (grp, ord, num, maxcall, enabled, keepring) VALUES (2, 1, '222', 5, true, false);
INSERT INTO callgrpmembers (grp, ord, num, maxcall, enabled, keepring) VALUES (2, 2, '223', 5, true, false);
INSERT INTO callgrpmembers (grp, ord, num, maxcall, enabled, keepring) VALUES (2, 3, '224', 5, true, false);
INSERT INTO callgrpmembers (grp, ord, num, maxcall, enabled, keepring) VALUES (2, 4, '225', 5, true, false);
INSERT INTO callgrpmembers (grp, ord, num, maxcall, enabled, keepring) VALUES (2, 5, '226', 5, true, true);
INSERT INTO callgrpmembers (grp, ord, num, maxcall, enabled, keepring) VALUES (2, 6, '227', 5, true, false);
INSERT INTO callgrpmembers (grp, ord, num, maxcall, enabled, keepring) VALUES (2, 7, '228', 5, true, false);
INSERT INTO callgrpmembers (grp, ord, num, maxcall, enabled, keepring) VALUES (2, 8, '229', 5, true, false);

-- 5002
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (3, 1, '222', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (3, 2, '223', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (3, 3, '224', true);

-- 5003
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (4, 3, '224', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (4, 4, '225', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (4, 5, '226', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (4, 6, '227', true);

-- 5004
INSERT INTO callgrpmembers (grp, ord, num, maxcall, enabled, keepring) VALUES (5, 1, '5003', 5, true, true);
INSERT INTO callgrpmembers (grp, ord, num, maxcall, enabled, keepring) VALUES (5, 2, '5005', 5, true, true);
INSERT INTO callgrpmembers (grp, ord, num, maxcall, enabled, keepring) VALUES (5, 4, '5006', 5, true, false);

-- 5005
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (6, 1, '229', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (6, 2, '230', true);

-- 5006
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (7, 1, '231', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (7, 2, '232', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (7, 3, '5004', true); -- loop!

-- 5007 - see below, in fictive numbers



INSERT INTO pickupgroups (id, callgrepcopy, descr) VALUES (1, NULL, 'Test PickupGroup 1');

INSERT INTO pickupgrpmembers(grp, uid) VALUES (1, 1);
INSERT INTO pickupgrpmembers(grp, uid) VALUES (1, 2);
INSERT INTO pickupgrpmembers(grp, uid) VALUES (1, 3);
INSERT INTO pickupgrpmembers(grp, uid) VALUES (1, 4);
INSERT INTO pickupgrpmembers(grp, uid) VALUES (1, 5);
INSERT INTO pickupgrpmembers(grp, uid) VALUES (1, 6);
INSERT INTO pickupgrpmembers(grp, uid) VALUES (1, 7);


DELETE FROM schedules WHERE name = 'mode';
INSERT INTO schedules(name) VALUES ('mode');
INSERT INTO schedtable(prio,                  tstart, tend, mode, schedule) VALUES ( 0,                                 '00:00', '24:00', 'holiday', currval('schedules_id_seq'));
INSERT INTO schedtable(prio,             dow, tstart, tend, mode, schedule) VALUES (10,                  '{1,2,3,4,5}', '09:00', '18:00', 'work',    currval('schedules_id_seq'));
INSERT INTO schedtable(prio,             dow, tstart, tend, mode, schedule) VALUES (20,                  '{1,2,3,4,5}', '18:00', '21:00', 'evening', currval('schedules_id_seq'));
INSERT INTO schedtable(prio,             dow, tstart, tend, mode, schedule) VALUES (30,                  '{1,2,3,4,5}', '21:00', '24:00', 'night',   currval('schedules_id_seq'));
INSERT INTO schedtable(prio,             dow, tstart, tend, mode, schedule) VALUES (30,                  '{1,2,3,4,5}', '00:00', '09:00', 'night',   currval('schedules_id_seq'));
INSERT INTO schedtable(      mday, days,      tstart, tend, mode, schedule) VALUES (    '2013-12-31', 9,                 '0:00', '24:00', 'holiday', currval('schedules_id_seq'));


INSERT INTO regs(userid, ts, location, expires, device, driver, ip_transport, ip_host, ip_port, audio, route_params) VALUES (1, 'now()', '222@voip.ctm.ru/Yate',                             'now'::TIMESTAMP WITH TIME ZONE + '1 hour'::INTERVAL, NULL, 'jabber', NULL, '192.168.67.222', 23882, true, NULL);
INSERT INTO regs(userid, ts, location, expires, device, driver, ip_transport, ip_host, ip_port, audio, route_params) VALUES (1, 'now()', '223@voip.ctm.ru/Psi+',                             'now'::TIMESTAMP WITH TIME ZONE + '1 hour'::INTERVAL, NULL, 'jabber', NULL, '192.168.67.220', 1883, true, NULL);
INSERT INTO regs(userid, ts, location, expires, device, driver, ip_transport, ip_host, ip_port, audio, route_params) VALUES (1, 'now()', '222@voip.ctm.ru/660f6dfeb76bd5c4b86c233fc5fca4db', 'now'::TIMESTAMP WITH TIME ZONE + '1 hour'::INTERVAL, NULL, 'jabber', NULL, '192.168.67.222', 27716, true, NULL);
INSERT INTO regs(userid, ts, location, expires, device, driver, ip_transport, ip_host, ip_port, audio, route_params) VALUES (1, 'now()', 'somewhere',                                        'now'::TIMESTAMP WITH TIME ZONE + '1 hour'::INTERVAL, NULL, 'hands', NULL, NULL, NULL, true, NULL);
INSERT INTO regs(userid, ts, location, expires, device, driver, ip_transport, ip_host, ip_port, audio, route_params) VALUES (2, 'now()', '223@voip.ctm.ru/a13131a6316fc01cae1f8e79936c31b2', 'now'::TIMESTAMP WITH TIME ZONE + '1 hour'::INTERVAL, NULL, 'jabber', NULL, '192.168.67.220', 4334, true, NULL);
INSERT INTO regs(userid, ts, location, expires, device, driver, ip_transport, ip_host, ip_port, audio, route_params) VALUES (2, 'now()', '223@voip.ctm.ru/bc4244be85e614bceffb92119042837e', 'now'::TIMESTAMP WITH TIME ZONE + '1 hour'::INTERVAL, NULL, 'jabber', NULL, '192.168.67.220', 4370, true, NULL);
INSERT INTO regs(userid, ts, location, expires, device, driver, ip_transport, ip_host, ip_port, audio, route_params) VALUES (2, 'now()', '223@voip.ctm.ru/3291b21f0567ec3dde269efd001ef178', 'now'::TIMESTAMP WITH TIME ZONE + '1 hour'::INTERVAL, NULL, 'jabber', NULL, '192.168.67.220', 2135, true, NULL);
INSERT INTO regs(userid, ts, location, expires, device, driver, ip_transport, ip_host, ip_port, audio, route_params) VALUES (3, 'now()', 'somwhere/far/away',                                'now'::TIMESTAMP WITH TIME ZONE + '1 hour'::INTERVAL, NULL, 'hands', NULL, NULL, NULL, true, NULL);
INSERT INTO regs(userid, ts, location, expires, device, driver, ip_transport, ip_host, ip_port, audio, route_params) VALUES (4, 'now()', 'smewhere',                                         'now'::TIMESTAMP WITH TIME ZONE + '1 hour'::INTERVAL, NULL, 'hands', NULL, NULL, NULL, true, NULL);
INSERT INTO regs(userid, ts, location, expires, device, driver, ip_transport, ip_host, ip_port, audio, route_params) VALUES (5, 'now()', 'sip/sip:226@192.168.50.26:5060',                   'now'::TIMESTAMP WITH TIME ZONE + '1 hour'::INTERVAL, 'Cisco/SPA502G-7.5.5', 'sip', 'UDP', '192.168.50.26', 5060, true, '"oconnection_id"=>"general"');
INSERT INTO regs(userid, ts, location, expires, device, driver, ip_transport, ip_host, ip_port, audio, route_params) VALUES (6, 'now()', 'sip/sip:227@192.168.60.152:48422;transport=TLS;ob','now'::TIMESTAMP WITH TIME ZONE + '1 hour'::INTERVAL, 'CSipSimple_m874-17/r2457', 'sip', 'TLS', '192.168.60.152', 48422, true, '"oconnection_id"=>"tls:192.168.8.53:5061-192.168.60.152:48422"');
INSERT INTO regs(userid, ts, location, expires, device, driver, ip_transport, ip_host, ip_port, audio, route_params) VALUES (7, 'now()', 'sip/sip:228@118.190.212.112:5060;transport=TCP',  'now'::TIMESTAMP WITH TIME ZONE + '1 hour'::INTERVAL, 'MyPBX', 'sip', 'TCP', '188.130.242.162', 56502, true, '"oconnection_id"=>"tcp:99.229.59.30:5060-188.130.242.162:56502"');
INSERT INTO regs(userid, ts, location, expires, device, driver, ip_transport, ip_host, ip_port, audio, route_params) SELECT s::INTEGER, 'now()', 'sip/sip:'||u.num||'@1.2.3.4:5060', 'now'::TIMESTAMP WITH TIME ZONE + '1 hour'::INTERVAL, 'Some PBX', 'sip', 'UDP', '1.2.3.4', 55555, true, '' FROM generate_series(8, 23) AS s INNER JOIN users u ON u.id = s;



INSERT INTO linetracker (uid, direction, status, chan, caller, called, billid) VALUES (1, 'incoming', 'answered', 'sip/951', '165',     '989052693929',   '1390584592-639');
INSERT INTO linetracker (uid, direction, status, chan, caller, called, billid) VALUES (1, 'incoming', 'answered', 'sip/393', '100',     '192',            '1390584592-666');
INSERT INTO linetracker (uid, direction, status, chan, caller, called, billid) VALUES (1, 'outgoing', 'ringing',  'sip/666', '100',     '200',            '1390584592-zzz');
INSERT INTO linetracker (uid, direction, status, chan, caller, called, billid) VALUES (2, 'outgoing', 'answered', 'sip/966', '6666666', '1390584592-777', NULL);
INSERT INTO linetracker (uid, direction, status, chan, caller, called, billid) VALUES (3, 'outgoing', 'ringing',  'sip/393', '100',     '192',            '1390584592-yyy');
INSERT INTO linetracker (uid, direction, status, chan, caller, called, billid) VALUES (4, 'outgoing', 'ringing',  'sip/916', '+7777',   '1390584592-111', NULL);


INSERT INTO prices (pref, price, descr) VALUES ('8818',     4.6500001,  'Архангельская област');
INSERT INTO prices (pref, price, descr) VALUES ('81037517', 8.89999962, 'Беларусь');
INSERT INTO prices (pref, price, descr) VALUES ('8915',     4.96000004, 'Брянская область');
INSERT INTO prices (pref, price, descr) VALUES ('8473',     4.96000004, 'Воронеж');
INSERT INTO prices (pref, price, descr) VALUES ('8717',     8.68000031, 'Казахстан');
INSERT INTO prices (pref, price, descr) VALUES ('8721',     8.68000031, 'Казахстан');
INSERT INTO prices (pref, price, descr) VALUES ('8727',     8.68000031, 'Казахстан');
INSERT INTO prices (pref, price, descr) VALUES ('8923',     6.19999981, 'Красноярский край');
INSERT INTO prices (pref, price, descr) VALUES ('81037167', 8.06000042, 'Латвия');
INSERT INTO prices (pref, price, descr) VALUES ('81037129', 8.06000042, 'Латвия, Моб.');
INSERT INTO prices (pref, price, descr) VALUES ('8813',     2.78999996, 'Ленинградская област');
INSERT INTO prices (pref, price, descr) VALUES ('8495',     1.24000001, 'Москва');
INSERT INTO prices (pref, price, descr) VALUES ('8499',     1.24000001, 'Москва');
INSERT INTO prices (pref, price, descr) VALUES ('8903',     1.24000001, 'Московская область');
INSERT INTO prices (pref, price, descr) VALUES ('8831',     4.96000004, 'Нижегородская област');
INSERT INTO prices (pref, price, descr) VALUES ('8383',     6.19999981, 'Новосибирск');
INSERT INTO prices (pref, price, descr) VALUES ('8814',     4.6500001,  'Петрозаводск');
INSERT INTO prices (pref, price, descr) VALUES ('8811',     4.6500001,  'Псков');
INSERT INTO prices (pref, price, descr) VALUES ('8811',     4.6500001,  'Псковская область');
INSERT INTO prices (pref, price, descr) VALUES ('8911',     4.6500001,  'Псковская область');
INSERT INTO prices (pref, price, descr) VALUES ('8814',     4.6500001,  'Республика Карелия');
INSERT INTO prices (pref, price, descr) VALUES ('8921',     4.6500001,  'Республика Карелия');
INSERT INTO prices (pref, price, descr) VALUES ('8916',     1.24000001, 'Россия мобильные ост');
INSERT INTO prices (pref, price, descr) VALUES ('81099871', 8.68000031, 'Узбекистан');
INSERT INTO prices (pref, price, descr) VALUES ('81038044', 8.68000031, 'Украина');
INSERT INTO prices (pref, price, descr) VALUES ('8346',     6.19999981, 'Ханты−Мансийский АО');
INSERT INTO prices (pref, price, descr) VALUES ('8351',     6.19999981, 'Челябинск');
INSERT INTO prices (pref, price, descr) VALUES ('8878',     4.96000004, 'Черкесск');
INSERT INTO prices (pref, price, descr) VALUES ('81037261', 8.06000042, 'Эстония');
INSERT INTO prices (pref, price, descr) VALUES ('81037255', 8.06000042, 'Эстония, Моб.');
INSERT INTO prices (pref, price, descr) VALUES ('8343',     6.19999981, 'Екатеринбург');

-- fictive numbers
INSERT INTO directory VALUES ('64', 'fictive', 'Pull of fictive numbers', TRUE);
INSERT INTO directory (num, numtype, descr) VALUES ('5007', 'callgrp', 'grup with fictive member');
INSERT INTO callgroups (num, distr, rotary_last, ringback, maxcall, exitpos) VALUES ('5007', 'parallel', 0, NULL,        0,     NULL);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (8, 1, '231', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (8, 2, '232', true);
INSERT INTO callgrpmembers (grp, ord, num, enabled) VALUES (8, 3, '6415', true); -- fictive member

-- switches
INSERT INTO directory(num, numtype, descr, is_prefix) VALUES ('765', 'switch', 'Incoming based on work mode switch', FALSE);
INSERT INTO switches(num, param, arg, defroute) VALUES ('765', 'schedule', 'mode', '888');
INSERT INTO switch_cases(switch, value, route, comments) VALUES (1, 'work',    '885', 'Work time IVR at day');
INSERT INTO switch_cases(switch, value, route, comments) VALUES (1, 'evening', '889', 'Evening IVR at ... evening');
INSERT INTO switch_cases(switch, value, route, comments) VALUES (1, 'night',   '886', 'We are all sleeping');

INSERT INTO directory(num, numtype, descr, is_prefix) VALUES ('764', 'switch', 'Random IVR just for fun', FALSE);
INSERT INTO switches(num, param, defroute) VALUES ('764', 'random', '888');
INSERT INTO switch_cases(switch, value, route, comments) VALUES (2, 'work',    '885', 'Work time IVR at day');
INSERT INTO switch_cases(switch, value, route, comments) VALUES (2, 'evening', '889', 'Evening IVR at ... evening');
INSERT INTO switch_cases(switch, value, route, comments) VALUES (2, 'night',   '886', 'We are all sleeping');

-- more schedules
INSERT INTO schedules(name) VALUES ('weekends');
INSERT INTO schedtable(prio,      tstart, tend, mode, schedule) VALUES ( 0,        '00:00', '24:00', 'workday',  currval('schedules_id_seq'));
INSERT INTO schedtable(prio, dow, tstart, tend, mode, schedule) VALUES (10, '{6}', '00:00', '24:00', 'saturday', currval('schedules_id_seq'));
INSERT INTO schedtable(prio, dow, tstart, tend, mode, schedule) VALUES (10, '{0}', '00:00', '24:00', 'sunday',   currval('schedules_id_seq'));

COMMIT;





