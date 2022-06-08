window.buttonClick = function () {
  let rankButton = document.getElementsByName("btn");
  let totalRank = document.getElementById("total_rank");
  let dayRank = document.getElementById("day_rank");
  let monthRank = document.getElementById("month_rank");
  if (rankButton[0].checked) {
    totalRank.style.display = "";
    dayRank.style.display = "none";
    monthRank.style.display = "none";
  } else if (rankButton[1].checked) {
    totalRank.style.display = "none";
    dayRank.style.display = "";
    monthRank.style.display = "none";
  } else {
    totalRank.style.display = "none";
    dayRank.style.display = "none";
    monthRank.style.display = "";
  }
};

