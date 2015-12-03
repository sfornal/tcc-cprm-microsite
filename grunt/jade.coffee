module.exports =
    dist:
        options:
            pretty: true
            data:
                env: 'production'
        files: [{
            expand: true
            cwd: 'src/'
            src: ['**/*.jade', '!**/_*.jade']
            dest: 'dist/'
            ext: '.html'
        }]
    dev:
        options:
            pretty: true
            data:
                env: 'development'
        files: [{
            expand: true
            cwd: 'src/'
            src: ['**/*.jade', '!**/_*.jade']
            dest: 'tmp/'
            ext: '.html'
        }]
