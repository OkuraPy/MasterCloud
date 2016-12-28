{once}
<script type="text/javascript" src="{$template_dir}js/jquery.timeago.js"></script>
{literal}
    <script type="text/javascript">
        /*
         * For better localization replace this with configuration found here 
         * https://github.com/rmm5t/jquery-timeago/tree/master/locales
         */
        jQuery.timeago.settings.strings = {
            prefixAgo: null,
            prefixFromNow: null,
            suffixAgo: "ago",
            suffixFromNow: "from now",
            seconds: "less than a minute",
            minute: "about a minute",
            minutes: "%d minutes",
            hour: "about an hour",
            hours: "about %d hours",
            day: "a day",
            days: "%d days",
            month: "about a month",
            months: "%d months",
            year: "about a year",
            years: "%d years",
            wordSeparator: " ",
            numbers: []
        };
    </script>
{/literal}
{/once}
{literal}
    <script type="text/javascript">
        $(document).ready(function() {
            $('.date-time').timeago();
        });
    </script>
{/literal}