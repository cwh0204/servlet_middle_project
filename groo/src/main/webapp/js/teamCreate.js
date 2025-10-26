// 나이 슬라이더 값 표시
   const ageSlider = document.getElementById("teamMemberage");
   const ageValue = document.getElementById("ageValue");
   ageSlider.addEventListener("input", () => {
      ageValue.textContent = ageSlider.value + "세";
   });

   //애니메이션
   window.addEventListener("load", () => {
           document.querySelectorAll(".underLine, .underLine2").forEach(el => {
             el.classList.add("animate");
           });
           
           setTimeout(() => {
             const h3 = document.querySelector("main h3");
             h3.style.opacity = "1";
             h3.style.transition = "opacity 1s ease";

             setTimeout(() => {
               const categoryContainer = document.querySelector(".category_container");
               categoryContainer.style.opacity = "1";
               categoryContainer.style.transition = "opacity 1s ease";
             }, 340);

           }, 1500); 
      });