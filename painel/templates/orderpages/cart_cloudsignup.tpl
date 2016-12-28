{*
@@author:: HostBill team
@@name:: Cloud Signup Orderpage
@@description:: Orderpage to work with Cloud Signup plugin. Only one product should be configured / visible for this orderpage. If client will pick this orderpage, he will be redirected for cloud signup process (just email + password)
@@thumb:: images/cloud_signup.png
@@img:: images/cloud_signup.png
*}
<script>

    window.location='?cmd=cloudsignup&cart_id={$current_cat}'
</script>
<center>Redirecting to signup...</center>