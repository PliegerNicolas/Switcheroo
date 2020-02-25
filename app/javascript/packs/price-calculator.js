window.onload = function() {
        document.querySelector("#startDate").addEventListener("keyup", calcPrice);
        document.querySelector("#startDate").addEventListener("keyup", calcPrice);

        function calcPrice() {
          var oneDay = 24 * 60 * 60 * 1000;
          var startDate = document.getElementById("startDate").value;
          var endDate = document.getElementById("endDate").value;
          var date1 = startDate.substring(0, 11);
          var date2 = endDate.substring(0, 11);
          date1 = date1.replace(/\//g, ",");
          date2 = date2.replace(/\//g, ",");

          startDate = new Date(date1);
          endDate = new Date(date2);

          var diffDays = Math.round(Math.abs((startDate.getTime() - endDate.getTime()) / (oneDay)));
          //calculate rental price
          var price;
          var dayRate;


          document.getElementById("rentalInfo").innerHTML = diffDays + ' Day Rental, At: ' + dayRate + ' Per Day. <span style="color:red; font-weight:bold"> Total Price: ' + price + '</span>';
        }



      calcPrice()
      }
