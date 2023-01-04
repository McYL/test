<?php

@include 'connect.php';

if(isset($_POST['add_to_cart'])){

   $product_name = $_POST['product_name'];
   $product_price = $_POST['product_price'];
   $product_image = $_POST['product_image'];
   $product_quantity = 1;

   $select_cart = mysqli_query($conn, "SELECT * FROM `cart` WHERE name = '$product_name'");

   if(mysqli_num_rows($select_cart) > 0){
      $message[] = 'product already added to cart';
   }else{
      $insert_product = mysqli_query($conn, "INSERT INTO `cart`(name, price, image, quantity) VALUES('$product_name', '$product_price', '$product_image', '$product_quantity')");
      $message[] = 'product added to cart succesfully';
   }

}

?>
   <!DOCTYPE html>
   <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Products</title>

        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://kit.fontawesome.com/9cc734a2d8.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <?php

if(isset($message)){
   foreach($message as $message){
      echo '<div class="message"><span>'.$message.'</span> <i class="fas fa-times" onclick="this.parentElement.style.display = `none`;"></i> </div>';
   };
};

?>

            <?php include 'header.php'; ?>

            <div class="container">
                <section class="products">
                    <div class="container">
                        <div class="row">
                              <?php 
                              $select_products = mysqli_query($conn, "SELECT * FROM `products`");
                              if(mysqli_num_rows($select_products) > 0){
                                 while($fetch_product = mysqli_fetch_assoc($select_products)){
                              ?>
                              <div class="col-3">
                                 <form action="" method="post">
                                    <div class="card-body">
                                          <img class="card-img-top" src="images/uploaded_img/<?php echo $fetch_product['image']; ?>" class="img-thumbnail" alt="<?php echo $fetch_product['name']; ?>" width="300" height="300">
                                          <div class="card-body">
                                             <?php echo $fetch_product['name']; ?>
                                             <div>RM <?php echo $fetch_product['price']; ?></div>
                                             <input type="hidden" name="product_name" value="<?php echo $fetch_product['name']; ?>">
                                             <input type="hidden" name="product_price" value="<?php echo $fetch_product['price']; ?>">
                                             <input type="hidden" name="product_image" value="<?php echo $fetch_product['image']; ?>">
                                             <input type="submit" class="btn btn-outline-primary" value="add to cart" name="add_to_cart">
                                          </div>
                                    </div>
                                 </form></div>
                                 <?php
                                    };
                                 };?>
                        </div>

                    </div>

                </section>

            </div>
    </body>
   </html>