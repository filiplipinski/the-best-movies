//navigation in header section script. it add white line and add a bit of transparency
//after scroll
const nav = document.querySelector("header nav");

window.addEventListener("scroll", function() {
  if (window.scrollY >= 65) {
    nav.style.transition = ".6s";
    nav.style.backgroundColor = "rgba(20, 20, 20, 0.6)";
    nav.style.boxShadow = "0 3px 4px -2px rgba(255,255,255, 0.8)";
  }
  if (window.scrollY < 65) {
    nav.style.transition = "none";
    nav.style.backgroundColor = "#141414";
    nav.style.boxShadow = "none";
  }
});

//menu hamburger in navigation in header.
const hamburger = document.querySelector("header .hamburger");
const menu = document.querySelector("header .menu");

const hamburgerAnimation = () => {
  hamburger.classList.toggle("active");
  menu.classList.toggle("active");
};
hamburger.addEventListener("click", hamburgerAnimation);

// click on nav reference
const navLi = document.querySelectorAll("header nav #mainUl li");

const moveTo0 = () => {
  $("html, body").animate(
    {
      //jQuery code
      scrollTop: 0
    },
    800
  );
};

const moveTo1 = () => {
  $("html, body").animate(
    {
      scrollTop: $(".about").offset().top
    },
    800
  );
};

const moveTo2 = () => {
  $("html, body").animate(
    {
      scrollTop: $(".reviews").offset().top - $("#mainUl").height()
    },
    800
  );
};

const moveTo3 = () => {
  $("html, body").animate(
    {
      scrollTop: $(".actors").offset().top + 100
    },
    800
  );
};

const moveTo4 = () => {
  $("html, body").animate(
    {
      scrollTop: $(".gallery").offset().top - $("#mainUl").height()
    },
    800
  );
};

navLi[0].addEventListener("click", moveTo0);
navLi[1].addEventListener("click", moveTo1);
navLi[2].addEventListener("click", moveTo2);
navLi[3].addEventListener("click", moveTo3);
navLi[4].addEventListener("click", moveTo4);

//HEADER MUTE ON/OFF BUTTON
const muteOff = document.querySelector(".img-container .fa-volume-mute");
const muteOn = document.querySelector(".img-container .fa-volume-up");
const video = document.querySelector(".img-container video");

const mute = () => {
  if (muteOff.classList.contains("active")) {
    muteOff.classList.remove("active");
    muteOn.classList.add("active");
    video.muted = false;
  } else if (muteOn.classList.contains("active")) {
    muteOff.classList.add("active");
    muteOn.classList.remove("active");
    video.muted = true;
  }
};
muteOff.addEventListener("click", mute);
muteOn.addEventListener("click", mute);

// popup after click on "Add Movie"
// document.querySelector('wrapper')

/*
document.querySelector("header .menu ul li.addMovie").addEventListener("click", () => {
    document.querySelector(".modal-wrap").classList.add("active");
    document.querySelector(".wrapper").classList.add("blur");
    menu.classList.remove("active");
    hamburger.classList.remove("active");
  });
document
  .querySelector(".modal-wrap span.hide")
  .addEventListener("click", () => {
    document.querySelector(".modal-wrap").classList.remove("active");
    document.querySelector(".wrapper").classList.remove("blur");
  });*/

//reviews click arrow
const boxReviews = document.querySelectorAll(".reviews div.review");
const arrowBtns = document.querySelectorAll(".reviews div.arrow");

const toggleActive = function() {
  this.parentNode.classList.toggle("active");
  this.classList.toggle("active");

  if (this.parentNode.classList.contains("active")) {
    $("html, body").animate(
      {
        //jQuery code
        scrollTop: $(this.parentNode).offset().top - 1.5 * $("#mainUl").height() //
      },
      300
    );
  }
};

arrowBtns.forEach(elem => elem.addEventListener("click", toggleActive));

//reviews visible when scrolling
//boxReviews - downloaded.
$(document).on("scroll", function() {
  const windowHeight = $(window).height();
  const scrollValue = $(this).scrollTop();

  const $review1 = $(".reviews div.review:nth-of-type(1)");
  const $review2 = $(".reviews div.review:nth-of-type(2)");
  const $review3 = $(".reviews div.review:nth-of-type(3)");

  const review1FromTop = $review1.offset().top;
  const review2FromTop = $review2.offset().top;
  const review3FromTop = $review3.offset().top;

  const review1Height = $review1.outerHeight();
  const review2Height = $review2.outerHeight();
  const review3Height = $review3.outerHeight();

  if (scrollValue > review1FromTop + review1Height - windowHeight) {
    $review1.addClass("visible");
  }
  if (scrollValue > review2FromTop + review2Height - windowHeight) {
    $review2.addClass("visible");
  }
  if (scrollValue > review3FromTop + review3Height - windowHeight) {
    $review3.addClass("visible");
  }

  //cleaner
  const $about = $(".about");
  const NoVisibleHeight = $about.offset().top;

  if (scrollValue < NoVisibleHeight) {
    $(".reviews div.review").removeClass("visible");
  }
});

//actors SLIDER
const actorsDiv = document.querySelectorAll(
  ".actors .photo-container[data-actor-number]"
);
const actorsLeft = document.querySelector(
  ".actors .photo-container i.fa-angle-left"
);
const actorsRight = document.querySelector(
  ".actors .photo-container i.fa-angle-right"
);

const whichIsMain = () => {
  const mainActor = document.querySelector(".actors .main-actor");
  return mainActor.getAttribute("data-actor-number");
};

const mainActorSpan = newMainActorIndex => {
  const actorsSpan = document.querySelectorAll(
    ".actors span[data-actor-number]"
  );

  actorsSpan.forEach(elem => (elem.style.display = "none"));
  actorsSpan[newMainActorIndex].style.display = "inline-block";

  console.log(newMainActorIndex);
};

const moveLeft = () => {
  const mainActorIndex = whichIsMain();

  let newMainActorIndex = mainActorIndex;
  if (mainActorIndex == 0) newMainActorIndex++;
  if (mainActorIndex == 1) newMainActorIndex++;
  if (mainActorIndex == 2) newMainActorIndex = 0;

  mainActorSpan(newMainActorIndex);
  actorsDiv.forEach(elem => elem.classList.remove("main-actor"));
  actorsDiv[newMainActorIndex].classList.add("main-actor");

  actorsDiv[newMainActorIndex].style.left = "0";
  actorsDiv[newMainActorIndex].style.height = "20vw";
  actorsDiv[newMainActorIndex].style.width = "20vw";
  actorsDiv[newMainActorIndex].style.boxShadow = "0 0 16px 4px #141414";

  let newOnTheRight = newMainActorIndex;
  if (newMainActorIndex == 0) newOnTheRight++;
  if (newMainActorIndex == 1) newOnTheRight++;
  if (newMainActorIndex == 2) newOnTheRight = 0;

  actorsDiv[newOnTheRight].style.left = "calc(var(--diamondSize)/1)";
  actorsDiv[newOnTheRight].style.height = "0px";
  actorsDiv[newOnTheRight].style.width = "0px";
  actorsDiv[newOnTheRight].style.boxShadow = "none";

  let newOnTheLeft = newMainActorIndex;
  if (newMainActorIndex == 0) newOnTheLeft = 2;
  if (newMainActorIndex == 1) newOnTheLeft--;
  if (newMainActorIndex == 2) newOnTheLeft--;

  actorsDiv[newOnTheLeft].style.left = "calc(var(--diamondSize)/-1)";
  actorsDiv[newOnTheLeft].style.height = "0px";
  actorsDiv[newOnTheLeft].style.width = "0px";
  actorsDiv[newOnTheLeft].style.boxShadow = "none";
};
const moveRight = () => {
  const mainActorIndex = whichIsMain();

  let newMainActorIndex = mainActorIndex;
  if (mainActorIndex == 0) newMainActorIndex = 2;
  if (mainActorIndex == 1) newMainActorIndex--;
  if (mainActorIndex == 2) newMainActorIndex--;

  mainActorSpan(newMainActorIndex);
  actorsDiv.forEach(elem => elem.classList.remove("main-actor"));
  actorsDiv[newMainActorIndex].classList.add("main-actor");

  actorsDiv[newMainActorIndex].style.left = "0";
  actorsDiv[newMainActorIndex].style.height = "20vw";
  actorsDiv[newMainActorIndex].style.width = "20vw";
  actorsDiv[newMainActorIndex].style.boxShadow = "0 0 16px 4px #141414";

  let newOnTheRight = newMainActorIndex;
  if (newMainActorIndex == 0) newOnTheRight++;
  if (newMainActorIndex == 1) newOnTheRight++;
  if (newMainActorIndex == 2) newOnTheRight = 0;

  actorsDiv[newOnTheRight].style.left = "calc(var(--diamondSize)/1)";
  actorsDiv[newOnTheRight].style.height = "0px";
  actorsDiv[newOnTheRight].style.width = "0px";
  actorsDiv[newOnTheRight].style.boxShadow = "none";

  let newOnTheLeft = newMainActorIndex;
  if (newMainActorIndex == 0) newOnTheLeft = 2;
  if (newMainActorIndex == 1) newOnTheLeft--;
  if (newMainActorIndex == 2) newOnTheLeft--;

  actorsDiv[newOnTheLeft].style.left = "calc(var(--diamondSize)/-1)";
  actorsDiv[newOnTheLeft].style.height = "0px";
  actorsDiv[newOnTheLeft].style.width = "0px";
  actorsDiv[newOnTheLeft].style.boxShadow = "none";
};

actorsLeft.addEventListener("click", moveLeft);
actorsRight.addEventListener("click", moveRight);

// edit lightbox:
lightbox.option({
  albumLabel: "Zdjęcie %1 z %2"
});
