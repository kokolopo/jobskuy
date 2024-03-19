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

<div class="col-md-9">
	<div class="row">
		<div class="col-md-12">
			<h3>Favorite Layanan</h3>

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
				produk.kategori_produk_id ORDER BY avg_rating DESC limit 3");
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
	<div class="row">
		<div class="col-md-12">
			<hr>
			<h3>Menu Terbaru</h3>
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
			produk.kategori_produk_id ORDER BY avg_rating ASC limit 3");
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

<?php include "layout/footer.php"; ?>