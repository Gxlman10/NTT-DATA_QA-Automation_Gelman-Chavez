module.exports = {
  default: {
    paths: ['features/**/*.feature'],
    require: [
      'support/world.js',
      'support/hooks.js',
      'step-definitions/**/*.js'
    ],
    format: [
      'progress-bar',
      'html:reports/cucumber-report.html'
    ],
    publishQuiet: true
  }
}
