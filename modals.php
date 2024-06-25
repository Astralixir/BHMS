

<div id="modal-progressbar" class="modal fade" tabindex="-1" role="dialog" style="z-index: 9999999999;" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <text name="text">Please Wait...</text>
      </div>
    </div>
  </div>
</div>


<div id="modal-success" class="modal fade" tabindex="-1" role="dialog" style="z-index: 99999999;">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <text name="text">Success!</text>
      </div>
    </div>
  </div>
</div>
<script>
  function modal_success(text, sizing, timer){

    var $modal = $("#modal-success");

    $modal.find("text[name='text']").html(text);

    $modal.find("div.modal-dialog")
    .removeClass("modal-sm")
    .removeClass("modal-md")
    .removeClass("modal-lg")
    .removeClass("modal-xl")
    .removeClass("modal-xxl");

    $modal.find("div.modal-dialog")
    .addClass("modal-"+sizing);

    $modal.modal("show");

    setTimeout(function(){
      $modal.modal("hide");
    }, timer)

  }
</script>









<div id="modal-alert" class="modal fade" tabindex="-1" role="dialog" style="z-index: 999999;">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><text name="title"></text></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
        <text name="text"></text>
      </div>
    </div>
  </div>
</div>
<script>
  function modal_alert(title, text, sizing, style, timer){

    var $modal = $("#modal-alert");

    $modal.find("text[name='text']").html(text);
    $modal.find("text[name='title']").html(title);

    $modal.find("div.modal-dialog")
    .removeClass("modal-sm")
    .removeClass("modal-md")
    .removeClass("modal-lg")
    .removeClass("modal-xl")
    .removeClass("modal-xxl");

    $modal.find("div.modal-dialog")
    .addClass("modal-"+sizing);

    console.log("modal-"+sizing);

    $modal.modal("show");

    setTimeout(function(){
      $modal.modal("hide");
    }, timer)

  }
</script>









<form id="frm-confirm">
  <div id="modal-confirm" class="modal fade" tabindex="-1" role="dialog" style="z-index: 99999;">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><text name="title"></text></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">

          <input type="hidden" name="yescallback" value="-">
          <input type="hidden" name="nocallback" value="-">

          <text name="text"></text>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Yes</button>
          <button name="nocallback" type="button" class="btn btn-secondary">No</button>
        </div>
      </div>
    </div>
  </div>
</form>
<script>
  function modal_confirm(title, text, sizing, style, yescallback, nocallback){

    $("#frm-confirm").trigger("reset");

    var $modal = $("#modal-confirm");

    $modal.find("text[name='text']").html(text);
    $modal.find("text[name='title']").html(title);

    $modal.find("div.modal-dialog")
    .removeClass("modal-sm")
    .removeClass("modal-md")
    .removeClass("modal-lg")
    .removeClass("modal-xl")
    .removeClass("modal-xxl");

    $modal.find("div.modal-dialog")
    .addClass("modal-"+sizing);

    $modal.find("input[name='yescallback']").val(yescallback);
    $modal.find("input[name='nocallback']").val(nocallback);

    $modal.modal("show");

  }


  $("#frm-confirm").submit(function(e){
    e.preventDefault();

    var $frm = $(this);

    var yescallback = $frm.find("input[name='yescallback']").val();

    eval( yescallback );

    $("#modal-confirm").modal("hide");
    setTimeout(function(){
      $frm.find("button[type='submit']").focus();
    }, 1500)

  })


  $("#frm-confirm").find("button[name='nocallback']").on("click", function(){
    var $frm = $(this);

    var nocallback = $frm.find("input[name='nocallback']").val();

    eval( nocallback );
    $("#modal-confirm").modal("hide");
  })

</script>










<form id="frm-signup">
<div id="modal-signup" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Sign Up</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="row">

          <div class="form-group col-sm-3">
            <label class="control-label">Username</label>
            <input xvalue="" name="username" type="text" class="form-control form-control-sm" placeholder="Username" required>
          </div>
          <div class="form-group col-sm-3">
            <label class="control-label">Password</label>
            <input xvalue="" name="password" type="text" class="form-control form-control-sm" placeholder="Password" required>
          </div>
          <div class="form-group col-sm-6">
          </div>

          <div class="form-group col-sm-4">
            <label class="control-label">First Name</label>
            <input xvalue="" name="firstname" type="text" class="form-control form-control-sm" placeholder="First Name" required>
          </div>
          <div class="form-group col-sm-3">
            <label class="control-label">Middle Name</label>
            <input xvalue="" name="middlename" type="text" class="form-control form-control-sm" placeholder="Middle Name (Optional)">
          </div>
          <div class="form-group col-sm-3">
            <label class="control-label">Last Name</label>
            <input xvalue="" name="lastname" type="text" class="form-control form-control-sm" placeholder="Last Name" required>
          </div>
          <div class="form-group col-sm-2">
            <label class="control-label">Name Ext.</label>
            <select name="nameextension" class="form-control form-control-sm" required>
              <option value="-">N/A</option>
              <option>Jr.</option>
              <option>Sr.</option>
            </select>
          </div>


          
          <div class="form-group col-sm-3">
            <label class="control-label">Birthday</label>
            <input value="<?php echo date('Y-m-d'); ?>" name="birthday" type="date" class="form-control form-control-sm" placeholder="Birthday">
          </div>
          <div class="form-group col-sm-3">
            <label class="control-label">Gender</label>
            <select name="gender" class="form-control form-control-sm" required>
              <!-- <option value="">Select Gender</option> -->
              <option>Male</option>
              <option>Female</option>
            </select>
          </div>
          <div class="form-group col-sm-6">
            <label class="control-label">Address</label>
            <textarea name="address" rows="2" class="form-control form-control-sm" placeholder="Address" required></textarea>
          </div>


          

          <div class="form-group col-sm-6">
            <label class="control-label">Email Address</label>
            <input xvalue="" name="emailaddress" type="email" class="form-control form-control-sm" placeholder="Email Address" required>
          </div>
          <div class="form-group col-sm-6">
            <label class="control-label">Mobile Number</label>
            <input xvalue="" name="mobilenumber" type="text" class="form-control form-control-sm" placeholder="Mobile Number" required>
          </div>


         


          <div class="col-sm-12">
          <h6>At least 2 (Valid IDs)</h6>
          </div>
          <div class="pb-4 col-sm-12 border-top border-bottom" id="CSP-attachment"></div>


        </div>

      </div>
      <div class="modal-footer text-center">
          <button type="submit" class="btn btn-success">Sign Up</button>
      </div>
    </div>
  </div>
</div>
</form>
<script>
  $("#frm-signup").submit(function(e){
      e.preventDefault();
      var $frm = $("#frm-signup");

      var username        = $frm.find("input[name='username']").val();
      var password        = $frm.find("input[name='password']").val();
      var firstname       = $frm.find("input[name='firstname']").val();
      var lastname        = $frm.find("input[name='lastname']").val();
      var middlename      = $frm.find("input[name='middlename']").val();
      var nameextension   = $frm.find("select[name='nameextension']").val();
      var birthday        = $frm.find("input[name='birthday']").val();
      var gender          = $frm.find("select[name='gender']").val();
      var address         = $frm.find("textarea[name='address']").val();
      var emailaddress    = $frm.find("input[name='emailaddress']").val();
      var mobilenumber    = $frm.find("input[name='mobilenumber']").val();

      var l = $("#CSP-xnativeattachment").find("div[name='fileattachment']").length;

      if( l < 2){
        // toggle_popover( $("#CSP-xnativeattachment"), "Notice!", "At least 2 files are required.", "top" );
          modal_alert("Notice!", "At least 2 (Valid IDs) are required.", "sm", "warning", 5000);

        return;
      }


      $.post("actions/signup.php",{
        username        : username,
        password        : password,
        firstname       : firstname,
        lastname        : lastname,
        middlename      : middlename,
        nameextension   : nameextension,
        birthday        : birthday,
        gender          : gender,
        address         : $.trim(address),
        emailaddress    : emailaddress,
        mobilenumber    : mobilenumber
      }, function(data){
          if( $.trim(data) == "OK" ){
            $("#modal-signup").modal("hide");
            modal_alert("Success!", "Your registrations has been submitted. <br>You will be notified through email once your registration is approved. <br>Thank You. -Administration", "md", "success", 5000);
          }else{
            modal_alert("Notice!", data, "sm", "warning", 5000);
          }
      })

  })
</script>










<div id="gen-spinner" hidden>
  <div class="d-flex justify-content-center" hidden>
    <div class="spinner-border" role="status">
      <span class="visually-hidden"></span>
    </div>
  </div>
</div>
<div id="gen-btn-spinner" class="justify-content-center" hidden>
    <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
    <span class="visually-hidden"></span>
</div>
<script>
  function gen_spinner(spinnersize, spinnerclass){

    // // spinner-border-xs
    // // spinner-border-sm
    // // spinner-border-md
    // // spinner-border-lg
    // // spinner-border-xl
    $("#gen-spinner").find("div[name='spinner-holder']")
    .removeClass("text-primary")
    .removeClass("text-secondary")
    .removeClass("text-success")
    .removeClass("text-danger")
    .removeClass("text-warning")
    .removeClass("text-info")
    .removeClass("text-light")
    .removeClass("text-dark")
    .removeClass("spinner-border-xs")
    .removeClass("spinner-border-sm")
    .removeClass("spinner-border-md")
    .removeClass("spinner-border-lg")
    .removeClass("spinner-border-xl")
    $("#gen-spinner").find("div[name='spinner-holder']")
    .addClass(spinnersize)
    .addClass(spinnerclass);
    return $("#gen-spinner").html();
  }
  function gen_btn_spinner(spinnersize, spinnerclass){
    // spinner-border-xs
    // spinner-border-sm
    // spinner-border-md
    // spinner-border-lg
    // spinner-border-xl
    $("#gen-btn-spinner").find("div[name='spinner-holder']")
    .removeClass("text-primary")
    .removeClass("text-secondary")
    .removeClass("text-success")
    .removeClass("text-danger")
    .removeClass("text-warning")
    .removeClass("text-info")
    .removeClass("text-light")
    .removeClass("text-dark")
    .removeClass("spinner-border-xs")
    .removeClass("spinner-border-sm")
    .removeClass("spinner-border-md")
    .removeClass("spinner-border-lg")
    .removeClass("spinner-border-xl")
    $("#gen-btn-spinner").find("div[name='spinner-holder']")
    .addClass(spinnersize)
    .addClass(spinnerclass);
    return $("#gen-btn-spinner").html();
  }
</script>











<form id="frm-tnt-login">
<div id="modal-tnt-login" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-md modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Log In</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
      </div>
      <div class="modal-body">

        <h4>Hello! let's get started.</h4>
        <h6 class="fw-light">Log in to continue.</h6>

            <div class="row">
              <div class="col-md-4">
                  <div class="mb-3 form-check form-check-inline">
                    Log In As:
                  </div>
              </div>
              <div class="col-md-4">
                <div class="mb-3 form-check form-check-inline">
                  <input name="UserType" type="radio" class="form-check-input" id="exampleCheck1" value="Tenant" required>
                  <label class="form-check-label" for="exampleCheck1">Tenant</label>
                </div>
              </div>
              <div class="col-md-4">
                  <div class="mb-3 form-check form-check-inline">
                    <input name="UserType" type="radio" class="form-check-input" id="exampleCheck2" value="Owner" xchecked required>
                    <label class="form-check-label" for="exampleCheck2">Owner</label>
                  </div>
              </div>
            </div>


          <div class="form-group">
            <input name="Username" type="text" class="form-control" placeholder="Username" required>
          </div>
          <div class="form-group">
            <input name="Password" type="password" class="form-control mt-2" placeholder="Password" required>
          </div>
          <div class="my-2 d-flex justify-content-between align-items-center">
              Don't have an account? <button href="#" type="button" class="btn btn-sm btn-outline-primary2" onclick="load_signup()">Sign Up</button>
          </div>


      </div>
      <div class="modal-footer text-center">
          <button type="submit" class="btn btn-primary">Log in</button>
          <button type="button" data-bs-dismiss="modal" class="btn btn-danger">Cancel</button>
      </div>
    </div>
  </div>
</div>
</form>
<script>
    $("#frm-tnt-login").on("submit", function(e){
      e.preventDefault();
      var $frm = $("#frm-tnt-login");

      var UserType = $frm.find("input:radio[name='UserType']:checked").val();
      var Username = $frm.find("input[name='Username']").val();
      var Password = $frm.find("input[name='Password']").val();
        
      $.post("actions/tnt-login.php",{
        UserType  : UserType,
        Username  : Username,
        Password  : Password
      }, function(data){

        localStorage.clear();

        var res = JSON.parse(data);

        if(res['response'] == "OK"){
          switch(res['UserType']){
            case "Tenant":
              localStorage.UserID = res['UserID'];
              window.location.assign("index.php");
            break;
            case "Owner":
              localStorage.UserID = res['UserID'];
              window.location.assign("admin/index.php");
            break; 
          }
        }else{
          toast_alert("error", res['response']);
        }

      

      })
    })
</script>






<form id="frm-tnt-signup">
<div id="modal-tnt-signup" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-md modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Sign Up</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
      </div>
      <div class="modal-body">

         <h4>Sign Up</h4>
          <h6 class="fw-light">Get started with your free account.</h6>

            <div class="row">
              <div class="col-md-4">
                  <div class="mb-3 form-check form-check-inline">
                    Sign Up As:
                  </div>
              </div>
              <div class="col-md-4">
                <div class="mb-3 form-check form-check-inline">
                  <input name="UserType" type="radio" class="form-check-input" id="exampleCheck1" value="Tenant" required>
                  <label class="form-check-label" for="exampleCheck1">Tenant</label>
                </div>
              </div>
              <div class="col-md-4">
                  <div class="mb-3 form-check form-check-inline">
                    <input name="UserType" type="radio" class="form-check-input" id="exampleCheck2" value="Owner" xchecked required>
                    <label class="form-check-label" for="exampleCheck2">Owner</label>
                  </div>
              </div>
            </div>
           

            <div class="form-group">
              <input name="FirstName" type="text" class="form-control" placeholder="First Name" required>
            </div>
            <div class="form-group">
              <input name="MiddleName" type="text" class="form-control" placeholder="Middle Name">
            </div>
            <div class="form-group">
              <input name="LastName" type="text" class="form-control" placeholder="Last Name" required>
            </div>
            <div class="form-group input-group">
                <div class="input-group-prepend mt-2">
                    <span class="input-group-text"> <i class="fa fa-phone" aria-hidden="true"></i> +63</span>
                </div>
                <input class="form-control text-box single-line" maxlength="10" minlength="10" name="ContactNumber" onkeypress="return (event.charCode !=8 &amp;&amp; event.charCode ==0 || (event.charCode >= 48 &amp;&amp; event.charCode <= 57))" onkeyup="checkMobile()" placeholder="9171234567" required="required" type="text" value="">
                <span class="field-validation-valid text-danger" data-valmsg-for="MobileNo" data-valmsg-replace="true"></span>

            </div>
            <div class="form-group">
              <input name="EmailAddress" type="email" class="form-control" placeholder="Email Address" required>
            </div>
            <div class="form-group">
              <input name="Password" type="password" class="form-control" placeholder="Password" required>
            </div>
            <div class="form-group">
              <input name="ConfirmPassword" type="password" class="form-control" placeholder="Confirm Password" required>
            </div>
            <div class="my-2 d-flex justify-content-between align-items-center">
              Already have an account? <button href="#" type="button" class="btn btn-sm btn-primary2" onclick="load_login()">Log in</button>
            </div>


      </div>
      <div class="modal-footer text-center">
          <button type="submit" class="btn btn-primary">Sign Up</button>
          <button type="button" data-bs-dismiss="modal" class="btn btn-danger">Cancel</button>
      </div>
    </div>
  </div>
</div>
</form>





<form id="frm-verify-account">
<div id="modal-verify-account" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-md modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Verify Account</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
      </div>
      <div class="modal-body">

        <input type="hidden" name="UserType" value="-">
        <input type="hidden" name="SignUpID">

        <h6 class="text-center">Please enter the verification code sent to</h6>
        <h5 class="text-success text-center"><text name="EmailAddress"></text></h5>

    
          <div class="form-group">
            <input xvalue="" name="VerificationCode" type="text" class="form-control form-control-lg" placeholder="Verification Code" maxlength="6" required>
          </div>


      </div>
      <div class="modal-footer text-center">
          <button type="submit" class="btn btn-primary">Verify</button>
          <button type="button" data-bs-dismiss="modal" class="btn btn-danger">Cancel</button>
      </div>
    </div>
  </div>
</div>
</form>


<script>
  $("#frm-tnt-signup").on("submit", function(e){
    e.preventDefault();
    var $frm = $("#frm-tnt-signup");

    var UserType      = $frm.find("input:radio[name='UserType']:checked").val();
    var FirstName     = $frm.find("input[name='FirstName']").val();
    var MiddleName    = $frm.find("input[name='MiddleName']").val();
    var LastName      = $frm.find("input[name='LastName']").val();
    var ContactNumber = $frm.find("input[name='ContactNumber']").val();
    var EmailAddress  = $frm.find("input[name='EmailAddress']").val();
    var Password      = $frm.find("input[name='Password']").val();
    var ConfirmPassword = $frm.find("input[name='ConfirmPassword']").val();
      
    if(Password !== ConfirmPassword){
      toggle_popover( $frm.find("input[name='ConfirmPassword']"), "Notice!", "You password does not match.", "top" );
      return;
    }
    
    $.post("actions/tnt-signup.php",{
      UserType      : UserType,
      FirstName     : FirstName,
      MiddleName    : MiddleName,
      LastName      : LastName,
      ContactNumber : ContactNumber,
      EmailAddress  : EmailAddress,
      Password      : Password
    }, function(data){

      var res = JSON.parse(data);

      var response = res['response'];
      var SignUpID = res['SignUpID'];

      if($.trim(response) == "OK"){
        // window.location.assign("index.php");
        // toast_alert("success", "Vef code sent.");

        $("#frm-verify-account").trigger("reset");
        $("#frm-verify-account").find("input[name='UserType']").val(UserType);
        $("#frm-verify-account").find("input[name='SignUpID']").val(SignUpID);
        $("#frm-verify-account").find("text[name='EmailAddress']").html(EmailAddress);
        $("#modal-verify-account").modal("show");

      }else{
        toast_alert("error", res['response']);
      }

    })
  })


  $("#frm-verify-account").on("submit", function(e){
    e.preventDefault();

    var $frm = $(this);

    var UserType = $frm.find("input[name='UserType']").val();
    var SignUpID = $frm.find("input[name='SignUpID']").val();
    var VerificationCode = $frm.find("input[name='VerificationCode']").val();

    $.post("actions/tnt-verify-account.php",{
      SignUpID: SignUpID,
      VerificationCode: VerificationCode
    }, function(data){
      if($.trim(data) == "OK"){
        $("#modal-verify-account").modal("hide");

        if(UserType == "Owner"){
          toast_alert("success", "Email verified, please wait while we are reviewing your application as owner, we will send an email as soon as possible.");
        }else{
          toast_alert("success", "Account verified, now you can log in.");
          load_login();
        }

      }else{
        toast_alert("error", data);
      }
    })


  })

</script>









