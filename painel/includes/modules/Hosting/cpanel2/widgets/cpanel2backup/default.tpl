{if $cperror}
    <div style="border-radius: 6px 6px 6px 6px; background: url('icons/ico_warn.gif') no-repeat scroll 8px 8px #FFFBCC; border: 1px solid #E6DB55;color: #FF0000;font-weight: bold;margin-bottom: 8px;padding: 8px 8px 8px 30px;">
        {$lang.couldconectto} <strong>CPanel</strong><br>
        {$lang.checkyourloginpassword}
        </di>
    {else}
        <div >
            {foreach from=$widgets item=wig}
                {if $widget.name == $wig.name}
                    {assign value=$wig.location var=widgeturl}
                {/if}
            {/foreach}
            <div id="billing_info" class="">
                <h2>{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</h2>
                <br />
                <div class="section">
                    <form autocomplete="off" action="?cmd={$cmd}&action={$action}&service={$service.id}&widget={$widget.name}&act={$act}" method="post">
                        <table class="checker table table-striped" width="100%" cellspacing="0" cellpadding="0" border="0">
                            {counter start=1 skip=1 assign=even}
                            <thead>
                                <tr {counter}{if $even % 2 !=0}class="even"{/if} >
                                    <td align="left">{$lang.Available}:</td>
                                </tr>
                            </thead>
                            <tbody id="updater">
                                {if $listentrys}
                                    {foreach from=$listentrys item=entry key=index} 
                                        <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                                            <td align="center">
                                                {if $entry.status == 'complete'}
                                                    <img src="{$widgeturl}ico_info.gif"
                                                     alt="{$entry.status|capitalize}" title="{$entry.status|capitalize}">
                                                    <strong>{$entry.file}</strong>
                                                    ( {$entry.localtime} )
                                                    <a href="{$access.url}&goto_uri=download%3Fskipencode%3D1%26file%3D%2Fhome%2Fhosting%2F{$entry.file|escape:'url'}"
                                                       class="btn btn-flat-primary btn-primary pull-right btn-small onetimelink"
                                                       ><i class="icon icon-download-alt icon-white"></i></a>
                                                {else}
                                                <img src="{$widgeturl}ajax-loading2.gif"
                                                     alt="{$entry.status|capitalize}" title="{$entry.status|capitalize}">
                                                     <strong>{$entry.file}</strong>
                                                    ( {$entry.localtime} )
                                                {/if}
                                                
                                            </td>
                                        </tr>
                                    {/foreach}
                                {else}
                                    <tr {counter}{if $even % 2 !=0}class="even"{/if}>
                                        <td align="center">
                                            <strong>{$lang.nobackups}</strong>
                                        </td>
                                    </tr>
                                {/if}
                            </tbody>
                            <tfoot>
                                <tr {counter}{if $even % 2 !=0}class="even"{/if}><td colspan="4">{$lang.yourbackapslocatedin}<strong>{if $ftp_homedir}{$ftp_homedir}{else}home/yourusername{/if}</strong> directory</td></tr>
                                <tr {counter}{if $even % 2 !=0}class="even"{/if}><td style="border:none" colspan="4"><input class="btn" type="submit" name="save" value="Create new backup"></td></tr>
                            </tfoot>
                        </table>
                    </form>
                </div>
            </div>
        </div>
                            
                            {literal}
                                <script>
                                    $(function(){
                                        $('.onetimelink').mouseup(function(){
                                            var self = $(this);
                                            setTimeout(function(){
                                                self.attr('href',window.location.href).addClass('disabled');
                                            }, 100)
                                        })
                                    })
                                    </script>
                                {/literal}
    {/if}