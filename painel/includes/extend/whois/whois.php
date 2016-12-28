<?php

/**
 * Array below contains list of tlds and related whois servers.
 * Example:
 * array element:
 * '.co' => Array
  (
  'server' => 'whois.nic.co',
  'available' => 'Not found:'
  )
 * Informs HostBill core that:
 * 1. if domain to lookup have .co extension than:
 *  - connect with whois.nic.co over port 43
 *  - provide domain to lookup
 *  - check response, if it will contain string "Not found:"
 * (as described in 'available' section) it means that domain is available
 * for registration
 *
 * 2. If 'server' part begin with http:// HostBill will perform lookup using
 * port 80 (http request)
 */
$servers = array (
  '.af' => 
  array (
    'server' => 'whois.nic.af',
    'available' => 'Not Registered',
  ),
  '.th' => 
  array (
    'server' => 'whois.thnic.co.th',
    'available' => 'No match for',
  ),
  '.id' => 
  array (
    'server' => 'whois.idnic.net.id',
    'available' => 'Not found',
  ),
  '.cat' => 
  array (
    'server' => 'whois.cat',
    'available' => 'no matching objects',
  ),
  '.ac' => 
  array (
    'server' => 'whois.nic.ac',
    'available' => '- Available',
  ),
  '.ae' => 
  array (
    'server' => 'whois.aeda.net.ae',
    'available' => 'No Data Found',
  ),
  '.aero' => 
  array (
    'server' => 'whois.aero',
    'available' => 'NOT FOUND',
  ),
  '.ng' => 
  array (
    'server' => 'whois.nic.net.ng',
    'available' => 'Not Registered',
  ),
  '.am' => 
  array (
    'server' => 'whois.amnic.net',
    'available' => 'No match',
  ),
  '.at' => 
  array (
    'server' => 'whois.nic.at',
    'available' => 'nothing found',
  ),
  '.arpa' => 
  array (
    'server' => 'whois.iana.org',
    'available' => 'not found',
  ),
  '.as' => 
  array (
    'server' => 'whois.nic.as',
    'available' => 'Domain Not Found',
  ),
  '.asia' => 
  array (
    'server' => 'whois.nic.asia',
    'available' => 'NOT FOUND',
  ),
  '.au' => 
  array (
    'server' => 'whois-check.ausregistry.net.au',
    'available' => 'Available',
    'strict' => true,
  ),
  '.be' => 
  array (
    'server' => 'whois.dns.be',
    'available' => 'Status:	AVAILABLE',
  ),
  '.bg' => 
  array (
    'server' => 'whois.register.bg',
    'available' => 'does not exist',
  ),
  '.br' => 
  array (
    'server' => 'whois.registro.br',
    'available' => 'No match for domain',
  ),
  '.biz' => 
  array (
    'server' => 'whois.neulevel.biz',
    'available' => 'Not found:',
  ),
  '.ca' => 
  array (
    'server' => 'whois.cira.ca',
    'available' => 'status:         available',
  ),
  '.ch' => 
  array (
    'server' => 'whois.nic.ch',
    'available' => 'We do not have an entry',
  ),
  '.ci' => 
  array (
    'server' => 'whois.nic.ci',
    'available' => 'not found',
  ),
  '.cl' => 
  array (
    'server' => 'whois.nic.cl',
    'available' => 'no exist',
  ),
  '.cn' => 
  array (
    'server' => 'whois.cnnic.cn',
    'available' => 'No matching record',
  ),
  '.co' => 
  array (
    'server' => 'whois.nic.co',
    'available' => 'Not found:',
  ),
  '.com' => 
  array (
    'server' => 'whois.crsnic.net',
    'available' => 'No match for',
    'request' => 'domain ',
  ),
  '.cc' => 
  array (
    'server' => 'whois.nic.cc',
    'available' => 'No match',
  ),
  '.cx' => 
  array (
    'server' => 'whois.nic.cx',
    'available' => 'Not Registered',
  ),
  '.cz' => 
  array (
    'server' => 'whois.nic.cz',
    'available' => 'no entries found',
  ),
  '.de' => 
  array (
    'server' => 'whois.denic.de',
    'available' => 'free',
    'unicode' => true,
  ),
  '.dk' => 
  array (
    'server' => 'whois.dk-hostmaster.dk',
    'available' => 'No entries found',
  ),
  '.my' => 
  array (
    'server' => 'http://whois.mynic.my/index.jsp?type=domain&searchtxt=',
    'available' => 'does not exist in database',
  ),
  '.do' => 
  array (
    'server' => 'http://www.nic.do/whoisingles.php3?dns_answer=&do=do&B1=Query&T1=',
    'available' => 'This domain doesn\'t exist',
    'sldonly' => true,
  ),
  '.com.do' => 
  array (
    'server' => 'http://www.nic.do/whoisingles.php3?dns_answer=&do=com.do&B1=Query&T1=',
    'available' => 'This domain doesn\'t exist',
    'sldonly' => true,
  ),
  '.art.do' => 
  array (
    'server' => 'http://www.nic.do/whoisingles.php3?dns_answer=&do=art.do&B1=Query&T1=',
    'available' => 'This domain doesn\'t exist',
    'sldonly' => true,
  ),
  '.net.do' => 
  array (
    'server' => 'http://www.nic.do/whoisingles.php3?dns_answer=&do=net.do&B1=Query&T1=',
    'available' => 'This domain doesn\'t exist',
    'sldonly' => true,
  ),
  '.gov.do' => 
  array (
    'server' => 'http://www.nic.do/whoisingles.php3?dns_answer=&do=gov.do&B1=Query&T1=',
    'available' => 'This domain doesn\'t exist',
    'sldonly' => true,
  ),
  '.gob.do' => 
  array (
    'server' => 'http://www.nic.do/whoisingles.php3?dns_answer=&do=gob.do&B1=Query&T1=',
    'available' => 'This domain doesn\'t exist',
    'sldonly' => true,
  ),
  '.org.do' => 
  array (
    'server' => 'http://www.nic.do/whoisingles.php3?dns_answer=&do=org.do&B1=Query&T1=',
    'available' => 'This domain doesn\'t exist',
    'sldonly' => true,
  ),
  '.edu.do' => 
  array (
    'server' => 'http://www.nic.do/whoisingles.php3?dns_answer=&do=edu.do&B1=Query&T1=',
    'available' => 'This domain doesn\'t exist',
    'sldonly' => true,
  ),
  '.sld.do' => 
  array (
    'server' => 'http://www.nic.do/whoisingles.php3?dns_answer=&do=sld.do&B1=Query&T1=',
    'available' => 'This domain doesn\'t exist',
    'sldonly' => true,
  ),
  '.mil.do' => 
  array (
    'server' => 'http://www.nic.do/whoisingles.php3?dns_answer=&do=mil.do&B1=Query&T1=',
    'available' => 'This domain doesn\'t exist',
    'sldonly' => true,
  ),
  '.web.do' => 
  array (
    'server' => 'http://www.nic.do/whoisingles.php3?dns_answer=&do=web.do&B1=Query&T1=',
    'available' => 'This domain doesn\'t exist',
    'sldonly' => true,
  ),
  '.ec' => 
  array (
    'server' => 'whois.lac.net',
    'available' => 'No match found',
  ),
  '.ee' => 
  array (
    'server' => 'whois.eenet.ee',
    'available' => 'No entries found',
  ),
  '.eu' => 
  array (
    'server' => 'whois.eu',
    'available' => 'Status: AVAILABLE',
  ),
  '.edu' => 
  array (
    'server' => 'whois.internic.net',
    'available' => 'No match for',
  ),
  '.fi' => 
  array (
    'server' => 'whois.ficora.fi',
    'available' => 'Domain not found',
  ),
  '.fr' => 
  array (
    'server' => 'whois.nic.fr',
    'available' => 'No entries found in the AFNIC Database',
  ),
  '.gd' => 
  array (
    'server' => 'whois.adamsnames.com',
    'available' => 'not registered',
  ),
  '.gg' => 
  array (
    'server' => 'whois.channelisles.net',
    'available' => 'Not Registered',
  ),
  '.gi' => 
  array (
    'server' => 'whois2.afilias-grs.net',
    'available' => 'NOT FOUND',
  ),
  '.gs' => 
  array (
    'server' => 'whois.nic.gs',
    'available' => 'Not Registered',
  ),
  '.gy' => 
  array (
    'server' => 'whois.registry.gy',
    'available' => 'Not Registered',
  ),
  '.hk' => 
  array (
    'server' => 'whois.hkirc.hk',
    'available' => 'The domain has not been registered',
  ),
  '.hr' => 
  array (
    'server' => 'http://whois.com.hr/domena/',
    'available' => 'nije registrirana',
  ),
  '.hn' => 
  array (
    'server' => 'whois2.afilias-grs.net',
    'available' => 'NOT FOUND',
  ),
  '.hu' => 
  array (
    'server' => 'whois.nic.hu',
    'available' => 'No match',
  ),
  '.ie' => 
  array (
    'server' => 'whois.domainregistry.ie',
    'available' => 'Not Registered',
  ),
  '.il' => 
  array (
    'server' => 'whois.isoc.org.il',
    'available' => 'No data was found',
  ),
  '.in' => 
  array (
    'server' => 'whois.inregistry.net',
    'available' => 'NOT FOUND',
  ),
  '.info' => 
  array (
    'server' => 'whois.afilias.net',
    'available' => 'NOT FOUND',
  ),
  '.io' => 
  array (
    'server' => 'whois.nic.io',
    'available' => '- Available',
  ),
  '.ir' => 
  array (
    'server' => 'whois.nic.ir',
    'available' => 'no entries found',
  ),
  '.is' => 
  array (
    'server' => 'whois.isnic.is',
    'available' => 'No entries found',
  ),
  '.it' => 
  array (
    'server' => 'whois.nic.it',
    'available' => 'AVAILABLE',
  ),
  '.jp' => 
  array (
    'server' => 'whois.jprs.jp',
    'available' => 'No match!!',
  ),
  '.je' => 
  array (
    'server' => 'whois.je',
    'available' => 'Not Registered',
  ),
  '.ke' => 
  array (
    'server' => 'whois.kenic.or.ke',
    'available' => 'No match found',
  ),
  '.ki' => 
  array (
    'server' => 'whois.nic.ki',
    'available' => 'Status: Available',
  ),
  '.kr' => 
  array (
    'server' => 'whois.nic.or.kr',
    'available' => 'not registered',
  ),
  '.kz' => 
  array (
    'server' => 'whois.nic.kz',
    'available' => 'Nothing found',
  ),
  '.la' => 
  array (
    'server' => 'whois.nic.la',
    'available' => 'NOT FOUND',
  ),
  '.lt' => 
  array (
    'server' => 'whois.domreg.lt',
    'available' => 'Status:			available',
  ),
  '.li' => 
  array (
    'server' => 'whois.nic.li',
    'available' => 'We do not have an entry',
  ),
  '.lu' => 
  array (
    'server' => 'whois.dns.lu',
    'available' => 'No such domain',
  ),
  '.lv' => 
  array (
    'server' => 'whois.nic.lv',
    'available' => 'Status: free',
  ),
  '.ly' => 
  array (
    'server' => 'whois.nic.ly',
    'available' => 'Not found',
  ),
  '.ma' => 
  array (
    'server' => 'whois.iam.net.ma',
    'available' => 'No Objects Found',
  ),
  '.me' => 
  array (
    'server' => 'whois.nic.me',
    'available' => 'NOT FOUND',
  ),
  '.ms' => 
  array (
    'server' => 'whois.nic.ms',
    'available' => 'Not Registered',
  ),
  '.mx' => 
  array (
    'server' => 'whois.mx',
    'available' => 'Object_Not_Found',
  ),
  '.mobi' => 
  array (
    'server' => 'whois.dotmobiregistry.net',
    'available' => 'NOT FOUND',
  ),
  '.name' => 
  array (
    'server' => 'whois.nic.name',
    'available' => 'No match',
  ),
  '.na' => 
  array (
    'server' => 'whois.na-nic.com.na',
    'available' => 'Status: Not Registered',
  ),
  '.no' => 
  array (
    'server' => 'whois.norid.no',
    'available' => '% No match',
  ),
  '.nu' => 
  array (
    'server' => 'whois.nic.nu',
    'available' => 'NO MATCH for domain',
  ),
  '.nl' => 
  array (
    'server' => 'whois.domain-registry.nl',
    'available' => 'is free',
  ),
  '.nz' => 
  array (
    'server' => 'whois.srs.net.nz',
    'available' => '220 Available',
  ),
  '.org' => 
  array (
    'server' => 'whois.publicinterestregistry.net',
    'available' => 'NOT FOUND',
  ),
  '.pe' => 
  array (
    'server' => 'kero.yachay.pe',
    'available' => 'Not Registered',
  ),
  '.pl' => 
  array (
    'server' => 'whois.dns.pl',
    'available' => 'No information available about domain',
  ),
  '.pm' => 
  array (
    'server' => 'whois.nic.pm',
    'available' => 'No entries found',
  ),
  '.pr' => 
  array (
    'server' => 'whois.nic.pr',
    'available' => 'available',
  ),
  '.pro' => 
  array (
    'server' => 'whois.registry.pro',
    'available' => 'NOT FOUND',
  ),
  '.ru' => 
  array (
    'server' => 'whois.ripn.net',
    'available' => 'No entries found',
  ),
  '.ro' => 
  array (
    'server' => 'whois.rotld.ro',
    'available' => 'No entries found',
  ),
  '.re' => 
  array (
    'server' => 'whois.nic.re',
    'available' => 'No entries found',
  ),
  '.sa' => 
  array (
    'server' => 'whois.nic.net.sa',
    'available' => 'No match',
  ),
  '.se' => 
  array (
    'server' => 'whois.iis.se',
    'available' => 'not found.',
  ),
  '.sc' => 
  array (
    'server' => 'whois2.afilias-grs.net',
    'available' => 'NOT FOUND',
  ),
  '.sg' => 
  array (
    'server' => 'whois.nic.net.sg',
    'available' => 'Domain Not Found',
  ),
  '.sh' => 
  array (
    'server' => 'whois.nic.sh',
    'available' => '- Available',
  ),
  '.si' => 
  array (
    'server' => 'whois.arnes.si',
    'available' => 'No entries found',
  ),
  '.st' => 
  array (
    'server' => 'whois.nic.st',
    'available' => 'No entries found',
  ),
  '.tel' => 
  array (
    'server' => 'whois.nic.tel',
    'available' => 'Not found:',
  ),
  '.tc' => 
  array (
    'server' => 'whois.adamsnames.tc',
    'available' => 'not registered',
  ),
  '.tf' => 
  array (
    'server' => 'whois.nic.tf',
    'available' => 'No entries found',
  ),
  '.tk' => 
  array (
    'server' => 'whois.dot.tk',
    'available' => 'domain name not known',
  ),
  '.tl' => 
  array (
    'server' => 'whois.nic.tl',
    'available' => 'Status: Not Registered',
  ),
  '.tm' => 
  array (
    'server' => 'whois.nic.tm',
    'available' => '- Available',
  ),
  '.tr' => 
  array (
    'server' => 'whois.nic.tr',
    'available' => 'No match found',
  ),
  '.tw' => 
  array (
    'server' => 'whois.twnic.net.tw',
    'available' => 'No Found',
  ),
  '.tv' => 
  array (
    'server' => 'tvwhois.verisign-grs.com',
    'available' => 'No match for',
  ),
  '.travel' => 
  array (
    'server' => 'whois.nic.travel',
    'available' => 'Not found:',
  ),
  'dn.ua' => 
  array (
    'server' => 'whois.net.ua',
    'available' => 'No entries found',
  ),
  '.donetsk.ua' => 
  array (
    'server' => 'whois.net.ua',
    'available' => 'No match record',
  ),
  '.kh.ua' => 
  array (
    'server' => 'whois.net.ua',
    'available' => 'No match record',
  ),
  '.kharkiv.ua' => 
  array (
    'server' => 'whois.net.ua',
    'available' => 'No match record',
  ),
  '.kharkov.ua' => 
  array (
    'server' => 'whois.kh.ua',
    'available' => 'No match record',
  ),
  'lg.ua' => 
  array (
    'server' => 'whois.net.ua',
    'available' => 'No match record',
  ),
  '.net.ua' => 
  array (
    'server' => 'whois.net.ua',
    'available' => 'No match record',
  ),
  '.sm.ua' => 
  array (
    'server' => 'whois.net.ua',
    'available' => 'No match record',
  ),
  '.sumy.ua' => 
  array (
    'server' => 'whois.net.ua',
    'available' => 'No match record',
  ),
  '.zaporizhzhe.ua' => 
  array (
    'server' => 'whois.net.ua',
    'available' => 'No match record',
  ),
  '.zp.ua' => 
  array (
    'server' => 'whois.net.ua',
    'available' => 'No match record',
  ),
  '.ua' => 
  array (
    'server' => 'whois.ua',
    'available' => 'No entries found',
  ),
  '.us' => 
  array (
    'server' => 'whois.nic.us',
    'available' => 'Not found:',
  ),
  '.uk' => 
  array (
    'server' => 'whois.nic.uk',
    'available' => 'No match for',
  ),
  '.ug' => 
  array (
    'server' => 'whois.co.ug',
    'available' => 'No entries found',
  ),
  '.uz' => 
  array (
    'server' => 'whois.cctld.uz',
    'available' => 'not found in database',
  ),
  '.vc' => 
  array (
    'server' => 'whois2.afilias-grs.net',
    'available' => 'NOT FOUND',
  ),
  '.ve' => 
  array (
    'server' => 'whois.nic.ve',
    'available' => 'No match for',
  ),
  '.vg' => 
  array (
    'server' => 'whois.adamsnames.tc',
    'available' => 'not registered',
  ),
  '.wf' => 
  array (
    'server' => 'whois.nic.wf',
    'available' => 'No entries found',
  ),
  '.ws' => 
  array (
    'server' => 'whois.worldsite.ws',
    'available' => 'No match for',
  ),
  '.yt' => 
  array (
    'server' => 'whois.nic.yt',
    'available' => 'No entries found',
  ),
  '.coop' => 
  array (
    'server' => 'whois.nic.coop',
    'available' => 'No domain records',
  ),
  '.jobs' => 
  array (
    'server' => 'jobswhois.verisign-grs.com',
    'available' => 'No match for',
  ),
  '.net' => 
  array (
    'server' => 'whois.verisign-grs.com',
    'available' => 'No match for',
  ),
  '.int' => 
  array (
    'server' => 'whois.iana.org',
    'available' => 'not found',
  ),
  '.museum' => 
  array (
    'server' => 'whois.museum',
    'available' => 'NOT FOUND',
  ),
  '.za' => 
  array (
    'server' => 'http://co.za/cgi-bin/whois.sh?Domain=',
    'available' => 'No Matches',
  ),
  '.es' => 
  array (
    'server' => 'http://whois.virtualname.es/whois.php?domain=',
    'available' => 'LIBRE - DOMINIO DISPONIBLE',
  ),
  '.ph' => 
  array (
    'server' => 'http://bayanhosting.dot.ph/WhoIs.asp?Domain=',
    'available' => 'is still available',
  ),
  '.pt' => 
  array (
    'server' => 'whois.dns.pt',
    'available' => 'no match',
  ),
  '.so' => 
  array (
    'server' => 'whois.nic.so',
    'available' => 'Not found:',
  ),
  '.ag' => 
  array (
    'server' => 'whois.nic.ag',
    'available' => 'NOT FOUND',
  ),
  '.fm' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.al' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.az' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.ba' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.bi' => 
  array (
    'server' => 'whois.nic.bi',
    'available' => 'No match for',
  ),
  '.bt' => 
  array (
    'server' => 'whois.netnames.net',
    'available' => 'No match for',
  ),
  '.by' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.cd' => 
  array (
    'server' => 'whois.nic.cd',
    'available' => 'Domain Not Found',
  ),
  '.ck' => 
  array (
    'server' => 'whois.nic.ck',
    'available' => 'No entries found ',
  ),
  '.co.nl' => 
  array (
    'server' => 'whois.co.nl',
    'available' => 'Domain does not exist',
  ),
  '.cy' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.dz' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.eg' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.fo' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'No entries found',
  ),
  '.gb' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.ge' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.gl' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => ' no entries found',
  ),
  '.gm' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.gov' => 
  array (
    'server' => 'whois.nic.gov',
    'available' => 'No match for',
  ),
  '.gr' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.hm' => 
  array (
    'server' => 'whois.registry.hm',
    'available' => 'Domain not found.',
  ),
  '.kg' => 
  array (
    'server' => 'whois.domain.kg',
    'available' => 'Data not found.',
  ),
  '.mc' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.md' => 
  array (
    'server' => 'whois.nic.md',
    'available' => 'No match for',
  ),
  '.mk' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'No entries found',
  ),
  '.mt' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.mu' => 
  array (
    'server' => 'whois.nic.mu',
    'available' => 'Not Registered',
  ),
  '.nf' => 
  array (
    'server' => 'whois.nic.cx',
    'available' => 'Not Registered',
  ),
  '.sb' => 
  array (
    'server' => 'whois.nic.net.sb',
    'available' => 'Not Registered',
  ),
  '.sk' => 
  array (
    'server' => 'whois.sk-nic.sk',
    'available' => 'Not found.',
  ),
  '.sm' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.su' => 
  array (
    'server' => 'whois.ripn.net',
    'available' => 'No entries found for the selected source(s)',
  ),
  '.tn' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.to' => 
  array (
    'server' => 'whois.tonic.to',
    'available' => 'No match for',
  ),
  '.uy' => 
  array (
    'server' => 'nic.uy',
    'available' => 'No match for',
  ),
  '.va' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.xxx' => 
  array (
    'server' => 'whois.nic.xxx',
    'available' => 'NOT FOUND',
  ),
  '.yu' => 
  array (
    'server' => 'whois.ripe.net',
    'available' => 'no entries found',
  ),
  '.ht' => 
  array (
    'server' => 'whois.nic.ht',
    'available' => 'Not Registered',
  ),
  '.info.ht' => 
  array (
    'server' => 'whois.nic.ht',
    'available' => 'Not Registered',
  ),
  '.net.ht' => 
  array (
    'server' => 'whois.nic.ht',
    'available' => 'Not Registered',
  ),
  '.org.ht' => 
  array (
    'server' => 'whois.nic.ht',
    'available' => 'Not Registered',
  ),
  '.qa' => 
  array (
    'server' => 'whois.registry.qa',
    'available' => 'No Data Found ',
  ),
  '.lc' => 
  array (
    'server' => 'http://whois.domaintools.com/',
    'available' => 'Whois Record Not Available',
  ),
  '.im' => 
  array (
    'server' => 'whois.nic.im',
    'available' => 'was not found',
  ),
  '.mn' => 
  array (
    'server' => 'http://whois.domaintools.com/',
    'available' => 'Whois Record Not Available',
  ),
  '.ps' => 
  array (
    'server' => 'https://www.instra.com/whois/whoisengine/request/whoisinfo.php?domain_name=',
    'available' => 'No Object Found',
  ),
  '.academy' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.actor' => 
  array (
    'server' => 'whois.unitedtld.com',
    'available' => 'Domain not found',
  ),
  '.agency' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.bar' => 
  array (
    'server' => 'whois.nic.bar',
    'available' => 'DOMAIN NOT FOUND',
  ),
  '.bargains' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.berlin' => 
  array (
    'server' => 'whois.nic.berlin',
    'available' => 'No match',
  ),
  '.best' => 
  array (
    'server' => 'whois.nic.best',
    'available' => 'Not found',
  ),
  '.bid' => 
  array (
    'server' => 'whois.nic.bid',
    'available' => 'Not found',
  ),
  '.bike' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.blue' => 
  array (
    'server' => 'whois.afilias.net',
    'available' => 'Domain not found',
  ),
  '.boutique' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.build' => 
  array (
    'server' => 'whois.nic.build',
    'available' => 'No Data Found',
  ),
  '.builders' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.buzz' => 
  array (
    'server' => 'whois.nic.buzz',
    'available' => 'Not found',
  ),
  '.cab' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.camera' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.camp' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.cards' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.careers' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.catering' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.center' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.ceo' => 
  array (
    'server' => 'whois.nic.ceo',
    'available' => 'Not found',
  ),
  '.cheap' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.christmas' => 
  array (
    'server' => 'whois.uniregistry.net',
    'available' => 'is available for',
  ),
  '.cleaning' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.clothing' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.club' => 
  array (
    'server' => 'whois.nic.club',
    'available' => 'Not found',
  ),
  '.codes' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.coffee' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.cologne' => 
  array (
    'server' => 'whois-fe1.pdt.cologne.tango.knipp.de',
    'available' => 'no matching objects found',
  ),
  '.community' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.company' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.computer' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.construction' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.contractors' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.condos' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.cool' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.cruises' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.dance' => 
  array (
    'server' => 'whois.unitedtld.com',
    'available' => 'Domain not found',
  ),
  '.dating' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.democrat' => 
  array (
    'server' => 'whois.unitedtld.com',
    'available' => 'Domain not found',
  ),
  '.diamonds' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.directory' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.domains' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.education' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.email' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.enterprises' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.equipment' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.estate' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.events' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.expert' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.exposed' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.farm' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.fish' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.flights' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.florist' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.foundation' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.futbol' => 
  array (
    'server' => 'whois.unitedtld.com',
    'available' => 'Domain not found',
  ),
  '.gallery' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.gift' => 
  array (
    'server' => 'whois.uniregistry.net',
    'available' => 'is available for',
  ),
  '.glass' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.graphics' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.guitars' => 
  array (
    'server' => 'whois.uniregistry.net',
    'available' => 'is available for registration',
  ),
  '.guru' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.holdings' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.holiday' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.house' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.immobilien' => 
  array (
    'server' => 'whois.unitedtld.com',
    'available' => 'Domain not found',
  ),
  '.industries' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.institute' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.international' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.jetzt' => 
  array (
    'server' => 'whois.nic.jetzt',
    'available' => 'Not found',
  ),
  '.kaufen' => 
  array (
    'server' => 'whois.unitedtld.com',
    'available' => 'Domain not found',
  ),
  '.kim' => 
  array (
    'server' => 'whois.afilias.net',
    'available' => 'Domain not found',
  ),
  '.kitchen' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.kiwi' => 
  array (
    'server' => 'whois.dot-kiwi.com',
    'available' => 'Not Registered',
  ),
  '.koeln' => 
  array (
    'server' => 'whois-fe1.pdt.koeln.tango.knipp.de',
    'available' => 'no matching objects found',
  ),
  '.kred' => 
  array (
    'server' => 'whois.nic.kred',
    'available' => 'Not found',
  ),
  '.land' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.lighting' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.limo' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.link' => 
  array (
    'server' => 'whois.uniregistry.net',
    'available' => 'is available for',
  ),
  '.london' => 
  array (
    'server' => 'whois-lon.mm-registry.com',
    'available' => 'Not Registered',
  ),
  '.luxury' => 
  array (
    'server' => 'whois.nic.luxury',
    'available' => 'No Data Found',
  ),
  '.management' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.mango' => 
  array (
    'server' => 'whois.mango.coreregistry.net',
    'available' => 'no matching objects found',
  ),
  '.marketing' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.menu' => 
  array (
    'server' => 'whois.nic.menu',
    'available' => 'No Data Found',
  ),
  '.moda' => 
  array (
    'server' => 'whois.unitedtld.com',
    'available' => 'Domain not found',
  ),
  '.monash' => 
  array (
    'server' => 'whois.nic.monash',
    'available' => 'No Data Found',
  ),
  '.nagoya' => 
  array (
    'server' => 'whois.gmoregistry.net',
    'available' => 'DOMAIN NOT FOUND',
  ),
  '.ninja' => 
  array (
    'server' => 'whois.unitedtld.com',
    'available' => 'Domain not found',
  ),
  '.nyc' => 
  array (
    'server' => 'whois.nic.nyc',
    'available' => 'Not found',
  ),
  '.okinawa' => 
  array (
    'server' => 'whois.gmoregistry.ne',
    'available' => 'Domain not found',
  ),
  '.partners' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.parts' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.photo' => 
  array (
    'server' => 'whois.uniregistry.net',
    'available' => 'is available for',
  ),
  '.photography' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.photos' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.pics' => 
  array (
    'server' => 'whois.uniregistry.net',
    'available' => 'is available for',
  ),
  '.pink' => 
  array (
    'server' => 'whois.afilias.net',
    'available' => 'Domain not found',
  ),
  '.plumbing' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.productions' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.properties' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.pub' => 
  array (
    'server' => 'whois.unitedtld.com',
    'available' => 'Domain not found',
  ),
  '.qpon' => 
  array (
    'server' => 'whois.nic.qpon',
    'available' => 'Not found',
  ),
  '.recipes' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.red' => 
  array (
    'server' => 'whois.nic.red',
    'available' => 'NOT FOUND',
  ),
  '.rentals' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.repair' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.report' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.reviews' => 
  array (
    'server' => 'whois.unitedtld.com',
    'available' => 'Domain not found',
  ),
  '.rich' => 
  array (
    'server' => 'whois.afilias-srs.net',
    'available' => 'NOT FOUND',
  ),
  '.ruhr' => 
  array (
    'server' => 'whois.nic.ruhr',
    'available' => 'no matching objects found',
  ),
  '.sexy' => 
  array (
    'server' => 'whois.uniregistry.net',
    'available' => 'is available for',
  ),
  '.shiksha' => 
  array (
    'server' => 'whois.nic.shiksha',
    'available' => 'NOT FOUND',
  ),
  '.shoes' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.singles' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.social' => 
  array (
    'server' => 'whois.unitedtld.com',
    'available' => 'Domain not found',
  ),
  '.sohu' => 
  array (
    'server' => 'whois.gtld.knet.cn',
    'available' => 'No match',
  ),
  '.solar' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.solutions' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.supplies' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.supply' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.support' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.systems' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.tattoo' => 
  array (
    'server' => 'whois.uniregistry.net',
    'available' => 'is available for',
  ),
  '.technology' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.tienda' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.tips' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.today' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.tokyo' => 
  array (
    'server' => 'whois.nic.tokyo',
    'available' => 'DOMAIN NOT FOUND',
  ),
  '.tools' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.trade' => 
  array (
    'server' => 'whois.nic.trade',
    'available' => 'Not found',
  ),
  '.training' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.uno' => 
  array (
    'server' => 'whois.nic.uno',
    'available' => 'Not found',
  ),
  '.vacations' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.ventures' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.viajes' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.villas' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.vision' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.vote' => 
  array (
    'server' => 'whois.afilias.net',
    'available' => 'Domain not found',
  ),
  '.voting' => 
  array (
    'server' => 'whois.nic.voting',
    'available' => 'No match',
  ),
  '.voto' => 
  array (
    'server' => 'whois.afilias.net',
    'available' => 'Domain not found',
  ),
  '.voyage' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.wang' => 
  array (
    'server' => 'whois.gtld.knet.cn',
    'available' => 'Domain not found',
  ),
  '.watch' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.webcam' => 
  array (
    'server' => 'whois.nic.webcam',
    'available' => 'Domain not found',
  ),
  '.wed' => 
  array (
    'server' => 'whois.nic.wed',
    'available' => 'No Object Found',
  ),
  '.wien' => 
  array (
    'server' => 'whois.nic.wien',
    'available' => 'No match',
  ),
  '.wiki' => 
  array (
    'server' => 'whois.nic.wiki',
    'available' => 'DOMAIN NOT FOUND',
  ),
  '.works' => 
  array (
    'server' => 'whois.donuts.co',
    'available' => 'Domain not found',
  ),
  '.audio' => 
  array (
    'server' => 'whois.uniregistry.net',
    'available' => 'is available for registration',
  ),
  '.website' => 
  array (
    'server' => 'whois.nic.website',
    'available' => 'DOMAIN NOT FOUND',
  ),
  '.rocks' => 
  array (
    'server' => 'whois.unitedtld.com',
    'available' => 'Domain not found',
  ),
  '.hiphop' => 
  array (
    'server' => 'whois.uniregistry.net',
    'available' => 'is available for registration',
  ),
  '.work' => 
  array (
    'server' => 'whois-dub.mm-registry.com',
    'available' => 'Not Registered',
  ),
  '.video' => 
  array (
    'server' => 'whois.rightside.co',
    'available' => 'Domain not found',
  ),
  '.software' => 
  array (
    'server' => 'whois.rightside.co',
    'available' => 'Domain not found',
  ),
  '.property' => 
  array (
    'server' => 'whois.uniregistry.net',
    'available' => 'is available',
  ),
);