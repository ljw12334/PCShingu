const topMenu = document.getElementById("menu-top");
const originBar = document.getElementById("origin-bar");
const stickyBar = document.getElementById("sticky-bar");

let topMenuTop = topMenu.offsetTop;

window.addEventListener("scroll", function() {
	let scrollPosition = window.scrollY;
	
	if (scrollPosition >= topMenuTop) {
		topMenu.style.boxShadow = "0px 0px 10px 5px rgba(0, 0, 0, 0.2)"
		originBar.style.display = "none";
		stickyBar.style.display = "flex";
		topMenu.style.height = "58px";
	} else {
		topMenu.style.boxShadow = "none";
		originBar.style.display = "block";
		stickyBar.style.display = "none";
		topMenu.style.height = "48px";
	}
});

function moveToTop() {
	window.scrollTo({top: 0, left: 0, behavior: "smooth"});
}