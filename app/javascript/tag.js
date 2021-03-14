if (document.URL.match( /new/ )) {
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("item_tag_name");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("item_tag_name").value;
      console.log(keyword);
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("item_tag_name");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          tagName.forEach((tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(tag.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("tweets_tag_name").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    })
  });
};

