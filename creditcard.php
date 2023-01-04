<?php include "header.php";?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Credit Card Payment Gateway</title>
</head>
<script>
function validateForm() {
  var form = document.querySelector('form');

  var cardNumberInput = form.querySelector('input[name="cardNumber"]');
  var expirationInput = form.querySelector('input[name="expiration"]');
  var cvCodeInput = form.querySelector('input[name="cvCode"]');
  var cardOwnerInput = form.querySelector('input[name="cardOwner"]');

  // Validate the card number
  if (!cardNumberInput.value.match(/^\d{16}$/)) {
    alert('Please enter a valid card number');
    return false;
  }

  // Validate the expiration date
  if (!expirationInput.value.match(/^\d\d\/\d\d$/)) {
    alert('Please enter a valid expiration date (MM/YY)');
    return false;
  }

  // Validate the CV code
  if (!cvCodeInput.value.match(/^\d{3,4}$/)) {
    alert('Please enter a valid CV code');
    return false;
  }

  // Validate the card owner
  if (!cardOwnerInput.value.trim()) {
    alert('Please enter the card owner\'s name');
    return false;
  }
  window.location.href = "thankyou.php";
  return true;
}

</script>
<body>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-6">
            <div class="row">
                <h3 class="text-center">Payment Details</h3>
                <div class="inlineimage"> <img class="img-responsive images" src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/Mastercard-Curved.png"> <img class="img-responsive images" src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/Discover-Curved.png"> <img class="img-responsive images" src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/Paypal-Curved.png"> <img class="img-responsive images" src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/American-Express-Curved.png"> </div>
            </div>
            <form role="form" mthod="post" action="thankyou.php" onsubmit="return validateForm()">
                <div class="col-xs-12">
                    <div class="form-group"> <label>CARD NUMBER</label>
                    <input type="tel" name="cardNumber" class="form-control" placeholder="Valid Card Number" pattern="\d{16}" required> <span class="input-group-addon"><span class="fa fa-credit-card"></span></span> 
                </div>
                <div class="col-xs-12">
                    <div class="form-group"> <label><span class="hidden-xs">EXPIRATION</span><span class="visible-xs-inline">EXP</span> DATE</label> <input type="tel" name="expiration" class="form-control" placeholder="MM / YY" pattern="\d\d/\d\d" required> 
                </div>
                <div class="col-xs-12">
                    <div class="form-group"> <label>CV CODE</label> <input type="tel" name="cvCode"class="form-control" placeholder="CVC" pattern="\d{3,4}" required> 
                </div>
                <div class="col-xs-12">
                    <div class="form-group"> <label>CARD OWNER</label> <input type="text" name="cardOwner" class="form-control" placeholder="Card Owner Name" required> 
                </div>
                <div class="col-xs-12"> 
                    <button class="btn btn-success btn-lg btn-block"> Confirm Payment </button> 
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>