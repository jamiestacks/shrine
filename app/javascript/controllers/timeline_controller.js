import { Controller } from "@hotwired/stimulus"

export default class extends Controller {


  static targets = ["chapters"]


  connect() {
    console.log("connected")
    this.chaptersTargets[0].classList.add("noblur");
  }


  blur(e) {
    this.chaptersTargets.forEach((chapter, i) => {

      const cardRect = chapter.getBoundingClientRect();
      const cardCenter = cardRect.top + cardRect.height / 2

      if (cardCenter < 40 && cardCenter > -10) {
        this.chaptersTargets[i + 1].classList.add("noblur")
      }

    })
  }


}

//&& chapter != this.chaptersTargets[0]


// console.dir(document.scrollingElement.scrollTop)
// console.log((e.currentTarget.scrollY + e.currentTarget.innerHeight / 2) - document.scrollingElement.scrollTop)

// blur(event) {
//   let max, min;
//   const pos = window.scrollY;
//   const chaptersLength = this.chaptersTargets.length;

//   this.chaptersTargets.forEach((item, i) => {
//     min = item.offsetTop;
//     max = item.offsetHeight + item.offsetTop;

//     if (i === chaptersLength - 2 && pos > min + item.offsetHeight / 2) {
//       item.classList.add("blur");
//       item[item.length - 1].classList.remove("blur");
//     } else if (pos - 40 <= max && pos >= min) {
//       item.classList.remove("blur");
//     }

//   });

// }
