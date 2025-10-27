$(document).ready(function(){
$('.input-daterange').datepicker({
    format: 'dd-mm-yyyy',
    autoclose: true
});

});

// 나이 슬라이더 값 표시
   const ageSlider = document.getElementById("teamMemberage");
   const ageValue = document.getElementById("ageValue");
   ageSlider.addEventListener("input", () => {
      ageValue.textContent = ageSlider.value + "세";
   });

