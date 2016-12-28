<div id="newshelfnav" class="newhorizontalnav">
    <div class="list-1">
        <ul>
            <li class="{if $action == 'default'}active{/if}">
                <a {if $action != 'default'} href="?cmd={$modulename}"{/if}><span>Servers</span></a>
            </li>
            <li class="{if $action == 'add' || $action == 'edit'}active{/if} last">
                <a {if $action != 'add' && $action == 'edit'}href="?cmd={$modulename}&action=add"{/if}><span>{if $action == 'edit'}{$entry.id|upper}{else}New Server{/if}</span></a>
            </li>
        </ul>
    </div>
</div>
<div  style="padding: 10px 0; width: 50%; float: right">
    <label>Domain name</label>
    <input type="text" value="example" name="sld" class="inp" />
    <button type="subbmit" id="test">Test</button>
    <div>
        <span id="status" style="line-height: 2em;"></span>
        <code id="output" style="display: none; white-space: pre-wrap; overflow: auto; background: rgb(238, 238, 238) none repeat scroll 0% 0%; padding: 10px; margin-right: 10px;"></code>
    </div>
</div>

{literal}
    <script type="text/javascript">
        $('#test').click(function() {
            var self = $(this);
            $('#output').hide();
            self.parents('div').eq(0).addLoader();
            
            $.post(window.location.href.replace(/action=[^&]*/, 'action=test'), {
                tld: $('input[name="id"]').val(),
                sld: $('input[name="sld"]').val(),
                server: $('input[name="server"]').val(),
                available: $('textarea[name="available"]').val(),
                unicode: $('input[name="unicode"]:checked').val()
            }, function(data) {
                $('#preloader').remove();
                $('#status').html(data.status ? '<b style="color: green">Available</a>' : '<b style="color: red">Unavailble</a>');
                
                if (data.data)
                    $('#output').text(data.data).show().css('display', 'block');
            })
        })
    </script>
{/literal}
<form method="post" action="?cmd={$modulename}&action={$action}" id="status_plugin"  style="padding: 10px 0;width: 50%; float: left">
    {if $action=="edit"}
        <input type="hidden" name="id" value="{$entry.id}"/>
        <input type="hidden" name="edit" value="{$entry.id}"/>
    {else}
        <input type="hidden" name="add" value="{$entry.id}"/>
    {/if}

    <table cellpadding="5" style="width: 100%">
        <tr>
            <td style="width: 140px; text-align: right"><label>Name</label></td>
            <td>
                {if $action=="edit"}
                    <b>{$entry.id}</b> <a href="http://www.iana.org/domains/root/db/{$entry.id}.html" >IANA</a>
                    <input type="hidden" value="{$entry.id}" name="id" class="inp" />
                {else}
                    <input type="text" value="{$entry.id}" name="id" class="inp" />
                {/if}
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right; vertical-align: middle"><label>Server host/url</label>
                <a class="vtip_description" title="Whois service addres, for whois server use hostnames, for http service use full url."></a></td>
            <td >
                <input type="text" value="{$entry.server}" name="server" class="inp" />
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right; vertical-align: top"><label>IDN</label>
                <a class="vtip_description" title="Select IDN format sent to server, eg: <br/> Unicode exåmple.com<br/> Punycode xn--exmple-jua.com."></a></td>
            <td >
                <input type="radio" value="0" name="unicode" {if !$entry.unicode}checked="checked"{/if}/> <b>Punycode</b> (default)<br />
                <input type="radio" value="1" name="unicode" {if $entry.unicode}checked="checked"{/if} /> <b>Unicode</b>
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right; vertical-align: top"><label>Availability string</label>
                <a class="vtip_description" title="String to match when testing for available domains"></a></td>
            <td >
                <textarea class="inp" name="available" style="width: 80%">{$entry.available}</textarea>
            </td>
        </tr>
    </table>
    <div class="clearfix" style="padding: 0 10px;">
        <button type="submit">Save Changes</button>
    </div>
    {securitytoken}
</form>
<div class="clear"></div>