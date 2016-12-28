<div class="header-bar">
    <h3 class="{$vpsdo} hasicon">
        {if $vpsdo=="editvm"}
            {$lang.scalevm}
        {else}{$lang.autoscaling}
        {/if}
    </h3>
    <div class="clear"></div>
</div>
<div class="content-bar nopadding" style="position:relative">
    <form method="post" action="" onsubmit="return configrm_downgrade('{$lang.switchoffvmbeforescale} {$lang.sure_to_shutdown}?');">
        <input type="hidden" value="editmachine" name="make" />
        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="checker">
            <tr>
                <td colspan="2">
                    <div class="input-with-slider">
                        <span class="slabel">{$lang.RAM}</span>
                        <input type="text" size="4" required="required" name="CreateVM[memory]" class="styled" value="{if $VMDetails.memory}{$VMDetails.memory}{else}{$CreateVM.vmlimits.mem}{/if}" id="virtual_machine_memory"/>
                        MB
                        <div class="slider" max="{$CreateVM.vmlimits.mem}" min="256" step="4" target="#virtual_machine_memory"></div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="input-with-slider">
                        <span class="slabel">{$lang.cpucores}</span>
                        <input type="text" size="4" required="required" name="CreateVM[cpus]" class="styled" value="{if $VMDetails.cpus}{$VMDetails.cpus}{else}{$CreateVM.vmlimits.cpu}{/if}" id="virtual_machine_cpus"/>

                        <div class="slider" max="{$CreateVM.vmlimits.cpu}" min="1" step="1" target="#virtual_machine_cpus"  total="{$CreateVM.vmlimits.cpus}" divide="#virtual_machine_cpu_shares"></div>
                    </div>
                </td>
            </tr>
            {if $CreateVM.vmlimits.cpus_pc}
                <tr>
                    <td colspan="2">
                        <div class="input-with-slider">
                            <span class="slabel">{$lang.cpuspeed}</span>
                            <input type="text" size="4" required="required" name="CreateVM[cpu_shares]" class="styled" value="{if $VMDetails.cpu_shares}{$VMDetails.cpu_shares}{else}{$CreateVM.vmlimits.cpus_default}{/if}" id="virtual_machine_cpu_shares"/>
                            MHz
                            <div class="slider" max="{$CreateVM.vmlimits.cpus_default}" up-limit="{$CreateVM.vmlimits.cpus_pc}" min="1" step="1" target="#virtual_machine_cpu_shares"></div>
                        </div>

                    </td>
                </tr>
            {/if}
            <tr>
                <td align="center" class="checker-none" colspan="2">
                    <input type="submit" value="{$lang.adjresall}" class="blue"/>
                </td>
            </tr>
        </table>
        {securitytoken} 
    </form>
    {literal}
        <script type="text/javascript">

            $(document).ready(function() {
                init_sliders();
            });
            function configrm_downgrade(text) {

                {/literal}
                var dynamic = !!'{if $VMDetails.isdynamicallyscalable}1{/if}',
                    power = !!'{if $VMDetails.power!='false'}1{/if}' || false,
                    prev_memory = parseInt('{$VMDetails.memory}'),
                    prev_cpus = parseInt('{$VMDetails.cpus}'),
                    prev_cpu_share = parseInt('{$VMDetails.cpu_shares}'),
                    cpus = parseInt($('#virtual_machine_cpus').val()) || prev_cpus,
                    memory = parseInt($('#virtual_machine_memory').val()) || prev_memory,
                    cpu_share = parseInt($('#virtual_machine_cpu_shares').val()) || prev_cpu_share;
                {literal}
                console.log("VM-isdynamicallyscalable: " + dynamic);
                console.log("VM-power: " + power);
                if (dynamic) {
                    var downgrade = prev_memory > memory || prev_cpus > cpus || prev_cpu_share > cpu_share;
                    console.log("VM-downgrade: " + downgrade);
                    
                    return !downgrade || !power ||  confirm(text);
                }

                return !power || confirm(text);
            }
        </script>
    {/literal}
</div>