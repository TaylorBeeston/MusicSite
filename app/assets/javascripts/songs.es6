// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can not use CoffeeScript in this file: http://coffeescript.org
$(document).on('turbolinks:load', function() {
  player = $("#main_player")[0];
  main = $("#main")[0];
  songInfo = $("#song-info")[0];
  songQueue = [];
  songsList = [];
  active = 0;

  for (let i of $(".list-group-item")) {
    songsList.push(i.id);
  }

  newActive = function(newID) {
    $(".active").removeClass("active");
    $('#' + newID).addClass("active");
    songInfo.innerHTML = $('#' + newID + ' h6')[0].innerHTML;
    active = newID;
    return newID
  }

  playNow = function(ID) {
    $('#' + ID)[0].click();
  }

  addToQueue = function(ID) {
    songQueue.push(ID);
  }

  nextSong = function() {
    if (songQueue.length > 0) {
      next = songQueue.shift();
      playNow(next);
    } else {
      next = songsList[String(songsList.indexOf(String(active)) + 1)]
      if (next) { playNow(next); }
    }
  }
  $("audio").on('ended', nextSong);
});
