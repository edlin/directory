fs = require 'fs'
M = require 'mustache'
config = require __dirname+'/../config/config'
log = fs.createWriteStream config.output_dir+'/directory.latex',
  flags: 'w'

Writer = (page, opts) ->
  opts.page += 1
  # find the page
  page = __dirname+"/../templates/#{page}.mu"
  tmpl = fs.readFileSync(page).toString()
  log.write M.render tmpl, opts


module.exports = Writer
