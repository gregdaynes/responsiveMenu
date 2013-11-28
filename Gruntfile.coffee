module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json'),
    banner: '/*!\n' +
             ' * <%= pkg.name %> v<%= pkg.version %> by <%= pkg.author %>\n' +
             ' * Copyright <%= grunt.template.today("yyyy") %> <%= pkg.copyright %>\n' +
             ' * Licensed under <%= pkg.license %>\n' +
             ' */'




    shell:
      build:
        command: 'rm -rf dev dist .tmp;'

    copy:

      # see copy_src task
      dev:
        expand: true
        cwd: 'src/'
        src: ['**/*.*', '!**/*.coffee', '!**/*.scss']
        dest: 'dev/'
      dist:
        expand: true
        cwd: 'src/'
        src: ['**/*.*', '!**/*.coffee', '!**/*.scss']
        dest: 'dist/'

      # copy css to dev folder
      css:
        expand: true
        cwd: '.tmp/css/'
        src: ['**/*.css', '**/*.map']
        dest: 'dev/css/'

      # copy js to dev folder
      js:
        expand: true
        cwd: '.tmp/js/'
        src: ['**/*.js', '**/*.map']
        dest: 'dev/js/'

    # Process sass files that are not prefixed with an underscore or in a folder
    # ex: style.scss, not _variables.scss, not modules/slider.scss
    sass:
      options:
        precision: 5
        sourcemap: true
      build:
        files: [{
          expand: true,
          cwd: 'src/css/',
          dest: '.tmp/css/',
          src: ['*.scss', '!_*.scss']
          ext: '.css'
        }]

    autoprefixer:
      options:
        browsers: ['last 2 version', 'ie 9', '> 1%']
      build:
        expand: true
        flatten: true
        cwd: '.tmp/css/'
        src: '**/*.css'
        dest: '.tmp/css/'

    csslint:
      build:
        expand: true
        cwd: '.tmp/css'
        src: '**/*.css'

    cssmin:
      build:
        options:
#           report: 'gzip'
          keepSpecialComments: 1
        files: [{
          expand: true
          cwd: '.tmp/css/'
          src: '**/*.css'
          dest: 'dist/css/'
          ext: '.css'
        }]

    usebanner:
      css:
        options:
          position: 'top'
          banner: '<%= banner %>'
        files:
          src: 'dist/css/**/*.css'
      js:
        options:
          position: 'top'
          banner: '<%= banner %>'
        files:
          src: 'dist/js/**/*.js'

    coffee:
      options:
        sourceMap: true
        bare: true
      build:
        expand: true
        cwd: 'src/js'
        src: '**/*.coffee'
        dest: '.tmp/js/'
        ext: '.js'

    uglify:
      options:
        preserveComments: 'some'
#         report: 'gzip'
        compress:
          global_defs:
            "DEBUG": false
          dead_code: true
      build:
        expand: true
        # flatten: true
        cwd: '.tmp/js/'
        src: '*.js'
        dest: 'dist/js/'

    processhtml:
      dist:
        options:
          process: true
        files:
          'dist/index.html': 'dist/index.html'

    htmlmin:
      dist:
        options:
          removeComments: true
          collapseWhitespace: true
          collapseBooleanAttributes: true
          removeAttributeQuotes: true
          removeRedundantAttributes: true
          useShortDoctype: true
          removeEmptyAttributes: true
          removeOptionalTags: true
#           removeEmptyElements: true
        files:
          'dist/index.html': 'dist/index.html'

    # !Connect
    connect:
      build:
        options:
          port: 4000
          base: 'dev'
          livereload: true
      dist:
        options:
          port: 5000
          base: 'dist'
          livereload: true

    # !Watch
    watch:
      coffee:
        files: 'src/js/**/*.coffee'
        tasks: 'js'
      js:
        files: 'src/js/**/*.js'
        tasks: 'js'
      sass:
        files: 'src/css/**/*.scss'
        tasks: 'css'
      html:
        files: 'src/*.html'
        tasks: 'html'
      livereload:
        options:
          livereload: true
        files: ['dev/**/*','dist/**/*']

  # !Load Tasks
  require("load-grunt-tasks") grunt

  grunt.registerTask 'default', [
    'shell'
    'copy_src'
    'css'
    'js'
    'html'
    'connect'
    'watch'
  ]

  # Copy src/* folder to dev and dist
  # do not copy coffeescript or sass - these processed differently
  grunt.registerTask 'copy_src', [
    'copy:dev'
    'copy:dist'
  ]

  grunt.registerTask 'css', [
    'sass'
    'autoprefixer'
#     'csslint'
    'copy:css'
    'cssmin'
    'usebanner:css'
  ]

  grunt.registerTask 'js', [
    'coffee'
    'copy:js'
    'uglify'
  ]

  grunt.registerTask 'html', [
    'processhtml'
    'htmlmin'
  ]
