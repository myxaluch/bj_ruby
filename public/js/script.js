$(document).ready(function(){
  $("#hit").click(function(){
    $("#p").load("/play",function(responseTxt,statusTxt,xhr){
      if(statusTxt=="error")
        alert("Error: "+xhr.status+": "+xhr.statusText);
    });
  });
});
