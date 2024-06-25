<?php
  require_once "connection.php";

  $bhs = $conn->prepare("SELECT * FROM tblbhs WHERE BHID IN (SELECT BHID FROM tblrooms WHERE RoomID IN (SELECT RoomID FROM tblbeds))");

  $thumb = $conn->prepare("SELECT filename, ext FROM tblattachments WHERE primaryfield = ? AND fieldvalue = ? ORDER BY AttachmentID ASC LIMIT 1");

?>
<section class="d-flex align-items-center mt-5">
  <div class="container-fluid">
    <div class="px-lg-5">


      <!-- For demo purpose -->
    <div class="row py-2">
      <div class="col-lg-12 mx-auto">
        <div class="p-2 shadow-sm rounded banner">
          <h1 data-aos="fade-up">Explore homes near you</h1>
        </div>
      </div>
    </div>
    <!-- End -->


      <div class="row">
        <!-- Gallery item -->
        <?php
          $bhs->execute();
          foreach($bhs->fetchAll() AS $bh){
            $thumb->execute([ 'BHID', $bh['BHID'] ]);
            $xthumb = $thumb->fetch();
        ?>
            <div class="col-xl-3 col-lg-4 col-md-6 mb-4" data-aos="fade-up" data-aos-delay="200">
              <div class="bg-white rounded shadow-sm">
                <a href="assets/img/BHs/<?= $bh['BHID']; ?>/<?=$xthumb['filename'].".".$xthumb['ext']; ?>" data-lightbox="image-gallery"><img style="height: 300px;" src="assets/img/BHs/<?= $bh['BHID']; ?>/<?=$xthumb['filename'].".".$xthumb['ext']; ?>" alt="" class="img-fluid card-img-top"></a>
                <div class="p-4">
                  <div style="min-height: 50px;">
                    <h5> <a href="#" class="text-dark"><?= $bh['BHName']; ?></a></h5>
                    <p class="small text-muted mb-0"><?= $bh['Description']; ?></p>
                  </div>
                  <div class="text-center rounded-pill bg-light px-3 py-2 mt-4">
                    <button onclick="show_BHDetails(<?= $bh['BHID']; ?>)" type="button" class="btn btn-sm btn-outline-primary2">Show More</button>
                    <button onclick="book_BH('<?= $bh['BHID']; ?>')" type="button" class="btn btn-sm btn-primary2">Book Now</button>
                  </div>
                </div>
              </div>
            </div>
        <?php
          }
        ?>
       
        <!-- End -->
      </div>

    </div>
  </div>
</section>


<form id="frm-BHDetails">
<div id="modal-show-BHDetails" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">BH Info</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
      </div>
      <div class="modal-body" id="BHDetails">

      </div>
      <div class="modal-footer text-center">
          <button type="submit" class="btn btn-primary2">Book Now</button>
          <button type="button" data-bs-dismiss="modal" class="btn btn-secondary">Close</button>
      </div>
    </div>
  </div>
</div>
</form>
<script>
  $("#frm-BHDetails").on("submit", function(e){
    e.preventDefault();

    var $frm = $("#frm-BHDetails");
    var BHID = $frm.find("input[name='BHID']").val();

    book_BH(BHID);

  })
</script>

<form id="frm-book-BH">
<div id="modal-book-BH" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Book</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
      </div>
      <div class="modal-body" id="book-BH">

      </div>
      <div class="modal-footer text-center">
          <button type="submit" class="btn btn-primary">Book</button>
          <button type="button" data-bs-dismiss="modal" class="btn btn-danger">Cancel</button>
      </div>
    </div>
  </div>
</div>
</form>


<script>
  function show_BHDetails(BHID){
    $.post("components/BHDetails.php",{
      BHID: BHID
    }, function(data){
      $("#BHDetails").html(data);
    }).then(function(){
      $("#modal-show-BHDetails").modal("show");      
    })
  }
  function book_BH(BHID){

    if(localStorage.UserID){

      var $frm = $("#frm-book-BH");
      $frm.trigger("reset");

      $("#modal-show-BHDetails").modal("hide");
      $.post("components/BH-Preview.php",{
        BHID: BHID
      }, function(data){
        $("#book-BH").html(data);
      }).then(function(){
        $("#modal-book-BH").modal("show");
      })

    }else{
      toast_alert("warning", "You required to log in before you can book.");
      load_login();
    }


  }
</script>