<?php
include "inc/config.php";
include "layout/header.php";


?>

<style>
	.reviews-box {
		background-color: white;
		padding: 10px;
	}

	.review {
		border: 1px gray solid;
		padding: 5px;
		margin-top: 5px;
	}

	.star-icon {
		margin-left: 5px;
		color: orangered;
	}

	.star-icon::before {
		content: '\2605';
		/* kode karakter bintang penuh Unicode */
		font-size: 20px;
		/* sesuaikan ukuran ikon sesuai kebutuhan */
		display: inline-block;
		/* vertical-align: middle; */
	}
</style>
<?php if (!empty($_GET['id'])) { ?>
	<?php
	extract($_GET);
	$k = mysql_query("SELECT * FROM produk where id='$id'");
	$data = mysql_fetch_array($k);
	?>


	<div class="col-md-9">
		<div class="row">
			<div class="col-md-12">
				<h3>Detail : <?php echo $data['nama'] ?></h3>
				<br />
				<div class="col-md-12 content-menu" style="margin-top:-20px;margin-bottom: 10px;">
					<?php $kat = mysql_fetch_array(mysql_query("SELECT * FROM kategori_produk where id='$data[kategori_produk_id]'"));  ?>
					<small>Kategori :<a href="<?php echo $url; ?>menu.php?kategori=<?php echo $kat['id'] ?>"><?php echo $kat['nama'] ?></a></small>
					<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>">

						<img src="<?php echo $url; ?>uploads/<?php echo $data['gambar'] ?>" width="80%">
					</a>
					<br><br>
					<p><?php echo $data['deskripsi'] ?></p>
					<p style="font-size:18px">Harga :<?php echo number_format($data['harga'], 2, ',', '.') ?></p>
					<p>
						<a href="<?php echo $url; ?>keranjang.php?act=beli&&produk_id=<?php echo $data['id'] ?>" class="btn btn-info" href="#" role="button">Pesan</a>
					</p>
				</div>


				<div>
					<h3>Review</h3>

					<div class="reviews-box">
						<?php
						$k = mysql_query("SELECT 
						review.id, 
						review.rating, 
						review.review,
						review.created_at,
						user.nama
						FROM review 
						JOIN user ON review.user_id = user.id
						WHERE produk_id = '$data[id]' ORDER BY id DESC");
						while ($data = mysql_fetch_array($k)) {
						?>
							<div class="review">
								<span class="user-name"><?php echo $data['nama'] ?></span>
								<span class="star-icon"></span><?php echo $data['rating'] ?>

								<p><?php echo $data['review'] ?></p>
								<p style="font-size: 12px;"><?php echo $data['created_at'] ?></p>
							</div>
						<?php } ?>
					</div>
				</div>
			</div>
		</div>
	</div>

<?php } elseif (!empty($_GET['kategori'])) { ?>

	<?php
	extract($_GET);
	$kat = mysql_fetch_array(mysql_query("SELECT * FROM kategori_produk where id='$kategori'"));
	?>
	<div class="col-md-9">
		<div class="row">
			<div class="col-md-12">
				<hr>
				<h3>Kategori : <?php echo $kat['nama'] ?></h3>
				<?php
				$k = mysql_query("SELECT * FROM produk where kategori_produk_id='$kategori'");
				while ($data = mysql_fetch_array($k)) {
				?>
					<div class="col-md-4 content-menu">
						<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>">
							<img src="<?php echo $url; ?>uploads/<?php echo $data['gambar'] ?>" width="100%">
							<h4><?php echo $data['nama'] ?></h4>
						</a>
						<p style="font-size:18px">Harga :<?php echo number_format($data['harga'], 2, ',', '.') ?></p>
						<p>
							<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>" class="btn btn-success btn-sm" href="#" role="button">Lihat Detail</a>
							<a href="<?php echo $url; ?>keranjang.php?act=beli&&produk_id=<?php echo $data['id'] ?>" class="btn btn-info btn-sm" href="#" role="button">Pesan</a>
						</p>
					</div>
				<?php } ?>

			</div>
		</div>
	</div>

<?php } else { ?>

	<div class="col-md-9">
		<div class="row">
			<div class="col-md-12">
				<hr>
				<h3>Daftar Semua Layanan</h3>
				<?php
				$k = mysql_query("SELECT 
				produk.id,
				produk.nama,
				produk.deskripsi,
				produk.gambar,
				produk.harga,
				produk.kategori_produk_id,
				COALESCE(AVG(review.rating),0) AS avg_rating
				FROM produk 
				left JOIN
					review ON produk.id =  review.produk_id
				GROUP BY
					produk.id,
				produk.nama,
				produk.deskripsi,
				produk.gambar,
				produk.harga,
				produk.kategori_produk_id");
				while ($data = mysql_fetch_array($k)) {
				?>
					<div class="col-md-4 content-menu">
						<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>">
							<img src="<?php echo $url; ?>uploads/<?php echo $data['gambar'] ?>" width="100%">
							<span>rating: <span class="star-icon"></span> <?php echo number_format($data['avg_rating'], 1) ?></span>
							<h4><?php echo $data['nama'] ?></h4>
						</a>
						<p style="font-size:18px">Harga :<?php echo number_format($data['harga'], 2, ',', '.') ?></p>
						<p>
							<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>" class="btn btn-success btn-sm" href="#" role="button">Lihat Detail</a>
							<a href="<?php echo $url; ?>keranjang.php?act=beli&&produk_id=<?php echo $data['id'] ?>" class="btn btn-info btn-sm" href="#" role="button">Pesan</a>
						</p>
					</div>
				<?php } ?>

			</div>
		</div>
	</div>

<?php } ?>
<?php include "layout/footer.php"; ?>