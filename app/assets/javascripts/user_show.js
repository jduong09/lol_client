document.addEventListener('turbo:load', () => {
  const headerNavItems = document.querySelectorAll('nav a');
  const chatWindow = document.querySelector('aside');
  const friendsListLink = document.querySelectorAll('ul.friends-list li a');
  const chatWindowList = document.querySelector('aside ul');
  const chatWindowHeader = document.querySelector('aside section h2');
  const formSubmitBtn = document.querySelector('form input.submit_btn');
  let addedToChatWindowList = false;
 
  window.chatWindowList = chatWindowList;
  headerNavItems.forEach(node => (
    node.onclick = () => {
      const activeLi = document.querySelector('a.header-nav-active');
      activeLi.classList.remove('header-nav-active');
      return event.currentTarget.classList.add('header-nav-active');
    }
  ));

  friendsListLink.forEach(node => {
    let chatWindowClasses = chatWindow.classList;
    node.onclick = () => {
      // minimize/maximize the chat window
      if (chatWindowClasses.contains('minimize')) {
        chatWindowClasses.remove('minimize');
        chatWindowClasses.add('maximize');
      } else {
        chatWindowClasses.remove('maximize');
        chatWindowClasses.add('minimize');
      }

      // check if username is in the chat window list
      for (let i = 0; i < chatWindowList.children.length; i++) {
        if (chatWindowList.children[i].innerHTML === node.innerHTML) {
          addedToChatWindowList = true;
          break;
        };
      };

      // add friend to chat window list.
      if (!addedToChatWindowList) {
        const newLi = document.createElement('li');
        newLi.textContent = node.textContent;
        newLi.classList.add('highlight');
        chatWindowList.append(newLi);
      }
      
      addedToChatWindowList = false;
      // change the header to the friend that the user is talking to 
      chatWindowHeader.innerHTML = node.innerHTML;
    };
  });

  chatWindowHeader.onclick = () => {
    if (chatWindow.classList.contains('minimize')) {
      chatWindow.classList.remove('minimize');
      return chatWindow.classList.add('maximize');
    } else {
      chatWindow.classList.remove('maximize');
      return chatWindow.classList.add('minimize');
    };
  };

  formSubmitBtn.onclick = () => {
    const receiverNameInput = document.getElementsByName("message[receiver_name]");
    receiverNameInput[0].value = chatWindowHeader.innerHTML.toLowerCase();
  };
  
});