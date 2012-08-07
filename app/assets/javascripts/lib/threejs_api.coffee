class @ThreeAPI
  #   # #### LIGHTS & CAMERA
  #   # @camera = new THREE.PerspectiveCamera 55, window.innerWidth / window.innerHeight, 1, 10000
  #   # @camera.position.z = 600
  #   # @scene.add @camera
    

  #   # @light = new THREE.PointLight 0xffffff
  #   # @light.position.x = 10
  #   # @light.position.y = 150
  #   # @light.position.z = 20
  #   # @text_mat = new THREE.MeshBasicMaterial
  #   #     color: 0x
  #   # @text_mesh = new THREE.Mesh @text_geom, @text_mat

  #   # @scene.add @light
  #   # # @scene.add new THR

  ######################################
  ######         Meshes           ######
  ######################################

  geom: (opts) =>

  mesh: (opts) =>
    geom = opts.geom || @geom()
    material = opts.material || @material()
    mesh = new THREE.Mesh geom, mat
  sphere:   (opts) =>
    mesh = new @mesh()
  
  material: (opts) =>
    new THREE.MeshBasicMaterial

  ######################################
  ######     Lights & Cameras     ######
  ######################################

  camera:   (opts) =>
    opts = opts || {}
    #defaults
    opts.type                 = opts.type                    || "perspective"
    opts.field_of_view        = opts.field_of_view           || 45
    opts.aspect_ratio         = opts.aspect_ratio            || window.innerWidth / window.innerHeight
    opts.min                  = opts.near                    || 0
    opts.max                  = opts.far                     || 10000

    # defaults for ortho cameras
    if opts.type == "orthographic"
      opts.left = opts.left || window.innerWidth / -2
      opts.right = opts.right || window.innerWidth / 2
      opts.top = opts.top || window.innerHeight / -2
      opts.bottom = opts.bottom || window.innerHeight / 2

    # types
    cameras = 
      perspective: THREE.PerspectiveCamera
      ortographic: THREE.OrthographicCamera

    switch opts.type
      when "perspective" then new cameras[opts.type] opts.field_of_view, opts.aspect_ratio, opts.min, opts.max
      when "orthographic" then new cameras[opts.type] opts.left, opts.right, opts.top, opts.bottom, opts.min, opts.max

  light: ( opts ) =>
    
    opts.type          = opts.type         || "point"
    opts.color         = opts.color        || 0xff0000
    opts.intensity     = opts.intensity    || .5
    opts.distance      = opts.distance     || 100

    lights =
      ambient: THREE.AmbientLight
      directional: THREE.DirectionalLight
      point: THREE.PointLight
      spot: THREE.SpotLight
    
    switch opts.type
      when "ambient" then new lights[opts.type] opts.color && log color
      when "point" then new lights[opts.type] opts.color, opts.intensity, distance
      when "spot" then new lights[opts.type] opts.color
      when "directional" then new lights[opts.type] opts.color, opts.intensity

    