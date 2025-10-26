// 나이 슬라이더 값 표시
   const ageSlider = document.getElementById("teamMemberage");
   const ageValue = document.getElementById("ageValue");
   ageSlider.addEventListener("input", () => {
      ageValue.textContent = ageSlider.value + "세";
   });
   
   