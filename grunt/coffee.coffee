module.exports =
    dist:
        options:
            sourceMap: false
        files: [{
            expand: true
            cwd: 'src/coffee'
            src: '**/*.coffee'
            dest: 'dist/js'
            ext: '.js'
        }]
    dev:
        options:
            sourceMap: true
        files: [{
            expand: true
            cwd: 'src/coffee'
            src: '**/*.coffee'
            dest: 'tmp/js'
            ext: '.js'
        }]
