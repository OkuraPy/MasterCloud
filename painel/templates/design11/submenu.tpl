<header id="main-header" class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a href="#" class="brand">{$business_name}</a>
            <a class="btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon icon-Settings"></span>
            </a>
            <div class="nav-collapse collapse navbar-responsive-collapse">
                <ul class="nav pull-right">
                    <li>
                        <a href="{$ca_url}cart/">
                            <span class="icon icon-ShoppingCart"></span>
                        </a>
                    </li>
                    {if $logged=='1'}
                        <li>
                            <a href="{$ca_url}tickets/" data-toggle="tooltip" title="Support Tickets">
                                <span class="icon icon-EmptyBox"></span>
                                <span class="badge badge-top">{clientstats type="ticketNew" }</span>
                            </a>
                        </li>
                        <li>
                            <a href="{$ca_url}clientarea/invoices/" data-toggle="tooltip" title="Invoices">
                                <span class="icon icon-File"></span>
                                <span class="badge badge-top">{clientstats type="invoices"}</span>
                            </a>
                        </li>
                    {/if}
                    <li>
                        <a href="{$ca_url}clientarea{if $logged=='1'}/details/{/if}" data-toggle="tooltip" title="Settings">
                            <span class="icon icon-Settings"></span>
                        </a>
                    </li>
                    {include file="search_field.tpl"}

                    <li class="dropdown" id="loig-in-point">
                        <a href="clientarea/details/" class="dropdown-toggle" data-toggle="dropdown"> 
                            <span class="icon icon-Flag"></span>
                        </a>

                        <ul class="dropdown-menu">
                            {foreach from=$languages item=ling}
                                <li id="lang_{$ling|capitalize}">
                                    <a href="{$ca_url}{$cmd}&action={$action}&languagechange={$ling|capitalize}">
                                        {$lang[$ling]|capitalize}
                                    </a>
                                </li>
                            {/foreach}
                        </ul>

                    </li>
                    <li class="dropdown" id="loig-in-point">
                        <a href="clientarea/details/" class="dropdown-toggle login-widget" data-toggle="dropdown"> 
                            <span class="icon icon-User"></span>
                        </a>
                        <ul class="dropdown-menu">
                            {if $logged!='1'}
                                <li><a href="{$ca_url}signup/">{$lang.createaccount}</a></li>
                                <li><a href="{$ca_url}clientarea/">{$lang.login}</a></li>
                                {else}
                                <li><a href="{$ca_url}clientarea/details/">{$lang.manageaccount}</a></li>
                                <li><a href="?action=logout">{$lang.logout}</a></li>
                                {/if}
                                {if $adminlogged}
                                <li class="divider"></li>
                                <li><a  href="{$admin_url}/index.php{if $login.id}?cmd=clients&amp;action=show&amp;id={$login.id}{/if}">{$lang.adminreturn}</a></li>
                                {/if}
                        </ul>
                    </li>
                    {*}
                    <li id="right_menu_btn">
                        <a href="#side">
                            <span class="icon icon-Info"></span>
                        </a>
                    </li>
                    {*}
                </ul>
            </div>
        </div>
    </div>
</header>
                {*}
<div class="span2" id="right_menu" style="display: none;">
    <div class="rmenu_header">
        <span class="icon icon-Info"></span>
        <h4>Account details</h4>
    </div>
    <div class="space20">
        <div class="your_ballance">
            <img src="img/cc.png" alt="ballance">
            <hgroup>
                <h6>Account ballance</h6>
                <h3>$56.00 USD</h3>
            </hgroup>
        </div>
        <div class="rmenu_divider"></div>
        <div class="invoice_due">
            <img src="img/info.png" alt="info">
            <hgroup>
                <h6>Invoices due</h6>
                <h3>-$30.00 USD</h3>
            </hgroup>
        </div>
        <a href="#" class="btn btn-info btn-add-funds pull-right">Add funds</a> 
        <a href="#" class="btn btn-warning btn-pay-all pull-left">Pay all</a>
        <div style="clear:both;"></div>
    </div>
    <div class="rmenu_header">
        <span class="icon icon-EmptyBox"></span>
        <h4>Recently support <br>tickets activity</h4>
    </div> 
    <div class="space20">
        <div class="tickets">
            <div class="admin_reply">
                <span class="entypo">&#59154;</span>
                <h5>Admin Reply</h5><br>
                <h4>Ticket#333</h4><br>
                <span>18/11/2015</span>
            </div>
            <div class="user_reply">
                <span class="entypo">&#128100;</span>
                <h5>User Reply</h5><br>
                <h4>Ticket#333</h4><br>
                <span>18/11/2015</span>
            </div>
            <div class="new_ticket">
                <span class="entypo">&#8505;</span>
                <h5>User Reply</h5><br>
                <h4>Ticket#333</h4><br>
                <span>18/11/2015</span>
            </div>
            <div class="admin_reply">
                <span class="entypo">&#59154;</span>
                <h5>Admin Reply</h5><br>
                <h4>Ticket#333</h4><br>
                <span>18/11/2015</span>
            </div>
            <div class="user_reply">
                <span class="entypo">&#128100;</span>
                <h5>User Reply</h5><br>
                <h4>Ticket#333</h4><br>
                <span>18/11/2015</span>
            </div>
            <a href="#" class="btn btn-primary btn-view-all">View all</a>
        </div>    
    </div>
    <div class="rmenu_header">
        <span class="icon icon-Files"></span>
        <h4>Invoices activity</h4>
    </div> 
    <div class="space20">
        <div class="tickets">
            <div class="admin_reply">
                <span class="entypo">&#59154;</span>
                <h5>Admin Reply</h5><br>
                <h4>Ticket#333</h4><br>
                <span>18/11/2015</span>
            </div>
            <div class="user_reply">
                <span class="entypo">&#128100;</span>
                <h5>User Reply</h5><br>
                <h4>Ticket#333</h4><br>
                <span>18/11/2015</span>
            </div>
            <div class="closed">
                <span class="entypo">&#10003;</span>
                <h5>User Reply</h5><br>
                <h4>Ticket#333</h4><br>
                <span>18/11/2015</span>
            </div>
            <div class="admin_reply">
                <span class="entypo">&#59154;</span>
                <h5>Admin Reply</h5><br>
                <h4>Ticket#333</h4><br>
                <span>18/11/2015</span>
            </div>
            <div class="user_reply">
                <span class="entypo">&#128100;</span>
                <h5>User Reply</h5><br>
                <h4>Ticket#333</h4><br>
                <span>18/11/2015</span>
            </div>
            <!-- <div class="text-center"> -->
            <a href="#" class="btn btn-primary btn-view-all">View all</a>
            <!-- </div> -->
        </div>   
    </div>                     
</div><!-- /span2-->
{*}