function pay(phoneNo,Amount) {
alert(`About to bill  ${phoneNo} , KSH ${Amount}`);
    var url = "https://tinypesa.com/api/v1/express/initialize";

    fetch(url, {
        body: `amount=${Amount}&msisdn=${phoneNo}&account_no=1237663725`,
        headers: {
            Apikey: "hqsWRTiWsdk",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        method: "POST",
    });

}