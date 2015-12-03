module.exports =
    dist:
        options:
            browsers: [
                'last 4 versions'
                'ie 8'
                'ie 9'
                'android 2.3'
            ]
            map: false
            cascade: true
        files: [{
            expand: true
            cwd: 'dist/'
            src: '**/*.css'
            dest: 'dist/'
        }]
    dev:
        options:
            browsers: [
                'last 4 versions'
                'ie 8'
                'ie 9'
                'android 2.3'
            ]
            map: true
            cascade: true
        files: [{
            expand: true
            cwd: 'tmp/'
            src: '**/*.css'
            dest: 'tmp/'
        }]
