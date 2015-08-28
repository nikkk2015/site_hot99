class ExtendedSlider
  constructor: (@config) ->
    @slider = $('.bxslider').bxSlider
      mode: 'fade'
      pager: off
      controls: off
    @curindex = 0
    do @addImgs
    do @addText
    do @_bindEvents

  addText: ->
    $('#name_review').hide().html(@config[@curindex].main).fadeIn()

    $('#text-review').hide().html(@config[@curindex].main).fadeIn()

    $('#myModalLabel').hide().html(@config[@curindex].main).fadeIn()

    $('#name-project').hide().html(@config[@curindex].name).fadeIn()

    $('#description').hide().html(@config[@curindex].text).fadeIn()

  addImgs: ->
    $('.fotoPrall').html("").hide()
    for i, index in @config[@curindex].sub_img
      $('.fotoPrall').append(
        "<a class='galsl' href='#{@config[@curindex].full_img[index]}'>
          <div class='photo_pr' style='background:url(#{i}) no-repeat;background-size:contain'></div>"
        ).fadeIn(800)

  _bindEvents: ->
    $('.arrow_small_left').click =>
      do @slider.goToPrevSlide
      if @curindex is 0 then @curindex = @config.length - 1
      else @curindex--
      do @addImgs
      do @addText
      false
    $('.arrow_small_right').click =>
      do @slider.goToNextSlide
      console.log @config.length
      if @curindex + 1 is @config.length then @curindex = 0
      else @curindex++
      do @addImgs
      do @addText
      false
    $('.read-more').click =>
     $('[href = my]').attr("href", @config[@curindex].ink)


slider = new ExtendedSlider(
  [
    {
      main: "Проект 1"
      name: "Баня в Талдоме"
      text: "Объект сдан в 2014 году. Печь Kastor  с дополнительно"
      sub_img: [
        "images/photo2.png"
        "images/photo2.png"
        "images/photo2.png"
      ]
      full_img: [
        "proj/bani/img10.jpg"
        "proj/bani/img10.jpg"
        "proj/bani/img10.jpg"
      ]
      ink: "read-projects1.html"
    },
    {
      main: "Проект 2"
      text: "text2"
      sub_img: [
        "images/photo3.png"
        "images/photo3.png"
        "images/photo3.png"
      ]
      full_img: [
        "proj/chimney/img04.jpg"
        "proj/chimney/img04.jpg"
        "proj/chimney/img04.jpg"
      ]
      ink: "read-projects2.html"
    },
    {
      main: "Проект 3"
      text: "text3"
      sub_img: [
        "images/photo4.png"
        "images/photo4.png"
        "images/photo4.png"
      ]
      full_img: [
        "proj/fireplace/img11.jpg"
        "proj/fireplace/img11.jpg"
        "proj/fireplace/img11.jpg"
      ]
    }
  ])


