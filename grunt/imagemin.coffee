mozjpeg = require 'imagemin-mozjpeg'

module.exports =
    dist:
        options:
            optimizationLevel: 7
            use: [mozjpeg()]
        files: [{
            expand: true
            cwd: 'src/img'
            src: '**/*.{jpg,jpeg,gif,png,svg,svgz}'
            dest: 'dist/img'
        }]
    dev:
        options:
            optimizationLevel: 7
            use: [mozjpeg()]
        files: [{
            expand: true
            cwd: 'src/img'
            src: '**/*.{jpg,jpeg,gif,png,svg,svgz}'
            dest: 'tmp/img'
        }]
