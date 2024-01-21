<style>
    /* Remove or comment out the logo styles */
    /* .logo-container {
      display: flex;
      align-items: center;
    }
    .logo {
      font-size: 20px;
      background: white;
      padding: 0px 7px;
      border-radius: 50% 50%;
      color: #000000b3;
    } */
</style>

<nav class="navbar navbar-dark bg-dark fixed-top" style="padding:0;">
    <div class="container-fluid mt-3 mb-3">
        <div class="col-lg-12 d-flex">
            <!-- Remove or comment out the logo HTML -->
            <!-- <div class="logo-container">
                <div class="logo">
                    <i class="fa fa-building"></i>
                </div>
            </div> -->
            <div class="text-white">
                <large><b><?php echo $_SESSION['setting_hotel_name']; ?></b></large>
            </div>
            <div class="ml-auto text-white">
                <a href="ajax.php?action=logout" class="text-white"><?php echo $_SESSION['login_name'] ?> <i class="fa fa-power-off"></i></a>
            </div>
        </div>
    </div>
</nav>
