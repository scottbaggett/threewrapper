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
      @api = new ThreeAPI()
  
  window.app = new App()
  