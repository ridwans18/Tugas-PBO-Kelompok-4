<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		<title>Admin</title>
			

		<?php include('./header.php'); ?>
		<?php include('./db_connect.php'); ?>
		<?php
		session_start();

		// Periksa apakah pengguna sudah login
		if(isset($_SESSION['login_id'])) {
			// Jika sudah login, arahkan ke halaman beranda atau halaman lain yang sesuai
			header("location:index.php?page=home");
			exit(); // Pastikan untuk menghentikan eksekusi script setelah mengarahkan pengguna
		}

		// Jika belum login, lakukan hal-hal lain yang perlu dilakukan pada halaman login
		$query = $conn->query("SELECT * FROM system_settings limit 1")->fetch_array();
		foreach ($query as $key => $value) {
			if(!is_numeric($key))
				$_SESSION['setting_'.$key] = $value;
		}
		?>
	</head>
		<style>
			body{
				width: 100%;
				height: calc(100%);
			}
			main#main{
				width:100%;
				height: calc(100%);
				background:white;
			}
			#login-right{
				position: absolute;
				right:0;
				width:40%;
				height: calc(100%);
				background:gray;
				display: flex;
				align-items: center;
			}
			#login-left{
				position: absolute;
				left:0;
				width:60%;
				height: calc(100%);
				background:#00000061;
				display: flex;
				align-items: center;
			}
			#login-right .card{
				margin: auto
			}
			.logo {
				margin: auto;
				font-size: 8rem;
				background: white;
				padding: .5em 0.8em;
				border-radius: 50% 50%;
				color: #000000b3;
			}
			#login-left {
			background: url(../assets/img/hotel_cover1.jpg);
			background-repeat: no-repeat;
			background-size: cover;
			}
		</style>
	</head>

	<body>
		<main id="main" class=" alert-info">
			<div id="login-left">
				<!-- == You can logo or image herre == -->
				<!-- <div class="logo">
					<i class="fa fa-poll-h"></i>
				</div> -->
			</div>
			<div id="login-right">
				<div class="card col-md-8">
					<div class="card-body">
						<div class="card-header"><h4 class="text-center font-weight-light my-1"><b>Admin Management</b></h4></div>
						<form id="login-form" >
							<div class="form-group">
								<label for="username" class="control-label">Username</label>
								<input type="text" id="username" name="username" class="form-control">
							</div>
							<div class="form-group">
								<label for="password" class="control-label">Password</label>
								<input type="password" id="password" name="password" class="form-control">
							</div>
							<div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
								<button class="btn btn-primary" name="login_id">Login</button>
								<button class="btn btn-primary" onclick="loginAsUser()">Login as User</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</main>
		<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
	</body>

	<script>
		function loginAsUser() {
        window.location.href = '../login.php';
    }
		$('#login-form').submit(function(e){
			e.preventDefault()
			$('#login-form button[type="button"]').attr('disabled',true).html('Logging in...');
			if($(this).find('.alert-danger').length > 0 )
				$(this).find('.alert-danger').remove();
			$.ajax({
				url:'ajax.php?action=login',
				method:'POST',
				data:$(this).serialize(),
				error:err=>{
					console.log(err)
			$('#login-form button[type="button"]').removeAttr('disabled').html('Login');

				},
				success:function(resp){
					if(resp == 1){
						location.href ='index.php?page=home';
					}else if(resp == 2){
						location.href ='voting.php';
					}else{
						$('#login-form').prepend('<div class="alert alert-danger">Username or password is incorrect.</div>')
						$('#login-form button[type="button"]').removeAttr('disabled').html('Login');
					}
				}
			})
		})
	</script>
</html>