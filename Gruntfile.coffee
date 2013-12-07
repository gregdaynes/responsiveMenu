module.exports = (grunt) ->

  grunt.initConfig

    sass:
      options:
        precision: 5
        sourcemap: true
      build:
        files: [
          expand: true,
          cwd: 'css/',
          dest: 'css/',
          src: ['*.scss', '!_*.scss'],
          ext: '.css'
        ]

    autoprefixer:
      options:
        browsers: ['last 2 version', 'ie 9', '> 1%']
      build:
        expand: true
        flatten: true
        cwd: 'css/'
        src: '**/*.css'
        dest: 'css/'
        ext: '.css'

    coffee:
      options:
        sourceMap: true
        bare: true
      build:
        expand: true
        cwd: 'js/'
        src: '**/*.coffee'
        dest: 'js/'
        ext: '.js'

    # !Watch
    watch:
      css:
        files: 'css/**/*.scss'
        tasks: 'css'
      coffeescript:
        files: 'js/**/*.coffee'
        tasks: 'coffee'



  # !Load Tasks
  require("load-grunt-tasks") grunt

  grunt.registerTask 'default', [
    'sass'
    'autoprefixer'
    'coffee'
    'watch'
  ]

  grunt.registerTask 'css', [
    'sass'
    'autoprefixer'
  ]