# Directory Generator

Dependencies:
 * nodejs
 * npm
 * mongodb
 * latex


## Getting Started
Make sure the requirements are satisfied and the database is hooked up, check out config/config.coffee

    npm install 
    coffee main.coffee

Generate the pdfs from latex files:

    pdflatex directory.latex 
    pdflatex booklet.tex

## Understanding the Code

Convention:
 * Pictures are located in the assets directory
    * Single member names are in \<first\_name\>\_\<last\_name\> lowercase format
    * Family member names are in \<last\_name1\>\_and\_\<first\_name2\>\_\<last\_name\> lowercase format
 * Blank dividers should be on the even pages
 * The entire directory must be a multiple of 4
 * For booklet.tex, the signature should be the number of pages in the directory.pdf

Pitfalls:
 * Make sure the names on member_names.coffee don't overflow the page
 * Check the word wrapping of long entries


Development Environment:
 * To setup a watcher, check out nodemon


Schema:
```
  member: {
    first_name: string
    last_name: string
    address: string
    city: string
    state: string
    zip: string
    email: string
    phone: string
    birthday: string
    married: string
  }

  family: {
    name: string
    comments: string
    members: [ Objids ... ]
  }
```
