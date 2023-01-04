<?php

@include 'connect.php';

if(isset($_POST['order_btn'])){

   $name = $_POST['name'];
   $phone = $_POST['phone'];
   $email = $_POST['email'];
   $method = $_POST['method'];
   $address = $_POST['address'];

   $cart_query = mysqli_query($conn, "SELECT * FROM `cart`");
   $price_total = 0;
   if(mysqli_num_rows($cart_query) > 0){
      while($product_item = mysqli_fetch_assoc($cart_query)){
         $product_name[] = $product_item['name'] .' ('. $product_item['quantity'] .') ';
         $product_price = number_format($product_item['price'] * $product_item['quantity']);
         $product_price = $product_item['price'] * $product_item['quantity'];
         $price_total += $product_price;
      };
   };

   $total_product = implode(', ',$product_name);
   $detail_query = mysqli_query($conn, "INSERT INTO `order`(name, phone, email, method, address, total_products, total_price) VALUES('$name','$phone','$email','$method','$address','$total_product','$price_total')") or die('query failed');

   if($cart_query && $detail_query==true){
      if($method == "credit card"){
        header('location:creditcard.php');
      }else{
        header('location:thankyou.php');
      }
   }
}?>
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
          <div class="col-md-12 mb-0"><a href="index.php">Home</a> <span class="mx-2 mb-0">/</span> <a href="cart.php">Cart</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Checkout</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-12">
            <div class="border p-4 rounded" role="alert">
              Returning customer? <a href="login.php">Click here</a> to login
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-5 mb-md-0">
            <h2 class="h3 mb-3 text-black">Shipping Details</h2>
            <form action="" method="post">
              <div class="p-3 p-lg-5 border">
                  <div class="form-group row">
                    <div class="col-md-12">
                      <label for="name" class="text-black">Name <span class="text-danger">*</span></label>
                      <input type="text" class="form-control" id="name" name="name" readonly>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-md-12">
                      <label for="address" class="text-black">Address <span class="text-danger">*</span></label>
                      <input type="text" class="form-control" id="address" name="address" readonly>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-md-12">
                      <label for="payment" class="text-black">Payment Method<span class="text-danger">*</span></label>
                            <select class="custom-select" name="method" required>
                              <option value="cash on delivery" selected>Cash on delivery</option>
                              <option value="credit card">Credit card</option>
                            </select>
                    </div>
                  </div>

                  <div class="form-group row mb-5">
                    <div class="col-md-6">
                      <label for="email" class="text-black">Email Address <span class="text-danger">*</span></label>
                      <input type="text" class="form-control" id="email" name="email" readonly>
                    </div>
                    <div class="col-md-6">
                      <label for="phone" class="text-black">Phone <span class="text-danger">*</span></label>
                      <input type="text" class="form-control" id="phone" name="phone" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <button name="order_btn" class="btn btn-primary btn-lg py-3 btn-block" ">Place Order</button>
                  </div>
              </div>
            </form>
          </div>
          <div class="col-md-6">
            
            <div class="row mb-5">
              <div class="col-md-12">
                <h2 class="h3 mb-3 text-black">Your Order</h2>
                <div class="p-3 p-lg-5 border">
                  <table class="table site-block-order-table mb-5">
                    <thead>
                      <th>Product</th>
                      <th>Total</th>
                    </thead>
                    <tbody>
                        <?php
                          $select_cart = mysqli_query($conn, "SELECT * FROM `cart`");
                          $total = 0;
                          $grand_total = 0;
                          if(mysqli_num_rows($select_cart) > 0){
                            while($fetch_cart = mysqli_fetch_assoc($select_cart))
                            {
                              $total_price = number_format($fetch_cart['price'] * $fetch_cart['quantity']);
                              $total_price = $fetch_cart['price']*$fetch_cart['quantity'];
                              $grand_total = $total += $total_price;
                              ?>
                              <tr>
                                <td><?= $fetch_cart['name']; ?><strong class="mx-2">x</strong><?= $fetch_cart['quantity']; ?></td>
                                <td>RM <?=$total_price;?></td>
                              </tr>
                              <?php
                            }
                          }
                        ?>
                      <tr><td><br></td></tr>
                      <tr>
                        <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
                        <td class="text-black">RM <?=$grand_total;?></td>
                      </tr>
                      <tr>
                        <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                        <td class="text-black font-weight-bold"><strong>RM <?=$grand_total;?></strong></td>
                      </tr>
                    </tbody>
                  </table>

                </div>
              </div>
            </div>

          </div>
        </div>
        <!-- </form> -->
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