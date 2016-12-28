<script type="text/javascript">
    var infos = [], errors=[];
    {if $error}
        {foreach from=$error item=blad}errors.push('{$blad|escape:'javascript'}');
        {/foreach}
    {/if}                
    {if $info}
        {foreach from=$info item=infos}infos.push('{$infos|escape:'javascript'}');
        {/foreach}
    {/if}
    {literal}
    $(function(){
        pnotify(infos,'info');
        pnotify(errors,'error');
    });
    function pnotify(list, type){
        for(var i in list)
            $.pnotify({
                text: list[i],
                type: type,
                hide: false,
                sticker: false,
                icon: false
            });
    }
    
    {/literal}
</script>