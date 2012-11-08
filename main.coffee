exec = require('child_process').exec
config = require __dirname+'/config/config'
mongo = require 'mongodb'

# initialize things
db = new mongo.Db config.db.name, new mongo.Server(config.db.host, config.db.port, {}), safe:false
db.open (p_db) ->
  db.authenticate config.db.user, config.db.pwd, (err, result) ->
  
    db.createCollection config.db.mem_col, (err, col) ->
      db.collection config.db.mem_col, (err, col) ->
        opts = {}
        opts.mem_col = col
        db.createCollection config.db.fam_col, (err, col) ->
          db.collection config.db.fam_col, (err, col) ->
            opts.fam_col = col
            # create pdf
            printer = require __dirname+'/printer'

            opts.assets = config.assets
            printer.print opts, ->
              # create booklet
              exec_str = "pdflatex -output-directory=#{config.output_dir} #{config.output_dir}/directory.latex"
              exec exec_str, (e, o, er) ->
                exec_str = "pdflatex -include-directory=#{__dirname}/output -output-directory=#{config.output_dir} #{__dirname}/booklet.tex"
                exec exec_str, (e, o, er) ->
                  console.log "directory located at output/directory.pdf and booklet at output/booklet.pdf"
                  process.exit()
