// Header scroll effect
    const navbar = document.getElementById("navbar");
    window.addEventListener("scroll", () => {
      if (window.scrollY > 50) {
        navbar.classList.add("scrolled");
      } else {
        navbar.classList.remove("scrolled");
      }
    });

 // Envelope animation
 const lidOne = document.querySelector(".lid.one");
 const lidTwo = document.querySelector(".lid.two");
 const letter = document.querySelector(".letter");
 const message = document.querySelector(".letter p");

 const messages = [
   "Get 20% off on your first booking.",
   "Limited offer: 30% off this weekend!",
   "Refer a friend and earn rewards!",
   "Special deals for members only!",
 ];

 let index = 0;

 function openEnvelope() {
   lidOne.classList.add("open");
   lidTwo.classList.add("open");
 	letter.classList.add("open");
 }


 function cycleMessages() {
   setInterval(() => {
     index = (index + 1) % messages.length;
     message.style.opacity = 0;
     setTimeout(() => {
       message.textContent = messages[index];
       message.style.opacity = 1;
     }, 300);
   }, 5000);
 }

 window.onload = () => {
   setTimeout(() => {
     openEnvelope();
     cycleMessages();
   }, 2500);
 };
