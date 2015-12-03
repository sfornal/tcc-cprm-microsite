module.exports =
    'default': [ 'dev' ]

    'dev':
        description: 'Compile src, launch BrowserSync server, and start
            watching src files for changes'
        tasks: [
            'coffeelint'
            'scsslint'
            'clean:dev'
            'copy:dev'
            'imagemin:dev'
            'sass:dev'
            'autoprefixer:dev'
            'coffee:dev'
            'jade:dev'
            'browserSync'
            'watch'
        ]

    'production':
        description: 'Lint everything, then compile to dist'
        tasks: [
            'coffeelint'
            'scsslint'
            'clean:dist'
            'copy:dist'
            'imagemin:dist'
            'sass:dist'
            'autoprefixer:dist'
            'cssmin'
            'coffee:dist'
            'jade:dist'
        ]
