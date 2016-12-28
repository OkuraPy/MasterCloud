{foreach from=$c.items item=cit} <span class="fs11">
<input name="idprotection_control"  value="1" type="checkbox" {if $c.values[$cit.id] && $details.idprotection}checked="checked"{/if} onclick="idprotect_control(this)" />
<input name="idprotection" id="idprotection" value="{$details.idprotection}"  type="hidden" />
<input    id="idprotection_purchase" {if $c.values[$cit.id]}name="custom[{$kk}][{$cit.id}]" value="1"{else}name=""{/if} type="hidden" />
</span>
{break}
{/foreach}
<script type="text/javascript">
var idpname = "custom[{$kk}][{$cit.id}]";
{literal}
function idprotect_control(el) {

    if($(el).is(':checked')) {
        $('#idprotection').val("1");
        $('#idprotection_purchase').val("1").attr('name',idpname);
    } else {
        $('#idprotection').val("0");
    }
        return false;
}
{/literal}</script>