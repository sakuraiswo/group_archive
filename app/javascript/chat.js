
// const buildHTML = (XHR) => {
  // const item = XHR.response.chat;
  // const html = `
  // <div class="message-box">
    // <div class="current-user-box">
      // <div>${ item.created_at }</div>
      // <div>${ item.message }</div>
    // </div>
    // <div class="user1-box">
    // </div>
    // <div class="user2-box">
    // </div>
  // </div>
    // `;
  // return html;
// };


function chat (){
  const messageContainer = document.getElementById('list');
  const archiveContainer = document.getElementById('archive-small');
  messageContainer.scrollTop = messageContainer.scrollHeight;
  archiveContainer.scrollTop = messageContainer.scrollHeight;
  // const form = document.getElementById("form");
  // form.addEventListener("submit", (e) => {
  //   e.preventDefault();
  //   const formData = new FormData(form);
  //   const XHR = new XMLHttpRequest();
  //   const roomID = form.getAttribute("data-room-id");
  //   XHR.open("POST", `/rooms/${roomID}/chats`, true);
  //   XHR.responseType = "json";
  //   XHR.send(formData);
  //   XHR.onload = () => {
  //     if (XHR.status != 200) {
  //       alert(`Error ${XHR.status}: ${XHR.statusText}`);
  //       console.log("Non")
  //       return null;
  //     };
  //     console.log("Succes")
  //     const list = document.getElementById("list");
  //     const formText = document.getElementById("message");
  //     list.insertAdjacentHTML("beforeend", buildHTML(XHR));
  //       formText.value = "";
      messageContainer.scrollTop = messageContainer.scrollHeight;
      archiveContainer.scrollTop = messageContainer.scrollHeight;
  //   };
  // });
 };


window.addEventListener('turbo:load', chat);