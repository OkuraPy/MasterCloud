<div class="clrearfix">
    <textarea class="left" name="limits[{$key}]" style="width: 160px" class="inp" >{$entry.limits.$key|regex_replace:"/[\s;,]+/":"\n"}</textarea>
    <div class="left shownice fs11" style="padding: 10px">
        <b>Enter list of tags to use when creating {if $key=='data_storage_tag'}data volume{else}new VM{/if} . </b><br/>
        First tag (from this list) found on selected server will be used, leave empty to use product configuration.
    </div>
</div>