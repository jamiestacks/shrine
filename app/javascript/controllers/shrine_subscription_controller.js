import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="shrine-subscription"
export default class extends Controller {
  static values = { shrineId: Number }
  static targets = ["messages"]

  connect() {

    this.channel = createConsumer().subscriptions.create(
      { channel: "ShrineChannel", id: this.shrineIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    this.channel.unsubscribe()
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

}
