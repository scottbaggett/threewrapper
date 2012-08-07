# //= require jquery
# //= require jquery.center
# //= require jquery.easing
# //= require jquery_ujs
# //= require underscore
# //= require log
# //= require json2
# //= require backbone
# //= require Three.js
# //= require lib/threejs_api


$ ->

  class App extends Backbone.View
    initialize: =>
      @three = new ThreeAPI()

      # initialize the scene with some basic objects.
      @camera = @three.Camera()
      @scene = @three.Scene()
      @light = @three.Light 
        type: "point"
        scene:@scene
        position:[0,150,400]
        shadows: true

      @renderer = @three.WebGLRenderer()
  
  window.app = new App()
  