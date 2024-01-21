<style>
	.custom-menu {
		z-index: 1000;
		position: absolute;
		background-color: #ffffff;
		border: 1px solid #0000001c;
		border-radius: 5px;
		padding: 8px;
		min-width: 13vw;
	}
	a.custom-menu-list {
		width: 100%;
		display: flex;
		color: #4c4b4b;
		font-weight: 600;
		font-size: 1em;
		padding: 1px 11px;
	}
		span.card-icon {
		position: absolute;
		font-size: 3em;
		bottom: .2em;
		color: #ffffff80;
	}
	.file-item{
		cursor: pointer;
	}
	a.custom-menu-list:hover,.file-item:hover,.file-item.active {
		background: #80808024;
	}
	table th,td{
		border-left:1px solid gray;
	}
	a.custom-menu-list span.icon{
		width:1em;
		margin-right: 5px
	}
	.candidate {
		margin: auto;
		width: 23vw;
		padding: 0 10px;
		border-radius: 20px;
		margin-bottom: 1em;
		display: flex;
		border: 3px solid #00000008;
		background: #8080801a;

	}
	.candidate_name {
		margin: 8px;
		margin-left: 3.4em;
		margin-right: 3em;
		width: 100%;
	}
	.img-field {
		display: flex;
		height: 8vh;
		width: 4.3vw;
		padding: .3em;
		background: #80808047;
		border-radius: 50%;
		position: absolute;
		left: -.7em;
		top: -.7em;
	}
	.candidate img {
		height: 100%;
		width: 100%;
		margin: auto;
		border-radius: 50%;
	}
	.vote-field {
		position: absolute;
		right: 0;
		bottom: -.4em;
	}
</style>

<div class="containe-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card col-md-4 offset-2 bg-info float-left">
				<div class="card-body text-white">
					<h4 class="text-center"><b>Booking</b></h4>
					<hr>
				</div>
			</div>
			<div class="card col-md-4 offset-2 bg-primary ml-4 float-left">
				<div class="card-body text-white">
					<h4 class="text-center"><b>Rooms</b></h4>
					<hr>
				</div>
			</div>
		</div>
	</div>
</div>

<?php include('db_connect.php');?>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="row">
			<!-- FORM Panel -->
			<div class="col-md-4">
				<div action="" id="manage-room">
					<input type="hidden" name="id">
					<div class="form-group">
						<div name="category_id">
							<?php 
							$cat = $conn->query("SELECT * FROM room_categories order by name asc ");
							while($row= $cat->fetch_assoc()) {
								$cat_name[$row['id']] = $row['name'];
								?>

							<?php
							}
							?>
						</div>
					</div>
				</div>
			</div>
			<!-- Table Panel -->
			<div class="col-md-12">
				<div class="card">
					<div class="col-md-12">
						<div class="card-body">
							<table class="table table-bordered table-hover">
								<thead>
									<tr class="text-center">
										<th>#</th>
										<th>Category</th>
										<th>Room</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<?php 
									$i = 1;
									$rooms = $conn->query("SELECT * FROM rooms order by id asc");
									while($row=$rooms->fetch_assoc()):
									?>
									<tr>
										<td class="text-center"><?php echo $i++ ?></td>
										<td class="text-left"><?php echo $cat_name[$row['category_id']] ?></td>
										<td class="text-left"><?php echo $row['room'] ?></td>
										<?php if($row['status'] == 0): ?>
											<td class="text-center"><span class="badge badge-success">Available</span></td>
										<?php else: ?>
											<td class="text-center"><span class="badge badge-default">Unavailable</span></td>
										<?php endif; ?>
									</tr>
									<?php endwhile; ?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>
