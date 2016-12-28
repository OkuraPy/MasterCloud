Slider will use minimum and maximum value from Validation tab. Note - price (if any) is set per 1 item.<br/>
<div class="clear"></div><label for="text-keyb">Slider step<small>Minimum slider value increase/decrease</small></label>
 <input id="text-keyb" type="text" size="4" name="config[step]" value="{$field.config.step}" />
 <div class="clear"></div><label for="text-keya">Default value<small>Set this initial value if nothing is set yet</small></label>
 <input id="text-keya" type="text" size="4" name="config[initialval]" value="{$field.config.initialval}" />
  <div class="clear"></div><label for="text-keyx">Don't charge for default <small>With this option on default slider value will be free</small></label>
 <input id="text-keyx" type="checkbox"  name="config[dontchargedefault]" {if $field.config.dontchargedefault}checked="checked"{/if} value="1" />