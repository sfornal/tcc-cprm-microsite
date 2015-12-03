module.exports =
    default:
        bsFiles:
            src: [
                './tmp/**/*.css'
                './tmp/**/*.js'
                './tmp/**/*.html'
                './tmp/**/*.{jpg,jpeg,png,gif,svg,mp4}'
            ]
        options:
            watchTask: true
            server: './tmp'
