module.exports =
    dist:
        files: [{
            expand: true
            flatten: true
            cwd: 'src/vendor'
            src: [
                'jquery/dist/jquery.min.{js,map}'
                'picturefill/dist/picturefill.min.js'
                'velocity/velocity.min.js'
                'velocity/velocity.ui.min.js'
            ]
            dest: 'dist/vendor'
        }]
    dev:
        files: [{
            expand: true
            flatten: true
            cwd: 'src/vendor'
            src: [
                'jquery/dist/jquery.min.{js,map}'
                'picturefill/dist/picturefill.min.js'
                'velocity/velocity.min.js'
                'velocity/velocity.ui.min.js'
            ]
            dest: 'tmp/vendor'
        }]
