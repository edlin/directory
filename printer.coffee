fs = require 'fs'
async = require 'async'
W = require __dirname+'/lib/writer'
helpers = require __dirname+'/lib/helpers'
fixed = require __dirname+'/config/fixed'

exports.print = (opts, callback) ->
  # print necessary meta latex data
  async.series [
    (cb) ->
      W 'header', opts 

      opts.page = 0
      opts.title = fixed.name
      opts.subtitle = fixed.sub_name
      opts.verse = fixed.verse_ref
      opts.type = fixed.type
      # print cover
      W 'cover', opts

      W 'blank', opts

      query = {}
      query.married = "FALSE"
      opts.mem_col.find(query).sort({first_name: 1, last_name: 1}).toArray (err, docs) ->
        opts.members = helpers.addIndex docs
        query.married = "TRUE"
        fam_members = {}
        opts.mem_col.find(query).toArray (err, docs) ->
          for doc in docs
            fam_members[doc._id] = doc
          opts.fam_members = fam_members
          cb()

    (cb) ->
      opts.fam_col.find().toArray (err, docs) ->
        opts.fam_rel = docs
        opts.families = helpers.addIndex helpers.buildFamilyData opts.fam_members, opts.fam_rel
        cb()

    (cb) ->
      # print member names
      opts.page += 1 # for the extra page
      opts.mem_name = ->
        if this.index % 2 is 0
          return this.first_name+' '+this.last_name
        else
          return ' & '+this.first_name+' '+this.last_name+' \\\\'
      opts.fam_name = ->
        if this.index % 2 is 0
          return this.name+' {\\smallskip\\smallskip\\smallskip}'
        else
          return ' & '+this.name+' {\\smallskip\\smallskip\\smallskip} \\\\'
      W 'member_names', opts

      # print logo
      opts.title = ''
      W 'divider', opts

      # print family cover page
      opts.title = 'Families'
      W 'divider', opts

      # print family member pages
      actual_pages = these_pages = Math.ceil(opts.families.length / 2)
      opts.page += these_pages - 1
      opts.img = ->
        this.name.toLowerCase().replace(/\ /g, '_')
      opts.clean_address = ->
        helpers.sanitize(this.address)
      opts.parity = ->
        # returns one if even
        if this.index % 2 then null else 1
      opts.curr_page = ->
        Math.floor(this.index/2)+1
      opts.formatted_contact = ->
        str = ""
        for n in [0..1]
          str += """
            \\vspace{0.1in}
            """
          str += helpers.sanitize(this.emails[n])+' \\\\ '
          str += this.phones[n]+' \\\\ '
        return str
      opts.formatted_birthdays = -> 
        'Birthdays: '+helpers.printDate(this.birthdays[0])+' and '+helpers.printDate(this.birthdays[1])
      opts.close = ->
        opts.families.length % 2 is 1
      W 'family_member', opts

      if opts.page % 2 is 0
        # print logo
        opts.title = ''
        W 'divider', opts

      # print members cover page
      opts.title = 'Members'
      W 'divider', opts

      # print member pages
      these_pages = Math.ceil(opts.members.length / 4)
      opts.page += these_pages - 1
      opts.name = ->
        this.first_name+' '+this.last_name 
      opts.parity = ->
        # returns one if not a multiple of 4
        if this.index % 4 then 1 else null
      opts.fourth = ->
        if this.index % 4 is 3 then true else false
      opts.curr_page = ->
        actual_pages + Math.floor(this.index/4) + 1
      opts.img = ->
        name = this.first_name+' '+this.last_name
        name.toLowerCase().replace(/\ /g, '_')
      opts.clean_address = ->
        helpers.sanitize(this.address)
      opts.formatted_birthday = ->
        helpers.printDate(this.birthday)
      opts.close = ->
        opts.members.length % 4 isnt 0
      W 'members', opts

      if opts.page % 2 is 0
        # print logo
        opts.title = ''
        W 'divider', opts

      # print notes cover page
      opts.title = 'Notes'
      W 'divider', opts

      # print notes pages
      W 'notes', opts
      
      # need to make the backpage proper
      needed_pages = 0
      switch opts.page % 4
        when 0 then needed_pages = 1
        when 1 then needed_pages = 0
        when 2 then needed_pages = -1
        when 3 then needed_pages = 2
      if needed_pages > 0
        for x in [1..needed_pages] 
          # print notes pages
          W 'notes', opts

      # print logo
      opts.title = ''
      W 'divider', opts

      W 'blank', opts

      # print back page
      opts.full_verse = fixed.full_verse
      opts.verse = fixed.verse_ref
      W 'back_page', opts 
      console.log "This directory has #{opts.page} page(s)"
      cb()
  ],
  (err, results) ->
    # print necessary meta latex data
    console.log 'done printing'
    W 'footer', opts 
    callback()
