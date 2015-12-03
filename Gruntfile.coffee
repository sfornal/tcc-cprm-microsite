module.exports = (grunt) ->

    path = require 'path'

    lgc = require 'load-grunt-config'
    lgc grunt,
        configPath: path.join process.cwd(), 'grunt'
        init: true
        # jitGrunt: true
