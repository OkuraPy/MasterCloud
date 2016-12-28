<div id="lmach">
    Loading VM details from server... <img src="{$template_dir}img/ajax-loading.gif">
    <br />
</div>
{literal}
    <script type="text/javascript">
        var xenLoading = false;
        function power_xenserv(url, what) {
            var conf = what == 'off' ? confirm('Are you sure you wish to power-off this VM?') : true;
            if (conf) {
                $('#lmach').addLoader();
                ajax_update(url + '&power=' + what, '', '#lmach');
            }
            return false;
        }
        function loadClientMachines_xenserv() {
            if (xenLoading)
                return false;
            console.log(xenLoading);
            if ($('vm_count').data('loaded') && !$('#tabbedmenu .tpicker').eq(2).hasClass('active')) {
                setTimeout(loadClientMachines_xenserv, 10000);
                return;
            }
            $('vm_count').data('loaded', true);
            $('#lmach').addLoader();
            xenLoading = true;
            var url ={/literal} '?cmd=accounts&action=edit&id={$details.id}&service={$details.id}&vpsdo=clientsvms';{literal}
            $.get(url, function(data) {
                data = parse_response(data);
                xenLoading = false;
                if (data) {
                    $('#lmach').html(data);
                }
                setTimeout(loadClientMachines_xenserv, 180000);
            });
        }
        $('a[href=#subvms]').click(function() {
            loadClientMachines_xenserv();
        });
    </script> 
    <style type="text/css">
        ul.accor li > div.darker {
            background:#e3e2e4 !important;
            border-bottom:1px solid #d7d7d7  !important;
            border-left:1px solid #d7d7d7  !important;
            border-right:1px solid #d7d7d7  !important;
        }
        ul.accor li > a.darker {
            background:url("{/literal}{$template_dir}{literal}img/plus1.gif") no-repeat scroll 6px 50% #444547 !important;
        }
        #lmach {
            padding:10px;
        }
        a.power {
            background: #cdcdcd;
            box-shadow: 1px 1px #525252;
            color: #555 !important;
            cursor: default;
            display: block;
            float: left;
            height: 19px;
            line-height: 19px;
            margin-left: 3px;
            text-align: center;
            text-decoration: none;
            width: 31px;
        }

        .vm-overview a.power {
            margin-left: 0;
            margin-right: 3px;
            text-shadow: none;
            background: #000
        }
        a.power.on-inactive:hover, a.power.off-inactive:hover {
            cursor: pointer;
            color: #fafafa !important;
        }

        a.power.on-active {
            color: #efe !important;
        }

        a.power.off-active {
            color: #fee !important;
        }

        a.power.on-disabled, a.power.off-disabled {
            color: #909090 !important;
            opacity: 0.8;
        }
        a.power.on-active{
            background: #4A9C49
        }
        a.power.off-active{
            background: #C84343
        }

        .right-aligned {
            text-align:right;
        }
        .ttable td {
            padding:3px 4px;
        }
        table.data-table.backups-list thead {
            border:1px solid #DDDDDD;
        }
        table.data-table.backups-list thead {
            border-left:1px solid #005395;
            border-right:1px solid #005395;
        }
        table.data-table.backups-list thead {
            font-size:80%;
            font-weight:bold;
            text-transform:uppercase;
        }
        table.data-table.backups-list thead td {
            background:none repeat scroll 0 0 #777777;
            color:#FFFFFF;
            padding:8px 5px;
        }
        table.data-table tbody td {
            background:none repeat scroll 0 0 #FFFFFF;
            border-top:1px solid #DDDDDD;
        }
        table.data-table tbody tr:hover td {
            background-color: #FFF5BD;
        }
        table.data-table tbody tr td {
            border-color:-moz-use-text-color #DDDDDD #DDDDDD;
            border-right:1px solid #DDDDDD;
            border-style:none solid solid;
            border-width:0 1px 1px;
            font-size:90%;
            padding:8px;
        }
    </style>
{/literal}