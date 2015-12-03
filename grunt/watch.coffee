module.exports =
    configFiles:
        files: [
            'Gruntfile.coffee'
            'grunt/*.coffee'
        ]
        options:
            reload: true

    scss:
        files: [
            'src/**/*.{scss, sass}'
        ]
        tasks: [
            'sass:dev'
            'autoprefixer:dev'
        ]

    coffee:
        files: [
            'src/coffee/*.coffee'
        ]
        tasks: [
            'newer:coffee:dev'
        ]

    jade:
        files: [
            'src/**/*.jade'
        ]
        tasks: [
            'jade:dev'
        ]

    images:
        files: [
            'src/img/*.{jpg,jpeg,png,gif,svg,svgz}'
        ]
        tasks: [
            'newer:imagemin:dev'
        ]
    vendor:
        files: [
            'src/vendor/**/*'
        ]
        tasks: [
            'newer:copy:dev'
        ]
