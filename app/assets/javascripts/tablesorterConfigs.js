$(function() {
  $(".gamesTable").tablesorter({
    theme: 'bootstrap table-striped',
    sortList: [[0,0]],
    headers: { 4: { sorter: false }}
  });
});