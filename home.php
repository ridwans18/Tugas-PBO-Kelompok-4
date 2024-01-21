	<!-- Masthead-->
	<header class="masthead">
		<div class="container h-100">
			<div class="row h-100 align-items-center justify-content-center text-center">
				<div class="col-lg-10 align-self-end mb-4">
					<div class="container h-0 col-lg-4 align-self-end mb-4" style="background: #000000B2;">
						<h1 class="text-uppercase text-white font-weight-bold">Home</h1>
						<hr class="divider my-2" />
					</div>
					<div class="card" id="filter-book">
						<div class="card-body">
							<div class="container-fluid">
								<form action="index.php?page=list" id="filter" method="POST">
									<div class="row">
										<div class="col-md-3">
											<label for="">Chech-in Date</label>
											<input type="text" class="form-control datepicker" name="date_in" autocomplete="off">
										</div>
										<div class="col-md-3">
											<label for="">Chech-out Date</label>
											<input type="text" class="form-control datepicker" name="date_out" autocomplete="off">
										</div>
										<div class="col-md-3">
											<br>
											<button class="btn-btn-block btn-primary mt-3">Check Availability</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<section class="page-section"></section>
	<div id="portfolio">
		<div class="container-fluid p-0">
			<div class="row no-gutters">
				<?php 
				include'admin/db_connect.php';
				$qry = $conn->query("SELECT * FROM  room_categories order by rand() ");
				while($row = $qry->fetch_assoc()):
				?>
				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box" href="#">
						<img class="img-fluid" src="assets/img/<?php echo $row['cover_img'] ?>" alt="" />
						<div class="portfolio-box-caption">
							<div class="text-white-30"><?php echo "Rp".number_format($row['price']) ?> / day</div>
							<div class="project-name"><?php echo $row['name'] ?></div>
						</div>
					</a>
				</div>
				<?php endwhile; ?>
			</div>
		</div>
	</div>
