module.exports =
    allFiles: [
        'src/scss'
    ]
    options:
        bundleExec: false
        config: '.scss-lint.yml'
        reporterOutput: 'test-results/scss-lint-report.xml'
        colorizeOutput: true
        compact: true
