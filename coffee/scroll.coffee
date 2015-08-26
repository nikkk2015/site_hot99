$(document).ready ->
  flag = on
  $(window).scroll ->
    console.log $(this).scrollTop()
    true
  true



  $(document).mousewheel (e) ->
  #  consolee
    if e.pageY > window.innerHeight and flag
      flag = off
      $('.horMenu').animate(
        'opacity': 1
      , 100)
    if e.pageY < window.innerHeight and not flag
      flag = on
      $('.horMenu').animate(
        'opacity': 0
      , 100)


