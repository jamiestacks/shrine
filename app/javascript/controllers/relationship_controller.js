import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="relationship"
export default class extends Controller {

  static targets = ["selectFamily", "selectFriend", "familyInput", "friendshipInput", "form"]
  connect() {
    console.log("It works!")
    console.log(this.selectFamilyTarget)
  }

  showFriendship(){
    console.log(this.selectFriendTarget.checked)
    this.friendshipInputTarget.classList.remove("d-none")
    this.familyInputTarget.classList.add("d-none")
  }

  showFamily(){
    console.log(this.selectFamilyTarget.checked)
    this.familyInputTarget.classList.remove("d-none")
    this.friendshipInputTarget.classList.add("d-none")
  }

  handleSubmit(e){
    e.preventDefault()
    console.log(e)
    if (this.selectFriendTarget.checked) {
      this.familyInputTarget.remove()
    } else {
      this.friendshipInputTarget.remove()
    }
    this.formTarget.submit()
  }
}
