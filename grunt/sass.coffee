module.exports =
    dist:
        options:
            sourceMap: false
            outputStyle: 'expanded'
            trace: false
            lineNumbers: false
            debugInfo: false
        files: [{
            expand: true
            cwd: 'src/scss'
            src: '**/*.{scss,sass}'
            dest: 'dist/css'
            ext: '.css'
        }]
    dev:
        options:
            sourceMap: true
            outputStyle: 'expanded'
            trace: true
            lineNumbers: true
            debugInfo: true
        files: [{
            expand: true
            cwd: 'src/scss'
            src: '**/*.{scss,sass}'
            dest: 'tmp/css'
            ext: '.css'
        }]
