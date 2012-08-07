class @ThreeAPI

  ##############################################
  #######     Geometry & Base Meshes     #######
  ##############################################

  geometry: (opts = {}) ->
    new THREE.Geometry

  mesh: (opts = {}) ->
    geom or= @geom()
    material or= @material()
    mesh = new THREE.Mesh geom, mat
  
  sphere: (opts = {}) ->
    mesh = new @mesh()
  
  material: (opts = {}) ->
    new THREE.MeshBasicMaterial

  ##############################################
  #########     Lights & Cameras         #######
  ##############################################

  Light: ( opts = {} ) ->
    opts.type or= "point"
    opts.color or= 0xff0000
    opts.intensity or= .5
    opts.distance or= 100


    lights =
      ambient: THREE.AmbientLight
      directional: THREE.DirectionalLight
      point: THREE.PointLight
      spot: THREE.SpotLight
    
    light = new lights.point opts.color, opts.intensity, opts.distance

    switch opts.type
      when "ambient" then light = new lights[opts.type] opts.color
      when "point" then light = new lights[opts.type] opts.color, opts.intensity, opts.distance
      when "spot" then light = new lights[opts.type] opts.color
      when "directional" then light = new lights[opts.type] opts.color, opts.intensity

    if opts.position
      light.position.set opts.position[0],opts.position[1],opts.position[2]
    
    if opts.scene
      opts.scene.add light

    return light


  Camera: (opts = {}) ->
    opts.type or= "perspective"
    opts.field_of_view or= 45
    opts.aspect_ratio or= window.innerWidth / window.innerHeight
    opts.min or= 0
    opts.max or= 10000

    if opts.type == "orthographic"
      opts.left or= window.innerWidth / -2
      opts.right or= window.innerWidth / 2
      opts.top or= window.innerHeight / -2
      opts.bottom or= window.innerHeight / 2

    cameras = 
      perspective: THREE.PerspectiveCamera
      ortographic: THREE.OrthographicCamera

    switch opts.type
      when "perspective" then camera = new cameras[opts.type] opts.field_of_view, 
        opts.aspect_ratio, opts.min, opts.max
      when "orthographic" then camera = new cameras[opts.type] opts.left, 
        opts.right, opts.top, opts.bottom, opts.min, opts.max   

    if camera
      if opts.position
        camera.position.set opts.position[0], 
                            opts.position[1], 
                            opts.position[2]

      opts.scene.add camera if opts.scene
      camera.lookat opts.scene.position if opts.scene

    return camera

      
  ##############################################
  #########     Scene & Renderers        #######
  ##############################################

  Scene: (opts = {}) ->
    new THREE.Scene()

  WebGLRenderer: (opts = {}) ->
    opts.antialias or= true
    opts.width or= window.innerWidth
    opts.height or= window.innerHeight
    renderer = new THREE.WebGLRenderer antialias: opts.antialias
    renderer.setSize opts.width, opts.height
    return renderer

  ##############################################
  #############      Helpers        ############
  ##############################################

  Helpers:

    BindResize: (renderer, camera) ->      
      THREEx.WindowResize renderer, camera
