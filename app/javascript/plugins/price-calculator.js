function convertMiliseconds(miliseconds, format) {
  var days, hours, minutes, seconds, total_hours, total_minutes, total_seconds;

  total_seconds = parseInt(Math.floor(miliseconds / 1000));
  total_minutes = parseInt(Math.floor(total_seconds / 60));
  total_hours = parseInt(Math.floor(total_minutes / 60));
  days = parseInt(Math.floor(total_hours / 24));

  seconds = parseInt(total_seconds % 60);
  minutes = parseInt(total_minutes % 60);
  hours = parseInt(total_hours % 24);

  switch(format) {
  case 's':
    return total_seconds;
  case 'm':
    return total_minutes;
  case 'h':
    return total_hours;
  case 'd':
    return days;
  default:
    return { d: days, h: hours, m: minutes, s: seconds };
  }
};

export { convertMiliseconds }



window.onload = function() {

        document.querySelector("#endDate").addEventListener("keyup", calcPrice);

        function calcPrice() {
          const oneDay = document.querySelector("#price_calc").value
          let startdate = new Date(document.querySelector("#startDate").value)
          let enddate =  new Date(document.querySelector("#endDate").value)
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
