<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jazzcash.aspx.cs" Inherits="Ecommerce.Jazzcash" %>

<%@ Register Src="~/User Control Files/Header.ascx" TagPrefix="uc1" TagName="Header" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Jazzcash Payment | Shopping Online</title>
    <meta name="description" content="We provide Jazzcash integration payment method to our customers for secure transaction." />
    <meta name="keywords" content="checkout, jazzcash, payment, payment gateway, shopping online, ecommerce" />
    <meta name="author" content="Umar Anwar" />
    <meta name="robots" content="noindex, nofollow" />
    <uc1:Header runat="server" ID="Header" />
    <style>
        h3{
            margin-bottom: 30px;
        }
        .jsformWrapper {
            border: 1px solid rgba(196, 21, 28, 0.50);
            padding: 40px 40px 40px 40px;
            margin: 0 auto;
            border-radius: 2px;
            margin-top: 2rem;
            box-shadow: 0 7px 5px #eee;
        }

            .jsformWrapper .formFielWrapper label {
                display: block;
            }

            .jsformWrapper .formFielWrapper input {
                padding: 0.5rem;
                border: 1px solid #ccc;
                display: block;
                font-family: sans-serif;
                width: 100%;
                margin-bottom: 20px;
            }

            .jsformWrapper .formFielWrapper {
                margin-bottom: 1rem;
            }

            .jsformWrapper button {
                background: rgba(196, 21, 28, 1);
                border: none;
                color: #fff;
                line-height: 25px;
                padding: 7px 20px 7px 20px;
                font-size: 16px;
                font-family: sans-serif;
                text-transform: uppercase;
                border-radius: 2px;
                cursor: pointer;
                margin-bottom: -40px;
            }

        h3 {
            text-align: center;
            margin-top: 3rem;
            color: rgba(196, 21, 28, 1);
        }
    </style>
</head>
<body>
    <script>
        function submitForm() {

            var IntegritySalt = document.getElementById("salt").innerText;

            var hash = CryptoJS.HmacSHA256(document.getElementById("hashValuesString").value, IntegritySalt);

            document.getElementsByName("pp_SecureHash")[0].value = hash + '';

            document.jsform.submit();
        }
    </script>
    <script src="https://sandbox.jazzcash.com.pk/Sandbox/Scripts/hmac-sha256.js"></script>
    <div class="container">

        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
            <h3>Payment with Jazzcash</h3>
            <div class="jsformWrapper">
                <form name="jsform" method="post" action="https://sandbox.jazzcash.com.pk/PayaxisCustomerPortal/transactionmanagement/merchantform">
                    <input type="hidden" name="pp_Version" value="1.1" />
                    <input type="hidden" name="pp_TxnType" value="" />
                    <input type="hidden" name="pp_Language" value="EN" />
                    <input type="hidden" name="pp_MerchantID" value="MC1950" />
                    <input type="hidden" name="pp_SubMerchantID" value="" />
                    <input type="hidden" name="pp_Password" value="219cw3thxg" />
                    <input type="hidden" name="pp_BankID" value="" />
                    <input type="hidden" name="pp_ProductID" value="" />
                    <div class="formFielWrapper">
                        <label class="active">Ref Number: </label>
                        <input type="text" name="pp_TxnRefNo" value="<%= RefNumb %>" />
                    </div>

                    <div class="formFielWrapper">
                        <label class="active">Amount: </label>
                        <input type="text" name="pp_Amount" value="<%= Amount + "00" %>" />
                    </div>

                    <input type="hidden" name="pp_TxnCurrency" value="PKR" />
                    <input type="hidden" name="pp_TxnDateTime" value="20180802144035" />
                    <div class="formFielWrapper">
                        <label class="active">Bill Reference: </label>
                        <input type="text" name="pp_BillReference" value="762345781" />
                    </div>

                    <div class="formFielWrapper">
                        <label class="active">Description: </label>
                        <input type="text" name="pp_Description" value="Payment for Items bought." />
                    </div>

                    <input type="hidden" name="pp_TxnExpiryDateTime" value="20180825144035" />

                    <div class="formFielWrapper" style="display: none">
                        <label class="active">Return URL: </label>
                        <input type="text" name="pp_ReturnURL" value="http://localhost:27722/OrderSuccess.aspx" />
                    </div>

                    <input type="hidden" name="pp_SecureHash" value="13a8e4542918921fec7a063da3294b62593aaecee788eec6d2ca4cc63e627b2a" />
                    <input type="hidden" name="ppmpf_1" value="1" />
                    <input type="hidden" name="ppmpf_2" value="2" />
                    <input type="hidden" name="ppmpf_3" value="3" />
                    <input type="hidden" name="ppmpf_4" value="4" />
                    <input type="hidden" name="ppmpf_5" value="5" />
                         <button type="button" onclick="submitForm()" class="center-block">Proceed to payment</button>

                </form>
                <label id="salt" style="display: none;">exwvdf8wty</label>
                <br />
                <br />
                <div class="formFielWrapper" style="display: none">
                    <label class="active">Hash values string: </label>
                    <input type="text" id="hashValuesString" value="" />
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>

    <script>

        var IntegritySalt = document.getElementById("salt").innerText;
        hashString = '';

        hashString += IntegritySalt + '&';

        if (document.getElementsByName("pp_Amount")[0].value != '') {
            hashString += document.getElementsByName("pp_Amount")[0].value + '&';
        }
        if (document.getElementsByName("pp_BankID")[0].value != '') {
            hashString += document.getElementsByName("pp_BankID")[0].value + '&';
        }
        if (document.getElementsByName("pp_BillReference")[0].value != '') {
            hashString += document.getElementsByName("pp_BillReference")[0].value + '&';
        }
        if (document.getElementsByName("pp_Description")[0].value != '') {
            hashString += document.getElementsByName("pp_Description")[0].value + '&';
        }
        if (document.getElementsByName("pp_Language")[0].value != '') {
            hashString += document.getElementsByName("pp_Language")[0].value + '&';
        }
        if (document.getElementsByName("pp_MerchantID")[0].value != '') {
            hashString += document.getElementsByName("pp_MerchantID")[0].value + '&';
        }
        if (document.getElementsByName("pp_Password")[0].value != '') {
            hashString += document.getElementsByName("pp_Password")[0].value + '&';
        }
        if (document.getElementsByName("pp_ProductID")[0].value != '') {
            hashString += document.getElementsByName("pp_ProductID")[0].value + '&';
        }
        if (document.getElementsByName("pp_ReturnURL")[0].value != '') {
            hashString += document.getElementsByName("pp_ReturnURL")[0].value + '&';
        }
        if (document.getElementsByName("pp_SubMerchantID")[0].value != '') {
            hashString += document.getElementsByName("pp_SubMerchantID")[0].value + '&';
        }
        if (document.getElementsByName("pp_TxnCurrency")[0].value != '') {
            hashString += document.getElementsByName("pp_TxnCurrency")[0].value + '&';
        }
        if (document.getElementsByName("pp_TxnDateTime")[0].value != '') {
            hashString += document.getElementsByName("pp_TxnDateTime")[0].value + '&';
        }
        if (document.getElementsByName("pp_TxnExpiryDateTime")[0].value != '') {
            hashString += document.getElementsByName("pp_TxnExpiryDateTime")[0].value + '&';
        }
        if (document.getElementsByName("pp_TxnRefNo")[0].value != '') {
            hashString += document.getElementsByName("pp_TxnRefNo")[0].value + '&';
        }
        if (document.getElementsByName("pp_TxnType")[0].value != '') {
            hashString += document.getElementsByName("pp_TxnType")[0].value + '&';
        }
        if (document.getElementsByName("pp_Version")[0].value != '') {
            hashString += document.getElementsByName("pp_Version")[0].value + '&';
        }
        if (document.getElementsByName("ppmpf_1")[0].value != '') {
            hashString += document.getElementsByName("ppmpf_1")[0].value + '&';
        }
        if (document.getElementsByName("ppmpf_2")[0].value != '') {
            hashString += document.getElementsByName("ppmpf_2")[0].value + '&';
        }
        if (document.getElementsByName("ppmpf_3")[0].value != '') {
            hashString += document.getElementsByName("ppmpf_3")[0].value + '&';
        }
        if (document.getElementsByName("ppmpf_4")[0].value != '') {
            hashString += document.getElementsByName("ppmpf_4")[0].value + '&';
        }
        if (document.getElementsByName("ppmpf_5")[0].value != '') {
            hashString += document.getElementsByName("ppmpf_5")[0].value + '&';
        }

        hashString = hashString.slice(0, -1);

        var hash = CryptoJS.HmacSHA256(hashString, IntegritySalt);

        document.getElementsByName("pp_SecureHash")[0].value = hash + '';

        console.log('string: ' + hashString);
        console.log('hash: ' + document.getElementsByName("pp_SecureHash")[0].value);

        document.getElementById("hashValuesString").value = hashString;

    </script>
</body>
</html>
