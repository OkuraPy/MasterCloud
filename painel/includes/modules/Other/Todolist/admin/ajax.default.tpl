{if !$frontpage}

{else}
<h3>Todo List Addon</h3>
{/if}
<div id="tdcont">
{if $todo}


{foreach from=$todo item=task}
<div class="task ti_{$task.id}">
<div class="havecontrols">

	<div class="controls">	
		{if $task.addwho==$task.me}<a class="editbtn" href="#"  onclick="return showEditor(this)">Edit</a> 
		<a class="delbtn" href="#" onclick="return deleteMe({$task.id})">Delete</a>{/if}
	</div>	
</div>
<div class="ittem">
	<input type="checkbox" {if $task.status=='Done'}checked="checked"{/if} onclick="return markMe(this)" id="{$task.id}" style="float:left"/>
	<div class="descript">{if $task.status=='Done'}<span class="done">{/if}{$task.description}{if $task.status=='Done'}</span>{/if} <small>Added by {if $task.addwho==$task.me}me{else}{$task.headdit}{/if} {if $task.status=='Done'}Completed by {if $task.didwho==$task.me}me{else}{$task.hedidit}{/if}{/if}</small></div>
	<div class="editor">
		<input class="descr1 inp" value="{$task.description}"/> <a href="#" onclick="return editTask({$task.id})" class="savebtn">save</a>
	</div>
</div>
</div>
{/foreach}
<script type="text/javascript">{literal}
$('.task').hover(function(){
$(this).find('.controls').show();
$(this).addClass('hover');
$(this).find('small').show();
},function(){$(this).find('.controls').hide();$(this).removeClass('hover');$(this).find('small').hide();});
{/literal}</script>

{/if}


{if $frontpage}
<a href="#" onclick="$('#addnewtask').slideDown();return false;"><strong>+ Add new task</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="?cmd=module&module={$moduleid}">More tasks</a>
<div id="addnewtask">
<strong>Add new task:</strong>
For: <select id="to_who" class="inp">
	<option value="Me">Only Me</option>
	<option value="All">All</option>
</select>
Todo:
<input id="description" class="inp"/>
<a href="#" onclick="return addTask()" class="savebtn">save</a></div>
{/if}
</div>
