<script type="text/javascript">
    var types = {literal}{{/literal}
        'A': [['Ip', '{$lang.dnsrecorddesca|escape:'javascript'}: \'192.168.178.XX\' ']],
        'NS': [['{$lang.dnsrecorddescns1|escape:'javascript'}', '{$lang.dnsrecorddescans2|escape:'javascript'}']],
        'AAAA': [['IPv6', '{$lang.dnsrecorddescaaaa|escape:'javascript'}: \'3ffe:8114:2000:bf0::1\'. ']],
        'CNAME': [['{$lang.hostname|escape:'javascript'}', '{$lang.dnsrecorddesccname|escape:'javascript'}: \'webserver-01.example.com\'']],
        'DNAME': [['{$lang.hostname|escape:'javascript'}']],
        'PTR': [['{$lang.hostname|escape:'javascript'}', '{$lang.dnsrecorddescptr|escape:'javascript'}:  \'www.example.com\'']],
        'TXT': [['{$lang.text|escape:'javascript'}', '{$lang.dnsrecorddesctxt|escape:'javascript'}']],
        'SPF': [['{$lang.text|escape:'javascript'}', '{$lang.dnsrecorddescspf|escape:'javascript'}']],
        'MX': [['{$lang.hostname|escape:'javascript'}', '{$lang.dnsrecorddescmx|escape:'javascript'}']],
        'AFSDB': [['{$lang.dnssubtype|escape:'javascript'}'], ['{$lang.hostname|escape:'javascript'}']],
        'HINFO': [['{$lang.dnsrecorddeschinfo|escape:'javascript'}'], ['{$lang.dnsrecorddeschinfo2|escape:'javascript'}']],
        'NSEC': [['{$lang.dnsrecorddescnsec|escape:'javascript'}'], ['{$lang.dnsrecorddescnsec2|escape:'javascript'}']],
        'RP': [['{$lang.dnsrecorddescrp|escape:'javascript'}'], ['{$lang.dnsrecorddescrp2|escape:'javascript'}']],
        'A6': [['{$lang.dnsrecorddesca6|escape:'javascript'}'], ['{$lang.addresss|escape:'javascript'}'], ['{$lang.dnsrecorddesca62|escape:'javascript'}']],
        'SSHFP': [['{$lang.algorithm|escape:'javascript'}'], ['{$lang.dnsrecorddescsshfp|escape:'javascript'}'], ['{$lang.fingerprint|escape:'javascript'}']],
        'SOA': [['{$lang.primaryns|escape:'javascript'}'], ['{$lang.email|escape:'javascript'}', '{$lang.dnsrecorddescsoaeml|escape:'javascript'}'], ['{$lang.serialnumber|escape:'javascript'}'], ['{$lang.refresh|escape:'javascript'}', '{$lang.dnsrecorddescsoa2|escape:'javascript'}'], ['{$lang.retry|escape:'javascript'}', '{$lang.dnsrecorddescsoa3|escape:'javascript'}'], ['{$lang.expiry|escape:'javascript'}', '{$lang.dnsrecorddescsoa4|escape:'javascript'}'], ['{$lang.minimumttl|escape:'javascript'}']],
        'DNSKEY': [['{$lang.flags|escape:'javascript'}'], ['{$lang.protocol|escape:'javascript'}'], ['{$lang.algorithm|escape:'javascript'}'], ['{$lang.publickey|escape:'javascript'}']],
        'KEY': [['{$lang.flags|escape:'javascript'}'], ['{$lang.protocol|escape:'javascript'}'], ['{$lang.algorithm|escape:'javascript'}'], ['{$lang.publickey|escape:'javascript'}']],
        'DS': [['{$lang.keytag|escape:'javascript'}'], ['{$lang.algorithm|escape:'javascript'}'], ['{$lang.digesttype|escape:'javascript'}'], ['{$lang.digest|escape:'javascript'}', ]],
        'CERT': [['{$lang.type|escape:'javascript'}'], ['{$lang.keytag|escape:'javascript'}'], ['{$lang.algorithm|escape:'javascript'}'], ['{$lang.certificate|escape:'javascript'}']],
        'SRV': [['{$lang.weight|escape:'javascript'}'], ['{$lang.port|escape:'javascript'}'], ['{$lang.hostname|escape:'javascript'}']],
        'LOC': [['{$lang.latitude|escape:'javascript'}'], ['{$lang.longitude|escape:'javascript'}'], ['{$lang.altitude|escape:'javascript'}'], ['{$lang.locsize|escape:'javascript'}'], ['{$lang.horizontalprecision|escape:'javascript'}'], ['{$lang.verticalprecision|escape:'javascript'}']],
        'NAPTR': [['{$lang.dnsrecorddescnaptrorder|escape:'javascript'}'], ['{$lang.dnsrecorddescnaptrpref|escape:'javascript'}'], ['{$lang.flags|escape:'javascript'}'], ['{$lang.dnsrecorddescnaptrservice|escape:'javascript'}'], ['{$lang.dnsrecorddescnaptrregex|escape:'javascript'}'], ['{$lang.hostname|escape:'javascript'}']],
        'RRSIG': [['{$lang.dnsrecorddescrsig|escape:'javascript'}'], ['{$lang.algorithm|escape:'javascript'}'], ['{$lang.dnsrecorddescrsiglabels|escape:'javascript'}'], ['{$lang.originalttl|escape:'javascript'}'], ['{$lang.dnsrecorddescrrsig2|escape:'javascript'}'], ['{$lang.dnsrecorddescrrsig3|escape:'javascript'}'], ['{$lang.keytag|escape:'javascript'}'], ['{$lang.dnsrecorddescrrsig4|escape:'javascript'}'], ['{$lang.signature|escape:'javascript'}']]
    {literal}};{/literal}
</script>
