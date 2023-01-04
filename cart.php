
<?php

@include 'connect.php';

if(isset($_GET['remove'])){
   $remove_id = $_GET['remove'];
   mysqli_query($conn, "DELETE FROM `cart` WHERE id = '$remove_id'");
   header('location:cart.php');
};

if(isset($_GET['delete_all'])){
   mysqli_query($conn, "DELETE FROM `cart`");
   header('location:cart.php');
}

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
  
  <div class="site-wrap">
    <?php include 'header.php'; ?>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.php">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <form class="col-md-12" method="post">
            <div class="site-blocks-table">
            <table class="table table-bordered">
  <thead>
    <tr>
      <th class="product-thumbnail">Product</th>
      <th class="product-name">Name</th>
      <th class="product-price">Price</th>
      <th class="product-quantity">Quantity</th>
      <th class="product-total">Total Price</th>
      <th class="product-remove">Action</th>
    </tr>
  </thead>
  <tbody>
    <?php 
      $select_cart = mysqli_query($conn, "SELECT * FROM `cart`");
      $grand_total = 0;
      $sub_total = 0;
      if(mysqli_num_rows($select_cart) > 0)
      {
        while($fetch_cart = mysqli_fetch_assoc($select_cart))
        {
      ?>
      <tr>
        <td class="product-thumbnail">
          <img src="images/uploaded_img/<?php echo $fetch_cart['image']; ?>" alt="image" class="img-fluid">
        </td>
        <td class="product-name">
          <h2 class="h5 text-black"><?php echo $fetch_cart['name']; ?></h2>
        </td>
        <td>
          RM 
          <?php echo number_format($fetch_cart['price']); ?>
        </td>
        <td>
          <form action="update.php" method="POST">
            <input type="hidden" name="update_username" value="<?php echo $_SESSION['username']; ?>">
            <input type="hidden" name="update_quantity_id" value="<?php echo $fetch_cart['id']; ?>">
            <input type="number" name="update_quantity" min="1" value="<?php echo $fetch_cart['quantity']; ?>">
            <input type="submit" value="update" name="update_update_btn">
          </form>
        </td>
        <td>
          RM <?php echo $sub_total = number_format($fetch_cart['price'] * $fetch_cart['quantity']); ?>
        </td>
        <td>
          <a href="cart.php?remove=<?php echo $fetch_cart['id']; ?>" onclick="return confirm('remove item from cart?')" class="btn btn-primary btn-sm">X</a>
        </td>
      </tr>
    <?php 
      $sub_total = $fetch_cart['price'] * $fetch_cart['quantity'];
      $grand_total += $sub_total;
        }
    }?>
  </tbody>
</table>

            </div>
         </form>
      </div>

        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
              <div class="col-md-6">
                <a href="products.php" class="btn btn-outline-primary btn-sm btn-block">Continue Shopping</a>
              </div>
            </div>
          </div>
          <div class="col-md-6 pl-5">
            <div class="row justify-content-end">
              <div class="col-md-7">
                <div class="row">
                  <div class="col-md-12 text-right border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">Cart Total</h3>
                  </div>
                </div>
                <div class="row mb-3">
                </div>
                <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black">Grand Total</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">RM <?php echo $grand_total; ?></strong>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-12">
                    <button class="btn btn-primary btn-lg py-3 btn-block" onclick="window.location='checkout.php'">Proceed To Checkout</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>