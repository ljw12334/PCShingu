const outer = document.querySelector(".outer");
const buttons = document.querySelectorAll(".slider_bt");
const prevButton = document.querySelector(".slider_bt_prev");
const nextButton = document.querySelector(".slider_bt_next");

let selectNum = 0;
let slideTimer; // 슬라이드 타이머 변수

function prevSlide() {
	selectNum = (selectNum - 1 + buttons.length) % buttons.length;
	outer.style.transform = "translate(" + (-selectNum * 1200) + "px";
	updateButtonColors();
}

function nextSlide() {
	selectNum = (selectNum + 1) % buttons.length;
	outer.style.transform = "translate(" + (-selectNum * 1200) + "px";
	updateButtonColors();
}

function startSlideShow() {
	slideTimer = setInterval(nextSlide, 3000); // 3초마다 다음 슬라이드로 이동
}

function resetTimer() {
	clearInterval(slideTimer); // 타이머 초기화
	startSlideShow(); // 다음 타이머 시작
}

outer.style.width = buttons.length * 1200 + "px";

prevButton.addEventListener("click", function() {
	prevSlide();
	resetTimer();
});

nextButton.addEventListener("click", function() {
	nextSlide();
	resetTimer();
});

function updateButtonColors() {
  buttons.forEach((button, index) => {
    if (index === selectNum) {
      button.style.backgroundColor = "rgba(255, 255, 255, 1)"; // 현재 슬라이드 버튼 강조
    } else {
      button.style.backgroundColor = "rgba(0, 0, 0, 0.5)"; // 다른 슬라이드 버튼 일반 스타일
    }
  });
}

for (let i = 0; i < buttons.length; i++) {
	buttons[i].addEventListener("click", function() {
		selectNum = i;
		outer.style.transform = "translate(" + (-selectNum * 1200) + "px";
		resetTimer(); // 사용자가 수동으로 슬라이드 변경시 타이머 초기화
		updateButtonColors();
	});
}

updateButtonColors();

startSlideShow(); // 초기 슬라이드 쇼 시작