const slider = document.querySelector(".slider"); // 전체 슬라이드 영역
const outer = document.querySelector(".outer"); // 슬라이드 내부 움직이는 것들이 있는 영역
const buttons = document.querySelectorAll(".slider-bt"); // 우측 하단 순서 표시 버튼
const prevButton = document.querySelector(".slider-bt-prev"); // 이전 버튼
const nextButton = document.querySelector(".slider-bt-next"); // 다음 버튼
const sliderWidth = slider.offsetWidth;

let selectNum = 0; // 현재 선택된 슬라이드
let slideTimer; // 슬라이드 타이머 변수

function prevSlide() {
	/* selectNum이 -1 이 되면 buttons.length - 1 값이 됨
	   예를 들어, buttons.length 값이 3이라면 selectNum이 0 일때
	   (0 - 1 + 3) % 3
	   = 2 % 3
	   = 2
	   가 되므로, 무한 루프가 성립됨.
	*/
	selectNum = (selectNum - 1 + buttons.length) % buttons.length;
	outer.style.transform = "translate(" + (-selectNum * sliderWidth) + "px";
	resetTimer();
	updateButtonColors();
}

function nextSlide() {
	/* selectNum이 buttons.length 값이 되면 0 이 됨
	   예를 들어, buttons.length 값이 3이라면 selectNum이 2 일때
	   (2 + 1) % 3
	   = 3 % 3
	   = 0
	   이 되므로, 무한 루프가 성립됨.
	*/
	selectNum = (selectNum + 1) % buttons.length;
	outer.style.transform = "translate(" + (-selectNum * sliderWidth) + "px";
	resetTimer();
	updateButtonColors();
}

function startTimer() {
	slideTimer = setInterval(nextSlide, 3000); // 3초마다 다음 슬라이드로 이동
}

function stopTimer() {
	clearInterval(slideTimer); // 타이머 초기화
}

function resetTimer() {
	stopTimer(); // 타이머 초기화
	startTimer(); // 다음 타이머 시작
}


slider.addEventListener("mouseenter", stopTimer); // 마우스 올리면 슬라이더 멈춤
slider.addEventListener("mouseleave", resetTimer); // 마우스 치우면 다시 자동 스크롤 시작


prevButton.addEventListener("click", function() { // 이전 버튼 누름
	prevSlide();
	resetTimer();
});

nextButton.addEventListener("click", function() { // 다음 버튼 누름
	nextSlide();
	resetTimer();
});

function updateButtonColors() {
  buttons.forEach((button, index) => {
    if (index === selectNum) {
      button.style.backgroundColor = "rgba(255, 255, 255, 1)"; // 현재 버튼 강조
    } else {
      button.style.backgroundColor = "rgba(0, 0, 0, 0.5)"; // 다른 버튼 원래대로
    }
  });
}

outer.style.width = buttons.length * sliderWidth + "px";

for (let i = 0; i < buttons.length; i++) {
	buttons[i].addEventListener("click", function() {
		selectNum = i;
		outer.style.transform = "translate(" + (-selectNum * sliderWidth) + "px";
		resetTimer(); // 사용자가 수동으로 슬라이드 이동 시 타이머 초기화
		updateButtonColors();
	});
}

updateButtonColors();

startTimer(); // 사이트 접속시 슬라이드 쇼 시작