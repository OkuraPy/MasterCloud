/*!
 SerializeJSON jQuery plugin.
 https://github.com/marioizquierdo/jquery.serializeJSON
 version 1.2.2 (Mar 11, 2014)
 
 Copyright (c) 2012 Mario Izquierdo
 Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 */
(function(a){a.fn.serializeJSON=function(){var b,d,c;b={};d=this.serializeArray();a.each(d,function(f,e){c=a.serializeJSON.splitInputNameIntoKeysArray(e.name);a.serializeJSON.deepSet(b,c,e.value)});return b};a.serializeJSON={isObject:function(b){return b===Object(b)},isUndefined:function(b){return b===void 0},isValidArrayIndex:function(b){return b===""||/^[0-9]+$/.test(String(b))},splitInputNameIntoKeysArray:function(b){var d,c;if(a.serializeJSON.isUndefined(b)){throw new Error("ArgumentError: param 'name' expected to be a string, found undefined")}d=a.map(b.split("["),function(f){c=f[f.length-1];return c==="]"?f.substring(0,f.length-1):f});if(d[0]===""){d.shift()}return d},deepSet:function(e,j,g){var d,f,h,c,b;if(a.serializeJSON.isUndefined(e)){throw new Error("ArgumentError: param 'o' expected to be an object or array, found undefined")}if(!j||j.length===0){throw new Error("ArgumentError: param 'keys' expected to be an array with least one element")}d=j[0];if(j.length===1){if(d===""){e.push(g)}else{e[d]=g}}else{f=j[1];if(d===""){c=e.length-1;b=e[e.length-1];if(a.serializeJSON.isObject(b)&&a.serializeJSON.isUndefined(b[f])){d=c}else{d=c+1}}if(a.serializeJSON.isUndefined(e[d])){if(a.serializeJSON.isValidArrayIndex(f)){e[d]=[]}else{e[d]={}}}h=j.slice(1);a.serializeJSON.deepSet(e[d],h,g)}}}})(window.jQuery||window.Zepto||window.$);

$(function() {

    var ids = [],
            loadelem = $('[data-load]');

    loadelem.each(function() {

        var self = $(this);
        if (ids.indexOf(self.data('id')) < 0)
            ids.push(self.data('id'));

        self.click(function() {

            if (!self.data('load'))
                return false;

            var data = self.data(self.data('type')),
                    form = buildFaceboxForm.call(self, self.data('type'), data);

            form.submit(function() {
                var data = $.extend({
                    ajax: 1,
                    lbrule: self.data('id')
                }, form.serializeJSON());
                self.parents('tr').eq(0).addLoader();
                $.post(window.location.href, data, updatePolicy);
                return false;
            })
            return false;
        });
    });
    for (var i = 0; i < ids.length; i++) {
        var lbid = ids[i];
        $.post(window.location.href, {
            ajax: 1,
            lbrule: lbid
        }, updatePolicy)
    }
    $('#formaddrule').submit(addNewLBRule).find('[data-type]').click(function() {
        var self = $(this),
                addForm = $('#formaddrule'),
                data = addForm.data(self.data('type'));

        if (!data)
            data = {};

        data.networkid = self.parents('tr').eq(0).find('select:first option:selected').data('networkid');

        var form = buildFaceboxForm.call(self, self.data('type'), data);
        form.submit(function() {
            addForm.data(self.data('type'), form.serializeJSON());
            return false;
        })
        return false;
    });
})

function addNewLBRule() {
    var self = $(this),
        formdata = walkFormObject(self.data());

    for(var name in formdata){
        $('[name="'+name+'"]', self).remove();
        self.append('<input type="hidden" name="'+name+'" value="'+formdata[name]+'" />');
    }
}

function walkFormObject(ob, prefix){
    var r = {};
    for(var i in ob){
        if(typeof ob[i] == 'object' || typeof ob[i] == 'array'){
            $.extend(r, walkFormObject(ob[i], !prefix ? i : prefix+'['+i+']'));
        }else{
            r[prefix+'['+i+']'] = ob[i];
        }
    }
    return r;
}

function updatePolicy(resp) {
    var btn = $('[data-id="' + resp.lbrule + '"][data-load]');
    btn.data('load', true);

    btn.filter(':has(img)').text('Configure');
    $('#preloader').hide();
    if (resp.stickiness) {
        btn.filter('[data-type="stickiness"]').text(resp.stickiness.methodname).data('stickiness', resp.stickiness);
    }
    if (resp.healthcheck) {
        btn.filter('[data-type="healthcheck"]').text(resp.healthcheck.methodname).data('healthcheck', resp.healthcheck);
    }
    if (resp.instances) {
        btn.filter('[data-type="instances"],[data-type="loadbalancer"]').data('instances', resp.instances);
    }
    if (resp.loadbalancer) {
        btn.filter('[data-type="loadbalancer"]').data(resp.loadbalancer);
        var tr = $('#lb-' + resp.loadbalancer.id);
        tr.find('.lb-name').text(resp.loadbalancer.name);
        tr.find('.lb-algorithm').text(resp.loadbalancer.algorithm);
    }
}

function buildFaceboxForm(type, data) {
    var form = {};

    if (type == 'stickiness') {
        form = buildStickinessPolicyForm.call(this, data);
    } else if (type == 'healthcheck') {
        form = buildHealthCheckPolicyForm.call(this, data);
    } else if (type == 'instances') {
        form = buildInstancesManagerForm.call(this, data);
    } else if (type == 'loadbalancer') {
        form = buildLBManagerForm.call(this, data);
    }

    form.width = 500;
    $.facebox(form);

    var footer = $('#facebox .footer').html('');
    $('<a href="#save" class="btn btn-primary">Save</a>').click(function() {
        form.submit();
        $(document).trigger('close.facebox');
        return false
    }).appendTo(footer);
    footer.append(' ');
    $('<a href="#close" class="btn btn-default">Cancel</a>').click(function() {
        $(document).trigger('close.facebox');
        return false
    }).appendTo(footer);

    return form;
}

function buildStickinessPolicyForm(policydata) {
    //source https://github.com/apache/cloudstack/blob/3e097a0fb289971dc2fc509e0ab5ed78b64cf81b/server/src/com/cloud/network/element/VirtualRouterElement.java
    var types = {
        SourceBased: {
            tablesize: {
                type: 'input',
                label: 'Table size',
                title: "Size of table to store source ip addresses. example: 200k or 300m or 400g. Default value:200k"

            },
            expire: {
                type: 'input',
                label: 'Expires',
                title: "Entry in source ip table will expire after expire duration. units can be s,m,h,d ."
                        + " example: 30m 20s 50h 4d. Default value:3h"
            },
        },
        AppCookie: {
            'cookie-name': {
                type: 'input',
                label: 'Cookie name',
                title: "This is the name of the cookie used by the application and which LB will have to learn for each new session. "
                        + "Default value: Auto geneared based on ip"
            },
            mode: {
                type: 'select',
                label: 'Mode',
                option: ['-', 'path-parameters', 'query-string'],
                title: "This option allows to change the URL parser mode. 2 modes are currently supported : - path-parameters "
                        + ": The parser looks for the appsession in the path parameters part (each parameter is separated by a semi-colon), "
                        + "which is convenient for JSESSIONID for example. This is the default mode if the option is not set. - query-string :"
                        + " In this mode, the parser will look for the appsession in the query string."
            },
            length: {
                type: 'input',
                label: 'Length',
                title: "This is the max number of characters that will be memorized and checked in each cookie value. Default value:52"
            },
            holdtime: {
                type: 'input',
                label: 'Hold time',
                title: "This is the time after which the cookie will be removed from memory if unused. The value should be in the format Example : 20s or 30m or 4h or 5d."
                        + " only seconds(s), minutes(m) hours(h) and days(d) are valid"
            },
            'request-learn': {
                type: 'checkbox',
                label: 'Request learn',
                title: "If this option is specified, then haproxy will be able to learn the cookie found in the request in case the server does not "
                        + "specify any in response. This is typically what happens with PHPSESSID cookies, or when haproxy's session expires before the "
                        + "application's session and the correct server is selected. It is recommended to specify this option to improve reliability",
            },
            prefix: {
                type: 'checkbox',
                label: 'Prefix',
                title: "When this option is specified, haproxy will match on the cookie prefix (or URL parameter prefix). The appsession value is the "
                        + "data following this prefix. Example : appsession ASPSESSIONID len 64 timeout 3h prefix This will match the cookie "
                        + "ASPSESSIONIDXXXX=XXXXX, the appsession value will be XXXX=XXXXX.",
            },
        },
        LbCookie: {
            'cookie-name': {
                type: 'input',
                label: 'Cookie name',
                title: "Cookie name passed in http header by the LB to the client."
            },
            mode: {
                type: 'select',
                label: 'Mode',
                option: ['-', 'insert', 'rewrite', 'prefix'],
                title: "Valid values: insert, rewrite, prefix. Default value: insert. In the insert mode cookie will be created"
                        + " by the LB. In other modes, cookie will be created by the server and LB modifies it."
            },
            nocache: {
                type: 'checkbox',
                label: 'No cache',
                title: "This option is recommended in conjunction with the insert mode when there is a cache between the client"
                        + " and HAProxy, as it ensures that a cacheable response will be tagged non-cacheable if a cookie needs "
                        + "to be inserted. This is important because if all persistence cookies are added on a cacheable home page"
                        + " for instance, then all customers will then fetch the page from an outer cache and will all share the "
                        + "same persistence cookie, leading to one server receiving much more traffic than others. See also the insert and postonly options. "

            },
            indirect: {
                type: 'checkbox',
                label: 'Indirect',
                title: "When this option is specified in insert mode, cookies will only be added when the server was not reached"
                        + " after a direct access, which means that only when a server is elected after applying a load-balancing algorithm,"
                        + " or after a redispatch, then the cookie will be inserted. If the client has all the required information"
                        + " to connect to the same server next time, no further cookie will be inserted. In all cases, when the "
                        + "indirect option is used in insert mode, the cookie is always removed from the requests transmitted to "
                        + "the server. The persistence mechanism then becomes totally transparent from the application point of view.",
            },
            postonly: {
                type: 'checkbox',
                label: 'Post only',
                title: "This option ensures that cookie insertion will only be performed on responses to POST requests. It is an"
                        + " alternative to the nocache option, because POST responses are not cacheable, so this ensures that the "
                        + "persistence cookie will never get cached.Since most sites do not need any sort of persistence before the"
                        + " first POST which generally is a login request, this is a very efficient method to optimize caching "
                        + "without risking to find a persistence cookie in the cache. See also the insert and nocache options.",
            },
            domain: {
                type: 'input',
                label: 'Domain',
                title: "This option allows to specify the domain at which a cookie is inserted. It requires exactly one parameter:"
                        + " a valid domain name. If the domain begins with a dot, the browser is allowed to use it for any host "
                        + "ending with that name. It is also possible to specify several domain names by invoking this option multiple"
                        + " times. Some browsers might have small limits on the number of domains, so be careful when doing that. "
                        + "For the record, sending 10 domains to MSIE 6 or Firefox 2 works as expected.",
            },
        }};
    var form = $('<form class="form-horizontal"><input type="hidden" name="do" value="editstickiness"/>'
            + '<div class="control-group" id="type-controll"><label class="control-label">Stickiness method</label></div>'
            + '<div class="control-group seg" id="sticky-name"><label class="control-label">Sticky Name</label><div class="controls"><input type="text" name="name" required></div></div>'
            + '</form>');
    var select = $('<select name="methodname"><option value="">None</option></select>').change(function() {
        var self = $(this);
        $('.seg', form).hide()
                .find('input, select, textarea').prop('disabled', true).end()
                .filter('.seg-' + self.val()).show().find('input, select, textarea').prop('disabled', false);
    }),
            dname = $('#sticky-name', form);

    for (var type in types) {
        select.append('<option value="' + type + '">' + type + '</option>');
        dname.addClass('seg-' + type);
        var segment = $('<div class="seg seg-' + type + '"></div>').appendTo(form);

        for (var name in types[type]) {
            __buildFormFields(name, types[type][name], 'params').appendTo(segment);
        }
    }
    select.change().wrap('<div class="controls"></div>').parent().appendTo(form.find('#type-controll'))

    if (policydata) {
        $('<input type="hidden" name="policyid" />').val(policydata.id).appendTo(form);

        form.find('[name="methodname"]').val(policydata.methodname).change();
        form.find('[name="name"]').val(policydata.name).change();

        for (var name in policydata.params) {
            var field = form.find('#params-' + name);
            if (field.is('[type=checkbox], [type=radio]'))
                field.val(1).prop('checked', true).change();
            else
                field.val(policydata.params[name]).change();
        }
    }
    return form;
}

function buildHealthCheckPolicyForm(policydata) {
    var fields = {
        pingpath: {
            type: 'input',
            label: 'Ping Path',
            title: "HTTP Ping Path"
        },
        responsetimeout: {
            type: 'input',
            label: 'Response Timeout (in sec)',
            title: "Time to wait when receiving a response from the health check (beetween 2sec - 60 sec)"
        },
        healthinterval: {
            type: 'input',
            label: 'Health Check Interval (in sec)',
            title: "Amount of time between health checks (beetween 1 sec - 20940 sec)"
        },
        healthythreshold: {
            type: 'input',
            label: 'Healthy Threshold',
            title: "Number of consecutive health check success before declaring an instance healthy",
        },
        unhealthythreshold: {
            type: 'input',
            label: 'Unhealthy Threshold',
            title: "Number of consecutive health check failures before declaring an instance unhealthy",
        },
    };
    var form = $('<form class="form-horizontal"><input type="hidden" name="do" value="edithealth"/></form>');

    for (var name in fields) {
        __buildFormFields(name, fields[name]).appendTo(form);
    }

    if (policydata) {
        $('<input type="hidden" name="policyid" />').val(policydata.id).appendTo(form);

        form.find('[name="methodname"]').val(policydata.methodname).change();
        form.find('[name="name"]').val(policydata.name).change();

        for (var name in policydata.params) {
            var field = form.find('#params-' + name);
            if (field.is('[type=checkbox], [type=radio]'))
                field.val(1).prop('checked', true).change();
            else
                field.val(policydata.params[name]).change();
        }
    }

    return form;
}

function buildLBManagerForm(data) {
    var self = $(this),
            fields = {
                algorithm: {
                    type: 'select',
                    label: 'Algorithm',
                    option: [['roundrobin', 'Round-robin'], ['leastconn', 'Least connections'], ['source', 'Source']],
                },
                name: {
                    type: 'input',
                    label: 'Name',
                },
            },
            form = buildInstancesManagerForm.call(this, self.data());
    fields.name.value = self.data('name');
    fields.algorithm.value = self.data('algorithm');
    for (var name in fields) {
        __buildFormFields(name, fields[name]).prependTo(form);
    }
    return form;
}

function buildInstancesManagerForm(data) {


    var self = $(this),
            form = $('<form class="form-horizontal"><input type="hidden" name="do" value="editlb"/></form>'),
            instances = $('<div class="control-group"><label class="control-label">VMs</label><div class="controls">'
                    + '<table style="width:100%" class="table"><tr><th>Name</th><th>IP</th><th>Add</th></tr></table></div>'),
            table = instances.find('table'),
            opt = data || self.data(),
            vmc = 0;

    if (opt.networkid)
        for (var i = 0; i < __$vms.length; i++) {
            if (opt.networkid == __$vms[i].networkid) {
                vmc++;
                table.append('<tr><td>' + __$vms[i].name + '</td><td>' + __$vms[i].ipaddress + '</td><td><input type="checkbox" name="vmid[' + __$vms[i].id + ']" value="1"/></td></tr>');
            }
        }

    table.find('input').change(function() {
        var inp = $(this);
        if (inp.is(':checked')) {
            inp.next('input').remove();
        } else
            inp.after('<input type="hidden" value="0" name="' + inp.attr('name') + '">');
    });

    if (opt.instances) {
        for (var i = 0; i < opt.instances.length; i++) {
            table.find('input[name="vmid[' + opt.instances[i].id + ']"]').prop('checked', true);
        }
    }
    if (opt.vmid) {
        for (var id in opt.vmid) {
            table.find('input[name="vmid[' + id + ']"]').prop('checked', opt.vmid[id] == '1');
        }
    }
    if (!vmc)
        table.append('<tr><td colspan="3" style="text-align:center">No VMs in this network</td></tr>');
    instances.appendTo(form);
    return form;
}

function __buildFormFields(name, opt, prefix) {
    var inp = $(opt.type != 'select' ? '<input />' : '<select></select>').attr('name', prefix ? prefix + '[' + name + ']' : name).attr('id', 'params-' + name);

    for (var attr in opt) {
        if (attr != 'label' && attr != 'option')
            inp.attr(attr, opt[attr])
    }
    if (opt.option)
        for (var ix in opt.option) {
            var val = typeof opt.option[ix] == 'string' ? opt.option[ix] : opt.option[ix][0],
                    descr = typeof opt.option[ix] == 'string' ? opt.option[ix] : opt.option[ix][1];
            inp.append('<option value="' + val + '">' + descr + '</option>');
        }
    if (opt.type == 'checkbox')
        inp.val(1);

    if (opt.title && typeof $.fn.tooltip == 'function')
        inp.tooltip({placement: 'right'});

    inp = inp.wrap('<div class="controls"></div>').parent();
    return $('<div class="control-group"></div>').append('<label class="control-label">' + opt.label + '</label>').append(inp);
}