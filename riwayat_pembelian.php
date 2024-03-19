<?php
include "inc/config.php";

if (!empty($_GET)) {
    if ($_GET['act'] == 'delete') {

        $q = mysql_query("delete from pesanan WHERE id='$_GET[id]'");
        if ($q) {
            alert("Success");
            redir("pembayaran.php");
        }
    }
}

if (empty($_SESSION['iam_user'])) {
    redir("index.php");
}
$user = mysql_fetch_object(mysql_query("SELECT*FROM user where id='$_SESSION[iam_user]'"));

include "layout/header.php";

// $q = mysql_query("select * from pesanan where user_id='$_SESSION[iam_user]' And status='belum lunas'");
$q = mysql_query("SELECT 
detail_pesanan.id,
detail_pesanan.produk_id,
detail_pesanan.qty,
detail_pesanan.pesanan_id,
pesanan.tanggal_pesan,
pesanan.user_id,
pesanan.status,
pesanan.read,
produk.nama,
produk.harga,
produk.gambar
FROM detail_pesanan
JOIN pesanan ON detail_pesanan.pesanan_id = pesanan.id
JOIN produk ON detail_pesanan.produk_id = produk.id
WHERE pesanan.user_id = '$_SESSION[iam_user]'");
$j = mysql_num_rows($q);
?>

<style>
    .rating {
        display: flex;
        flex-direction: row-reverse;
        font-size: 24px;
    }

    .rating input {
        display: none;
    }

    .rating label {
        cursor: pointer;
        width: 40px;
        height: 40px;
        background-color: #ddd;
        border-radius: 50%;
        margin: 0 4px;
        line-height: 40px;
        text-align: center;
    }

    .rating input:checked~label,
    .rating label:hover,
    .rating label:hover~label {
        background-color: #f8d64e;
    }
</style>

<div class="col-md-9 content-menu">
    <div class="col-md-12">
        <?php
        if (!empty($_GET)) {
            $q1 = mysql_query("SELECT 
            detail_pesanan.id,
            detail_pesanan.produk_id,
            detail_pesanan.qty,
            detail_pesanan.pesanan_id,
            pesanan.tanggal_pesan,
            pesanan.user_id,
            pesanan.status,
            pesanan.read,
            produk.nama,
            produk.harga,
            produk.gambar
            FROM detail_pesanan
            JOIN pesanan ON detail_pesanan.pesanan_id = pesanan.id
            JOIN produk ON detail_pesanan.produk_id = produk.id
            WHERE detail_pesanan.id = '$_GET[id]'");

            $total = 0;
            $dataPesanan = mysql_fetch_object(mysql_query("Select * from pesanan where id='$_GET[id]'"));
            while ($data = mysql_fetch_object($q1)) { ?>
                <?php
                $katpro = mysql_query("select*from produk where id='$data->produk_id'");
                $p = mysql_fetch_object($katpro);
                ?>
                <?php $t = $data->qty * $p->harga;
                $total += $t;

                $produkID = $data->produk_id;
                $nama = $data->nama;
                $gambar = $data->gambar;
                $harga = $data->harga;
                ?>
            <?php } ?>
            <?php
            if ($_GET['act'] == 'review' && $_GET['id']) {
                if (!empty($_POST)) {
                    $gambar = md5('Y-m-d H:i:s') . $_FILES['gambar']['name'];
                    extract($_POST);
                    $q = mysql_query("insert into review Values(NULL,'$produk_id','$_SESSION[iam_user]','$rating','$review',NOW())");
                    if ($q) {
                        alert("Success");
                        redir("riwayat_pembelian.php");
                    }
                }

                // extract($_GET);
                // $pesanan = mysql_fetch_object(mysql_query("Select*from pesanan where id='$id'"));
                // $qPembayaran = mysql_query("Select * from pembayaran where id_pesanan='$id' and status='verified'") or die(mysql_error());
                // $totalPembayaran = 0;
                // while ($d = mysql_fetch_object($qPembayaran)) {
                //     $totalPembayaran += $d->total;
                // }
            ?>
                <div class="row col-md-6">
                    <h3><b>Review Saya</b></h3>

                    <div>
                        <img src="<?php echo $url; ?>uploads/<?php echo $gambar ?>" width="100%">
                        <h4><?php echo $nama ?></h4>
                        <h4>Rp. <?php echo number_format($harga, 2, ',', '.') ?></h4>
                    </div>

                    <form action="" method="post" enctype="multipart/form-data">
                        <input type="hidden" type="text" name="produk_id" value="<?php echo $produkID ?>">
                        <label>Rating</label><br>
                        <div class="rating">
                            <input type="radio" id="star5" name="rating" value="5"><label for="star5">&#9733;</label>
                            <input type="radio" id="star4" name="rating" value="4"><label for="star4">&#9733;</label>
                            <input type="radio" id="star3" name="rating" value="3"><label for="star3">&#9733;</label>
                            <input type="radio" id="star2" name="rating" value="2"><label for="star2">&#9733;</label>
                            <input type="radio" id="star1" name="rating" value="1"><label for="star1">&#9733;</label>
                        </div>

                        <label>Review</label><br>
                        <textarea class="form-control" name="review"></textarea><br />
                        <input type="submit" name="form-input" value="Kirim" class="btn btn-success">
                    </form>
                </div>
                <div class="row col-md-12">
                    <hr>
                </div>
        <?php
            }
        }
        ?>
    </div>


    <h3>Riwayat Pembelian </h3>
    <hr>
    <table class="table table-striped table-hove">
        <thead>
            <tr>
                <th>#</th>
                <th>Nama Pemesan</th>
                <th>Tanggal Pesan</th>
                <th>Qty</th>
                <th>Subtotal</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($data = mysql_fetch_object($q)) { ?>
                <tr <?php if ($data->read == 0) {
                        echo 'style="background:#cce9f8 !important;"';
                    } ?>>
                    <th scope="row"><?php echo $no++; ?></th>
                    <?php
                    $katpro = mysql_query("select*from user where id='$data->user_id'");
                    $user = mysql_fetch_array($katpro);
                    ?>
                    <td><?php echo $data->nama ?></td>
                    <td><?php echo substr($data->tanggal_pesan, 0, 10) ?></td>
                    <td><?php echo $data->qty ?></td>
                    <td><?php echo number_format($data->harga * $data->qty, 2, ',', '.') ?></td>
                    <td>
                        <a class="btn btn-sm btn-primary" href="riwayat_pembelian.php?act=review&id=<?php echo $data->id; ?>">Review</a>
                    </td>
                </tr>
            <?php } ?>
        </tbody>
    </table>

</div>
<?php include "layout/footer.php"; ?>